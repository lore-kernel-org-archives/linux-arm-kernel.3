Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0F1C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 05:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78z1kuRSWutMg/Hy75bF++4O7lZJqDUQoV9YvjD+Wtw=; b=vO0wAj+d/nPhle12ySExDKJ/W9
	zMzlV5IaKPvzwk8pdfzL61gazJ5J4RwR7ygIpwr1rCg51qcGxHkbWCwY2twdhYDc/Ag+imsAx402k
	JZ5mOUlp4rEFOR/ymp4lhSvBYj9LgsmmcerVK8dvRCYvWEjvfCQdhbJIXp7NMv2Nglb7bOSwCicoS
	NVRFlRSOB1Sd4j2ZaEeEDvbUdLqCewsVOaSG5UEW8xkNZNTApMIhcxaz7I1AnWBJ1aNhoJBpl69Vu
	d10UG3mf8avhYIPEwOeSCnoC6n3fdb2aOje02290/knpYjReclG1yaSLq7KsEb0MzDId1SZ7lwe7j
	c2a/ed6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um3n5-0000000CdjQ-2Zri;
	Wed, 13 Aug 2025 05:12:47 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um3kX-0000000Cdcx-0ykL;
	Wed, 13 Aug 2025 05:10:11 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id C17F5C3E4DE7;
	Wed, 13 Aug 2025 07:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl C17F5C3E4DE7
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
Date: Wed, 13 Aug 2025 07:10:03 +0200
Message-ID: <m3v7mrst78.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_221009_437430_E317181C 
X-CRM114-Status: GOOD (  11.47  )
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

Hi Adam,

Adam Ford <aford173@gmail.com> writes:

> I was reading through the data sheet (not the reference manual), and
> it lists a few limitations for the clocks:
>
> For single Camera, MIPI CSI 1 can support up to 400/500 MHz pixel
> clock in the Nominal/Overdrive mode.
> For single Camera, MIPI CSI 2 can support up to 277 MHz pixel clock.
> For dual Camera, both MIPI CSI can support up to 266 MHz pixel clock.
>
> If you're running dual cameras, it sounds like you're capped at 266
> MHz regardless of whether or not you're in overdrive or nominal.

Right. But these are pixel clocks, not ISP clock. At least theoretically
entirely different stuff.
For example, I'm using (at most) two IMX290/462 1920x1080p60 sensors in
12-bit (Bayer) mode, resulting in:
- 148.5 MHz pixel clocks
- 1782 Mb/s total bandwidth (for each sensor - 12 bits)
- 445.5 Mb/s per lane (each sensor uses 4 MIPI lanes)
- 222.75 MHz MIPI clocks (MIPI uses DDR, the double data rate)

So I'm well within specs. Though I don't know if the people writing the
datasheets did really mean what they wrote, or maybe they meant ISP core
clocks as well. Why? Because ISP blocks (and all such logic blocks)
require a certain number of their core clocks for a signal rate (in this
case, a pixel rate). And maybe what they specified in the datasheets was
a calculation of this (unpublished?) required pixel/ISP clock ratio and
the max ISP clock rate (specified incorrectly at 400/500 MHz).
Anyway, this is only a possibility. Another one is that ISP2 simply
cannot reliably run at 500 MHz, for some "analog" reason, design bug
etc.

> My understanding is that the imx8mp.dtsi is pre-configured for
> overdrive mode, so if you need to run the ISP in nominal, the clock
> updates should go into imx8mp-nominial.dtsi.

It seems my modules are setup for overdrive mode.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

