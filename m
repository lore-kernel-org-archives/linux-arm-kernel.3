Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D645CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 02:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjr9DFWK5BGmewZSGkQ2VZUQYos6n8eGabCZvgYjzHQ=; b=AbeTprlhlUrH+zc6Hsvt3smXjo
	DZvz/lvWsEd6xkbtyZPh+A8JmgdEAoesCjIX++SSk+u0tfrrzLsdxcS2bdjm8wnY0PN2vjqmGbSlN
	Wax7R/mQCYgizVaJWRV3wB93vt3gzjkYxACkcFiYNULTTVBWVUotRCxk0M+m3gt0TL7YS69lp0joO
	dcOZ9fpoFL849icbECtqFxwquOOeFVq3sZxWN+IjBYyVrimJHIEvtYXCxFN8zxk+QszRP0LTen5os
	ES7WXwIfo88uz1c3yw9FOCHVKv+J8KJOHx35Qrg1a7pTrvadStm4+O6Q1970NGg2pOg7XsgX+BE5d
	IweJ7Oog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRcT-0000000E1EU-1aGK;
	Mon, 08 Sep 2025 02:28:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRDn-0000000DuxW-3CqD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 02:03:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NAXYl029349
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Sep 2025 02:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjr9DFWK5BGmewZSGkQ2VZUQYos6n8eGabCZvgYjzHQ=; b=EtMcVncCuQL8y/WJ
	o0FTjzDv3u6BrzQ0/O8i0v1KHYAblscqm8FseYbrHfwUkF/AR5oIVZM16SL7djWm
	QGV6SY4TYVrVPbxzAcwfJdwvi5t5PwZ/xf9P1lObTdMT6ZcMf7h/IXntbYuB2Sp+
	7R07Gs2pMgEp6ZZHszAgS3nWg5jT/kFWQ6Z+Dvd2GAy2/KNVccWwDrNiiw5Fq+uh
	IKlvTZHRq/pHFqjICRpnIcnEGdQviWEZ3fRzhisKO2g+zgl0zVxhfUjg6tLnwmX0
	pukYhdfLpdeOyKaWDfUH+8fXUJLa2vemYCcWiciI2u9mYFzzmf7xFyKOcNiuJfw/
	SDZ7WQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490anfb4jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 02:03:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e2e60221fso7584160b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 19:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296986; x=1757901786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjr9DFWK5BGmewZSGkQ2VZUQYos6n8eGabCZvgYjzHQ=;
        b=WmjdpoqVJpsLonMhSS1eGfp7Zu+eSD0v507Gf4hfxySgNabFqEKI4l+wFLxOkeUHn/
         B6qnOoD+uD73cFNmU5S7+JfNM9vo/zapeNMw2wzHpMlbao9LL88zAUlz8wiHQvGbdZh0
         mTOAfay0w/SL++W/nYG68Dn3z0XDSNzj1NazcVgSzPEoSQPHA5osC2oCJwkg1v8lu3Hz
         oH5mdP2GRaKe+7pfUAPY8v6UqysYywL18kg9kim4NsTVYHA1/UplLZZvl46aRpD2IkV5
         OCXBTwnC10M/VmBCAA30tHOkI6+zB1cwFQ+upeP3dK0hg1rdPTAkShcWTrXnhCS9Q+5s
         MExA==
X-Forwarded-Encrypted: i=1; AJvYcCVGnq+A648Vx1YCYlvKSAVrccMW0OGWivRaK09pO3IXYrsWo8DXY7lqLs8qm31jJWcm4zohKZTChdoBN0ReG90z@lists.infradead.org
X-Gm-Message-State: AOJu0YxUx65rY3b+kIk3kkV6MDHuhnbcqoByi5dp5svpJvzoQjxPobWB
	6MLyyDylBkQ5CjUNsYaT/vo+txYYFP+DQ9Gri9AH59ZImTTne/Ioi10Zu4xxVmyGy3ZKZa1Gc56
	oQUyZNTbSHj50Y7m2IPOmkgOvAbPwJQMEvCtlpNNrGagBbSgyFN+lOHbR+RHrzJv2SC8x7Doewf
	VX9OJWX3Cy4+jW
