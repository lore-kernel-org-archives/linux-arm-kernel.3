Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BFF103E197
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJehhIoPg+/Xwstiz3SqFCs8SzoZCqBmOwpiB68nNZs=; b=3yrxjBnlFT63HLCjQozlrtQgs4
	QnKF23nSO/eAvGCBKjwKfMkS2Rz1PzVcpOFF4ZDqw84XPh+eIEzMldq7v8EG0phpB/0sMa1cBqhK9
	Qw+VctXZooDZ+jb3FkXvJYk1LRh+SAqvukY4PtFp7f2ldmu+lKMZnCJ6bCQvdelzjiWA0pXywhRTG
	OKXqs8HCroS7QyI1zXc8LoytdqVgwSrTAlbTE8RCCh5rcBXQZrQN/8LBro9/F/VPorJ93v2Uhj2Gj
	1idpDb/KgZ/ez3S9TCDTiYCbQOxYExx5lHmWr4mAbNZVfd29o37g/MPwcKAUbJzF58eog912fGWk9
	0HiU7+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tEh-00000008oS1-3m4c;
	Wed, 18 Mar 2026 15:55:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tEc-00000008oNc-2l9n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:55:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2A45202C;
	Wed, 18 Mar 2026 08:54:55 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.61.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 98C983F73B;
	Wed, 18 Mar 2026 08:54:58 -0700 (PDT)
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
	Vishal Annapurve <vannapurve@google.com>
Subject: [PATCH v13 10/48] arm64: RMI: Ensure that the RMM has GPT entries for memory
Date: Wed, 18 Mar 2026 15:53:34 +0000
Message-ID: <20260318155413.793430-11-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_085502_828680_948BCFF4 
X-CRM114-Status: GOOD (  15.95  )
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

The RMM may not be tracking all the memory of the system at boot. Create
the necessary tracking state and GPTs within the RMM so that all boot
memory can be delegated to the RMM as needed during runtime.

Note: support is currently missing for SROs which means that if the RMM
needs memory donating this will fail (and render CCA unusable in Linux).

Signed-off-by: Steven Price <steven.price@arm.com>
---
New patch for v13
---
 arch/arm64/kvm/rmi.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 9590dff9a2c1..80aedc85e94a 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/kvm_host.h>
+#include <linux/memblock.h>
 
 #include <asm/kvm_pgtable.h>
 #include <asm/rmi_cmds.h>
@@ -56,6 +57,18 @@ static int rmi_check_version(void)
 	return 0;
 }
 
+/*
+ * These are the 'default' sizes when passing 0 as the tracking_region_size.
+ * TODO: Support other granule sizes
+ */
+#ifdef CONFIG_PAGE_SIZE_4KB
+#define RMM_GRANULE_TRACKING_SIZE	SZ_1G
+#elif defined(CONFIG_PAGE_SIZE_16KB)
+#define RMM_GRANULE_TRACKING_SIZE	SZ_32M
+#elif defined(CONFIG_PAGE_SIZE_64KB)
+#define RMM_GRANULE_TRACKING_SIZE	SZ_512M
+#endif
+
 static int rmi_configure(void)
 {
 	struct rmm_config *config __free(free_page) = NULL;
@@ -95,6 +108,80 @@ static int rmi_configure(void)
 	return 0;
 }
 
+static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
+{
+	start = ALIGN_DOWN(start, RMM_GRANULE_TRACKING_SIZE);
+	end = ALIGN(end, RMM_GRANULE_TRACKING_SIZE);
+
+	while (start < end) {
+		unsigned long ret, category, state;
+
+		ret = rmi_granule_tracking_get(start, &category, &state);
+		if (ret != RMI_SUCCESS ||
+		    state != RMI_TRACKING_FINE ||
+		    category != RMI_MEM_CATEGORY_CONVENTIONAL) {
+			/* TODO: Set granule tracking in this case */
+			kvm_err("Granule tracking for region isn't fine/conventional: %llx",
+				start);
+			return -ENODEV;
+		}
+		start += RMM_GRANULE_TRACKING_SIZE;
+	}
+
+	return 0;
+}
+
+static unsigned long rmi_l0gpt_size(void)
+{
+	return 1UL << (30 + FIELD_GET(RMI_FEATURE_REGISTER_1_L0GPTSZ,
+				      rmm_feat_reg1));
+}
+
+static int rmi_create_gpts(phys_addr_t start, phys_addr_t end)
+{
+	unsigned long l0gpt_sz = rmi_l0gpt_size();
+
+	start = ALIGN_DOWN(start, l0gpt_sz);
+	end = ALIGN(end, l0gpt_sz);
+
+	while (start < end) {
+		int ret = rmi_gpt_l1_create(start);
+
+		if (ret && ret != RMI_ERROR_GPT) {
+			/*
+			 * FIXME: Handle SRO so that memory can be donated for
+			 * the tables.
+			 */
+			kvm_err("GPT Level1 table missing for %llx\n", start);
+			return -ENOMEM;
+		}
+		start += l0gpt_sz;
+	}
+
+	return 0;
+}
+
+static int rmi_init_metadata(void)
+{
+	phys_addr_t start, end;
+	const struct memblock_region *r;
+
+	for_each_mem_region(r) {
+		int ret;
+
+		start = memblock_region_memory_base_pfn(r) << PAGE_SHIFT;
+		end = memblock_region_memory_end_pfn(r) << PAGE_SHIFT;
+		ret = rmi_verify_memory_tracking(start, end);
+		if (ret)
+			return ret;
+		ret = rmi_create_gpts(start, end);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int rmm_check_features(void)
 {
 	if (kvm_lpa2_is_enabled() && !rmi_has_feature(RMI_FEATURE_REGISTER_0_LPA2)) {
@@ -120,6 +207,8 @@ void kvm_init_rmi(void)
 		return;
 	if (rmi_configure())
 		return;
+	if (rmi_init_metadata())
+		return;
 
 	/* Future patch will enable static branch kvm_rmi_is_available */
 }
-- 
2.43.0


