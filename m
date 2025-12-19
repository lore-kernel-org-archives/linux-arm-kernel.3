Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F5CD7495D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 06:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2gqUfcxUo7OzT2+W/flRobk/FmSpbVousEo4UlUkZE=; b=FevexhAs1AX/++hpRjuhVWyvtG
	+ey5x0jBaa6fiRPgoZ6Ida/X7tVgZ91NPp0suf+eQawS37BVvzgBIwiwVAc/py6GVQUyOQ+co+1tW
	bl3eGOkF6PUP6JeH4EhRMD13YjCEPSZ3fXK8h+8IFkZvJQxzIbDqqCE7TGVua3vwpr5x+NUzI3fbi
	UOoFKWPyZ252aIfeVlNN/1SMlnp/x+LVjvZVSXbNEQdr84pSQlbFa0rG61018DnRsSjbaCCgZ7VVc
	mI4KOwjHwQsE+xMVskHBNyGEZWJzbGMIS6uyCYMU7tXXEaN6PMVJc1WgVMgshN8FDBW4RVR1qj8qK
	uBGP+gXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUSd-00000009jMe-3ULn;
	Fri, 19 Dec 2025 06:59:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUSa-00000009jJ2-0aAN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 06:59:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cHxT4145667
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T2gqUfcxUo7
	OzT2+W/flRobk/FmSpbVousEo4UlUkZE=; b=pxWxRxwjv3ZRFst8ig87kLvVrHb
	M6OkyutrIHBldwkUYff5/HDPjNi0sibQZdwTmmTeYFVsq16/8suEmIQAHPk6PA95
	C3zXlBNR8Ik+pA647FVWrV0GzylkKUrXiDYaH3sLreohynUl0+jXtHXJCTR998pz
	eqbEU+26DLNMLKKeAJX29J5XuGoTkvbU/bdwBYSKvdz5p1SIcFGes84ClLTkxblO
	1Yr4ruz0aHtM2JlOO2vy8XpbV2GJG7PyrM4s6ta7aomJwZo9Qe02m+Yo4pyyQMk4
	xCygBf9h/guAtgHAqTv/Roc6eI3YSBy+rmxAqtsjKRhEYG0OP8hXmCFW/gQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dsmqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:59:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b9b9e8b0812so2607361a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 22:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766127570; x=1766732370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2gqUfcxUo7OzT2+W/flRobk/FmSpbVousEo4UlUkZE=;
        b=XuEQQkAU/l8bS3sSMJJSJdJgBQqzVlobQaTiMhNZQLrue15dOD9YS9IePvYFXRoBay
         J+O+VZJaQiCbb5DXy0Wj2+V7vI0Qqb0smkieh70IL4296mCMrYTejL1x0nHMCn9f6SRK
         YeosnjELqOpl4Y4oUSCxo0X0Nz7/VrinrXEeaPV0sfpHXjVkX8CuSYC0iDlmZWTBuCjq
         oHnwI7uq5WGlssW1lGB/71Jy5qE2AXvYDrmfY/C4Zu5ZgqDvZXNL4jBhZj60lwmuz5MZ
         sIHJr9dsk5ZzCBSGfoUEUjxEiOD5974rBv11VlTd/rmSMckGFut9Qdo+ItFmxCDhLm5h
         d4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766127570; x=1766732370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2gqUfcxUo7OzT2+W/flRobk/FmSpbVousEo4UlUkZE=;
        b=t+7kRjHqLvTIxZPkbXvd2sCMxeb3TfZkq4JayuwJ2L3WuwLpQFRuz4rzFGAAun7w13
         uRvE9IUF8x5VoZowVlL3aP6dMlF7tcYh37JaFr6jUM92HBNQOJGkJ3cTThnY8qDebEZS
         nGCS/oswkmfOL9/nsSC8xGbi1R1MR6hei6RBo1SgKdZPh1ZKe8aKxbARrWwxcu5TlKx+
         hdhryXp2VQYc4APWObZ8XW6Afu/2HEUGAF5PMGuadO0cr4lsKCLjrnluQF42N1eHhoWY
         JTk3SoZiljNUMMqCKH+z99mFJoXtn7AQU5sElwuz64vBUmEy/OlfN2a9AZvoRitET3dR
         Layg==
