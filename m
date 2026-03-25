Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82605FEA806
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 05:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQzcZFRQRIe3UKXb4FlRrFEi/jWZoZmnUtf/AMN/Ogw=; b=SD/xPiudF46U9e0UFGCTxDOST0
	J+8HzEyH8cENY87qS6v4gS2toF09rlet32j6v2v54wFto5qnaXySWCjZAarF4LL824bREr+VHRuB1
	NcJAXBV6P5irwhH8xhxx3y1RAZW/BCsyDf15KB5uPtDlGptXCI6ntIjZUb95cPcRKjCsfIkMftkZm
	6X8FBdGa0c13c19/0HCTMEGbqWpv+/X9k5EDRzIi8D9E8iQz/71YKNnX6DITg/QFQorRlDzn7A3C4
	2MYB9ZXoz6i98z7Xnd3OsAde8BRccQ5VpsWClnURPij8DTclceJcUQAEO2+Fth1w9UkqY6TnsWMqL
	8cq+1Epg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H2R-00000002j9H-2UZb;
	Wed, 25 Mar 2026 05:44:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H2I-00000002j6c-112P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 05:44:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4VjPs2075454
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 05:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQzcZFRQRIe3UKXb4FlRrFEi/jWZoZmnUtf/AMN/Ogw=; b=NiZGZjY3SFMHnPFt
	X0WQNpSEZD9A6EaXQ+f5Snw3WZSTbTjt4qJQDM9us1cuNp83RTnmPrDiMJ2K5c0n
	50Q/vNdr+jOo6JXeWGA6YswxpEFgCAK3dslJjzBVVE2NQgAa/9+DHTv1/9vsMMiE
	VQlNW/5sm9tq/szqsa68u7JE9jhQtSBrsaAYglrrVMVnemtTdzviRssY8RViFzyZ
	TFufeOBJNVVRK5aKBtLTjbt2BgxpQiIoHd2uD1IXvN9hOWBYU9KklyTKHvwbidnl
	433DnG6XuC945cf1aErJXIdKjJUNOvyXYV8xw/AWD8Btw/Errc310h94wpedF0ji
	7m1GZg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41411muy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 05:44:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a0337930eso2143551a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 22:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774417449; x=1775022249; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JQzcZFRQRIe3UKXb4FlRrFEi/jWZoZmnUtf/AMN/Ogw=;
        b=flWt7qjURlhfNHNRpqSkmZ6u/hmwyuK0gZJhgtb+IgpzIv+255UrR1xdniimT2rw0i
         vPCfKS+VHt0pnyW8JUGlnDrHOEZs6ocBqxjiDK28zR1Ugvl/c0Qx6/Cn+qVAaVshfNRe
         pvD9koW4K4i19RbzXg6i7do12tZBP4ZqEx8jNQDKmY4HS3ulvxInnQBBvy7lWM6PR+Ky
         vAIPw6L2VKP1LUswjWlt6AFiWwSHOPHjOEEylsHl1+NwUy7p5Y7/kDxkP3GvvBT7+t3B
         ZOYV0k+x2ksFtGlF2Qa9ByM49cIaN5KeIGufB914HvjNPnNEK9Ifhq6rnIEbiN4ewvKo
         RGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774417449; x=1775022249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JQzcZFRQRIe3UKXb4FlRrFEi/jWZoZmnUtf/AMN/Ogw=;
        b=E7nPCfeALtcMHqGbKIdoDQxA6oAIDu4gU6BKYNNDiLrhhhHrkdLYUNaqbuHi0522Mr
         YwrU0vUFnoUs1+JxcKokCVrgAJkD4Ehf9dwbt+DyK1tw2Vg5vywTSDOL44jJli1e7yU8
         KsHuo6JGQ5/w9rg95R6flOyBLy8LiLW/F/7+jl7cFt93O2GAYSxQczP14WgI2RbbuXC9
         KDBvkCvRlgDy/Q1nP8+DsNvKr934McchyGqjZitIzZXVmOYSH2Taew/bOooPhd18exX2
         fKkVoV/wwactbpVPyXajvpCoxAB0x20qHdPhBOcwyLXSUfwzqrIu4iMYH1LdE0mLXYmd
         0icw==
