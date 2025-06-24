Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288D7C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 06:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViTNhJOtGjt6lfMBtp1FlF2uEsyGJpyKBN1SPAXTMJ4=; b=p5olXx1UxWVG4qjotyizNskKrI
	c+S2d10VRf2DgTEnDAXkBKTp0sltevnUVVAP7PWNrZDDudalnGZzZH+pH5ZVJr13yd0/Tg2F1Ujnr
	qOsEMssAGuPTlFrM1FQVkGg4r3wXJeZWxLi69N8yqvSUFSKPutkCFpOA4QQgNE4j6ZeXoA0ZGSxrr
	4MqPyEzzi4yPsjO/OztojKB4Tzd3hOZxJ0TVlwKcF6gB6K2iAI+O3vuM98UqfwoJnieliJeDwNoSE
	mgxkL1ZyQ56q49dMPLe6PFcQsSgVuo20NOEPd0L06HAI5gOKzJV8RvH25QcbFnzbARmwqyvfHj9Lx
	Ngym2l9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwy9-00000004kdk-2IcT;
	Tue, 24 Jun 2025 06:17:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwmT-00000004jDD-3kws
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 06:05:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NIXR33011924
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ViTNhJOtGjt
	6lfMBtp1FlF2uEsyGJpyKBN1SPAXTMJ4=; b=ejweXddLN4cdGC90vxtxRWcRdLx
	RMM4f7qzZoQeV/H0MekdTNVpiYLf5SGw91kKougV3ZclEhoJ/gBJd8a8MssJINSN
	XbnSn8Xb+eR7OmOa4JHrv8hcoZfxKo+CqkAKYc/v2IPe4FutOPFHkjtQn/fbptUT
	1GhyjgUf830Bsyvelj+dw3K5/z+fe8M7VI2drwGZS928OdUbeZZWSvvaoGVu+lAG
	H2Q4yvvKWtbaLvt9YwdsO9Wot6yTOED0mZUpS5nopIFpwpcWj+a/AoSJWj5niwsK
	1f24fhNecJ6FIOUdMLF0/jRoXlOeIpMOhb968JBO9owi1cIWXwDYlrLq6Vw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec265791-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:05:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235089528a0so38743515ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 23:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745116; x=1751349916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViTNhJOtGjt6lfMBtp1FlF2uEsyGJpyKBN1SPAXTMJ4=;
        b=tsOgT7uFCpJMFhziFgfbtUZqAteJrhkEOKuqdmugUIDyrfNV7gp2ngpudGEShX4no/
         wsjLy7mcf66i+wCXnUZG004zA3kjJgOgWr2mAK9hA2bJHYAfb7GDKm9fWz9nGcXFM3kU
         GVIuP+75ljFfFBrLDX8AkkOJHfRInb4CAFAEmFi913ZhDDOJbza0kaXle274xHULwe5m
         YVOYu5fpImJF3crCJY6vUcqg3Y5pzPPGea1JISNbiBkieBq3tl+VyAT4CuSXnItLcodU
         7B0AMIh5zKwDFEKXZeoo0R7nyKZMbEOQ9AUuoGEc4N4h5VrIG+QH6NEBWuH+TJaAPHte
         7f5w==
X-Forwarded-Encrypted: i=1; AJvYcCWGZjGSdp9D/ImBQ4tcMefLhQTaWKCS8PlXMqD1Wz58v5HBXqIJTwjWOLw1Gdj/PtsKI4X4YzIfWK1bpQbr9HEY@lists.infradead.org
X-Gm-Message-State: AOJu0YykB39J2rlcBkfS98RTqqt9z3Wadm650CqagOH19DVhcvbPz1zz
	+ZYPMOZAY2FzDxj9FBGSEgPIaw6WO+KXI6Eo8Sh2AvzwZUR0a3rB/6Wqf1c5p8HRvnjLLnAHs5p
	EE1ag3T9iDMJE9oa7ddwmCwBhr2kWPKvzQp6MerMhuvB9Gx6fw9nrQWv6PjrGItZsbPexgjiZYZ
	W9Xw==
