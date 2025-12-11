Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931BBD3E78F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 06:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CiBtz0qC1MDsW7WxZbfp2FTkcuI+8Qu6DtaIpmNwpuU=; b=Lp/niKy4plbWSyCIyPCe3Y9jLL
	fCigISGppVHw3eArWWvRU9TFCPdZnDtAuuXe04PWhnsSurU6jrDbCQGmUkgOLT42t4GG4iP7bV8P2
	gJ5DCisF+otsNXnghqaTcjCQcCekNvcLnxAvIxlVgJGjEY53srsr3IYKBw1u+Wm9G7jA2sYcHLvPx
	VJE9xy9Sejnb6e4cfLOn4Iwyi1NakHN0DN0MlMcPIb+4MJ9bGlm6W89tuVAjzZrPbDeWBBknjFYtN
	OT7/c1RqRE6s95XREyAehMCsFCNOzhFirHDeeRH7a/Hmvop53tEtCLVDYFQieoIATPK2Xo+gAQkNc
	GNYhrFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZuN-0000000GGns-28FQ;
	Thu, 11 Dec 2025 06:12:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZuK-0000000GGky-31Bo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 06:12:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB34EbJ388613
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CiBtz0qC1MDsW7WxZbfp2FTkcuI+8Qu6DtaIpmNwpuU=; b=cqZFi+VNhTVteuRA
	OaTq6rL4MYQPmkffBoJYBxfC7fkwfug2tDIaXMOWejFGqNRV8B8qliNOc9stmqUf
	hpEIBiisViaVNYCkhV/VrVUlLqEyXPsMTHJ7RpRCFV8lGAilDG6TnD6uMYkz+jWy
	LmEsjVMTxUnIXrnoYjy+Aq0r+OospBkc6J2QsRk1edcONkGcoDS6HUfuogFn1Y68
	FaE2Vkbd9F153uP1+IEbMubGFYt3pP9H1KnCQgWFbSNQEdDOLkW3dIeI4LqmW0Q8
	dPkZHowfpQeqB9xQw1DpmhEu0fplvtf4vTSlfqJlQFu7+pqM8CKv2lqZFvDyPsPg
	1cfWtA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aynqp0f61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:12:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-299ddb0269eso8831655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 22:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433526; x=1766038326; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CiBtz0qC1MDsW7WxZbfp2FTkcuI+8Qu6DtaIpmNwpuU=;
        b=KebDOxWMykTWdZ5KfzV8/FAdBSdONTVCwFdqYkuv+7LXeht5oRZbLykibAUl5MhXkQ
         EoBYcfNk9nwVOxY1vo78g7KIuf4GfLWzw6zXNvCs05GJ0z5N69cLOzttgOK7pB77FhKI
         IsUSfczsUlIRT47JFxqNkoEOX060/PlIBTQ3GOXMx6w3K46I4Gc8bY1OvImCGyV1nc9H
         66t7ZpMIRvGuPTafjIBlsJFOwIaN80IZzI8UORjbAWvLVJYnRhqYTMtB5TsixvYLbI39
         ZLQuMTwkuE/L/OpNW0B58yEb0rgS1vztj2ZBVwvI+qWTt13RKyw+aEwlUjcoQDTLYIAX
         AFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433526; x=1766038326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CiBtz0qC1MDsW7WxZbfp2FTkcuI+8Qu6DtaIpmNwpuU=;
        b=q7PwHmGegvH7UDDsHiy/sV9Vo1MDExS3tDFmd6+g25CDWLMX0RU1eVNiJLAFmEhBPi
         kLq1Vuk7TPTEjjV4ATewdilPfm27aEnOVmM1TsEyF9M2LGa5OK5NcNyS8k0P7PDw5upW
         MXpXUHUDgnX1tzuGi3cXO44GeOV17qqWngdP1Qy0avKbwyGN3OTPkBw6QvK6GqymLXkx
         hskVLpoQIrPevdlhfI7c70tDcMWzBaKFAw7GwTAO+KaiJsPGHQh/5sQ1qo+RolZucvsH
         KOlpfQiIhYUh+e8gIv2+l3csUfAYhHTY+EdYMcPkc6fATiuQfoVzkj1Co+aSiYV6l2L6
         pCfg==
