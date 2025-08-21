Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497CECA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 10:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eFk83CXRUT92P3+BiK0rArrXXY+KdlyqnAXLmJEMLjY=; b=I9G/7JlowBVIAGFwS9jbmGo+lv
	vkkjOMIxHj2/ORa5EQgvdXp00bDB00LF4igKz3/zMmlZ7Pn3mNMVb4QMJQTkTaLGhlYiIJms1k3iF
	WaUGEF9a3CxCerAbz/D3/bn+ImwPPubDR0+FnY2CQ+3AsfYvbcY8JodQfEI5YziQRsv/HNXYKjYIY
	kpmEMBLsilzEifykDVLvZwQnyilFmpfqkOMPHXHCrhHv1Cu9h3BqZalngI+NxBDboTKuvb4PZ+di0
	FkcMiMjk2XfCnrbqti/euW0KnFf2WtL1x3rJcTPnyWFyfyLUieJU512flKjKkRln7AJFJWQhodtg9
	tw3p8aXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2aE-0000000Gcc6-0dCK;
	Thu, 21 Aug 2025 10:31:50 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0kH-0000000GGa0-0fwr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:34:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3b9e7437908so499358f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765243; x=1756370043; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eFk83CXRUT92P3+BiK0rArrXXY+KdlyqnAXLmJEMLjY=;
        b=JwF++7ORPXh82ZLxbEnL0QuFBHMRkmqJSzTQgjcviAOvYIAaYryRL7YhWrgNun3O6v
         n3IajP7lPCKkbOaHemBjSI5dSgK0IgQzNCuPICC7c9Vzgfq8vvTCDAJ36OXQ4G0s0BIg
         Kd13k7WMQi9HZzAQ0fja3UXnjCsif49UMGRsA3T9GcjEjEYXY+wd/9R24V9/0kVCc+hQ
         chdukwh9CWwAbfLLf2ZeC4d2xtohrGlauAZlCRpCLf7K0qkrPgsntXywXFN9QPpVaXnP
         xLxefL9AeAiFiFrMn75OEmNfukN+u5QOByO/64heJ3Kaus1F+YTBJj4fxvgBMw9pdSic
         E97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765243; x=1756370043;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFk83CXRUT92P3+BiK0rArrXXY+KdlyqnAXLmJEMLjY=;
        b=lyBvrCwPpp0g17tTJaOZ3avrFnOfGYydkqUrqcGulBzVZ4gpXyEqlZXTaZDiixICuz
         zrF0z+uFvx4YrT869qHDFEclNd7Oo0CMM3/TFaBMH9jTMmdg5pFxXEL25fCuvVAZfITT
         oqY5tglgVVKzG7dvhaiBdKvOp9v5FoM/963i0ucLkd29/It9VYkOdnp3IZiHIdz2j2f7
         1XQ4m9M/rYAkzk579yKPqfgCjsBQ7CWQZVnoSmTi98kqHe4K+B3XLJCI6/T9r3csu7Bw
         rENNMnKUqfw5e2tjixYomXxHogpi1PHRkRLcA4RBnLae4ET6b8QCPiVoPpSA0le/cCVr
         +TDw==
X-Forwarded-Encrypted: i=1; AJvYcCV2C34GS5LwHS2a6PPzn1o1dDwhH9jfQ11nJ727Ipti0cnr+l68OvFCdZWO8k2X3hTb+Hw1YlzCVA08HAgHcFYZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyT7zuyrJGmf4Fc6eIv5uN9pZeVK2Hh6tdRODtlBSLbyKhE5eAw
	MWXYyH6w+ollhc/B1wE5QEGiZosrnuHcpNzUwn353oHsgxebdLPic4SyZbcjGqt3/yI=
X-Gm-Gg: ASbGncuV+umTGMfU/AMQXsnmUxmJgYVvKSB/BW+4p/djHgHf7gXr4+2pQKeC9FwQT/i
	QSWZ67xKyQ4vSpZbRzEg3pVkwQhmrQgj+KlRXwC/yrJfMG7h248RcDBC4BlPZ5Ot7f3OTxeEdiD
	9q1fNiW1El+SElKNruW8MUOM/AAWgyRDWdfEXxp3ZrOzfw5dqC/atvMk7sZGUOZO0ldQFtqn7Bb
	5Q04/iLBUR4j8cbPZQkZ6WCmEySnpFdBOxLevStgWY6MB/Hi4SfCp66vSoSAVVGm1yNeyU8Z+xe
	o157XWr5Cc22roGCzfbsrYZmIYTvGlRcCaUSJmbv5m/VhixMVsgBDhdj410bFlqdbsFjw8XzFw+
	1Q0FtDAWBqkloKMRTES3a6XpHsdP135hFb6bm
