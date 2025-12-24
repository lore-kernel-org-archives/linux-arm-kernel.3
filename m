Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394ADE7542A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=; b=tOLhsiZ5v+NnUwOE/HsTq3x3jU
	b/BuZMcaY8QXnBDDm3XvXKYRauK07EzZsfcEfFbVgrcDeB9rHTe822Li04ZD2DzZuqpSF/GhUn4SK
	BtJxS9r+PbyM5w9ialR6kOYpat6WwQBbgXUHu+gEPq3OTqGCWAVJf6qdsrRETs6sShcjp25SSbZ70
	pss5MMweddSQVV741jeVC0JCVnWLmGyjLOId/sRsEpeFI/Z3SgTEFQzWr8WfhZx05XxaCUVgZ41WU
	AOsQCVDe6Kqc8dD5yJ9pdlEDoYyCcaGyzmIOEvOH/etI0QKUa6N9E5ru03a+JmapNYthLlCp9QJsd
	3/oTiQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKq4-0000000GbdW-3PkJ;
	Wed, 24 Dec 2025 09:07:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKpy-0000000GbaY-2vSH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 09:07:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3h7w54134029
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=; b=YOBUPMmMdrDmeAIx
	Huv1FMsfe4YCuYUYWjRNLI1S7ntZ22ELjQ3MckP4EgYL9z21DlhTwaVHWF014DTu
	4lDLayaKTXKzv1sZMCx+NiQNAHASjD6LlcT5DYgRli6raS29BmBwa/7THC2Sjqdd
	4dNFknNfqrommWeiboRHuQmSAgPPGz2UnxDA3DbxwSs3oG2WBn/XA7naTRkPrTQ6
	LzjihxAA3K+CQOeU0fK+2+Wx/WwjXOQUEEMUILCHNorecrPQ8OrVDBHEv7Z7ChNt
	6lWQaI6TUgplNeU7SsT0w7IPHGDXenPCxqTMbY9mrRv/ui2nxDvdEk2XqOA4QwzP
	ClCVYw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46tjbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0bb1192cbso116863005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567236; x=1767172036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=;
        b=QTvRNIz7AOuY0ITfu26D7YIaJ+sJZsir2vHL39gOp/6gNXvyVXNc5Hhh8JXhiTX522
         nrM/Ia2Y97JzXVQwT8HKeyyZmGiKfsUP184MqQNvvGReC3J4dZ8A78l8lHoV8UGpHFwl
         U+86JYAYOCHhobYwtEZVLxDzH22nN9b0ApeY2NCB9X4FVxFmgMnXLMfWVZBTclxU06j/
         4hYQ0C48CVPFb8GwnzW4II5uGRUxuvaxSr4JT4kMyVtUhEloXcMp1WoVgYCSxP/08bjp
         HkikV7SJPn3DoNiyXTsdb7hYu44tn9kpqtImITVqdaNAcFVa3QTIq1hnftkFq9joul32
         56cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567236; x=1767172036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lrMZyOpw/ZRelpfuA7qROurtddaj0sg5lOXpksKz24E=;
        b=jminFie47Aj0xPdgD4rplqrz4eQeywJZbM0+Oawcjf21zXwIL2nR01el0yTbFdvQUf
         xIDhRywzd+b69XarwHnS1EIVzyRg+rxpwd16/sr7oeWB8jWm0aVUKyJPFiBUsNZDNiwI
         umhmwjIySsEB84nqHuItW/NusfbhZXS8HaVx9m3NM/mGz500aIGOFtwT5HDkm2bF3eFP
         E4iiFek2epz5ONHp0rb9niPpeglcz/cYPdsLXzgXSfsw2enFNINJDL/KzjSalC6FIQXf
         65MTepeIQtwVWGboroPQiARG85T2L6MCHxPhZAxRo0CEZiC9hljHur3O2+IN4NN+EnV3
         P86g==
