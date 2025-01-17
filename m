Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A11C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tBjEEqLvWWoIr6bLTxyaV5TCWMZaIId035SXrAuM/8=; b=DHlSEjgnrOmBjjrrCES8kLrZvE
	gfxPaXwr60tPQufKAY1CF7inVoF6FDZV9eJwbdZCb84470b5bAhXeZt+uadk0CO9ZQV02txgAnBuz
	abb050D9tzNB5kn82ZY6DNBNFuFvtFpWlubRdSTmpvG6cNz/4nPn+g0l6opk/u/Ae1leS7lww3800
	BOhAJ1OaZutbdPShixIx6vJQRqJI8tDO3EwSD4f2KkYHWHTucNZI2DOMGfvnlIAanwuyWNR+wFSXo
	v38AOlA5KcaVPpmo+rrr7WxWQswjOB2XwqW1ldv9ceI3rNJPfnneJJiLnALw2LCr7iqL7uGqsCGcw
	BFbD6f9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoB1-00000000bb9-1Mr2;
	Fri, 17 Jan 2025 15:22:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnzw-00000000ZFe-0gYA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:11:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6427422D9;
	Fri, 17 Jan 2025 07:11:28 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 457D33F73F;
	Fri, 17 Jan 2025 07:10:59 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH v2 08/11] arm_mpam: [NFU] Development diagnostics for MPAM ID assignments
Date: Fri, 17 Jan 2025 15:10:18 +0000
Message-Id: <20250117151033.1517882-9-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117151033.1517882-1-Dave.Martin@arm.com>
References: <20250117151033.1517882-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_071100_238940_B1441FDF 
X-CRM114-Status: UNSURE (   8.16  )
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

Purely for development purposes, add some printks to show what MPAM
IDs actually get assigned and configured.

This would otherwise be observable only though statistical
measurements of performance (or not observable at all).

This change is not intended for upstream.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
---
 arch/arm64/include/asm/mpam.h              | 7 +++++++
 drivers/platform/arm64/mpam/mpam_devices.c | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
index df725d2d9d05..4ae2e635e261 100644
--- a/arch/arm64/include/asm/mpam.h
+++ b/arch/arm64/include/asm/mpam.h
@@ -66,6 +66,9 @@ static inline void mpam_set_cpu_defaults(int cpu, u16 partid_d, u16 partid_i,
 	default_val |= FIELD_PREP(MPAM1_EL1_PMG_I, pmg_i);
 
 	WRITE_ONCE(per_cpu(arm64_mpam_default, cpu), default_val);
+
+	pr_info("MPAM: CPU%d -> (D=%d:%d, I=%d:%d)\n",
+		cpu, partid_d, pmg_d, partid_i, pmg_i);
 }
 
 static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
@@ -81,6 +84,10 @@ static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
 	regval |= FIELD_PREP(MPAM1_EL1_PMG_I, pmg_i);
 
 	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
+
+	pr_info("MPAM: task %s[%d/%d] -> (D=%d:%d, I=%d:%d)\n",
+		current->comm, current->pid, current->tgid,
+		partid_d, pmg_d, partid_i, pmg_i);
 #endif
 }
 
diff --git a/drivers/platform/arm64/mpam/mpam_devices.c b/drivers/platform/arm64/mpam/mpam_devices.c
index f965e6639e0d..6b326506c359 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -3149,6 +3149,12 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
 
 	mpam_extend_config(comp->class, cfg);
 
+	pr_info("mpam_apply_config(): comp %d partid %d cfg={0x%x: 0x%lx, 0x%lx, %u, %u}\n",
+		comp->comp_id, partid, cfg->features,
+		(unsigned long)cfg->cpbm,
+		(unsigned long)cfg->mbw_pbm,
+		cfg->mbw_min, cfg->mbw_max);
+
 	if (!mpam_update_config(&comp->cfg[partid], cfg))
 		return 0;
 
-- 
2.34.1


