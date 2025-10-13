Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BA4CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 05:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVzBF6Ar0+2rX1knV9DX+TZ1riCNKaKsEJNiIKG5MSU=; b=XN8ib4biFyXFxkeJc9hmQMMFFa
	REGNYa91XiBL+eFJc9ALpPyQQhXvoNUMIDlVyeoMd+V8BX6actzb6P+Kd8Bcgc6XjSr/Gyp3akyAh
	tlpij8AOjwjCxm+e5+R0xVHIYMBpvH3HsI0tI39IaZctXS8ySKYEpfeB2FkWtngBGD5pd6EcdzLOP
	prSfKv0h0vmHjNwoofhrUVC+CMlpvA/DX0E3QA/HJOdUVjmgROvEyUJMCAZe2Xhf0kVBJgKF/H5FA
	E2i97f0VbHqvVVmYQFmicKueZC2iKcvOHbj0xD3K8zOi5M2WTtHvvXJheEkC7WzQOLSNFyfmJuuRc
	HiItouvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRc-0000000CIF3-1YSA;
	Mon, 13 Oct 2025 05:50:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRa-0000000CIDR-20L1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 05:50:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nMB3001179
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVzBF6Ar0+2rX1knV9DX+TZ1riCNKaKsEJNiIKG5MSU=; b=FudBJkQSAwl/wDnm
	58ds7ByxZn8OPPko3o5b+1iUBeA0E6eM3WYST5Yvx8mIOf1gOOcB+wVVd6o2Vv3l
	ZnnX6P2CFO9jZI/RTXCfu9CEPZVW/B1VbUeFRqq0ECtVtQraWSl7vly6brmtmD1f
	xlA+FK0c/imSv30Pg8WPvnUrOYuytIwnwFvff3bwJz+qhNXXtBSeZf9IBumQelMI
	O/7hUYWzFUePIgnp6SrrsquJRyx5HCElOxab7eR3ar9FoTKNwCdycA0FIv/Xnc5a
	2xTw9F6cE1B6KqJFtdi0tszIAgZPVD9DQCzggtpdVSsQlX5b7xQFCyJGbygucehn
	ytkhmQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8ud4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:50:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78117b8e49fso13482718b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 22:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334601; x=1760939401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVzBF6Ar0+2rX1knV9DX+TZ1riCNKaKsEJNiIKG5MSU=;
        b=gXGBVtoCt2JbgxCfMdZ7TKnF4A/JqVXx+6e0cL9gOlP7x51EC91yPf6OfKoBQZdlnY
         OdZyComv9TtL+p/iIb/CEkUWELZLDX8+48DTVy00/FFIuu4NpoKbz1ZrHKatJT/A6/A/
         CQ/yQ/4UjGItXwqtxRBvlWloaJXQXyECgUI1nQUAQ2erZzjfieBQoZMk9/gNI/66tSa7
         loe0i+nx8vZQZBsZchw5IpEAvosV5q7Cf6Rg8D0hPbJ7C0J63ImrL5wuyHeEdr7OCbaj
         t9DpSz66Af3A1UzopVx84ntyP1DmwswCSD3eGjAb3cfYY8ns4xYuAozp5BjxZW2Owi4z
         G1mQ==
X-Forwarded-Encrypted: i=1; AJvYcCX80h5cw9WU4nvhnHqqMQdvb6O5VzSnjz/j7788wrWl5WNdkcUNozFUdn7rho9l7hx3bbMULI6uS//Zh/X2qYDK@lists.infradead.org
X-Gm-Message-State: AOJu0YwcAv1XAwWpzkmaiH4cA5FGGnnGmWAuIugg65KrkfmBn0/A0CpF
	oV+i+RGSqgD7zjfY/uCjQTahH2sJiZKl+e9JrQm8WURDV8+cxvt7quEaFEnqJsq9XaXdFwaQKHV
	wzJEACCldns6+k9uC0O2rP8H6d2X8b0OAt93DjuqNMQe1OjxkwOgHv2LUg8CDHM3OPjTWy3quZx
	T1Yw==
