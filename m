Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED83CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 06:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIIj+Fyqu1bkdRDQGwzdP+sEfwmSD5ldhQd6xBymW1Y=; b=Wnn9nVI24IAyERhcpm1xAfgfrN
	QIMaJ26GWBZIU2aESbZEywtRljEe5B5mm9GnP9FwD1vUnPYII7M/0wmYq3JcFwAijq8hVSxuFqDAC
	IuhkYPQ+cJfpRX376i3SAGjFpjQ3qflkHSKfQXTLuw/MmcGKyzU3OeiDbUOdy4Euf4CVyVCzgq07D
	DCwLZzC6X1WTSzIgZzHGn/IFdBzCjsBoDWTzCCxnT8vYnWxoXMgrzcJ7mr8MgUJBNTQkyMXL8h3i2
	7dLwF+qfafeGIVAeDQ/KQlZvDO29jJMVo+zZzTiy2nkCMVcrMhq1QMq1BpxivQu1IY3gi3nIqH3ut
	PzuT7ZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAkL-0000000BFc3-3W2I;
	Tue, 04 Nov 2025 06:42:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAkJ-0000000BFZq-3dWC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 06:42:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A43BTxx3667725
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Nov 2025 06:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AIIj+Fyqu1b
	kdRDQGwzdP+sEfwmSD5ldhQd6xBymW1Y=; b=QPYBGqmS32NqHt7XxG+1GvtE6eP
	kyMVngKMr33mu2z/H6AjsWeGv5T+A7pzZGaGk8K/tf+lG2LyhLEPN29I+lWR7gLg
	d3lYTeQ+al7etaKGCi9hDioBMjDUysl6t2jMMsCFBfNbJcj5pBpjD018fWhR/6pm
	v7PF83i5P7dgnOGVebaHGsJNDLuzmO3T2oh0wvcxrpwitGnSQPeCjjPqqInPL6d4
	CChRvWGZNif1/wY0Ptl0F2OYbZ8plnUIR9GT/QR0B5qY69e7JAXAm4PTst+uWK61
	NfV1WMpdYYL2y7c1srKkFUYBMogH9qq7XQ+KQwUNzWvZU7LeRLRJnxPNX2w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ffhxpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 06:42:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956f09f382so18719935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 22:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762238543; x=1762843343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIIj+Fyqu1bkdRDQGwzdP+sEfwmSD5ldhQd6xBymW1Y=;
        b=dS6jBRY2ODtG5dV6c4PMJen75UUzMld52+JkPhmfl1ExU1rT7jVVnnXkoLl/OlFtfS
         OEwT+bVmZbWBUbiFdWSixwb7wXvowpxr0ktEG05TjluSTDe5oU2/gBhq+FYQEZvEK0Uo
         xuW+613M63r4Dhq+uBgJzl5AZUpyutau/ksP652mkieDyS3Ip2Y1Pi6BuL51VPMFui1T
         4PK0oDl7KQ3FI+EVQSjbXvfe1NX/SlqPUcS6Yx8CVQ934p7CRrSQUZ8SrlUcW271NjBR
         MjxkVMD74DUciFfpBKh4+BwuUKt3ZBlvi6F/6NtaC8f0upRDSGLGtgx8VOed7AynV1T7
         mAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762238543; x=1762843343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIIj+Fyqu1bkdRDQGwzdP+sEfwmSD5ldhQd6xBymW1Y=;
        b=sLBDWmdKZ/iOpLQeZfVtgr0mHmvpG/Vj5CD6rN2/s3IK6ugXHyP34NEiGCLVRllaxX
         Wd6w14Qeeoz3mD4lOrUycZX7Hyuq4Sky6Rb7B04hj4bKTEvuBA//zY7XYVUAaAlc3cnx
         8uDJOnB203NeSjIxLZw37MtDfYdl8pwdYj31L52OHXFc6ZSzamrtqxp1l8QdMEMC2F/E
         ZrQfJEGfIhz3NQksFCJvrVogfS54ZV+9oB1lI8DN4frSmK17Cd4i00hPcaVZfGLTFa8H
         elkc14pv6EHmO1ikEkMztoknblZ8Jxio+kOJ/6oN3TwM46/GDIhJBZP4HHIDI2weYwPr
         ph2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdBb8BJhJyaayPzz/qgbJOu/x9Tj3RW82DgrW0bVLI9aId/HyL5W+EK6pyZ+DJCvZziz/TSZUHUpKbN9F7dbvS@lists.infradead.org
