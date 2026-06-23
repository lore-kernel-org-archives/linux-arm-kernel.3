Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13705CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 19:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RChInjm+nWyVKGXO+685PTvBLIJb+A7HVHd2yzP8uK0=; b=dpqfKkDgybalugkPGuPqErUyqt
	IggJ2Gc1Ztg5/KSl9oOFsVjgH9dkLNHBKAch4ceS2MJBFMmcxAGURvu4qlx3ZZOSqf/zo5zuuwmHn
	fXEN8f08j0eDLbgiUCQfHpPisEmVu0ghFqUKB9ea2jWktDECN9XK97a5izNTs1MJGynKGXypLmwfU
	HzX3hNuQBnHe0gcsdM4ZuntATE/wav4monQTkH2zRtEgItVAfVXXcBYrFF6sa0Xsog9P93jr2tVU7
	5t7lWDC7DuY4V+PvALSl9Enyj5VFpHTKWdM2OKzBhfMWRyuYSvfjmRNxb5McTsuUwJ+QZC1h8gpoU
	uVbcuu8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7EZ-00000006oHC-2QCz;
	Tue, 23 Jun 2026 19:56:35 +0000
Received: from confino.investici.org ([2a11:7980:1::2:0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7EV-00000006oG4-2tyS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 19:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782244587;
	bh=RChInjm+nWyVKGXO+685PTvBLIJb+A7HVHd2yzP8uK0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=a5e2Xxlxl5qmkQ5VwXVRiczuK8Gb3nzAFcO4LEOZygqP+qpkAU/d6QumFBVoV5e8/
	 3gZoh2j7ba3FNeEnwBJn421EfXTkB5TKGnVzSi+140d22onj9X5+rN104Y0sSPnTQU
	 BFlIeGt3bWxlybGxvsuI84DgPVIpdcKfzQorP2nc=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4glG6M10V9z110m;
	Tue, 23 Jun 2026 19:56:27 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4glG6L5SR3z10vW;
	Tue, 23 Jun 2026 19:56:26 +0000 (UTC)
Date: Tue, 23 Jun 2026 20:56:27 +0100
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>
CC: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev,
 Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Quentin Perret <qperret@google.com>,
 Vincent Donnefort <vdonnefort@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_KVM=3A_arm64=3A_skip_pKVM?=
 =?US-ASCII?Q?_cache_flushes_for_non_cacheable_mappings?=
In-Reply-To: <95A8722F-D486-4030-BA51-9117434C6E63@grrlz.net>
References: <20260623160339.15143-1-include@grrlz.net> <20260623163756.4591-1-include@grrlz.net> <86qzlxqjf3.wl-maz@kernel.org> <5925B41F-0F57-4BCB-9F93-7600878ECA27@grrlz.net> <86pl1hqiwj.wl-maz@kernel.org> <95A8722F-D486-4030-BA51-9117434C6E63@grrlz.net>
Message-ID: <B6379439-829E-403B-845B-2259A28526A5@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_125632_160184_1D522AA1 
X-CRM114-Status: GOOD (  13.50  )
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

On June 23, 2026 7:51:05 PM GMT+01:00, Bradley Morgan <include@grrlz.net>
wrote:
>On June 23, 2026 6:13:48 PM GMT+01:00, Marc Zyngier <maz@kernel.org>
>wrote:
>>On Tue, 23 Jun 2026 18:04:07 +0100,
>>Bradley Morgan <include@grrlz.net> wrote:
>>> 
>>> I'll go and do V3 with another sashiko suggestion. I'll fix your path
>>too.
>>
>>Before you do that, please verify that whatever Sashiko spits out
>>makes any sense. I'm not convinced by its reply on v1 at all.
>>
>>	M.
>>
>>
>
>Marc, 
>
>hi, I have verified sashikos concern.
>
>I am out right now. So I will give a very short result.
>
>
>Sashiko is being bit dramatic with the whole "Critical" rating, but it
>is real in another way
>
>
>I'll explain it in the code in about 30-40 mins.
>
>Thanks!


hey, I'm back now. Let me explain

For the dirty logging report, I agree the bot's wording was not the
greatest..


The issue is not best described as a *guaranteed* -ENOMEM guest abort.

The actual failure path seems to be:


user_mem_abort() skips topup_mmu_memcache() for permission faults,
unless dirty logging is active and
kvm_is_write_fault() is true.

For an instruction permission fault, kvm_is_write_fault() is false.

Dirty logging makes kvm_s2_resolve_vma_size() force max_map_size to
PAGE_SIZE.


If the existing stage 2 entry is *still* a PMD, then kvm_s2_fault_map()
has mapping_size == PAGE_SIZE but perm_fault_granule == PMD_SIZE, so
it calls kvm_pgtable_stage2_map() instead of relax_perms().

The generic stage 2 walker then needs a page table page to split the
PMD in stage2_map_walk_leaf().

So the real issue is that this path can enter the split path without
having topped up the memcache. Eager splitting does not make it
impossible....
since it is best effort and the default split chunk size is 0.


About the V3, I won't send the V3 yet. Until more people review / or 
it's been a few days

Thanks!

