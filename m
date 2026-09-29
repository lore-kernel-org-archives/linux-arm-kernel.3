Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81D5CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/i3cRoCeoaJtaXUF2Few5whPLcTjVMDPdtUXzhXwKPw=; b=sgLRamBE46mEk008juKmDvEMJR
	dLbmn0k68rzfEymmYLDj44MhbhAO5IbcrDxLJ+OA5R/UpmBgUfk83mlXQIV38o+I9DOxU6E/TRAVc
	LJ+xf1QvdmFyen50ot5rylnIvQOoQC7Fjs6BhkRuTP6dziQfqM2+YEkgYO8N+drekt6lcaEahlfts
	B5VJZgKHruIchx90GtN+7SoCuCZz0hRq0RlDuZL5Fe+Z1XuqApKRkdGPIAOLa2aZHctMoiJ178Iod
	fhfpyXz5nE3N04egzxKZitKvbn+0l/KcKQTDmFWEsO8gDp15UIhOeS0UFbc4/woVOcQ/0yb66Iy46
	FJHwkj6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBd8W-00000004L7F-0WYU;
	Tue, 29 Sep 2026 19:05:08 +0000
Received: from out-233.mta0.migadu.com ([2001:41d0:1004:224b::e9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBd8T-00000004L5y-0yN3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:05:06 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=r2D4QA2iJ+2gmHZXKSJFqPqM3IjZ2G/s/0P8pwHEYtw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790708701; v=1; x=1791313501;
 b=Z1fhVUzb3YFVA6UNwERSUICkxSFzKh1m/ghK6RlHn7OJvSSkqWUd5J4hq2ckdYtBNzlCKUK7
 hMO8k5JrgTw+sd6A1eeiyAIVEae6GiCkjEH6J/mJP8w2e0GvmIiEX3q2ZYknUidGmPKNRhkNdMY
 BBJlnnNpLG+I5KuYxs/uSoI8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c0bb7df4154168e6;
	Tue, 29 Sep 2026 19:05:01 +0000
X-Mizu-Trace-ID: c0bb7df4154168e6
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yuchao Zhang <ndaugoing@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v1 1/2] KVM: arm64: selftests: Add a MOVALL command to the ITS library
Date: Tue, 29 Sep 2026 20:04:51 +0100
Message-Id: <fcf20fcb0455a9360e5dc0487ddef25357087c25.1790708299.git.fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790708299.git.fuad.tabba@linux.dev>
References: <20260929093548.3598547-1-maz@kernel.org> <cover.1790708299.git.fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_120505_419943_E4CF6227 
X-CRM114-Status: UNSURE (   9.81  )
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

Add its_send_movall_cmd() for a MOVALL test. Both redistributors are
encoded as processor numbers, as its_send_mapc_cmd() does.

Assisted-by: LLM
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../selftests/kvm/include/arm64/gic_v3_its.h     |  1 +
 .../testing/selftests/kvm/lib/arm64/gic_v3_its.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/arm64/gic_v3_its.h b/tools/testing/selftests/kvm/include/arm64/gic_v3_its.h
index a43a407e2d5c1..6a410c89c6445 100644
--- a/tools/testing/selftests/kvm/include/arm64/gic_v3_its.h
+++ b/tools/testing/selftests/kvm/include/arm64/gic_v3_its.h
@@ -14,6 +14,7 @@ void its_send_mapc_cmd(void *cmdq_base, u32 vcpu_id, u32 collection_id, bool val
 void its_send_mapti_cmd(void *cmdq_base, u32 device_id, u32 event_id,
 			u32 collection_id, u32 intid);
 void its_send_invall_cmd(void *cmdq_base, u32 collection_id);
+void its_send_movall_cmd(void *cmdq_base, u32 from_vcpu, u32 to_vcpu);
 void its_send_sync_cmd(void *cmdq_base, u32 vcpu_id);
 
 #endif // __SELFTESTS_GIC_V3_ITS_H__
diff --git a/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c b/tools/testing/selftests/kvm/lib/arm64/gic_v3_its.c
index 1188b578121dd..9237401a94fe8 100644
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
@@ -253,6 +258,17 @@ void its_send_invall_cmd(void *cmdq_base, u32 collection_id)
 	its_send_cmd(cmdq_base, &cmd);
 }
 
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


