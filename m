Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF11BFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 09:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLmPbizSg/gAJWAZj30yWEqBSWQcqsiJfIa8959c2Sk=; b=cvyo7JOuZ3WNyARHzXnNIYZIsq
	9Q5vQfEv1H17pLIgupcIlHWDDjpHNZFOlFrOtzgNM2Iv/Bk58QPTgThpKAZ2vYEph985jCv8d+P73
	4eYCerc3Ir2JZR26zontcchximLoswzCDsSjrjgxlQDl+V0EOkWk3Qp5STXwoeLC4E6mz5z/UAkDW
	OLiH3PAdFxCUnFKWF+edrF4dpcmfuiWa3LGSSdx5GtwePIUg3g+MZWI6Fvc8oUm/Q5Nc/+pVd7A1X
	MNeYt22tNuDdmpbR6EeP18AvnM4/zCXp/BB14eQd9BZ+Gsvfi+f4MOrooU7yyffY0G+s/RZf4MAsC
	m0tx0/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGw3C-0000000FPTj-49Wy;
	Sun, 26 Apr 2026 09:45:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGw37-0000000FPQI-2yOB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 09:45:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q0DZWV3924771
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 09:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLmPbizSg/gAJWAZj30yWEqBSWQcqsiJfIa8959c2Sk=; b=fMo6tYQXYIQ/nReI
	RzyzlkLzYfN7gZOIdORHwEobn/IDWE5QXNTyr9zDbK4/g/UlErDTw5yWCyngO9a9
	VONir/vPWOtg7VjJj6UVE332fPqyr5yfSZza7Py/i2k0Ua6y5HVrG7TGvlaxv/u4
	fJPyLp7c5MAVKjTMI6VoH57Da/mOoGoMLd9+UNcQtVOAt8AtCf1jY3baQqgP3o1X
	W9R3rxEniONOfOMw6e+mYYztd/OXkeOnJ7x+dvnlwxTjqOtEaJtwjVwXZHwc/g6q
	zHvAAaQtmgu7Zd3Iw2PwSCJyoQ2CH7m5czPWNE9Whlr4B26+kgHzIKiMc2GByJkM
	7r/qwA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgtff1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 09:45:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so83850425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 02:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777196712; x=1777801512; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLmPbizSg/gAJWAZj30yWEqBSWQcqsiJfIa8959c2Sk=;
        b=IwuHQQnCDE0/fmxbYT2Vmc/H8B8b5GD6exT2ZVFEPyoCn3lG3OKc/yBlXDR5AGWadw
         RA61CNooUQRnZunhb+foJOQHbXcsMa96mOBiUbypoQveWn2apb3NxUYHmUYcIFmgfmxf
         W+07B+vAWlC4C0aOmauENgv8bnvYMl4x1gxRfIKTqnuj5FlJN9RX49M35ASADZ97Dqbv
         88+JLn40sHyx1ZGpzu1bmgvOtIkxjtU1CLoVX5B65/gurW6ye/LZaZT+Fkx/SjfeKVgK
         jaLInEyeuZ5rReD6Fm/g0Q3XuyC6j4UKsvq2FZyf3LSlb1jXEXewpBQDKAIniewf+a2d
         lyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777196712; x=1777801512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wLmPbizSg/gAJWAZj30yWEqBSWQcqsiJfIa8959c2Sk=;
        b=BYdVyirMrghJXs72b6Tbuh+/keWLGDx4IEf3yzYGPgO0M2iGEBDgEKPVmEsjRPTmjU
         NJJjUhU654agF7PVxiHTemKdTyBqJ0mTiB92uKrCpB9LCry7AN8U555aj0yihZ2EUMuJ
         1WKEWhd+Yed4ev/amZL0oeDCV8qmqy2PjsVfeS0C5Eh4uiB1chpj3SViaWLsSZ5enhOJ
         Z0Mv+4WBYQ7oO3yD4HYVgZAsUGMp62z1b57nkuL4TEWCjuSWNjjEMd6OLcU9CbtsCpKC
         6+ZqNOz1vkdLM9baH4sOAnwS5n1q8bXbv0DXSQMXG+5/7yyeWEAl/f9V+ocQcfjsoun8
         rYSA==
