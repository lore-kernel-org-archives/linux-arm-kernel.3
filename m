Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1964BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56825qeGGlTN+/ozHQUtA7w6Jg/t8lgL+V6rDIROEUU=; b=aq3KuxEN7YpBqVq0kkJ7j+u5uV
	WfvPvYYnnXwDWpbjYV26TZw+QTumzM0YUYxNFcLYtjqv71OWE0Psl9uNca2n0057cXjLh0J6olq72
	zj9EIeBCCWwyXbW8slCRU5Dq1PyQ479jxpjYhtrcksSPrpHrLOH5WKpyJEFzOBXJ7GGFcAm1YHcLp
	vcBYu4+ePSQYBgW6GUim7jlLCQPHISCxMDCEYfftP790B4fjalhdgWFiTnjGcLuc3gKfrjVlGb9Sj
	7QK9QzJrfPpYRbxWRR6gbjq+FGrpQx87GjX0pZppTQjT/D5/lFXTNsvOA3Jc0X1VDyUkeQqtkj3JC
	IFXXonow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIO-00000009arG-4B6B;
	Sun, 05 Jul 2026 19:14:28 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIL-00000009anM-33Qs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:14:26 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso2406187f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278864; x=1783883664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56825qeGGlTN+/ozHQUtA7w6Jg/t8lgL+V6rDIROEUU=;
        b=Ojf5g1M5sD6jbH0ssVwapKh14o11T82h/QxBYl5oDARCsKHmStA3td549POXJT9pQr
         gxnDzOqTPTxB3H6PrA5njAj7lQ7gyhIyj9iQIaUmfq/ie6Zga1RS83OAPNRN08uz2wMH
         TV8Q54EV3F5EkmamsDpku7A49/lyYjm7FQ9CgneS3ATPXf44VqC7vnm9G/VzxlINBRly
         3j/87OntZb0ByQmg6QE2J/UPtlixFFcN/q2iXT/UazFUyKG9+uChRNc4jgqvDOGbALry
         oSSIDvRX03PcfWmxRH3ZHMgzBJYJIced2yWX8WauntC8UcRnyLbS9+QYraH4KA5N/mNA
         n1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278864; x=1783883664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=56825qeGGlTN+/ozHQUtA7w6Jg/t8lgL+V6rDIROEUU=;
        b=Y/r7eJhW4o1nzpEQLPgxvWzCZsc3glAH1IneQ8eE8/DEw91SfXMAhuhIcWk0I+97CJ
         Dcp5JZQh8e5Li2Yk5OmHfhXlxSkvQzkNcNyGWuF95L3XvnOs3n1af3jM9wEcLrMzml2S
         THLnD5rMfpRv0s5qTWw+1n89ca7jSLyVZ6zLhkh5vLfO8K+H9mwdOwNd783zbbTeY0Us
         0tcN+M/tiH5/ZZxtdmqRFqErOs8MnCkLAJKQLqjbaeBNozriqOfUKFSvugqah4X/yuXB
         ff0kO7IEF9EHrQpWluRBdUyEcK+haLvkmQJIskZvVtUJKRF5pzZlS3Z6KgcKKQkVVm3f
         12JQ==
X-Forwarded-Encrypted: i=1; AHgh+RorlD59mQBVnQKwYgrgIqRqGFN08Icc0RujFEtOwULPrDTu82mYEFQk6hoC3VMd9BXoKNob3elPxa/OoV4yvnEW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5t6SRX5uGphHq2XS5pa4t4rga5TMGgwGfNDq1O4zlfeHaVAG/
	Fy7/M5rVym3Q89sSNTJ96kceG8KPxeXGhrYQPUmUOZTWnaFRz5Fq/6k=
X-Gm-Gg: AfdE7cnoRoDZsubGc7257QYoIfE2x87QknoPgg+m+tjBjJXv6Qif8Os1u0YO0L+IkE4
	So1x4Pkdx6qKAo3NTWnxuNTKMQWRJmMecPFkqN/fEVbmPB8lBAdPeieDAoolUYWGCX1kTk0O0Xq
	pLlXdZDpqZqSbDYV3RjxQA7lG4jt3Pxvug5sgPsn71/BIrpZ4Qo1Ylk8sMn1N+azegzMjA/cEgk
	YFN7JrrIrUDqp7mZZTAOmNyZuSOWXK8IFHJvKizMXm+q29ZUkqHR5UgL5aralTS0AaMkyMLkwFG
	b7jmyI2Qv/7pcBkY/4s9Hys6ZPTVcBQPRaPGfM+dkuR3SCtFAx6mEZXSIluWi8+uBtD6Qmq2LFd
	1YbHRRUwdoLYRfD+ESJYG7gj0eCyivHtbOC4/Hqibhb/8Bo3TDrCf+QFO/AznCF7uoZjNFtRj+t
	QewZ15/9Vz1mGYI9c=
X-Received: by 2002:a5d:64e3:0:b0:477:f5c:9bf2 with SMTP id ffacd0b85a97d-47aace8e983mr9385528f8f.51.1783278863594;
        Sun, 05 Jul 2026 12:14:23 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:23 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:39 +0200
Subject: [PATCH RFC 05/13] firmware: qcom: scm: Configure LPAC aperture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-5-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=3104;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=xCTorTjZtBUEYbL6NZx5Fd5BNvNcYE4Jm0bT2+wByeQ=;
 b=JM9qT2757B3skDadThg2OlzWiKU5aLJo5x9qIqus/1JlX88Naikriu2+e98AC1wkrlG4Kxof/
 4ILHHS1V0i/AYzsBbF8lb5SHonjTx3ikmirYkFyCsdZyXrX0gQUGfCW
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121425_915141_B2B92A62 
X-CRM114-Status: GOOD (  13.50  )
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

In order to be able to update the SMMU registers from CP for page table
updates we need to configure the LPAC aperture to include the context
bank that will be associated with SID 1.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c        | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
 include/linux/firmware/qcom/qcom_scm.h  |  1 +
 3 files changed, 22 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..92093399f20d 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1204,6 +1204,7 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
 EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
 
 #define QCOM_SCM_CP_APERTURE_CONTEXT_MASK	GENMASK(7, 0)
+#define QCOM_SCM_LPAC_APERTURE_CONTEXT_MASK	GENMASK(7, 1)
 
 bool qcom_scm_set_gpu_smmu_aperture_is_available(void)
 {
@@ -1229,6 +1230,23 @@ int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
 
+int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
+		.arginfo = QCOM_SCM_ARGS(4),
+		.args[0] = 0xffff0000 | (1 << 8 | context_bank),
+		.args[1] = 0xffffffff,
+		.args[2] = 0xffffffff,
+		.args[3] = 0xffffffff,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_lpac_aperture);
+
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 71ce4cbbf27a..be374cf209f4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -668,6 +668,9 @@ int adreno_hw_init(struct msm_gpu *gpu)
 		ret = qcom_scm_set_gpu_smmu_aperture(0);
 		if (ret)
 			DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret);
+		ret = qcom_scm_set_gpu_smmu_lpac_aperture(1);
+		if (ret)
+			DRM_DEV_ERROR(gpu->dev->dev, "unable to set lpac SMMU aperture: %d\n", ret);
 	}
 
 	for (int i = 0; i < gpu->nr_rings; i++) {
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 5747bd191bf1..70fb93e303e2 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -100,6 +100,7 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 bool qcom_scm_restore_sec_cfg_available(void);
 int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
 int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank);
+int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank);
 bool qcom_scm_set_gpu_smmu_aperture_is_available(void);
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);

-- 
2.54.0


