Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EE7C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 07:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=; b=27GJ/wAKqQ9geKwW7wcbbiOevQ
	DAnfmRcDwbqD2QntpuiAziroEe5WJocRIlSEsmdgb1rILnZ9KnHjR1OBVUCjVDAjF9EVKl6TFfynO
	ykMnQmncFOqwaDtF8wwjz9I7FAUJJ49rUA7EKYNFjTPGCI6DrffLVz6pskUV5nfYn52PBclDN/Qsf
	BjrGfxkeEAKYSr/4awvxSydLU60iVXb3/btX8Ub+QVih3efZxzCVqRazaA0gCu5nfeN80acYhh4pV
	uHwC+kqXxQP1u9iADKKIEObm0J3p6GLfrIFZ6tJLjeqVv/vwoD7GjoSXGErQ9YnY2g7CQP9RcYMYE
	qGj3olMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHLB-0000000C379-1eKn;
	Mon, 26 Jan 2026 07:48:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHL8-0000000C363-1VhO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 07:48:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q7Rofj193629
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=; b=n9e7xKdyqtsIO5rG
	F4lPB2ij4lSriSmuqoaPJzSerq7syILRisxT3UKxfXDEzC5afCP789G/fSDqFNNp
	gTdJBgXF1wRI9Pnr+UTUEPka+sceJqVShAzl3JzdAswghULQuH//3hdIkI2E0Nf7
	5w2wVqhdWYKwcStLfTLtjEQQPNA22H0fnYcUelOmYq8s8e5M465hYafXbdA1/Vh1
	m8x8f1mtRs1Ecna9+wv/dCLmNQOX8+uSI8Z8gXwY+PvC7BbDoLsr3YQcTnVIg36x
	piUO+cBvP+gcOewQ5EeDYg1QLkoicKhsQF50NK00TT3RSG254QsjXsojsZ0jMhn3
	iERnmA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f3s31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:48:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f3f3af760so7538260b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 23:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413729; x=1770018529; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=;
        b=YxH+2X8fEBZYkchLMKVotS/e4LkcoRprVoCEZNnivyuGW5t0qRKVG7HyyFhWRHHYzT
         +UWI7C/5dvthSCnZjBPMfFlOtEIkhN8BAHISgGTGG7+uOsV+KvHc6MPlX8MbCOE8xggw
         PVFUbaD5d+O/hA4KviZ09eV/eK4nPUeuu+suK3ai7E7zY9i7KXWSTc8MOLarry4ih5uP
         UH89fHqljvFZtHvuhpSWFzBBWO0KUULQinNTNTB4H7zc9XCJjZq89FZd6UoUxQdFGtdA
         wjte/l75BbId8HS3RZEaBJxt8AyI6xj+6LNRWFeJptxwg6HxKOufWfZEWLe8UzxtLBvi
         8Qsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413729; x=1770018529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51VyzH5MVWt5pCU+WtqPfgt9gr9jXVE/0KTTZNnKYmU=;
        b=l2/0w+4ktcxOk/9uwAclG8/HzQyzYI0HrfOzMCRBU2M67s2iVzvKtjybEAumk6dxW7
         MU8RZQ/xzw2VubQezwsp+9H3q7xjTFgNy3BudE/1rsH5dLHBL1w4ekc00qQRgZ7nBEQ9
         ePZvfC9U2YcRtNlj5NhysEo52nBarpzAk7Al9MrERLLRzd5DFTStGybJ7d2EuSXu+zCu
         71VD+2nJIVT3EqLtbdIzvMIBTAYgjXA9TqD+n9390GVyP/YYLneioXcdKEvLqQtimJuk
         2BEaRahpMJTXeAC4Jzae/NKBS4mxaPaLmKzpMmjhu1f2EoY5VHTGx6kAgVpx4tSNszU2
         8iIA==
X-Forwarded-Encrypted: i=1; AJvYcCWeDi6vNdrpyoeYzfhUy5C1/yk2J+Koq6xgVeUfpFBkznYrTADV96Wu+7tybkkwrvHMtFdCfUkGzJLaV6f7zlHH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe5jxzthJO8NTAk38irdXs8psp/k0RkL07DqQzFL88quwK0a7N
	dRy7R0kAQewu/jkp7y/lqt5V/E/3/2d0/ZvjSLcW4Qv8OeXZtOy+vExS6slA0jChgBUEXZFZ67m
	ZkrIkB7BP+dycywtsjQG6rvG0KZDfEZfqFH9JFgLujLZcHeC9zBgpemdWvHxvxU9W3oY0dRs7aO
	C7bQ==
