Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E5A606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pGXLc8hU;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Flo/2ayu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=df5TrPFMtBvFGTjaH34ST7iQ0OhTPo2jJsgen1vs+Qs=; b=pGXLc8hUv/n7W+TZJgHHCnWiD0
	rsWU3xKjVUfeYm7uAtyvZ6+8Q7diYvgxoP+xDxi3Qz7OoIr1imL3djPA7hEb4cBS3Hr1ThjsBKnfq
	R5s/HkPBCKc+fN9UFJCQgXGY5oIBQHxzsQpLxU5yjTCZe79FFmyFDpwC0A9oh1W9wYwjm7+V/Lycl
	628rPaZPJFYysHZdsiQDpjqsQCDnpsWmWHpd4mvzTQN1FujxwKZPRscTGsq0xo+F1kGj8d1YLW2cN
	fOzqxyoCIZt3hp3EkVQh4a2VIhCfPkxSKX2a6ryeVFH2qoPATfMpivuhfy3Q6RBP29BHVP6VXnSkk
	0Gx/a8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPK1B-0000000CRKE-1pSE;
	Fri, 06 Nov 2026 13:30:09 +0000
Received: from out-45.mta0.migadu.com ([2001:41d0:1004:224b::2d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPK17-0000000CRHZ-3lle
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 13:30:07 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=FqAM6Fc2AmJmQRAZs/TJExhLkKAHMxtjQF/1uSiqH6g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793971802; v=1; x=1794576602;
 b=Flo/2ayu0GO6SiNSeIQ/BUUmXhov4KUspoIMkXE4LDG8A7Zkoz48ez0dw9+l2lfhXsY0DrjS
 xwdIAhAZ8CnSOuPY6I6keCrOZ/g39+/qFlY4vDqAznPzu7b00BEoH6pNJEjttNDpo2Lb3elXHcb
 FfwC5WnrjqY/hjf4nDxX9Oko=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5bb1b36d23a37463;
	Fri, 06 Nov 2026 13:30:02 +0000
X-Mizu-Trace-ID: 5bb1b36d23a37463
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
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v3 0/2] KVM: arm64: Stop stage-2 teardown scaling with the IPA size
Date: Fri,  6 Nov 2026 13:29:58 +0000
Message-ID: <20261106133000.453240-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_053006_079169_83DA4070 
X-CRM114-Status: GOOD (  10.03  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Changes since v2 [1]:
  - Return a failed walk's error to the callers and warn there, instead
    of inside the walk. (Oliver)
  - Dropped the comment on the next-mapping lookup. (Vincent)
  - Collected Reviewed-by from Vincent on patch 2. (thanks!)

Two patches that make stage-2 teardown take time proportional to what
is mapped, rather than to the size of the IPA space as it has since
4ddfab5436b6.

Under QEMU TCG ('-cpu max', 16K pages with LPA2), destroying even an
empty VM takes about 7 seconds in pKVM. Without pKVM it takes about 19
seconds if the VM requests a 52-bit IPA (crosvm requests the host's
limit). With the series, both take well under a second. Tested only
under QEMU.

The first has the page-table walk return where it stopped, so that the
teardown steps over an invalid entry larger than a block-sized chunk in
one go. The second has pKVM return where its next mapping starts.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261104124451.2148724-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: Resume stage-2 teardown where the walk stopped
  KVM: arm64: Resume a pKVM stage-2 teardown at the next mapping

 arch/arm64/include/asm/kvm_pgtable.h |  8 ++++++--
 arch/arm64/include/asm/kvm_pkvm.h    |  4 ++--
 arch/arm64/kvm/hyp/pgtable.c         | 19 +++++++++++++++----
 arch/arm64/kvm/mmu.c                 |  6 ++++--
 arch/arm64/kvm/pkvm.c                | 11 ++++++++---
 5 files changed, 35 insertions(+), 13 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


