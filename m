Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DA4C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8+lHjdE+3DloA2hsk7g0E45gyAxlw5fhHa47aoUOQ2E=; b=FhMlcbYH3hZh5d7m51h07TeNmj
	uQ140gZHioIv8+kvtt/nUHKDcYD/j8rc2H0ZgDmJzAzXP/7FrfiiuClBif88F/fBP1+V3VlNzwof7
	R+l8iTHFU4MyqIPTKqS0sXHgyEBi6xBlrK4r0YOm1VFKAOHKlcUQmB71SPtv8dmgoyAtdhExGO7Mn
	iMvs2lT86cqE8VZC/HeiRRehUeB1GCybzUKIy3VKdkdGSbDVXjFBLCTSW7ME4PLQ8dLKvzZysFgxh
	Z4nCokuoVUTKVhswo+G3+2PYTFwEOXTnRHDNjOAqfDKU9ucNWXDIoeStwaN7urhtxo+Zsqb6Xo1lC
	rmUrk/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmy3J-0000000Esd3-3Ukr;
	Thu, 23 Jul 2026 18:21:49 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmy3H-0000000EscU-29Zr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 18:21:48 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-47f753a0aa0so536282f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 11:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784830905; x=1785435705; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8+lHjdE+3DloA2hsk7g0E45gyAxlw5fhHa47aoUOQ2E=;
        b=cefKzv5dapLYNZBjssmz78vv7ze03HHHUn0Qp9xWgvGABetINadr2sn0PvHsS4q3dQ
         fL9k86ng7HXRIHaDktkKhKY5X6YRFjKgqbGQCesqjHsmCIHuDfD8ox3ar1M7AY8pU9zX
         rMrVvG5RGedxw/XVCQV8cfvTK0lifzABE4bPaGXGERRwBD9yqKVFHBqx/DgpnVBjuqfR
         rTWpDioXXPM8R/aYVPVqeqvDkF2PX2veHaJu95T/1aMnIodvHoHq2gveAZJeyKh5Hy8z
         0Fk+ak14h/hpeXsg1ZNuQyX0THeGzbFVK+RCn8B8Kb8j25zEpdMwhma2U4pYCk7fneAJ
         /QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784830905; x=1785435705;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+lHjdE+3DloA2hsk7g0E45gyAxlw5fhHa47aoUOQ2E=;
        b=TAf93szWN1jmCyI2YoTaQmnirZQ6FiZR/JQxTg3Z2kVGrvZlnRfrCpD0/qwlbr77Ww
         c+9MRYYHwnKz14C/A1AjzJagzLkZyzYBynXf8HBUopK9mkYMl1KVb+7tK3UQW5XxMCOG
         eE+7k2GYJdwG3DnxHaw/jnLZPLdMJ0UR1a/cpJApRPDJ8RekE3PzFo799Pohix1ooAVg
         t4wJ0W9CCFptmkvXyA87p7HwNUxI8NIbJ6REjzLQrweMsUoe7m1dDib4WrHd8u30NFAv
         6U3iKmH0DGfGQw3vOhcR4Xvd0MrKBkCX3lz6NKvY64FTHe7SU8wr3Fdr4ay+bSvgVIve
         N5Yg==
X-Forwarded-Encrypted: i=1; AHgh+Rq00K91Hj0ZYGOivy7LgSdXC8Jb3JoDIh82CCn0pwbWnKQMm4TuWVEqDM9VmDUoci64DqriwieSdpkb7cEz4cWL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2/BCAPayytxYjBF4gETzb9NMfibgJUmJsyQhev9nVOnflDA5e
	jZ9hchiwfOEWZgBWZY7kZ85GkQoZ4aS1Ro/KzW6sRMo+o28UZVsRD3DuWPdI8FKj/qN/1LEh2cF
	tNumvMczJM+spRw==
X-Received: from wrbdv10.prod.google.com ([2002:a05:6000:d8a:b0:47f:501a:8813])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2011:b0:46f:7d90:8121 with SMTP id ffacd0b85a97d-47f8d71c689mr5489116f8f.14.1784830904536;
 Thu, 23 Jul 2026 11:21:44 -0700 (PDT)