X-Gm-Gg: ASbGncur3/QIpvqpezp4yHebh7A/ryR38hPElMcfpJ9kMa+qNHTFCfm6oLo48D/PgeW
	ylWRsV7FsGAHq8OUAt2VoI8mfVJC4CavA6qCnt+MrbsQ63a6QL5Xdkklilg527LzZrIZPTPsSN/
	cOtwbLwTJ/364gq62ETej4+8h8zW4UDUqjOFbECVjlPjyEbLja3z4kBj2f2oI25MmoTQEWLfKQU
	1ocHJt3cVupf3USndv+P/2JrBE2EdBGZVwTyV2c2xVxIkQRYhsTaFWX/UNBiKO0jp5M7s7BaZZ6
	tmC3+u+CtzjrWo/qiqSPF0H+JMx1iLNm8nj5ZJfXKatb3Sb/uNTFckWz36zn11UKOtYoe1oOvL6
	DnA==
X-Received: by 2002:a17:902:da8d:b0:231:e413:986c with SMTP id d9443c01a7336-2380245eabbmr32408725ad.11.1750745115995;
        Mon, 23 Jun 2025 23:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqWPFCk1vGIK6OC6QmCXLMh+OHz10tmlUnDaYKRcbgjljEq4H6EvG36i6gTOPY5fL0FezOsw==
X-Received: by 2002:a17:902:da8d:b0:231:e413:986c with SMTP id d9443c01a7336-2380245eabbmr32408275ad.11.1750745115520;
        Mon, 23 Jun 2025 23:05:15 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:14 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 07/10] coresight: tmc: add prepare/unprepare functions for byte-cntr
Date: Tue, 24 Jun 2025 14:04:35 +0800
Message-Id: <20250624060438.7469-8-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MCBTYWx0ZWRfX65fvw7GLnpUy
 +tYqGQ4lMx7+msxpvsS7nA+vwDOB+xfdo1seO9v7E26fXb5dIs9zYpHksPRKGxAQeqhNaDGP6Gl
 p0LHgcdbAYUYWlx0ehDQwMWPt2lChzr/G0xrU8JKlEj3eKBYJnkLpv4fhzCNxg0erjPzh0Zo9NP
 nXk0w1UK3rXNqd93ZpjXPQqDUpNUqHYmGsEHa65ATqx5bcTbEOn4YurRQ9peyQhP25heVly8p12
 soUzksWKMA1Momqs45o4NLFV6xxNNMN5uCFqVJFcpiTYHYnsrIuX7XRlkSBynaILG4eIO/6FwBx
 Peqab1gwQL/DoOjNqjjU1ngvISEOk0hG95WwjCZwfRQSRlnF7W6fSIz3MFvqZoCnozC1SwD+eSV
 K5CFVO3G4vEXgg+vgu0pBbUf2xh1eusU1xr0EqBLwkm7DnZLHGr241G2j+BzxO60R2YTIsaG
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685a401d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xC7plfDI9GgKYcT3xssA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: CMl2Xs0hyugmZWxu_589u0CiFsNDv0Px
X-Proofpoint-ORIG-GUID: CMl2Xs0hyugmZWxu_589u0CiFsNDv0Px
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=850 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_230518_138523_6892265E 
X-CRM114-Status: GOOD (  25.70  )
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

Prepare for byte-cntr reading. An additional sysfs_buf is required to
receive trace data, as byte-cntr always reads from the deactivated
and filled sysfs_buf.

The unprepare function releases the additional deactivated sysfs_buf
allocated during the prepare phase.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 38 ++++++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 79 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  8 ++
 3 files changed, 121 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 8531bac79211..40605310240d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -229,7 +229,11 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
