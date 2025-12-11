Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49857D3E797
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 06:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=; b=FajWKmzpuaYeXVo78Erp5ieeON
	yiQZkpYX+Qv6OSH5x4urD2/OlSkf4AmzGqM3hfouE8l8SLsg+GzBnWZV2JzGqWPiGzqmrVadLtAdH
	u0rW6T5Rf1HDmoY0K2d5w65nd9ldmV2Cz3A588KrLJZbL9TwV+ILrw/SruPE0AgjKi3B6I1BGnPOz
	0Ia1faAIX/sCr6ApIHUX1zKIPGo+N3N08Vb7ShdwIp2ZWoM+Xkx3OhZbqTQLEFqctXsaYaQeZnxIg
	hA83yki3hqNlSROOjMZy1LJx7g92/vlxD5wPK7CYEL344KCj52Dwu2dls+n28n6/e/MeXMYW6uZjE
	VWYbgWGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZu6-0000000GGc1-2o4h;
	Thu, 11 Dec 2025 06:11:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZu3-0000000GGa7-3uLa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 06:11:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALSwt83206761
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=; b=KurbiStBBVL8b/jP
	OukJyoI+qoID3RDab0vbpy1BDR815qU2UERO7MBo8ddJwMgQLKJ3eiufYlmgQ6/B
	4mzTKSQdfLBRkPE4klWvtTHx2DCx9zV3zSEHlfv9IjUiKc8gMmGoAyTwp3kBBjxD
	5dmG/FH+wnIhblUZSKnFU2EUXfxJJxNGe/sg8m/hIHNCBKDINUxNIXXwIZLWFf2o
	guswoNOu71t3H1hKzwYUEsVLoEWu09AG1aLFdUTkIW2M7QGLZef99KwXTEDJyUTk
	Ef60pnlKg3QrZNKpeIJjkQfLg3VjAPhBsU+U4y0hkRTQplGfNX5ndndVwlF3f7oG
	ZIsB2Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygrx1802-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:11:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29e921af9easo12324975ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 22:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433511; x=1766038311; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=;
        b=h8Bs/DlVRa5rPSY5HHgCvu+it1VtrQjS+4cuFNjYChmbavBkyiYnzbBZm9FZ1NwVoe
         LAbwZLNfDj8w15YZaogZFl9pTjdLNzUO0xsheKwfISNSv8Dh/G1KJnGEeWE4+UzZ7qc+
         xFb6EwcnK1tyjN/MXaS1dGYCv0haYXG1A+y7xPLkJG883GpOBdzYzIm0Y7ELaloH/uIn
         8F8L/dEvD+tHDjO7/+N7y8AzVQF4hfvCjuM858NdHjCy/GG3MI5JLsqdjBvqlhxjuZdV
         eMUokvP57WX2CA8PRlrbYxHRueXRi6LDZgO6Epvuql/h/BPKg69bTYI5ZtOvjAuIn+Wq
         vNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433511; x=1766038311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=;
        b=bUY2Y67cNqrW9+Sd1/tRet/d9jstIeLn4Wsx03+3SZbcYAIO6q6e2VtdvpHZq82O4a
         ZNexvtXcJe6LrEY/68QmADbZ0DAJnPKGG/JyPa0N9ZCmErf55+aZa4ZmGjt44UPiajsQ
         wW53/IujamBzW++/+tW4U/r/ybweCb3xOMhizZUQ4eTpQFAgPKu6eiLHR0Y5hiOU93lR
         GIsPJ+cVo1qj+osHigzBfn0upYS9P29XeSsjvjYNHRXCJLa2+XWeZ9l23OpOpN3ccVkG
         h/BLwK6EP/5eHDIpxdr4V8qDyXzifflxyWoZDPZ9z21Z9lg8IWP45oxYVtjuH0p3fwXT
         PJZw==
X-Forwarded-Encrypted: i=1; AJvYcCVtKN9PR0gWtTnlHnvU/CUqZ+bz+Hho5pa+3uBlofu2sPk+RWQ/G6BOJvDWdsIV81GA8LSOpQS0ERUXRjBUCtL6@lists.infradead.org
X-Gm-Message-State: AOJu0YyeSNrrwtfgO8G2EIa80SEGTvDfU809UvcCNmkJ3R+jIyd4jvuX
	d1BQY4RrU8RpGIzic3CHGkjRvOpNCWOxv9Lvy7zz820mvEc+7W9XRNtv0Eg9lTumHPYVxbpjANQ
	BtUqqe7RF1A3DEGlL31JnQx+uDOfcZ4sdUAHx9dHoE2Fv1S+iXequL5/uTOSBlFPoTGV+DZrdVk
	TQuw==
