Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE51CD711C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 21:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpKlTYeTCs6R8eO95vUUpCyeGtT/lX8I/YjZJmafD90=; b=DuNDfnjfpHd2pU0q73FMr4VZ0t
	qSdN5B4xvAobT6H80gxl89jkdZHSEQ1uL+A58AU34aY7OskNGkeGQSww2jHdcJ7PFFBVO/XL43Js2
	sMh4EgwNt7gUHRV0009IRJaEtWg+KF//Xf47eWNoagV+T7/UzcU3VJxT/aA5WosMA2GOB93YcsQIr
	8GF5UeMFWpKhw+CP1C9k596jkzN4OTZWL3yc46S9aZ/bl8z5DaHjECQMTf/Q4t639Am70J5v2KMcS
	WkoiMzY1hHZ7k5HQFK64aTnkNT0MZtIMjX+IX6hV64o5bc0ol8CUD/bHi6KjYkFfH5CNW4iSWDlRq
	GnMUJ3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWLZX-00000009D8r-24jc;
	Thu, 18 Dec 2025 21:30:07 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWLZU-00000009D84-0TvJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 21:30:05 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-2f5w.prod.antispam.mailspamprotection.com; s=arckey; t=1766093404;
	 b=uJ4zFUvgjVP5wuiMOU9nNm7rjR/cHrNOk80OUJy3O2PchPM6YFIyOZVjv7fUK2ZEi4COOwGLRo
	  9+BpY1P7SyaHRAa7Wd/7DPzzg11FdRnXBHCwhd9ZWn2TiOyGcKXNEZbiJ3ZgSSoamZe6eHSB8/
	  leVKZpK+30Diexq2YgVkSC4UETRXCaUT2BNEz/hqxstNyxskFweehuPieoesAHwzUDOixy309o
	  /jf7GX0rsmEtGaXCq8DV5LSbbahLpQgjDJgksTgns3p75Gt5v85UAHZ1ahhXIssVVB7D+79KdT
	  JCD+jtlGK5eF85gnYFfp51+o8d5K4F5dAew67EI0VRCBQQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-2f5w.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-2f5w.prod.antispam.mailspamprotection.com; s=arckey; t=1766093404;
	bh=ZzvEed4sEkcv3SWvfOHQgv/2cRbBc1HpGi2Alr+EpL0=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=uflKjwEnanom3KSLIW3s17kAHvIOUTfv91S5IZex9e1+xxQp73Moy6D99kVV2sXjfEi1z1MWtP
	  OXt1Vy4gsFFXaEU56/9/vM92JelpgbrqG9ep/EYyfYoslB1gZV6AgOfA+zoQiBIP+/HElG1IEX
	  UU99WUunZ2noKuKmQ1hfnu2IoWKvzROamSFZC097O/Jx15dJ/vOyQJZJgOVjThm22wM6SffsiX
	  XokTC+fwrxwgJbERsMmaHTHe66+I8jIe9HtVGzqqhd9UD1fa1rX8ydztmEvwPzsCHYpwsmf3lo
	  BMgZMmK17OoKv9hR6IrFACAoz6TNqT7gfdIHOFag48TdaA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=tpKlTYeTCs6R8eO95vUUpCyeGtT/lX8I/YjZJmafD90=; b=jfPdup9AIHVexzr6yuIMP2hkxd
	nDJi5RW7HADal8gNNNBQxrC6Y4qVoZjDcGpcb49zO03H+QeAypR/kqrXT7sxKXt2Qz5a4ukEP3Jb5
	KDHA85wLfuO3BKQ6SJICb+oLdKb5d76cL8qUlny2XIU6oWmBRuE5TFgYCH3Kp/jmJnJ4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-2f5w.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vWLZL-00000003BSl-3AZL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 21:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=tpKlTYeTCs6R8eO95vUUpCyeGtT/lX8I/YjZJmafD90=; b=NbLdgIkCc+yH/GfSisI0WY9P43
	XnSIPYXmJf7kWE7vt8ZvjTnyLV9VgjFCywQfzLqCDigWle5tQll4SFHXwFfZQopdyB2NvDhZYZaHg
	tBE0VeTFYoAD9uVxdZrSOqaRYhNmohIIjo7/Ywb+isipUJz5OngCp3HQXRRi7VRl8zUw=;
Received: from [95.248.141.113] (port=61650 helo=bywater)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vWLZ5-00000000FX5-3itd;
	Thu, 18 Dec 2025 21:29:39 +0000
Date: Thu, 18 Dec 2025 22:29:38 +0100
From: Francesco Valla <francesco@valla.it>
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Haidong Zheng <haidong.zheng@nxp.com>,
	Danwei Luo <danwei.luo@nxp.com>, Lei Xu <lei.xu@nxp.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add support for NXP i.MX93
 FRDM
Message-ID: <aURyQsjf7AY09n41@bywater>
References: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
 <20251218-fpg-nxp-imx93-frdm-v4-2-cd3a9f6ac89a@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-fpg-nxp-imx93-frdm-v4-2-cd3a9f6ac89a@pengutronix.de>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 425843a665eec383b63e3b2734be73a7
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vWLZL-00000003BSl-3AZL-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-2f5w.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_133004_346564_7F6AC864 
X-CRM114-Status: GOOD (  10.49  )
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

On Thu, Dec 18, 2025 at 12:39:22PM +0100, Fabian Pflug wrote:
> The FRDM i.MX 93 development board is a low-cost and compact development
> board featuring the i.MX93 applications processor.
> 
> It features:
> - Dual Cortex-A55
> - 2 GB LPDDR4X / LPDDR4
> - 32 GB eMMC5.1
> - MicroSD slot
> - GbE RJ45 x 2
> - USB2.0 1x Type C, 1x Type A
> 
> This file is based upon the one provided by nxp in their own kernel and
> yocto meta layer for the device, but adapted for mainline.
> 
> Signed-off-by: Haidong Zheng <haidong.zheng@nxp.com>
> Signed-off-by: Danwei Luo <danwei.luo@nxp.com>
> Signed-off-by: Lei Xu <lei.xu@nxp.com>
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 620 +++++++++++++++++++++
>  2 files changed, 621 insertions(+)
>

Reviewed-by: Francesco Valla <francesco@valla.it>
Tested-by: Francesco Valla <francesco@valla.it>


Thank you!

Regards,
Francesco


