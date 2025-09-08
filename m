Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038C5CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 02:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciCcBoLZ6vDv+TtHrBJb+8BvkHMHrZMZRLwC/8eQ4dc=; b=kHeDSlXv6/bTZISYSUj6lZ+Yw+
	qVpG0BKQAH4SqOg8GpIBrAe5QlhmqCSKsprjoV4J2dWU8uBxTl+jd7UFvr4UgCxenw04PKq2kCdCC
	TDOtj2CDxtia2IfG3fSNDf8vouZa9GUAfmkevW2yKZeXvKu04tJC7Ev3CsCWfTGtOyrsnNhY2o6FY
	ZMu3PphtR8xaAeNO5kEwz+IZlIBSP9XPndQjFwzuevm3cUsuMjWnLVqJWGQfuo8Sg99iIacLYbgJJ
	UKxUd3duYyWBJWtHAX7chZibjlf+gRSZkjnD6niYYLt6WuacrFSM06cdByo27puQck6xT29wh2Z8M
	j5F6RjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRTz-0000000Dz69-2wHX;
	Mon, 08 Sep 2025 02:19:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRDZ-0000000DupQ-3LC4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 02:02:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587JhFU7008832
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Sep 2025 02:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ciCcBoLZ6vDv+TtHrBJb+8BvkHMHrZMZRLwC/8eQ4dc=; b=aBgy8uzSx3tVcJNz
	DI9U2ZFT+XRXXF4iVD6/Hp6EZ+xcmwfyXF5kaiFqIEufJgsbF2cMLFy7MVak8q23
	MXWOt4r8JZSJx8m44VAXRL1LJ8nM1bm7oVnVm4vGhjDMGJ+buX81owPSrH1fVw0Y
	atUapjEkiJJ9wi9VL9vj8S5NJnWxnyJLb4FoZXPomR7vPGCDehjZmB+nylttPypC
	yE2EmkYY7zwuEUCi/I9dyr999chNWXXtqnWD2lAloXpbImUeINR3Xr1enEtVnenf
	qsBlLFdQ4xahXG+aPT53OBdncC9t3tYgdsXwki6jfD9Y6RoKlEYoxBF85sc4BoYb
	ovFavA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d1vaxtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 02:02:52 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77250c660d3so3615197b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 19:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296971; x=1757901771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciCcBoLZ6vDv+TtHrBJb+8BvkHMHrZMZRLwC/8eQ4dc=;
        b=TKPc1GFKc2EFijRPiRGqr7BhPQYHGJ2UQPcTzuvpQ1et6csiugW15eqU5Ndq9nutWG
         nvY3OqDzLkPgEnnQWUDf6IGr6flkkzLuzQscUW0bCXpriNTw1KujEdFC+kD5yWJz5e85
         DKhmsn5VEm9XYk7d3ygoXRPyq724FZnN3Ycp7rTXlSa0CQAgPTfHkrayM3bubffcOlw3
         Ik1oO3JatH2Ef3sgyoQeY41beaeWuplI3l+gE4caDFL6NTpi2XKV6uEY20vHFWsmrsWc
         ZQRj00Vv+dxCFKtbldbwu/oeXdhqhsOafMs4vlML+uwsYJoHUI5FRFGZpGISPbMezKui
         bNNg==
X-Forwarded-Encrypted: i=1; AJvYcCUtwBCKF6QtMVH9wxqlJH3gtKs+7SXIGfjoSCaj3EyiI8wPsOZeLjC52JSErQ6mpjnBzK9tV7axV6bFaCMyR5AY@lists.infradead.org
X-Gm-Message-State: AOJu0YwlmYjWuxorTQ+cZzkArLwST/s1fm2O+zDHf5MSRta/9kYA9SZp
	OeTkV7pCTeT4EaaxZA14vaRm0y1cC614pgcP+fHLkvC5BNBXKfTcUrzn24dbbdCKXdGMNP5B7oL
	wHnQvFl7+fkvoEdRZDeMuitwoAVu4OuItx/E66MJa3rFZxwOJ3268ogILY7d9hP5scMYg5r6diQ
	ED+rOEZjB8Lpa5
