Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0292FFB5EA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFXI9W3wYf+aodd6TigXJ8+gpEqreWaR9RarC30l04Q=; b=GFTXppVWafNdZ8+J/lFMaU7xjW
	Envf7qLRdqunCLV2impBLr38LGgvqav57ldHOGi9heKS5vJpP7EHnJyecsQflyqRIcp1xNFdB7FFH
	1smfNllR3of+EHXxS0CI6GkQXoIXChEmbPcXWNRh2o316Jx+uYhCy7V49xgHmqFqjUUfWtCNAzCsP
	GCIUXPkgBUSiKyJjRsL6Dz3MuBr7BcG0z2XCjNCSi2NfGzRORrb78rH4D0GJrtlezNNrswNroeEG8
	sUIoAu37i5MgUPwUcN8BkYyUsQ+yFyU4Y6VdGVAbKW3qxYKu4fmaYX9C04vXpq3zSX4xv2htO00B7
	/4l8dicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2L5V-00000005JGL-2Yep;
	Tue, 17 Mar 2026 03:27:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2L5S-00000005JDO-2BIA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:27:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GM2f7T041567
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QFXI9W3wYf+
	aodd6TigXJ8+gpEqreWaR9RarC30l04Q=; b=JmwBrShalf2t0vTfWbkQzsc/t+9
	vi850mwVYTyiA8gnWLOmxiALBnxpId7LoKl2KMOGqwG+qGiNO4dLaYMs+C6Ka2rn
	SRmeuABSdyuhRb+urVDNT29JzSVYPZuBJam281/rAicx+b/rSe3BwrfqZeoZPNXX
	7G1zL7eyY5+Cn/FYTxCOyvqWxDCWbZSF30YYQlyxVwepbqAz3aMOVJAViPVUQhZL
	Bg83gBi2lokcD5ChHi8b0vPux26Sv94BTNeYrLycQY4m6HcJN41TbPPRODZai0lR
	6lK2Tgh8DoFr5lGPa65bSF1czFpMoqToLdsvMSkXGMrfueGmagAs0bRzztA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt83srj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:27:16 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1276e71652fso5954575c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 20:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773718036; x=1774322836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFXI9W3wYf+aodd6TigXJ8+gpEqreWaR9RarC30l04Q=;
        b=GDNOdazwcOxJpRf+8jpMJ7nAY0k9rKqGs4Y05Ap2AkMK9eUgWMenEjIjr54yWsO5KK
         8H8Ph66Hf8ShH1KOUidbGSyy6gvyrzaf8mBVlUkSttEzkFF9zk51Yaz+XB97xUk+EFW6
         NWeDOtQfiakiI+aynVHoALG9bZsGrlbqtMgxj4PXW5alvpd6m2GKzq2xntr27OsJ+ifO
         EUjmZZUhpvC+zc3SwXQnPtIuWH9xXtG/oeHByys72RbcIaav5vrCZ2Kd9PPBG8a5++Rz
         dFpKxwSVC2GuxsF5+51lfGgPFNow7YEg1lA4wS6UhGU0HrTq/MqKX8s/rb81/yLrcAtN
         q7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773718036; x=1774322836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QFXI9W3wYf+aodd6TigXJ8+gpEqreWaR9RarC30l04Q=;
        b=o9FnNZpUW06BC4pMXM6n/LUAf+RBIzN/1P9pJvsvcMm1IRSlA7ywkoz4nN2vNuRL3s
         2oUmiqIMF73omZi3M1FARAjouaYRICMHVCArx7yNKm5drjIY8yVQUe2+rFHiFuwH+gcQ
         gpZOhtZ+VWlFASVPUnae4JqNvCxRPpMIighGPmvEx7afy7PsadUMeIp2qeAZ/yKpJLvP
         SdgVWcGuNu5kxu/gQ5YIugwi/6Gwz0FpWgVm1rCC/fm4RNaOxkFcuAYKgXy+xqueQxN1
         +/jeDbosgVA56qf42l8oLGYJ2uKY+zdHB0fi8W0mORM0DNQGz0VQ6oznwS9EViolXQeU
         SHvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv/QIgjxebTykjpO1nlxGtnq3fS1Wa7Fnq2u8fNBVRbLC2S77oLfwIKJqKGahGIWnm5AWYW5FG0YuUWIVXbTzY@lists.infradead.org
X-Gm-Message-State: AOJu0YxoM+J8TgCpLf+PG4BSU5fdgsA1ezusc77j5p93SqAgBMABibYi
	TWC+cRrmpPaakOXAKwGip636YCiXMbpfRDSQauIj85EIhfo19n+OHxeAS27BqfjhQMswm/iHPYp
	WMZ8JR5MJK7SIwy0+zA2Czh7FUBBHPDJv6fcQFi7kZ7A21dxQjJ+iUTnLlTJK9YsZvQnMDSObF3
	2Otw==