X-Forwarded-Encrypted: i=1; AJvYcCXfn7paG+vv+DhXArZk75mIUvTMLFci0ow5oC8oF22dCQG7ogxskkebeEFLbE5Npnl27BEJMsNeRlAqa4fBQc4H@lists.infradead.org
X-Gm-Message-State: AOJu0YyDG0aZWsP+VeXEBeTFXcufPA4LjVIgN2K7j3eroPHPdvmSag0N
	GHe03vSvreZycppO3l+iupHsi9IToZ/AVFj5C0k7py7sWhTAuacNie2dk6wSQlHYM9NGsLCDjOy
	P+matt4dx75wgA8cAw+51nClw8rlxxm1Q/gyQAK3qi25bDdiLKZFIZOczxBtT08U3C8jw+kUWQW
	V0jA==
X-Gm-Gg: AY/fxX6mQus3pbxm6Fy75PnMe7i9Dfza6BOapCyVem+KWa7LqfDtOKTm9w7hYNGu0fd
	ZHHaTZIvEUiojjsdvAqjK1oAV74aMyyFzA4bTcby/UCZOQ2vJAERy5eHeiO6eCEbXV+6CSu9SVG
	rnIwjozCp3SIYUYqH3bPtxAvchpR/fnePt5STbaTmYBFipjrA/vorAKZAtF0C8KVPwIBa0DQUyL
	MSnlqxp4fn7DMCCewkuZj2DHaJznmPNxVnfEw6l4aJc7JFXe4gFAk7uGHTIn4XD3uRTqQj0hRw7
	WhkarpFUIJNgQBcJc/FbP78TYWWFvuydIyfG/TpYJGG8ETpKkarrDWS4ZHdmUOWpxUGNZ2tyTQJ
	qGMUvCkzU4pkAsmUeuOoQXEPV50O7vFJOeDUILWNpzMIiNtk1E+YxFez0Sqq0/x+Y
X-Received: by 2002:a05:7300:d58b:b0:2b0:4f34:eed3 with SMTP id 5a478bee46e88-2b05ec3d5e0mr1826193eec.27.1766127569530;
        Thu, 18 Dec 2025 22:59:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7swjLusQQIOvIKFd3PQZZgezJc+x5C5ggajZ3DgdWXn3peWCSIOGlOTBo845VJVlqdE3v9A==
X-Received: by 2002:a05:7300:d58b:b0:2b0:4f34:eed3 with SMTP id 5a478bee46e88-2b05ec3d5e0mr1826167eec.27.1766127568835;
        Thu, 18 Dec 2025 22:59:28 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm3614954eec.0.2025.12.18.22.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:59:28 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v9 4/7] qcom-tgu: Add TGU decode support
Date: Thu, 18 Dec 2025 22:58:59 -0800
Message-Id: <20251219065902.2296896-5-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Yt8tFL_Pf0thueXsuLrzKh0Xdab2jOA5
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=6944f7d2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=cgLhVu-Bd7kgOx2TuvUA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Yt8tFL_Pf0thueXsuLrzKh0Xdab2jOA5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA1NiBTYWx0ZWRfXycF8KFYQS1hc
 TKifdPOonwIigt8taj6gKvolbL+jtMU7iyEdhqLT/fa59qVq7NgKzWTALhSbTRc/3TAimvzmT/V
 Vcc//Xw31qUQHfBOqQmuf40rilft7LtG3qOqMngYB8Qt6LYG50sbqWX7aWPLi7cr8I/Ys0cJ5iT
 Epc+4J64LpdLMhD9yUqNKSAurj7QOMecz/23Sa+aMj0WdnIiBel9ZrF/c/TStEZNhdIrEzV8H7j
 kI2tR7QKNLoiE4OeM1ESkESBvMtGZz9jYAd8yvlJLyD8IeDCz7bvtSP+kznvPDaVHd1tcuw0k+S
 7cx4+oatL5SFwYAzzf5ppYgtHnK26U/U+FjFNOeFD00VIBEUQ7JBlB0q0ilz1nXmhmfFWvWmG7I
 pvfUlxmU8yD8do6VCuYnzKB8Zl3CrvEXOn59KnH5SSsbC4Qk5zbJM7pNUUb92EsZBJxitk+BIXX
 Oiw0K60SyiyEwNt1gYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_225932_313754_E2336D91 
