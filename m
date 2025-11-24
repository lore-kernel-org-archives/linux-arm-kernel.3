Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1208ECFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 14:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRHCSyivfYqvy0eOo0dM8C8IZUryurx9JG+iAvwPS9M=; b=GyDraa2wEPGIkF7FBBBl4y/lkG
	+xM7c9SCA+zTH8R37UU0/v61tsI4l8SX4depd4khyKW7mhU24JhNogXdJwVMTNXU8J+lWG5jRTWvW
	gAHkvmaV0FIcOhtrxOS3v0AKV/fgxNHt0Pi2GVhIZyl6aLu8vj2Y7xMzFeOBSxseRrf9zzpBlRrf/
	RqlTbtdAgBnxNy61UMRnWiPFK49pJBpD6FKyeW69kMCiVndyGDOCnUCB9rReau47Jdr4bM/88ZEwQ
	yX16yP+NCUvRlwOHqlhj6lwFaUqjVzxY5lBoOabO1bvWUY9LvZOo37OZd0Z3FjWtys7Bt7oMb+hc5
	JvpOeL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXC9-0000000BoFs-1L3S;
	Mon, 24 Nov 2025 14:05:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXC7-0000000BoFH-0GcD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 14:05:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 78E4B41766
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 14:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA76CC4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763993128;
	bh=qavELajcvVcNhsuFoSIWcnbxcf+FNv9UKtydV1tgaZg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gcK70tPSVbo14sgg787AnL354sU2H7FQ3jL7rZ8o0GP7CtlmpmoEUcq8WyQRxTAbQ
	 4bb7+I3zfjAxqkPSHELnsEyChzOJo7rgcqkWi+KKAU3vOsWa1kdMoK/S8GYCQjOFMd
	 21gnLZaP4pdaePmIG9B3m/6Zx8uMsG3SldoXP6KFba2UWL1v11ySYfhpGlLFtxiqk0
	 oHyx3TvqIODgKrEs3EAL9Y0uXNcmkfCTK8LptBVqDQvtl8WjdtBE9Nty+nz6sQqoRU
	 0+wb1GdUTakgKn5Xm5ulapY8wISPX9yyAPK4JHQix5G1HAIJ4HJ0Cd03TZzp1NxNjG
	 E6xMlZcMZhe9g==
Message-ID: <ef96b1ea-c228-45f8-b79f-65b00122ef61@kernel.org>
Date: Mon, 24 Nov 2025 15:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/12] mm: bail out of lazy_mmu_mode_* in interrupt
 context
To: linux-arm-kernel@lists.infradead.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-8-kevin.brodsky@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251124132228.622678-8-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_060531_129932_D75FB09F 
X-CRM114-Status: GOOD (  11.55  )
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

On 11/24/25 14:22, Kevin Brodsky wrote:
> The lazy MMU mode cannot be used in interrupt context. This is
> documented in <linux/pgtable.h>, but isn't consistently handled
> across architectures.
> 
> arm64 ensures that calls to lazy_mmu_mode_* have no effect in
> interrupt context, because such calls do occur in certain
> configurations - see commit b81c688426a9 ("arm64/mm: Disable barrier
> batching in interrupt contexts"). Other architectures do not check
> this situation, most likely because it hasn't occurred so far.
> 
> Let's handle this in the new generic lazy_mmu layer, in the same
> fashion as arm64: bail out of lazy_mmu_mode_* if in_interrupt().
> Also remove the arm64 handling that is now redundant.
> 
> Both arm64 and x86/Xen also ensure that any lazy MMU optimisation is
> disabled while in interrupt (see queue_pte_barriers() and
> xen_get_lazy_mode() respectively). This will be handled in the
> generic layer in a subsequent patch.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---


Moving this patch earlier LGTM, hoping we don't get any unexpected 
surprises ...

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>


-- 
Cheers

David

