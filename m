Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC6E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3CJiuDfB;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cc641w2U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2bC/tKvsMyQSFyWd/4grWajRGenpXtC7/e5rOkNlwlE=; b=3CJiuDfB4i/G5E5ZMZos7yn4Nl
	1dOP9VLEWQeNadjB7Myqcx3/aeufB60NQQxw+/3MU3XK/Oop8xPvm8sPeaih3MAnZmSLAe/Nhn0w3
	GWawIZXHLwyOcT5xYmuD1CJJnbf9tbpbwz0A5FaRvZYwnjQnVlIf9qZA+6/SzVGbueGA3i4XyVZ1K
	x6Yrdy6q+bcPJG7PydhDg6X0r/6EevdzSNWPmvJtqHiFERPgPTFs0Otp8lkwaI85B0yN72VIc0Oxp
	LTc/1AOXVGqorfHyIqb3NRuT1IHHYuZBZU4q5raTeZQZj6pwN5VfW/oXgsbOzRMrZkVxDXWS+KKe+
	8QtDLMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLwQ-00000002gpa-2jyB;
	Mon, 26 Oct 2026 14:44:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLwM-00000002gnZ-46Gi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:44:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D1F415A1;
	Mon, 26 Oct 2026 07:44:38 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 932E83F7B4;
	Mon, 26 Oct 2026 07:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793025881; bh=cXwGQ1sgxxKZyhdDrXpdQtNttNvD0RVFexoJ9R9VXl8=;
	h=From:To:Cc:Subject:Date:From;
	b=cc641w2UwlCKZjaZ6pVm4urYV48alptH2J9aWv5cKo5Wo1XqBvDykrSj2aRAF1H9i
	 5sGR5B/F9mKusRhXjgKIwz+SfGLvQJp9Dzctg82Pwl7Yp9JDNQ3UD0zpTgP0sbOIKI
	 y/kJZBx0ZBNZF5QpiXnZvHAD6GEi0iCyS14f6D4k=
From: Leonardo Bras <leo.bras@arm.com>
To: Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/3] Set DBM bit on writable pages
Date: Mon, 26 Oct 2026 14:44:06 +0000
Message-ID: <20261026144413.441566-1-leo.bras@arm.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2136; i=leo.bras@arm.com; h=from:subject; bh=cXwGQ1sgxxKZyhdDrXpdQtNttNvD0RVFexoJ9R9VXl8=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLLupxsaJqiuV//2b+8U5p99kl2hzS61uzMNn29+8EIr9 PfZwLlhHaUsDGJcDLJiiiyyj+av4vk+JePIlR8LYOawMoEMYeDiFICJ/F7IyDDpjlbE/mvLLW3a F9sVzTFn1cmZdlVw/gepVAshs0UTFu5jZFjdof9mzTn9Loub/25bWaR+uPTkvOrnlX+bt+6J8NG de4MLAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_074447_102795_AFEF4BE7 
X-CRM114-Status: GOOD (  14.32  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When HAFDBS is enabled (VTCR_EL2.{HA,HD}={1,1}), having a DBM bit allows 
hardware to promote a non-writable page to writable by setting (S2AP[1]=1),
without having to take a fault.

The reason for this patchset is to add the DBM bit when setting-up writable 
pages, so the code is prepared for future patches that make use of 
HDBSS/HACDBS to accelerate dirty-tracking. Write-bit detection still 
happens based only in S2AP[1], so no change in that aspect.

Having DBM set on block entries is undesired, as we benefit from the first 
fault for splitting it in PAGE_SIZE entries, which is the granularity used 
to track the dirty pages in KVM. So introduce a new walker that, on top of 
clearing S2AP[1] for every entry, also clear DBM for block entries.

Also introduce a new VCPU request to reload Stage2, as it will be needed on 
future HDBSS/HAFDBS patchsets. 

Please let me know of what do you think!

Changes since RFCv1:
- Dropped patch #5 on enabling HAFDBS on non-dirty-tracking guests, as it 
  proved to be counter-productive on wrprotect, contrary to expectations
- No more moving writable-bit to DBM. That does not seem to be the intended 
  use. It makes sense and it's easier to convert code to new DBM approach.
- No new PROT_DIRTY, so drop patch #2
- Tried adding a PROT_DBM, but does not seem necessary to fault a page as 
  writable-clean. 
- KVM_REQ_RELOAD_STAGE2 now depends on VHE, as it already reloads Stage2 on 
  guest entry otherwise. 
Link: https://lore.kernel.org/all/20260901171558.2674031-1-leo.bras@arm.com/

Thanks!
Leo

Leonardo Bras (3):
  KVM: arm64: pgtables: Set DBM attribute on writable Stage-2 PTEs
  KVM: arm64: Introduce a dedicated walker for stage2 write-protect
  KVM: arm64: Add KVM_REQ_RELOAD_STAGE2

 arch/arm64/include/asm/kvm_host.h    |  2 ++
 arch/arm64/include/asm/kvm_pgtable.h |  3 +++
 arch/arm64/kvm/arm.c                 | 10 ++++++++++
 arch/arm64/kvm/hyp/pgtable.c         | 30 ++++++++++++++++++++++------
 4 files changed, 39 insertions(+), 6 deletions(-)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.56.0