X-Forwarded-Encrypted: i=1; AFNElJ+8hKOz7QhgaSZEnH+DTytsIpNFquoLrGvSLDcGRKk1KdkIwA7K+tP6QABVqSr9Q0H4/fZhpcE9IS2gugLhi3Dc@lists.infradead.org
X-Gm-Message-State: AOJu0YzWAF5AaJBkfOW6l1jwkkCtKTpeMSsbW+zdV1fV9rmE1dnjhiDy
	1zes34ji4BdUkuXxFh1CewAUnAMSz1Kt8qAXDhhAcWN50jCBIRiZ4Lx5nbPBii+8owkJDYFjQQ/
	RYYfx3Z3PC5wi1ECDA0XrMt0CsSE+iSK94hjqVoB0gd209vwtLiv1K28C1bxqGZjMn70ee9pBci
	wQ7A==
X-Gm-Gg: AeBDiesw2QxBT87UDlPPAvP5A58gZU7wshLK4iMaJFxrpms3URjYC9XSaKg3nGpHX8K
	rstCFyHfpWBCao06g+xI0AYuKPTVQWQBO+rlcqREg3XxZqiyIqVWQ8nUVkXS/vqDPfPhUGMdf5P
	6LsoAsfwgMNavOCCaYUD7v6i/k35qLtf4Z6rYGFPpjiZrQQZ2B1shz7+DtYiXs8O3qkqL64gGdg
	kUfxZIpmbkPFTXgG61DgXnh77lzFzBLQCnN1T6OaqQwOqg3QW9KltGKb1D6icrm3zl+Dhwvs7fv
	KdbLmfC9v8MfXT5NXrCrWcrQ6xMOYVXwvhkyNGk6uhRaEIWQ/A+OatH/W74oux1mtY6QDENFSUi
	q4uVyyl+8KFhUbkx8ZhukeAVBwH4DwSFg8W4D6xkFZ5sG3sGNc2c0UhdNFHsV/kWDIt8duOc+Jc
	dHwMgU9Kyit3tN+EsG4UI7XF0R
X-Received: by 2002:a17:903:46ce:b0:2b2:d09c:c07c with SMTP id d9443c01a7336-2b5f9fdbb82mr394622615ad.36.1777196712142;
        Sun, 26 Apr 2026 02:45:12 -0700 (PDT)
X-Received: by 2002:a17:903:46ce:b0:2b2:d09c:c07c with SMTP id d9443c01a7336-2b5f9fdbb82mr394622355ad.36.1777196711652;
        Sun, 26 Apr 2026 02:45:11 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab208d4sm294960905ad.55.2026.04.26.02.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 02:45:11 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Sun, 26 Apr 2026 17:44:40 +0800
