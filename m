Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85988C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 07:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gIye7UQNPbdPhV/Q1vWHhs/KIv3bebvvJhc2HVhooY=; b=v9siX97cKWEaBt4utJZYbMlP0w
	ARjbKEpp7ejotLO4IbNIOY8S8PegdBdFPm4O/AvR5yCX54pEUeU3FW9wsmmcz5k37v3fo82YPu8Ml
	CVWSTQbhrBUuV3+4WX5GcFDfU459vc079NV5vH5akJc7gjoe8dVgJuvLobr3aTvtROb+DRa0F7CjN
	AIRZVJ1MxpT1+4V9NhNysMKW1BG2wTQHI1jUDJ1Dhdhk0LgZU17e4AMIa9Kc6u5TPuBYcMmIRIeRK
	lwaaGRhdaki4pAaj7fuaK56RvyxQ+sFfmykYEGcjfxPJ5T+9PBCzY3GrL4E/ydEPaW0uVE+6gooTR
	heQjGzmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHLG-0000000C39y-2V34;
	Mon, 26 Jan 2026 07:48:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHLE-0000000C38X-0fbx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 07:48:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PLS2Ve4162524
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4gIye7UQNPbdPhV/Q1vWHhs/KIv3bebvvJhc2HVhooY=; b=GrO8H3fht2IipknQ
	sSKyAl4IYQHxY1pMQQDatJPvob3JTF3HImBr4ENW1yC2sXQvP6lzZsC2Gx9aaMQP
	pkHVjwQg0iBU6Q7Gl8KVU+VfDXn3nMF/GZ4ZiW+rjhKMhkC5ZSindFIf0dpiF9M5
	jzBDt18AejB1L6MkudfIr9Ky+IaR/Ze+aMumJfIMGdtV4mLkgrG8FcJGA9ohIlUY
	WHscgldAL7WDUmyTY1WvnnL2/w4GZ3tVRCyx+eI55O/ZOsjzeInNsu+g363lbIAd
	UwoYhcec6B9tR7/QzKoPql/WC6tmi905gd66h7BoF15wnvNrdAhiV4NO9u+OJvfM
	owMHUQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xus1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:48:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82323cc7594so1002442b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 23:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413734; x=1770018534; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gIye7UQNPbdPhV/Q1vWHhs/KIv3bebvvJhc2HVhooY=;
        b=eLILARPqueG0nlLq0F1WID5er12OZtD9funawRpnV/pmbk/0oGGGe1bAUXoc8Eyddt
         P3p+J/IDcjY/Y5QoubkKuM6+MiNJEJhBPx2sRa/pGfZkE7vUoCSJnjQpUHrB6t3Jr0qZ
         /y9vYh82nCYtSZ9DKdeNFovKZfK7inyk3S6lLz6vq1ZnokUNTMIlf7RAZN62nH1TTNFt
         VtW9evK505WdrcTgu90wTHRvA6m9OOCXD8PxGAMIqBn1ZuMawkMrK/j4C5PsgikvN6th
         hkHdxVvvFc4fRrpULo31mcbU4pfbSjvk8mVIURbakgnaN6cm1ydhyT7hM79Sd35EBIXV
         f1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413734; x=1770018534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4gIye7UQNPbdPhV/Q1vWHhs/KIv3bebvvJhc2HVhooY=;
        b=Rvtn2aWF2+4KlsEBFVry6uWylBqfAVZSVeRNWJAtI2ApJunMsK/J+DsHsS0u/rCJP1
         9NYMm3BbrjUd42hQRkJQitmYJytidA067P+vK7Pt6fcQldkzCgC/6NOj5xTUisiaxo6s
         9EO9NHhFM/89gbW8UVA2H0QxbX5BV3SEIov0tYtxPbycTKeeP0ONZMcn49OiAV+a47i9
         KUbLlCBZPdOEkQAqAxgy2XU3ve9o3F+92L2uff872eMqFLKg1RAgR14jlpxtOSdRdg4c
         /RNq8+ex5UjtEWvUCBEdRtfwRnffc0RHCv3bSapilE+r3gnqWYsfUjFj1ZWb+4fPM0R2
         mYYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhgcW8OIlMkgzrBZ3JlQUSCAkSE5E+Os8/TFuvz6/xlrmi4OCui+7tlO0dRFPoOXs5u90J+AZetGcfxfXzt3q0@lists.infradead.org
