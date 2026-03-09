Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED651EFCD73
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lTbduWn2JF6hflXdfZAESir+Ygdnj8CJ5d+aQvJmBQ=; b=A0fvYwXrtvq0A9Epb74Q+zQp+M
	bm3C0KObIfKm+yAEcTfdpBZFFjxZNXrDvOjy+39dHx5rLfHnR3eNpLHdB3iM2YILKmcqKCN6X/nOJ
	XqWf+ja0EHh/eOR+YiPlW6EzyQCbuxfXQnt0uge7rDh8v0KqSTAPDKZmM/IVWSZFcdYBO/QkIpU3P
	tMqMaMhmFCcSUd0mKrTWX7f05jrPp1LEtHftExvv4H9YQbSCF8dF4RLGvWksAyb5xPyeaLFuLlW6o
	UotUj2b3Tdvu33roE712RPEue9rZ8vrVtII37keLwOQxdnBZ78FgwhbPb73CfkCk5EaUHmhLZC6sA
	ClcW+60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXDx-000000070xe-3F3j;
	Mon, 09 Mar 2026 09:48:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXDw-000000070wR-0jUL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:48:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62989mA62660352
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 09:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lTbduWn2JF6hflXdfZAESir+Ygdnj8CJ5d+aQvJmBQ=; b=biTdSM1m4se71qQ0
	hxdNSuTApqld7yrnRvd4vLWTmunTo5HTJtjxq/as1tzfoO7TVigOzuJCymH9iL1+
	Xvxc8gJcvyDHHzBH4G5c470xx0KLetraxqWSO4mV3V/ZYsWDe5/ckQ3VmdS58XL/
	Xr/j8afTcrY61ue6/HpcIXyy3f4Ih7sHnnBNa5LBg2g8UvISSy3QyPs8h9SFv449
	u62vMd1JCy+GUGyfvOXr0pVYzP+6WMXPR+L+yrNwkebHJU66QrQt1fgWPCRj/5Lk
	09JPgPF6WG29FM3sHJcLeO55KE35rTc/bl4/Z3ql4rDC1DPz3u7VFyo76H+J5dtd
	qfQuKQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpn4mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:48:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae5031c6c5so385719005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049706; x=1773654506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lTbduWn2JF6hflXdfZAESir+Ygdnj8CJ5d+aQvJmBQ=;
        b=BnqEIYvc2IG8OwtliKVH/mwS3M0BkDIZMEmeHmkIlSoEWJJLrKuSwBYuLINioL7knT
         DNsXyI70nETEtpJwScloomwg/u/yotyMFH0/4tNdqggnDcvSQ+O5q6uM8FGbo0BlcjvA
         Ed4byTV9E1ReGKVxEp8GLNaqTTN/u8vkIPLR+wL1a44+R+UwyzegrOlbWYVvOiUmpi4D
         7oCbO2BsmbBxO+/zJUWPrRTZoVJmsjbjDmOPkvEUybtc4fypGVo/JWaiNZefocWRUcNJ
         0ezHbmAcLBBOx8kCBeH+aP9UGIdr/spJqP5DSMUMbpDCepkedXnbCSR29d55kpyxNW2y
         dHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049706; x=1773654506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/lTbduWn2JF6hflXdfZAESir+Ygdnj8CJ5d+aQvJmBQ=;
        b=rVsU4FrTEtD0XZOWCuzytukiv5yXHBgUMN+on/FpXpEK4+rpnr3HEPOEuEp5hjG+N6
         UWi8kIxPsKLl8OlKnSapiHqA34lMr7whq4+U3PBNjsEyD/UvWOyD6zVVrfYOV7FfuR3+
         uVnwd7pPHxBt8GztEHKEOKsHK5k5LZFxKyVr1TMp5uVmGR0bQ5XoQ9rncly0aaBWH7V/
         BnSF8vnjXqDaZT2POgBiN257u3+TNCzu8PWJR2aAOUbXNIndnLqlij+bOZ01aFYChKUi
         fqoprDPthV+BzfzN5RERnTmdmpsOfz81h4BDsGHvwe2OauhpTp5jnZ5WqeBvgUdhl6/S
         UIJg==
