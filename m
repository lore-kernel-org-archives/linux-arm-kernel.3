Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71A1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W+3je/J9;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Lvj66Pft
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kxE4A0VSnxahND1X2MPTQwXDknQ6I/xJGaQ331/gno0=; b=W+3je/J9zfVu2q
	JpfGFBeCm3TvLkly6OcUjofEK1TEUFA7zeyMveJRg0GVIv3vb2HQUU5EMQ6XRTrV+1OsLM/1ju9+I
	qAXzB4EOMe+4JLlnLyHS66KZFlMNUOYPFc96BsYK2OG+EDc/o9yS+UXM4auZiRuDVXmfCO80d9Zsl
	z+mBmTI/5CgENq/JWa9DLCM5dJsC5tvhCT7yarDrFetOj8ZNZ+xV/elFv3kioB6qxrJ/ZeqYVITRh
	hTKMlKSWRt9emFLL/qqi6rAqF4ApV/gH4q9Bsdm2Li4/1wyhbBIzsdGC1tAVHk10hZZtcAOOReeZO
	fp6G5zynd03vcV5IyBug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLwc-00000002gtE-09qZ;
	Mon, 26 Oct 2026 14:45:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLLwP-00000002gp4-1k42
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:44:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52B4C2944;
	Mon, 26 Oct 2026 07:44:45 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 799A23F7B4;
	Mon, 26 Oct 2026 07:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793025888; bh=OkxornoEoZZzTD9JkMHL7VjKUUICLPzAPrCszeD7jDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lvj66Pft/b5dAog1VNhauP81Y+dBkss0Lvw+CzO+pCycppBi5sy4gTTaBlqAGbn8u
	 3oInMG+TTxS4/aDUJXK+N/RnL8/3ov8j/t2yr5FX+MzGXIcqj56kBmsQPWH5BRfraV
	 QdwjMZGTefzsx9bywG/PhA++h1lgFKnKfcpTRPmU=
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
Subject: [RFC PATCH v2 3/3] KVM: arm64: Add KVM_REQ_RELOAD_STAGE2
Date: Mon, 26 Oct 2026 14:44:09 +0000
Message-ID: <20261026144413.441566-4-leo.bras@arm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026144413.441566-1-leo.bras@arm.com>
References: <20261026144413.441566-1-leo.bras@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1971; i=leo.bras@arm.com; h=from:subject; bh=OkxornoEoZZzTD9JkMHL7VjKUUICLPzAPrCszeD7jDM=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLLup1swN6SWyZ98NceO75vTdPtfvz9p/dwxSSRZdtGCH 2ZfJE8Hd5SyMIhxMciKKbLIPpq/iuf7lIwjV34sgJnDygQyhIGLUwAmIqzOyNBscHTbxGOu4U5b BbJWWE9PfGV07GlN4NvFtb2H7aV8WVIZGY4JyLM7Xr3/RH3p/7cpE/Rz7wvq3Vvn/lptt8C3Hay bXrAAAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_074449_536087_61C30E2C 
X-CRM114-Status: GOOD (  13.23  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a vcpu request to exit guest, reload Stage2, and then come back to
guest.

This will be used on future patches that enable HDBSS, as they may need to
change VTCR bits for enabling/disabling the feature when the vcpus are
still running.

On non-VHE systems, just skip this request as Stage2 is being reloaded
on every guest entry.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/arm.c              | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index cd9b9d2462f9..86a4d6e50934 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -53,10 +53,12 @@
 #define KVM_REQ_RESYNC_PMU_EL0		KVM_ARCH_REQ(7)
 #define KVM_REQ_NESTED_S2_UNMAP		KVM_ARCH_REQ(8)
 #define KVM_REQ_GUEST_HYP_IRQ_PENDING	KVM_ARCH_REQ(9)
 #define KVM_REQ_MAP_L1_VNCR_EL2		KVM_ARCH_REQ(10)
 #define KVM_REQ_VGIC_PROCESS_UPDATE	KVM_ARCH_REQ(11)
+#define KVM_REQ_RELOAD_STAGE2 \
+	KVM_ARCH_REQ_FLAGS(12, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 
 #define KVM_DIRTY_LOG_MANUAL_CAPS   (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | \
 				     KVM_DIRTY_LOG_INITIALLY_SET)
 
 #define KVM_HAVE_MMU_RWLOCK
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 0576c2022ef5..d311637e0b13 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1173,10 +1173,20 @@ static int check_vcpu_requests(struct kvm_vcpu *vcpu)
 			return kvm_vcpu_suspend(vcpu);
 
 		if (kvm_dirty_ring_check_request(vcpu))
 			return 0;
 
+		/* Non-vhe systems already reload Stage2 on guest entry */
+		if (kvm_check_request(KVM_REQ_RELOAD_STAGE2, vcpu) &&
+		    has_vhe()) {
+			unsigned long flags;
+
+			local_irq_save(flags);
+			__load_stage2(vcpu->arch.hw_mmu);
+			local_irq_restore(flags);
+		}
+
 		check_nested_vcpu_requests(vcpu);
 	}
 
 	return 1;
 }
-- 
2.56.0


