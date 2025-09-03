Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D42ACA1005
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMUBpOspAwuRbk3s8zYi5ml7mvtL6cW/MHTRA4NY7ro=; b=tmYA5GQ+HRGZmBtwTIWTBxllKy
	3Uibq8r67XoC7Dt6Su1Y4FhZy/+WMRgpZzdvWko7c2bG8BdtqrWsKTRgwYntGCUFpZothFI5JNesa
	dyL8V+SyOFH3mWTbFcmS284n2tQrKVrfNri01O33braNQtDrL1jLsldqpPCZW3EKtzUy6lLDnHJ1o
	CsesG9JR5QqVew9ih0CXneVemD3yOT1DXpe9tYu4E2oqnqg7TE4DfxR0ERakqKMI/EjidThtXGdr8
	KotftFIfrOSBQ40d5YPFrx00lQg1sdq/af8tGAwXSrGeIZVhQmg6vOcm8hBAlHyMFWfESobRMJz8A
	LaIbX/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbq7-00000002xPN-21N2;
	Wed, 03 Sep 2025 00:59:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbnM-00000002wiz-258s;
	Wed, 03 Sep 2025 00:56:19 +0000
Received: from neptunite.rasen.tech (unknown [IPv6:2404:7a81:160:2100:30ba:ee2f:ad96:6665])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 111D3162B;
	Wed,  3 Sep 2025 02:55:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756860902;
	bh=vMUBpOspAwuRbk3s8zYi5ml7mvtL6cW/MHTRA4NY7ro=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=M09UjxbaNl4O7Aq5tpPeCiAvMeaYwv5r0yOTL0GZdgx+4CItYw64sXEQszZXQYdYP
	 0GJ1Y1XRYj0p3daiEop57gWfDtU6YT1+OVvMuYMJLP4WyXuxJx5jJUhSz3QSvrOFlC
	 XQxrbiuL8S0iIyk2o/nCeDhN+ir2y/Mf2w+OunwY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <m31popxjqk.fsf@t19.piap.pl>
References: <175308758352.3134829.9472501038683860006@localhost> <m3qzxyug1s.fsf@t19.piap.pl> <m3cy9futcj.fsf@t19.piap.pl> <m34iumujcs.fsf@t19.piap.pl> <m3zfcet41n.fsf@t19.piap.pl> <m3a545t789.fsf@t19.piap.pl> <20250812103243.GK30054@pendragon.ideasonboard.com> <175501095338.74722.11604545949710100799@localhost> <CAHCN7xKq_o_u7PhPMcZ2W9nzrFP8+CnhaYJOyxnjpKfbMTBCEw@mail.gmail.com> <m31popxjqk.fsf@t19.piap.pl>
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption: resolved
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Ondrej Jirman <megi@xff.cz>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Adam Ford <aford173@gmail.com>, Krzysztof =?utf-8?q?Ha=C5=82asa?= <khalasa@piap.pl>
Date: Wed, 03 Sep 2025 09:56:04 +0900
Message-ID: <175686096405.1542294.2802960782852730947@neptunite.rasen.tech>
User-Agent: alot/0.0.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_175616_676650_C4255AB3 
X-CRM114-Status: GOOD (  13.52  )
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

Hi Krzysztof,

Quoting Krzysztof Ha=C5=82asa (2025-09-02 18:54:27)
> Hi,
>=20
> summary:
>=20
> I've done a few additional tests and it seems the MEDIA_AXI clock is the
> problem. Reducing it to 400 MHz while still running MEDIA_ISP at 500 MHz
> produces no errors.
> MEDIA_ISP at 400 MHz and MEDIA_AXI at 500 MHz produces errors, though
> (register address errors while reading and writing from/to ISP MI
> (memory interface) registers, only on the secondary ISP (isp1), and
> generally only while streaming data from the ISP).
>=20
> What is driven by MEDIA_AXI clock root? MEDIAMIX: ISI, LCDIF, ISP, DWE.
>=20
> According to both datasheets (industrial and commercial), MEDIA_AXI
> is limited to 400 MHz in normal mode and 500 MHz in overdrive mode.
> All my hardware is setup for overdrive mode, though (two manufacturers,
> both using the same PMIC setup).

Thanks for the investigation!

>=20
> Since no hardware in the official Linux kernel tree (DT) uses the second
> ISP... Should we just add a warning to the imx8mp.dtsi and be done with
> it?

afaiu we can't yet use the ISI and ISP simultaneously, so the ISI is
enabled by default and you need overlays to enable the ISP, so
technically nothing upstream uses either ISP. To my knowledge, there is
hardware where you can use both though, such as the Debix SOM A
(imx8mp-debix-som-a-bmb-08.dts) [0].


Paul

[0] https://debix.io/hardware/debix-som-a-io-board.html

> Out of tree hardware using isp1 (csi1) obviously exists.
> --=20
> Krzysztof "Chris" Ha=C5=82asa
>=20
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa

