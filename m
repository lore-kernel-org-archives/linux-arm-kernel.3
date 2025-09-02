Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453F8CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNCNaMiPJDXvB/7iEX4grRokMrqO0VUFGnAoYlmBZNk=; b=xp1hP/HOMgfiMYdZsNCNc8VoAH
	NG39uH1lZObCh7aLvwCIpp/a9xmzAYxJmDJyZ/iBDq1Hlh/bPYSdI9Hv3SVnFZH1jbDK4cGA8uybA
	bbAdPrL/pBPBQxJzoB4oyj/xnIRevIBsLyyj4jrYLT8t3EzJVBYaQWM1Z0dLkOw7JHJmg1Hc7/3WD
	f4xAbHUGVdMO3JYSaJS7n5YE3vqYRnAGnOW5nBKfbqFh78E8yn9TIha78trGXpKhyDtJikiJoNEgp
	XsupFTJyuIrp+c5Vd+cG/y3oQMCVLN4OQRYStCuepN5suFhAhIy2inMQmpYQL+CJwGFlFYmZpS1Xx
	FuFMzbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ9r-0000000HI1E-0ARb;
	Tue, 02 Sep 2025 12:30:43 +0000
Received: from [195.187.100.5] (helo=ni.piap.pl)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNil-0000000GVYY-048k;
	Tue, 02 Sep 2025 09:54:40 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 16763C3EEACD;
	Tue,  2 Sep 2025 11:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 16763C3EEACD
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Adam Ford <aford173@gmail.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Dafna Hirschfeld
 <dafna@fastmail.com>,  Heiko Stuebner <heiko@sntech.de>,  Paul Elder
 <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
In-Reply-To: <CAHCN7xKq_o_u7PhPMcZ2W9nzrFP8+CnhaYJOyxnjpKfbMTBCEw@mail.gmail.com>
	(Adam Ford's message of "Tue, 12 Aug 2025 13:22:54 -0500")
References: <175308758352.3134829.9472501038683860006@localhost>
	<175326599663.2811177.16620980968274114885@localhost>
	<m3h5z2vw12.fsf@t19.piap.pl>
	<175344176070.2811177.10693943493658922992@localhost>
	<m3qzxyug1s.fsf@t19.piap.pl> <m3cy9futcj.fsf@t19.piap.pl>
	<m34iumujcs.fsf@t19.piap.pl> <m3zfcet41n.fsf@t19.piap.pl>
	<m3a545t789.fsf@t19.piap.pl>
	<20250812103243.GK30054@pendragon.ideasonboard.com>
	<175501095338.74722.11604545949710100799@localhost>
	<CAHCN7xKq_o_u7PhPMcZ2W9nzrFP8+CnhaYJOyxnjpKfbMTBCEw@mail.gmail.com>
Date: Tue, 02 Sep 2025 11:54:27 +0200
Message-ID: <m31popxjqk.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_025435_291490_900C423C 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

Hi,

summary:

I've done a few additional tests and it seems the MEDIA_AXI clock is the
problem. Reducing it to 400 MHz while still running MEDIA_ISP at 500 MHz
produces no errors.
MEDIA_ISP at 400 MHz and MEDIA_AXI at 500 MHz produces errors, though
(register address errors while reading and writing from/to ISP MI
(memory interface) registers, only on the secondary ISP (isp1), and
generally only while streaming data from the ISP).

What is driven by MEDIA_AXI clock root? MEDIAMIX: ISI, LCDIF, ISP, DWE.

According to both datasheets (industrial and commercial), MEDIA_AXI
is limited to 400 MHz in normal mode and 500 MHz in overdrive mode.
All my hardware is setup for overdrive mode, though (two manufacturers,
both using the same PMIC setup).

Since no hardware in the official Linux kernel tree (DT) uses the second
ISP... Should we just add a warning to the imx8mp.dtsi and be done with
it?
Out of tree hardware using isp1 (csi1) obviously exists.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

