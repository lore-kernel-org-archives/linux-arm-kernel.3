Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595FFCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19s3XdkLyUt2fXZYHgYxTYu1Rl6KY8HXDDyB90niC4g=; b=ArrHO8sPf9NaffQOA3dkJNA3qP
	zxOLmEnRBP2nnsXQL7PMpyMiExCzn4Y2jYImkPtQI1nPirl2c/Mf7yoEOPnhWJ5X7ovgYI733qER1
	O9HVyp1+LIjDjVSozebdKUnBux4BL3aJ1/Z9Cm9/xf5himST8WORWmcpync1EiRLA9HQnxfP30XgP
	YZCnuWD+WDjhy53ojP746x1x1DokEE/Pxb1rlno3rNZ09Izl6Emz49j+iDK999jebclBS1IJNuE3B
	I0nyU+zjBYQHA3E9UaI/Y9HjTi6pOCwWOyUZMLUCmbGX3+xLxcgWC67b8EUwAKLjR4yP3tkojLBKS
	xmZYgchw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2KX-00000007hcR-0nWK;
	Thu, 21 May 2026 12:16:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2KU-00000007hbF-3Px3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:16:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99naT3009513
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	19s3XdkLyUt2fXZYHgYxTYu1Rl6KY8HXDDyB90niC4g=; b=k4SHvFdaFJnW+tQc
	7AmXpHlxsMhSYkxADr+5g4q6X6EmXlcTMmyn7FR7vBviFDH6quTMyKH1/hCDGqqS
	DSJaCEpu99YxvROsYIXMO57PPB01nPMXW92HG7GTCaYms1bob4aqG9QGOPGSrICC
	kOUxUxdf89OZl1YL1K4UtjLx/jbP2fyQdQi3eByYEREj+mUJWSitWDiCNoEqJ/9J
	Yu+OOs5/T2nxfx5s2l0wDq5Sy/SjWSVcQb99eouFKb875UhWl9LHF6SyYeMO1PpB
	jrnmlNXAg0hgRv9UKzcfpARHl1LXEMj+73taxVpqu3ZlQlCKIbh/DW/WQeizWIBV
	PQrgSw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr32453-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 12:16:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babbeff9e4so65581725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 05:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365805; x=1779970605; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19s3XdkLyUt2fXZYHgYxTYu1Rl6KY8HXDDyB90niC4g=;
        b=JtjFs6wlxJscZ/N9Tc5q+Ga3LH+Fx4dD0nhaikYLY1+MmpK97hdHcHbvkndrG0nw/k
         R/R99uPhN/EjhR0Kk2Fu1B+EcvSt/GH8p1uhKOr2PCQCPDqxFlISbgKPt1deWkRlECaG
         4W6FPJl82xpZyp2NWfQxXUe4ghUa5+tKwol/K/MzJ9vADuUzWRhmsTEAqJG6BwkKy0Lv
         2n4IDLWJPM9A/nClgfp3MceP8hAq58N9RO/jTOFGuzPj2m6AVKOpiEn7/xipultVtCL+
         GjqyJsa9W3PPH4FZ+y4ViE03cA+7b0ivu4fJy1zpEEnfYKlMVl9H6KdIRfUT052GT5KN
         XEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365805; x=1779970605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=19s3XdkLyUt2fXZYHgYxTYu1Rl6KY8HXDDyB90niC4g=;
        b=GvCubpsPP/IcxYwMceRYK5bB7KjNuLCiMO/014mgwxvT/YvQtunlVmReh4Zy5s6l6p
         qNtqBe9T0JAt/3ngn8C6FvUsU4qvPIwuieMMZ+E83cvK3aTsAPW21kIJTHz15xWRww3Z
         mftxPYehjblGKTWiVsLiMGBjvGwaGJ/wr4ckIS90V8r0goxeyHYNSZldqBZttfDcnoeO
         hyVQQ9cD5SnNx6quNw71lXgUc4YyMi/t4r1YqctTIHPWCXdGdBoJoaPvo16StzPyyaPA
         tHyHe+DDUr2FcOKURu175ymcY6InkfMs5BWzQ7AEhCrFhB91XWyfU2o+xT03dNGynJdb
         UjPg==
