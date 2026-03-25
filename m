Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C39DFEA806
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 05:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25fbS8mRuUBMqAXg6T/z6v9tHy/oYlGG8Pqk/K9vN7I=; b=FpfelovFyFjGB/a0s3pByVk1NY
	OPUyFDQ+r/CPR0IhmUXXGLzYP+OISeOFEXYJbXuYup6e5DpOXgYxp2PpNBEn79XRuO/9TYEMytGym
	9/bwU+ymo7G2nPrwJvo8s8FhimdbQe2tpGJNp2OKK9cf9US5k9dcvMuARJPlws5aWpof7j3/Ne6qb
	6bHQXlgDhgdKg0quYWNAZ4nSNB1yKfk491kgRXvS0yCQ2vSlgrUJbDtECumJZPwfDPfvWwJSaJDQw
	KVG8lVAk/eOTjU+Gq7ugmmvF3UDLUq0ZF0+0puDFHv7IotA9pkVVEUlRbYiei4Vr1Zkm7E16cK5zF
	FlOEMopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H2G-00000002j5a-3vD4;
	Wed, 25 Mar 2026 05:44:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H2A-00000002j4F-3gkA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 05:44:04 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P45spG3110477
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 05:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25fbS8mRuUBMqAXg6T/z6v9tHy/oYlGG8Pqk/K9vN7I=; b=Ig+5FkGCAbUc3AUE
	lCSSO7QnCBIRlHpyNQd7YaXWAB9WblZCVGQUtOG3F2TlXXmxLThGwS2vnessL1wX
	2Qi426EWbhnTT382mRrGb0Bo0TytBN8Fo+/5D3m+BAhSM96A1sCnicmLkBmOwkO6
	0rTz42x7R3JCk8GaVyTp8uh6vKlMcjpBozJl7zwht6Mik7c5jBdGYa4tuyWTAt8Q
	wRVyzsibalJpWMGwXPHMddMeLZC48llE4BryjJO+gGLG6Uf0KTS97D4OUD+K0giO
	wUhPgcZAy/55mrxZlhl+jKrJ7UHxjLxyq+rSc7LuLyaucBoXNv9KVoXT3A4yA3UO
	cuQiRg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvtwqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 05:44:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b059ab124dso64612615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 22:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774417442; x=1775022242; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25fbS8mRuUBMqAXg6T/z6v9tHy/oYlGG8Pqk/K9vN7I=;
        b=BvcmpgJEwinEvPmnWcsfFQpusVs2m52ibetHDYPe7nhmLlI1MIpX9s0vXRlefxm/b+
         t0LXDXL6T8yU0tw9w+OG1P8/7R78tLGPpuI0+Og4DbhWp6NcKE+7vNn0/S0ViClV7nft
         7MRc3BM7rTw25eSqk1TEWDEKL8SuJxUQno12WUxq98FtW4ZGPytrm0IX0KlYa+Ug9yap
         jLgTp83yHwh86r/kN6uXJttN2oP0BXFiildoHOCBRfCA5dZMDHlUBExY1SRoyI9iRhv5
         Acoj2eoC8scqlxdUppXHYm7/q6VumZLYFAjbK8EWUJ/fBwY+Dqtp4qBuZqhJRwmbOC7A
         J4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774417442; x=1775022242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=25fbS8mRuUBMqAXg6T/z6v9tHy/oYlGG8Pqk/K9vN7I=;
        b=KL151WHLQLKx+0dDd9hsPEtYH3OqKlURUbSDivrBepHuyKmZOccqM5GFkHnKy4ExZG
         2En9YcRQsGlqxdd5I/L3q3kk/KNoqtSv5BrpkcN8a0F+WJTa7GcCoREr6Ak3eIYaPBaP
         4BU66bUZbn7KJyF+SsDlaGQnuJiMLwNR53PE6YJa/NAkjlH01Xw3+fbNlqJEOiNau0po
         Jy7FkDEE3vyf3RGIYn7qcRX3f+Gl/nLpS53S+woMJ3z4Y2Ros1ze+gEh9kBFDM09qXwy
         99/eizMJp+ca3iw3o5WHY/b4WZilNSiAUfiMpC8RE4XYwBgjQH5nUdYg4D8LOYy3pG6a
         ooPA==
