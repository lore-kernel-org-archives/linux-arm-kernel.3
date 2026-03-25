Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7702EFEA80A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 05:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uROBrYURmQMKmWYhSbrHteOFKQsLCjR237xB3AYYOI=; b=pfWyNdx0S2xKtGyRbmugi2rWb5
	LzivbLG5ENAGBdVkeugSz7xCacB5fb8eor5rZq9WcQnUtsDcpZjMXBhPcrb2v7KAw3VJ8As0H/E2S
	Ur//QVRKtAseqplVmc9DGYH1Cm11Ry8bJnIybl7Yv1/s2fw3rc52Aw1OZt2dVq6P82zOwv26PMzFI
	+9QTd/Zv8wS8WgZsLtYI8FBJOpXIStCp9dHKEyW2Mp1CZ32yZUJ5OZxzjI1hcaq3Wj/NsDV8XkPQZ
	zGAa0ru6zUkG+Y1X9oQJEprLkbcPDUwk/m0R77lmx995zbuXjeXF3SzGHlB4owYUFwtxryhpkdWG1
	ouf+xWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H2H-00000002j5z-18UJ;
	Wed, 25 Mar 2026 05:44:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H2E-00000002j5B-2loR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 05:44:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4eLDJ989052
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 05:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1uROBrYURmQMKmWYhSbrHteOFKQsLCjR237xB3AYYOI=; b=Mr94mDjb2yNvU7yw
	Gs+bsDbAGwj1bFgqGYMVnoh1yvJTR5CjDhG7N2CANnqEENGIzHGuC+RaiMyBPcuL
	p/ZQ//lO2lwaL0h94YAkgBxs7OXFtxwLkNvH9JDtgLpaAu7gkITvaYYlIWQ8XExp
	W77KQZp0CHR3674LrTjcYLAy9twGSiJBQ3xL6mUceZ+JoZXNhYjzvAMxPrPxLWyN
	+XYuQY1TIDnkVoh0Im5kISPCIjZ5ey9RHNgHIjrve+z9SwFaotDhxp3IgnLABUdA
	Z7KBXdW1yD6ujsbsia8qzFLC+RFJGPQ2vRfb7PAMboTtU4KB9KqGKQ1FCTNveK8/
	HGRAdA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m38t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 05:44:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b069bfa817so24601005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 22:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774417445; x=1775022245; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uROBrYURmQMKmWYhSbrHteOFKQsLCjR237xB3AYYOI=;
        b=gFo7vcZhr3BfsUE7p3brWrXEnSO97CHrG7jWEFsMTUNQn8OoGpCUyT2YDS9QgzseXN
         uoD71kUge8wryzAtvPkWxScSOwCcxPacbpr4NLE5Ha/chZT1qnhbXp1aiQWHOjz1sesE
         4EK9r1pqfR9Otu3ZPA0TG60uTMh0h6IstIhvMLG69qMPLcMh6IRbEW4E7KsRAWkaK/bO
         F9lBLGqFH31G5owXb8/QmwBcwG1RwE7UiCy5HcvSFDpaDncy1UrZ+LT/0R/EKRB2Ma1I
         aMoc+WUhS3eqYqEE4hHb6CJg59opm53XYrzZJ6cX/ZKUA8d8S7ecrKnuu9ej84dNcHz0
         ItKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774417445; x=1775022245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1uROBrYURmQMKmWYhSbrHteOFKQsLCjR237xB3AYYOI=;
        b=cSHayP0VCQa+AeYsQmh5stlJE9qrqKPitEqZC/gQgd72rDW9Jz8UP+rSlu4EqTMlzE
         cXSpijJ7VIaIWgVq3Z87E0JbRmFMh+lyelb3dkDPgBR9gxajcBHgXYSH4gySGKb7ZEHu
         ++qdMHnXYOoWLh3PXcOlDeV5y8GrZa+a2r/T9C3/iLD/h+RCHISwHDm5JoQ+A9E2hM2x
         3g+aZnzuz4rmxvUtuJlV8Qt96qE1tSxz1wWZD+7W9L7adQWKJ69r4K9g9FpXeGXxlzOK
         BOyzAAIeIKtInpkddCUkQmhWxApk0KkI9AfH5cGvQWcDbW1hK/GlAHP8ybAdExyVWxnp
         7sRw==
X-Forwarded-Encrypted: i=1; AJvYcCW2D2QEGaNwutuIOx6hvnz0YDT9k+Fo/PnJRvLCRyPiuSpfBCr5HS6ylWGvgw6itiRVsAAnEjHhD0th4BAr+vgK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3AqQ+5qOAI9obWmvE8G+7PMFGMKfUNKegY169bytWRczBaCJa
	Y7TvEaylwHXZOnsEI0tA43CL8+zod5r5M6pCszIgpLHrhEwTpdPOI7nQRtXmNWJ1Km2IyAN9wxt
	VCKOhBvv0NtCbyS5frLO+ertzTi6CbBFFlKk9pi4Rv2yy05Nb+WZZOqgkfslo3/Atvt9j1/zaJ6
	3o6w==