X-Forwarded-Encrypted: i=1; AJvYcCWLyk5/dS/0DZjUcns1eVO6Aie7PjgO0ZNe3WKN6+eSdBseipESR5w5mmxdADAMocqvcLNBl5/sCRiZRevP757n@lists.infradead.org
X-Gm-Message-State: AOJu0YzkxDVmk9tQgeokOJvQ7c8ODNB04cemJLFjn1saKb4d7eny1bQg
	rrGrSNwQyvoCB9I/wy6u53xlMGMPIurazwaGt/DsePuPKcsBjjhyncPIaSSXlfip3PKqrMwNfU6
	znPeMDX1WslmbEPHLPyTa5agTZrLPrczxzlz/ybcbR6j27SGNBg/JwklwUKNlIEyOS8yYzvJo7S
	T9eg==
X-Gm-Gg: ATEYQzxsEVvZEyvBAdEYqlcbMEYvAFtdwwixXEJ/XmywzDnfktp9svsx0w3cPQJyHve
	5O3+5pva3Rr0Y/6ZIimd6Lt2sfa9PqyelZNlxIsUqNTqI6MrgKdV/AR9twMK0ckb9fTMDoe+mYH
	dDafqTHBN5O5XnI2kez8PN1JdzqcRJ+V+y2XxYc1ygSjc8CkCUeP0j1YZc8p8m9+S4XIZfLWbTN
	ZZROX6czOTlawe3mP9hhQBuvmOxS3NWDvc6jELzPn3Bi6kEacj8eVoUdMlMcdScaD2R5ZPurWvB
	uA42SkAF4mJm/nM/lBZ/h8vcwTxRMjJoBp4QbaDa55ZhK/97wAMv06eD174pccZiy3phZ4sS4kE
	/2/oUgp+UNUYWdWvL07OCNLbjQm126kQnQlQ4AtpiLfSkq6z6smsX5y5XOlgx1zC0ESwM9zPXOr
	uELDU5dITfkk1ZVw==
X-Received: by 2002:a17:902:d591:b0:2b0:4b3a:9b4b with SMTP id d9443c01a7336-2b0b09e8568mr25984095ad.16.1774417449103;
        Tue, 24 Mar 2026 22:44:09 -0700 (PDT)
X-Received: by 2002:a17:902:d591:b0:2b0:4b3a:9b4b with SMTP id d9443c01a7336-2b0b09e8568mr25983705ad.16.1774417448521;
        Tue, 24 Mar 2026 22:44:08 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556f6sm219985805ad.49.2026.03.24.22.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:44:08 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:43:46 +0800
Subject: [PATCH v7 3/4] coresight: cti: add Qualcomm extended CTI
 identification and quirks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-extended_cti-v7-3-bb406005089f@oss.qualcomm.com>
References: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
In-Reply-To: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, quic_yingdeng@quicinc.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774417433; l=6755;
 i=yingchao.deng@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=tsL6V64wIF8Vfwl80JY3mqBfH+J4HRNO08L5h5sdEfE=;
 b=tx726oeyFvbCnTOQp3JfZzxjdXfeYZd1ALE7Mk5SBqWKrsk0fUv3xrS++jS3n/gLw8+YysSCU
 JbRLrJG20QuB580j1reWygEgD3vvB5fL+BsqdvMYSRq4aqPN0KgahME
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=5tp504LR96W2IVT3sAbRCqWtoG16CxJVUnXJSfU8NlQ=
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c37629 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7a10iwBbuTRWBBlgjiMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: SUrI8IQblvLMuH4CRulEe8-clqlHQtvW
X-Proofpoint-ORIG-GUID: SUrI8IQblvLMuH4CRulEe8-clqlHQtvW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOCBTYWx0ZWRfX1NLNyVIpMBB0
 ZjW0sLHXm4QE3iRbiEq5c38ZGK+2phGj4dZUalGkNQ/6TnwqLYl53uWQabedtmPchwHPA53b4z+
 xrIRMc2n48IFZdpw/ErxTq41/bxmMhCFAtkT7Y+9Vvs7ZDwMfvcLcf2gDqEUtbD4Yr4Pt6O4SHc
 +dnLw8KTv7lEgAmhvvJvjo6k2No/LYca/FfwklzagbchbVmQcPbJ8zOpNwHh3ouWT/oSZm/EQjZ
 EyB8jCnmDp7V5YGYX8Ry75ThfD1UkXVSBCtlwdmr4wWJQolotpVpx9TE5q1vL2fZ6X3Uo7J+dUS
 8JJHwLqEPvmRHMhGJ42PoWDPJE3Pt8coh1sBkPxoOucqcLDM5hRef1MONyLTTv8sya2Ifmyq5Q7
 Nq2qQ6XN5/sKMu+nQi5m5GTJtLWydhSSx6TeIaOBK718pgPky85pY4mRazn9kqgRh6TB2qsUXYF
 /wb/KGTIl7an6Th7P5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_224410_308970_43E9310D 
