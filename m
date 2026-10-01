Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5214BCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tc2cF8jnODp7Btdt632qMqm5LqgTaV8Ooq81AAYwotk=; b=CGJOyeoqeJcV7ysYk9u4TEyUHF
	EMTmkXiNLb6QHob3adqD1JrSkC831vosnLunsdQ+370crCJqxz5JzpXFP4wZRZRf5t1eb/PL9Zu7I
	v33P5mz2FWqp++KJvqHoNkgahTUH2Q7w8SKETCT7CbYu2AnIWHlVttb9Pwf51Ai8RRoA3kdRbQk0c
	jVGBeQVcikuyO/H4i/lrCjJF5aVDVXQdROgDyCuWm4mQ2YMycepIzMd5l5vp+97fl602TYQuWT7kD
	JI2XWT7erW5g6EHwwSBA1yjvsFFd7IGDz7ErzjKoDZy0kgz+RGkv2PSkWOYUDr5zavotsbB3dW5jX
	LbvE2hWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAwk-00000007xhK-46Tt;
	Thu, 01 Oct 2026 07:11:14 +0000
Received: from out-82.mta0.migadu.com ([2001:41d0:1004:224b::52] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAwi-00000007xfe-1yq2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:11:13 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=EejT2Q/JwSDIbSSxftpqQ/aTDCn9mVylyaJPheAAJww=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790838670; v=1; x=1791443470;
 b=E7EGUZ353BXOR1tCMyyF7E8m7CYatVR0zTsBVPKEXaPRJF9CSsDYix8auV6FJ62WKGaHtIis
 Gv2ejT8U742XiGx9xq+d8u73TAfuxrVfkan0KnzKrGsVPmPNixvjXlx4r2utiJ9+t8H0ghMzxRH
 l4HwiAmNmyGohqQ71ln892MI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f3d13b3cb84fa9cc;
	Thu, 01 Oct 2026 07:11:10 +0000
X-Mizu-Trace-ID: f3d13b3cb84fa9cc
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Yuchao Zhang <ndaugoing@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 1/3] KVM: arm64: selftests: Add MOVI and MOVALL commands to the ITS library
Date: Thu,  1 Oct 2026 08:10:58 +0100
Message-Id: <20261001071100.190013-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001071100.190013-1-fuad.tabba@linux.dev>
References: <20261001071100.190013-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_001112_652215_88FBBFA3 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

Add its_send_movi_cmd() and its_send_movall_cmd() for a test that moves
a pending LPI. MOVALL takes both redistributors as processor numbers,
as its_send_mapc_cmd() and its_send_sync_cmd() do, and the new
its_encode_target2() puts the second one in RDbase2, in the command's
fourth doubleword.

Assisted-by: LLM
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../selftests/kvm/include/arm64/gic_v3_its.h  |  2 ++
 .../selftests/kvm/lib/arm64/gic_v3_its.c      | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/arm64/gic_v3_its.h b/tools/testing/selftests/kvm/include/arm64/gic_v3_its.h
index a43a407e2d5c1..e30a658fbd1c3 100644
--- a/tools/testing/selftests/kvm/include/arm64/gic_v3_its.h
+++ b/tools/testing/selftests/kvm/include/arm64/gic_v3_its.h
@@ -14,6 +14,8 @@ void its_send_mapc_cmd(void *cmdq_base, u32 vcpu_id, u32 collection_id, bool val
 void its_send_mapti_cmd(void *cmdq_base, u32 device_id, u32 event_id,
 			u32 collection_id, u32 intid);
 void its_send_invall_cmd(void *cmdq_base, u32 collection_id);
+void its_send_movi_cmd(void *cmdq_base, u32 device_id, u32 event_id, u32 collection_id);
+void its_send_movall_cmd(void *cmdq_base, u32 from_vcpu, u32 to_vcpu);
 void its_send_sync_cmd(void *cmdq_base, u32 vcpu_id);
 
 #endif // __SELFTESTS_GIC_V3_ITS_H__
diff --git a/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c b/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c
index 1188b578121dd..811d858f5def6 100644
--- a/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c
+++ b/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c
@@ -159,6 +159,11 @@ static void its_encode_target(struct its_cmd_block *cmd, u64 target_addr)
 	its_mask_encode(&cmd->raw_cmd[2], target_addr >> 16, 51, 16);
 }
 
+static void its_encode_target2(struct its_cmd_block *cmd, u64 target_addr)
+{
+	its_mask_encode(&cmd->raw_cmd[3], target_addr >> 16, 51, 16);
+}
+
 static void its_encode_collection(struct its_cmd_block *cmd, u16 col)
 {
 	its_mask_encode(&cmd->raw_cmd[2], col, 15, 0);
@@ -253,6 +258,29 @@ void its_send_invall_cmd(void *cmdq_base, u32 collection_id)
 	its_send_cmd(cmdq_base, &cmd);
 }
 
+void its_send_movi_cmd(void *cmdq_base, u32 device_id, u32 event_id, u32 collection_id)
+{
+	struct its_cmd_block cmd = {};
+
+	its_encode_cmd(&cmd, GITS_CMD_MOVI);
+	its_encode_devid(&cmd, device_id);
+	its_encode_event_id(&cmd, event_id);
+	its_encode_collection(&cmd, collection_id);
+
+	its_send_cmd(cmdq_base, &cmd);
+}
+
+void its_send_movall_cmd(void *cmdq_base, u32 from_vcpu, u32 to_vcpu)
+{
+	struct its_cmd_block cmd = {};
+
+	its_encode_cmd(&cmd, GITS_CMD_MOVALL);
+	its_encode_target(&cmd, procnum_to_rdbase(from_vcpu));
+	its_encode_target2(&cmd, procnum_to_rdbase(to_vcpu));
+
+	its_send_cmd(cmdq_base, &cmd);
+}
+
 void its_send_sync_cmd(void *cmdq_base, u32 vcpu_id)
 {
 	struct its_cmd_block cmd = {};
-- 
2.39.5


