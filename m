Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52243CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TG8uCmrX9NWGIaxxMWd9jmLBg5OvCeffc2NjZHgOyOs=; b=iVgJY9VbKDRKv3Le7s6/RpapCS
	1lI7ZkI+Eut+1WfQe3V+t9p8m7AdfYm5e92EFdgLY/1gv+EKiAxm38qpxERtjBMeLrY+E9E7EIdNH
	DO/bTUu1j5jzi1HCersEVaHLzzIQ6l5z8OCjdan0vblrEiVN1xuRzBv/7MHI9k6HryQyWRKdVKnvy
	oNYhnZjTS7WQvHTxJpQDaMyjtjJcF8ISKjDyGBDodELFN+qezssMuZNKZf85+xVCUUQmlsl1ElMwg
	GQahWgxX2fojnKT2splfiiG7fzD6bAfRVzKhWNDT2i8Tw9EFRxQI3Zf2S57WZ9o+zNw49Zmox7YVu
	+0M3VYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Uf-00000002ey5-2hb1;
	Wed, 13 May 2026 13:19:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9UQ-00000002efc-2k1Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:19:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F30D1E2F;
	Wed, 13 May 2026 06:18:59 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.68.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8540E3F836;
	Wed, 13 May 2026 06:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778678344; bh=trQyw0PdE9XkuPVCbvJDXHI7TLzpH6OvqtkqRmWtuNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JK2MuG02A5/pCxixbZqR2Q+tgRaP08jFg7bifneRiZhGeYNkH4IjSuwxMjqRPVBuX
	 4b7ieEey5F5hlkRFRIFWxeB7YCRJvq+RG2yIqZ7YPWeraH65bM0W0vZG4pzbDGvlDD
	 R86z9pCfnyg9UFKJMibHS7tp5i2fxaz/2nVsgF6k=
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
Subject: [PATCH v14 08/44] arm64: RMI: Ensure that the RMM has GPT entries for memory
Date: Wed, 13 May 2026 14:17:16 +0100
Message-ID: <20260513131757.116630-9-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_061906_822847_911B0003 
X-CRM114-Status: GOOD (  19.14  )
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

The RMM maintains the state of all the granules in the system to make
sure that the host is abiding by the rules. This state can be maintained
at different granularity, per page (TRACKING_FINE) or per region
(TRACKING_COARSE). The region size depends on the underlying
"RMI_GRANULE_SIZE". For a "coarse" region all pages in the region must
be of the same state, this implies we need to have "fine" tracking for
DRAM, so that we can delegated individual pages.

For now we only support a statically carved out memory for tracking
granules for the "fine" regions. This can be extended in the future to
allow modifying the tracking granularity and remove the need for a
static allocation.

Similarly, the firmware may create L0 GPT entries describing the total
address space. But if we change the "PAS" (Physical Address Space) of a
granule then the firmware may need to create L1 tables to track the PAS
at a finer granularity.

Note: support is currently missing for SROs which means that if the RMM
needs memory donating this will fail (and render CCA unusable in Linux).
This effectively means that the L1 GPT tables must be created before
Linux starts.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v13:
 * Moved out of KVM
---
 arch/arm64/include/asm/rmi_cmds.h |   2 +
 arch/arm64/kernel/rmi.c           | 103 ++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/arch/arm64/include/asm/rmi_cmds.h b/arch/arm64/include/asm/rmi_cmds.h
index 9179934925c5..9078a2920a7c 100644
--- a/arch/arm64/include/asm/rmi_cmds.h
+++ b/arch/arm64/include/asm/rmi_cmds.h
@@ -33,6 +33,8 @@ struct rmi_sro_state {
 } while (RMI_RETURN_STATUS(res.a0) == RMI_BUSY ||			\
 	 RMI_RETURN_STATUS(res.a0) == RMI_BLOCKED)
 
+bool rmi_is_available(void);
+
 unsigned long rmi_sro_execute(struct rmi_sro_state *sro, gfp_t gfp);
 void rmi_sro_free(struct rmi_sro_state *sro);
 
diff --git a/arch/arm64/kernel/rmi.c b/arch/arm64/kernel/rmi.c
index a14ead5dedda..52a415e99500 100644
--- a/arch/arm64/kernel/rmi.c
+++ b/arch/arm64/kernel/rmi.c
@@ -7,6 +7,8 @@
 
 #include <asm/rmi_cmds.h>
 
+static bool arm64_rmi_is_available;
+
 unsigned long rmm_feat_reg0;
 unsigned long rmm_feat_reg1;
 
@@ -88,6 +90,102 @@ static int rmi_configure(void)
 	return 0;
 }
 
+/*
+ * For now we set the tracking_region_size to 0 for RMI_RMM_CONFIG_SET().
+ * TODO: Support other tracking sizes (via Kconfig option).
+ */
+#ifdef CONFIG_PAGE_SIZE_4KB
+#define RMM_GRANULE_TRACKING_SIZE	SZ_1G
+#elif defined(CONFIG_PAGE_SIZE_16KB)
+#define RMM_GRANULE_TRACKING_SIZE	SZ_32M
+#elif defined(CONFIG_PAGE_SIZE_64KB)
+#define RMM_GRANULE_TRACKING_SIZE	SZ_512M
+#endif
+
+/*
+ * Make sure the area is tracked by RMM at FINE granularity.
+ * We do not support changing the tracking yet.
+ */
+static int rmi_verify_memory_tracking(phys_addr_t start, phys_addr_t end)
+{
+	while (start < end) {
+		unsigned long ret, category, state, next;
+
+		ret = rmi_granule_tracking_get(start, end, &category, &state, &next);
+		if (ret != RMI_SUCCESS ||
+		    state != RMI_TRACKING_FINE ||
+		    category != RMI_MEM_CATEGORY_CONVENTIONAL) {
+			/* TODO: Set granule tracking in this case */
+			pr_err("Granule tracking for region isn't fine/conventional: %llx",
+			       start);
+			return -ENODEV;
+		}
+		start = next;
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
+		/*
+		 * Make sure the L1 GPT tables are created for the region.
+		 * RMI_ERROR_GPT indicates the L1 table already exists.
+		 */
+		if (ret && ret != RMI_ERROR_GPT) {
+			/*
+			 * FIXME: Handle SRO so that memory can be donated for
+			 * the tables.
+			 */
+			pr_err("GPT Level1 table missing for %llx\n", start);
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
+bool rmi_is_available(void)
+{
+	return arm64_rmi_is_available;
+}
+
 static int __init arm64_init_rmi(void)
 {
 	/* Continue without realm support if we can't agree on a version */
@@ -101,6 +199,11 @@ static int __init arm64_init_rmi(void)
 
 	if (rmi_configure())
 		return 0;
+	if (rmi_init_metadata())
+		return 0;
+
+	arm64_rmi_is_available = true;
+	pr_info("RMI configured");
 
 	return 0;
 }
-- 
2.43.0