X-Forwarded-Encrypted: i=1; AJvYcCWWTvVEZ2uX5Wj0jDlzE10oe+zktXEYAaAI6v1vZcyx0ATcKTN5QBDrdq55Sz+KYrosVSGVCtirUfTK+xfi1lPi@lists.infradead.org
X-Gm-Message-State: AOJu0YzHpZ2deub/HIIqZl6StB6F1WKW9r/1ucEVcLd16bVhs+nXWit0
	SSL89k765rNUEHhSwyi+XWj8XxRUIczYCHUIibZ/0O64WsPmZ8yeO/sxGv3Wbco2lcvU53n9bkV
	YpKEaUY294JA1JzTVyup+JHodBVQU62/i/p3ZoSVNIToAm0ptmVYHcr6vbOrgAHaUZc0Hlbky01
	UW+Q==
X-Gm-Gg: ATEYQzyWNPQC0C70k/Z0LuQ/C9isOGRaPlJFpWyX4UaAwYU5fQbpeEFE34jwHgpkZ8K
	1sWe1UiOfUNy8QD2x1sbajB9oyNZj1rRr1mY3Ia01Acdqv8hGOBQNV4EIlGMSqGeC8nq5kYoKLP
	iflJdCqdt9jkOb6jzwTR9slj+npxFt96WnSAzjmHH7vKfkUQ8agfveCd9rJYyuQDfgZ7+m1FhWV
	01xmg/P46n1s8pqKo8MG2l4exxOWHrVJCKie0aIGBtJ1FG2LCKiavr+VT3JsQ+lbADMDRiuTJd5
	3mn/eyzaTkXZYBZ/Hg7UPEHHcaQqZ5N2zST5qq6904jObcz5c8Ec0U+6x4wiv998TeOvsQfgK1u
	Fm88h8KFfKor04KfE+A7UJbECP6iBpZYFZ8CgEQUJceRHcV875q/u8iDosi5Y0QBTORFQEnphFm
	HJ3zNmQ6iG4KjJZg==
X-Received: by 2002:a17:903:234a:b0:2ae:4445:f39a with SMTP id d9443c01a7336-2b0b099d271mr24386425ad.7.1774417441582;
        Tue, 24 Mar 2026 22:44:01 -0700 (PDT)
X-Received: by 2002:a17:903:234a:b0:2ae:4445:f39a with SMTP id d9443c01a7336-2b0b099d271mr24386175ad.7.1774417440961;
        Tue, 24 Mar 2026 22:44:00 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556f6sm219985805ad.49.2026.03.24.22.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 22:44:00 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 13:43:44 +0800
Subject: [PATCH v7 1/4] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-extended_cti-v7-1-bb406005089f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774417433; l=10928;
 i=yingchao.deng@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=qAzZ+u/woLYDbL6f/lfFrwEnDhUdQIVjsv7FGZH74vE=;
 b=0Kh5Lc/nzRfpzwGgV7GyzeF6MuKhH7iWTmlVU6okSE1pU+fbUygtkD5sBgvzeufPgQgZggox0
 XwhjY48/XQTCfZQzqSbUb8uHubuvZ8ewW83DFQpsqUCXURAkMztduz1
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=5tp504LR96W2IVT3sAbRCqWtoG16CxJVUnXJSfU8NlQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOCBTYWx0ZWRfX1isQpoGfZP7k
 7RqmricbHRKZGi7zn7UnN8zikKyWMP/BqAtbFeAKw8MAUwraxDpN1VBblB9dQOqXEUNox1vKSny
 ZphI2cQbRdq1iZDzADWgoa+KcQ17V4e9PTPdaAvRGfsPV+XC+lN9qRQBEu658b2RDpTEKobvIIT
 Ks89RbzYlYn8hqzp1VM3fnbzA+YLsJMIAeBhoCvrUgFhrSTrmB/chNBt448FhT7oUYh1CiwBog6
 7OwyiLoAIFr/YiJlLZR1Vj6gVFm/duqhz22eDPAlogZxae5EhTFZ/FUVqQxhB0CDvXoeOcL62xB
 YdC8WeeD6KF7Gr3z1h4PvdXgg0d+tWvuWoMCdBORDk63Zf3hWm2J4kwE0VPYHu0r5QYFyWGkXbt
 1mpJxAAyPTuBzaapiCYsoIKbB789oU9wH277Jyeh+0I7DQ5KVMxgcJl++koJ1kM5UbmjR3xzBB+
 nCmj8OvqPO+4xWaCAZQ==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c37622 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gAozoMUHzvVhJ8WkzYYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: sBjCR2do4HX1fvidpKZa6zGNcN5-A4BV