X-Forwarded-Encrypted: i=1; AFNElJ+sUEg2Ddc+5dLpY8cVYW0fKOruDEe+ywcfUe+Cf9HZiI4UfK/XZa8qG9VqVSIRLUyvZkWdQTtlSUNquNOZLRoR@lists.infradead.org
X-Gm-Message-State: AOJu0YxRXYL6BK4NXL0y7GBw0pmI1rqeTCVGuc+LsFfqlOjX0q1w1Zdl
	mTrk5ve+ZvyRFU6EhgLQ7ym31sCjX0CnvIqr7a2eZsyhkgq5JIUeoXwQUW1d85UVi8rkxUHFveM
	NlD/fEOmamZlccOQ1PVSb2cMJIm2gCkRwoAKnNoHNKdupyyrz03HoPcYWkTuES9yrZ53Tgv/nD7
	PaaFE1JIZM8A==
X-Gm-Gg: Acq92OEMtmFBMyL5PWga54QQmb/dTqaG2lKNq/pCBBBn2MiapxEJlW5WWKnFDyAM125
	t9jsFrtyEEsoYsjdYq658Jl9PK2NVA+nL/jlbw80uK2gGgAw0xwxofVIO1wHHfFBJDKBrwiFErM
	SzD4narSAwjED+Y2TtqX102sRY4ikQL9bUXOpaalmOk65rlDRnFnB8ucTPpxvCw1T2OLbCxhDFd
	Hmid4fGMLDHPzu5H0D7fT3JFrVffl4Z2gjtSZ9NqE78mwUlYG3oxUApxm5kjlYDtKDvHJNxv87F
	CG8zmHETOGcjUldkDUeYparW7338Eb7xEG99lYxIP8gceUWzlKM3UjtviKeuSaxXbng60oYEONS
	nQfafcWdNCO5F+q+Vw8AKqtkJibwZ8fEU5wE285VTfMc9qrqqx4f542BXGlQqecekq7fYjiEJxl
	gFPrnAU1/fMZHrZg==
X-Received: by 2002:a17:902:f601:b0:2bd:4bc3:2995 with SMTP id d9443c01a7336-2bea22bb7c8mr27750285ad.22.1779365804521;
        Thu, 21 May 2026 05:16:44 -0700 (PDT)
X-Received: by 2002:a17:902:f601:b0:2bd:4bc3:2995 with SMTP id d9443c01a7336-2bea22bb7c8mr27749845ad.22.1779365803962;
        Thu, 21 May 2026 05:16:43 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea917318esm10435555ad.5.2026.05.21.05.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:16:43 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Thu, 21 May 2026 20:16:27 +0800
Subject: [PATCH v9 1/4] coresight: cti: Convert trigger usage fields to
 dynamic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-extended_cti-v9-1-d21f4f92c51e@oss.qualcomm.com>