X-CRM114-Status: GOOD (  26.79  )
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
 drivers/hwtracing/coresight/coresight-cti-core.c | 26 +++++++++-
 drivers/hwtracing/coresight/coresight-cti.h      |  1 +
 drivers/hwtracing/coresight/qcom-cti.h           | 65 ++++++++++++++++++++++++
 3 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 023993475a2e..afa83d411a4a 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -21,6 +21,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-cti.h"
+#include "qcom-cti.h"
 
 /*
  * CTI devices can be associated with a PE, or be connected to CoreSight
@@ -47,6 +48,10 @@ static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, u32 reg)
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
@@ -698,6 +706,7 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_desc cti_desc;
 	struct coresight_platform_data *pdata = NULL;
 	struct resource *res = &adev->res;
+	u32 devarch;
 
 	/* driver data*/
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -722,6 +731,20 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
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
+		writel_relaxed(0, drvdata->base + CORESIGHT_CLAIMSET);
+	}
+
 	/* initialise CTI driver config values */
 	ret = cti_set_default_config(dev, drvdata);
 	if (ret)
@@ -778,7 +801,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 
 	/* all done - dec pm refcount */
 	pm_runtime_put(&adev->dev);
-	dev_info(&drvdata->csdev->dev, "CTI initialized\n");
+	dev_info(&drvdata->csdev->dev,
+		 "%sCTI initialized\n", drvdata->is_qcom_cti ? "QCOM " : "");
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 21bcdedcb95f..9c0896b17c24 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -187,6 +187,7 @@ struct cti_drvdata {
 	raw_spinlock_t spinlock;
 	struct cti_config config;
 	struct list_head node;
+	bool is_qcom_cti;
 };
 
 /*
diff --git a/drivers/hwtracing/coresight/qcom-cti.h b/drivers/hwtracing/coresight/qcom-cti.h
new file mode 100644
index 000000000000..21a33b759b36
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
+#define    QCOM_CTIINTACK	0x020
+#define    QCOM_CTIAPPSET	0x004
+#define    QCOM_CTIAPPCLEAR	0x008
+#define    QCOM_CTIAPPPULSE	0x00C
+#define    QCOM_CTIINEN		0x400
+#define    QCOM_CTIOUTEN        0x800
+#define    QCOM_CTITRIGINSTATUS	0x040
+#define    QCOM_CTITRIGOUTSTATUS	0x060
+#define    QCOM_CTICHINSTATUS	0x080
+#define    QCOM_CTICHOUTSTATUS	0x084
+#define    QCOM_CTIGATE		0x088
+#define    QCOM_ASICCTL		0x08c
+/* Integration test registers */
+#define    QCOM_ITCHINACK	0xE70
+#define    QCOM_ITTRIGINACK	0xE80
+#define    QCOM_ITCHOUT		0xE74
+#define    QCOM_ITTRIGOUT	0xEA0
+#define    QCOM_ITCHOUTACK	0xE78
+#define    QCOM_ITTRIGOUTACK	0xEC0
+#define    QCOM_ITCHIN		0xE7C
+#define    QCOM_ITTRIGIN	0xEE0
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


