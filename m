Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E34CE7542B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fOi2vF66t90yroTgrkpJuJ7GaS3pPHt+cx2IRW7gGE=; b=zek9Jq0ltSVC3oR9iApLr0/fKS
	xkGcyyBfwUCZ3pO0ajRIhsRY0bHXtEnAVkqyBUBeO0RrxnKi6nadb3Ub6OTA/GuPTfawZbj3OYJXH
	WKx16wg3L2kORuLBjloSAp3HiJNmxPbv4QoBB4CpxQbKQphcCYAI0HsXWznc6zkhO1TQ+nBwHfqGB
	sMzyXpqQLycLkrzrqn6wfznn4EFKEa0vha1SPpQER0k/97X1pDBlJyenBPihCNuriXtrCWC6zm3qr
	gqXMn8M1rOfGjNIJ6pIkrm8raSk+SpAgqPKHlZ9zhdNop80JF0BXjd65eBAzJVzC26ba5klBoiylP
	dyYV7oJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKq9-0000000Gbfx-0TT4;
	Wed, 24 Dec 2025 09:07:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKq2-0000000GbcA-3dAr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 09:07:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNNjtFa1924369
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fOi2vF66t90yroTgrkpJuJ7GaS3pPHt+cx2IRW7gGE=; b=DxuAf/zBg3i59ppl
	k+V8egBVcJ6GOb65OtIfFKMeFt4llm2xa4RcDA/zhOWZ//fZFZaebx8+HAfeuJw9
	Mvrz6Hxq9numQ31355LhdDPD6xpJW0M0EOFS1OkOwko4fbIsFjaIVUFe8X9mAnz+
	MBIMKUoPUm22xzgD2VjM93/ChNIsiMI5ksSCdvWE5euGhFpfHFMUS4EpEsSDNan9
	06kTje54gZ/YdRvkjToZWXtQfnbjAh19d+/q41g0Z2pYoNaNhrDP9XQs9JxvPSIM
	y6OdOPBMnM62i6v6saYOqpAGP5XJy/KxXfCBKdzg74zrXiCJ1Ny8JVgoPgXvcfVa
	kDGziw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsadce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0f47c0e60so143428915ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567241; x=1767172041; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fOi2vF66t90yroTgrkpJuJ7GaS3pPHt+cx2IRW7gGE=;
        b=J8Dw/AXjBBsXJiG9L2ZpcIDUItEakLj/NlyTYlDk+Uk/n8Vddwb2mqBFLD+NqXEhDt
         Por21X/b43tqynWuoQlyxFFfK6/pm2+ixPEINJ9ID+iBeK4Xcw1T5lTXmesVTUw0Sq7I
         xqYdI3Un97qSfgrXjrXRWIuikXxkEPVxuyeEmMFoMTmetH5/+l8XR4jfi48fF79zK/zF
         JXA0PFj5UiTfnRkC+KhL4LwQTwzzYekWY684CNGiWzxGlV0JVSC0OYQijXoCgaT1lsz4
         TDr3LvDTV3QsSSCsDF4hZN7+WVLOhvGkLvfoHYDvY/m9kEAGM7Hy4HDV4OXBfsU6xGFm
         AE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567241; x=1767172041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1fOi2vF66t90yroTgrkpJuJ7GaS3pPHt+cx2IRW7gGE=;
        b=SPv2DTkhMLBgLrpK8ZMBS67VT6WhOr50+Jca91npLobHRYEFcvNr9y2MMlKHaX1tMP
         BDRDGH63X2AWjpZeDUxMCMY9fHnayEJtXID1Vx1XeKuVvu50QPZR5mecgley7FK+kyo1
         eEqskRgzPT66H+vLokqN6ZpK9KUfSn4URhNzVBSIvEKtkXh+uDGHoEJNZFjlyTEGbCn1
         jyk8L0v5jy1ZHVVtgDkmJ2yE0YXP+WFSKDyYgD+rJKFnFux8H2wg2gYrjUFA3b1FFlVP
         AJ78h4q7gaWj5eNIDIwol3aVNY71oc8AS9hAj00MR0lnrvMSBGSY9RX6I8sKZs/e16U/
         Z/sA==