X-Google-Smtp-Source: AGHT+IHW+YsmBVfepjw0RvvbIvLuyUZUzNrK5+vJha1JHDeloaVHEaX39wtYCOugbW2Umy9rn6hFAA==
X-Received: by 2002:a5d:64e7:0:b0:3b7:899c:e867 with SMTP id ffacd0b85a97d-3c497741f55mr1258810f8f.59.1755765243275;
        Thu, 21 Aug 2025 01:34:03 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:a59f:f2cf:3ca3:965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4db2a491sm18681295e9.8.2025.08.21.01.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:34:02 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 21 Aug 2025 10:33:53 +0200
Subject: [PATCH] iommu/arm-smmu-qcom: Enable use of all SMR groups when
 running bare-metal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPDZpmgC/x3MSwqAMAwA0atI1gYaUSheRVyUmmrA+klRhOLdL
 S7fYiZDYhVO0FcZlG9Jsm8FVFfgF7fNjDIVQ2Oazljq0GnEFOOFp98junUtUqTgLXkytjUBSns
 oB3n+7zC+7wdtNni7ZwAAAA==
X-Change-ID: 20250815-arm-smmu-qcom-all-smr-1fc81c10840f
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_013405_205208_2AD39F64 
X-CRM114-Status: GOOD (  22.19  )
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

Some platforms (e.g. SC8280XP and X1E) support more than 128 stream
matching groups. This is more than what is defined as maximum by the ARM
SMMU architecture specification. Commit 122611347326 ("iommu/arm-smmu-qcom:
Limit the SMR groups to 128") disabled use of the additional groups because
they don't exhibit the same behavior as the architecture supported ones.

It seems like this is just another quirk of the hypervisor: When running
bare-metal without the hypervisor, the additional groups appear to behave
just like all others. The boot firmware uses some of the additional groups,
so ignoring them in this situation leads to stream match conflicts whenever
we allocate a new SMR group for the same SID.

The workaround exists primarily because the bypass quirk detection fails
when using a S2CR register from the additional matching groups, so let's
perform the test with the last reliable S2CR (127) and then limit the
number of SMR groups only if we detect that we are running below the
hypervisor (because of the bypass quirk).

Fixes: 122611347326 ("iommu/arm-smmu-qcom: Limit the SMR groups to 128")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
I modified arm_smmu_find_sme() to prefer allocating from the SMR groups
above 128 (until they are all used). I did not see any issues, so I don't
see any indication that they behave any different from the others.
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 57c097e87613084ffdfbe685d4406a236d3b4b74..c939d0856b719cd2a5501c1206c594dfd115b1c5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -431,17 +431,19 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 
 	/*
 	 * Some platforms support more than the Arm SMMU architected maximum of
-	 * 128 stream matching groups. For unknown reasons, the additional
-	 * groups don't exhibit the same behavior as the architected registers,
-	 * so limit the groups to 128 until the behavior is fixed for the other
-	 * groups.
+	 * 128 stream matching groups. The additional registers appear to have
+	 * the same behavior as the architected registers in the hardware.
+	 * However, on some firmware versions, the hypervisor does not
+	 * correctly trap and emulate accesses to the additional registers,
+	 * resulting in unexpected behavior.
+	 *
+	 * If there are more than 128 groups, use the last reliable group to
+	 * detect if we need to apply the bypass quirk.
 	 */
-	if (smmu->num_mapping_groups > 128) {
-		dev_notice(smmu->dev, "\tLimiting the stream matching groups to 128\n");
-		smmu->num_mapping_groups = 128;
-	}
-
-	last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
+	if (smmu->num_mapping_groups > 128)
+		last_s2cr = ARM_SMMU_GR0_S2CR(127);
+	else
+		last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
 
 	/*
 	 * With some firmware versions writes to S2CR of type FAULT are
@@ -464,6 +466,11 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 
 		reg = FIELD_PREP(ARM_SMMU_CBAR_TYPE, CBAR_TYPE_S1_TRANS_S2_BYPASS);
 		arm_smmu_gr1_write(smmu, ARM_SMMU_GR1_CBAR(qsmmu->bypass_cbndx), reg);
+
+		if (smmu->num_mapping_groups > 128) {
+			dev_notice(smmu->dev, "\tLimiting the stream matching groups to 128\n");
+			smmu->num_mapping_groups = 128;
+		}
 	}
 
 	for (i = 0; i < smmu->num_mapping_groups; i++) {

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250815-arm-smmu-qcom-all-smr-1fc81c10840f

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