X-Gm-Gg: AZuq6aITe25cdyWSN/pGCD6znQw8k+8v/h3Fgkcm/FO/wnwuSpvA60Km8s0p4eSVfRB
	kWqtunDkXF+Joj/qFyWkVTihxYJj4TSjvAQpxw2Wsy3rOLp6fg2I4uLD4/KtL+ivZt8hFPcAZSF
	1BwZInif2RHRumulCszG7M3iRmBJUIaHIO1axCB3h4tdluewkfGrxA02HsU5rNGP9i5/ZeJOor9
	4fhU+c6OqeEGgo3/cpzIPyjVy9no/EK+OknN4BlpEJQHTJmVMBUel5Ev0sPAPqwhmIgNdelN/fY
	yLdkW7ifoUMuTBHeq4keen0t6HtqSwF0OCVsin28diPQgyyjswzFdufzpLjbc3fnm0i61htDb9C
	CENL+XotSBsqiR3yAUScEGggB8UM7/5q5Zpr5RRevlV8kzcqjfcu14nEaj2lRyy2EOs0tERmIU+
	Z3
X-Received: by 2002:a05:6a00:9284:b0:81f:de60:39b0 with SMTP id d2e1a72fcca58-823411da07dmr2830794b3a.13.1769413729088;
        Sun, 25 Jan 2026 23:48:49 -0800 (PST)
X-Received: by 2002:a05:6a00:9284:b0:81f:de60:39b0 with SMTP id d2e1a72fcca58-823411da07dmr2830765b3a.13.1769413728607;
        Sun, 25 Jan 2026 23:48:48 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:48:48 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:47:55 +0800
Subject: [PATCH v11 3/8] coresight: tmc: Introduce tmc_sysfs_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-3-c0af66ba15cf@oss.qualcomm.com>
References: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
In-Reply-To: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.org>,
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413705; l=5212;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=CwCT5/x9boKhb1Ajkz+foUdUOzmm0/q81QDotkFpGzA=;
 b=Cl4fdo7nxRQLBIImPb2gA1ya8QZK0sZl7WyCD5lomXVdSWJdGJRffVnzjr6VcolRhx6x5UUn2
 FRFHQSMSYPKBcaC84Macjr8SUm23SdXP0xXOEqDLRd0hp/VoYoJ9J3W
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=69771c61 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TI87pWInq51I1XRk9Vl6RVdBk_vl9CUQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfX74e6zkudVjcA
 uVJfNfy7w5EoYr36PRuJJvwB570+d4eYlgeQ0I5rptFPuhoa60UXmnhlB9J0aqIzjs5D3cBPcd4
 2dPL0QAHGmnptbQseVVAXXK86+TgR+shSvNlY2hnCw+QnI3ZExOQEQ5zA+2YcArbca4SASqeu4V
 c32ZFCkweY2/wXdH9gDOn29+ss0sdh7w3+TAPlSacccbb7rZyE2IPvC17rxTf7XKkVE+angi6yw
 YuakBlKGDTcQklCiHrNj90xeit802MvpFQr2o4BBs6Eq61n825fvCp5zaUc/+JZPwcdNsZX5Zud
 OL3/Us0T8kibX8H2jGTor2vOepmn9A/6NQ8fOjPgtoOPIXQ6FUIno5tt5xzvScBNP/jGvb9taKz
 xoBXJjLtKl4tyo/5JsovzHrC6X/NbPWj4RIsqd93vR/7Xfqncr2NtOOWuit3/OZdga/5n2HM2lj
 IePKcjl6J7n1bqNyIPw==
X-Proofpoint-ORIG-GUID: TI87pWInq51I1XRk9Vl6RVdBk_vl9CUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_234850_430479_40CDB71D 
X-CRM114-Status: GOOD (  17.60  )
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

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations, for reading
trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 1ea255ffa67c..32ca2ec994de 100644
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
@@ -291,15 +277,7 @@ static int tmc_open(struct inode *inode, struct file *file)
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
@@ -769,6 +747,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
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
@@ -828,6 +818,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = &etb_devs;
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -841,6 +832,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -849,6 +841,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 9b3c4e6f0a5e..c780f6d5dede 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -258,6 +258,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer_node for byte-cntr reading.
+ * @sysfs_ops:	Read operations for sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node     *reading_node;
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


