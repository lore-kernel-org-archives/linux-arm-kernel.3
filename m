Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC1DF55454
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 04:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRrDjoJKZySvl4mUR1OtU1XI2sBKG1GkryYlKYWQWdg=; b=I4aGi3hzvcepv3r6/dH7g+mOMR
	R+BH4BLJedWX7Sc4f18L6pHfTM5PJPv2q+ejAmdlYx3k8WaOVf084pVwTfzllOLcfvaG2HXMN6K0+
	a/VAPyrn3vI5oAj7jW4VCb55tq0Qk0iJuKuT/VyWdq7nYKDXBsdoSjrCDRBTNpnHTQJMtxUQ1Gy6k
	OOnYAhzPTPj87C1KcNXrH4lNbUu4zTh2FwLtpaHiGMxg6fWgrafAQHMQTprjF5tSNRAwHI84syi0N
	nW9047dyOAArUJwzqhqR1iSnO7/lN8ZYzgtu4QshhQquB2hjFeSOt90bwQU8pjdnd+eBicYR/RWDi
	Ls2zNi9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv68c-00000003AqL-489I;
	Wed, 25 Feb 2026 04:04:38 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv68Y-00000003And-0unH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 04:04:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZRrDjoJKZySvl4mUR1OtU1XI2sBKG1GkryYlKYWQWdg=;
	b=B2y451HUycQ9dcUrfiQGE84kOB1DQQPxwuGjiHjatdRVbuiM5t21r6bOcOWsZMnfO2zxYtRqZ
	4waQ7AJgdgXOfVQXyhaUMQudgfARDi46NUtrOXb5wX0OwyixXyEYAmd0WKydaHAyjroS7a1Njfr
	io/9+BLba68wVqGTeAVNpbI=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fLLSl4bvKz1prKZ;
	Wed, 25 Feb 2026 11:59:35 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id B463A40569;
	Wed, 25 Feb 2026 12:04:24 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Wed, 25 Feb
 2026 12:04:23 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>,
	<zhengtian10@huawei.com>
CC: <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<liuyonglong@huawei.com>, <Jonathan.Cameron@huawei.com>,
	<yezhenyu2@huawei.com>, <linuxarm@huawei.com>, <joey.gouly@arm.com>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
	<suzuki.poulose@arm.com>, <leo.bras@arm.com>
Subject: [PATCH v3 2/5] KVM: arm64: Add support to set the DBM attr during memory abort
Date: Wed, 25 Feb 2026 12:04:18 +0800
Message-ID: <20260225040421.2683931-3-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260225040421.2683931-1-zhengtian10@huawei.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_200434_555188_E7680FDC 
X-CRM114-Status: GOOD (  10.51  )
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

From: eillon <yezhenyu2@huawei.com>

This patch adds support to set the DBM (Dirty Bit Modifier) attribute
in S2 PTE during user_mem_abort(). This bit, introduced in ARMv8.1,
enables hardware to automatically promote write-clean pages to write-dirty.
This prevents the guest from being trapped in EL2 due to missing write
permissions.

Signed-off-by: eillon <yezhenyu2@huawei.com>
Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 4 ++++
 arch/arm64/kvm/hyp/pgtable.c         | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index c201168f2857..d0f280972a7a 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -93,6 +93,8 @@ typedef u64 kvm_pte_t;

 #define KVM_PTE_LEAF_ATTR_HI_S2_XN	GENMASK(54, 53)

+#define KVM_PTE_LEAF_ATTR_HI_S2_DBM	BIT(51)
+
 #define KVM_PTE_LEAF_ATTR_HI_S1_GP	BIT(50)

 #define KVM_PTE_LEAF_ATTR_S2_PERMS	(KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R | \
@@ -248,6 +250,7 @@ enum kvm_pgtable_stage2_flags {
  * @KVM_PGTABLE_PROT_R:		Read permission.
  * @KVM_PGTABLE_PROT_DEVICE:	Device attributes.
  * @KVM_PGTABLE_PROT_NORMAL_NC:	Normal noncacheable attributes.
+ * @KVM_PGTABLE_PROT_DBM:	Dirty bit management attribute.
  * @KVM_PGTABLE_PROT_SW0:	Software bit 0.
  * @KVM_PGTABLE_PROT_SW1:	Software bit 1.
  * @KVM_PGTABLE_PROT_SW2:	Software bit 2.
@@ -263,6 +266,7 @@ enum kvm_pgtable_prot {

 	KVM_PGTABLE_PROT_DEVICE			= BIT(4),
 	KVM_PGTABLE_PROT_NORMAL_NC		= BIT(5),
+	KVM_PGTABLE_PROT_DBM			= BIT(6),

 	KVM_PGTABLE_PROT_SW0			= BIT(55),
 	KVM_PGTABLE_PROT_SW1			= BIT(56),
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 0e4ddd28ef5d..5b4c46d8dc74 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -739,6 +739,9 @@ static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot p
 	if (prot & KVM_PGTABLE_PROT_W)
 		attr |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;

+	if (prot & KVM_PGTABLE_PROT_DBM)
+		attr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
+
 	if (!kvm_lpa2_is_enabled())
 		attr |= FIELD_PREP(KVM_PTE_LEAF_ATTR_LO_S2_SH, sh);

@@ -1361,6 +1364,9 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
 	if (prot & KVM_PGTABLE_PROT_W)
 		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;

+	if (prot & KVM_PGTABLE_PROT_DBM)
+		set |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
+
 	ret = stage2_set_xn_attr(prot, &xn);
 	if (ret)
 		return ret;
--
2.33.0


