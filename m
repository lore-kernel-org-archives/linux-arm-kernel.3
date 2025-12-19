Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C00D7495D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 06:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAHoK3E/1oecqQ3t5XeeP2NOaVanUmmIQWh+9SYZv/s=; b=v35qUbNY0UrW0S0QxyIqcOJmP8
	VS2I7OuOwpYcCKSR3ebfF8xXXXiN/XHKOLwYL486o+2KuQDVBXbUI4RGq4s8hLtfdhqujCjFwPUQ3
	OvCHKTkdiErnq1qERWXxG5XvxfS+kGSNFMXQg+6eJjzfpEFQkQPqfWDvB3l+L1EhP2n/7t45Xf+xC
	003wqKCeJR8F9Fk7b6seq/JSlbBLyYjtx5bekqA/TY1FPrtVasyCWBxx5uR5MxM0DdUpnlV3BPuf5
	YGsN5tAprfFoOGe+KrHfg/wL6W/BxjEm0M/1VlB6Wl6LGUg5oGC8TUDMglsfPPpH65Dj5yREVmTSh
	oJkTz/cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUSk-00000009jTY-2D52;
	Fri, 19 Dec 2025 06:59:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUSf-00000009jOO-2Y1J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 06:59:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cLGn3991982
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AAHoK3E/1oe
	cqQ3t5XeeP2NOaVanUmmIQWh+9SYZv/s=; b=CZbqotfisGUedtKVnyjdzWM26kG
	TJRqYgeuqqIOJ3lmji0er+nstl0+5ZjrI4kMKolBL/aO+GTpysK4Q0fNvpeqvQxo
	vMxdZoRZrcwxyvnpuI1NtkbaOcOVafdvbDf0Z7Yn+TYFeWNdWLozCtIzUtrzUolQ
	Zd7/udCixYrbpXQNoE70Jh2gDORAbqImgXuRmPGvhCK5bYiOgBgaHErzpHW4kEk9
	g6yNoyTpSViieoEHJejzSWOPvczlQqXMtchdebYFRaNNT0swxiNFooQ/lpyUEyG4
	r4Sjz0gA4xOMMily+WV/5O6nXkDRg4EcFxR45lOSgLhq+JXFfjJjns1UGcw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2d9ke1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:59:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bc2a04abc5aso1373269a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 22:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766127575; x=1766732375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAHoK3E/1oecqQ3t5XeeP2NOaVanUmmIQWh+9SYZv/s=;
        b=jncAb2onBJ7lBq4jucXR0OGBha2oCHQ2rzrQKaezNbwI0pEFNSJJpdvp3IvsrxmVjf
         +EomA7i+878gcaOq/PJml/7M+hrL0G2xZmFbNZ5G2CEIbAtV/+dIQxOKEtMu/YP8gXMT
         dGwGbBKLFiKmB+X3zaz6DGz+dAYXR4UNLanhrY5bculT89VriVNxM/T70bi1EZ2nVTXG
         QAdXCRV5imuMjh5SFcrenBrtVTzm4/pdJ99MS5S/xwOxI+nkvQPQI5Sl53Hks9uJCbx3
         8jVxBbMfw7D3cEZryRuGEq1JlqSOID2ytI/dwWs6QhKSspcHurgwK4wFcFyn+D+U9ZWF
         VYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766127575; x=1766732375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AAHoK3E/1oecqQ3t5XeeP2NOaVanUmmIQWh+9SYZv/s=;
        b=oBDleP/pVw4pUgP1GNHIQB/NuBjNYjF2GMWEgZl5zUO+FfmOPrlekYBKU2xQ77eS3Z
         H1CTkGgOOaf/6+z0Gm+nIbBILzxYvlzb5adCpTKyotf2POCztTeggu94pFQ/6wAx+oyR
         pMwrgYOq53+FOz1x9i7MxZL+nkHgp+kV5EdtcmxW/+o2JceLcsTgVOIqR0MdOoBRMDNR
         0EdYviyOSrtZFOrfaV8oOM6g//OQoM62IZIpX3HUlQp2dcGe4Q4IzvA+dOtX3F5HgIXt
         eXwcsbSU6roODvv3zteXObWbPZr4bP4d3/XbvxT3tea2S4Qusy2VbEI71+KZeaaat2uO
         h1wA==
X-Forwarded-Encrypted: i=1; AJvYcCWOG+Dl6KBnn5RZFt/EDaCpUVPrW6VRXttsINp0D6I3y3gO1NMDNgXNre7AXshNpzWsumtY4Y3rSzAI3q8faB8q@lists.infradead.org
X-Gm-Message-State: AOJu0YxhQiCpYPo20eN4PQFQGPIASUj2cicUzBDPMSshNLrpR1UVHC4k
	r/uCQBcjpnjRuvnpjkm49JrnRYPB4o9xS0PJldQx6zdUSaiPpHckGVuVjneNsCYfJzHtngNYnB3
	8Iks4EA7UoyOiydrqKk65wG5qYIGxDx6/NqNygPXH4rbF5PpHgt3moCcCDD4/cLAP6vbQOn1W9Z
	dAcKeTdhuWOS8w