X-Gm-Message-State: AOJu0YyYdtfjSzTkkJ+W1lJauYCj7d8SmTBmJA05I09vuOmNQ9itpNn8
	M1Rj7Jn8jLHsBxv5kY+UCn3u3MExRofzGyrt2RqEZFBhfc/ANj8Mkw3ZS21AX4LULgQBhD48/jn
	qqLwfsdeueDJaamrYXkKdkdOQEhBfocYSKDByODwAHq5ONJncfasbR9X5uqXcBvwAE34gjJZ97g
	5Huw==
X-Gm-Gg: AZuq6aLkIHDnHFxMVbtWNQtlNcE4aVSwZSSWYOqyJQsu2He9IWg9AXfPab85p9fkk85
	yxrr0yxmPW7vaT6B/tYZaa8jcCi1gwqORenmCSUn1g4vdC3EkffxdTYjFDkSbiI+nWXQGC5Kjo4
	NhfJL2RZqemVmLjUvipjsExyRvI685G8Q7Ymb8HBv+RgqA1vf3j2sWqgFOxB5sB7tYBa/lWTC7O
	sD/CZKI4tSFUeGNwQvPVxCiiBjjsv90RnvZvtLtn/Ptn9YdSAe4hoW24IZaVd3xYACrAUCoyx9s
	WAT2suzMVDYoeFL8yAa1oIq0iigr5QilgtSE6bxrQFxJxNeBnXzdJ+Qcwzty8WdWSu0ugYeW4sg
	z0q35Pd3WMcc+BaU05GqjdDFQixfCfFhvTstBoNOWMuIwxvcWPzW1QKO9LemSzmyChi950tTws2
	VC
X-Received: by 2002:a05:6a00:8d94:b0:81f:995d:6cb with SMTP id d2e1a72fcca58-823412d9289mr3296077b3a.36.1769413733962;
        Sun, 25 Jan 2026 23:48:53 -0800 (PST)
X-Received: by 2002:a05:6a00:8d94:b0:81f:995d:6cb with SMTP id d2e1a72fcca58-823412d9289mr3296055b3a.36.1769413733496;
        Sun, 25 Jan 2026 23:48:53 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:48:53 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:47:56 +0800
Subject: [PATCH v11 4/8] coresight: etr: refactor the
 tmc_etr_get_catu_device function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-4-c0af66ba15cf@oss.qualcomm.com>
References: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
In-Reply-To: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413705; l=4412;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=fYWi6it3rCCr65Id+LeC8mkX1SDe4sDJPpCZSTfEuGI=;
 b=UJnXSFL79huFwDQeeINc5HmqIQvIG4Wua9f5RXCBnj2KI8WFg7dFFU3bzJbZunIagSjnxh6Bo
 WobJdmWoxbXDUSqzioewnFE2oO4k9VVDYNQElrobh6S6ekOCGvUzSVu
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: _S61vGJ3TCPu4dat3ZjHkDZY2HkLX6zt
X-Proofpoint-ORIG-GUID: _S61vGJ3TCPu4dat3ZjHkDZY2HkLX6zt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfX0eMHIpOA5dI8
 0GA0n1gso1kn0pVmC8mVb2wGbkIk8uX3QTkCh3iwbqYES+bOwuutSPhIY0nckos90NB6lCQuwtW
 CmcHSFyn2aXMKSn8d/bS0cOKquXhfxesMlM47Ccbk1PVD10vfcK09o64BZYTBhwW9swxdlHhECs
 6pI9UqaZlA73FFMNEL0xmLK4RQyHjVYRtSwyAsBUiZxogv831dxeSFeMgnsqJGHwreNwFdn0iq1
 Zzzb8vZAPWGMCLyT/sU5fv5NBsPStwH8jEnMMAmmWxFEBvYfMQnp9PBHaOINbWVrt4PR4ZqRS5v
 pOyvfJFZxRLiEszhiuyNc7kotievssqARBj0pa3XoC11fnYoRp0xxThNRdfODj0uILZ6JCRJnLH
 FVyhhSul8K43CQGXzHbzuxyqbjmigSBlabmDf+NkKaRVYcHtUCsfBVEs+OAE2GJZ2hb9UD0CdG+
 dO5KweLj9np5LjD6G7Q==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=69771c67 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-ozbsww5GKt6_lkPIaMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_234856_349066_65C99441 
