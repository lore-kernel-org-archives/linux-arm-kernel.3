Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AABCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 00:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZyRtXnhnhppM44IFifDXYrWtilG94lpK59HvMcWGonE=; b=t45A1PZI/uREa2MJNxSPaIOHEH
	XryU2H93C9ibwBGeF3l9bXEoS0ifAJRN3s4L2y3wAVNLfD3BfjGp909+YJtPc4IvCp1Ls1xkAwJoo
	bUfHjCNoXsovqw/9rI/acOFIeD53IxATZemoE7mLiuVO0IE1we9USrR+c4sIH9nUabO/DB0ioXADl
	ohw7j6Hx8+tTCvf5tXvyXpTJLKkFnnx/2HK7CmVIbBR7wPAUPaF92SUaBn60G3KnC54JLCzNuVg4m
	TglzLfG5xcLrnjf4mioLzFLigXqDP9wsgdi4NBr1yBvuVOLnSrzhNs/7HopTvm5vIs79N8DpMlsbL
	HPWygjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWeK-0000000Bwis-3POS;
	Wed, 20 Aug 2025 00:25:56 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoUG5-0000000BfWp-3vIp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:52:47 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-45a1b0c5377so25524985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 14:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755640364; x=1756245164; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyRtXnhnhppM44IFifDXYrWtilG94lpK59HvMcWGonE=;
        b=DbbhftcROEHF45XWdVsaOwMCPGTPjUy4gcomIxpC6ilWIZXGn0UL/5CodCVQ78IkGP
         TGEIB9lT6bV6jvytK0bSQZDscQBAeeCc+EqoTmYtzXMs6GY3VbEVZv67U6maHn6G48xQ
         MO3+CUGDo0ba+eCpL/03j1GdXLKvrb6w+dvCyPhHLNCxEbL09fHgqObPDlRFsZzQv/tr
         fjWZSBKxrjodbRBQhGLXFv5oydhCigjcNdUY6dNDDD0lw3m+4yv3K6TFyBUPmAk/txnL
         4DFwkwbImn1gTfl6HxGlWFnGael7P/VSoT7kbBGe8rs88BYpINiJOKXT3fsItEJxS4Sk
         vx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755640364; x=1756245164;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyRtXnhnhppM44IFifDXYrWtilG94lpK59HvMcWGonE=;
        b=O7sOo7z34FRLYNXqFmU5k1rmq6vYnDEO6yfD1vJQ1p/1svkX+Hboyx3gPsqu8ZfcVR
         6eiVG4E3gLUbwU56qbbFu8KrA2zHt/FurL1/RPE6Z+FdmLtOT7kC1aKLT2tN8ZpsiTYU
         xWoTqDnNxp8HG4iSCqhvoNRbY11keHRkoWa45xBG/z/WPzrrXoAKvrLvKEc2K4X77Vhn
         jueqnuP9IeIPPRHl4zSN4vNK8Bod9xbOpNujhOuBiyZ6j/B17g8ABOqprwHAoOlOGAZ1
         5OIss68d9A/F4164YJqJFMT28kIm94ToM51M4eq0pH0ZDt52T9e7Ojl9Wau7BAHzbxqF
         xRNw==
X-Forwarded-Encrypted: i=1; AJvYcCWUqMf+5EBPrb8epU2s8eyswk9ZfWF/OIcuXGJSeTica2VWHwR15nyvgKhCskpT38JhA9W7rJXWl7a5iDVNUhCc@lists.infradead.org
X-Gm-Message-State: AOJu0YzVgTSdozHBsJAw2UY+Hf7/U8jnw3W7wg6mYw3cPf+Btw/n/vmn
	r4tnWN+rTrBNumZZclrxigi65yEpKm90c/Sz5mJZqD6sWGqJjJEyCfkotwpX5CYVJ8jDZTcXTPr
	p66DY3IEyXJ5hHg==
X-Google-Smtp-Source: AGHT+IGr5ioioVJcsD/j/B2rJ42P01JBGG14bJdGLQMTv0vagaiysEKhVuqLi/9sRGavTW3nFD47MLqZZDL7iQ==
X-Received: from wmqd6.prod.google.com ([2002:a05:600c:34c6:b0:458:c02c:3ccd])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b86:b0:456:eb9:5236 with SMTP id 5b1f17b1804b1-45b479bdf64mr3584515e9.15.1755640364362;
 Tue, 19 Aug 2025 14:52:44 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:51:49 +0000
