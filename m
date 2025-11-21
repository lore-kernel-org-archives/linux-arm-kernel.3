Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21777CFA764
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 09:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSmhSjVlXXSAOTMnlq2uU/cOCynmcE9Ef92ugEWwAf4=; b=Li5Fqwob9NF7bxnsxlZboN1DmS
	UR6IDgxqEPh+3TdRSoQhX1hTXAL+8sNQKFY9uxjnjAK9VkKCD9SyaD5F46rlNwlcj8bKCMc1JXGfH
	o/jqrbRMWoDV7/n0U/+9tvVut5ze5JRhKk4VT88rdyjuP8c0K6rfN/XBuafpgrxfFlDH4qNKUv/22
	+82q6rnTvBAo59TIm/m27Ua7ebaoItgckNziaHquOMM8dl4hcMZdNup7cM8Nh7tep4q4WRfqmiYfn
	ZyW7+pkEM5XdXiwxuzWzoxX77rtt3kzQlUdmVk27ZLCu+xulFD73nELMrxL6IvJjPNe/3iyCMvAM8
	8ZEzFzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNN5-000000088lu-0IHR;
	Fri, 21 Nov 2025 09:24:03 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNMv-000000088hh-0BKx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 09:23:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aSmhSjVlXXSAOTMnlq2uU/cOCynmcE9Ef92ugEWwAf4=;
	b=W0qaa46xvizHT9Gu7lDEABADS4vTuORq1FbRVkx9UBjt3wRJTwB7YIe8+fmWixZM0YLuBSyD+
	2iqtZMjwWbSzIs4fPSmvFQvnMFFSTZht9yHIGLUayMzi50RK7dQe9/iVmnGZlczZIUOk5MHtJSK
	q5TOR0asMTh1EsGFZseqa3M=
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dCV924VvSzKmXQ;
	Fri, 21 Nov 2025 17:21:58 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 32376140295;
	Fri, 21 Nov 2025 17:23:44 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 21 Nov
 2025 17:23:43 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oliver.upton@linux.dev>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <zhengtian10@huawei.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <yezhenyu2@huawei.com>,
	<xiexiangyou@huawei.com>, <zhengchuan@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<suzuki.poulose@arm.com>
Subject: [PATCH v2 2/5] KVM: arm64: Support set the DBM attr during memory abort
Date: Fri, 21 Nov 2025 17:23:39 +0800
Message-ID: <20251121092342.3393318-3-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251121092342.3393318-1-zhengtian10@huawei.com>
References: <20251121092342.3393318-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_012353_432130_109722BE 
X-CRM114-Status: UNSURE (   9.05  )
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

From: eillon <yezhenyu2@huawei.com>

Add DBM support to automatically promote write-clean pages to
write-dirty, preventing users from being trapped in EL2 due to
missing write permissions.

Since the DBM attribute was introduced in ARMv8.1 and remains
optional in later architecture revisions, including ARMv9.5.

Support set the DBM attr during user_mem_abort().

Signed-off-by: eillon <yezhenyu2@huawei.com>
Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 4 ++++
 arch/arm64/kvm/hyp/pgtable.c         | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 2888b5d03757..2fa24953d1a6 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -91,6 +91,8 @@ typedef u64 kvm_pte_t;

 #define KVM_PTE_LEAF_ATTR_HI_S2_XN	BIT(54)

+#define KVM_PTE_LEAF_ATTR_HI_S2_DBM	BIT(51)
+
 #define KVM_PTE_LEAF_ATTR_HI_S1_GP	BIT(50)

 #define KVM_PTE_LEAF_ATTR_S2_PERMS	(KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R | \
@@ -245,6 +247,7 @@ enum kvm_pgtable_stage2_flags {
  * @KVM_PGTABLE_PROT_R:		Read permission.
  * @KVM_PGTABLE_PROT_DEVICE:	Device attributes.
  * @KVM_PGTABLE_PROT_NORMAL_NC:	Normal noncacheable attributes.
+ * @KVM_PGTABLE_PROT_DBM:	Dirty bit management attribute.
  * @KVM_PGTABLE_PROT_SW0:	Software bit 0.
  * @KVM_PGTABLE_PROT_SW1:	Software bit 1.
  * @KVM_PGTABLE_PROT_SW2:	Software bit 2.
@@ -257,6 +260,7 @@ enum kvm_pgtable_prot {

 	KVM_PGTABLE_PROT_DEVICE			= BIT(3),
 	KVM_PGTABLE_PROT_NORMAL_NC		= BIT(4),
+	KVM_PGTABLE_PROT_DBM			= BIT(5),

 	KVM_PGTABLE_PROT_SW0			= BIT(55),
 	KVM_PGTABLE_PROT_SW1			= BIT(56),
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index c351b4abd5db..ce41c6924ebe 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -694,6 +694,9 @@ static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot p
 	if (prot & KVM_PGTABLE_PROT_W)
 		attr |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;

+	if (prot & KVM_PGTABLE_PROT_DBM)
+		attr |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
+
 	if (!kvm_lpa2_is_enabled())
 		attr |= FIELD_PREP(KVM_PTE_LEAF_ATTR_LO_S2_SH, sh);

@@ -1303,6 +1306,9 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
 	if (prot & KVM_PGTABLE_PROT_W)
 		set |= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;

+	if (prot & KVM_PGTABLE_PROT_DBM)
+		set |= KVM_PTE_LEAF_ATTR_HI_S2_DBM;
+
 	if (prot & KVM_PGTABLE_PROT_X)
 		clr |= KVM_PTE_LEAF_ATTR_HI_S2_XN;

--
2.33.0


