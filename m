Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD03CCA0EDA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoeGXn7mj0xvk3qJvFMf762jOqVA+60Yk/pH1LCpYf8=; b=vZ/PY4H6pVrQDMgVMUxCLHQGVb
	eA6no4lOtuobdPK/0w9UfJEMSmob4Yk4FhfDrVjjBkW21sM/9vGtLzNHsrCeazGssbODX71IYgXCr
	a+vqphAlOKN/lNvLoB17JKzMn2Bb+r254bmNebOtVmXTqW8Blcw3Lj+xhgOdMf5SNDh6fbY5mEgK9
	/+iFoRBCDQJ2ZWGbbK6OPelRlNx2qP7/MxCi7BCASUlfXJmw7f/UEfizHsEfHyr3y6imSeiw1GTlb
	PUDWMUQh2kBgmU+A3wpaWY739J3+tAlqK54TsgzXLC9FRqKY1mDQOEk18H/OvXcBqrCu3sajp9oDt
	XWgjsecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloH7-0000000Aku5-0B5L;
	Tue, 12 Aug 2025 12:38:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkWF-0000000AGTd-0dBm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:38:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5g3ea018332
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QoeGXn7mj0x
	vk3qJvFMf762jOqVA+60Yk/pH1LCpYf8=; b=DiRcSEIu5ZeVNAdfJ9HHI2UerKH
	cSazn6xFCA9NF0XLgr9RRTL6uzxLFS3YWYC+1FtZ6qLYG9VQ0T3nQ9AM7BtHYLoh
	Jlvs6gZ4QkAekdwkX8QMCWIi6LLRDs8PQmgYgYyscOIa5imMbDysuvk7HELCJg4i
	CFaD4NhrOY4UkfAeVuqZBDw1OaR6ieWvjOjIKGDFYtbLMo3kFUK6x6loIMLYPXaJ
	m1SIGzlhSwPyDIKBSEP/hDtIUlyYQdQ7x78PhGg+4z9N2I9DVquK+8BDBgVxQB0Y
	HS0x3omCUhcKJTpX3iFhd4Hrntt1KlO97PZAF+dvlUdPcYjsADQ5r6tpA8A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g7cp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:38:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b38d8ee46a5so5071480a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987886; x=1755592686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoeGXn7mj0xvk3qJvFMf762jOqVA+60Yk/pH1LCpYf8=;
        b=FlqkZuNWW5zL6ubTbO02jLt8gIzDDRHC/Zpl+Xz0lI5i25dT4WlNsmQppSkR2cxrYE
         NpIldwon06QYWbJ9WRIpMHdCwJwQBYUhTKT/TCSSPquKr63febJy49vrOctKI2nN/gZT
         LXPXZ4JjlVL5I/WiNQlQqeIJamZYfejTsP5jQqYwOl2mn6TK0uqbxWKeuyF6kqKVu8EH
         X0G7CO5Je7gt7IUxRfSsRlAdfD1Y+KwN4FNAsJw8yB8vnj4kLmCmrTmHywU55fd6xklC
         YYy4Hj1h5flf+cxn7/UPJkbeqtBLW0cIp/k/XatltxqoNI2so7ok8CEYETg3K3jTJhak
         HStg==
X-Forwarded-Encrypted: i=1; AJvYcCWm9vzfpDwV86myRx8UWVLzqVuEn9IzufZ8XEO2GIcJzIYPKVTjAOlmpgrDIUjmJl5jzYrAglMwDWy1ACmrD8KY@lists.infradead.org
X-Gm-Message-State: AOJu0YyQgu5ApNViUFMQbpEVknjiRNk9bgBPZdTGDx5sp9r4mQ1VcvP5
	BsjUbmxiilfZjyY19ojVf98zLnViLpiQN03m9lLENJIeyAse6lt+Oc1SQclVUJW/sSKeqymhHsr
	5DWlyLt/mG6WJDE3TuBgTA5ZKgAvtAf0ED0D2o4A4FFdw3/2JGwDs4fGSwsgp7Zre8IiCrveCK/
	qNbg==