X-CRM114-Status: GOOD (  22.67  )
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
 drivers/hwtracing/qcom/tgu.c                  | 156 ++++++++++++++++--
 drivers/hwtracing/qcom/tgu.h                  |  27 +++
 3 files changed, 173 insertions(+), 17 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index d04a01368089..c0e50ee95839 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -14,3 +14,10 @@ KernelVersion	6.19
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the sensed signal with specific step and priority for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
+Date:		December 2025
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the decode mode with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 447d7e68d132..4140dc544e5e 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -18,8 +18,36 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 				   int step_index, int operation_index,
 				   int reg_index)
 {
-	return operation_index * (drvdata->max_step) * (drvdata->max_reg) +
-		step_index * (drvdata->max_reg) + reg_index;
+	int ret = -EINVAL;
+
+	switch (operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		ret = operation_index * (drvdata->max_step) *
+			(drvdata->max_reg) +
+			step_index * (drvdata->max_reg) + reg_index;
+		break;
+	case TGU_CONDITION_DECODE:
+		ret = step_index * (drvdata->max_condition_decode) +
+			reg_index;
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
+
+static int check_array_location(struct tgu_drvdata *drvdata, int step,
+				int ops, int reg)
+{
+	int result = calculate_array_location(drvdata, step, ops, reg);
+
+	if (result == -EINVAL)
+		dev_err(drvdata->dev, "%s - Fail\n", __func__);
+
+	return result;
 }
 
 static ssize_t tgu_dataset_show(struct device *dev,
@@ -30,12 +58,26 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	struct tgu_attribute *tgu_attr =
 			container_of(attr, struct tgu_attribute, attr);
 
-	index = calculate_array_location(drvdata, tgu_attr->step_index,
-					 tgu_attr->operation_index,
-					 tgu_attr->reg_num);
+	index = check_array_location(drvdata, tgu_attr->step_index,
+			     tgu_attr->operation_index, tgu_attr->reg_num);
+
+	if (index == -EINVAL)
+		return -EINVAL;
 
-	return sysfs_emit(buf, "0x%x\n",
-			  drvdata->value_table->priority[index]);
+	switch (tgu_attr->operation_index) {
+	case TGU_PRIORITY0:
+	case TGU_PRIORITY1:
+	case TGU_PRIORITY2:
+	case TGU_PRIORITY3:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->priority[index]);
+	case TGU_CONDITION_DECODE:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->condition_decode[index]);
+	default:
+		break;
+	}
+	return -EINVAL;
 }
 
 static ssize_t tgu_dataset_store(struct device *dev,
@@ -43,6 +85,7 @@ static ssize_t tgu_dataset_store(struct device *dev,
 				 const char *buf, size_t size)
 {
 	int index;
+	int ret = -EINVAL;
 	unsigned long val;
 
 	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
@@ -50,15 +93,32 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		container_of(attr, struct tgu_attribute, attr);
 
 	if (kstrtoul(buf, 0, &val))
-		return -EINVAL;
+		return ret;
 
 	guard(spinlock)(&tgu_drvdata->lock);
-	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
+	index = check_array_location(tgu_drvdata, tgu_attr->step_index,
 					 tgu_attr->operation_index,
 					 tgu_attr->reg_num);
 
-	tgu_drvdata->value_table->priority[index] = val;
-	return size;
+	if (index == -EINVAL)
+		return ret;
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
+		break;
+	}
+	return ret;
 }
 
 static umode_t tgu_node_visible(struct kobject *kobject,
@@ -75,13 +135,27 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		container_of(dev_attr, struct tgu_attribute, attr);
 
 	if (tgu_attr->step_index < drvdata->max_step) {
-		ret = (tgu_attr->reg_num < drvdata->max_reg) ?
-			attr->mode : 0;
+		switch (tgu_attr->operation_index) {
+		case TGU_PRIORITY0:
+		case TGU_PRIORITY1:
+		case TGU_PRIORITY2:
+		case TGU_PRIORITY3:
+			ret = (tgu_attr->reg_num < drvdata->max_reg) ?
+				attr->mode : 0;
+			break;
+		case TGU_CONDITION_DECODE:
+			ret = (tgu_attr->reg_num <
+				drvdata->max_condition_decode) ?
+				attr->mode : 0;
+			break;
+		default:
+			break;
+		}
 	}
 	return ret;
 }
 