Date: Thu, 23 Jul 2026 18:21:38 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260723182140.4025575-1-smostafa@google.com>
Subject: [RFC PATCH v2 0/2] KVM: arm64: Add support for BBM level 3
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	linu.cherian@arm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_112147_571686_F9D8158C 
X-CRM114-Status: GOOD (  22.80  )
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

This patch series adds support for BBM level 3 to KVM pgtable, it
depends on [1]

Changes from v1:
https://lore.kernel.org/all/20260717130901.2239134-1-smostafa@google.com/
- Limit BBML3 to systems with FWB and DIC and remove race check.

Motivation
==========
I have been looking into this for the context of:
- Page table sharing between the host CPU stage-2 and the SMMUv3 for
  protected KVM.
- Use the pagtable code to populate SMMUv3 stage-2 shadowed
  page table [2]

However, BBM level 3 is still useful for CPU only operations as it
avoids intermediately breaking translation.

Design
======
Some of the conditions that BBM level 3 will be useful in (RWHZWS):
1) A change to a PTE memory type, shareability, cacheability or OA
2) Changing from block to table
3) Changing from table to block

At the moment in the hyp page table code:
- For #1) stage2_map_walker_try_leaf(): Replaces a leaf with another
  one which does not match the same OA/perms/attrs.

- For #2) Switch block to table is used from:
  - kvm_pgtable_stage2_split(): Explicitly splitting a block (used
    for dirty logging), where a block is replaced by a table with
    the same attributes.
  - stage2_map_walk_leaf(): Updating a mapping that is partially
    part of an existing block.

- #3) Does not exist in the code at the moment as coalescing is not
  supported.

The first patch is a preparation to be able to clean up the old pte
for BBML3, the second patch adds the main logic.

Initially, I encapsulated the full logic of BBM in one function,
which was not readable, due to different ordering and dealing with
CMO, TLBI.

Instead, I kept the logic into 2 functions, where BBML3 is added in
the make step.

One interesting case, as BBML3 will update the PTE atomically, it
can only know it raced with another core at the point of the cmpxchg
failing, unlike the SW implementation which locks the PTE first.
And as we must issue CMOs to the new mapped page before the update,
that means with BBML3 racing cores will issue redundant CMOs, to
avoid this, we limit the use of BBML3 to systems with FWB and DIC.

Testing
=======
This was tested:
- C1-Pro cores, unfortunately the version I have does not run
  upstream, I backported the patches to Android kernel (6.18).

- mainline(7.2-rc3) kernel on a Qualcomm X1 with a hacked cpufeature
  as it does not support BBM, I did not see conflict aborts or TLB
  corruption.

I tested with VHE and protected (hvhe) modes, running VMs
(and protected), and running some selftests, that might exercise and
stress this path tools/testing/selftests/kvm:
- demand_paging_test
- memslot_perf_test
- memslot_modification_stress_test
- dirty_log_test

Future work
===========
Some other changes that would be useful:
- Eagerly install table on block split, we can now replace a block
  with a fully populated table atomically when we unmap a partial
  part of the block.

- Use BBML3 in the hypervisor stage-1 with nvhe/protected mode to
  improve preformance and reduce memory usage as now it is forced
  to use leaf mappings.

There is more to support page table sharing (such as dealing with
TLB invalidation, coherency...), I submitted a talk to LPC to discuss
this further.

[1] https://lore.kernel.org/all/20260723044034.2983651-1-linu.cherian@arm.com/
[2] https://lore.kernel.org/linux-iommu/20260715115906.2664882-1-smostafa@google.com/

Mostafa Saleh (2):
  KVM: arm64: Add stage2_clean_old_pte()
  KVM: arm64: Support BBM level 3

 arch/arm64/kvm/hyp/pgtable.c | 123 +++++++++++++++++++++++++----------
 1 file changed, 87 insertions(+), 36 deletions(-)

-- 
2.55.0.229.g6434b31f56-goog