References: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
In-Reply-To: <20260521-extended_cti-v9-0-d21f4f92c51e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jinlong.mao@oss.qualcomm.com, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779365796; l=11942;
 i=yingchao.deng@oss.qualcomm.com; s=20260521; h=from:subject:message-id;
 bh=ASJNP5SBvgtIXKX3zaln4ApjABeRa1GyYs6c5sAJhcY=;
 b=pqvzih8zamQbzAQAKdKnL2RCyGJYp0rit2wZng6X5zLXerX6fP2V5OpirF0l5r6U65tKsiSlm
 xqXocWuyu9VBXnfrgHbSDlUrJ3nnXWmSPVfX0RqCAZaTXe1Di4dhYvC
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=YbHeeX0Qzqo7voZLva784lFhVChB9yF3a4sceW95ljA=
X-Proofpoint-GUID: Mcs1DHU7j_6SHUg6RDwmh7WYPhbNLK2Y
X-Proofpoint-ORIG-GUID: Mcs1DHU7j_6SHUg6RDwmh7WYPhbNLK2Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMyBTYWx0ZWRfX9iosS/IYtcYn
 xog3X1bjWTf5dMBUEmiMC15/77TUn03U04arp+sa3Vrb8jvOazBU4XSfIy0H24UfKVSSS9yy52k
 nEsZvU7y/kVsFfUfKr9ZGCBDVji/WKugrGlAuByB1QecFro6qKBtEPko4v4g1OpseL+6onFUell
 OBo8xB93RH+3eG/yiJYsbbhTxdIuvx49rPts6QK3dsYfbGi4WzbWKdS83yMfuN6ZKgERussf9NK
 MWsRRN1MHRDtLsNoWpY0LX7wxSXNWzVnrc9E+sgfyNluDu7RWDBEG/aJh2g+Swwvpgz3vLyzI6r
 l4Trp5tJMOz7DTP2MtpB3ZEPzmlV4UiuQ1xwtX2hzgesn2oDGEi+CNw5oDOygOWD36c6PCJ5xGu
 0dq9vDfx4RpTasyjjTau8tT+bRrqdJWzZZSZ9clsCHZq2pYm8ZT20kP9cSlvQyFWIHoSUi0DSz/
 jdP3Ub5n1QWDCpGA7OQ==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0ef7ad cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7_BDbhMBoegF64a6bMcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_051646_986582_F3054F39 
X-CRM114-Status: GOOD (  21.35  )
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

Replace the fixed-size u32 fields in the cti_config and cti_trig_grp
structure with dynamically allocated bitmaps and arrays. This allows
memory to be allocated based on the actual number of triggers during probe
time, reducing memory footprint and improving scalability for platforms
with varying trigger counts.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c   | 59 +++++++++++++++++-----
 .../hwtracing/coresight/coresight-cti-platform.c   | 26 +++++++---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 14 ++---
 drivers/hwtracing/coresight/coresight-cti.h        | 12 ++---
 4 files changed, 76 insertions(+), 35 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 2f4c9362709a..4e7d12bd2d3e 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -161,8 +161,8 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
-static void cti_set_default_config(struct device *dev,
-				   struct cti_drvdata *drvdata)
+static int cti_set_default_config(struct device *dev,
+				  struct cti_drvdata *drvdata)
 {
 	struct cti_config *config = &drvdata->config;
 	u32 devid;
@@ -181,6 +181,26 @@ static void cti_set_default_config(struct device *dev,
 		config->nr_trig_max = CTIINOUTEN_MAX;
 	}
 
+	config->trig_in_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_in_use)
+		return -ENOMEM;
+
+	config->trig_out_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_out_use)
+		return -ENOMEM;
+
+	config->trig_out_filter = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_out_filter)
+		return -ENOMEM;
+
+	config->ctiinen = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
+	if (!config->ctiinen)
+		return -ENOMEM;
+
+	config->ctiouten = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
+	if (!config->ctiouten)
+		return -ENOMEM;
+
 	config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
 
 	/* Most regs default to 0 as zalloc'ed except...*/
@@ -189,6 +209,7 @@ static void cti_set_default_config(struct device *dev,
 	config->enable_req_count = 0;
 
 	config->asicctl_impl = !!FIELD_GET(GENMASK(4, 0), devid);
+	return 0;
 }
 
 /*
@@ -219,8 +240,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
 	cti_dev->nr_trig_con++;
 
 	/* add connection usage bit info to overall info */
-	drvdata->config.trig_in_use |= tc->con_in->used_mask;
-	drvdata->config.trig_out_use |= tc->con_out->used_mask;
+	bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
+		  tc->con_in->used_mask, drvdata->config.nr_trig_max);
+	bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_use,
+		  tc->con_out->used_mask, drvdata->config.nr_trig_max);
 
 	return 0;
 }
