Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CC0C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kELG7ynxM4PVupxi9+j/hjnZQWxE487Kzr/vXjCy04A=; b=rdeaqcmjOiyxkLxLMkdg69XiXz
	1gm6Uub35FUdHeuA+02KznL4Bq3/vTvrO3J+ww5VmUsvITxNVDwuSj9U9q17PLDyGLzgUM7t7cKCK
	03W5opsMPJxDTXK9puHh/y/K5T6bly2OXpIrzgvSi3dHq4Uw5L+dhjf++6gzlKR9WbfyBTgi0eJ3o
	WC4OuXFYdbMQjANw70B0ng305NnqKCg1zHlnB2wcGGUeHmsXz/3ss2GqxztZst9YLAV1cpobS6wT5
	HUpvfbpOsZr29x9JmNqIjfR6k2uV0qR/NmzYrE6Bm6BD/uccXJa0SifiT8DdtnBttRbEeOhKLYUPm
	xVdYblwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trukC-00000004yIW-3j1b;
	Tue, 11 Mar 2025 08:13:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1true9-00000004x1o-3YFC;
	Tue, 11 Mar 2025 08:07:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741680448;
	bh=Wln6HbJ1YhxwRZiQK3YIiagu79K/yCUP4PftsyrzyJo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AIC5nti+7eUbHYa6koRGpGRDZWZUbDap8+kiOPa6xudRu7/6HjjqlTTTq6qe2/eUP
	 Lm4HrDY94i1XeUGM9dBC7TanQ2zW+Ew7KiM7mA8Ctfvllyh/j//QUiaA5cyubszlpZ
	 rHDwH9F0Wyj/ZftoFQL26wvIBB4Sk/UFeymsxRC1g2gSxQqBxV3ptne2FoWM4mLYP7
	 NNjC+9XFBIeDBcAmhb62N601XSk9+J/cDysAdY9y47RnM8oh/ZxJDcpITuPm5ULtQO
	 MocuUeeR4PIDK+pPBZY+m3Epg6xukvWc30vrwWYQIjNEFgmaJYhZQZNkgdMyrtJi4q
	 QY0VkpuOtjtlg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A6CBD17E0237;
	Tue, 11 Mar 2025 09:07:27 +0100 (CET)
Date: Tue, 11 Mar 2025 09:06:49 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com
Subject: Re: [PATCH v1 5/6] drm/panfrost: Enable AARCH64_4K page table
 format on mediatek_mt8188
Message-ID: <20250311090649.0d15d74d@collabora.com>
In-Reply-To: <20250310195921.157511-6-ariel.dalessandro@collabora.com>
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
	<20250310195921.157511-6-ariel.dalessandro@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_010730_029878_00C08E62 
X-CRM114-Status: GOOD (  13.78  )
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

On Mon, 10 Mar 2025 16:59:20 -0300
Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

> Now that Panfrost supports AARCH64_4K page table format, let's enable it
> on Mediatek MT8188.

Can you maybe give more details on why this is needed
(legacy shareability/cacheability not suitable for this GPU?)?

> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 0f3935556ac76..d7b8bded6d784 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -824,6 +824,7 @@ static const struct panfrost_compatible mediatek_mt8188_data = {
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>  	.pm_domain_names = mediatek_mt8183_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> +	.gpu_configs = BIT(GPU_CONFIG_AARCH64_4K),
>  };
>  
>  static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };


