Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB014C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 10:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIPQb4fbhkY2qzR+ATp8Y+MsaxwezJ9KnhfftucF8rI=; b=xEao9TIiZt0/TQisjrMQDGjN4R
	sG+UzXc5zVrOoWwq2giOK51XxEIEItLH5jnsuPApy0RAmCqmqBUR0RpIlfzb95i8wiFg+PUguDbVC
	MxywK0rJBe4ERtyp3wY1JIXSYA+dHRI6vnNpLcD32WZjZ61dvW6hPjEbA4GK0YRgXjdwxMuCCthNY
	gciN0iYJ1PucRVMtk09nVwH7wzVXlxidU8xfs7TbUq5VaI2SM1vfNy2qEsYVDOJ+BHeFyiFhjT5Yd
	yh+3MAI/JSTXuGzDNg3q3xmKx8aMYnzpigs4Yg+Wj4qlZuxM6SFo8fQk6+N2cjUxlZ/En30mruMKb
	CGQ6JETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trwW0-00000005FN7-41W2;
	Tue, 11 Mar 2025 10:07:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trwUL-00000005F7v-40Q4;
	Tue, 11 Mar 2025 10:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741687528;
	bh=cj3zWPnkW2ekNrOvCr+j0WVhEmNfZMjuNHLNg0V+U/c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L/IHBDqmX6ZexWlMn41GpV0SlREfNRW7euROQ15Gb+dJ39GSjEBKSqNipJBFhIihF
	 i1iIJJA36tWo1NaoxCkP5o63/iLh9N3RamPqdFNp+52Sct5MwO7yXaRDJIaRm3dhdx
	 2kmpJRrD5Rslw/ZmVjq7Lor2OrcxczYQ65waMhRFgcfXy9/5wH1At0XbpTPLW2QoQX
	 0bQVw4mMSfJdo6yIDP8J4E7H11ztCUCHRR/pnkRS4rWPNoCMPPqbDMW9VRDfqsNKMq
	 oLxFulJnypGlRE0dv6XiI1NG97e79DYy4zevXtMgZmY71tSlKj5ZGuh64SNi+ncXZo
	 ldLqDUjNLsyBw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BCABF17E0B25;
	Tue, 11 Mar 2025 11:05:27 +0100 (CET)
Date: Tue, 11 Mar 2025 11:05:20 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com
Subject: Re: [PATCH v1 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
Message-ID: <20250311110520.6b79e090@collabora.com>
In-Reply-To: <16f6a6e2-4dce-4af9-bc0a-61c4d6213f02@collabora.com>
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
	<20250310195921.157511-5-ariel.dalessandro@collabora.com>
	<20250311090545.3b941567@collabora.com>
	<16f6a6e2-4dce-4af9-bc0a-61c4d6213f02@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_030530_156716_B683BAA7 
X-CRM114-Status: GOOD (  26.00  )
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

On Tue, 11 Mar 2025 10:14:44 +0100
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Il 11/03/25 09:05, Boris Brezillon ha scritto:
> > On Mon, 10 Mar 2025 16:59:19 -0300
> > Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> >   
> >> Currently, Panfrost only supports MMU configuration in "LEGACY" (as
> >> Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
> >> Address Extension", which in Linux we've called "mali_lpae".
> >>
> >> This commit adds support for conditionally enabling AARCH64_4K page
> >> table format. To achieve that, a "GPU optional configurations" field was
> >> added to `struct panfrost_features` with the related flag.
> >>
> >> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
> >> the HW_FEATURE_AARCH64_MMU feature flag present.
> >>
> >> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> >> ---
> >>   drivers/gpu/drm/panfrost/panfrost_device.h |  16 +++
> >>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 132 +++++++++++++++++++--
> >>   drivers/gpu/drm/panfrost/panfrost_regs.h   |  34 ++++++
> >>   3 files changed, 169 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> >> index cffcb0ac7c111..0385702aa43c7 100644
> >> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> >> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> >> @@ -42,6 +42,14 @@ enum panfrost_gpu_pm {
> >>   	GPU_PM_VREG_OFF,
> >>   };
> >>   
> >> +/**
> >> + * enum panfrost_gpu_config - GPU optional configurations
> >> + * @GPU_CONFIG_AARCH64_4K: Use AARCH64_4K page table format
> >> + */
> >> +enum panfrost_gpu_config {
> >> +	GPU_CONFIG_AARCH64_4K,
> >> +};
> >> +
> >>   struct panfrost_features {
> >>   	u16 id;
> >>   	u16 revision;
> >> @@ -95,6 +103,9 @@ struct panfrost_compatible {
> >>   
> >>   	/* Allowed PM features */
> >>   	u8 pm_features;
> >> +
> >> +	/* GPU features */
> >> +	u8 gpu_configs;  
> > 
> > I would probably name this gpu_quirks, with the GPU_CONFIG_AARCH64_4K
> > flag renamed GPU_QUIRK_FORCE_AARCH64_PAGE_TABLE.
> >   
> 
> Boris, at this point the quirk should be LPAE, not AARCH64_4K, because the
> former is legacy...

It's legacy, but it's also the default in this driver. And just because
it's legacy doesn't mean it's broken :P. As Steve mentioned, there are
perf considerations to take into account, and on some platforms (most?),
it's preferable to use the legacy format because of that.

> 
> I think that Ariel is right in this, as in, that's a capability of the GPU
> MMU, so if anything I would rather rename it to gpu_capabilities,

No, GPU capabilities are extracted from he GPU ID, and all Bifrost GPUs
support the aarch64 page table format. But what matters here is GPUs
that can't use the legacy page table format because it's to limited to
express the cacheability/shareability properties.

> but then
> that'd be confusing for other stuff - which means that gpu_configs is most
> probably the least confusing and/or most appropriate name for this.

Again, it's not a random configuration decision, it's something we do
because the default (legacy page table format) doesn't work, so I keep
thinking quirk is an appropriate name in this context.

Regards,

Boris