X-Forwarded-Encrypted: i=1; AJvYcCXcbQUtp4hLRrybKDzx7r1hkJ2r2EVXYISPOBcROs4rueZWVQacEKHIk/s1zx5hrYlW2LMRlSA7XffsCFf89UiZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2zW4bZd7vHjZy7SoYbi9mZh+noLD5XYm6MVj/Mfl0VY/AKREB
	sSZCFIgQsSut+k9042mAd5FcX0Gc1cTgTcIOq9MCkdGWF02ISqtu0pH2+G0Qls154vV3fSeF//O
	T3DfWkIYJfBegxTl/rcv+0gHxsMB0ELL6WcgpvrLiYIMnpFn7dyzAA4GRAejpqA0qKTauPJnuFe
	Ln81zY97rkvA==
X-Gm-Gg: AY/fxX7kmtnoVQ+3yAEf7zTQzrCestmxkihUUIkumFYDaQUqDNS7Wwvg78PQsF9I3s9
	DjCtkCs+cx4Kev7Vau8it8YPIj3pizBVbHYxO5+pcXqsLBKAhHUQauN/pViOIYfB6WLenz48y8q
	/72UPMLAD6XVgR5HEdDAuQ2JI+1/oUuXfh+NSrYV4CcGLO2daNk3VXN/73R6Rh15i2AEBooZDor
	/HwZ3oV4B5HvWPkxf9C/k3EpLjpIHBR7uSCLFdh5gK1hKtzKsScNv1BnMZ6005xSlDMWs5tJAY+
	qrZHjimJj5bWerA0KwWiqQyAwWmtHB/Lr/bpeCpreAPYwW8zdv3QG6qwQce7A7Zl7YzKI9585zM
	Dp5oTJKa4bP1HAOginNlcBegihBr5Zp9xNu3w7hP3UR+h0TY4JUto4wQTko8NizL4JNSRszCi
X-Received: by 2002:a17:902:c40b:b0:295:7b89:cb8f with SMTP id d9443c01a7336-2a2f1f78d07mr184952125ad.0.1766567236198;
        Wed, 24 Dec 2025 01:07:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9Hm3W3DFtHwdujiHhNesaWsev04lu15VpbBPkpdmQV4QFHQ8NusHUQeuYpvBKkLyYCjutdg==
X-Received: by 2002:a17:902:c40b:b0:295:7b89:cb8f with SMTP id d9443c01a7336-2a2f1f78d07mr184951915ad.0.1766567235667;
        Wed, 24 Dec 2025 01:07:15 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:15 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:13 +0800
Subject: [PATCH v9 3/8] coresight: tmc: Introduce sysfs_read_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-3-886c4496fed4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567215; l=5450;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=adb+NstK0OrGdQHboby6lmZs7rWs2zBc775hVSg6Ay8=;
 b=VCt4oiunM/XKuGR5ta/0wbou/1Ac6C8/Ako/ofvneEGNiOTCJzogA5q3kT1UhQ6oYti6pYWxo
 ueKG62Fh/mUDwZNVX1f/tUbvKvhVSVDe3VbYOgM3/0XwxcQQJmxX+1E
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: yVIaI1gqAmAz4hRQD7u624o7agwcjjIl
X-Proofpoint-GUID: yVIaI1gqAmAz4hRQD7u624o7agwcjjIl
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694bad45 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=JzqEjpkVlBH90HjAhVoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfX4HB5ykMR++Bm
 RkKjkDqpYQk6Ojo0BiCKmOoz7czdiN5KuNCy/6eqh15c1eBd2jgnrYtscTNZM6MJb+vkVRvR/Hg
 /JSm9Gz+lB6usGIwZS7diqKlTN021W3riLEUD23jtyotnddpdSswhyr6cRxBAtMxgX0ASPXY6i/
 IZPnarnm0zkNC4p2v+PLoXuLY37xMoJUt8NKNYYLX+rqCFZ+CWpBKMb5HZnEmp2PyOD6rsLq7jn
 XQGq0GVoL10/meOwyEaPGvuwJS2J74EYAWTR48df61OwY9Twinj3BFR7dT/zdFTg6hGC77P3uwa
 DiXcWuoBB2PiCCBr+xP8P9CgC1+O1wNZNTCGWVwY0avMHeXeE+pNgf6xkvKlUDak5gOB+c9GIAZ
 YxyW5RhLhdsYIJD56+vLctA9it9PuFJAu8ergNgHJwxp/f+u2portM/bftzIJMfde8T3RHx3V74
 /2i/IOUSdbtJv7eHShQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_010718_786099_DC024B94 
X-CRM114-Status: GOOD (  18.79  )
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