X-CRM114-Status: GOOD (  20.65  )
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

Refactor tmc_etr_get_catu_device to retrieve the helper device connected
to the TMC ETR based on helper_subtype.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c    |  3 ++-
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 32 ++++++++++++++++---------
 drivers/hwtracing/coresight/coresight-tmc.h     |  3 ++-
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index 69b36bae97ab..d3972619cc96 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -334,7 +334,8 @@ static int catu_alloc_etr_buf(struct tmc_drvdata *tmc_drvdata,
 	struct tmc_sg_table *catu_table;
 	struct catu_etr_buf *catu_buf;
 
-	csdev = tmc_etr_get_catu_device(tmc_drvdata);
+	csdev = tmc_etr_get_helper_device(tmc_drvdata,
+			CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
 	if (!csdev)
 		return -ENODEV;
 	catu_buf = kzalloc(sizeof(*catu_buf), GFP_KERNEL);
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index cbbb15648fb7..16a4562533d5 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -844,28 +844,37 @@ static const struct etr_buf_operations etr_sg_buf_ops = {
 };
 
 /*
- * TMC ETR could be connected to a CATU device, which can provide address
- * translation service. This is represented by the Output port of the TMC
- * (ETR) connected to the input port of the CATU.
+ * TMC ETR could be connected to the helper device, which can provide address
+ * translation service(CATU) or data filter function(CTCU). This is represented
+ * by the Output port of the TMC (ETR) connected to the input port of the helper.
  *
- * Returns	: coresight_device ptr for the CATU device if a CATU is found.
+ * @drvdata	: drvdata of the TMC device
+ * @subtype	: helper_subtype of the helper device
+ *
+ * Returns	: coresight_device ptr for the helper device if a helper is found.
  *		: NULL otherwise.
  */
 struct coresight_device *
-tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
+tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
+			  enum coresight_dev_subtype_helper subtype)
 {
 	struct coresight_device *etr = drvdata->csdev;
-	union coresight_dev_subtype catu_subtype = {
-		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU
+	union coresight_dev_subtype helper_subtype = {
+		.helper_subtype = subtype
 	};
 
-	if (!IS_ENABLED(CONFIG_CORESIGHT_CATU))
+
+	if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CATU &&
+	    !IS_ENABLED(CONFIG_CORESIGHT_CATU))
+		return NULL;
+	else if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CTCU &&
+		 !IS_ENABLED(CONFIG_CORESIGHT_CTCU))
 		return NULL;
 
 	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
-					  catu_subtype);
+					  helper_subtype);
 }
-EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
+EXPORT_SYMBOL_GPL(tmc_etr_get_helper_device);
 
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
@@ -913,7 +922,8 @@ static void get_etr_buf_hw(struct device *dev, struct etr_buf_hw *buf_hw)
 
 	buf_hw->has_iommu = iommu_get_domain_for_dev(dev->parent);
 	buf_hw->has_etr_sg = tmc_etr_has_cap(drvdata, TMC_ETR_SG);
-	buf_hw->has_catu = !!tmc_etr_get_catu_device(drvdata);
+	buf_hw->has_catu = !!tmc_etr_get_helper_device(drvdata,
+			CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
 	buf_hw->has_resrv = tmc_has_reserved_buffer(drvdata);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index c780f6d5dede..e573503f2edf 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -469,7 +469,8 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 	return crc32_le(0, (void *)drvdata->resrv_buf.vaddr, crc_size);
 }
 
-struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
+						   enum coresight_dev_subtype_helper subtype);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