X-Gm-Gg: AY/fxX6w8pnCwYqjMQBaWeh3mssn0JC4HlG60H2wI0NLU+rbxhhcyaieh2VDZfo3FFt
	mYshoCOWrFLLKD4W9AQEF9B7B5XqIovlMdUemoQTHv+R+EcQ+i8CKDw2G8/k6oM7Xl5gA+0gUrO
	YL4kKbIHKGX5T0bJkJO5rVveskf7ZJ/EciCWc3FI9o/cqed/XycAqOrX5AceEjREjVBoik2/MAs
	o1IB9J96Qu9FQBCoVE+2+fqA7fUBqWPEH25QaN7NAujgUVoo/JTY8EcFnBW6ol3Yx0fFCw0BaLr
	Ba8iCOSfcv56BqnoQwquIg4Rv63E4mv/lU/e+w7w5oemxpCLf+osfkZbvnC8XFxWuUcHyjlSTbk
	3ymniFHpqSM01jh2/cqrcocyOOJ3bXiaEz9rEb7JmXhxfTb9Z97JD0h/LwSmdXWwQIXQ5KHpQ
X-Received: by 2002:a17:902:ef46:b0:29e:e925:1abb with SMTP id d9443c01a7336-29ee9251c57mr20447215ad.27.1765433510600;
        Wed, 10 Dec 2025 22:11:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlea653ROQml/NDqmt5Qi7x7FLFp59TsrT6XIC7awP3CpQ6dicUKXcpTFHchhmY95IxLT6Mw==
X-Received: by 2002:a17:902:ef46:b0:29e:e925:1abb with SMTP id d9443c01a7336-29ee9251c57mr20446935ad.27.1765433510148;
        Wed, 10 Dec 2025 22:11:50 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:11:49 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:10:43 +0800
Subject: [PATCH v8 4/8] coresight: tmc: Introduce sysfs_read_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-4-3e12ff313191@oss.qualcomm.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433484; l=5450;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=adb+NstK0OrGdQHboby6lmZs7rWs2zBc775hVSg6Ay8=;
 b=pNNGCo2sKcw17OfdCXYJbjXP6WA9w9ppuOEMl8czhsU9OnxyxSNPtIoM96fqchgeR8rCnn2Sz
 +lIREvdb64qDQogHnx7wEYF3nw4ZAiIaDryE1VaKklJFSn+qzXyQfwC
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Hc0ZjyE8 c=1 sm=1 tr=0 ts=693a60a7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=JzqEjpkVlBH90HjAhVoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: n59-HU4mzgxpJ1VoMo3LcYpfybw7MhVf
X-Proofpoint-ORIG-GUID: n59-HU4mzgxpJ1VoMo3LcYpfybw7MhVf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfX7VJSmSI4J4NN
 sJoYamJvsnr13iUkI4S2DGh+2nxCEk1UM/RZVWnYwUYmTj6HtohR2ZGGapBkutJEMrf9DrCk5m+
 Ii3b9jUFUlukWLhs2ZfvAfELXGX1BZm1im6N52cUflSNyapZJfbIuVI1hRWxc6xBPmCWSleYzy2
 G5cdIy0017VT0lP9TF6h2G+XWHZ4Q8cmobBVFn/xq0FPydQC/3RLw4dop5DNga+RXX0khfB8bKK
 mPNZrQsUmC/HdTgbeiQSy8BTxQZTQizRUA95duKZJjBz2/Kgfyv1YYUImhlVe40ZKynUIeeg8sv
 GKhiOIBMPEwKUbajquVQifUu8AIRikdZwepD5L+JxvU8UIrfpmRyLkuDR4VQSBFUkgQsmDjbPnI
 oynWvaZUhsxu21kWBXzrdXO0jTR1VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_221151_980626_58ADD82C 
X-CRM114-Status: GOOD (  18.93  )
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

Introduce sysfs_read_ops as a wrapper, wrap sysfs read operations, for reading
trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 50 +++++++++++-------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++++++
 2 files changed, 40 insertions(+), 27 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 1ea255ffa67c..8b0397a77e57 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -232,17 +232,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
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
@@ -254,17 +247,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
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
@@ -291,13 +277,8 @@ static int tmc_open(struct inode *inode, struct file *file)
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
+	if (drvdata->sysfs_ops)
+		return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 
 	return -EINVAL;
 }
@@ -769,6 +750,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct sysfs_read_ops tmc_etb_sysfs_read_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct sysfs_read_ops tmc_etr_sysfs_read_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -828,6 +821,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = &etb_devs;
+		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -841,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->sysfs_ops = &tmc_etr_sysfs_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -849,6 +844,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 9b3c4e6f0a5e..c9a82ff6cd00 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -221,6 +221,8 @@ struct etr_buf_node {
 	struct list_head	node;
 };
 
+struct sysfs_read_ops;
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -258,6 +260,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer_node for byte-cntr reading.
+ * @sysfs_ops:	Read operations for sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +293,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node     *reading_node;
+	const struct sysfs_read_ops	*sysfs_ops;
+};
+
+/**
+ * struct sysfs_read_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct sysfs_read_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


