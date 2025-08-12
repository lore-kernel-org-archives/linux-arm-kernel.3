Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1423BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 05:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9lJBmngQ9+HmAt1mZPYzC7vCcc7gbF7pu7Xw+KqQtU=; b=bI2DeobY3qrrEakMHSi7t5dUNV
	jH1n2oIr5IRBCtoKUOGEgFPgF1oeg7gwbyFU2mhdl8Z2ml2mKAz7KIcwYF/wl3BuDD2b42n5sxPKv
	M1kLvbyvOapeBfkN9M6fQd1gVCVBfb4PvdYYSAkiloM5jkvzY9krHyvuap7+Au+2fwQoNc1QFe/ik
	JJr2xnvgvI3EKHo13NzuudOY5vRZGq1l3+4tzPckPSpBhiMRGOqhSC6iGQmJMHzGyWQmkEzKJLQ6+
	PsXjVIcKuVTigpaoyw7wzzjQwN0J50aHtiTeFrC+jDr7zucGDI2E28+41aobUITpFeTo2ejYL8wlG
	Lw1vah2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uli1s-00000009yR1-0e1O;
	Tue, 12 Aug 2025 05:58:36 +0000
Received: from [195.187.100.5] (helo=ni.piap.pl)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhyH-00000009xwK-23GT;
	Tue, 12 Aug 2025 05:54:55 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 8C855C3E4DEA;
	Tue, 12 Aug 2025 07:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 8C855C3E4DEA
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Heiko Stuebner <heiko@sntech.de>,
  Paul Elder <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
In-Reply-To: <m3zfcet41n.fsf@t19.piap.pl> ("Krzysztof =?utf-8?Q?Ha=C5=82as?=
 =?utf-8?Q?a=22's?= message of
	"Tue, 05 Aug 2025 13:13:08 +0200")
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl>
	<175308758352.3134829.9472501038683860006@localhost>
	<m31pq9y98z.fsf@t19.piap.pl>
	<175326599663.2811177.16620980968274114885@localhost>
	<m3h5z2vw12.fsf@t19.piap.pl>
	<175344176070.2811177.10693943493658922992@localhost>
	<m3qzxyug1s.fsf@t19.piap.pl> <m3cy9futcj.fsf@t19.piap.pl>
	<m34iumujcs.fsf@t19.piap.pl> <m3zfcet41n.fsf@t19.piap.pl>
Date: Tue, 12 Aug 2025 07:54:46 +0200
Message-ID: <m3a545t789.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_225453_729424_771DE058 
X-CRM114-Status: GOOD (  11.72  )
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

Hi Stefan et al,

BTW I've added Lucas Stach and Shawn Guo to "Cc" list.

The problem is the CPU core power supply voltage :-)

- while the reference manual specifies the max ISP and MEDIA clocks at
  500 MHz, the datasheets show this requires the "overdrive" mode =3D
  increased CPU power supply voltage. In "normal" mode the ISPs are
  limited to 400 MHz (there are other limits, too).

- I've tried lowering the clock rate after booting the systems (with
  a CCM register write), but it didn't fix the problem. I guess some
  reset logic is affected here, and the (lower) clock rate must be set
  right from the start, in the DT.

- anyway, lowering the frequencies of ISP and MEDIA root clocks fixes
  the ISP2 MI corruption. I'm currently investigating PMIC settings
  (both my Compulab and SolidRun modules use PCA9450C PMICs), so perhaps
  I'll be able to use the higher 500 MHz clocks. It doesn't matter much,
  though.

- the question is if we should lower the clocks in the main imx8mp.dtsi
  DT file, or the overdrive mode should stay there, and the changes
  should be made to the individual board files, or maybe the U-Boot
  configs (PMIC output voltages) should be changed etc.
--=20
Krzysztof "Chris" HaBasa

Sie=C4=87 Badawcza Aukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

