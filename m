Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924E0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dbenD8GKtkjYZ738ASAU+dThcr6sBtkgM85GethDcM=; b=A643MZUmDQv8dx/bsyPxv4B5DR
	Xu9gaGP+o9F8tbkLj6yUmWOBjvUmevLQf+c4atf5Ft1clj41KyUFMCTc5oced40Kzq6OLRM4JvePE
	LFlxjDY+wMBw8ZAtpg8jSiVMxgtRl/61qGjU/HyyV1pGyfqTfnxLuksABLEnnW2IvNJ3uZSTFHMOE
	d0w9LKufsUL0dQX1a0RYmRGKSe8XABok6ADaGNkXoE34Rk5e2gRtu1JvgUX1yJyuwVBTz4jXI4IiE
	HdTDOBX8WEXuEnGfMsyGARu5TSG/h9HKlxKi/FHY6mFvRteom0I4TOA770++vcBYPvDAPSbDa/2t9
	HWbkS5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrlc-0000000BMtt-1TRT;
	Tue, 12 Aug 2025 16:22:28 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulo6y-0000000AgYW-1IgD;
	Tue, 12 Aug 2025 12:28:18 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 2EB4CC3E4DE9;
	Tue, 12 Aug 2025 14:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 2EB4CC3E4DE9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,  Dafna Hirschfeld
 <dafna@fastmail.com>,  Heiko Stuebner <heiko@sntech.de>,  Paul Elder
 <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
In-Reply-To: <20250812103243.GK30054@pendragon.ideasonboard.com> (Laurent
	Pinchart's message of "Tue, 12 Aug 2025 13:32:43 +0300")
References: <175308758352.3134829.9472501038683860006@localhost>
	<m31pq9y98z.fsf@t19.piap.pl>
	<175326599663.2811177.16620980968274114885@localhost>
	<m3h5z2vw12.fsf@t19.piap.pl>
	<175344176070.2811177.10693943493658922992@localhost>
	<m3qzxyug1s.fsf@t19.piap.pl> <m3cy9futcj.fsf@t19.piap.pl>
	<m34iumujcs.fsf@t19.piap.pl> <m3zfcet41n.fsf@t19.piap.pl>
	<m3a545t789.fsf@t19.piap.pl>
	<20250812103243.GK30054@pendragon.ideasonboard.com>
Date: Tue, 12 Aug 2025 14:28:07 +0200
Message-ID: <m3zfc4sp0o.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_052816_511475_997CA90C 
X-CRM114-Status: GOOD (  13.23  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Laurent,

>> - anyway, lowering the frequencies of ISP and MEDIA root clocks fixes
>>   the ISP2 MI corruption. I'm currently investigating PMIC settings
>>   (both my Compulab and SolidRun modules use PCA9450C PMICs), so perhaps
>>   I'll be able to use the higher 500 MHz clocks. It doesn't matter much,
>>   though.

Well, apparently my Compulab UCM module provides overdrive power. At
least the PMIC driver says so (in /sys pseudofiles). I guess SolidRun
won't be different.

1. At least two different designs are affected (Compulab and SolidRun),
2. the PCA9450C is THE i.MX8MP PMIC, most probably connected to the CPU
   exactly as in the datasheet (at least WRT VDD_SOC power lines),
3. NXP people experienced the problem on their (which ones?) boards, too

Well... They specify (IMX8MPIEC =3D the datasheet):

"Two instances of 4-lane MIPI CSI interface and HDR ISP
=E2=80=A2 For single Camera, MIPI CSI 1 can support up to 400/500 MHz pixel
  clock in the Nominal/Overdrive mode.
=E2=80=A2 For single Camera, MIPI CSI 2 can support up to 277 MHz pixel clo=
ck.
=E2=80=A2 For dual Camera, both MIPI CSI can support up to 266 MHz pixel cl=
ock.
=E2=80=A2 2x ISP supporting 375 Mpixel/s aggregate performance and up to
  3-exposure HDR processing.
    =E2=80=A2When one camera is used, support up to 12MP@30fps or 4kp45
    =E2=80=A2When two cameras are used, each supports up to 1080p80"

So, while ISP clock is not exactly pixel clock, perhaps they mean that
the ISP clock is to be limited as well.

ISP2 at 400 MHz (single camera) works for me (with a 1080p60 12-bit
IMX462 sensor), but I haven't tested in extreme conditions etc.

> I think it would make sense to lower the default clock frequencies, and
> provide an overlay to enable overdrive mode.
>
> It's also interesting that the issue only affected the second ISP, as
> the first one should also be limited to 400 MHz in normal mode.

Right. Maybe it's not the overdrive mode after all. I will do more tests
soon.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

