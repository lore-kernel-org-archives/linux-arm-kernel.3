Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8052CCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UICfxJoQ2yfJr+5ul4KXLbRXZmyqe7Jfu/q2IQvSqmA=; b=vFfzSzor2aAQLWgNObiWlzSgWT
	m7eZ/6fgya8IcDICVMsiETu7jWnqe1VcTFMAOGmfjN8TgCeoZ1QrcrWbFiYhh8LxBOH3vfSgjjmg0
	WGb8P4kAKOtagZtJ8jwmb96JK9K/z/6kyuMNUvYRa1pRD2a096CLSxAJTEXT10zqM/q74Sv1lRChK
	xTJZ9sfROZ35nh1CzsUBuzitwlKmyas/HsRVwQcnoSFOrDRLFcIHlNWH4lIQosyihZv5yE2Ka/2Cv
	XOts6aH91JmXuQ8cnePyAPB8G5SY8fGX9Dt20OzSRm0J68Xg/yrjNfLpqkHuErh6xF/JsIL5yZpag
	2W2oDMGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9WK-00000002hAa-1A2r;
	Wed, 13 May 2026 13:21:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9W8-00000002gwv-2B2S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:21:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA7F6302F;
	Wed, 13 May 2026 06:20:46 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.68.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EC743F836;
	Wed, 13 May 2026 06:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778678451; bh=FH/lIvcnlPAmxth30YsCSY7W015MGY2e5M4QLYMBxXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CNWZAhbJSxNoTQtayTQYYKeHMh4SKOtlErlmsrALC0GiBzCET4UnVEDUSS9f/7pan
	 +WD7zyvIoukmikrXvlXUZM20/GmGH92gehueJ37tz0RKNG3hjVlACQRl/cfLXBQjgi
	 p098GIAwE/o2xHjNEpmKWof8xQZak6TMJWQfo584=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: [PATCH v14 28/44] arm64: RMI: Create the realm descriptor
Date: Wed, 13 May 2026 14:17:36 +0100
Message-ID: <20260513131757.116630-29-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_062052_717590_D2DDBF20 
X-CRM114-Status: GOOD (  16.77  )
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

Creating a realm involves first creating a realm descriptor (RD). This
involves passing the configuration information to the RMM. Do this as
part of realm_ensure_created() so that the realm is created when it is
first needed.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v13:
 * The RMM no longer uses AUX granules, so no need to ask it how many it
   needs.
 * Adapted to other changes.
Changes since v12:
 * Since RMM page size is now equal to the host's page size various
   calculations are simplified.
 * Switch to using range based APIs to delegate/undelegate.
 * VMID handling is now handled entirely by the RMM.
---
 arch/arm64/kvm/rmi.c | 88 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index fb96bcaa73ed..cae29fd3353c 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -418,6 +418,77 @@ static void realm_unmap_shared_range(struct kvm *kvm,
 			     start, end);
 }
 
+static int realm_create_rd(struct kvm *kvm)
+{
+	struct realm *realm = &kvm->arch.realm;
+	struct realm_params *params = realm->params;
+	void *rd = NULL;
+	phys_addr_t rd_phys, params_phys;
+	size_t pgd_size = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
+	int r;
+
+	realm->ia_bits = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
+
+	if (WARN_ON(realm->rd || !realm->params))
+		return -EEXIST;
+
+	rd = (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+	if (!rd)
+		return -ENOMEM;
+
+	rd_phys = virt_to_phys(rd);
+	if (rmi_delegate_page(rd_phys)) {
+		r = -ENXIO;
+		goto free_rd;
+	}
+
+	if (rmi_delegate_range(kvm->arch.mmu.pgd_phys, pgd_size)) {
+		r = -ENXIO;
+		goto out_undelegate_tables;
+	}
+
+	params->s2sz = VTCR_EL2_IPA(kvm->arch.mmu.vtcr);
+	params->rtt_level_start = get_start_level(realm);
+	params->rtt_num_start = pgd_size / PAGE_SIZE;
+	params->rtt_base = kvm->arch.mmu.pgd_phys;
+
+	if (kvm->arch.arm_pmu) {
+		params->pmu_num_ctrs = kvm->arch.nr_pmu_counters;
+		params->flags |= RMI_REALM_PARAM_FLAG_PMU;
+	}
+
+	if (kvm_lpa2_is_enabled())
+		params->flags |= RMI_REALM_PARAM_FLAG_LPA2;
+
+	params_phys = virt_to_phys(params);
+
+	if (rmi_realm_create(rd_phys, params_phys)) {
+		r = -ENXIO;
+		goto out_undelegate_tables;
+	}
+
+	realm->rd = rd;
+	kvm_set_realm_state(kvm, REALM_STATE_NEW);
+	/* The realm is up, free the parameters.  */
+	free_page((unsigned long)realm->params);
+	realm->params = NULL;
+
+	return 0;
+
+out_undelegate_tables:
+	if (WARN_ON(rmi_undelegate_range(kvm->arch.mmu.pgd_phys, pgd_size))) {
+		/* Leak the pages if they cannot be returned */
+		kvm->arch.mmu.pgt = NULL;
+	}
+	if (WARN_ON(rmi_undelegate_page(rd_phys))) {
+		/* Leak the page if it isn't returned */
+		return r;
+	}
+free_rd:
+	free_page((unsigned long)rd);
+	return r;
+}
+
 static void realm_unmap_private_range(struct kvm *kvm,
 				      unsigned long start,
 				      unsigned long end,
@@ -647,8 +718,21 @@ static int realm_init_ipa_state(struct kvm *kvm,
 
 static int realm_ensure_created(struct kvm *kvm)
 {
-	/* Provided in later patch */
-	return -ENXIO;
+	int ret;
+
+	switch (kvm_realm_state(kvm)) {
+	case REALM_STATE_NONE:
+		break;
+	case REALM_STATE_NEW:
+		return 0;
+	case REALM_STATE_DEAD:
+		return -ENXIO;
+	default:
+		return -EBUSY;
+	}
+
+	ret = realm_create_rd(kvm);
+	return ret;
 }
 
 static int set_ripas_of_protected_regions(struct kvm *kvm)
-- 
2.43.0


