Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C19C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnrJ8rRpiFcwZt6jaLJ2PB3oGBNZG+6tYm8EfAOijts=; b=pJAfY2fXpQ8iBz9WL6G3Igg1Ab
	ZJhjq8PgIW4DWFKtqEgTR0XYngC4+HLxstd9PsmmaWTDLlTfNvToEUM2pt7RrWwi6zYNSRgiGqkAD
	tIyktSBMrCWw2L4KImYv0bS2qTAWXNpDMM/xIMmLrTPusma0f1khPOY0xyYv7WKHSGpnSk2T8WgCe
	afnSlMitE9obIQbPPutLGfghcBEYvMYvye1P4mjO4UiLy5fVWNt8V9PffHq8fd0pPRV6u/JMixUgC
	9Ly1xjVQ4HKuve0GgzW173GxfUT3cleaelNO22za+KkQn/o2BdBcqxqHUFlUD47P5Pt85hf6eA/P6
	gXTCrBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTio-0000000FI0L-11Ob;
	Mon, 28 Jul 2025 19:41:18 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugS2r-0000000F8yh-144e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:53:54 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a58939191eso1718508f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 10:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753725231; x=1754330031; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jnrJ8rRpiFcwZt6jaLJ2PB3oGBNZG+6tYm8EfAOijts=;
        b=rsK+6iDKCrr/UY80ddBZZENXyyJCaSkDOqBzwvZ8EGB1xNtNT4+YOY1uE1h9Xa9ZT2
         5O0Hez1Fvmok3jFw8qSLXiCnbzNJxpBpmongh7//nmjwDVdpQPCrQCL6/cNkPoDF8b9A
         K7ikuxSGWtXKuxjVj8KrKQ0GACvR5R6YAifS2NwXSmu9e2XwvkPfFgBO80xGSipBksPt
         r4wm0If6yPAeRReMOqFS2s3rQwsyDuudBUOeCvv0jilnCEjtTH4dNSRNjzDEfYm1dcIG
         x3BNFP5FEOCRmJe5WE6I0QR8SLkQo6R8vfxQfT64r7wDvZASto5/wyqbAivxSh0EFcJS
         Mdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725231; x=1754330031;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnrJ8rRpiFcwZt6jaLJ2PB3oGBNZG+6tYm8EfAOijts=;
        b=EWSFc1ewEpIc/jJjR9Y/yATijHHSBCJ/i4HsB02qFDQ/7ftFN1UBJZytX+l78FpAn2
         p0M7OONlN6/4h4XobPG6ygqKr4h2OOT11IWN8aqgmj/uPXMZ4NCUVYX6tO/Ecn9mgmun
         r3AKzlh4eX8MwXf8Oe+JmQ2uojl0bFqCHaRQlCUVRSBeY4WcwGJqcCVwuvXfm8A6khk2
         O8W6cDuftgoR6vZpSOmjiHT38nupKsfIvKpz3lC4VIQ0sfPCykmrZTfW5eoSYNsfGm/E
         2EraShd+pq+/gbYxAjnyZuI3yAY2vYL8lEdAw1mbj+DKfP/PcAZ6UMsFGVnQJfNmQmqn
         v4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVBtL1HKHCseFqxx1trQBWpLz5dYxOfciBaoMXirOI51owDQCBHIsjqixCIQayC8fEZiuU9pYQvKPNU+4xLjeCy@lists.infradead.org
X-Gm-Message-State: AOJu0YxQHTlevoZDf3SzENsjgn9tmhUsd42b4uOAXavi033Hi6EXFo4x
	K2TFh8uE+MHykPh+HV4mG6SZiWsa3BoXQE7KE4811wuZKwJPvfiB56pf2pNCyFYXgUfpB3MWzfn
	zQyhBI/DfBaB5Xw==
X-Google-Smtp-Source: AGHT+IGHsz9MPgnZj965sBmcV3dHVpcs8CmM+t34RmjDx7BARFkS1+Ew6W35n8N0of95SaKBxWolAPNzAtM27Q==
X-Received: from wrs6.prod.google.com ([2002:a05:6000:646:b0:3b4:972f:ca5c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:651:b0:3b7:76ac:8b72 with SMTP id ffacd0b85a97d-3b776ac8dccmr7943968f8f.12.1753725231478;
 Mon, 28 Jul 2025 10:53:51 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:53:09 +0000
In-Reply-To: <20250728175316.3706196-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250728175316.3706196-1-smostafa@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250728175316.3706196-23-smostafa@google.com>
Subject: [PATCH v3 22/29] iommu/arm-smmu-v3-kvm: Reset the device
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
X-CRM114-CacheID: sfid-20250728_105353_294494_D806DEB1 
X-CRM114-Status: GOOD (  11.53  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Now that all structures are initialized, send global invalidations and
reset the SMMUv3 device.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
index 74e6dfb53528..5e988ffede92 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -301,6 +301,40 @@ static int smmu_init_strtab(struct hyp_arm_smmu_v3_device *smmu)
 				       strtab_size >> PAGE_SHIFT, prot);
 }
 
+static int smmu_reset_device(struct hyp_arm_smmu_v3_device *smmu)
+{
+	int ret;
+	struct arm_smmu_cmdq_ent cfgi_cmd = {
+		.opcode = CMDQ_OP_CFGI_ALL,
+	};
+	struct arm_smmu_cmdq_ent tlbi_cmd = {
+		.opcode = CMDQ_OP_TLBI_NSNH_ALL,
+	};
+
+	/* Invalidate all cached configs and TLBs */
+	ret = smmu_write_cr0(smmu, CR0_CMDQEN);
+	if (ret)
+		return ret;
+
+	ret = smmu_add_cmd(smmu, &cfgi_cmd);
+	if (ret)
+		goto err_disable_cmdq;
+
+	ret = smmu_add_cmd(smmu, &tlbi_cmd);
+	if (ret)
+		goto err_disable_cmdq;
+
+	ret = smmu_sync_cmd(smmu);
+	if (ret)
+		goto err_disable_cmdq;
+
+	/* Enable translation */
+	return smmu_write_cr0(smmu, CR0_SMMUEN | CR0_CMDQEN | CR0_ATSCHK);
+
+err_disable_cmdq:
+	return smmu_write_cr0(smmu, 0);
+}
+
 static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 {
 	int i;
@@ -333,6 +367,9 @@ static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
 	if (ret)
 		goto out_err;
 
+	ret = smmu_reset_device(smmu);
+	if (ret)
+		goto out_err;
 	return ret;
 
 out_err:
-- 
2.50.1.552.g942d659e1b-goog