In-Reply-To: <20250819215156.2494305-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.rc1.167.g924127e9c0-goog
Message-ID: <20250819215156.2494305-22-smostafa@google.com>
Subject: [PATCH v4 21/28] iommu/arm-smmu-v3-kvm: Add CMDQ functions
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, robin.murphy@arm.com, jean-philippe@linaro.org, 
	qperret@google.com, tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_145245_981516_3D55114A 
X-CRM114-Status: GOOD (  17.09  )
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

Add functions to access the command queue, there are 2 main usage:
- Hypervisor's own commands, as TLB invalidation, would use functions
  as smmu_send_cmd(), which creates and sends a command.
- Add host commands to the shadow command queue, after being filtered,
  these will be added with smmu_add_cmd_raw.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index d3ab4b814be4..554229e466f3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -20,6 +20,33 @@ struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
 	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
 	     (smmu)++)
 
+/*
+ * Wait until @cond is true.
+ * Return 0 on success, or -ETIMEDOUT
+ */
+#define smmu_wait(_cond)					\
+({								\
+	int __ret = 0;						\
+	u64 delay = pkvm_time_get() + ARM_SMMU_POLL_TIMEOUT_US;	\
+								\
+	while (!(_cond)) {					\
+		if (pkvm_time_get() >= delay) {			\
+			__ret = -ETIMEDOUT;			\
+			break;					\
+		}						\
+	}							\
+	__ret;							\
+})
+
+#define smmu_wait_event(_smmu, _cond)				\
+({								\
+	if ((_smmu)->features & ARM_SMMU_FEAT_SEV) {		\
+		while (!(_cond))				\
+			wfe();					\
+	}							\
+	smmu_wait(_cond);					\
+})
+
 /* Transfer ownership of memory */
 static int smmu_take_pages(u64 phys, size_t size)
 {
@@ -62,6 +89,77 @@ static int smmu_unshare_pages(phys_addr_t addr, size_t size)
 	return 0;
 }
 
+static bool smmu_cmdq_full(struct arm_smmu_queue *cmdq)
+{
+	struct arm_smmu_ll_queue *llq = &cmdq->llq;
+
+	WRITE_ONCE(llq->cons, readl_relaxed(cmdq->cons_reg));
+	return queue_full(llq);
+}
+
+static bool smmu_cmdq_empty(struct arm_smmu_queue *cmdq)
+{
+	struct arm_smmu_ll_queue *llq = &cmdq->llq;
+
+	WRITE_ONCE(llq->cons, readl_relaxed(cmdq->cons_reg));
+	return queue_empty(llq);
+}
+
+static void smmu_add_cmd_raw(struct hyp_arm_smmu_v3_device *smmu,
+			     u64 *cmd)
+{
+	struct arm_smmu_queue *q = &smmu->cmdq;
+	struct arm_smmu_ll_queue *llq = &q->llq;
+
+	queue_write(Q_ENT(q, llq->prod), cmd,  CMDQ_ENT_DWORDS);
+	llq->prod = queue_inc_prod_n(llq, 1);
+	writel_relaxed(llq->prod, q->prod_reg);
+}
+
+static int smmu_add_cmd(struct hyp_arm_smmu_v3_device *smmu,
+			struct arm_smmu_cmdq_ent *ent)
+{
+	int ret;
+	u64 cmd[CMDQ_ENT_DWORDS];
+
+	ret = smmu_wait_event(smmu, !smmu_cmdq_full(&smmu->cmdq));
+	if (ret)
+		return ret;
+
+	ret = arm_smmu_cmdq_build_cmd(cmd, ent);
+	if (ret)
+		return ret;
+
+	smmu_add_cmd_raw(smmu, cmd);
+	return 0;
+}
+
+static int smmu_sync_cmd(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	struct arm_smmu_cmdq_ent cmd = {
+		.opcode = CMDQ_OP_CMD_SYNC,
+	};
+
+	ret = smmu_add_cmd(smmu, &cmd);
+	if (ret)
+		return ret;
+
+	return smmu_wait_event(smmu, smmu_cmdq_empty(&smmu->cmdq));
+}
+
+__maybe_unused
+static int smmu_send_cmd(struct hyp_arm_smmu_v3_device *smmu,
+			 struct arm_smmu_cmdq_ent *cmd)
+{
+	int ret = smmu_add_cmd(smmu, cmd);
+
+	if (ret)
+		return ret;
+
+	return smmu_sync_cmd(smmu);
+}
+
 /* Put the device in a state that can be probed by the host driver. */
 static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
 {
-- 
2.51.0.rc1.167.g924127e9c0-goog