@@ -231,6 +254,8 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
 {
 	struct cti_trig_con *tc = NULL;
 	struct cti_trig_grp *in = NULL, *out = NULL;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev);
+	int n_trigs = drvdata->config.nr_trig_max;
 
 	tc = devm_kzalloc(dev, sizeof(struct cti_trig_con), GFP_KERNEL);
 	if (!tc)
@@ -242,12 +267,20 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
 	if (!in)
 		return NULL;
 
+	in->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
+	if (!in->used_mask)
+		return NULL;
+
 	out = devm_kzalloc(dev,
 			   offsetof(struct cti_trig_grp, sig_types[out_sigs]),
 			   GFP_KERNEL);
 	if (!out)
 		return NULL;
 
+	out->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
+	if (!out->used_mask)
+		return NULL;
+
 	tc->con_in = in;
 	tc->con_out = out;
 	tc->con_in->nr_sigs = in_sigs;
@@ -263,7 +296,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 {
 	int ret = 0;
 	int n_trigs = drvdata->config.nr_trig_max;
-	u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
 	struct cti_trig_con *tc = NULL;
 
 	/*
@@ -274,8 +306,8 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 	if (!tc)
 		return -ENOMEM;
 
-	tc->con_in->used_mask = n_trig_mask;
-	tc->con_out->used_mask = n_trig_mask;
+	bitmap_fill(tc->con_in->used_mask, n_trigs);
+	bitmap_fill(tc->con_out->used_mask, n_trigs);
 	ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
 	return ret;
 }
@@ -288,7 +320,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
-	u32 trig_bitmask;
 	u32 chan_bitmask;
 	u32 reg_value;
 	int reg_offset;
@@ -298,18 +329,16 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 	   (trigger_idx >= config->nr_trig_max))
 		return -EINVAL;
 
-	trig_bitmask = BIT(trigger_idx);
-
 	/* ensure registered triggers and not out filtered */
 	if (direction == CTI_TRIG_IN)	{
-		if (!(trig_bitmask & config->trig_in_use))
+		if (!(test_bit(trigger_idx, config->trig_in_use)))
 			return -EINVAL;
 	} else {
-		if (!(trig_bitmask & config->trig_out_use))
+		if (!(test_bit(trigger_idx, config->trig_out_use)))
 			return -EINVAL;
 
 		if ((config->trig_filter_enable) &&
-		    (config->trig_out_filter & trig_bitmask))
+		    test_bit(trigger_idx, config->trig_out_filter))
 			return -EINVAL;
 	}
 
@@ -687,7 +716,9 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	raw_spin_lock_init(&drvdata->spinlock);
 
 	/* initialise CTI driver config values */
