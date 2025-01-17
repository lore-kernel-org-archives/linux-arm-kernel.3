Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A838C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SgKZT/g5qzLU/t2GhOBl1tQoCgwhOkpzHqkvoVCzRg=; b=MHStNBzuFRm6Ec/H3csnynTpkE
	VYqB3fZxVFBLXsiqnjt0351rUevtVXfiTGQyYV/rWh3ib+TOI/PDpJYmCTK6HXTJGXdhDxvHtxwyr
	pVF8jbrDcenqwQTN0hubkI9oaIqi3NLjpzusvOcgaUGsMJFPjIaiNZ21tBSXM2VVACsc4LOMu15jT
	yC3yGz6r0ybeFB0eowdmE4Ub0Fb+QVGr4kqtC0nsK4/KkP+B6pt3McwC40TvrwHSdZj2rwuSA0EZQ
	lKoYCW92MxTKZSsslRDo2Vp32o+rJ7QyiNCoCOfqVwcxVKyX2Gb1YE+/ldBcTfstrJfzTFYGfeOsD
	TDdDrIIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoMD-00000000dUd-0yMx;
	Fri, 17 Jan 2025 15:34:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYo04-00000000ZGb-3UqS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:11:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 127F62247;
	Fri, 17 Jan 2025 07:11:37 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E81323F73F;
	Fri, 17 Jan 2025 07:11:07 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH v2 05/11] arm_mpam: resctrl: Implement arch hook to set up the default CLOSID
Date: Fri, 17 Jan 2025 15:10:27 +0000
Message-Id: <20250117151033.1517882-18-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117151033.1517882-1-Dave.Martin@arm.com>
References: <20250117151033.1517882-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_071108_912844_3B6F0C36 
X-CRM114-Status: GOOD (  12.22  )
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

Since the allocation of CLOSIDs can now depend on parameters such
as resctrl filesystem mount options that are not available at arch
driver init time, all MPAM resource allocations need to be
reprogrammed when resctrl is mounted.

Implement resctrl_arch_init_domains() so that resctrl will now
reprogram the default CLOSID's resource allocations at filesystem
mount time, in the same way as when creating a new resctrl control
group.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
---
 drivers/platform/arm64/mpam/mpam_resctrl.c | 15 +++++++++++++--
 include/linux/arm_mpam.h                   |  7 +------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index 30f2caec11d7..aa8a6c077918 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -1209,7 +1209,8 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 }
 
 /* TODO: this is IPI heavy */
-int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
+static int __resctrl_arch_update_domains(struct rdt_resource *r, u32 closid,
+					 bool force)
 {
 	int err = 0;
 	enum resctrl_conf_type t;
@@ -1222,7 +1223,7 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
 	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
 		for (t = 0; t < CDP_NUM_TYPES; t++) {
 			cfg = &d->staged_config[t];
-			if (!cfg->have_new_ctrl)
+			if (!force && !cfg->have_new_ctrl)
 				continue;
 
 			err = resctrl_arch_update_one(r, d, closid, t,
@@ -1235,6 +1236,16 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
 	return err;
 }
 
+int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
+{
+	return __resctrl_arch_update_domains(r, closid, false);
+}
+
+int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
+{
+	return __resctrl_arch_update_domains(r, closid, true);
+}
+
 void resctrl_arch_reset_resources(void)
 {
 	int i, idx;
diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
index dd5f18474846..e6b188ab735b 100644
--- a/include/linux/arm_mpam.h
+++ b/include/linux/arm_mpam.h
@@ -47,12 +47,7 @@ static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
 
 static inline bool resctrl_arch_default_closid_needs_init(void)
 {
-	return false;
-}
-
-static inline int resctrl_arch_init_domains(struct rdt_resource *r, u32 closid)
-{
-	return 0;
+	return true;
 }
 
 bool resctrl_arch_alloc_capable(void);
-- 
2.34.1