X-Proofpoint-GUID: sBjCR2do4HX1fvidpKZa6zGNcN5-A4BV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_224402_935604_D1373839 
X-CRM114-Status: GOOD (  21.99  )
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
 drivers/hwtracing/coresight/coresight-cti-core.c   | 57 ++++++++++++++++------
 .../hwtracing/coresight/coresight-cti-platform.c   | 16 +++---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 13 ++---
 drivers/hwtracing/coresight/coresight-cti.h        | 12 ++---
 4 files changed, 62 insertions(+), 36 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 2f4c9362709a..d5cb94e33184 100644
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
@@ -242,12 +265,20 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
 	if (!in)
 		return NULL;
 
+	in->used_mask = devm_bitmap_alloc(dev, in_sigs, GFP_KERNEL);
+	if (!in->used_mask)
+		return NULL;
+
 	out = devm_kzalloc(dev,
 			   offsetof(struct cti_trig_grp, sig_types[out_sigs]),
 			   GFP_KERNEL);
 	if (!out)
 		return NULL;
 
+	out->used_mask = devm_bitmap_alloc(dev, out_sigs, GFP_KERNEL);
+	if (!out->used_mask)
+		return NULL;
+
 	tc->con_in = in;
 	tc->con_out = out;
 	tc->con_in->nr_sigs = in_sigs;
@@ -263,7 +294,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 {
 	int ret = 0;
 	int n_trigs = drvdata->config.nr_trig_max;
-	u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
 	struct cti_trig_con *tc = NULL;
 
 	/*
@@ -274,8 +304,8 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 	if (!tc)
 		return -ENOMEM;
 
-	tc->con_in->used_mask = n_trig_mask;
-	tc->con_out->used_mask = n_trig_mask;
+	bitmap_fill(tc->con_in->used_mask, n_trigs);
+	bitmap_fill(tc->con_out->used_mask, n_trigs);
 	ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
 	return ret;
 }
@@ -288,7 +318,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
-	u32 trig_bitmask;
 	u32 chan_bitmask;
 	u32 reg_value;
 	int reg_offset;
@@ -298,18 +327,16 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
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
 
@@ -687,7 +714,9 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	raw_spin_lock_init(&drvdata->spinlock);
 
 	/* initialise CTI driver config values */
-	cti_set_default_config(dev, drvdata);
+	ret = cti_set_default_config(dev, drvdata);
+	if (ret)
+		return ret;
 
 	pdata = coresight_cti_get_platform_data(dev);
 	if (IS_ERR(pdata)) {
diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index 4eff96f48594..af5f45c6fcf0 100644
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
@@ -331,7 +331,9 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
 
 	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
 	if (!err)
-		drvdata->config.trig_out_filter |= tg->used_mask;
+		bitmap_or(drvdata->config.trig_out_filter,
+			  drvdata->config.trig_out_filter,
+			  tg->used_mask, drvdata->config.nr_trig_max);
 
 	kfree(tg);
 	return err;
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 4c0a60840efb..88f8a08ef778 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -720,12 +720,9 @@ static ssize_t trigout_filtered_show(struct device *dev,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	int size = 0, nr_trig_max = cfg->nr_trig_max;
-	unsigned long mask = cfg->trig_out_filter;
+	int nr_trig_max = cfg->nr_trig_max;
 
-	if (mask)
-		size = bitmap_print_to_pagebuf(true, buf, &mask, nr_trig_max);
-	return size;
+	return bitmap_print_to_pagebuf(true, buf, cfg->trig_out_filter, nr_trig_max);
 }
 static DEVICE_ATTR_RO(trigout_filtered);
 
@@ -934,9 +931,8 @@ static ssize_t trigin_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_in->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return bitmap_print_to_pagebuf(true, buf, con->con_in->used_mask, cfg->nr_trig_max);
 }
 
 static ssize_t trigout_sig_show(struct device *dev,
@@ -948,9 +944,8 @@ static ssize_t trigout_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_out->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return bitmap_print_to_pagebuf(true, buf, con->con_out->used_mask, cfg->nr_trig_max);
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