X-Gm-Gg: ASbGnctPA2UdbdDS+951THD8rW3n4n75NPPCZV+3oWB+yCozoAAnFdzN2KO5wDmFpZn
	Ncub1V9c5r1tb1iToYf339NtoNo6ZQq3gDCODu82YWDskHIfUK401dpDCr5GkIZK8leWP6wzK6b
	7lfrDRNuXVSpvjxFZl7jOXvwnrCMVVEsc7oCt5cVpi2tl19mqtc0j+E6uGHPuQVZoOdQkOhiimF
	kUP5HboxiquwfpIlzPi/YfCOZ/5uAusxHGdZJByPpzBIUXkHphFnii7LmiOvG1//3TCm5+qO5xr
	8qzcXYAW9z8B+y3uBGxSLuTngaZx/hrLhm6tmQroXuh94MCuy8WMGvG64cvXu/XUk5DU9FSaw9w
	DXrWGXzeesx7xbHckkMk=
X-Received: by 2002:a17:902:cec1:b0:23f:f39b:eae4 with SMTP id d9443c01a7336-242fc32a4b4mr39002645ad.9.1754987885738;
        Tue, 12 Aug 2025 01:38:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET9VO5P4ZRdMO2sMpbOqfeJjlpt9JwuEh8ou9XqceDwgQAmb4qLnq4jupgSMl0CJgtynW4yg==
X-Received: by 2002:a17:902:cec1:b0:23f:f39b:eae4 with SMTP id d9443c01a7336-242fc32a4b4mr39002355ad.9.1754987885263;
        Tue, 12 Aug 2025 01:38:05 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:38:04 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 5/9] coresight: tmc: Introduce sysfs_read_ops to wrap sysfs read operations
Date: Tue, 12 Aug 2025 16:37:27 +0800
Message-Id: <20250812083731.549-6-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689afd6e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1hiE41pZ4Zj50arX-_gA:9
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX1VKAC6usEmYr
 Ms8hC/QhL69aimNezwX1m07POOXzCjh1SK1dd6ePz4fBnRa9mGC3EYBmEdpd6T0lNtbDESbCOpm
 vdJn0iHCJmDU5E0OpI+arM5aNwuxWMkv+YoBDIGaeY3pr8HljK4gfyvIBS/0l7ETRh9hDSmB571
 vd+Juh2Lo0wF4xKkz+ON3yGuI4sjZztOMlQFLg95+Gl+ZdYauJHzyb8MW6ekzEvRIMYI9jhPiHH
 SYfJL/ZVEYFnY1vX/AHnlGkBneO+SN3d7TmoeIwEXp2LukR9xQfMBARV7p0iodsEbWufE/kbbEs
 uIfLXYOS6W1YABqNZsZLYOdzOFQ7PDQoW2hWcILeHL4RrulSJhkY65i5VRkmDx9YKoQtxRyYdT0
 SIlkgdF4
X-Proofpoint-GUID: ULFlBLsyBrnMesCUoLJ8atkl9-VeZlUQ
X-Proofpoint-ORIG-GUID: ULFlBLsyBrnMesCUoLJ8atkl9-VeZlUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_013807_195361_E29758DB 
X-CRM114-Status: GOOD (  18.70  )
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
 .../hwtracing/coresight/coresight-tmc-core.c  | 50 +++++++++----------
 drivers/hwtracing/coresight/coresight-tmc.h   | 18 +++++++
 2 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 4d249af93097..23c8e903a474 100644
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
+	if (drvdata->read_ops)
+		ret = drvdata->read_ops->read_prepare(drvdata);
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
+	if (drvdata->read_ops)
+		ret = drvdata->read_ops->read_unprepare(drvdata);
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
+	if (drvdata->read_ops)
+		return drvdata->read_ops->get_trace_data(drvdata, pos, len, bufpp);
 
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
+		drvdata->read_ops = &tmc_etb_sysfs_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -831,6 +825,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
+		drvdata->read_ops = &tmc_etr_sysfs_read_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
@@ -839,6 +834,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = &etf_devs;
+		drvdata->read_ops = &tmc_etb_sysfs_read_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index ca0cba860d5f..cf1b4e8ba80f 100644
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
+ * @tmc_read_ops: Read operations for TMC device.
  */
 struct tmc_drvdata {
 	struct clk		*pclk;
@@ -288,6 +292,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
 	struct etr_buf_node     *reading_node;
+	const struct sysfs_read_ops	*read_ops;
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


