Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9B8CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=; b=KEQ12iwa5y3O78nPJIb9GWbA9y
	TsJ69BBdpbY4uA8Hb9zp8uHs+7jlNptH+vJCTBQ8Oe2lLwCAR0Q1cTFXfIMmRy+0MlA2NfRYhF0i/
	q/jl1SSq/ahlPTCx8dqif34oXocHSWOhXqvsJ15rwV/xoeGYmGGy8ZxAraCoWH+ZOZGLqhnKGKAIg
	0DDZYY6qFA41PxRwC637izaiWGCGv+AxZkzoRxdCYwPitDtGAgKyZoKIcgW4huyClW27dGlkRDs3a
	Ru4a/qA1DpdbI5H7n9K4L3mB9g/y16ea5Kmz9JSkQaHjxgxHxc+UM/cjzbYDUmR/8lNE+p+VLeau/
	Idxb0WNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzTB-000000041dV-2ymY;
	Thu, 07 May 2026 14:12:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzT7-000000041at-3FtC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:12:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6479N4cs3464902
	for <linux-arm-kernel@lists.infradead.org>; Thu, 7 May 2026 14:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=; b=jitw2C6hr89DuaRB
	h9houTJjaGIp7/rZdVggYv59en0kXLhQ4Iflw9unHxSsn8pqRg4CSBlRDyxVgYvu
	dSmxXyaYq01/84Ech3GGoNpYRECMU1MwuCTha0UtUeIIZQi1PmLhlNOe1ltpzkRO
	8gwF1FQF3kOphNH7V7g6XhyiGe4cYXV5qvlJxXMXQGDlaQQEE5RdPFpW74b+pPsg
	IAQkkVNSYKooGi8D+tH1ED/ooXojJFVbyCRZxC2Vn2kjf+ywtGleio7oOUhHlX/E
	Tz79hCjqykDnCxeMdgBQ8JOOk/PgEhTWWztIily5xSbLFXdKWI9E8aS7GC3+pUVp
	JnHpSA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn2epu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 14:12:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7aba0af02so11138495ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163169; x=1778767969; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=enFlgGOFd9/akb/8RZI0llz+tEAbbYhpbVkpKtP8FLnThG9iwc1GPF01pqfa2VR0+R
         UoROf8/AT9K5J3NjImB8n93EasgxVpD9+UXr5MpTYUidNsdoGe0YzKV8XQ566CFgDQvS
         QaLaEsm30McjPkOaCWdDeMNtU0Jl+N0rU1Oo0+6gZX3kuvDEbWSp6V+H1O78e1BxCvCx
         cmWUf4PheWAOZ2RLKNHLhFitbPv6RE5f5pFXwHTZAtPcwNHlnl2QL7J1SeeI1zJYu1b4
         XJ9DMYT5MFMQ0EEiUKQLHu7K3ZXG3RVN6QLRI+IdfzvESicB+mTmldXOG5Iy45swtTCw
         1tfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163169; x=1778767969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1wWjC7fh+aHAvyftVm0FHkxDiI5MU51E2SCcX00kUs=;
        b=at9qZiaJn9BOkFD99kosK8AfDAyCQVF3hI2FXu4leyfcS3FGMjM5q72mJyCBtk6g8D
         ObLh6wYva1gyNhASmuLliqfjIxqngfJNoY/290MF3HzxshJbNMaD7Sin9ykfzSjtQKTs
         DcEjvQoT7uLMnFH7Y2/8VXQqHOo+w9++H5jwjXFWtqJI1goA3pLOtBPWo6qOlXvDJxZc
         3E52GGM8YU/ZJmxWXW70BmeE8xsEipxhKKpnnbSFaDdhqrdCAF99Rf0Mzvib46UkCbA1
         jQT6dLoEGTchoQ0QFfk4hD4Te/7hhhy8KvRB94z+sXWFNlQyjohXP1pA6mkaT45hoi9j
         nCHA==
