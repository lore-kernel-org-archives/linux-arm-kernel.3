Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE053606A941
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZmJx9b+n;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aZ/qKBhl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XtJiRyro5pp1Ubk31vh+uEkbIHM0qppKB9W3IOPNN0E=; b=ZmJx9b+nn9GqBU
	uSUv6oHcQPYRkdRvQUt6SaQCn19ZwcScisZwHoEIft+88syWQyO0E2xv+swEOqPgSsDQ/vk5T7GdD
	gdXgi4rAkqlhiwI4mb8vjlLVZnRagAkp5ox/xer8Dp9FxpGpLYAlDkFj2b8ZWHHPre3qD+meWQ7T7
	m9/cyDewmeF9usukMEghwXXCn+ZHBaDcb1S7yibZxMKtbHpklb0fFDeZ1jJSEc0h13wLRekP++3cx
	LcmtmKIKFxaj4k3EHpz+Qlzp1rBLl6sYuW20oAkq4Vpl54Cyx98PI6F/DcyY/cEaFH6YOZsiXvGqb
	+EuFNlSFmtghYVRWEgPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOABL-00000001cvv-3Sln;
	Tue, 03 Nov 2026 08:47:51 +0000
Received: from out-95.mta1.migadu.com ([95.215.58.95] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOABH-00000001csJ-3olY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:47:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=vxgqiZ0okcZF28/Y6ng3hoY+gPOQ7Ju8Td5h/EbU8As=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793695663; v=1; x=1794300463;
 b=aZ/qKBhlKEc2WXQLYiCL3Yy8XT146ylvR7IJx0CfEBuBYqUSNrxd51Y1kNTNkFqLB+dEug7G
 GdeizSkTbDL/1Uir2Qv+3/UnT/7NUSUiKeMUifbYjyK4dUGWycHEfs1k3Y4r40S9/l9OHOcFH9D
 n8N6xmgJo2YzgOI46a4gbYDM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d3cf5bf9ecc66116;
	Tue, 03 Nov 2026 08:47:43 +0000
X-Mizu-Trace-ID: d3cf5bf9ecc66116
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 2/3] KVM: arm64: Skip empty IPA ranges when destroying stage-2 page-tables
Date: Tue,  3 Nov 2026 08:47:41 +0000
Message-ID: <20261103084742.1302597-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103084742.1302597-1-fuad.tabba@linux.dev>
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_004748_098920_199E6810 
X-CRM114-Status: GOOD (  11.74  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The page-table walker steps over an empty entry in one go, but
kvm_stage2_destroy() starts a new walk for every block-sized chunk of
the IPA space. Tearing down a VM that requests a 52-bit IPA then takes
2^27 walks with 16K pages (2^22 with 4K), however little it maps.
crosvm requests the host's limit.

After destroying each chunk, look up the entry at its start and, if it
is empty and larger than a chunk, skip its whole range. The lookup reads
fields that hold the mapping tree on a pKVM stage-2, so this depends on
the previous patch keeping pKVM out of stage2_destroy_range(). For the
same reason, call kvm_pgtable_stage2_destroy_range() directly rather
than through KVM_PGT_FN().

Fixes: 4ddfab5436b69 ("KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/mmu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 42977cf8a7f5d..10b425a0141be 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1010,9 +1010,20 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
 	u64 next;
 
 	do {
+		kvm_pte_t pte;
+		s8 level;
+
 		next = stage2_range_addr_end(addr, end);
-		KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
-							     next - addr);
+		kvm_pgtable_stage2_destroy_range(pgt, addr, next - addr);
+
+		/*
+		 * The walk freed every table it emptied, so skipping an empty
+		 * entry here doesn't leave anything behind.
+		 */
+		if (!kvm_pgtable_get_leaf(pgt, addr, &pte, &level, 0) && !pte &&
+		    level < KVM_PGTABLE_MIN_BLOCK_LEVEL)
+			next = __stage2_range_addr_end(addr, end, kvm_granule_size(level));
+
 		if (next != end)
 			cond_resched();
 	} while (addr = next, addr != end);
-- 
2.47.3