-static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
 	int i, j, k, index;
 
@@ -89,8 +163,10 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 	for (i = 0; i < drvdata->max_step; i++) {
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->max_reg; k++) {
-				index = calculate_array_location(
+				index = check_array_location(
 							drvdata, i, j, k);
+				if (index == -EINVAL)
+					goto exit;
 
 				writel(drvdata->value_table->priority[index],
 					drvdata->base +
@@ -98,9 +174,23 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 			}
 		}
 	}
+
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
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
@@ -129,18 +219,32 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
 	drvdata->max_step = TGU_DEVID_STEPS(devid);
 }
 
+static void tgu_set_conditions(struct tgu_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+	drvdata->max_condition_decode = TGU_DEVID_CONDITIONS(devid);
+}
+
 static int tgu_enable(struct device *dev)
 {
+	int ret = 0;
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
 
 	guard(spinlock)(&drvdata->lock);
 	if (drvdata->enable)
 		return -EBUSY;
 
-	tgu_write_all_hw_regs(drvdata);
+	ret = tgu_write_all_hw_regs(drvdata);
+
+	if (ret == -EINVAL)
+		goto exit;
+
 	drvdata->enable = true;
 
-	return 0;
+exit:
+	return ret;
 }
 
 static int tgu_disable(struct device *dev)
@@ -245,6 +349,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -269,6 +381,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
+	tgu_set_conditions(drvdata);
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
@@ -290,6 +403,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!drvdata->value_table->priority)
 		return -ENOMEM;
 
+	drvdata->value_table->condition_decode = devm_kzalloc(
+		dev,
+		drvdata->max_condition_decode * drvdata->max_step *
+			sizeof(*(drvdata->value_table->condition_decode)),
+		GFP_KERNEL);
+
+	if (!drvdata->value_table->condition_decode)
+		return -ENOMEM;
+
 	drvdata->enable = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 2cf95c239ee7..732126b896e1 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -15,6 +15,7 @@
 #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
 #define TGU_DEVID_SENSE_INPUT(devid_val) ((int) BMVAL(devid_val, 10, 17))
 #define TGU_DEVID_STEPS(devid_val) ((int)BMVAL(devid_val, 3, 6))
+#define TGU_DEVID_CONDITIONS(devid_val) ((int)BMVAL(devid_val, 0, 2))
 #define NUMBER_BITS_EACH_SIGNAL 4
 #define LENGTH_REGISTER 32
 
@@ -48,6 +49,7 @@
  */
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
+#define CONDITION_DECODE_OFFSET 0x0050
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -56,6 +58,9 @@
 	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
 	 REG_OFFSET * reg + STEP_OFFSET * step)
 
+#define CONDITION_DECODE_STEP(step, decode) \
+	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -68,6 +73,9 @@
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
 			reg_num)
 
+#define STEP_DECODE(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -90,6 +98,14 @@
 	 NULL                   \
 	}
 
+#define STEP_DECODE_LIST(n) \
+	{STEP_DECODE(n, 0), \
+	 STEP_DECODE(n, 1), \
+	 STEP_DECODE(n, 2), \
+	 STEP_DECODE(n, 3), \
+	 NULL		    \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -97,11 +113,19 @@
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
@@ -116,6 +140,7 @@ struct tgu_attribute {
 
 struct value_table {
 	unsigned int *priority;
+	unsigned int *condition_decode;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -145,6 +170,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @value_table: Store given value based on relevant parameters.
  * @max_reg: Maximum number of registers
  * @max_step: Maximum step size
+ * @max_condition_decode: Maximum number of condition_decode
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -159,6 +185,7 @@ struct tgu_drvdata {
 	struct value_table *value_table;
 	int max_reg;
 	int max_step;
+	int max_condition_decode;
 };
 
 #endif
-- 
2.34.1


