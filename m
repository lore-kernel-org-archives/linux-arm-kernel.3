Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694C7C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 02:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDoLTMZ0B/5YJB6UPqg6ddrMGqlIPrOwvKMKnhBl/fg=; b=JnrObkiQRbK8QBiymRt2y06oyP
	MVPaVAJQTGssPgzIiC4iK8HCAdBg08nx+ZmaLJV78vTz9AnQUWUadgx1xkSuGLfmq2Oer67PtxR41
	BiDssacCLuIbfLBMm8prU2nXhhFXXUnbDWgPUu/yE7hE0egeWyPDdPJSrjx5HyHVejBCRSVMv/b7k
	cll0tbvxG5Q6omUuEZDiBuMizSelctFDQE2htzeC4XVA18oDInc+HTkU4HX1TrO3F5AaXJxoSRdFS
	1w4yWwIIYGmFEYUQaysb+qKSGYSQcWo1IHzXBaRastO06L7nXVqi2xygG7pY7JO+OCqXpMeh0SJ8O
	df2GEfwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik8A-00000006IqU-3MH3;
	Thu, 22 Jan 2026 02:09:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik88-00000006Ip0-1hMT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 02:09:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LLOLDJ107156
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rDoLTMZ0B/5YJB6UPqg6ddrMGqlIPrOwvKMKnhBl/fg=; b=LmvrmMfS2MrkO5Yr
	D9+fraziqK8OC/qlIsjMNuADn9dWfkkC/pM2MR++/zttxhAaynddedc0enbKgUUe
	JceSPg4vGN66jYll6F7yD5c30ldhuuaothl0H2z0HzsQvu0F91tLmqBm4cu1fYCi
	cpWWSTC0PV0oHFUDwPDVRX9FfHCqWvGjkZ6VcYMytwnquZKpwB1Bqwx0FXkFW2xZ
	gf2Z867zNFZD86ovIPzrodVdBhrAKC5+SgoyFohX6MnJVttQzwWGrdEK8GSLswaV
	bHmaChElXYpRJ3NZLpGHzvySZDAY4lT+aq7HzuTFNeqC4l8OrCya12+sEgau67vp
	+JinXg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pgrnap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:09:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f2b45ecffso7200615ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 18:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047742; x=1769652542; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDoLTMZ0B/5YJB6UPqg6ddrMGqlIPrOwvKMKnhBl/fg=;
        b=XD2B4sgEJEJIFlcHInHCPhmAeKgwdc0oLLcquJBkt4xstHyOWfKfJHWqlYRXcxzL94
         tGOz2rKtbSKIpGQOszDg4uZvFgYk9Ervpdq+CdoLRZHPLXj2Oer4yFmYEkKoR6qljc8c
         2BbXLAhSt/CXeoMjryehiawS6hpIbfrrzUJm1uo1Bz/gJEPp+/b1ThhJNTuOU5PBcHDK
         FfNVdVK9VR5zA3o57m00a0LScplXlWQubHfPhoffCF2KcZoTAaKsiOrBDYAluJbbGHF8
         jcE4N5C5vj1qN5Jm3Y+aVs3jriVfVIugZoPtwFYeK6elwZuEJRVhk8CBu9BsrAQlS7YO
         XcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047742; x=1769652542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rDoLTMZ0B/5YJB6UPqg6ddrMGqlIPrOwvKMKnhBl/fg=;
        b=fJlFaUR4042gWYo0mBJcZ2k47QivMqFBBqF1sgv2DqPy6VKPZmE9IbI708o4QshSIt
         oMZxx56EA0KLy3MhhsKe9NCYbZwu9nj8iBtnx4Shk75pkLz/rULlyVhOUFut3/Zn3Ln3
         TTTfboOW+haFN5BBulvkmc7Y9w51DZHm6W9TkNvNgjSWGFcTYJQ/DN4L8bKsCPonET9Z
         0XdhC2JNmi3VAMaOWJ3RG6rmKHaqYKBYBLvXirqP8jhdPxv0SGu4DV7n8ka80GXf9Yt2
         puiLT2ljBUdeFsEutxfnG1e2ZffdxRAe/bEiXtIFhdrbvynWJW48MWYgKDa5iNjAmzML
         H7bw==