X-Gm-Gg: ATEYQzx2O9N553Je/v1rJ/iYOLks2g1JCo1SzOshQxS/NtSqnnmN/3icf5Wem11BCUA
	nT++IVWXMKk36wEyLeqb6Rcaon5u58t7bja3t7wO5+4gPorZXJ/WVK7m28wV62hnMO7lc0L9vQP
	EIckT1Ok1ZlHql7vQk83W6Jg0eICBsSJamkdoFZvJ6W28ld8D/xK7hEdaTvgbfWztBYTipsFNWG
	56f5XkPPak5lzh5i4Ud85YQgUCGLtIzhAhxsYjKXyt5PQTmuB2gVrtMDUZ6XNrXcGAkk/0ozi8W
	MX/jNFNr+gNyV1pWFfwA6fs1jOhTS1hXztqQUCVUiHFqdSsRY7vimGMPLBeOwnIVbari2XJ1pVq
	SUhev+SDo7Mwstv2XRWdJaOa+0szBRKWJDNLBqIDPShxt8i84KQxOnBM4YCwHaNAUJqNthnYmW4
	AMMuIi50VL09BCsA==
X-Received: by 2002:a17:902:e784:b0:2b0:4eeb:f80a with SMTP id d9443c01a7336-2b0b0ab3a21mr25199115ad.29.1774417445415;
        Tue, 24 Mar 2026 22:44:05 -0700 (PDT)
X-Received: by 2002:a17:902:e784:b0:2b0:4eeb:f80a with SMTP id d9443c01a7336-2b0b0ab3a21mr25198645ad.29.1774417444850;
        Tue, 24 Mar 2026 22:44:04 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556f6sm219985805ad.49.2026.03.24.22.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:44:04 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:43:45 +0800
Subject: [PATCH v7 2/4] coresight: cti: encode trigger register index in
 register offsets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-extended_cti-v7-2-bb406005089f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774417433; l=6063;
 i=yingchao.deng@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=7Av2HAUAr7KB5Ak4a2H20M+seSJyBiILEkz7dpvzJfA=;
 b=0fa+nmYg96nSHuDJGRyhZxDSsgOWgfT19ZguSiSwp/vuHjyKHTiCh5Iv1Ms+1Yb0seEIvbBxL
 Iy4Sk6rijZ3CEYOla+zqiEFOdEYaibAZICIYxobNu9pxZ9OjWEDc7mn
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=5tp504LR96W2IVT3sAbRCqWtoG16CxJVUnXJSfU8NlQ=
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c37626 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JIbpoTx20AKeDh2nFAsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 0V4lLTXz0GHY52YM8Fvx-O118rQPiIMY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOCBTYWx0ZWRfX+WxxwDUPn7DA
 OowH0Rrk15nLIc9cNkyGiKGnRNB1EOZCN+DGcmvw+W5L8uPImc20/HfIVlWa94y+NYTf/loR4VQ
 QWC8bD7SC1bNejr9sj0IlKvtCfSE8vlWjl4296rZXgQ1azjUOHnIO3IE+pkZRIUBk0enx/eJK59
 INOqhzErEVCiU8//bcz5cnAEk7lrsxsxxk2bkN4WAw1kj3aZ5Z8ZOd3YeL/rfOvSb91HDMwFsHu
 Z15gwhWZbWIbK34scJti1uFpq1uruk6Dxt3+UBZp1DUdtos/x3Bgf1TtIMlEGO2MG/P8iUB6oJK
 u/p7OiD3B/5RytRz1U8ar2eSYIrtO4jtbx5w9b96fNAf2zcL/xG2zgCXMJCViAACSv0uDCHGY1q
 tAOJXtJv2sTWr1b59NwtkZrXr7HA2YY4y9NJ1RSwAkoSnTIAohm3xWGdp4Fs8thRqmIlSHFVOMh
 f4R8EZER5hqqU/47zwg==
X-Proofpoint-GUID: 0V4lLTXz0GHY52YM8Fvx-O118rQPiIMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_224406_717047_617B8819 
X-CRM114-Status: GOOD (  20.93  )
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

Introduce a small encoding to carry the register index together with the
base offset in a single u32, and use a common helper to compute the final
MMIO address. This refactors register access to be based on the encoded
(reg, nr) pair, reducing duplicated arithmetic and making it easier to
support variants that bank or relocate trigger-indexed registers.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c  | 31 +++++++++++++++--------
 drivers/hwtracing/coresight/coresight-cti-sysfs.c |  4 +--
 drivers/hwtracing/coresight/coresight-cti.h       | 17 ++++++++++---
 3 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index d5cb94e33184..023993475a2e 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -42,6 +42,14 @@ static DEFINE_MUTEX(ect_mutex);
 #define csdev_to_cti_drvdata(csdev)	\
 	dev_get_drvdata(csdev->dev.parent)
 