X-Gm-Gg: AY/fxX6kF5dk/TS6jKjVqn1V+RqlsGMtArvhX0a+wgpKmPKwu/YhF8OU7qSTIicVcXu
	djmYFSVV+jnDmadmcorhoRDSXywtKypM/BudhDZKDrQbhgLLstpmHfCKY1gyULXW9UMiHQE0ylB
	m6VDa/zba4ZK3OC49aqd6yKFBv/XkonGLI4UGVNgcDFoIdGZ5PdySW+7YqaDJX75OkQ8ksDqs9j
	tXIWgPX1x5KtD5Uk+w76xOxp2rcpT8cXVzTJ+x4wUNnljvgflIZJ2D9udrp7Ndm/GUwlLzVdHIj
	s4j6YH7bCaHBuQJ9tqoiwPFCw7oRQzL1uByrxluAGcynDe3GYCdOqLre65lhrV0PHNJ1mUmN1mc
	OUDEK3VIM3MAza6DY8xiDplphshjAGP0VRnXo7lNwwVugYdQyZug5FFZiUnoN1fhV
X-Received: by 2002:a05:7300:7994:b0:2b0:59da:f794 with SMTP id 5a478bee46e88-2b05ec745ddmr1683895eec.24.1766127575250;
        Thu, 18 Dec 2025 22:59:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHFZQ55XLG0hhz+Du5So6Zh30gXpnThAA+Zru3wBF9ghRk08A705BlyynLTBuO1EMWAHVI2A==
X-Received: by 2002:a05:7300:7994:b0:2b0:59da:f794 with SMTP id 5a478bee46e88-2b05ec745ddmr1683876eec.24.1766127574671;
        Thu, 18 Dec 2025 22:59:34 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm3614954eec.0.2025.12.18.22.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:59:34 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v9 7/7] qcom-tgu: Add reset node to initialize
Date: Thu, 18 Dec 2025 22:59:02 -0800
Message-Id: <20251219065902.2296896-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=6944f7d8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IgPCHI2mAnvcCQI4J_AA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA1NiBTYWx0ZWRfX+N90calYN4zO
 2SLMW1vIqOsgrLlqN7keCOqGnpoacRUGWjJGgz5g15Yf66YSH0b8dAMzr+LH8XPiKKIguKCi6Tq
 j+vmwUYEWIhrN/ftErjPjIoZzwH7vPmDObclbIPiLAToVdhFFT7RdCFpQHK48JHp4edyiOKbUi1
 cTP8UxXJzJlFadMsjxYfXldLCLLVdO/vtrvaExzoBVXuvx1KOZQQ1cWAVpa3gvKPWyjtg+ZINAT
 n/3UbqVSypFj7qb5bUHie+oN5N6vuqQGYv9CJ/q8CDLEHhjr7dK54lBhVZTV0G0bVjyf3soUzwC
 74yH16kqpx9Uo7gZVSYl68PJ3yRKSZyeJLcbm8FyfjFB3sD7jjqSeBEi2N7lDzZLzEzkEfYdips
 JjW0T1hXRjfzkfuQZf8aTidQ7x2SVXQKejL7qZe3E9vkeGO+MKr1asWHyE7E6hT1aR+uoLfxYPK
 fQ5MrVYq9YzQR/MhB3g==
X-Proofpoint-GUID: XMW12FbCiW-FTx-idxk5DybX37HaeE7q
X-Proofpoint-ORIG-GUID: XMW12FbCiW-FTx-idxk5DybX37HaeE7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_225937_786516_0D981A83 
X-CRM114-Status: GOOD (  17.85  )
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

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 010eade0a1c5..0733b3e07b45 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion	6.19
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		December 2025
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index d4210869556e..5a8c6af9b719 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -425,8 +425,82 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	unsigned long value;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value == 0)
+		return -EINVAL;
+
+	if (!drvdata->enable) {
+		ret = pm_runtime_get_sync(drvdata->dev);
+		if (ret < 0) {
+			pm_runtime_put(drvdata->dev);
+			return ret;
+		}
+	}
+
+	guard(spinlock)(&drvdata->lock);
+	TGU_UNLOCK(drvdata->base);
+
+	writel(0, drvdata->base + TGU_CONTROL);
+
+	if (drvdata->value_table->priority)
+		memset(drvdata->value_table->priority, 0,
+			    MAX_PRIORITY * drvdata->max_step *
+				drvdata->max_reg * sizeof(unsigned int));
+
+	if (drvdata->value_table->condition_decode)
+		memset(drvdata->value_table->condition_decode, 0,
+			    drvdata->max_condition_decode * drvdata->max_step *
+				sizeof(unsigned int));
+
+		/* Initialize all condition registers to NOT(value=0x1000000) */
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
+			drvdata->value_table
+			->condition_decode[calculate_array_location(
+			drvdata, i, TGU_CONDITION_DECODE, j)] =
+			0x1000000;
+		}
+	}
+
+	if (drvdata->value_table->condition_select)
+		memset(drvdata->value_table->condition_select, 0,
+				drvdata->max_condition_select * drvdata->max_step *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->timer)
+		memset(drvdata->value_table->timer, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_timer) *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->counter)
+		memset(drvdata->value_table->counter, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_counter) *
+				sizeof(unsigned int));
+
+	dev_dbg(dev, "Coresight-TGU reset complete\n");
+
+	TGU_LOCK(drvdata->base);
+
+	drvdata->enable = false;
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1


