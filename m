Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEC2CD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F/6a5Hz4T+tF5Hum64kyYi4mlYR+VtC6XjGxcnq9JNQ=; b=cDQgFE0brc1waSrn6QMnX+7ItU
	8XJSnvaYinZGTRVyJoBtj6vx7Sg9aJO4mWQOsTk+RK26zilmstBdqbjaKEOLpyDs4yWed0V+y99OC
	Aq4MWhCDsS6Y5WC9NTYgtkPLzlh4zMXExWW8n27Z3ZpWYb54EFZ4Y37RvhF5AxesBiBGT1231Yb8w
	afnW1FUcaMJFq0CcfAi6p0nAYtIWcLzVSxD+OWuYawgN7regpriAkafRMl5gJyMN8Vh7pyHNOan0B
	IGSW1MVl3PhVSJ4G3QvNbAUbdBQ/gX4FNnqAZhaNlFVH0vh0TNZqjJBJj1LdT2hZ1o0OpVk3ThQMY
	OCUOeRNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2s8-0000000GKpR-1rtg;
	Thu, 04 Jun 2026 07:52:12 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2s4-0000000GKoz-1rUK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:52:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780559524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F/6a5Hz4T+tF5Hum64kyYi4mlYR+VtC6XjGxcnq9JNQ=;
	b=pwTsRkuRxX/Hf8Nq/pKS0+lmUicQzYXQrTAgan89ZNjbFReMXqbzUdmpwpFnA6xkTBWI3+
	k3PnNujYF5Dym72An0vvY9hIv6eFfEimp5zqPneuOt1y6pIn1obj9PUunH2cy+mX1eH7+Y
	UvVpdnTfOf4brq6RzzqTFuYHbPOxRjQ=
From: Jackie Liu <liu.yun@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: yuzenghui@huawei.com,
	will@kernel.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v2] KVM/arm64: vgic-its: Make ABI commit helpers return void
Date: Thu,  4 Jun 2026 15:51:47 +0800
Message-ID: <20260604075147.53299-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_005209_398774_C20B0668 
X-CRM114-Status: UNSURE (   9.67  )
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

From: Jackie Liu <liuyun01@kylinos.cn>

The return values of vgic_its_set_abi() and vgic_its_commit_v0() are always
0 and do not carry useful error information. Simplify by changing them to
void.

Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 arch/arm64/kvm/vgic/vgic-its.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 1d7e5d560af4..ca48b34dec20 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -27,7 +27,7 @@ static struct kvm_device_ops kvm_arm_vgic_its_ops;
 
 static int vgic_its_save_tables_v0(struct vgic_its *its);
 static int vgic_its_restore_tables_v0(struct vgic_its *its);
-static int vgic_its_commit_v0(struct vgic_its *its);
+static void vgic_its_commit_v0(struct vgic_its *its);
 static int update_lpi_config(struct kvm *kvm, struct vgic_irq *irq,
 			     struct kvm_vcpu *filter_vcpu, bool needs_inv);
 
@@ -168,7 +168,7 @@ struct vgic_its_abi {
 	int ite_esz;
 	int (*save_tables)(struct vgic_its *its);
 	int (*restore_tables)(struct vgic_its *its);
-	int (*commit)(struct vgic_its *its);
+	void (*commit)(struct vgic_its *its);
 };
 
 #define ABI_0_ESZ	8
@@ -192,13 +192,13 @@ inline const struct vgic_its_abi *vgic_its_get_abi(struct vgic_its *its)
 	return &its_table_abi_versions[its->abi_rev];
 }
 
-static int vgic_its_set_abi(struct vgic_its *its, u32 rev)
+static void vgic_its_set_abi(struct vgic_its *its, u32 rev)
 {
 	const struct vgic_its_abi *abi;
 
 	its->abi_rev = rev;
 	abi = vgic_its_get_abi(its);
-	return abi->commit(its);
+	abi->commit(its);
 }
 
 /*
@@ -472,7 +472,8 @@ static int vgic_mmio_uaccess_write_its_iidr(struct kvm *kvm,
 
 	if (rev >= NR_ITS_ABIS)
 		return -EINVAL;
-	return vgic_its_set_abi(its, rev);
+	vgic_its_set_abi(its, rev);
+	return 0;
 }
 
 static unsigned long vgic_mmio_read_its_idregs(struct kvm *kvm,
@@ -1888,14 +1889,11 @@ static int vgic_its_create(struct kvm_device *dev, u32 type)
 	its->baser_coll_table = INITIAL_BASER_VALUE |
 		((u64)GITS_BASER_TYPE_COLLECTION << GITS_BASER_TYPE_SHIFT);
 	dev->kvm->arch.vgic.propbaser = INITIAL_PROPBASER_VALUE;
-
 	dev->private = its;
 
-	ret = vgic_its_set_abi(its, NR_ITS_ABIS - 1);
-
+	vgic_its_set_abi(its, NR_ITS_ABIS - 1);
 	mutex_unlock(&dev->kvm->arch.config_lock);
-
-	return ret;
+	return 0;
 }
 
 static void vgic_its_destroy(struct kvm_device *kvm_dev)
@@ -2610,7 +2608,7 @@ static int vgic_its_restore_tables_v0(struct vgic_its *its)
 	return ret;
 }
 
-static int vgic_its_commit_v0(struct vgic_its *its)
+static void vgic_its_commit_v0(struct vgic_its *its)
 {
 	const struct vgic_its_abi *abi;
 
@@ -2623,7 +2621,6 @@ static int vgic_its_commit_v0(struct vgic_its *its)
 
 	its->baser_device_table |= (GIC_ENCODE_SZ(abi->dte_esz, 5)
 					<< GITS_BASER_ENTRY_SIZE_SHIFT);
-	return 0;
 }
 
 static void vgic_its_reset(struct kvm *kvm, struct vgic_its *its)
-- 
2.54.0


