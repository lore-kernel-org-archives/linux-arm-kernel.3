Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9EFFB5EA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBNh3oLrOSXThAtj1dWN5UGz30m2LOoz6aWF9A87UjE=; b=ZRRJy/KtYN6yNy2LkdgfJROFov
	asEjwOjh5N0RzNPDJAY4adBz+1lC3bUiPfGG780pIoK2FvU0EmtofDDViD6utoyuM+t8IXxejtGHa
	fKU+qa9CYN3greKoLlai0vESRwz34G2ewBARAqlfOv4V2xNQ3JXkJDj8nsn6PVExpAt6I7VrlZli+
	uCmGr79b2DUcfX6IfDpuRasKmNehoYmi/0zs9KYalNTcdChZ7uw97ocCsyG3qXtQ5CBwWi2ddjrQU
	C9ggtiTNQv0FnY1EKyevS25NMadrWndJ6dKQ87k1JHZW+AHctfLY7ilJuT1KJvDNj79U5CKZk011s
	qt5VQgag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2L5H-00000005J5P-0FN2;
	Tue, 17 Mar 2026 03:27:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2L5D-00000005J29-0wNP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:27:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GM1nT72375054
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yBNh3oLrOSX
	ThAtj1dWN5UGz30m2LOoz6aWF9A87UjE=; b=cgDChaCQw7DjwxHdMWJY35g7zGY
	qBtCDrT7wASHGF5h8BZ3thb0jqgQj0AvgEkQRX7w8TehDGzfyiBFsmwQGORxbnzh
	E7sTGaBizb6YqsIX3DcVMhhMAtfxyq0XD03Jj7bjOcE0a+/1kkQau4DNM0l8HIb3
	diE3zJGzHuzob1t+b0GSAbi9CjWHv9Oq8+tPaJcaqM1OWNMG3+yu/c+BR2I2HSY5
	U9REZxSw05J3m0wexnjM8Mb3h/dq8vtHXjfkBYj400tvdyI4iVh1kQSBFpmSLhMJ
	HMkYbQTM+PTPLldN+8Hi5TgMRXI4MQOu5Il231OOhpQGraeKump1ZvTjhFA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkby2cqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:27:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bead0a9123so19454078eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 20:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773718022; x=1774322822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBNh3oLrOSXThAtj1dWN5UGz30m2LOoz6aWF9A87UjE=;
        b=IKrnOaRUqkQz1dJYfRVofAl2mZalK143PQMSrEUMKCjg2LXYiT04m6SRKY8Cv2bvMt
         KnmX8ab/WLMXTPuJr7Lrx+aULX0bINp/B0Udz7NuZDYNT+427FGLgR0OelyML9L89wJH
         Vrfr59OXBQRszuDc/LQ7+1P/5dUUKUU8m12s7aYDwLf6rSOjscm9/vGmHcaxTs2uNKzu
         VYpDHqCdHmrWjCPLZ9qy66ZJW9GMEb9brTv68CsEO4JWnHz1CDWBdJ6srcYoRN8N5QuF
         KqqY/ON1ngCPedjjFB5TqoWkmhzv/Aspk6elR20pkdxF+aTkkhC7339NpMjNfa1NM1Zt
         Rhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773718022; x=1774322822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBNh3oLrOSXThAtj1dWN5UGz30m2LOoz6aWF9A87UjE=;
        b=fOe2zn3YHZ2AIAUW6woEcyfrJAYoF8Ah/GMYXb0O+/osgC0fhMQCAjoA8VleuvoPfH
         wdMpXLVDqawTqlLs+rjU/OFlIKeUf5oskYWIp8eoS8HIV8bf8zX3yKquvdqX7ZDxtaJo
         WVQDmF+6pw1HbxDKqWZBKLAZ3jzu2AUkwN075cD/mNHfxMO1UcoEj6oqQW0nqiiSYZui
         0Sbw5AYsgtuhXirGFFlFYifhF2JZknTBBZH5iKM7iTXMTneO9Vc8rfCFIhSJAJuant36
         FA04Or7YGusxrvnELduQ/o3JqEvt2WjPKyaPk4ufFogmOjtC3s694tTsOPvJrVfVagNm
         UJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrPdloU3BRNVpNqZU9xzKX9hT5y11HcVoqSSp7i8f39//9HhtAA+PKcTEoFUlvqubhRkVtJ+gVpZubZ/l65gRB@lists.infradead.org
