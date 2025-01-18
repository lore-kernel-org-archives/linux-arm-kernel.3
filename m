Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B82C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0Y39t8k0+X2e6sEOMSTLRX2CtWM9ICqWOxbMj3LaSE=; b=FeDIpSISyh05jxkKwQ3cBnvG+P
	QT7h7b4NNiVigBHXQoj3EDs/Z+Sm92BmFEFHNEabcSZS6S0uyBNgE2nqDbb0reYkCTQc7k4ISZ/WR
	+sM31SdSt9aEkYyLhiZW7aPyZeeKttAdozR6Xx7Sq5dWhXMg/LAjyMAbe6F1tb0puyEDXXFZSbP+x
	dJd2+T6hiAW+BdJDekVoclUYDZWSzjYb/sa5146Jh0k6XD+B2HlyZhDEwizJWAzH664Ri6s/aV8Gh
	jm46xyi9qPhLq+JUnRAU5bnQ+MdIPT4L7BuJgyeHRoaSxuFhXVDN7fmw6y9vPPb18Cq4Woi2fQgT+
	aBEYJ1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBPI-00000002grF-0Ioo;
	Sat, 18 Jan 2025 16:10:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBMt-00000002gZR-23b9;
	Sat, 18 Jan 2025 16:08:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAD295C463E;
	Sat, 18 Jan 2025 16:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3238EC4CEE1;
	Sat, 18 Jan 2025 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737216494;
	bh=ibohityZJYJR2vS9My7/wylHqL05Ro2cTshSmwpPaNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tEM0q6D7UIMeyjJ2p05D5o7IZ/kTkuPnNlJwvWVrp4xQU4kDhA2IIgPTnvZlqlmzW
	 xGRCgsmjVbvPmZk6ypAACPDGY3MOk/nkFseYJwBBbYkXrGf9iWtTvjiE2IoPj4rikh
	 ita+dNTZ2UrSw2q0Kcv70n0TlwESzDR0x/xWHSVfXw0JXZeumw9Mvv5F9ieLIDMkmc
	 6IlJF2gaREAFVLVUEiH0aFRpBT4AugWxjXTBZQ2n7LHmOcuw1kzjECBS2Oozw6mhbv
	 o6vnMkHwwIn3XKwvZkiv0Hs+wgdpASnOVTitnujYJfuaFv46bOeGsS7dY/1j7UN1r5
	 eVFrSsKhHCcqg==
Date: Sat, 18 Jan 2025 17:08:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] drm/panfrost: Add support for Mali on the MT8370 SoC
Message-ID: <20250118-meticulous-black-caracal-ec7f0d@krzk-bin>
References: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
 <20250116-mt8370-enable-gpu-v1-2-0a6b78e925c8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250116-mt8370-enable-gpu-v1-2-0a6b78e925c8@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_080815_629075_EC01DC3C 
X-CRM114-Status: GOOD (  20.15  )
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

On Thu, Jan 16, 2025 at 03:25:58PM +0100, Louis-Alexis Eyraud wrote:
> This commit adds a compatible for the MediaTek MT8370 SoC, with an
> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core), and adds
> platform data using the same supplies and the same power domain lists
> as MT8186 (one regulator, two power domains).
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 0f3935556ac761adcd80197d87e8e478df436fd5..1d51b64ed0f0660cc95263a289d5dad204540cfd 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -837,6 +837,15 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>  
> +/* MT8370 uses the same power domains and power supplies as MT8186 */
> +static const struct panfrost_compatible mediatek_mt8370_data = {
> +	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> +	.supply_names = mediatek_mt8183_b_supplies,
> +	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
> +	.pm_domain_names = mediatek_mt8186_pm_domains,
> +	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> +};

No, people, stop this nonsense. This is exactly the same as previous.
Don't duplicate entries just because you want a commit.

> +
>  static const struct of_device_id dt_match[] = {
>  	/* Set first to probe before the generic compatibles */
>  	{ .compatible = "amlogic,meson-gxm-mali",
> @@ -859,6 +868,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
>  	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
>  	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
> +	{ .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8370_data },

No, express properly compatibility or say in bindings commit msg why
devices are not compatible.

Best regards,
Krzysztof


