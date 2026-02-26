Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465E4FD460A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 02:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D93wpyNGQT2/lKSYk4tEdicwazQlUCt3v5pJwWaeHr0=; b=I1uvyBfdvYQ3LDE4vOgEfPLAUU
	t2ngmCvRnD+AjTn6/ygsku5yw0J+9IIOr+nGKLEeGGWoDtUInBTjUwm4fMhlQtsJFb5kD0C8oncGL
	7/IUJ4Faj6EYw9X5aZSX8/+WcxxupezwC0zAmOavinUp1lhbjq7XxxG5UPk4KeK9dig+lGh7pleDC
	TnqUhEzO4ayC/ovxJdoJssmqIsoZDATNwshOb9RbRNXLbVCUGY/gvnCkdO3ylRjE7Jm8TFFD9N4Xw
	za3wGaSsxw6BQwMXme0lSRbdvh+K+o7DuhZtb/ejJ0fde+rhMiXNCtL3HBkc/ZYGFBC7KMn9mc3Nj
	SV/CT5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQkt-00000005DMn-2m8Y;
	Thu, 26 Feb 2026 02:05:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQkm-00000005DJH-3dWG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 02:05:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH2KNb3100885
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 02:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D93wpyNGQT2
	/lKSYk4tEdicwazQlUCt3v5pJwWaeHr0=; b=ZiE8ZwDqn5jZVcSkryVDfOFNTFg
	IBfqavxvMJp3w7n97wnamLf2GD9A4ADmhmKweb8oSb/OTCpMlhM02un/lk1XJkv4
	SiJYROfbZchyPUE4yaZ8H/a1aufFYhoz5w8na2iZPcRQvo0RgaWpDmptkzPxVrxw
	XFAfvSqC5VUuSCJtJ6qcHNHuU9JmcLOv//n929RxFlhs3m0GjpqAWUXCYMXvK/JM
	rWlBNDwf+EshXoafbQ/8gqBgF5eN9ZMnOiAqksspq8yN6jJmWKlR+PgX0GieSjoh
	txRJomMEaLm+XMS9Z+/xQJNmitYvpEMan3VwtMqDDp5J/qythavjlzW/56A==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj54p9e9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 02:05:23 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6798921eff4so7224329eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 18:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772071523; x=1772676323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D93wpyNGQT2/lKSYk4tEdicwazQlUCt3v5pJwWaeHr0=;
        b=EV3FUxjLx3xgihA0S3Tx8V7iQR7p3Jp2MLOp8yS4tlEw96qthfmBe30Y/0aru94lpm
         n3Ef2XacbE+OX9NzqTe4JSu/VcpvBTCqUyepFyX/Xl+C8z4kznJvi5v9qoEULTKg/VHu
         wZfyGBu6DGnfZeA3c2R8TO1ftWtLR0Ny9Ti+3pDkR6Or8CrWbZyIlKgYUS9O8uWxqrtR
         4H6V/2Jgxv1Wjzfa4c8YszXjkAksIy3lGJfB9jn9/nwc9VVfT1HjocrZn7w7Kjaj5LUk
         a6oZP/rfaYVHC1u2nvXFVnG7BzxIIH01dzLmt4XgCj+ZpR2IjOnO7E/aM5sPMwczRiQL
         VUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772071523; x=1772676323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D93wpyNGQT2/lKSYk4tEdicwazQlUCt3v5pJwWaeHr0=;
        b=E0NXyrtUWY0Sajg+8R7DcTi/wwXOsVdtC6Nri8FnLCEBR33Gy2MbSEQqjsn9rCL1dA
         IBJjtHinuNtsmLmkQEGeux9zXfiyB13caUrh0mDTCkKqQnxrbfhASTsqACXvMbsZh+dz
         yOQbwWbXxNujViV3HCun8d8Ei6EAflbNX2z7V3+uHpKLzdoxoAGd9f6Y+DdR0HFXFLys
         FY8bzVHIox3C9jzEum7xCbqdhSTCaAthjk+VPKR9267/HsS3z4yhYGLU1W4SO5Uvg5VP
         bETtR0J7HTdSwcniVt93CCL0T4hxxnDcs2GMQ4Yf7hGFIDU81QPrFsh6r6cauixLggV/
         Fwfg==
X-Forwarded-Encrypted: i=1; AJvYcCXKXDAQJzRz3qfiJPIJNSpKxa5iuD/6SjrXwxs1Bq1uCMxtzteLagN0TroaTlDdJoetMi638ulSdGLmUDYovCgt@lists.infradead.org
X-Gm-Message-State: AOJu0YxmX5DoOhyNNwCe/fC3vJuaQK0C8++Ovjz9dBZXYLWcjikby4Xq
	f37hFE/79ywrKbtHyv54FCs/Pw58ZY6i3QXyNz/tER+VNCL+nBR1qGGed5P5cGBjKgAXMOstFTO
	Y+mB7ARndU0FTQlF1mjDZpHVn76zWtSWNwclNh5N3pzX9jFhgAv3KrBfEOVysiF5YqiGMMra1kD
	cgRQ==
