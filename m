Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EA7C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 08:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoAXBMZMFdzI1bxx8xlOt+7qXGb/M8aMLz7dtBNMqJY=; b=4LibtHsMOJ5no7fGQ6VDubpD4m
	/Sco30U+qxZiyHrzgL2gLrbqMdLf2f93IYBjz2fLp6X9ABWJcJ1ghGHQdh4SLqrx4nigHomL91phg
	rhxiJhLhH8QCHfDEMYyFpvXyWv8PERD1Rz+worSCLJHS0bk8ACN46U4NAYDp844lwIFCr1UFAtsYb
	TFgvhtif0cPHvyYM+KvjUjXyKjNafusTdEQKB+M0drnoWx4qEwD2Xq1f+8uMn3I1aef5IwnO2Ob0I
	eyOvOWpCeuF3b31KzWgs9JCc8mTCMD/CPbmIojQA0wyEoM9Da4eK0yly7ZNe4LAYPv2jEvBfHVFJV
	/iu+nO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNDz-0000000G3lv-2S13;
	Sat, 15 Mar 2025 08:50:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttNB4-0000000G34t-1N9l;
	Sat, 15 Mar 2025 08:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742028448;
	bh=G8uYSrifhqywqfMO1IBBhasEEunS+Y3jrko3Aki/XA0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LQO04r4q3Sevfv8mmADPojqCSJcQxUVqr4wr2MLx8Y89UPKMJ/9MVD3Ka68IF5d2V
	 fYWoNfuPE/yl6yzB4kFEUFU5qHLrhdKhuBuFwd1RfDrwkkbACsdMEBPxSty6ki57Qv
	 hwdp7lNTn0Bit7z2HUoapOazm5azakK1LwI0jFXyxelzE5e/0z3uO+SkZnOLl8x9m2
	 FPIaialuC/Wp1qsgs/2EiYwo5CYKPsf/VkuTaDuUC8zbgYfWp+0LH7vtssH5L+PWpw
	 7pu4dbwDbgizk1/LFSBduf/h4FFXinQyo+bIydoS5dF9tqeLGWIDNMQ7ruU9xJHH7z
	 bLG9gUCBi32qA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CCFF117E05C8;
	Sat, 15 Mar 2025 09:47:27 +0100 (CET)
Date: Sat, 15 Mar 2025 09:47:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com,
 angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v2 6/6] drm/panfrost: Force AARCH64_4K page table format
 on MediaTek MT8192
Message-ID: <20250315094722.4c4804c6@collabora.com>
In-Reply-To: <20250314173858.212264-7-ariel.dalessandro@collabora.com>
References: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
	<20250314173858.212264-7-ariel.dalessandro@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_014730_557364_487021BB 
X-CRM114-Status: GOOD (  14.72  )
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

On Fri, 14 Mar 2025 14:38:58 -0300
Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:

> MediaTek MT8192 SoC has an ARM Mali-G57 MC5 GPU (Valhall-JM). Now that
> Panfrost supports AARCH64_4K page table format, let's enable it on this
> SoC.
> 
> Running glmark2-es2-drm [0] benchmark, reported the same performance
> score on both modes Mali LPAE (LEGACY) vs. AARCH64_4K, before and after
> this commit. Tested on a Mediatek (MT8395) Genio 1200 EVK board.
> 
> [0] https://github.com/glmark2/glmark2
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index e854f290858f9..ef30d314b2281 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -836,6 +836,7 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
>  	.pm_domain_names = mediatek_mt8192_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> +	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
>  };
>  
>  static const struct of_device_id dt_match[] = {