X-Gm-Gg: ASbGncuhe30dAT8ACRREE7flEh2XvKGT4S/DvKTmquWMRVlkmmoj95HsYgn9mZ14lYq
	z+blfVLX42Ijb0a0tHCwRP5mhfv/BQB/BPdWYcKn//bAUuKUNXD11D17vWaQ7FFO2kephsiVwvq
	+eTZ8mHn13ZY6Mgp0NKFL299lcgTYUq9lkUyj8SUt8zP/2V26Ii+nhOxPx8fVzJwLwDTAdz0MdP
	bfF+v+RAbjREbL7FnFh0OGEAOcszM7RjNzxYvua4azXLijjncS1eOneMFp5E6tYXOhfGEH/uRmI
	xBTIrGzCTMCfUFtJRcgqvCUtCPxK/b4DD+YHIPX66OP6EsbUfTKj5dIDLVb34gn2sTvnsHhq7yR
	D4tOEtBtAvWOd7J3AZrN9sVTqXO8=
X-Received: by 2002:a05:6a00:2ea7:b0:772:615f:b5b1 with SMTP id d2e1a72fcca58-7742de89899mr8693319b3a.18.1757296986204;
        Sun, 07 Sep 2025 19:03:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAJxGcEdogZyXQSFhs4IFVZ3BGmEZByW5ZZWBmkUd9Gu22s2z4YnUhtcDrdmy9HZyJgb1BlQ==
X-Received: by 2002:a05:6a00:2ea7:b0:772:615f:b5b1 with SMTP id d2e1a72fcca58-7742de89899mr8693225b3a.18.1757296985368;
        Sun, 07 Sep 2025 19:03:05 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:03:05 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:02:00 +0800
Subject: [PATCH v6 8/9] coresight: tmc: integrate byte-cntr's read_ops with
 sysfs file_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-8-1db9e621441a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296941; l=3612;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=gqGZH6Yi8iA2PurHK4Hr0SugFLFi+Qumto7o2U0LAyM=;
 b=rkZkwzh3bZlNzouhvpi4j27HlwAMQmPx/lQCC/2XzkvPU+KvSz1Tf9dJhzWLdQbQgwzS8RzSQ
 JFhe9Q00/zZDLuuMF1J0EKQbLCrPjwFMOwBuv7RMFKBnbIl9o5gx67X
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-ORIG-GUID: rU6IYfsiL83ZEzJ0eoVnl16WCM5ii4nW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwNCBTYWx0ZWRfX5jkNNvTJXiKw
 5tD8jq9qCmTRAjl4Pm0KhxhRQfWmKr7XwBtBa7qLv1kXFUEWmidQDWkqcXaDEF+sXmVrOj6oLtI
 fScbBMDRBabVinoyGkSyZkWet8Njwa9G7gUoI5uUmnIpEoXVkoJDCn0JdF+cfFaanGuUHejXyi9
 g1qdQBhEkUcHLJTirW2i+nE8OiIO92cjg1nqF1Sj5uAZ9DrpGR2Ys9LxV0OMVyvRUThb7ZFRuwa
 sybjKWpgYbgDHNWX9teVsb06WSJMYyHdatVedngfMYcylCBfW/xyu1cXuTlQySkTb2FSQJ/rKTC
 GSZBWD+80fFTkLxM0brH6JgDv+TI4CZE7Hg60P45sPqUep/3T1xCC0vuRryHUmmBSHFL9kIHJQK
 brGIIt5/
X-Proofpoint-GUID: rU6IYfsiL83ZEzJ0eoVnl16WCM5ii4nW
X-Authority-Analysis: v=2.4 cv=CaoI5Krl c=1 sm=1 tr=0 ts=68be395b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_190307_811181_D5206377 
X-CRM114-Status: GOOD (  19.27  )
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

Add code logic to invoke byte-cntr's sysfs_read_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index ccb177d953b9..2895a9b431c3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -31,6 +31,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
+#include "coresight-ctcu.h"
 
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
@@ -228,15 +229,47 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+/* Return the byte-cntr's sysfs_read_ops if in use */
+static const struct sysfs_read_ops *tmc_get_byte_cntr_sysfs_ops(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *helper;
+	int port;
+
+	helper = coresight_get_helper(drvdata->csdev, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	if (!helper)
+		return NULL;
+
+	port = coresight_get_in_port_dest(drvdata->csdev, helper);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	if (byte_cntr_data && byte_cntr_data->thresh_val)
+		return ctcu_drvdata->byte_cntr_sysfs_read_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_prepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_prepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
 
@@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops) {
+		ret = byte_cntr_sysfs_read_ops->read_unprepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
 
@@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct sysfs_read_ops *byte_cntr_sysfs_read_ops;
+
+	byte_cntr_sysfs_read_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_read_ops)
+		return byte_cntr_sysfs_read_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	if (drvdata->sysfs_ops)
 		return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 
@@ -300,7 +347,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (drvdata->reading_node)
+		drvdata->reading_node->pos += actual;
+	else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;

-- 
2.34.1


