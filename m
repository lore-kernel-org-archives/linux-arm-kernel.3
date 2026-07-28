Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F34EC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 10:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eSPIDKzh3hZMBFlXK8+Byxo5earaMZxst52f30+aek=; b=VDMsUqtkrUTXp0GgHNJNnxKUvz
	acUn5LJJ4H+YgTv5tYxQPMjI1c3AmQ5EPW/9RhA3UdnSzoeQd2emeltiTyW+PezDFo9AfZ+YF2XAH
	Z4NNOOjKcW/vLv8m02PDLe/IQcqY8K+lI7qPFnrG7N1huXC49/OVBBECy04ns6pBpf2y7kHtY+wm4
	g1RV7DlHdGLXBkhWKyJ0B8m8AmakiAromWHffa0ireTp23CsVZoWNslsn0GaAXqnUiZt3SyXtZxV8
	4KhkIHgjGO4ktMZFAnyd0TsSyDVc5jGsGVenxYpB8L5ZzXDTKwH6JYpcZxnGCuZdM5XJcxxQ6UuF3
	2ZWKRrRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeel-00000004uiS-1HC9;
	Tue, 28 Jul 2026 10:03:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeek-00000004ui8-3mMV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 10:03:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EE1441A41;
	Tue, 28 Jul 2026 10:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A161F000E9;
	Tue, 28 Jul 2026 10:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785233006;
	bh=2eSPIDKzh3hZMBFlXK8+Byxo5earaMZxst52f30+aek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BtMswrpA0KElM78Uc6VPB02Hu5cEm10KeI4wy0Z9NJ30pQIk0ubgq471hrnsrZLGs
	 s/k0EJrhYzUA3Fz8HinxIWH2fbBuqHuFTREjPHv0WcOHS3JM/v5+f648VSk6fFxZ11
	 34JiQQVMZZK/j9Mwj4VeB0svRMTcoQZiiy3QHaS1QiL8n/8e/HM0uK3kSJTOxh0SK8
	 c/iPkNQkkbjbPPmTfgJFmbJBZFIUP3SMGqXSQgBvMMIJgX4XEo27K1eZkQOlzdiWi4
	 UeeOuHuNanjrcRtWEeJdHcw8wIUw66/Zf7gaL7OmcC6w+NY4njgk5B5iZrXflh89gS
	 8l4QLA10m+BRQ==
Date: Tue, 28 Jul 2026 11:03:21 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com, joro@8bytes.org, jpb@kernel.org,
	jgg@nvidia.com, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] arm64: Add override for MMFR1.HAFDBS
Message-ID: <amh-aW67-ifCUXXF@willie-the-truck>
References: <cover.1785153415.git.robin.murphy@arm.com>
 <d7b31cbcd984c1efa61d2fc97111150cc18e21b0.1785153415.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7b31cbcd984c1efa61d2fc97111150cc18e21b0.1785153415.git.robin.murphy@arm.com>
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

On Mon, Jul 27, 2026 at 01:03:28PM +0100, Robin Murphy wrote:
> In general it might be nice to have the ability to disable hardware
> access/dirty bit management for debugging or performance comparison
> purposes without having to rebuild the kernel. However once FEAT_HAFT
> comes into the picture we also start to have a real functional concern
> where the decision to use HAFT based on the boot CPUs can prevent SVA
> or late-onlining if SMMUs/CPUs are later found to lack HAFT support.
> 
> To that end, add the appropriate MMFR1 override, with an easy "nohaft"
> alias for the significant case, partly since the feature/field naming
> isn't the most obvious, but also so it could potentially be redirected
> in future if someone wanted to attempt a higher-level means of turning
> off just HAFT usage independently from FEAT_HDBSS.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> v3: No change.
> 
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  arch/arm64/kernel/pi/idreg-override.c           | 2 ++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b5493a7f8f22..7f23e5b8dc44 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -565,6 +565,9 @@ Kernel parameters
>  	arm64.nogcs	[ARM64] Unconditionally disable Guarded Control Stack
>  			support
>  
> +	arm64.nohaft	[ARM64] Unconditionally disable Hardware managed Access
> +			Flag for Table descriptors support
> +
>  	arm64.nomops	[ARM64] Unconditionally disable Memory Copy and Memory
>  			Set instructions support
>  
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> index bc57b290e5e7..0e051fec5afe 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -64,6 +64,7 @@ static const struct ftr_set_desc mmfr1 __prel64_initconst = {
>  	.override	= &id_aa64mmfr1_override,
>  	.fields		= {
>  		FIELD("vh", ID_AA64MMFR1_EL1_VH_SHIFT, mmfr1_vh_filter),
> +		FIELD("hafdbs", ID_AA64MMFR1_EL1_HAFDBS_SHIFT, NULL),
>  		{}
>  	},
>  };
> @@ -246,6 +247,7 @@ static const struct {
>  	{ "arm64.nomte",		"id_aa64pfr1.mte=0" },
>  	{ "nokaslr",			"arm64_sw.nokaslr=1" },
>  	{ "rodata=off",			"arm64_sw.rodataoff=1" },
> +	{ "arm64.nohaft",		"id_aa64mmfr1.hafdbs=2" },

What happens if I pass this option on a CPU that doesn't implement
HTTU at all? Will that then end up *enabling* HA and HD?

Will

