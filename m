Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B74D232CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 02:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNj9IldgTwwHcf0TlwaBwN96Jq68NG1f1miPWfIzHS0=; b=EKyTMzRqgT/Xu0rBmsfUrC7ihI
	O8JPZrRNMlfcHqJEY2y16YY5MfDhrT3jno8yLAwlPftFIDykjiEqzJbEHVMSbFXqiFKB0TbVKVaB9
	bgfhY6ENfw3M6Ic5JEtAdv6sUaZDDiVqBreFW2tYZDwmTTyXQJgZ/S+gIW4aFQ9myd9O2MxXokLg8
	swmOQmcMIXy3otfCY4dawhYbmjswn7GRTRpT0nLW9G7eQEkr+T/EzM6RHF9sMpu6SMfp6HZmiHdf1
	z9HjKno7IQCD2fxv4+FI7FZdOZuIWOqiqY6cVg55t28W1/s57gED7YAmXw5bligcZ+9y0dshBNG5T
	4dni1QMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1zI-000000016ja-2ZkQ;
	Fri, 09 Jan 2026 02:12:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1zD-000000016eS-3ety
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 02:12:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608IUXo82986455
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 02:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UNj9IldgTww
	Hcf0TlwaBwN96Jq68NG1f1miPWfIzHS0=; b=XRopE8huQ2mmSOHitPHwYKEPGIx
	uz7XH0kJd7/L7BH95n0PlXPjHq8ARD16uLC58gAfdXrvm5nseWKm+9HwSPSRwi53
	DBwQeEs7UgL2UwngiurCUvXdXeSAtrMttDl0wmR8v/u3zA6HAnoHnRQnC/RNa4Y1
	vEM8h8ggVHS4lrzWtilo8baMZ1amESQb1AM/RdrNrzoMvTTF+mCOsWCqFJMiLyDp
	evltOXvpSwy92JX/mE1yFCPQU15wTnJ6twIQEkuAeZfW/PCq4JuWzP8J9Wqhl20m
	dS0NKMn1p+4pHHHJLPpPaZnAh5pLlxEJakS0qDuBE+4RAEoN5CwGvJx9jWg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjhwx11tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 02:12:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae25c02e7bso10001398eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 18:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767924742; x=1768529542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNj9IldgTwwHcf0TlwaBwN96Jq68NG1f1miPWfIzHS0=;
        b=AjfDYmwYkahZkIWodRA8peyqiBvtlwmBARt9U7uOX51ZKx9cdv1lxIdWd/UQgGRYay
         unVJ8hddhZR4adWPjgi/k+ZQbmhRCxIjPQhFenxkK1FUtauqKg+EcTCR332pjJ+TwgLp
         lsy+NNWrCyoCUWGFVv03gAjIZfMBBlQmhAn4hQUk0skYBjGo/nbt6Gw2/3IfArfatuMw
         LURm/LuSd2hLRrHr5c1T3SkyP7S5MlSChFKwK7nvVUnVdAXFGMXI55HS1E4I4HeKFBco
         RbXnWL6IMRKJ2KnJbMwUZBT9XCbknmguOChbeBZqJ1ot9R40brJdruIQ3NY/8J6PKdwg
         lSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924742; x=1768529542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNj9IldgTwwHcf0TlwaBwN96Jq68NG1f1miPWfIzHS0=;
        b=L37rAuSRWiNldVzrPdtwLlgJelStzJyzj/l9FsbhNKYJRNkgOqbub+CJrNLxGF9czD
         jX7ubcv3VQEwiBPhzflzhQrwzJciwZkGfOOUE6vSAEEV5dUhPmBsvXCvX0ElEmckN2OG
         QR6Sx3jjphR5rzhJ4yoWm8NjYh8P10FSzB6b/SBnxp5U3QJXhqNe8X0HUiXL4HyxIZax
         SzaOXXHPRuM1lpWcAudzJ0tJPTBwQ/TXD4BsfwNhisM5Mr/XVf6KGf8T4A9wRwMw7g/z
         WrmWBMyxE6VvoqXP038XQOUgKaHlMDRBtQL9PaxNDohx0SiNhlPP5qPUXiodFJdRWwVl
         vHiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnRNGxrKq2iDK1yDMShi7AJxY4OZtprLYv8yhQNGkh5U/vOZLCW0+Z4GaewFQHURE/H473xDrsn+5gTQ9HsxYM@lists.infradead.org
