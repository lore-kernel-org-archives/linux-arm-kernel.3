Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABB1EB28F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 09:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YojMfz3Ugs/7NMma4XPSlNth2z1uxj8Jmj8kTgaV0WM=; b=JcxINkNvmtYW0FcX6I2Qg79rgz
	Ku7WUQjxYKevzj7DpN2c91HEXz64Fctgwiy3sxsOLNtNiuhuhFv3jDlmxKva/gwGXo+oa+O4M117X
	yGC4FeB8nFrS3FNucdYRSUHLtTBXa/y+PvG7NlzG+0G1yqcExG7PCn5P5hRltga5JzQU2RP08DTi+
	z+9cHlY1suZQEl2Z4BSOQ0NpYQPbA4GWepQDh6dKopJtW96aAlBMmf1d3UT8wZRzo4VF1/4v2MVXA
	MRrGreGD/jjHx+JXSaP6v2mF+/ExlGlaTdBn1eTMzl01aszohXASGlGC/1CrISKpxUluCBZoivibI
	tkHwRXFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voI1x-0000000B66p-2N8I;
	Fri, 06 Feb 2026 09:21:37 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voI1t-0000000B65J-3cjK;
	Fri, 06 Feb 2026 09:21:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 0BCBA41B4A;
	Fri,  6 Feb 2026 10:21:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1770369685; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YojMfz3Ugs/7NMma4XPSlNth2z1uxj8Jmj8kTgaV0WM=;
	b=CJqe5vSMiGZD2fr5TmUOHE/R2xiyuXaS+vcF7IJtwWHnQbQlVCeMmzyUbpyoQl25aRuOVw
	V5C3A3Dlon5AFQa4DtStu4E/aq40eWOCcewN6NRBFKLa1M6E3tVPv9Ks3BDVz1ePezNGCc
	YdlGn2y6ksZT0hVPCYfnGA9pgIe8tHHtpBGtkoBB94/bV0ve9cK3dQcU3tDQmUyNeFoMGP
	KGJpwlFZESzRAFUsbPqOS67uIZoPQ9vB45/UhvQ4reejWaqJwi4wdLjGEy/GXj4FvVH/Vi
	XkkBjJTC9jOG8IZkiOLe6EyYpg0fFyEYbrv7vAPVVsuqiuuSe7/zpaAPGH9Kjg==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20260206084220.543267-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset="utf-8"
References: <20260206084220.543267-1-nichen@iscas.ac.cn>
Date: Fri, 06 Feb 2026 10:21:19 +0100
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, damon.ding@rock-chips.com, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Chen Ni" <nichen@iscas.ac.cn>
MIME-Version: 1.0
Message-ID: <5eac199e-dbe3-3707-4876-f6bf7754f124@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?drm/rockchip=3A?=
 =?utf-8?q?_analogix=5Fdp=3A?= Add missing error check for 
 =?utf-8?q?platform=5Fget=5Fresource()?=
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_012134_890129_0CCBAC7B 
X-CRM114-Status: GOOD (  11.94  )
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

Hello Chen,

On Friday, February 06, 2026 09:42 CET, Chen Ni <nichen@iscas.ac.cn> wr=
ote:
> Add missing error check for platform=5Fget=5Fresource() return value =
to
> prevent NULL pointer dereference when memory resource is not availabl=
e.
>=20
> Fixes: 718b3bb9c0ab ("drm/rockchip: analogix=5Fdp: Expand device data=
 to support multiple edp display")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/rockchip/analogix=5Fdp-rockchip.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/analogix=5Fdp-rockchip.c b/driv=
ers/gpu/drm/rockchip/analogix=5Fdp-rockchip.c
> index fdab71d51e2a..3f5be14010c1 100644
> --- a/drivers/gpu/drm/rockchip/analogix=5Fdp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix=5Fdp-rockchip.c
> @@ -461,6 +461,8 @@ static int rockchip=5Fdp=5Fprobe(struct platform=5F=
device *pdev)
>  		return -ENOMEM;
> =20
>  	res =3D platform=5Fget=5Fresource(pdev, IORESOURCE=5FMEM, 0);
> +	if (!res)
> +		return -EINVAL;
> =20
>  	i =3D 0;
>  	while (dp=5Fdata[i].reg) {

Thanks for this patch!  It is looking good to me, but I think it should=
 be
propagated into the stable kernels as well.

Please feel free to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>


