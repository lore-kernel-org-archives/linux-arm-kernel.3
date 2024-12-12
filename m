Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8F6E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAjN578LjrRMmGgdrZhF9VUVzRJHwso28zO1mlCVPvU=; b=y79OFVG8fYpHmxOu98NlhoCEi/
	rBvUIO6lto+zo8sEkUHohntNEGo8MwYrJsY7MW3gN2LuvvSULv1HKeFXD93L6tfvzN+mlAvpnxKas
	TaL4QOrnt+K8NEfL72koJ/jBd4c3pB2eSda4rg0r2uVhVv3V5p9f0aVO47a3Bpo0PSv6NfVVyd4OJ
	TGqJpOO+hC0Zioz2KsDxoS/BBJN122REEfNw4eLaJOCMcuPTdcItRHhn2b5hXHnaw/XpOXw2vEoKy
	3mSvKxejyaFMA/HJ0YtHi4J3zNh/UZsgQGSOLhVuC6hGJKlEpA9dg1/o5w8roRjPivEoGeOmlCM1c
	XlF01xPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlQD-00000000oRV-2MUT;
	Thu, 12 Dec 2024 15:48:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlIo-00000000mwf-25bS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:40:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A4C21764;
	Thu, 12 Dec 2024 07:41:01 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0922F3F720;
	Thu, 12 Dec 2024 07:40:31 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH 6/6] arm_mpam: [NFU] Development diagnostics for MPAM ID assignments
Date: Thu, 12 Dec 2024 15:40:00 +0000
Message-Id: <20241212154000.330467-7-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212154000.330467-1-Dave.Martin@arm.com>
References: <20241212154000.330467-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_074034_575663_FB8F7CD9 
X-CRM114-Status: UNSURE (   7.76  )
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
index 41962dd1bb68..dd84c0aa50f6 100644
--- a/drivers/platform/arm64/mpam/mpam_devices.c
+++ b/drivers/platform/arm64/mpam/mpam_devices.c
@@ -3158,6 +3158,12 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
 
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


