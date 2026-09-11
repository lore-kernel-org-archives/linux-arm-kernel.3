Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A92BC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUSxJtPocI3fmSocLuQkJuxF7rn1nWn1kKyeaiut3ts=; b=sq2R+rMrJ3C+OIAeFTiPbb6Bib
	zXwP5MWCy1pwc8iQSmC8FTY28a0MyucydlogksqTMKyICUS+M8/K4oEg198jrnussnbUKJsDcK/PF
	unD/zVxW36hqGe99i1+LmlRBcCWzadWjx+3Z5K8+tkvTKmcnymYkT3n0k8q48dLG/wjZERV1vTW52
	ovW3/m3Ns4rCpL84erk1EJ+HXc90haBOfSyHeQb8pzw6rx4MXT+qll5jD2T/vsgsMX16g7fvRkwon
	By8qtMrSJHY71mGH4nal5uMlQs0Z7f2/khf2fdhqoVcZ9GRViE6qWAbjEFHvYGMR7Bn642Rfl5/en
	B46TBi2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x517I-0000000Givq-0ClW;
	Fri, 11 Sep 2026 13:16:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x517E-0000000Gius-1hlu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:16:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E92EF1655;
	Fri, 11 Sep 2026 06:16:23 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB89C3F59E;
	Fri, 11 Sep 2026 06:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789132587; bh=rAPjrIWKifje2rtdcSgWJSLMEJH9EivwHOgVHlZZ3dE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r0tu6ZAf4lq5MRFWS31tTOfRDtHvinmOQ29Vtb1/B0tftDLqhhW9HxUovv78dAyTZ
	 HTwUhytsEIBHJGdWEgSNtLuAg6dikEXWnoGt77bmZGNluHbmTQHaLcOfbz4uZgX7+5
	 D3tOkF0c+Au2ERScqBpcT3/fF96wVnhS+IuQXLTg=
Date: Fri, 11 Sep 2026 14:16:18 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Itaru Kitayama <itaru.kitayama@fujitsu.com>
Subject: Re: [PATCH v5 0/6] KVM: arm64: nv: Implement nested stage-2 reverse
 map (new data structure)
Message-ID: <gerjpm62a2gszzggc6vuai22bf3prfquvfsp7ueumps7vz2ev3@odlmovaklg2b>
References: <20260810205038.118843-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810205038.118843-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_061629_057847_75F2054A 
X-CRM114-Status: GOOD (  11.98  )
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

On Mon, Aug 10, 2026 at 09:50:32PM +0100, Wei-Lin Chang wrote:
> Hi,
> 
> This is v5 of optimizing the shadow s2 mmu unmapping during MMU
> notifiers.

I did a more targetted test of this series in a (ad-hoc) way similar to
pkvm_ownership_selftest(). I allocated and initialized an in kernel VM,
its locks, 2 nested_mmus, and a memcache.

By calling kvm_pgtable_stage2_map(), kvm_record_guest_s2_mapping()
together I create mappings and track them, then
kvm_nested_unmap_cipa_range() simulates mmu notifier unmaps, and
kvm_stage2_unmap_range() simulates L1 TLBIs.

Combining these I tried a few scenarios:

1. Mapping the same CIPA in two nested mmus, and checked that
   unmapping the CIPA it removes both mappings, but keeps unrelated
   mappings.

2. Mapping a block and a page to an overlapping CIPA region, checked
   that unmapping the overlapping CIPA regions removes both mappings.

3. Unmapping CIPA of the last page of a block, checking that the block
   is removed, but keeps unrelated mappings.

4. Unmapping a CIPA range that starts in an empty region, checking that
   it finds and removes the mappings inside the range, keeps unrelated
   mappings.

5. First map NIPA -> CIPA1, unmap that NIPA, then create NIPA -> CIPA2,
   and check that unmapping the CIPA1 leaves the new mapping alone.

6. Creating multiple identical mappings, and checked unmapping the
   CIPA once removes the mapping.

The dumped shadow page tables all contain the expected mappings.

Thanks,
Wei-Lin Chang

[...]