Subject: [PATCH v8 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260426-extended-cti-v8-3-23b900a4902f@oss.qualcomm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
In-Reply-To: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_yingdeng@quicinc.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777196695; l=7257;
 i=yingchao.deng@oss.qualcomm.com; s=20260426; h=from:subject:message-id;
 bh=TgA67GI/rOOg6PkPVy5qWtYz3zdEwycYChjFL+t3eBI=;
 b=e5CMm80B1+blKa2SGPTCtcX7w8sl3HpU3WvXqm0LVOeUfxtld1fsxn7ktNdkUuSFWqUfUTuZe
 RsKgzTKAlLEB8o4NhVYRRBfM0fp1lSM14Evk66+GYzX8/4E5V7y2fWr
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=aufKZC4I8k2lqi+B/z87rB5kPPybOn8C3mLosbtw+no=
X-Proofpoint-GUID: gTYJAh6LncBCmxEeXRtLFjcovoPIGbMg
X-Proofpoint-ORIG-GUID: gTYJAh6LncBCmxEeXRtLFjcovoPIGbMg
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69eddea8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yjDJaKUznl4u3GwUnvUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEwMiBTYWx0ZWRfX15z+ur6S/Gbb
 P5o4ddEHXW3jA0CMRsSqCMaZjW45ohjH3kqsqyZQc4wrBhI57LddbqyWxoqga8nrRxMG1xeIhmq
 EOg+L0WgFhqWFPubRQkvCiws/Hxy+VHnhzfCBnG9kK/p/kp75QxlTjrwTgFmLO9/C17L9EEc0p5
 uGZBImDbzH/Yj3jkLx3sXb7AIv/f3zb0ASbm1xuGEYsvEliw340wBG4sPHRHfVf8Ki9ICCuKMud
 VLohDRTEJ7C2KXwCoEiSJNhtY3g/BzOhA1xvmwCmqFMHBn7aUxc4SvIgj9howKP0/YZPjIMfNoO
 JFSRvVkfs2X93nEt0BAL1FOuul3edVIFE5jFIxGq/uInq10HO99OxTK1J7dTcubAZ6yzhecEw1/
 w0mTN/Y/16MfcXHowI0Cdz58iYvRMFBBtPkYDPRIpAzB75NI9G5PnZc9Nfl7rkPnKqSI9OVfQu1
 zDnnfrpQ2D+OkQy1gAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604260102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_024513_765030_E9A71F02 
X-CRM114-Status: GOOD (  27.36  )
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

Qualcomm implements an extended variant of the ARM CoreSight CTI with a
different register layout and vendor-specific behavior. While the
programming model remains largely compatible, the register offsets differ
from the standard ARM CTI and require explicit handling.

Detect Qualcomm CTIs via the DEVARCH register and record this in the CTI
driver data. Introduce a small mapping layer to translate standard CTI
register offsets to Qualcomm-specific offsets, allowing the rest of the
driver to use a common register access path.

Additionally, handle a Qualcomm-specific quirk where the CLAIMSET
register is incorrectly initialized to a non-zero value, which can cause
tools or drivers to assume the component is already claimed. Clear the
register during probe to reflect the actual unclaimed state.

No functional change is intended for standard ARM CTI devices.

Co-developed-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 28 +++++++++-
 drivers/hwtracing/coresight/coresight-cti.h      |  4 +-
 drivers/hwtracing/coresight/qcom-cti.h           | 65 ++++++++++++++++++++++++
 3 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index c4cbeb64365b..b1c69a3e9b99 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -21,6 +21,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-cti.h"
+#include "qcom-cti.h"
 
 /*
  * CTI devices can be associated with a PE, or be connected to CoreSight
@@ -47,6 +48,10 @@ static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, int reg)
 	u32 offset = CTI_REG_CLR_NR(reg);
 	u32 nr = CTI_REG_GET_NR(reg);
 
+	/* convert to qcom specific offset */
+	if (unlikely(drvdata->is_qcom_cti))
+		offset = cti_qcom_reg_off(offset);
+
 	return drvdata->base + offset + sizeof(u32) * nr;
 }
 