X-Gm-Message-State: AOJu0YyRNT0/mhV89RLY5tiJM7RLM67yIWp6OROBiHTn90yyvjs0Nn51
	wBSotDwq67/mWDbv/HeSceKeBEytnuHrk4j/ABDDn+RU8O9usJ528r+HFMRC6Mkim1y8Lb45zkq
	3Z0hnAcFoGNXH98wzjsiKXgs+CUo8OoHbM/8R5cV38PwHkc5HQLUFPO4VUkYxLT8Ru56dhkEYZ5
	FLPg==
X-Gm-Gg: ATEYQzwCgxEvln9GoSp031agM4jH7hGzu7kpeCqKHdu4O2O5UytZ68DDui1ODKSd6Ft
	yEwQNcHAx+lYk3biKYe80KjKQSDBl3dqlYNlyrqcTof6uEh1ZjuWXAB2ySrVtsA01YSve8T3Ypw
	eMK2sJr+dfJ1U9x+gtk5NkBgogNuCFrq8g4VjE1FMZp1SgOR+Qo+XEIORh/f+1Pzy8OIKEzcEPM
	t6nl+h1PoYq9EgGFo0zwLGWbfAIh3ahz5OPXDHZQqh/KUu3gU1ZbK9dSjKroJeGoSVcVI8tWmGE
	L0CJw8OJYWtXzU+avAfNOlHkSXQFMW78Mb9jWTMQJu9bl5BvXIlT9ZfGsoiUWPRI2FVfFczgw35
	wDNWuvNNSbiF/C+hj+ZoazYcVj+rEpX49E+KkRiEXegP/0EM9twwKvQcG1t7S35MOdRKjk2q/oI
	hU
X-Received: by 2002:a05:7300:e208:b0:2be:a440:7550 with SMTP id 5a478bee46e88-2bea55edf88mr7715046eec.28.1773718021969;
        Mon, 16 Mar 2026 20:27:01 -0700 (PDT)
X-Received: by 2002:a05:7300:e208:b0:2be:a440:7550 with SMTP id 5a478bee46e88-2bea55edf88mr7715023eec.28.1773718021238;
        Mon, 16 Mar 2026 20:27:01 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3ef844sm17445895eec.15.2026.03.16.20.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 20:27:00 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v12 4/7] qcom-tgu: Add TGU decode support
Date: Mon, 16 Mar 2026 20:26:36 -0700
Message-Id: <20260317032639.2393221-5-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: k5qhicJwhpL23aw_H8v4Je8YOwaa1Fmh
X-Proofpoint-ORIG-GUID: k5qhicJwhpL23aw_H8v4Je8YOwaa1Fmh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAyNyBTYWx0ZWRfX4ihY++5XWJ2n
 B0+NO3kPlB2Iht80rvz801b6p/gWOvtuZ86TT277Y1LnHyAqDyfA/Kk/6Pvy12PVV7JXny1Okir
 yWlDrSAohu4bGciET/awQKM94j1Yf5VtPqrgydiOpa8BSg+0/nBH89/c/S+tUUAGG/9d1e0Xf/p
 n7SeQWh/a/TKtnNJQ7cVuJ4a5/0PHPUSmr/NQNhdI4OgLno2Z4okXktZRRPZblSqh0tP39NLH1p
 9dS0L7Xjlrkkb/kUBzpvP7n1msTqSkLXs1iy3v92OKKg5y1+heVXLxGBBOvZo2JWvf0B33wAbfP
 4PO5RqOMR6EENLSF6rvd8NSrnyi1+HpuuqHrKyE4rTwoiZc4Q9sboxNnB5rHxDYxTiKxYZxuWCi
 0yWYtsmRBmoMBh892HBwg8dsZiAgkJRJy9T3t6ikQeHZxAVG0LTtASmwQ4yfSW7sJV+oLKGzzPv
 VRFPCIzb5vuvgxnwn4g==
