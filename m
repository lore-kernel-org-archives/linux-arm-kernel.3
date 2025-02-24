Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82E1C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vX7Xf96MKp2+iGQBpvXSSman0x3TMAYFq6IQlzbQmDM=; b=e0mPDuo+IsJDiYbzeBBqUVyCqB
	3eW3klCaw8sG4xlfvoWb4XP0orS23BoWB/vcGismehxh8H1TwwsTH/a9GrFKJg5/yir/d0xz8un14
	jo6/Ct8OYK1jINjmdjkJIhvn0jxU/6Fh5DWO9s0LMcjSCJjtZaTg6YXpJ52j/RDefda3g4Y7xxQ+q
	Qrdjz6z2w0smYjUPhgwQ2aXfaEcs3If9iMjOHYbXPwwh8FgC4kGA64hsIlURXVRs8spGuMZSnMLSE
	GqHDuEX5sWZ84TGQZZVlZqvrgkn5iETCKb/QTmjWo15Ht73hhmghqBITlYFxkh4iFvRYQUP/RhNyR
	sUwpC6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVmY-0000000D9R4-0o8U;
	Mon, 24 Feb 2025 10:33:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVkr-0000000D91G-0E0j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 10:32:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12ECE1E7D;
	Mon, 24 Feb 2025 02:32:21 -0800 (PST)
Received: from [10.57.36.38] (unknown [10.57.36.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A0AC73F673;
	Mon, 24 Feb 2025 02:32:02 -0800 (PST)
Message-ID: <a8ceea52-e34a-4edb-bd54-ca30ec030432@arm.com>
Date: Mon, 24 Feb 2025 10:32:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Drop mte_allowed check during memslot
 creation
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>
References: <20250224093938.3934386-1-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250224093938.3934386-1-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_023205_139707_E3710341 
X-CRM114-Status: GOOD (  14.14  )
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

On 24/02/2025 09:39, Aneesh Kumar K.V (Arm) wrote:
> Before commit d89585fbb308 ("KVM: arm64: unify the tests for VMAs in
> memslots when MTE is enabled"), kvm_arch_prepare_memory_region() only
> rejected a memory slot if VM_SHARED was set. This commit unified the
> checking with user_mem_abort(), with slots being rejected if either
> VM_MTE_ALLOWED is not set or VM_SHARED set. A subsequent commit
> c911f0d46879 ("KVM: arm64: permit all VM_MTE_ALLOWED mappings with MTE
> enabled") dropped the VM_SHARED check, so we ended up with memory slots
> being rejected if VM_MTE_ALLOWED is not set. This wasn't the case before
> the commit d89585fbb308. The rejection of the memory slot with VM_SHARED
> set was done to avoid a race condition with the test/set of the
> PG_mte_tagged flag. Before Commit d77e59a8fccd ("arm64: mte: Lock a page
> for MTE tag initialization") the kernel avoided allowing MTE with shared
> pages, thereby preventing two tasks sharing a page from setting up the
> PG_mte_tagged flag racily.
> 
> Commit d77e59a8fccd ("arm64: mte: Lock a page for MTE tag
> initialization") further updated the locking so that the kernel
> allows VM_SHARED mapping with MTE. With this commit, we can enable
> memslot creation with VM_SHARED VMA mapping.
> 
> This patch results in a minor tweak to the ABI. We now allow creating
> memslots that don't have the VM_MTE_ALLOWED flag set. If the guest uses
> such a memslot with Allocation Tags, the kernel will generate -EFAULT.
> ie, instead of failing early, we now fail later during KVM_RUN.
> 
> This change is needed because, without it, users are not able to use MTE
> with VFIO passthrough (currently the mapping is either Device or
> NonCacheable for which tag access check is not applied.), as shown
> below (kvmtool VMM).
> 
> [  617.921030] vfio-pci 0000:01:00.0: resetting
> [  618.024719] vfio-pci 0000:01:00.0: reset done
>    Error: 0000:01:00.0: failed to register region with KVM
>    Warning: [0abc:aced] Error activating emulation for BAR 0
>    Error: 0000:01:00.0: failed to configure regions
>    Warning: Failed init: vfio__init
> 
>    Fatal: Initialisation failed
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Tested-by: Suzuki K Poulose <suzuki.poulose@arm.com>


