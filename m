Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3602F606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LQlGxVYP;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jlPxDJfT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PssXTR1GZrsqtEK7C6unt3X/SPdoffa44UYfSuTum6E=; b=LQlGxVYPIlwtWa
	JWOT93Ck5IyklpHy+4el5Wq3S6ymI1qGyA8tr8QkKrJUVrrEvERvY11pSAeiN23uoZ7gF+mpidwnQ
	/jwnN8X5tjoKf6bP1cxkl/C1AXfLfqrnzkGt02KVmWB4ifEk2ZRhSYwaJPUg1jK48DwsKgpv2gn6d
	K+LunjTsyQxTLMj54B1in9YXnE3Yz7rtZCn66/qgBxcg6UDYkuRacSXcj1RhvuZ2kOUhG6WmjjVry
	2z1SbutmXXrExpIjWaTFU/aCFtL71FXHzfUSUSSgRuVmASPAOejzdADx47TxICmOtTMMAprKpQoDC
	nq9PrMl3t07oCVZeTNVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrg9-0000000GXzy-2U8R;
	Mon, 02 Nov 2026 13:02:25 +0000
Received: from out-217.mta1.migadu.com ([95.215.58.217] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrg5-0000000GXvY-4AzP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:02:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=j0NbCmVOZODkpnuzQJFxfbpF22caqI/A/jhViukqerg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793624535; v=1; x=1794229335;
 b=jlPxDJfTcCwv2f3cNALy5MgRybKbR/0qxi+tE3u36fbJWj1xED+YqDHsjGUuXIe7PBvSjC4P
 /gRvBGbU+UML71oLfBweGM3j99CAP+fIWvRAFdxKS7BaxngJiBvpBebli0Pyv0f1hg5E1c/+Nx2
 8LCLJZHT1VPYJubP/sTUMWJU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 62b76b9dce29e721;
	Mon, 02 Nov 2026 13:02:14 +0000
X-Mizu-Trace-ID: 62b76b9dce29e721
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/13] KVM: arm64: Share the ITS command field accessors with the hypervisor
Date: Mon,  2 Nov 2026 13:01:26 +0000
Message-ID: <20261102130133.3684226-7-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102130133.3684226-1-fuad.tabba@linux.dev>
References: <20261102130133.3684226-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_050222_179972_872EB7A0 
X-CRM114-Status: GOOD (  13.45  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The vgic's ITS emulation reads command fields with its_cmd_mask_field()
and the its_cmd_get_*() accessors. struct its_cmd_block, the block they
decode, is private to the ITS driver, and a later patch has the
protected KVM hypervisor parse the host's commands too.

Move the command block and the accessors to arm-gic-v3.h, which already
holds the GITS_CMD_* encodings, so there is one copy of each. Only KVM
reads commands, but the accessors decode the block the driver writes, so
they sit with it rather than in a KVM header.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-its.c     | 15 ---------------
 drivers/irqchip/irq-gic-v3-its.c   | 10 ----------
 include/linux/irqchip/arm-gic-v3.h | 22 ++++++++++++++++++++++
 3 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 7e9b265b1f521..78e480d112025 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -802,21 +802,6 @@ static bool vgic_its_map_lpi(struct kvm *kvm, struct its_ite *ite,
 	return false;
 }
 
-static u64 its_cmd_mask_field(u64 *its_cmd, int word, int shift, int size)
-{
-	return (le64_to_cpu(its_cmd[word]) >> shift) & (BIT_ULL(size) - 1);
-}
-
-#define its_cmd_get_command(cmd)	its_cmd_mask_field(cmd, 0,  0,  8)
-#define its_cmd_get_deviceid(cmd)	its_cmd_mask_field(cmd, 0, 32, 32)
-#define its_cmd_get_size(cmd)		(its_cmd_mask_field(cmd, 1,  0,  5) + 1)
-#define its_cmd_get_id(cmd)		its_cmd_mask_field(cmd, 1,  0, 32)
-#define its_cmd_get_physical_id(cmd)	its_cmd_mask_field(cmd, 1, 32, 32)
-#define its_cmd_get_collection(cmd)	its_cmd_mask_field(cmd, 2,  0, 16)
-#define its_cmd_get_ittaddr(cmd)	(its_cmd_mask_field(cmd, 2,  8, 44) << 8)
-#define its_cmd_get_target_addr(cmd)	its_cmd_mask_field(cmd, 2, 16, 32)
-#define its_cmd_get_validbit(cmd)	its_cmd_mask_field(cmd, 2, 63,  1)
-
 /*
  * The DISCARD command frees an Interrupt Translation Table Entry (ITTE).
  * Must be called with the its_lock mutex held.
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index f06da58cccf3d..3e27c7d58e024 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -528,16 +528,6 @@ struct its_cmd_desc {
 	};
 };
 
-/*
- * The ITS command block, which is what the ITS actually parses.
- */
-struct its_cmd_block {
-	union {
-		u64	raw_cmd[4];
-		__le64	raw_cmd_le[4];
-	};
-};
-
 #define ITS_CMD_QUEUE_SZ		SZ_64K
 #define ITS_CMD_QUEUE_NR_ENTRIES	(ITS_CMD_QUEUE_SZ / sizeof(struct its_cmd_block))
 
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index ea5fd2374ebe0..e0bec40adf2b7 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -657,6 +657,28 @@ static inline bool gic_enable_sre(void)
 	return !!(val & ICC_SRE_EL1_SRE);
 }
 
+struct its_cmd_block {
+	union {
+		u64	raw_cmd[4];
+		__le64	raw_cmd_le[4];
+	};
+};
+
+static inline u64 its_cmd_mask_field(u64 *its_cmd, int word, int shift, int size)
+{
+	return (le64_to_cpu(its_cmd[word]) >> shift) & (BIT_ULL(size) - 1);
+}
+
+#define its_cmd_get_command(cmd)	its_cmd_mask_field(cmd, 0,  0,  8)
+#define its_cmd_get_deviceid(cmd)	its_cmd_mask_field(cmd, 0, 32, 32)
+#define its_cmd_get_size(cmd)		(its_cmd_mask_field(cmd, 1,  0,  5) + 1)
+#define its_cmd_get_id(cmd)		its_cmd_mask_field(cmd, 1,  0, 32)
+#define its_cmd_get_physical_id(cmd)	its_cmd_mask_field(cmd, 1, 32, 32)
+#define its_cmd_get_collection(cmd)	its_cmd_mask_field(cmd, 2,  0, 16)
+#define its_cmd_get_ittaddr(cmd)	(its_cmd_mask_field(cmd, 2,  8, 44) << 8)
+#define its_cmd_get_target_addr(cmd)	its_cmd_mask_field(cmd, 2, 16, 32)
+#define its_cmd_get_validbit(cmd)	its_cmd_mask_field(cmd, 2, 63,  1)
+
 #endif
 
 #endif
-- 
2.47.3