X-Gm-Message-State: AOJu0YyL3sl0GPliFb9rzwSsYQAs1taRsGtKPH/4r7ZP8zj7OOPQQlqn
	tBTj6It7auoy3QsiWDDxT5FrYyml6g22riRz3oa/QLhe1ZCWlsTQ1k7F5MmjEGwjdLz2ItDydVV
	pObY4pZQAvBql4CBVK0gahSjfaqf4Vaksc/f6WWALffOWLS28spaf+EC/2UeQoSklRpM29ITmP+
	qYdg==
X-Gm-Gg: AY/fxX5nz13/KuDwIIHYmvixBgR38XjuEFJe6vlfehdVXWDveUzxbQMzmFqxXOULUpx
	hHS0ZiOIuyeKE7thAnLdPLLlK7emtV6wVlaP66cb2dkGarYPXnHEAQ3Um3AXkXMEneqils3/cPf
	WSt4jsr86PQJBJWDzKdDnhVlq31DUpiw8At0fhPMzXRsJAjnWuzDo7RKQZN99nezMYx2IIkk18z
	WEoryMHjxolzdmvAl67oLrbqeCVQFRH3Msdb/raSvZkOl7I0OmMut5tumSmiRLNMzQMCmzpw1FM
	vDmjTFGe2Oj8u5VdVluI1OcXCsECARUMJQlawiWpveXOfFUoqc+gkkWy/LaI0dPD6vJty3agg2T
	9A8q5loEKY0BhsPjCuafoY9YQxr7LqyUd14DUSoXWxRBpR6U7diWcH/ncpFqeT335
X-Received: by 2002:a05:7301:5387:b0:2b0:5c02:7516 with SMTP id 5a478bee46e88-2b17d24d19amr5467612eec.15.1767924741881;
        Thu, 08 Jan 2026 18:12:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQfTti3+ws20Sqrv0AXLPG8dqfyhqRGOTHJYP7pS9+6hYpKG5AapDxym6UcH2zDfuYgG6C+Q==
X-Received: by 2002:a05:7301:5387:b0:2b0:5c02:7516 with SMTP id 5a478bee46e88-2b17d24d19amr5467591eec.15.1767924741341;
        Thu, 08 Jan 2026 18:12:21 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm9459111eec.33.2026.01.08.18.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:12:20 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v10 7/7] qcom-tgu: Add reset node to initialize
Date: Thu,  8 Jan 2026 18:11:41 -0800
Message-Id: <20260109021141.3778421-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfX1aDfh64DEDIX
 FHIEzaZoojDH0Rs1mSBYFCGGWjKz48KPmk5j4t5jIF4hH33wMaKNXTkxIOSPHliEHgpCZ/ABuBO
 VWPiSJ4lkf1yb+5xGp8AsSM65L2zGHABE39xS8rU0TkOsiirCfC4WTNuUzRjIv5k1pJy+uvnn3I
 sujKhnHiGRQxS8fXQNv7fFiY2wWJ4JKI5COO/i+9wRR3vF2S7jrUicL3iDHRf9inrHy+aHcPlLc
 PFCV4ZqWc4R3vyM4Uz7nS+yTwEQ3SDimYY3JduWCP8SUfgcPsxG/ZwyEn19yx1yrPtS7i4Onz/d
 7WtYYxlWqkYAlhgAf04VWlLXuLwKyKd8rtIn9Kdp+65TwdrwK8TT1gBdAQdAgqFwZXBGBMqpU84
 y/miruSVdyZNOmS9ReXMXKWB+G1RVD8bHWrO69Iq4m29p4xsOY+qWMvJcXRzc3xdFCpuM0Lqg6d
 D30fcFaWhqAd8IL8mTw==
X-Proofpoint-ORIG-GUID: EOKMZn_HxXwJoBeIpMcAUU_4nq1h-Y-e
X-Authority-Analysis: v=2.4 cv=ENILElZC c=1 sm=1 tr=0 ts=69606406 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IgPCHI2mAnvcCQI4J_AA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: EOKMZn_HxXwJoBeIpMcAUU_4nq1h-Y-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_181224_055116_85691AB9 
X-CRM114-Status: GOOD (  17.43  )
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
index 61b5a08bdee1..fa2618b31ab9 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion	6.19
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		January 2026
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index a3d9c3c4e28a..0a45ff78858b 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -424,8 +424,82 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	unsigned long value;
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
+	TGU_LOCK(drvdata->base);
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
+	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
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