X-Gm-Gg: ATEYQzzIIqQbCuyggSGw84Z2IxxED24hvkALzhzVJCFiigGBQJ3vq5HwJmS7IiYTNo4
	tpsNFbloqUHtIgOv29Yc2k+eV9O53KdxhgBtovMEX26mXvpm6YulSi/DAHjr1H5pBey1OsmKfE0
	9do8dY+I+94VQiPvesfl69RVTbwKOOKpE0hg8qiM2PG+tM5eDnTVH2kixniKtdPG+YOD8/6WN/F
	O6+eyXvH5O42iqCxk74+P3BgXEQShZ+nUNTCaJKo5Yb2VpAHACm3QAaPsk0g+EhoHbkFhDF0oE+
	FjZ6mspCVI7dx9mGuywGvqTvkUgRigDAfl90sColmu78Y/Ys2IWiEdd6QRcXeUlBlGprWcVWcNe
	zG0oAlsK0piGObGEcuFd7DJjHc6qqzAKGmS2su9uQZ2jsYBQ9U0dwnt0hkNWnUJAQtaH0PmYrai
	YP
X-Received: by 2002:a05:7022:404:b0:128:bae0:e043 with SMTP id a92af1059eb24-128f3df1710mr6715215c88.31.1773718030836;
        Mon, 16 Mar 2026 20:27:10 -0700 (PDT)
X-Received: by 2002:a05:7022:404:b0:128:bae0:e043 with SMTP id a92af1059eb24-128f3df1710mr6715204c88.31.1773718030296;
        Mon, 16 Mar 2026 20:27:10 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3ef844sm17445895eec.15.2026.03.16.20.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 20:27:09 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v12 7/7] qcom-tgu: Add reset node to initialize
Date: Mon, 16 Mar 2026 20:26:39 -0700
Message-Id: <20260317032639.2393221-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xXKDMCwbj_RVysbWGirxN-8Jx5clMQA3
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b8ca14 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=IgPCHI2mAnvcCQI4J_AA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: xXKDMCwbj_RVysbWGirxN-8Jx5clMQA3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAyNiBTYWx0ZWRfX6BC0BqxnHiVO
 ztrGscVnndj8fSuhBEzzhg2kfVxAeeC2e6GLechoXFII2jiS5hSjyWaJ5CBH4i+ZGStmx3QRdCx
 mi67IyJN54paCZsCsE7S+k5S2khfme4wQLaqplRgMxB7196SDEwhGZ6VuNVbKeQT1vA/yeyDuQr
 YbJKHY7Ta0OzYi9lBEZhyLiJz1/7S1LhR0w52c0AbHet3cCrzZG+K106f9G9hC0zch1mrIDDkLg
 nHA12mZ9YEDCww6+ElrWHD7QYcFJfqnPLq2M/EL1etWHrGdMfcVesmiru3Rg5DyJJ+2b4a5V+Ua
 jxRw1QnCVgaOi/Cbyg6CegzbGgs9yMf9VrlkPWBuCIUhUzyJnWeGpu952i+8DGxg510TJA+Rg2C
 ynk2EClVx8hBHWehGvL9Lf9pTeFpgCO6ZQEAdEFALyqxbzI36c9/KkSuhle6tNw0jLfhJCHEwzA
 z6AUW6ArBT8LrHjVpcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_06,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_202718_684348_CD350D9F 
X-CRM114-Status: GOOD (  17.30  )
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
 drivers/hwtracing/qcom/tgu.c                  | 77 +++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 5370882333bc..1dcb8fb71cd9 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion	7.1
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		March 2026
+KernelVersion	7.1
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 4539415571f6..e28e6d27cf56 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -410,8 +410,85 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct value_table *vt = drvdata->value_table;
+	u32 *cond_decode = drvdata->value_table->condition_decode;
+	bool need_pm_put = false;
+	unsigned long value;
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value != 1)
+		return -EINVAL;
+
+	spin_lock(&drvdata->lock);
+	if (!drvdata->enabled) {
+		spin_unlock(&drvdata->lock);
+		ret = pm_runtime_resume_and_get(drvdata->dev);
+		if (ret)
+			return ret;
+		need_pm_put = true;
+		spin_lock(&drvdata->lock);
+	}
+
+	tgu_do_disable(drvdata);
+
+	if (vt->priority) {
+		size_t size = MAX_PRIORITY * drvdata->num_step *
+				drvdata->num_reg * sizeof(unsigned int);
+		memset(vt->priority, 0, size);
+	}
+
+	if (vt->condition_decode) {
+		size_t size = drvdata->num_condition_decode *
+			      drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_decode, 0, size);
+	}
+
+	/* Initialize all condition registers to NOT(value=0x1000000) */
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_decode; j++) {
+			cond_decode[calculate_array_location(drvdata, i,
+			TGU_CONDITION_DECODE, j)] = 0x1000000;
+		}
+	}
+
+	if (vt->condition_select) {
+		size_t size = drvdata->num_condition_select *
+			      drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_select, 0, size);
+	}
+
+	if (vt->timer) {
+		size_t size = (drvdata->num_step) * (drvdata->num_timer) *
+				sizeof(unsigned int);
+		memset(vt->timer, 0, size);
+	}
+
+	if (vt->counter) {
+		size_t size = (drvdata->num_step) * (drvdata->num_counter) *
+			      sizeof(unsigned int);
+		memset(vt->counter, 0, size);
+	}
+
+	spin_unlock(&drvdata->lock);
+
+	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
+
+	if (need_pm_put)
+		pm_runtime_put(drvdata->dev);
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