X-Forwarded-Encrypted: i=1; AJvYcCW/2o2rBEvhXFK6xhjbCsGB/swbH7ovk7FLqKWaQDqg+6AaxyjpR+tQoeFcJ7ZibvJg2i4ZqaA8g2DwtaBSVzFq@lists.infradead.org
X-Gm-Message-State: AOJu0YwRo1o8mTgBAgi/iqK7Vcv6WSeyexHjcomTD8J6JruEXj1LJbgi
	tkylqjnbO2eFuYnSMqCKwZiwx9kgJI67Opd3J78kjT2rh4kUyct487Or/lIEeEHV6c8ZwAmPdax
	Y3psNHoSGr6UIj0KQejfQj1gjQ7fO9BIvQxD2O8vhorpzsjbLh+XUsZbq5rjPfpRIu9G3odkqG4
	b4Br5ATw7SwQ==
X-Gm-Gg: AY/fxX7NYz9uUZfcR8ElEEARz9tBPAaQLLZjzC9Z1f5pVhZKzKF5nrAwNFKsaEbT1SR
	SlRas19ht7d2/PBuJQwHD2dpftqdIuoPYHqcc72saJtOGrkntzqdR51BpnaN0D7VnPdc9JK+dAs
	MSAbp3FbAvUEhFaEB4Z2GlxwzsXDBL5G7QzcG1rdVNZ8pBGaeroui9qjA3USoBIPLeQOZbydQlh
	ETo+Fk1siwFlBfkPpk+D6rOcCeIyNd/w9wFugHEFhl9oAHdZWPFp3A/I8Jq1FK9LSbaa1c883tV
	pqtvU0fNaHXe/aNl55GL7JHGtmOm6kvTHPIuOZxFIaEuz1CnQx4PlgTIUC8iLsmJ7L7gCXRMyqe
	hmo9yiTS3Ev/0NRftwz0sa5gnO+E65ysvqx/ZcmHqDuvk4DTmjFStQxlkdEWl1jZbqIhLjqyS
X-Received: by 2002:a17:903:3d10:b0:295:5d0b:e119 with SMTP id d9443c01a7336-29ec233651fmr48988265ad.26.1765433526141;
        Wed, 10 Dec 2025 22:12:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6fC3G9cRxZnPr7R0wcUAZMWDvoLAxRPfLPw1ivs4Rflap0o6zBIzu42QGY9pF+eM4UFiEAw==
X-Received: by 2002:a17:903:3d10:b0:295:5d0b:e119 with SMTP id d9443c01a7336-29ec233651fmr48988055ad.26.1765433525664;
        Wed, 10 Dec 2025 22:12:05 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:12:05 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:10:46 +0800
Subject: [PATCH v8 7/8] coresight: tmc: integrate byte-cntr's read_ops with
 sysfs file_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-7-3e12ff313191@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433485; l=3607;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xJnis8AYP6mUACqX8hrlzR6o4WFt5DY5g2nwBMuPaFg=;
 b=XZKk6u6O8/W+/NKO3AjRcEidZmfWuImieEybj0q21Sad2eq2N8OitNcpHtzKGjthFpgvrpY9s
 h1fyVyKmYXdAH0DgyQQqpXNScBCrkDcNTfHx0curg8bHL4Eu37uSgJf
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfX4q9SjW1SnUa4
 afYYrBQnXQ4BQd/nSlDhTGr0LozLPxx72HHoNqgawZE9CZ4i5Fruk8bucmu+UhkPoPyNfeLu76d
 duVLVfHyjO6WjW8aHN3gLBGzoHi8r7ZebgaWZGMU3n4teylcKmihiOHxihrArGQieKF720wKw4x
 oFVr2nhyi6qaQbphUAqNBfTwECQ8dfPPp17MFabjd1+P9U004MXtvPcVt+yfXYu38OH2ThmvvOd
 KW5gcIMFEfwnLaFXcppY7EaF94ksrUtkSeYGeZKQj1m+NECGgwiY9y0DXB0CF3v1J5SZuFmpyZh
 3mvQzaraZAFRzsxlKh/skwzJ5p3KQ0vLgFK5e6BSYHGbcr7JoRSgwQ6cFddG9QIExJIk/hmOtoe
 tNWmQkjEAuGXGJR1+RLw0uhQVeXfwA==
X-Authority-Analysis: v=2.4 cv=dZeNHHXe c=1 sm=1 tr=0 ts=693a60b7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: LjT7ayLWxxxQXIHX_Naz7_nFObaME8th
X-Proofpoint-ORIG-GUID: LjT7ayLWxxxQXIHX_Naz7_nFObaME8th
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_221208_882100_7FF9B475 
X-CRM114-Status: GOOD (  18.53  )
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
index 8b0397a77e57..41ac99b35a84 100644
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
+	port = coresight_get_in_port(drvdata->csdev, helper);
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