X-Authority-Analysis: v=2.4 cv=ZpLg6t7G c=1 sm=1 tr=0 ts=69b8ca06 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=DXd_79bSlwW_W-LZS_AA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_202703_289533_2DC2B55A 
X-CRM114-Status: GOOD (  23.24  )
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

Decoding is when all the potential pieces for creating a trigger
are brought together for a given step. Example - there may be a
counter keeping track of some occurrences and a priority-group that
is being used to detect a pattern on the sense inputs. These 2
inputs to condition_decode must be programmed, for a given step,
to establish the condition for the trigger, or movement to another
steps.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 157 +++++++++++++++---
 drivers/hwtracing/qcom/tgu.h                  |  27 +++
 3 files changed, 170 insertions(+), 21 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index a1dfcd366d92..18930743c99f 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion	7.1
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:		March 2026
+KernelVersion	7.1
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the decode mode with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 14d6ad410d89..85fe1140eab5 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -18,8 +18,33 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 				    int step_index, int operation_index,
 				    int reg_index)
 {
-	return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
-		step_index * (drvdata->num_reg) + reg_index;
+	switch (operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return operation_index * (drvdata->num_step) *
+			(drvdata->num_reg) +
+			step_index * (drvdata->num_reg) + reg_index;
+	case TGU_CONDITION_DECODE:
+		return step_index * (drvdata->num_condition_decode) +
+			reg_index;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int check_array_location(struct tgu_drvdata *drvdata, int step,
+				int ops, int reg)
+{
+	int result = calculate_array_location(drvdata, step, ops, reg);
+
+	if (result == -EINVAL)
+		dev_err(drvdata->dev, "check arrary location - Fail\n");
+
+	return result;
 }
 
 static ssize_t tgu_dataset_show(struct device *dev,
@@ -30,12 +55,26 @@ static ssize_t tgu_dataset_show(struct device *dev,
 			container_of(attr, struct tgu_attribute, attr);
 	int index;
 
-	index = calculate_array_location(drvdata, tgu_attr->step_index,
-					 tgu_attr->operation_index,
-					 tgu_attr->reg_num);
-
-	return sysfs_emit(buf, "0x%x\n",
-			  drvdata->value_table->priority[index]);
+	index = check_array_location(drvdata, tgu_attr->step_index,
+			tgu_attr->operation_index, tgu_attr->reg_num);
+
+	if (index == -EINVAL)
+		return index;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->priority[index]);
+	case TGU_CONDITION_DECODE:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->condition_decode[index]);
+	default:
+		break;
+	}
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_store(struct device *dev,
@@ -54,13 +93,31 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		return ret;
 
 	guard(spinlock)(&tgu_drvdata->lock);
-	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
+	index = check_array_location(tgu_drvdata, tgu_attr->step_index,
 					 tgu_attr->operation_index,
 					 tgu_attr->reg_num);
 
-	tgu_drvdata->value_table->priority[index] = val;
+	if (index == -EINVAL)
+		return index;
+
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		tgu_drvdata->value_table->priority[index] = val;
+		ret = size;
+		break;
+	case TGU_CONDITION_DECODE:
+		tgu_drvdata->value_table->condition_decode[index] = val;
+		ret = size;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
 
-	return size;
+	return ret;
 }
 
 static umode_t tgu_node_visible(struct kobject *kobject,
@@ -77,13 +134,26 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 	if (tgu_attr->step_index >= drvdata->num_step)
 		return SYSFS_GROUP_INVISIBLE;
 
-	if (tgu_attr->reg_num >= drvdata->num_reg)
-		return 0;
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		if (tgu_attr->reg_num < drvdata->num_reg)
+			return attr->mode;
+		break;
+	case TGU_CONDITION_DECODE:
+		if (tgu_attr->reg_num < drvdata->num_condition_decode)
+			return attr->mode;
+		break;
+	default:
+		break;
+	}
 
-	return attr->mode;
+	return 0;
 }
 
-static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
 	int i, j, k, index;
 
