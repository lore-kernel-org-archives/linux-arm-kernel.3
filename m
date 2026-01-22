Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5903CD626C0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 02:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=; b=fZxixjZi08Snq5jZwfEEcqFzNC
	KiUkMbhSDS9EMW0ALyvFlAHzPSDEV8l/+ds8fMPxrJVfKLVl+arfQFedcB8m1MhmXZ0gbcrpJ4J6S
	XXUySrzzFtW7f98r951TSTF27ts38C2eGiAq8bCE9KO6pMYCeyGH0b3zWfjhAUcPzA6AaC8KYD0jU
	bYuVaez6b+/melUH5QwJuhF2Wz/bI+F1Y9iQeErHBSwQBVwwAjq0Ejh/RG0YClW1NF5mS5kFsPBp0
	ikXQC/WT1+U+7ALrGg4tJEPWvhQg3vREIi/vDvRkks7AyBAPSDSUXTPIP4l3sHF3rR0/sgw4JfZGI
	oWkfIi4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik8P-00000006J0x-1HMU;
	Thu, 22 Jan 2026 02:09:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik8L-00000006IyK-32Qz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 02:09:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LJ1Rb23902081
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=; b=KIgsA6gf/++GLgnp
	yOzQIrL5u5xTxvm6RuyMuCAtvzKPCIybMa0Ia6ipu38y5fCfcfQaELKBAWTAmsDc
	1TEZDvmNYem/9SdNrZSz+tXTDWqIHqDVdd42FRBr0b3KUHsVG1gjBgG81HXBDz3e
	UifqyGIQxwmbccWNhp7omAwQiunrOPMZf0ME5Gvzgk7z8kmIYsUEf/dZyuePp46V
	EDiPu5QWgvBHtHNiRmGOlH4uq1oK4ew3Agc5DPIEavlcgTGV7xTYeduqHJhoca6F
	eEVIQKWDGlZS9V3MS1jilDMj2t9KZjOawMJjHFX/jvr6Xb4yLxEQ5LfNCifivwNy
	hu4CZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu4khh1sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:09:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f1f69eec6so3806555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 18:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047757; x=1769652557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=;
        b=Nng7Z7aRs5jbxKX+4Ys09E7DsduO5YjovobScBAUtk3bY/cY8lqu9YZL8sOJCIQQop
         gWheCb+Ya5KHy39gSk+H61q3nmCr+rgksdrVDYIZOxzgoAZ8V+hkynl2z6kNS36I91UU
         gXggym45SQls9HpTBHBAMC86kJ5K91lsugAjzbBVtnpKNMATy0X8nD7GA2FwgfkVHNs3
         GHPRd6UQ8sl0hZj1m9BjBVWaFzQMuEiS7d7YGx/V/6IGUAO3v0SGerePjbCeeHy8qkPK
         IU6cURodXC64jo2esM9ghA0KbIhW3keIEz+08c3pZ9F3MSvwPRxT3BuoBiL+qTCpJzD9
         fjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047757; x=1769652557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vt0RRfM8pFKfBxD6jKeqJVSWMlwtbL7pwYs+oCiP02U=;
        b=WfPinRc3+USa5sVPKfsJBbw+TlRJBI8xXebdG0KewPCb9i1mshNf7kuCIQ1CDzbCSG
         nZiCAMOnuMiW9eLUDvWupv+Tsav9TFrDRaTXEV8PG9j9VV+Wh4ossLIp2ohBQg9ZgdnT
         SFLEUkyuRzrCZla0m5LAkEOGy4KNXmcIjej5tnDmjZwmLcQiCw44o3vNdqjGxxe7zwvE
         cYB2BjkslX94p11POjMtuqSVMJL/UajcZBYqv0HlEkeVVELFBWgeAMIskv/RVE5nDlWg
         hxS0gYKs/GjkQSv8PTnUTZIuxG/ZK+l8bCQpIGVUTmoiuyPmVp1ludy9d39j8YvhXgZh
         Cvjw==
X-Forwarded-Encrypted: i=1; AJvYcCWbsU+XlzkYD0IBO2wT4Kjud1tG1bNqjqMGTLSE2LSYmGy9OstN1w8XuWLgaT77TBRXMx15fxtuJRTZTaG4QB7b@lists.infradead.org
X-Gm-Message-State: AOJu0YzajEJzotbsc08BE+BehdfLjd653jhCGb3C/5AOeDNA6hPLqoQF
	nYdo9qfVPQSuhDI0k9c/9ku6bibz5fUxyiFMZXsaF7CYjW39F9wfug3FW1oLm+xnnfHwZJQgVDT
	9QnC5yUvCASyvSPCWOFzyistzCZiOH1hAbbiFyroPJlL+xqgOa6cWCbiiY/j+asgXh22hrt1FCN
	QbnA==