X-Gm-Gg: ATEYQzw57YT6WCUR2rqooiwVA0dRQAbWLqoKD+NWFgJXlakU2ppY8h8DR3uuuy+kJJY
	x/tfEDSeM+1xaP0jFtzpVHNBfwspd3XQ3lDY79V/jtOXA171UXaVrfZjn3gEiGPE3S46nBiM7v0
	KzvvKO31O3qFc/NxbZy59BMNAvfLjThRYnFUGRI4u9hzWocOCxcdLHtCjgta2wvXAgvRY3LkZau
	T1YAaf5bozRtQ1awqqmMs0ergTwoIVNRh6Jb7BlkHsG/w+M//21x7ie+E1oCaPuKbuRNi1FRqZS
	sMRCjFZtbmQjrE0on0rcH9pOdGnajc5pYsfVL3cKrgPcZRbOrz4YfuBlVeVcb8XjCOF3wc6W0Mi
	4s0hD8nitvenBXeuUkoPzcQBDIkyNZ1QljyzwTmUPT1LwEE+KF+6ZsrbMzwg7zd11ezkmBKkYik
	7n
X-Received: by 2002:a05:6820:821:b0:679:a41d:2d2f with SMTP id 006d021491bc7-679ef823bf5mr1206443eaf.30.1772071523057;
        Wed, 25 Feb 2026 18:05:23 -0800 (PST)
X-Received: by 2002:a05:6820:821:b0:679:a41d:2d2f with SMTP id 006d021491bc7-679ef823bf5mr1206427eaf.30.1772071522626;
        Wed, 25 Feb 2026 18:05:22 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d9e8d6sm549939eaf.13.2026.02.25.18.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 18:05:21 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v11 4/7] qcom-tgu: Add TGU decode support
Date: Wed, 25 Feb 2026 18:04:51 -0800
Message-Id: <20260226020454.3210149-5-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
References: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxNiBTYWx0ZWRfX0HHy4Y2ayPhy
 w0hJ47+0tKspQH+j2K03pMNl0mbL2WWj5I1lLubFZKbZeeRiSF/q7TrVu1gw5o/lM0fp2HooGMz
 2b12sisTk8rBSrQjHIP2dZNBOLDsTxv/lkKxfX6y59u9xZWgy9o4X/6F8pPYpsLJYucM9upT7jF
 h7MNpxqCmbkWLYfDB4DHv6bC9HXPlgNTr0J2v+RwE71HOfM2/ydq9zdIhUDlsfmFrvgevCa7R7g
 ovCVgsJaejlcq/wu7qE1RYMGo3BJJr5pKoBsOoEO3xpGGIbZQaOeAqyi3HxiYO1Y+6gxJcXzh6G
 H/KWePstBYNnOcdcUodd8ngXrJtHYJSmJaXoKpHfSg8xuzKi/KnKjpt9prSz74wBxHheM0BVBRG
 1hXhSXmxoyEeQ8yz+h8qg5UChh88dzuzkz3Ee4v8RSOZJmzTEYOWEh5x72l6Qec7g3majxlgEHN
 PsvU+ssp1oyGO+yTHHA==
X-Proofpoint-GUID: IoSFYHct98LJVuYqg8pTzdjW5MlK9NGU
X-Authority-Analysis: v=2.4 cv=I5Bohdgg c=1 sm=1 tr=0 ts=699faa63 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=DXd_79bSlwW_W-LZS_AA:9 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: IoSFYHct98LJVuYqg8pTzdjW5MlK9NGU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_180525_236944_217EAEA7 
X-CRM114-Status: GOOD (  23.23  )
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
 drivers/hwtracing/qcom/tgu.h                  |  28 ++++
 3 files changed, 171 insertions(+), 21 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 23ba73c4db0e..a18f6e4c797d 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion	6.20
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:		February 2026
+KernelVersion	6.20
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
index 970292f91b02..ca8dfbef0cd2 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -16,6 +16,9 @@
 	((int)FIELD_GET(GENMASK(17, 10), devid_val))
 #define TGU_DEVID_STEPS(devid_val) \
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
+#define TGU_DEVID_CONDITIONS(devid_val) \
+	((int)FIELD_GET(GENMASK(2, 0), devid_val))
+
 #define TGU_BITS_PER_SIGNAL	4
 #define LENGTH_REGISTER	32
 
@@ -49,6 +52,7 @@
  */
 #define STEP_OFFSET			0x1D8
 #define PRIORITY_START_OFFSET		0x0074
+#define CONDITION_DECODE_OFFSET	0x0050
 #define PRIORITY_OFFSET		0x60
 #define REG_OFFSET			0x4
 
@@ -57,6 +61,9 @@
 	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
 	 REG_OFFSET * reg + STEP_OFFSET * step)
 
+#define CONDITION_DECODE_STEP(step, decode) \
+	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -68,6 +75,8 @@
 #define STEP_PRIORITY(step_index, reg_num, priority)                     \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
 			reg_num)
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -91,6 +100,14 @@
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
@@ -98,11 +115,19 @@
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
@@ -117,6 +142,7 @@ struct tgu_attribute {
 
 struct value_table {
 	unsigned int *priority;
+	unsigned int *condition_decode;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -146,6 +172,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @value_table: Store given value based on relevant parameters
  * @num_reg: Maximum number of registers
  * @num_step: Maximum step size
+ * @num_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -160,6 +187,7 @@ struct tgu_drvdata {
 	struct value_table *value_table;
 	int num_reg;
 	int num_step;
+	int num_condition_decode;
 };
 
 #endif
-- 
2.34.1