X-Gm-Gg: ASbGncvbhFgu2jE+hGqgJz9xr+aLJCwcKTUAkr1N/E2RsJsMqkvKAcgjDjOiJ9r9s6T
	HjVjKOHeOcLPjwHoVVer4rlyEtVjoVSH6BDP9zFJiQJT8v3tZGeJ7WOFeQuS2B4ahgGLryTlPa9
	2QbT7nSaM9h5F8T5utVY4g3LjtxJrI1zqv8pTmjUcRv7Tu+viAze4jIW+P7BgVrODTAyJ9lBZJZ
	d+o10ydk2giSTTGRetq7QbiB2CumdK5/P+sMvqclRXDBMuzhskBt9R91pyted2Sfddxf2Y5QTRW
	qHAhGEmR8yt9FnO/a7VcnXCKy+aSUy6KozaMdypeFhLCkklxo47+YDpExSg2/Zu+ALKaDjzFPWn
	BMwvtQYzlqGCNVuZidkUdNjdiJjw=
X-Received: by 2002:a05:6a00:ccc:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-7742dd10e6emr7060000b3a.7.1757296971395;
        Sun, 07 Sep 2025 19:02:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF55dM66GjpWnblDpjAxuh8YqP1+Axkhg/f9PaksW/NF4gH/HYMDtmgowRZrezFrh3z+domAA==
X-Received: by 2002:a05:6a00:ccc:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-7742dd10e6emr7059949b3a.7.1757296970893;
        Sun, 07 Sep 2025 19:02:50 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:02:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:01:57 +0800
Subject: [PATCH v6 5/9] coresight: tmc: Introduce sysfs_read_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-5-1db9e621441a@oss.qualcomm.com>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296940; l=5438;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=efcn2pGR7DhIQb6j4jLLIyFVfTFZcmgjLIdsqmZwPTI=;
 b=niM3vIXOD0hUklEx1yhlcCSHtANh2U5WvJkHiZPqWcGrENm7iywUqgrqpS2QcO0taNH5+6GFd
 WPY3ofXERfZA+eN18PT1p2hc61C7JeySTZYf8Fp+/vVCENPPHOno4a1
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-ORIG-GUID: 6llnaKdTZdieU62nwiQvEWZMTbOPIwdC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNyBTYWx0ZWRfXxbuXPsbVB5LE
 D0tBSb/Wd9gTJqRYQhQHVyJG660ZvNdDBbrmIJjYXs2tSf4KuQKemVaTbncBc9BTnp6iGT4IWVI
 z/MhNfNl8uKy7Tc64FHhqI2L2g0d/bs8DoVHBSL0ZxKJD7k1LnjYSrkpSEAheaX7G64xUPOlVlv
 nJ6wq7ie/2rDH+waqC+a4tT8tqzHUvAiVxtBpkukBDjMDzPjVXHq1wmMzzW/kfvEDWlZqcSOrXA
 bp+OqV2KIGJJyn5f6pn/tSHe/COv5WLPD6592aDHIbbxawuT8cyv+YPfB9RVC71lnI+wtn2j1+Q
 +EiBshdk6WaHP6Xz+pr31h4FhOgWccFR7f53rTUQRNAeyykMXhI9aDRFsv/+X70U/7Fd3RT0oJX
 P3T/kZTe
X-Authority-Analysis: v=2.4 cv=cYXSrmDM c=1 sm=1 tr=0 ts=68be394c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=JzqEjpkVlBH90HjAhVoA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6llnaKdTZdieU62nwiQvEWZMTbOPIwdC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_190253_957309_440EE696 
X-CRM114-Status: GOOD (  18.96  )
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
 drivers/hwtracing/coresight/coresight-tmc.h      | 18 +++++++++
 2 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 4d249af93097..ccb177d953b9 100644
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
@@ -818,6 +811,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = &etb_devs;
+		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -831,6 +825,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->sysfs_ops = &tmc_etr_sysfs_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -839,6 +834,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->sysfs_ops = &tmc_etb_sysfs_read_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index ca0cba860d5f..0d0a547cb042 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -221,6 +221,9 @@ struct etr_buf_node {
 	struct list_head	node;
 };
 
+
+struct sysfs_read_ops;
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @pclk:	APB clock if present, otherwise NULL
@@ -257,6 +260,7 @@ struct etr_buf_node {
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
  * @reading_node: Available buffer for byte-cntr reading.
+ * @sysfs_ops:	Read operations for sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*pclk;
@@ -288,6 +292,20 @@ struct tmc_drvdata {
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