@@ -91,8 +161,10 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 	for (i = 0; i < drvdata->num_step; i++) {
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->num_reg; k++) {
-				index = calculate_array_location(
+				index = check_array_location(
 							drvdata, i, j, k);
+				if (index == -EINVAL)
+					goto exit;
 
 				writel(drvdata->value_table->priority[index],
 					drvdata->base +
@@ -100,9 +172,23 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 			}
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_decode; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_DECODE, j);
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->condition_decode[index],
+				drvdata->base + CONDITION_DECODE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
+exit:
 	TGU_LOCK(drvdata->base);
+	return index >= 0 ? 0 : -EINVAL;
 }
 
 static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
@@ -131,18 +217,28 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
 	drvdata->num_step = TGU_DEVID_STEPS(devid);
 }
 
+static void tgu_set_conditions(struct tgu_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
+}
+
 static int tgu_enable(struct device *dev)
 {
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	int ret;
 
 	guard(spinlock)(&drvdata->lock);
 	if (drvdata->enabled)
 		return -EBUSY;
 
-	tgu_write_all_hw_regs(drvdata);
-	drvdata->enabled = true;
+	ret = tgu_write_all_hw_regs(drvdata);
+	if (!ret)
+		drvdata->enabled = true;
 
-	return 0;
+	return ret;
 }
 
 static void tgu_do_disable(struct tgu_drvdata *drvdata)
@@ -252,6 +348,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
 	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -259,8 +363,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority;
-	size_t priority_size;
+	unsigned int *priority, *condition;
+	size_t priority_size, condition_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -278,6 +382,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
+	tgu_set_conditions(drvdata);
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
@@ -300,6 +405,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->value_table->priority = priority;
 
+	condition_size = drvdata->num_condition_decode * drvdata->num_step;
+
+	condition = devm_kcalloc(dev, condition_size,
+				sizeof(*(drvdata->value_table->condition_decode)),
+				GFP_KERNEL);
+	if (!condition)
+		return -ENOMEM;
+
+	drvdata->value_table->condition_decode = condition;
+
 	drvdata->enabled = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index df570c89ffd7..987ea07bd618 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -16,6 +16,8 @@
 	((int)FIELD_GET(GENMASK(17, 10), devid_val))
 #define TGU_DEVID_STEPS(devid_val) \
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
+#define TGU_DEVID_CONDITIONS(devid_val) \
+	((int)FIELD_GET(GENMASK(2, 0), devid_val))
 #define TGU_BITS_PER_SIGNAL 4
 #define LENGTH_REGISTER 32
 
@@ -49,6 +51,7 @@
  */
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
+#define CONDITION_DECODE_OFFSET 0x0050
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -57,6 +60,9 @@
 	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
 	 REG_OFFSET * reg + STEP_OFFSET * step)
 
+#define CONDITION_DECODE_STEP(step, decode) \
+	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -68,6 +74,8 @@
 #define STEP_PRIORITY(step_index, reg_num, priority)                     \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
 			reg_num)
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -91,6 +99,14 @@
 	 NULL                   \
 	}
 
+#define STEP_DECODE_LIST(n) \
+	{STEP_DECODE(n, 0), \
+	 STEP_DECODE(n, 1), \
+	 STEP_DECODE(n, 2), \
+	 STEP_DECODE(n, 3), \
+	 NULL               \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -98,11 +114,19 @@
 		.name = "step" #step "_priority" #priority \
 	})
 
+#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_decode" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
+	TGU_CONDITION_DECODE,
 };
 
 /* Maximum priority that TGU supports */
@@ -117,6 +141,7 @@ struct tgu_attribute {
 
 struct value_table {
 	unsigned int *priority;
+	unsigned int *condition_decode;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -146,6 +171,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @value_table: Store given value based on relevant parameters
  * @num_reg: Maximum number of registers
  * @num_step: Maximum step size
+ * @num_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -160,6 +186,7 @@ struct tgu_drvdata {
 	struct value_table *value_table;
 	int num_reg;
 	int num_step;
+	int num_condition_decode;
 };
 
 #endif
-- 
2.34.1