@@ -170,6 +175,9 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
+/* DEVARCH[31:21] - ARCHITECT */
+#define CTI_DEVARCH_ARCHITECT(devarch_val) ((int)BMVAL(devarch_val, 21, 31))
+
 static int cti_set_default_config(struct device *dev,
 				  struct cti_drvdata *drvdata)
 {
@@ -700,6 +708,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_desc cti_desc;
 	struct coresight_platform_data *pdata = NULL;
 	struct resource *res = &adev->res;
+	u32 devarch;
 
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -724,6 +733,22 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	raw_spin_lock_init(&drvdata->spinlock);
 
+	devarch = readl_relaxed(drvdata->base + CORESIGHT_DEVARCH);
+	if (CTI_DEVARCH_ARCHITECT(devarch) == ARCHITECT_QCOM) {
+		drvdata->is_qcom_cti = true;
+		/*
+		 * QCOM CTI does not implement Claimtag functionality as
+		 * per CoreSight specification, but its CLAIMSET register
+		 * is incorrectly initialized to 0xF. This can mislead
+		 * tools or drivers into thinking the component is claimed.
+		 *
+		 * Reset CLAIMSET to 0 to reflect that no claims are active.
+		 */
+		CS_UNLOCK(drvdata->base);
+		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
+		CS_LOCK(drvdata->base);
+	}
+
 	/* initialise CTI driver config values */
 	ret = cti_set_default_config(dev, drvdata);
 	if (ret)
@@ -780,7 +805,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	/* all done - dec pm refcount */
 	pm_runtime_put(&adev->dev);
-	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
+	dev_info(&drvdata->csdev->dev,
+		 "%sCTI initialized\n", drvdata->is_qcom_cti ? "QCOM " : "");
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index dd1ba44518c4..2598601e7b93 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -55,10 +55,11 @@ struct fwnode_handle;
 /*
  * CTI CSSoc 600 has a max of 32 trigger signals per direction.
  * CTI CSSoc 400 has 8 IO triggers - other CTIs can be impl def.
+ * QCOM CTI supports up to 128 trigger signals per direction.
  * Max of in and out defined in the DEVID register.
  * - pick up actual number used from .dts parameters if present.
  */
-#define CTIINOUTEN_MAX		32
+#define CTIINOUTEN_MAX		128
 
 /*
  * Encode CTI register offset and register index in one u32:
@@ -188,6 +189,7 @@ struct cti_drvdata {
 	raw_spinlock_t spinlock;
 	struct cti_config config;
 	struct list_head node;
+	bool is_qcom_cti;
 };
 
 /*
diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
new file mode 100644
index 000000000000..fd1bf07d7cb4
--- /dev/null
+++ b/drivers/hwtracing/coresight/qcom-cti.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _CORESIGHT_QCOM_CTI_H
+#define _CORESIGHT_QCOM_CTI_H
+
+#include "coresight-cti.h"
+
+#define ARCHITECT_QCOM 0x477
+
+/* CTI programming registers */
+#define QCOM_CTIINTACK		0x020
+#define QCOM_CTIAPPSET		0x004
+#define QCOM_CTIAPPCLEAR	0x008
+#define QCOM_CTIAPPPULSE	0x00C
+#define QCOM_CTIINEN		0x400
+#define QCOM_CTIOUTEN		0x800
+#define QCOM_CTITRIGINSTATUS	0x040
+#define QCOM_CTITRIGOUTSTATUS	0x060
+#define QCOM_CTICHINSTATUS	0x080
+#define QCOM_CTICHOUTSTATUS	0x084
+#define QCOM_CTIGATE		0x088
+#define QCOM_ASICCTL		0x08C
+/* Integration test registers */
+#define QCOM_ITCHINACK		0xE70
+#define QCOM_ITTRIGINACK	0xE80
+#define QCOM_ITCHOUT		0xE74
+#define QCOM_ITTRIGOUT		0xEA0
+#define QCOM_ITCHOUTACK		0xE78
+#define QCOM_ITTRIGOUTACK	0xEC0
+#define QCOM_ITCHIN		0xE7C
+#define QCOM_ITTRIGIN		0xEE0
+
+static noinline u32 cti_qcom_reg_off(u32 offset)
+{
+	switch (offset) {
+	case CTIINTACK:		return QCOM_CTIINTACK;
+	case CTIAPPSET:		return QCOM_CTIAPPSET;
+	case CTIAPPCLEAR:	return QCOM_CTIAPPCLEAR;
+	case CTIAPPPULSE:	return QCOM_CTIAPPPULSE;
+	case CTIINEN:		return QCOM_CTIINEN;
+	case CTIOUTEN:		return QCOM_CTIOUTEN;
+	case CTITRIGINSTATUS:	return QCOM_CTITRIGINSTATUS;
+	case CTITRIGOUTSTATUS:	return QCOM_CTITRIGOUTSTATUS;
+	case CTICHINSTATUS:	return QCOM_CTICHINSTATUS;
+	case CTICHOUTSTATUS:	return QCOM_CTICHOUTSTATUS;
+	case CTIGATE:		return QCOM_CTIGATE;
+	case ASICCTL:		return QCOM_ASICCTL;
+	case ITCHINACK:		return QCOM_ITCHINACK;
+	case ITTRIGINACK:	return QCOM_ITTRIGINACK;
+	case ITCHOUT:		return QCOM_ITCHOUT;
+	case ITTRIGOUT:		return QCOM_ITTRIGOUT;
+	case ITCHOUTACK:	return QCOM_ITCHOUTACK;
+	case ITTRIGOUTACK:	return QCOM_ITTRIGOUTACK;
+	case ITCHIN:		return QCOM_ITCHIN;
+	case ITTRIGIN:		return QCOM_ITTRIGIN;
+
+	default:
+		return offset;
+	}
+}
+
+#endif  /* _CORESIGHT_QCOM_CTI_H */

-- 
2.43.0