X-Forwarded-Encrypted: i=1; AJvYcCV+9IgRK8XM7VP5jgfZ+oskLo0C1ypB1T5Lu6jOEFHi11Cf4nih3oE0oHQJ3GauVMSaZGe4NDWYhmlrpZ2qrCEH@lists.infradead.org
X-Gm-Message-State: AOJu0YwwTFfj4ETt54nnITM5ewXyG3lCi2rb9xVTmTzXpZCRAGcoPDIW
	cLObHx9E5LR85XWnMm9F2Iu9+k7EsrHIVmQNKrTQZT3jxOT8B4TCaawfCgzxrlG0c+bk/P6QDdy
	AWUjZewYFEjj59NcvTIRbtmzkMPXOGaS3a824vPnEHTAVucTbrWdHvNjlCa43kKbLzvPG9KquTU
	ou2w==
X-Gm-Gg: ATEYQzw1outP9qlcaCSaJANahiQ2JKUDhPoMI5KU1SlyqoEVXYraFpL8Avc1YHtmQMC
	G6q0N8RZU+WLEJUKEx+swHdfVqJ812ufNdtB+ifmkmMI5r3x0I0UDi7t2S6Ja1qE0TJvpbEW1g9
	3e+2afq1fDkfgO7NrctsvjTK8uSeUUiV4CMi9ODxHkn+RlNJzX9U76/xO+L2af5gmMIs6UXCz8T
	gRVJisEQ6xk+2FfXn7OySq2boTJlKnmuFbyuexfLl7O5OBHPwUkaY1pMGeHFcuiieBIi+AL8La8
	diKHy64/v7yVshbWLj/0Vurkl4Aa9nAywX/ZOtgqDUuxcyG2Jcxs+p2uZmzyY6PVGVOW45+sSmT
	gKLlWXQF1LC94ObbiwCX/osBmrayq647tcaP5p4HNCJQIrYGSjgjtFuonNSwROX1dZ4uY6u45tE
	m4qxi1mJKE
X-Received: by 2002:a17:903:40cf:b0:2a9:5db8:d651 with SMTP id d9443c01a7336-2ae823b349dmr103277355ad.25.1773049705967;
        Mon, 09 Mar 2026 02:48:25 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2a9:5db8:d651 with SMTP id d9443c01a7336-2ae823b349dmr103277085ad.25.1773049705400;
        Mon, 09 Mar 2026 02:48:25 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:25 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 17:47:42 +0800
Subject: [PATCH v14 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-3-c08823e5a8e6@oss.qualcomm.com>
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
In-Reply-To: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049687; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=QrDgnVgN9QaZlb9Pjj5rr7RirVn5w3K3JbRC4UnCJSw=;
 b=yxl9m8Ty4i26yQ6UJTJPydSgQqLp+CGWhP1ClwC6hg5uLbQ/+Vgjx+t+odguyBG2oDLHYXcn3
 h7WKUo6vdHHBOc1Ah7ir+FojeGznSGL9aQnqEDrOwUW69m2LqA6SV9e
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfXwl7qx9mq7wbJ
 QtGsI19ZExMmwBQlUSc4yczOGvWrq4YBrRs/8TWMS01Ukec5nNk9YfWbwhWMC4fu+Qhr6LkO3N3
 5FlV1t5ELSgzYuZrxItNDVywRa/gaWDtKBEUCEJpn2o0entf2VlH6Ivsrg+VRps2Bx5bY24qqa4
 y+sDMqxLbus/VRLhm9/1b9sKmork+w1WBwPvEtaJcuIWvaT803dlLlJgDsmWMphDI4H7i06PCGA
 xdw6Pm1566boQL6r6oGcR7tyaM/IZokawBew5UdIss/142CNXWyLUVxAbWMkJhtHUpg4Ivacs8j
 4TQNMgW2z39zYo8+nu5huA6Qq/efEQzGGRHvXe+ic4rmMn2G/oQkuhlz5kRDhUdttgwaxTPgyte
 QZyy/MPYIIm+u0FzaJrIoTBgcaSsWqw2l1tK8II+v3bnQ+7vU34fP5uqmOqatd8vhIIEoRsy8Gi
 yMnGcU0oXkJsckN6lEA==
X-Proofpoint-ORIG-GUID: youqoHRRB2RrQyAKofwXz_sk-aDXS72j
X-Proofpoint-GUID: youqoHRRB2RrQyAKofwXz_sk-aDXS72j
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ae976a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_024828_345985_05E41DA0 
X-CRM114-Status: GOOD (  17.77  )
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
index 5ac07e8dd5ff..69d55ee3895f 100644
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


