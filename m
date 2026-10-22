Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE053606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wWUiCc7I;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RibjKLMp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=R1+QFn5NnYJLRrxfa1xiHyuj6P1mZ5EIMR+tXbGhrSo=; b=wWUiCc7Iq+APATNaIg9YGdxOxQ
	J6rwNFCJ0PhXslR4hZ8TvpmroUoyQqD6ZdK+OJu39s9PEgm5tifcekQOMFis2JLdhHARCe8fs7AhU
	C/dCuiR4jvE8ClrYJHNXMnO/ww0bjFbY9h77l8U28w+A1iqJzR194rzZBBBeF5QtlxHfLmzIxBvY2
	cec0GPGy08w8W9SQQEzkeiXE/kMSnIlF60GJmeQTpzsXSuUu0NRzObgluc+6qIRukTYdQiaBIZ1AJ
	GQyYFr0jrSAygxGY/jYars8gnJlp/GbW/SkRXUd4+jiEtVMbmqcre+Snp9bPA7ZX1/XOkBjQmyRkH
	gD/rf2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrwj-0000000E4eN-38Gu;
	Thu, 22 Oct 2026 12:31:01 +0000
Received: from out-228.mta1.migadu.com ([2001:41d0:203:375::e4] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrwg-0000000E4e1-1ptv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 12:30:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=bcEFyXLNNN2YEegylVTbpISQSLNIpIMitdaFQngWC1c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792672255; v=1; x=1793277055;
 b=RibjKLMp1n3ImBy3u6tyijm3geFzYvJ5rk0k8oclP0bj76BxzncTVzWxtaUScOqFBlvBoXUL
 c8EzmRaZOrjOdUVHMKE6LxC1sp71MJ6uGO13JW6XXuKjcXHaq2fOFbtiFveS74ySqhve0uBxgV1
 qyUJHoTqGYF7SGlcgNl2BGno=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 679f88ca96f9b2a8;
	Thu, 22 Oct 2026 12:30:55 +0000
X-Mizu-Trace-ID: 679f88ca96f9b2a8
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH] KVM: arm64: Return on kvm_gmem_get_pfn() failure in gmem_abort()
Date: Thu, 22 Oct 2026 13:30:54 +0100
Message-ID: <20261022123054.31729-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_053058_637991_57EE1114 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

The kvm-arm64/mmu-fixes-7.4 merge dropped the return from the
kvm_gmem_get_pfn() error path in gmem_abort(). Both parents of the
merge keep that return. On a failed kvm_gmem_get_pfn(), gmem_abort()
then carries on with a zero pfn, and on a nested stage-2 it uses the
mapping it has just freed.

Restore the return.

Fixes: 65f95b2874a15 ("Merge branch kvm-arm64/mmu-fixes-7.4 into kvmarm-master/next")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    I went through the rest of the merge's conflict resolution with
    git show --remerge-diff, and this is the only line it dropped.

 arch/arm64/kvm/mmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a48f3f531e827..ba4fe58222ad5 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1802,6 +1802,7 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
 						      s2vi.vma_pagesize, write_fault, exec_fault,
 						      false);
 		kfree(mapping);
+		return ret;
 	}
 
 	if (!(s2fd->memslot->flags & KVM_MEM_READONLY))
-- 
2.47.3