X-Gm-Gg: AZuq6aKwxB29HvwACRPBN50tRxNEUaVF/LPuH7HOst/IhKtknCk86LpJhoz70AGCAB9
	82dBeX43RoXrqAe7V5b7wcr/2jDKoSftsHzZ9aTQXEY3mFFpysUWIRGvZZwjJRUcFhNXjnNUNg0
	y02oCHULhATzMR9YFwILpP3aCsmuk88o2fJG4G9oY4CyMkk0zsBIGy1QvMT963gKp4ZF3KSR/l3
	qaaZptrmxccuAE2sVoAW3vO+UMbxfLXoutvWOK1YpriTW+qPqqPqgdTqFr4aYxBWjmU8s47Is2n
	Q6Gr7yLxuCWGtxFYCi8pyczZxpz7OalzqHMlgv4JjpFSuTv4ZsIbPQ6SsRIAWJ+h/1ahEg/qm0g
	/SdbFu4qUL2i5a94a08IgfUk8jaYqlHUyrsC4WqfhnNIqIJQk/RNdU7hPaksuEKhDRiVw/xH4
X-Received: by 2002:a17:902:ea02:b0:2a2:f0cb:dfa2 with SMTP id d9443c01a7336-2a7698f854bmr65694925ad.13.1769047756510;
        Wed, 21 Jan 2026 18:09:16 -0800 (PST)
X-Received: by 2002:a17:902:ea02:b0:2a2:f0cb:dfa2 with SMTP id d9443c01a7336-2a7698f854bmr65694615ad.13.1769047755874;
        Wed, 21 Jan 2026 18:09:15 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:09:15 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:08:20 +0800
Subject: [PATCH v10 7/8] coresight: tmc: integrate byte-cntr's read_ops
 with sysfs file_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-7-22978e3c169f@oss.qualcomm.com>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047716; l=3605;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Oy7z+jq/TjNetJ2Zgz+w8FIQKCJz069QL66/p8AMAm8=;
 b=zE/jK9UyRQbvKpqffm83KuM46KoAYI0VPJL922Np2j6tW1PMB3kyKxwvTMB133OMVD6OegYk+
 SqkWTifXQahDLNDYnWSxW4vIOOKm8qRn7epsNrqh/MCR7f8AqHpK8iV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfX+L919sdyFfB5
 Ce9HmRQli0EkhfOsXWaHa+vjn2y8+kqPYNvligcpl0PZlZbrPh6DtFNHmcphPZ9j22Edn+/MZye
 cXvxL2g0+Kr3qt3/rLdvtW85xP8q7ggqoYATTzbNtUHx1ad8SG0VovDkyqG+duhlGij78h7wFKw
 xCdYbZAj695cm3h9jmKaKeG4Bz8VZgha2Y5BlOSJhz4BTnRs9Mw8dDvDou9i6Dn+jpGk25HfOQA
 iXpapJsO3maJ0Mo8uxpyItvMTIf7T+FGNM/mMc2VccdEhRCkSArGLehVwwG9rA3DzgRH0ptIprC
 bY634cK4xqVRUgaEJaCdImLI+KL3X5rr4hH24JOQx4ZiFfSvpATl4MXeMifRToEfZg21GYo43AI
 ceX7YflVAtFbew7Nn1Nje6sqv0Q8smr4hEUptlbifoXA+PCymGBGfxK/zze2B4A8gryyvhFAal1
 KnFt/XnHS1TS8EUcg0w==
X-Proofpoint-ORIG-GUID: X_nHrqmziobt3ZQROX2ZPTvvGn7ibmZw
X-Authority-Analysis: v=2.4 cv=UOjQ3Sfy c=1 sm=1 tr=0 ts=697186cd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: X_nHrqmziobt3ZQROX2ZPTvvGn7ibmZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_180917_791853_ABE724E9 
X-CRM114-Status: GOOD (  18.72  )
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
index 8b0397a77e57..5e74f33f6a23 100644
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
+	helper = tmc_etr_get_helper_device(drvdata, CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
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