X-Gm-Message-State: AOJu0YzsJ8Mdf4ZMSPjN+igsRU+zQdVHuZMXVD8iKXbrNXCfByqKi5QD
	WelSvTfoRYM77hLjmfR5XffQ59suYcL3X6PgW5tecl6uTYOMU8zOgc/Ay4LCvsu/SymwvZcNy7z
	ks9HYnaN7hg9Df6FARhjDtMLayFUYNMw7UHa5JowiOIF1m5dq2UkknVWnyswQVA6d03FrKwXAr3
	RfTQ==
X-Gm-Gg: ASbGncsD1mTLNdsVEOjrCnF7tl29A+7vqK7hQ49WsZPLwCPgtjOM2P17swJiOFZwIUX
	ZRYxar7VNXFlyCj6IqyBBZMSCu6rMGQZyLPREnMwwQKopmbqifludIiXOR2zyc0i1rS6gCsoI8v
	lZpjpeTxkCyN8hSUBmu3U8cv480J0XYUC23lZsFEal3A8KMCDpazw3F7ODdIvNE8an6RzSPv89q
	rVEDyAcd0s80j3N+Z+wKcb5ywaCzic9/eOF0iv7W2FgPjAiwCgS12hHL7s1V9LDpOD/G6M0nyrr
	B05mb2jzZtqVoW+RYjiQUwApwjdyxaKccKESncqeLwfRSSyV1iXmnfoenZ92HB/joFk5MiyVgr8
	bzEwybgFA1xD9dhR6RiWcD5Gh8sdf0FOmYzfgQQgs9h6CFEi9AGTVlQ==
X-Received: by 2002:a17:902:e5cb:b0:273:ef4c:60f3 with SMTP id d9443c01a7336-295f937c8a7mr29839335ad.4.1762238542615;
        Mon, 03 Nov 2025 22:42:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJMvyn7jgT+PxdsfFbbVRQ5B7QXJ0K1qxCUO7+4vhXbZ4XTwYzEH8ZwclKzQweZGQdlpbyWA==
X-Received: by 2002:a17:902:e5cb:b0:273:ef4c:60f3 with SMTP id d9443c01a7336-295f937c8a7mr29838995ad.4.1762238542085;
        Mon, 03 Nov 2025 22:42:22 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a0780dsm3294791a91.16.2025.11.03.22.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 22:42:21 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v7 7/7] qcom-tgu: Add reset node to initialize
Date: Mon,  3 Nov 2025 22:40:43 -0800
Message-Id: <20251104064043.88972-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=6909a04f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IgPCHI2mAnvcCQI4J_AA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: scIwpX6TiwQLleUhucPZDGPCyGMjs5Jq
X-Proofpoint-ORIG-GUID: scIwpX6TiwQLleUhucPZDGPCyGMjs5Jq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA1MyBTYWx0ZWRfX3fE380fo5vwI
 GvSO1SvhVASxqM7aNYuIkFCaoKGWaIBt+6aiPxyzQmldB0qx/n7B5tYzrtAYgn1R3Ml2Tk9eqey
 5g9imbblMKMewSWo66pzyhcdY2QNVRvOOOSg/zt5cIJJhgi5N4xLMQWqtGPxG4t8PPAgP9W7v6K
 906mlJwVX3/41g9+OK/D2MrCL9dtKdLO83sIa0MvKj7Qqr87CuFv2t1mjF7ifRlmUNAmVKfzFuC
 33GPDttyEbWHXnZgphaqSkrpIm/An6ulNJFAK62HXGl4IyjVQLLu7+4lS+mY5rgt+YCGz2Kijbh
 Yj9+MKxydfDxwY2QfCDVriaBFpQqI5wYlUmvwXRJmSedoCJ+Znz9pvfxKHOh2+nX/532XYBPjlO
 AQGbPttjfhCWFg+ijjoqEnlsr2H2cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_224223_922931_3D0C43DC 
X-CRM114-Status: GOOD (  18.76  )
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
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 75 +++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index 11b4d34153ce..9d20b48fba3a 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion	6.18
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/reset_tgu
+Date:		November 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 5db876c31a63..a164867c6b66 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -434,6 +434,80 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	unsigned long value;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
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
+	spin_lock(&drvdata->lock);
+	CS_UNLOCK(drvdata->base);
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
+	CS_LOCK(drvdata->base);
+
+	drvdata->enable = false;
+	spin_unlock(&drvdata->lock);
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static const struct coresight_ops_helper tgu_helper_ops = {
 	.enable = tgu_enable,
 	.disable = tgu_disable,
@@ -445,6 +519,7 @@ static const struct coresight_ops tgu_ops = {
 
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1