X-Forwarded-Encrypted: i=1; AJvYcCWbHedbUyyP+8N5M8i/pu1ovq4uVtnfps1SRTXhD89DnaXRhcF/mqzqOEJrBeWPVAWYAp/L9FMpBZZzuU3PK7M+@lists.infradead.org
X-Gm-Message-State: AOJu0YxpChvyLaEzhWaGY90annf80vKAhOc1Z3HrydjZnbM7eORVhG4a
	TbTNc5lqhO4FQqPBpnZrnIbJntQEIBanECq7abmd21+JWlUNeMk/Blg1HSBT127yFsSfrUSMnwx
	/g4vkEyq0N/uEyKVe/8ZZBIU6TGRaH/ea4bqsd11kl8yll13iO5xhmTqxI44OHuZ4RSvQIhAtk+
	PtgGnPwLpxwg==
X-Gm-Gg: AY/fxX6xvXs8fWzwhilrwBr06b3q6yK0IPQXEIj2UI/f/HE4X+TKCDPjlzK+YCWjW5l
	+V0r1GoEwe5fxzMzv622+Iv2yMR2XU36fBQseNmcOliob5wKYaQk4eV24uPy+DWYwYG0wRWLDA+
	HRcl6jNZHPU+RD3IYJX6u9rV/u1gPL0Tfymz5plsL6//ad97S+QuexYkBo+ywfz6EfVaT07otcb
	ZSHuKkY4hjuFi6imkWz/DCDsG3KUpBY0Q+yoaVOyZLQ+iUUwKxvA9bY1RitXnnDGsnzotYMWMBg
	Ve0Xjg2EmDpJj1OqlCjWLNHfydT55sZY38Ooct5hFFkMTHW0JhTAyEAGdkiDDjS+Of4wGyrfCa2
	yC/wGNfB76JPLCjDD67UPN7namoDdBKv8XSC8fF6ifSgWxGI7s+74qAfkoKmD55fKPE1ey7Cj
X-Received: by 2002:a17:903:249:b0:2a0:de4f:c9b with SMTP id d9443c01a7336-2a2f222b700mr179027065ad.4.1766567240660;
        Wed, 24 Dec 2025 01:07:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQC2XxAia4EX4NnIXvKYIkoEvVHiwnA8mWK4j1DSqVZwUZZzFNed1w6NIHIhhDYYgcHL8Lnw==
X-Received: by 2002:a17:903:249:b0:2a0:de4f:c9b with SMTP id d9443c01a7336-2a2f222b700mr179026685ad.4.1766567240214;
        Wed, 24 Dec 2025 01:07:20 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:19 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:14 +0800
Subject: [PATCH v9 4/8] coresight: etr: refactor the
 tmc_etr_get_catu_device function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-4-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567216; l=4412;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=E+ppFBcrIJvAdTSLfg3aWv6Te2yyYQtt5h1yCZRSC90=;
 b=JorYpjDt+HQSZZ4cqDjMRyi2/w/tKFXOb4XpusXf/jp/55B0wZHXDs+JaucpIRzl28QKDlkgG
 cMNvERbaINXDNbFhJsuUGl2JFNVE9P6C7AWXC4/+2+DZtP4iH/FsDSx
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfXwJlt+Ysn6ASb
 nSMfdKYmE0ojK6HLpgyM9mUesRUMKRAiUeTiiEneF2pd+OIj0LseTfpig1Lj73D5DrUhnJCUu7T
 KTsahJ0y56qjeo8mhkSORT1MKkh3bMr/u9kVGJcXtVcPaKWTZ3ErveOGRijKM2tWex1qX3KQKHE
 aqmPXgfSFa3ms24uU2BSxSgXBtFebp96PWBKXW1OcPRS25B13whK+jMjC0uiJGFAJfSZt4qoWbZ
 xaNXLPkqDodu07SLItZaRpYFeB8nnkDncs5kln9MLTiHi+txj+XFXPTv5gPatePzT79aTIqg+Sh
 PvVi/4m8SYLLqqIb//JtMkZFD+TYzIhiiavtEw8YudevFPsirWvOwpT5tBAWLKUeS+HjMMo0dOk
 vL3JPQCI0Gr0CFiXHbY50UmxJT5riAmjY2YrlNQxpGQdMvxOKW6jMc+MUImjpS/S8i4mbJ7lNbY
 Edb5KRazrYjXEfEFzZw==
X-Proofpoint-ORIG-GUID: 8VL4clEX2r_VI4ygOPn0h4OatS_OhFVo
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694bad49 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-ozbsww5GKt6_lkPIaMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 8VL4clEX2r_VI4ygOPn0h4OatS_OhFVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_010723_239768_5566861E 
X-CRM114-Status: GOOD (  20.76  )
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
index 2b6ca1f8bed2..18981b6cc172 100644
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