-	int ret = 0;
+	struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
+						CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	struct ctcu_byte_cntr *byte_cntr_data = NULL;
+	struct ctcu_drvdata *ctcu_drvdata = NULL;
+	int port, ret = 0;
 
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
@@ -237,7 +241,18 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_prepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
+		if (helper) {
+			port = coresight_get_port_helper(drvdata->csdev, helper);
+			if (port >= 0) {
+				ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+				byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+			}
+		}
+
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_prepare_byte_cntr(drvdata, byte_cntr_data);
+		else
+			ret = tmc_read_prepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
@@ -251,7 +266,11 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
-	int ret = 0;
+	struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
+						CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	struct ctcu_byte_cntr *byte_cntr_data = NULL;
+	struct ctcu_drvdata *ctcu_drvdata = NULL;
+	int port, ret = 0;
 
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
@@ -259,7 +278,18 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_unprepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
+		if (helper) {
+			port = coresight_get_port_helper(drvdata->csdev, helper);
+			if (port >= 0) {
+				ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+				byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+			}
+		}
+
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_unprepare_byte_cntr(drvdata, byte_cntr_data);
+		else
+			ret = tmc_read_unprepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 4609df80ae38..2b73bd8074bb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -2032,6 +2032,85 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	/* config types are set a boot time and never change */
+	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
+		return -EINVAL;
+
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		return -EINVAL;
+
+	/*
+	 * The threshold value must not exceed the buffer size.
+	 * A margin should be maintained between the two values to account
+	 * for the time gap between the interrupt and buffer switching.
+	 */
+	if (byte_cntr_data->thresh_val + SZ_16K >= drvdata->size) {
+		dev_err(&drvdata->csdev->dev, "The threshold value is too large\n");
+		return -EINVAL;
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (byte_cntr_data->reading) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	byte_cntr_data->reading = true;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	/* Insert current sysfs_buf into the list */
+	ret = tmc_create_etr_buf_node(drvdata, drvdata->sysfs_buf);
+	if (!ret) {
+		/*
+		 * Add one more sysfs_buf for byte-cntr function, byte-cntr always reads
+		 * the data from the buffer which has been synced. Switch the buffer when
+		 * the used buffer is nearly full. The used buffer will be synced and made
+		 * available for reading before switch.
+		 */
+		ret = tmc_create_etr_buf_node(drvdata, NULL);
+		if (ret) {
+			dev_err(&drvdata->csdev->dev, "Failed to create etr_buf_node\n");
+			tmc_delete_etr_buf_node(drvdata);
+			byte_cntr_data->reading = false;
+			goto out;
+		}
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	enable_irq(byte_cntr_data->byte_cntr_irq);
+	enable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	byte_cntr_data->total_size = 0;
+	byte_cntr_data->irq_num = 0;
+
+out_unlock:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+out:
+	return ret;
+}
+
+int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
+				 struct ctcu_byte_cntr *byte_cntr_data)
+{
+	struct device *dev = &drvdata->csdev->dev;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	disable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	disable_irq(byte_cntr_data->byte_cntr_irq);
+	byte_cntr_data->reading = false;
+	tmc_delete_etr_buf_node(drvdata);
+	dev_dbg(dev, "send data total size:%llu bytes, irq_cnt:%d\n",
+		byte_cntr_data->total_size, byte_cntr_data->irq_num);
+
+	return 0;
+}
+
 static const char *const buf_modes_str[] = {
 	[ETR_MODE_FLAT]		= "flat",
 	[ETR_MODE_ETR_SG]	= "tmc-sg",
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index f6b05639aeca..f95df0a34ad6 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -14,6 +14,8 @@
 #include <linux/refcount.h>
 #include <linux/crc32.h>
 
+#include "coresight-ctcu.h"
+
 #define TMC_RSZ			0x004
 #define TMC_STS			0x00c
 #define TMC_RRD			0x010
@@ -357,6 +359,12 @@ extern const struct coresight_ops tmc_etr_cs_ops;
 ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 				loff_t pos, size_t len, char **bufpp);
 
+/* Byte-cntr functions */
+int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data);
+int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
+				 struct ctcu_byte_cntr *byte_cntr_data);
+
 
 #define TMC_REG_PAIR(name, lo_off, hi_off)				\
 static inline u64							\
-- 
2.34.1


