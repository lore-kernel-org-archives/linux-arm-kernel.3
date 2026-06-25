Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40FFCDE009
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=; b=sYhbXzQuk2afNU3gOo9q2roigf
	IYgLZfv9u5ybkFMsKmYEM+UpQph//8ge238NqYLU3dVYB/QBE0kn8KTSRNpwwhR1Oc81KAF5BiB+N
	uwPTJgzu+BLuwVIYVSisliiUxh9gpzeK7OzZ0ppPI4GwgCiLWbbZh6hgeWBq89QC0leVwCH54J7HV
	NvarMLg/4jfVtMhh7QdyC1dk3lhALIAsrxRpNpgYoKT/fGhmdCaM9qvn2GG1J+7znucOaEH+yizOw
	qEFW2g2arZmVEUYgFdBbEHaR8K4G9vZmdHGx83S17QizRDqy0d3PMYTjIRMRJdsHfl5eFgaM0fYWH
	0XD+/XEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchbV-0000000915g-3mXn;
	Thu, 25 Jun 2026 10:46:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wchbT-0000000913c-3Mai
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 10:46:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jxuR1920449
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 10:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=; b=IAWvewx+UfFggX59
	QOup+8YviA4zd/pUe1HoM5Fhuq/KDSaOgDuQK3BbyKjQINnZD5SkKQt7DcZkf3CW
	DpzjOVpK7H/JK8Dhz5haHq62lXo5C1uJs17KOZVkjYqgJ18MJx54o2GI94IDLRW8
	9L4XU2YPW8E7F0znMLhZ832Y6QAs44OmKjmLBx+Cl1tLSgMLDaUMMX6nkXMNZNWl
	iTT7I2GyBFvSX0Nk0sgWxN1F1G/XpiNPV6Q95Zmf57cV2jaoEZMZrylR1NNvuS7C
	WpCsijJYDgtgPk60aB1T/dt8PA7/hnOHH7EZCwqGn6um8U6Bq1c/JPCqwFJbVTX1
	LGv4jA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ueu9t6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 10:46:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c8018f11fbso3133745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 03:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782384398; x=1782989198; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
        b=GIzwN55Y/H1gRchh3KA5KBa5IS34RzK9ZtpUga7YfRwhFfvmCKg/cyI8Q0uRxg/fbl
         xQqKnSXRPUjcKUUK+KVpgXYeEWejr4485DsqQls+C76957+HunA0Adm9RNjDUSrNFui6
         Kbv2PjBqpQwCrFTukN/UpNMHpgJthtY0RomWUP46S9qrRW/TwIuA1eCmQFPyy5GAlE9C
         Yc4iqO2okpptWbzwkfzYKzgP2fJXpO7JY9ZLh+PjJwOS2zwjyC8970JBtr2z+9M1vTnX
         wd9afXPbzNGrD/JaEokePADA7kTa359rOtoS2i9+tgLRidYtfG7Gvu40flNAmUAt9vxO
         UQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782384398; x=1782989198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4m/o41K5fL/YEM2+crvUsuSSJz0c2LF9MIABocLHis=;
        b=hiV3owliHxa3CAxqnXNF7OakCS5JGBSoAE8w7MW1a3Tm20ktJuVtcLS7ZTRE2pcDOp
         9mzw274sv4NR+d97NCTb+3kyk2ZXqIPda7dQLCMQoAsEDj+RlzSG8+oeajPHQrwfiMyw
         RQ+/CM3C+UyMIQi9UdxRSkaYPAfgWm6PoTRw9DBnQ7bgVsO0oDPdWtLShIjjSDQB4zCA
         6YZPklaPLMau8kLq2pZ0cq92rB16w7KIwOAzbpmgaJHg7QMkWM5TtahQInBKaMHu51TD
         9+eytYF+NlO8d5QJc7N1jQ6nMvaNfdq+C7XwFH/GNt22ClAku0kvjFlwenwJfBu4+ILU
         ChSA==
X-Forwarded-Encrypted: i=1; AHgh+RoSEnpE5yEo2VpvyKrq+ZBN04UZGZG/AZptuoOC4vew0QgUO6jBG9+jabiXaXszSnuz09X6bFZ27++rrWiygDE/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8KxJYZP2C81tX2MwRXxeNqa5oAda8boM1B6WR+BjhgHiNnnjh
	nRbO7gE+ejfgvqgD5DVZzoINPiEgzGbVmMt8D0JWbzSucoDP70iDfpj6tmE3zUyX5t92zIrpMxx
	XJBEpCfKhpvObAlzMb/G8q3BwvHegBKC4hb5nITi2xAmxBYSQPea6onyUuXNzew+Me5ZEYidqyE
	w5PA==