+static void __iomem *cti_reg_addr(struct cti_drvdata *drvdata, u32 reg)
+{
+	u32 offset = CTI_REG_CLR_NR(reg);
+	u32 nr = CTI_REG_GET_NR(reg);
+
+	return drvdata->base + offset + sizeof(u32) * nr;
+}
+
 /* write set of regs to hardware - call with spinlock claimed */
 void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 {
@@ -55,16 +63,17 @@ void cti_write_all_hw_regs(struct cti_drvdata *drvdata)
 
 	/* write the CTI trigger registers */
 	for (i = 0; i < config->nr_trig_max; i++) {
-		writel_relaxed(config->ctiinen[i], drvdata->base + CTIINEN(i));
+		writel_relaxed(config->ctiinen[i],
+			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIINEN, i)));
 		writel_relaxed(config->ctiouten[i],
-			       drvdata->base + CTIOUTEN(i));
+			       cti_reg_addr(drvdata, CTI_REG_SET_NR(CTIOUTEN, i)));
 	}
 
 	/* other regs */
-	writel_relaxed(config->ctigate, drvdata->base + CTIGATE);
+	writel_relaxed(config->ctigate, cti_reg_addr(drvdata, CTIGATE));
 	if (config->asicctl_impl)
-		writel_relaxed(config->asicctl, drvdata->base + ASICCTL);
-	writel_relaxed(config->ctiappset, drvdata->base + CTIAPPSET);
+		writel_relaxed(config->asicctl, cti_reg_addr(drvdata, ASICCTL));
+	writel_relaxed(config->ctiappset, cti_reg_addr(drvdata, CTIAPPSET));
 
 	/* re-enable CTI */
 	writel_relaxed(1, drvdata->base + CTICONTROL);
@@ -127,7 +136,7 @@ u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
 	int val;
 
 	CS_UNLOCK(drvdata->base);
-	val = readl_relaxed(drvdata->base + offset);
+	val = readl_relaxed(cti_reg_addr(drvdata, offset));
 	CS_LOCK(drvdata->base);
 
 	return val;
@@ -136,7 +145,7 @@ u32 cti_read_single_reg(struct cti_drvdata *drvdata, int offset)
 void cti_write_single_reg(struct cti_drvdata *drvdata, int offset, u32 value)
 {
 	CS_UNLOCK(drvdata->base);
-	writel_relaxed(value, drvdata->base + offset);
+	writel_relaxed(value, cti_reg_addr(drvdata, offset));
 	CS_LOCK(drvdata->base);
 }
 
@@ -342,8 +351,7 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* update the local register values */
 	chan_bitmask = BIT(channel_idx);
-	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN(trigger_idx) :
-		      CTIOUTEN(trigger_idx));
+	reg_offset = (direction == CTI_TRIG_IN ? CTIINEN : CTIOUTEN);
 
 	guard(raw_spinlock_irqsave)(&drvdata->spinlock);
 
@@ -363,8 +371,9 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, reg_offset, reg_value);
-
+		cti_write_single_reg(drvdata,
+				     CTI_REG_SET_NR(reg_offset, trigger_idx),
+				     reg_value);
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 88f8a08ef778..075f633ea9e1 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -385,7 +385,7 @@ static ssize_t inen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIINEN(index), val);
+		cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIINEN, index), val);
 
 	return size;
 }
@@ -426,7 +426,7 @@ static ssize_t outen_store(struct device *dev,
 
 	/* write through if enabled */
 	if (cti_is_active(config))
-		cti_write_single_reg(drvdata, CTIOUTEN(index), val);
+		cti_write_single_reg(drvdata, CTI_REG_SET_NR(CTIOUTEN, index), val);
 
 	return size;
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index ef079fc18b72..21bcdedcb95f 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -30,8 +30,8 @@ struct fwnode_handle;
 #define CTIAPPSET		0x014
 #define CTIAPPCLEAR		0x018
 #define CTIAPPPULSE		0x01C
-#define CTIINEN(n)		(0x020 + (4 * n))
-#define CTIOUTEN(n)		(0x0A0 + (4 * n))
+#define CTIINEN			0x020
+#define CTIOUTEN		0x0A0
 #define CTITRIGINSTATUS		0x130
 #define CTITRIGOUTSTATUS	0x134
 #define CTICHINSTATUS		0x138
@@ -57,7 +57,18 @@ struct fwnode_handle;
  * Max of in and out defined in the DEVID register.
  * - pick up actual number used from .dts parameters if present.
  */
-#define CTIINOUTEN_MAX		32
+#define CTIINOUTEN_MAX		128
+
+/*
+ * Encode CTI register offset and register index in one u32:
+ *   - bits[0:11]  : base register offset (0x000 to 0xFFF)
+ *   - bits[24:31] : register index (nr)
+ */
+#define CTI_REG_NR_MASK			GENMASK(31, 24)
+#define CTI_REG_GET_NR(reg)		FIELD_GET(CTI_REG_NR_MASK, (reg))
+#define CTI_REG_SET_NR_CONST(reg, nr)	((reg) | FIELD_PREP_CONST(CTI_REG_NR_MASK, (nr)))
+#define CTI_REG_SET_NR(reg, nr)		((reg) | FIELD_PREP(CTI_REG_NR_MASK, (nr)))
+#define CTI_REG_CLR_NR(reg)		((reg) & (~CTI_REG_NR_MASK))
 
 /**
  * Group of related trigger signals

-- 
2.43.0


