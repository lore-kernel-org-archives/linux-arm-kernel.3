Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2961BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Txr3kBSGXuJM1NcPlL0RigHdmQCDNw7+9K0Rj1x3VAA=; b=TfRxVRrldjprQgaHgI6QJYEYUa
	jD0H3AXTEPlNiLiWXuh9pTGTaDS+962g6IRRoAlfwMT+bAk4R8xBBo5ePOTUQj2ey3AJhnTIWTLJy
	2vJbmdP5vFFbBBA+QReN3ld8wioXc03+9qRCLFyNaQiwgO07ZaiQ8p6B9uGzaJJAAjHiIeMn4mCpO
	T0sOwuuB/tNdkyGMeWi+GP6BYZqMr0kG4//No0gCTvIIAj+YodWWIZhagkRAP2hUNNPOXZroiZu5d
	yCfv0/hkI8wS/M5ASsSj/gcnJyM58k76fWaColNs8JJdoFRteL3ujJVq4x9NGKOveOShjMehAtBTV
	HRP+V9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGCH-00000009f4J-0W0j;
	Fri, 25 Jul 2025 11:02:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFMC-00000009XJB-2AxA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:08:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9QiuQ004813
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Txr3kBSGXuJ
	M1NcPlL0RigHdmQCDNw7+9K0Rj1x3VAA=; b=haLl9ImbzgXKYq/6fRYTzUnyghW
	wTNkpUdG+3EAaaiGR3ISGOciy87wgq9dK8gpiE11dpuObxFt0grW7DbzZJdUrYRa
	iGlbk2rIsYWN4lOUB/E4MPJBLJVTYOWn7Ti6BEVHvLUlbJUiaCHBNeGDPAs3fOxW
	G8HH22BP2D0+JCZqIa9mS6c+2VhIDvUDolg3CKajjkub/DHJOU7M57RJfiTmjIZz
	3cGYzNoiVW+fn2CakPdBLJvAzwsJ4SjfSUy8+4MkSvJinqRhKLO/aBsLZKh+mmNX
	nYtP/IScabGOXj1HzORlssL7hrF9ySWYyvsn0zIiWD71A8hZHjREKq4lirA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w539nn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2369dd58602so20614945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438130; x=1754042930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Txr3kBSGXuJM1NcPlL0RigHdmQCDNw7+9K0Rj1x3VAA=;
        b=AIMMKpUNmI7rFM/GqPOwrbbICgge+h38vrOgt4q4z0jM5ImO3yG3zlgjSE2Yp9bOg7
         bEi+nTb1JIZf6/jfXMSS3OsBjgdQ5BVxtLQwhhfG45V4xDFt29gapVn+6Uh7wkaowFA5
         7ZAnXxEte2juvkOMKAbYjA03irfQ+ezLr+UIHE9G4fvJ0Ha7ixBdA5Qu8HOUJNVBLBQB
         1Pn50Tgm6pXf7sWzq4zD9g0x0r2Kujea2Qr1ZWwW+7lL5U5gsrhcOaQ2ko1TshAVGjli
         ERvp3StvR7vqDVa+c+KICCCyztU+SvQQDwlnnTI4ny1lPdywyS5sZ6qSI5D/hJM864Av
         ekfA==
X-Forwarded-Encrypted: i=1; AJvYcCXkoSeSP+aBTx0t+wlRkk1x8hkeI/j3MbERGEpKa+XEf0yxmN/PgdjbKSHiZyEbzjKQf4JRf5PXIeSeqyV5XoyK@lists.infradead.org
X-Gm-Message-State: AOJu0YwxGtYTTeZ+FEuOPU4OfbURqF/rC5njqbjYcBmio2oDpIiTeIbN
	fULIaXlOtWaHXAe7zB+dLZOzdh9aN/0QruWjim0a/dutpPDM/gewbaGqoxmr4TBh9TYBGHXbmSC
	gLMgQ8goQPrIMYMYal1r+LBPgJ8QwV6mrg9HQ45Q6yrB8a65CqTVqdiSBmkLBi44UTQoa8FbbfN
	v45g==
X-Gm-Gg: ASbGncsznUXUvkeARW2BfTL+S3HVLwW0Z9fOSJrl5LxPb+i+YryFnIVXzGpdAPzjSZI
	cq9HDt/3ukDLUxx7TdKPRBaLCw/Q6b3TLN+rFaM6OU8JbolEq0FGWfyOfXmBJ7Syap02T92s7Wj
	aFtM8RSWuAbX2CfGE+N0m/rsa6VwMGAxosulbNqOzsxSenrQF0ZzOtrin0H62LzHvpmgvOntXCy
	uP4N1jPXe/7rs6lIAH1WZav7tfI8dRMRzSrR97c/Hy8Q2NVy/wEbpAiz4DPc3rCtmGTc5HsxK8+
	Trco75WmSie75RyOR8cihNBqQTabB1fLRTwyNzFPAXhDRGyifIxBnFXl0zsfyxktGxnsLAoEpjf
	jgqMUbEzWA1t5W/eUN7Y=
