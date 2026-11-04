Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3DC606D809
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hkSlT+vx;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V3DZfkWI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UcjFubjphnzFpUpHrLLrETqweYn/e3Sdi2+JtZw/B0I=; b=hkSlT+vxC9b83fu7AmZb3Wo2Em
	ZQ2dQhbuGj8BoIMjNdCDt5FPa78BZZaVjt/UQ1cuh9hVIIGdt5RX4bEqbTTXX+WOURg1MA3YnN1eY
	ow54Ue33n3A8/KyokE1EkDSbPNfUZwrGsEzrDzp/U6QwaOmjXQnP/sIYQgksmCX4zwLjJfEoM8a06
	ZbRK5P+R+Azqx1YrDQgnvvpD5G8yMXdaYUPPowsELNjWm+/qX7IqLygdNGLie6Yg16vKc3X6JV0k1
	Z8cyynqAF1qG1dZ7oxKIvSceCqGZMEbURg7igNE8+FxAU1svUhe1vt/rEza/F0CtoJUTTIa5ZLfhQ
	BQzKPVtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaMO-00000005Mn1-0VON;
	Wed, 04 Nov 2026 12:45:00 +0000
Received: from out-134.mta1.migadu.com ([95.215.58.134] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaMI-00000005MkT-2ZjG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:44:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=pL42GIo48cBII9Atlc96cBdXylzrs2P95YUPiNb6rRA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793796292; v=1; x=1794401092;
 b=V3DZfkWIbPloGmUQ/qeDD6rSp4jbZu/KGxXnHYq7UlrPV5Q4kSA8MZgwpIxBJgOJpmBeDa4y
 X8nvMFn1i8Aq4TmsqVPbsGFEAoQps7HmWM1tssK1c3p+a+fLgUpBi8jVf4kPvtN532zQvP/1IfW
 8JSqa9IcrKA31EVmJscmC+Yo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d939a9b5ae201b1c;
	Wed, 04 Nov 2026 12:44:52 +0000
X-Mizu-Trace-ID: d939a9b5ae201b1c
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
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 0/2] KVM: arm64: Stop stage-2 teardown scaling with the IPA size
Date: Wed,  4 Nov 2026 12:44:49 +0000
Message-ID: <20261104124451.2148724-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_044456_925286_9ADC8496 
X-CRM114-Status: GOOD (  10.61  )
X-Spam-Score: -2.8 (--)
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

Changes since v1 [1]:
  - Run all teardown from stage2_destroy_range() (Oliver, Suzuki)
  - Dropped the Fixes tags (Marc)
  - Dropped the patch moving the teardown into kvm_vm_s2_ops
  - Use gfn_to_gpa() for a mapping's address. (Vincent)

Two patches that make stage-2 teardown take time proportional to what
is mapped, rather than to the size of the IPA space as it has since
4ddfab5436b6.

Under QEMU TCG ('-cpu max', 16K pages with LPA2), destroying even an
empty VM takes about 7 seconds in pKVM. Without pKVM it takes about 19
seconds if the VM requests a 52-bit IPA (crosvm requests the host's
limit). With the series, both take well under a second. I tested only
under QEMU, since I don't have hardware with LPA2.

The first has the page-table walk return where it stopped, so that the
teardown steps over an invalid entry larger than a block-sized chunk in
one go. The second has pKVM return where its next mapping starts.

pKVM gives every VM the host's IPA limit. My series honoring
KVM_VM_TYPE_ARM_IPA_SIZE in pKVM [2] doesn't change that for crosvm,
which requests the limit.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261103084742.1302597-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20260917091826.2639205-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: Resume stage-2 teardown where the walk stopped
  KVM: arm64: Resume a pKVM stage-2 teardown at the next mapping

 arch/arm64/include/asm/kvm_pgtable.h |  8 ++++++--
 arch/arm64/include/asm/kvm_pkvm.h    |  4 ++--
 arch/arm64/kvm/hyp/pgtable.c         | 15 ++++++++++++---
 arch/arm64/kvm/mmu.c                 |  4 ++--
 arch/arm64/kvm/pkvm.c                | 12 +++++++++---
 5 files changed, 31 insertions(+), 12 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


