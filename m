Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC12606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iSAo7Yvn;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p/wfeKAm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7OZDcry484hFtiEDsHMeu9Vb1PBCwc08Fystmbso2yg=; b=iSAo7YvnrXeY9qC6rCT4yBRVC8
	ntqOF2sH4TvZj8REmjiSgvFlOfuWDtfvuQVvQv7yR/rOHcDjRZdQK42mZyOalgGu0RO7gCn1n7CMk
	HyC6yoNIstIczZFa0IabY5zzkD0ksc2KTL+cIsXZSOT9QDZmGIJOECvfJR6pm6M2qV20cZyHezC5A
	xRVeLjz8ppyBmw+UJkG2VmV5mG3ExMYXOq5BqKrwbYFpDSWsUHuamlsdKOr30TJt8TRw6WXvVJ/Nn
	zFr8idmPJm4jJEtyzLehO0S3oGoOp5LQntpy65d+wm0aHQFSEVC7HKdAd+TinMwcIY6Ff2KMUHXq3
	yqyAXq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOABK-00000001cuX-2Gib;
	Tue, 03 Nov 2026 08:47:50 +0000
Received: from out-244.mta0.migadu.com ([2001:41d0:1004:224b::f4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOABH-00000001cs1-3fP3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:47:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Sc7XzR1F0B2mglhUJrIyIo1lpOjbjlFeRWehGGCyC88=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793695662; v=1; x=1794300462;
 b=p/wfeKAmmURwMhMhocRJeQ7uKxogG77Ispk7mg+UEZOnmn8QtA/lBWL5HsBcpt/iLkR7+Oxv
 x5D2mxHYyPkrh3lktlWaZ0HDSo8KzZg+7gY9/hT69mTNJuXqcP71zx27m0sxT+xGbVS12d57UzW
 wmaP1iey/2yJr/TEsEhbdVDg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id af8506901e183db4;
	Tue, 03 Nov 2026 08:47:42 +0000
X-Mizu-Trace-ID: af8506901e183db4
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
Subject: [PATCH 0/3] KVM: arm64: Stop stage-2 teardown scaling with the IPA size
Date: Tue,  3 Nov 2026 08:47:39 +0000
Message-ID: <20261103084742.1302597-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_004748_052196_8FB3E7B2 
X-CRM114-Status: GOOD (  11.11  )
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

Two fixes for stage-2 teardown, which since 4ddfab5436b6 takes time
proportional to the size of the IPA space rather than to what is mapped.

Under QEMU TCG ('-cpu max', 16K pages with LPA2), destroying even an
empty VM takes about 7 seconds in pKVM. Without pKVM it takes about 19
seconds if the VM requests a 52-bit IPA (crosvm requests the host's
limit). I would expect it to scale the same way in hardware. I tested
only under QEMU, since I don't have hardware with LPA2.

pKVM gives every VM the host's IPA limit. The first makes it release the
VM's mappings from its tree instead of walking that space. My series
honoring KVM_VM_TYPE_ARM_IPA_SIZE in pKVM [1] (respinning it soon)
doesn't replace the fix, as crosvm requests the limit there too.

The second makes the non-pKVM teardown step over an empty entry larger
than the largest block in one go, rather than start a new walk for each
block-sized chunk of it. It depends on the first, as the lookup it adds
reads fields that hold the mapping tree on a pKVM stage-2.

The third moves the pKVM/non-pKVM split in the teardown into
kvm_vm_s2_ops, with no functional change. The first two apply back to
7.1, except that a backport of the second drops the flags argument 7.4
added to kvm_pgtable_get_leaf().

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260917091826.2639205-1-fuad.tabba@linux.dev/

Fuad Tabba (3):
  KVM: arm64: Don't walk the whole IPA space when destroying a pKVM
    stage-2
  KVM: arm64: Skip empty IPA ranges when destroying stage-2 page-tables
  KVM: arm64: Move stage-2 teardown into kvm_vm_s2_ops

 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/mmu.c              | 34 +++++++++++++++++++++++--------
 arch/arm64/kvm/pkvm.c             | 17 ++++++++++++----
 3 files changed, 41 insertions(+), 12 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