X-Forwarded-Encrypted: i=1; AFNElJ/xqC2yhWaCHpsrFgTg8Uonoku2989r+nvaB3zrVOQTj2tDXI+ypUM5SVcorKdtsWqlie2PrCa7hjUaZGZk6Vex@lists.infradead.org
X-Gm-Message-State: AOJu0YwQgsXpBJccfEsYOUQ7qnEl4k/Cd5jywbfUo0IJmBFvvmPW8+NI
	AE4Hx4IkP1pWBjkMIVvU/VnCxazcjPn9M7XFwUalsp3FZCoHwn1qEmrrwL2OVTni00hKS+qCo8W
	wvGB4Gkfu4kRqG8zzrqKHjqeOKGUHwxNGQy5C9KW1SRTd+Sk0zH8ceDOz447GunJN0A5LVR2szr
	rmPg==
X-Gm-Gg: AeBDievJ5Q12OKKHoFmaRlM0OH7Re4A/EdliSl8hh+VtkuK8TCxgtYbu17lcjw4HRiK
	YTaFPSpWJ+lCb45LyQpBCqGIGmC6oKi+bhfQ8OyiHYX0LP4eEa1tfJlCRNflEaU9Dbm1EI89ArB
	Gm/6iNh+08Q/w1Zp+LhjGGJFIvNAgiV0nZCq/w3NK0HkBrRt9xBIlSCInv1DbWwRN4fPjQS25/K
	JXhFWPiMNlnlpk48O7oaxpGmF7QmkHfU/ayKUNMG8/7XnpPs5dc0kaFVTyFMy/ba5gqh5AVlb//
	BustwFv3L6S4zyv8xF+gmedPjMl5c8Nd3HnYDzABPQNL/K6moaViIj74qLD8ivURMLC84DeZ6gN
	bQyEh6hbB+SsEMwmxyb8bRsI+GSRrjOmHkq0WNxWbW0LkY9swv+s2CRv7qytIcUqX70Xpfw2SFX
	5qkDcKN5OgPCK6Yl15eLY=
X-Received: by 2002:a05:6300:218b:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3aa5a70d15fmr9272535637.17.1778163168472;
        Thu, 07 May 2026 07:12:48 -0700 (PDT)
X-Received: by 2002:a05:6300:218b:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3aa5a70d15fmr9272497637.17.1778163167982;
        Thu, 07 May 2026 07:12:47 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:11:59 +0800
Subject: [PATCH v18 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-3-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163146; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0THtAIFi5jelKh7Fknxn2c5M5CE76ThTcdKm3o+68rg=;
 b=J8K9AyTEoZRr/lTm4JvkvJEyM/VdCHv91RJsmSKJjhYdn5mAM1Y43UtdsxcX4p4+yrTPUWy6r
 lhvv8Slq1ZTB5x4tKb8J5ayczH2e34PcL56K7HA6InlzqfnNW2Zch9d
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX7S6ZypTgizdH
 7q2GMEuB1DAWwmxIGtGM1/3w6JPBmh3JjRGvGWh0KPZ2AYdbLzaF3WDkaUuWSO3JvZTEuk+//L6
 ElcHe4ql1JslBZ6MvgJEYqtx/aqGBdeX1WOJvp3A3MObNj7SX7frAmvAYrEquiMsqcp5flCLO+w
 WaoigYa/JEc3n0deVERmBPDgp3/TAl1hk2h4pouEaQT5twKRz+JqG3Xc6ry0VhAQaECGsjZS4WR
 WMbMV8HYY9Lp3BdIaqrgQTl761TlzlfC7ZWhI6XamoyWKldaIXIA2ksvW7V8o/D6Z/3yCg6tDob
 1Bed0CePWkWuKozky03jtS09sHfqxp55Mk7WS6rIqHvmwAenEK/FEvjFpXo2tu5orxj+PCSwptV
 mdlAaQnAmIq0Hc8FOj/MlzQJ7FNzMtFN/LIcmr6HPl4jUCiYeHkWflSjRqYV4X9geKKaD+NGO/k
 OjqvYRen4TWxSEZcf6g==
X-Proofpoint-ORIG-GUID: _KqkTg4gFKmYxidc63rq4S4eLxSBYHsM
X-Proofpoint-GUID: _KqkTg4gFKmYxidc63rq4S4eLxSBYHsM
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc9de1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_071251_617024_1D48E67A 
X-CRM114-Status: GOOD (  17.58  )
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

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bac3278ef4dd..110eedde077f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6e994678f926..a14645b04624 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,6 +259,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


