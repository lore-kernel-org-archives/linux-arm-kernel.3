Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E74C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 07:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=malUCnvO8ek8Kt+Gg1lNXeMv1KHUcTELIq/XhwfI6sg=; b=gpQh2Qa+2j0/GJGE5GQbgdpTzY
	wt1NC+ohAnL9l+UCLDNeQWqoZV5TWOVXTx4JTjkGyomizCjowiN7xQdEDf9Y1lZVzInuTUT4LJXjH
	2wncft5AY3EzNmjasZolQ60AMJqPFCGdHOZn/GsD3VJ0Lvd6Sh4qaekA0R4oB/7SO3v3zz8CJ0juS
	vC7GI+kL18UTLj6I4zXL+Q5iRs2KrYwBcqJqBm01ZQ4X+Cn22tJZGdi9ATU1898F6N6Heo1UL5fuL
	ez1bS2k5iZTptqEnqjFbqgRzwzilMG3ov1ffIuX61lW2LXskFOIKIjwHlyjLV33p0FCIuFpv9izLE
	55Qllk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGgh-0000000GfqR-1TLW;
	Thu, 16 Jul 2026 07:39:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGgf-0000000GfpQ-49Sh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 07:39:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DF4B600BB;
	Thu, 16 Jul 2026 07:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD321F00A3A;
	Thu, 16 Jul 2026 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784187556;
	bh=malUCnvO8ek8Kt+Gg1lNXeMv1KHUcTELIq/XhwfI6sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hO/BIT9ln2bUAPkNbyvzxxux7ErFAgTUvcalcKpl5Jaf+VQYiVFJMug5EX3x8Bqc2
	 S4U7rwqfVZmmDD2NmfZ/vJVLSZOVa6ASiCBGIma65ebcTMNqGIl959cmGtsobnmYGO
	 s1xSxQRZv56yqAwUlyV8vZPK7tlE5UhGYqmKl6f7o1+7k0JahWCyC3DUNHhmnkYIwN
	 zkyGSLvfliQQfKz+IhioE/uCXL21tndw4re04pxz0HUIomjL9BZhcP5DaONo76hN+H
	 sYnyphfPKqhyi2s9T7mptMyC4kPKF/xNSxFVnr6v1mUMLMHDD87mv65Xn9dB96zc8s
	 YmAfeXShj9fZw==
Date: Thu, 16 Jul 2026 00:39:15 -0700
From: Oliver Upton <oupton@kernel.org>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	yuzenghui@huawei.com, wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com, caijian11@h-partners.com,
	liuyonglong@huawei.com, yezhenyu2@huawei.com, yubihong@huawei.com,
	linuxarm@huawei.com, joey.gouly@arm.com, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, leo.bras@arm.com
Subject: Re: [PATCH v4 3/6] KVM: arm64: Add auto DBM support for hardware
 dirty tracking
Message-ID: <aliKo7dTZzKcWHzI@kernel.org>
References: <20260709104026.2612599-1-zhengtian10@huawei.com>
 <20260709104026.2612599-4-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709104026.2612599-4-zhengtian10@huawei.com>
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

Hi Tian,

On Thu, Jul 09, 2026 at 06:40:23PM +0800, Tian Zheng wrote:
> -	if (prot & KVM_PGTABLE_PROT_W)
> +	if (prot & KVM_PGTABLE_PROT_W) {
>  		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
> 
> +		/*
> +		 * No DEVICE filter needed here: relax_perms is only called
> +		 * on FSC_PERM faults. Device pages always get full RW from
> +		 * initial mapping and are never write-protected during
> +		 * migration, so they never trigger a permission fault.
> +		 */
> +		if (pgt->flags & KVM_PGTABLE_S2_DBM)
> +			set |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
> +	} else {
> +		/*
> +		 * Clear DBM on W→RO downgrade to prevent hardware from
> +		 * silently upgrading RO+DBM back to W+dirty, which would
> +		 * bypass KVM's write tracking and cause data corruption.
> +		 */
> +		clr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
> +	}
> +

This block makes it pretty evident that the DBM bit really *is* the
write permission bit. I'd much rather we introduce the concept of dirty
state to the page table library and migrate the abstract write
permission to the DBM field, even if we don't have FEAT_HAFDBS.

That way everything 'just works' from outside the page-table library:
write-protecting hugepages would have the effect of clearing DBM and we
can separately reap dirty state from page descriptors.

If/when the architecture forces FEAT_S2PIE upon us we will need to make
this change anyway since dirty state management is unconditional and
handled separately from the actual permissions.

Thanks,
Oliver