X-Gm-Gg: ASbGncusqZ0r2s1DFF+QnCnwArdwq0ESQswS9MPdl6uHHqUun+3CFCNZlS+z9rSo6fD
	7rFlOyZ09HAa1VnWzdS9TdrTAW+tCbdpQf5WCtjvel6khMlgi1NzdgB4pK0KwgLtAEA2CGnw9Ct
	Co0oO6U9GGArABlhsw9tyAa7A2lMK8wLxptQ3f77wtF9vdhNp6MiOsY8KvIuJSPLXn3S1dDbgi8
	oJLhwCY64d20Wa1hQbnG4tuLwz/E0/r8CiLFSYaVNYQV89ftDz7uItnSghWXEii6TQAqfxzWyqK
	3wMkWdHnOJ/ycBTDD7ymfHFTeFaZsjoCbY0AJaokhWd+DrupHfI4MZebchbwqQFfMz8Y7FlHP9L
	owN5AZKReRE2XjDmz/t1k4PE5+SQ=
X-Received: by 2002:a05:6a00:812:b0:782:7052:5167 with SMTP id d2e1a72fcca58-79384f489bfmr25812614b3a.6.1760334601159;
        Sun, 12 Oct 2025 22:50:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJDxyaJ/lCoewZqJvVh2+EOl9AS65FhW9zMTBtW2nGB1kAt+Ntqn1h+fXLZNVgi1sb6kaAdA==
X-Received: by 2002:a05:6a00:812:b0:782:7052:5167 with SMTP id d2e1a72fcca58-79384f489bfmr25812576b3a.6.1760334600586;
        Sun, 12 Oct 2025 22:50:00 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm10129898b3a.59.2025.10.12.22.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:50:00 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 13:49:14 +0800
Subject: [PATCH v7 5/9] coresight: tmc: Introduce sysfs_read_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-enable-byte-cntr-for-ctcu-v7-5-e1e8f41e15dd@oss.qualcomm.com>
References: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
In-Reply-To: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760334567; l=5450;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=2Iksx+VJAK0grFXWR1r4tkJcs3L8pubLtGYi36R5wuQ=;
 b=/R5hHHMNv2s+Bx+KBB8uomQ5ZGC09cN8H2/9SCkH/PS84kQ6gyC65LsXJcpVoamk6i1CqdmYi
 SggNpq745MpAUHKXfMdH+YtF2yPOU/EjezFYRz6rAwaNRHaCA3IJEM3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: HH1IChqddwfh_Cr_r5xd_lNnDX5LkhI2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX5S8kpBLGsAko
 d6O15lLcnNTScnOSyAFsRGKZPeVWVgk290i0O8DyKWnRpvKIzJnchiKmdPKaIYnfUatNvSN0m5q
 kso2GSlHrINRDGF8K/wws7MYhzE6EXYhGmw8qfbIa7TMVX1LTZB4tPb8kxURLj85fjs3vsqn37n
 4BajQgzhpMH0WQJyGTRJyX/sFWY+sNNJTiiOoF/ppqzjXw7iy3bp6u6Cbfs1lnHQgEVCPtiKR8E
 hEIIT8DSk5R2DnDCXNxYPwPDodF0ExA0z6ndPm+zrZBUyWW2n4XGAntasNbfS80Jc/JLiljonVk
 ErEjoVJ77DPdpuIhaGSPmnhGQ/6cu9LMByfj1YbuW6f7C34KfYGX+1gTqlQeK52Pf4H679Zrj9k
 wZfmVmzm07n8JDcDeoHvl4k7l89WOw==
X-Proofpoint-GUID: HH1IChqddwfh_Cr_r5xd_lNnDX5LkhI2
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ec930a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=JzqEjpkVlBH90HjAhVoA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_225002_530683_BDEE81FB 
X-CRM114-Status: GOOD (  19.32  )
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
index 4bfb3db44482..0f6c315d7509 100644
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