X-Gm-Gg: AfdE7cmMwsTVfmZ6WV051xWThSUPkRb6lbpF49RNUpshNrmHACa2feKo4eKdZaLvSji
	9B28yYctyNSmk3MCYsHQmE286Ehs3/qNahm/CPOF8E0PAi12NaFJAWPZMtAl8szKKvfQ3di0EVe
	+uI+p0f7Km3oD/w7NBuMLn81d16OCvswx1bobre/PKVE+5GR34rSY/L5FXeAkxaL1fcfsQdVLVP
	OpS0iPXyMcXNNwtkTP779iOdzZVclgDRmiIoBUyXsLnuiZBTVtJYrl4V3546GZ9WlhY9HxPd6NZ
	cahKA26AuMCiZtTXChrkb2p4N+vKKichhE31EfV3e/UOro9YttBB3Y8wPBHag6xHwJyIe2pLlGn
	onEJXWSpDYcvLQNjf1NTlmmXlwTb4Nt5AYkVTjfCqmhvFeiJZatiHDF9dDr5HpHPQJJqbo4eu/g
	==
X-Received: by 2002:a17:902:ffcb:b0:2c2:245a:3360 with SMTP id d9443c01a7336-2c7fc75a023mr22142985ad.6.1782384397658;
        Thu, 25 Jun 2026 03:46:37 -0700 (PDT)
X-Received: by 2002:a17:902:ffcb:b0:2c2:245a:3360 with SMTP id d9443c01a7336-2c7fc75a023mr22142505ad.6.1782384397066;
        Thu, 25 Jun 2026 03:46:37 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d58e9sm17114035ad.60.2026.06.25.03.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:46:36 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 18:45:53 +0800
Subject: [PATCH v19 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-enable-byte-cntr-for-ctcu-v19-3-8fbbf22e8381@oss.qualcomm.com>
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
In-Reply-To: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782384372; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tijaxrXD7Cb53GGSRhRGBOVQmb2AQTa3/Hi3VM9v7z0=;
 b=mAH0BMPCvVpUPe3fys7XXrZMV0kBBjHQcALCqQixnnQY8J3MudGkw+q7Jh1fOiIi8sQK8Cp9/
 AMvYYPUBqEUAsYKHF9x4A/F4a7D8MfQQEHmUBcguH4mjbIrcBpdaSPI
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: UcVro8qmQT5SrNs3a5Qi7gfV_0-anS-x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfXyPYVEZmdQumU
 Bqewz8EAcK1NR3UqVZHeh80Oh041RikPkp+qjn0BwCqM5ZNMkxI6mAPTU1EC2TsXVgsO1eZcfne
 h5MPdh9YECLjgiD6TA/B8rZBIuQ/wis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5MiBTYWx0ZWRfX6KlUJfnit8fI
 Ps/7hV86XUYiqrpvdFhyXVuZD+WJxPT2cNRcOjMX45bnpPvSvInr2Q1zOyQAH20g252HzTUtCEN
 KVnnwpb5ZxsUiEf21oDL/KMDnVLBHPCUHhiTHfSJsgEsGvgiVVAv/vG+TyKCtCOpZ4xhRMpb7fW
 WSvqlQ+yOKOXHWJiDQjXuYTtVymmBZbcNsy0nfJYnnEnWXiunHpCQ2sJGOJf9ICe8lhCymAm6Cx
 WiGXhm7VzteVHkzqUFx7AKRJdCaQ2IKKwaBg7afDUWkyb/qgKCNvGj31xEPOf973V84IsU6idDN
 6LZiLwPPYPIewFimB/Thta6dq62pnTI6Mk9HKIFIsgre0oGa1loC+sNK+k4q5kdpdLfc14iZaOA
 ENy1mBx59V0w5NB4tv7RySDMw9014a1IycwMDMiP2ExYS6ov1ME8ws7ceMUzog2KO64M6g/xPkA
 rCv+PQqRNgiohHNLdKQ==
X-Authority-Analysis: v=2.4 cv=b/SCJNGx c=1 sm=1 tr=0 ts=6a3d070e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UcVro8qmQT5SrNs3a5Qi7gfV_0-anS-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_034640_005939_E13D4092 
X-CRM114-Status: GOOD (  17.78  )
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
index bc7dd676da47..4b40b692be4d 100644
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