-	cti_set_default_config(dev, drvdata);
+	ret = cti_set_default_config(dev, drvdata);
+	if (ret)
+		return ret;
 
 	pdata = coresight_cti_get_platform_data(dev);
 	if (IS_ERR(pdata)) {
diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index d6d5388705c3..ba5a7e4b6bff 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct device *dev,
 		goto create_v8_etm_out;
 
 	/* build connection data */
-	tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
-	tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
 
 	/*
 	 * The EXTOUT type signals from the ETM are connected to a set of input
@@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* Set the v8 PE CTI connection data */
-	tc->con_in->used_mask = 0x3; /* sigs <0 1> */
+	bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
 	tc->con_in->sig_types[0] = PE_DBGTRIGGER;
 	tc->con_in->sig_types[1] = PE_PMUIRQ;
-	tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
+	bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
 	tc->con_out->sig_types[0] = PE_EDBGREQ;
 	tc->con_out->sig_types[1] = PE_DBGRESTART;
 	tc->con_out->sig_types[2] = PE_CTIIRQ;
@@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* filter pe_edbgreq - PE trigout sig <0> */
-	drvdata->config.trig_out_filter |= 0x1;
+	set_bit(0, drvdata->config.trig_out_filter);
 
 of_create_v8_out:
 	return ret;
@@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
 	if (!err) {
 		/* set the signal usage mask */
 		for (idx = 0; idx < tgrp->nr_sigs; idx++)
-			tgrp->used_mask |= BIT(values[idx]);
+			set_bit(values[idx], tgrp->used_mask);
 	}
 
 	kfree(values);
@@ -316,24 +316,34 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
 {
 	struct cti_trig_grp *tg = NULL;
 	int err = 0, nr_filter_sigs;
+	int nr_trigs = drvdata->config.nr_trig_max;
 
 	nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
 						     CTI_DT_FILTER_OUT_SIGS);
 	if (nr_filter_sigs == 0)
 		return 0;
 
-	if (nr_filter_sigs > drvdata->config.nr_trig_max)
+	if (nr_filter_sigs > nr_trigs)
 		return -EINVAL;
 
 	tg = kzalloc_obj(*tg);
 	if (!tg)
 		return -ENOMEM;
 
+	tg->used_mask = bitmap_zalloc(nr_trigs, GFP_KERNEL);
+	if (!tg->used_mask) {
+		kfree(tg);
+		return -ENOMEM;
+	}
+
 	tg->nr_sigs = nr_filter_sigs;
 	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
 	if (!err)
-		drvdata->config.trig_out_filter |= tg->used_mask;
+		bitmap_or(drvdata->config.trig_out_filter,
+			  drvdata->config.trig_out_filter,
+			  tg->used_mask, nr_trigs);
 
+	bitmap_free(tg->used_mask);
 	kfree(tg);
 	return err;
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 3fe2c916d228..2bbfa405cb6b 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -719,12 +719,12 @@ static ssize_t trigout_filtered_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
 	int nr_trig_max = cfg->nr_trig_max;
-	unsigned long mask = cfg->trig_out_filter;
+	unsigned long *mask = cfg->trig_out_filter;
 
-	if (mask == 0)
+	if (bitmap_empty(mask, nr_trig_max))
 		return 0;
 
-	return sysfs_emit(buf, "%*pbl\n", nr_trig_max, &mask);
+	return sysfs_emit(buf, "%*pbl\n", nr_trig_max, mask);
 }
 static DEVICE_ATTR_RO(trigout_filtered);
 
@@ -931,9 +931,9 @@ static ssize_t trigin_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_in->used_mask;
+	unsigned long *mask = con->con_in->used_mask;
 
-	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
+	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
 }
 
 static ssize_t trigout_sig_show(struct device *dev,
@@ -945,9 +945,9 @@ static ssize_t trigout_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_out->used_mask;
+	unsigned long *mask = con->con_out->used_mask;
 
-	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
+	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
 }
 
 /* convert a sig type id to a name */
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index c5f9e79fabc6..ef079fc18b72 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -68,7 +68,7 @@ struct fwnode_handle;
  */
 struct cti_trig_grp {
 	int nr_sigs;
-	u32 used_mask;
+	unsigned long *used_mask;
 	int sig_types[];
 };
 
@@ -145,17 +145,17 @@ struct cti_config {
 	int enable_req_count;
 
 	/* registered triggers and filtering */
-	u32 trig_in_use;
-	u32 trig_out_use;
-	u32 trig_out_filter;
+	unsigned long *trig_in_use;
+	unsigned long *trig_out_use;
+	unsigned long *trig_out_filter;
 	bool trig_filter_enable;
 	u8 xtrig_rchan_sel;
 
 	/* cti cross trig programmable regs */
 	u32 ctiappset;
 	u8 ctiinout_sel;
-	u32 ctiinen[CTIINOUTEN_MAX];
-	u32 ctiouten[CTIINOUTEN_MAX];
+	u32 *ctiinen;
+	u32 *ctiouten;
 	u32 ctigate;
 	u32 asicctl;
 };

-- 
2.43.0