X-Received: by 2002:a17:902:f382:b0:234:b41e:378f with SMTP id d9443c01a7336-23fb309b9e2mr11944815ad.15.1753438130043;
        Fri, 25 Jul 2025 03:08:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElHL1J4HjZlxfV/xkGQlCThZW+w8mmt5K25h7rX8vHPVJbhFPxXe4QK00qDdLox5Muncmuow==
X-Received: by 2002:a17:902:f382:b0:234:b41e:378f with SMTP id d9443c01a7336-23fb309b9e2mr11944605ad.15.1753438129635;
        Fri, 25 Jul 2025 03:08:49 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH v4 08/10] coresight: add a new function in helper_ops
Date: Fri, 25 Jul 2025 18:08:04 +0800
Message-Id: <20250725100806.1157-9-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AfKxH2XG c=1 sm=1 tr=0 ts=688357b3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vagHEfzm_U2ljPniXDUA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfX4rH/apTk2DTl
 uMdNSUD7XAbbhp+HvtCflkicIbwgTWS1P5g6oY/PSUwBtaY/fouLWxTw24WKktTY2736BbyeV7j
 Pkh305A/OtmAAqy97N6beaaD/N5XKGVGyN55gJIQMQK2jqpkL6F4NlwmzEWGy4ywgVICDidkN8g
 kGPNCN9e/A6gzF0f1m6/JamCsJggzAlED26riRiQcIE3eayDTMoh7UOLIgim6xpJvHrRy9aFQFR
 dyXiBFSgJsF3rozqa5CqcN0oxch8mk01K8Shgn9nG7it0599wFGqlL0orCs1OBjPTIMOVZXkSF6
 9/bGS31A/X8rsIjlE5H0mPVXnQUw7L++i7U9wuLed7LxQbedpG0TESvBtOfXoPgld2KWBTuCcuz
 iFqNL5Vr7Cp+ymxyaS0Iwfo9a/FPUaCamdSukGmI9Y5Hb52MYq8cwmtSbij1eSViNd2/Exfk
X-Proofpoint-GUID: N1f7l491UNx_M3V25lYEilgtMvth3mZ_
X-Proofpoint-ORIG-GUID: N1f7l491UNx_M3V25lYEilgtMvth3mZ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_030852_682304_254D5391 
X-CRM114-Status: GOOD (  19.29  )
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

Add a new function to identifiy whether the byte-cntr function is
enabled or not in helper_ops.

The byte-cntr's read_ops is expected if the byte-cntr is enabled when
the user try to read trace data via sysfs node.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-ctcu-core.c | 35 +++++++++++++++++++
 include/linux/coresight.h                     |  3 ++
 2 files changed, 38 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 8fc08e42187e..dec911980939 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -234,9 +234,44 @@ static int ctcu_disable(struct coresight_device *csdev, void *data)
 	return ctcu_set_etr_traceid(csdev, path, false);
 }
 
+static bool ctcu_qcom_byte_cntr_in_use(struct coresight_device *csdev,
+				       void **data)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct coresight_device *helper;
+	struct ctcu_drvdata *drvdata;
+	int port;
+
+	if (!csdev)
+		return false;
+
+	helper = coresight_get_helper(csdev, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return false;
+
+	port = coresight_get_in_port_dest(csdev, helper);
+	if (port < 0)
+		return false;
+
+	drvdata = dev_get_drvdata(helper->dev.parent);
+	/* Something wrong when initialize byte_cntr_read_ops */
+	if (!drvdata->byte_cntr_read_ops)
+		return false;
+
+	byte_cntr_data = &drvdata->byte_cntr_data[port];
+	/* Return the pointer of the ctcu_drvdata if byte-cntr has enabled */
+	if (byte_cntr_data && byte_cntr_data->thresh_val) {
+		*data = (void *)drvdata->byte_cntr_read_ops;
+		return true;
+	}
+
+	return false;
+}
+
 static const struct coresight_ops_helper ctcu_helper_ops = {
 	.enable = ctcu_enable,
 	.disable = ctcu_disable,
+	.qcom_byte_cntr_in_use = ctcu_qcom_byte_cntr_in_use,
 };
 
 static const struct coresight_ops ctcu_ops = {
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 4ac65c68bbf4..b5f052854b08 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -419,11 +419,14 @@ struct coresight_ops_source {
  *
  * @enable	: Enable the device
  * @disable	: Disable the device
+ * @qcom_byte_cntr_in_use:	check whether the byte-cntr is enabled.
  */
 struct coresight_ops_helper {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
 		      void *data);
 	int (*disable)(struct coresight_device *csdev, void *data);
+	bool (*qcom_byte_cntr_in_use)(struct coresight_device *csdev,
+				      void **data);
 };
 
 
-- 
2.34.1