X-Forwarded-Encrypted: i=1; AJvYcCWPhJkePVvzaS33e8hkGyBvcvAv/aQ10xKEthXcGrXmSKWFsxWmPKpSLy71vY+PMV5+OyeAT2PZ2ecplC/6rNxp@lists.infradead.org
X-Gm-Message-State: AOJu0YwE0GKrR9vZtRNqki7MZnS8PIbdZM+8F2iD1AATFhEOMPV8vBbe
	4/6YrOcw0hZArOMzuyiJ3ubEnr1ihUMPbLL7kH7EOTvgyVjP83RXBHgNBOqPzan+hF/Edt0e0N7
	0Rvpy7K5B3laTL//5Z8y6XvytBUo/esaseYVJGFoqVoC9aBgqv8Muv+W23aqNbiDRnVeolDvnbH
	VmOA==
X-Gm-Gg: AZuq6aLu7544Yij67ObKslseEeVeqXxsMom2LAvc8QE7jH7NbhDsJuETyiJEYUNDUig
	tgSjTwzXyUPUfpjECv01NEYQAsDP6iJU7UKWVRIHeM+/342Ki3A6z+aDQoYMbQNc0lYI6Q62YfE
	evvn2RWYw92+GmMvWzJ4z+L4fiP8sludnOhUzqWZrAW4Fog44RBwdg8saX4gPDyXZq2Rdl4muY7
	2vtSOKXp+SvKMlGGcjpYzUM/0M30bZYaaxpLpn9s3R50kV3Y8ioqyO7zIUBMJd+T1NkvL8QSfpM
	daRL1/XuR6cSq855LGlwTe1bsAYi1FTU75zgTHGUsXlaeaFc0+n86cCGO90c2fQ8pBaqiZyY5VI
	kL30J0NQltMIep2YYeBDLcoh3RnLvIEldoNfyhFznWkqVGxQVxfUhQfonij2a2XhRa0IO0m08
X-Received: by 2002:a17:902:ec8e:b0:2a7:5171:921a with SMTP id d9443c01a7336-2a751719312mr78653735ad.54.1769047742039;
        Wed, 21 Jan 2026 18:09:02 -0800 (PST)
X-Received: by 2002:a17:902:ec8e:b0:2a7:5171:921a with SMTP id d9443c01a7336-2a751719312mr78653315ad.54.1769047741481;
        Wed, 21 Jan 2026 18:09:01 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:09:01 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:08:17 +0800
Subject: [PATCH v10 4/8] coresight: etr: refactor the
 tmc_etr_get_catu_device function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-4-22978e3c169f@oss.qualcomm.com>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047715; l=4412;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=1Yd4/OeyiYY49Es4IJlY73zV9yzGJi6c/ilE5vOhlX0=;
 b=DTMOiYD2h4vVx6W7jK2n596Ajp+2RBJ2ATsqrncV6tq1QOz6iBHg/9UDdHvW6nYw1ldjPJNES
 MDZgoyGPZoICgwR8/fUlFokUpybl7HsS3KUdGcqsENSUfvZyFr37SVJ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfX3QH9kGM1xCQQ
 KQz33mXOLBZOXDgCFyOvOxn9oKU9THFH7YOH6kYav7bDRUcE2DzwWBqtRV8HzMS1YU2aAjZ5Wbn
 NxubMNdqxk/7iH9C39/agEHMNFHkMk21ktSObRxNSrnfGS9SSg9exJzx0ZYHnJFae8G/HSC8J7m
 MXXdDGk1KGB9uxlo8+b4uciYHWTI8nwtdAowtHe/t3JjLzbYokEkG/ypjhXIk4uKtmwD1pcq4Ew
 pilSL/YwXqrU+surBIGAjriGyzqVEGcYoeEMwUit0UiT0Uk63Dq6VLJU+IRD0+IMjT3me1VrxG5
 z5igrCdqPudYVhZuQc0WtCi2GmG3KgBO3Eod6IhzHPgejgqMmDpn56M90IbXmx3GxtdW1GdPiKc
 HEZbohYumDb2Rm+EpMs5OqErU+zEeyYsqGYmylv0R7MYOjIC7/Nal28lQxLfh1gqWUO7DVYgrdO
 ieDJ0T5cMcwhrfutccQ==
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=697186bf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-ozbsww5GKt6_lkPIaMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: weaJVhjgDB9RMyfpAOJe7D6SCAVDyNUW
X-Proofpoint-GUID: weaJVhjgDB9RMyfpAOJe7D6SCAVDyNUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_180904_577903_1F1A5B41 
X-CRM114-Status: GOOD (  20.61  )
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
index c9a82ff6cd00..7690a70069da 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -471,7 +471,8 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 	return crc32_le(0, (void *)drvdata->resrv_buf.vaddr, crc_size);
 }
 
-struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
+						   enum coresight_dev_subtype_helper subtype);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


