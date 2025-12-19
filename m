Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A02FD7495E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zh3m6t4hqkoq12Tk90+CNng+VNifwIyy+mUekxgxB18=; b=o2YDvMvmq3BlkqfALQuio8bixw
	VdcfZi9d1NNC8kiEn+wyDQuhCMm6UuIFPb/F+IP0NTvdToyvWCznn6M/RpM6dNdQrugpW8+qZiuXw
	xHJbpMu/v2w2XgkenHErnBcoegl+sGI9xz2LNL4EIdpojVNGaCkNyREUX/uuFTDcEUk8P+mAZUIiK
	hVPCidBp6FH+vsA1jxRtSqvwhDsHcDtj77URTcRAmbUHAsl+aHfNQmsFj2YcCl/TLErlVgetw2fIw
	v6YyZaT1VBZO7e36W177XUNYb9Qhen8yyGifUpl2r2II6tFswqYxA6BF2qGHQB8TyjrnRjd36nZjo
	6QhMpBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUSe-00000009jN8-0XTJ;
	Fri, 19 Dec 2025 06:59:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUSb-00000009jKP-2HJ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 06:59:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cUmV3700913
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zh3m6t4hqko
	q12Tk90+CNng+VNifwIyy+mUekxgxB18=; b=JssQsznn4FkbL+nYpIgQ/8Fi25w
	T9MxsuAcfRojvch97i6L3dFhE3wCXmYVGqckIagMIzisud8kdSFDLW0H8jQGVobI
	j1/3NT+5amJ9PRNdlMysSiRlGXjOMmnQwRgJdmLov8v98bkHAjuTFt2jSCXPnQEA
	IC9AZxPZub1JTE/Zy0hSSxAVhTX9mWcy0vw902xu7XvV7VNdqXXBb+iGQdVNMUAU
	QtKepgUPJuHtv6u76tJdBH+EQmr9+Ko5v0ZPojQ/6+5uLuWmo+HXKOF4O4d74m5y
	9OmobmCDFpR9c/IOtIuLea3y5GVtiElOTbHVcp7jueA41CnTG3q19TkGRzg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ehkau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:59:32 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bddf9ce4931so2425185a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 22:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766127572; x=1766732372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zh3m6t4hqkoq12Tk90+CNng+VNifwIyy+mUekxgxB18=;
        b=jwNGDUY+yvPBs+paU3mTvF61DoRqy81uXhHkuH+q0NpVKyi5KBq5UnxhVsz7zK1NiH
         oeSBuIMAbQvU9bfhXc+jkMaSPFggGr/b4y5NdcI4wb/6PV8N2SQpU8Ztq1qLa9FSsmrb
         yOxrfXm/fdHTTS1JUxAg5JtqBhbQD8Ps9Zp96Dlxq0oRt2jNaGBis4EWhi5bzTem8PcK
         kIvllvSQR+UBgUseHL/NPqgtEt6nHhQKdZeR2bWWl/zs3v8bcJM49IEIaqvH9bqGElXD
         vL/V7tS5edcmQmwPxNb2nwgR9m9Y4E7uyiG+Di4nptaJoa+PgtK6FSav7a31IuQ+EoXD
         8gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766127572; x=1766732372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zh3m6t4hqkoq12Tk90+CNng+VNifwIyy+mUekxgxB18=;
        b=CqFqJQ5ek3hKypSBER/BT2/C8LdTAz3jKaALz1OIKFsW5sgoA0c2veBsXtintYW+42
         uJfwBQtis/sly7ARz0AOPEy4JUFwYbcKkFZbLYawbvF6XMwU3s9DWS9GzA00n/lF9q/A
         7z6wT9R/26eWTWdLHeyjT+HxqOj0g8wgDrVv1tSJyG/Ekyl5euiLeOOAxW66Euc/7XG4
         41bkef/knL1TcjEg789UCsFyWub7667rGW5dfEp/AMuUKaB7+E/nVOCmiGL5vNAYBcKq
         8CKmG5gIMvwOPrM1D3abLtEfjkqVSSEGfHJ3fD5fUsieqZjF/CfWoQmLJfT4T0ppCrU+
         g+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUoMjltQab1qUjxrE3Nuk84Sefqn7Gb/qQszQKr4FJGzimAFG6G9hxpCrbv9Ck2Rpna0ZH25EvXS4hWTjjsyrQN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+j2RpjwLp5omPT8YGcJ78oK88fFHAhQCSZ9gWedlvMJuQP6tG
	RVd2RqC/9OfY3Sc8QXHUi8CpkccFG07G+JcRhlMsqaTpqrpji+tkgDL08nDKvE1h3L1C5Y1/Uv+
	aJ2yLZN8vJlZQ58CpRsrLdG9Hiny13RdSANm+DMIJSoPpDp6CDu628cbxYl/0yvU2rDsD9pcVrf
	m0Ng==
X-Gm-Gg: AY/fxX52p1Myo6W5Jo7Et96FQKU11HxizPh8GbJLCGX2yXkQdbSEfzs8+XHPQbv3mNa
	FL2GYtpksAracEY81ETK1zkvfEPFEqxeWNxY+Ik+CPVU5IfE9iOpkgeNmDZ5Fodn1+eyipcs3C5
	XV3N5YXvr31hu8zoVxCQmVW6IKpW2qHrx0ztrrrgVpc2MRTaG6Ql4VQlbyBVwpnkAs4U42y2LEN
	mlZlro/uw1Xxu/2mW69IOWdO2EhOSPIhqnWZhKXWWbg/CRHMICZHubBBYgvP0lTMVY1nqM8tBjo
	e6MKkpxf0h012wBUzynaixKXOYmb452gZ7QP76XdkO3vt1norAznUyxgLTJwuDtjmQnGriyeF4u
	1VgyznrVdSIIwWdyy9ve6Bfe7ddGsY9W9GCGi5ogYw8b9mxnIIOxfexOZsATMr3FY
X-Received: by 2002:a05:7300:ac90:b0:2b0:310c:529 with SMTP id 5a478bee46e88-2b05ec050d0mr1901109eec.14.1766127571421;
        Thu, 18 Dec 2025 22:59:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEk4i3pEXHNK3uc57gFBQrCOQNxRH86YYdtwt9CtiW3CTXTq5Ja4eeOLjPTa8NiffXrLBPoVg==
X-Received: by 2002:a05:7300:ac90:b0:2b0:310c:529 with SMTP id 5a478bee46e88-2b05ec050d0mr1901086eec.14.1766127570835;
        Thu, 18 Dec 2025 22:59:30 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm3614954eec.0.2025.12.18.22.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:59:30 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v9 5/7] qcom-tgu: Add support to configure next action
Date: Thu, 18 Dec 2025 22:59:00 -0800
Message-Id: <20251219065902.2296896-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KfUbpaTRjXU7npRM6zZuzOdmdoMoi-Ne
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA1NiBTYWx0ZWRfX9kCJVICi43Jm
 fZie52SkgmPxTR+zclkeyzcB+D0ZWV1gUQIGOTSp/hK+4DudR6bp29Vf8z/19WcSOev3d3GSHt2
 Cn/AWenr0261yxfRJKEjU97pY8LKzZfhWDTTMK/d9drFxe2dM0I2QQ0jeX84HWVloiFanRHFzN9
 Fbk5qk2c0T5q/8Zv9PHTDFdmgKfr/cTmCZ9OVrT0FJYtbIvu/ng0uwTHCbDjE4IK3qY1QQdvDJ7
 tpv1EEwUe6qRAYBp2Y0QabwEyETDcKytMqEFdl+zCA8bFv1629oEQO4zsGQgC0M7GZ4ikhLKQjs
 1uSZKeZpIjOOodc+/HHmOrzphMgpTTrtXFZ0cNLEhgX2lctJFuqPy41D2VSO/zao/Oi3D2ETceP
 S5//pIgfBtY+GziTqW58PYv4/5nT1JEgtbqekA/R/n0ixUWsT3rqRsNoOgX3/N3xNnmSKzJW8gb
 gkpEyTtB6vzNefbkI6g==
X-Proofpoint-ORIG-GUID: KfUbpaTRjXU7npRM6zZuzOdmdoMoi-Ne
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=6944f7d4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gOWipDUV9lcXNqIIBpoA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_225933_704300_D70C2E65 
X-CRM114-Status: GOOD (  22.75  )
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

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 +++
 drivers/hwtracing/qcom/tgu.c                  | 52 +++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  | 27 ++++++++++
 3 files changed, 86 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index c0e50ee95839..6fbd86592681 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion	6.19
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		December 2025
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 4140dc544e5e..98648ee61a10 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -33,6 +33,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 		ret = step_index * (drvdata->max_condition_decode) +
 			reg_index;
 		break;
+	case TGU_CONDITION_SELECT:
+		ret = step_index * (drvdata->max_condition_select) +
+			reg_index;
+		break;
 	default:
 		break;
 	}
@@ -74,6 +78,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_DECODE:
 		return sysfs_emit(buf, "0x%x\n",
 				  drvdata->value_table->condition_decode[index]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->condition_select[index]);
 	default:
 		break;
 	}
@@ -115,6 +122,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->value_table->condition_decode[index] = val;
 		ret = size;
 		break;
+	case TGU_CONDITION_SELECT:
+		tgu_drvdata->value_table->condition_select[index] = val;
+		ret = size;
+		break;
 	default:
 		break;
 	}
@@ -148,6 +159,15 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 				drvdata->max_condition_decode) ?
 				attr->mode : 0;
 			break;
+		case TGU_CONDITION_SELECT:
+		/* 'default' register is at the end of 'select' region */
+			if (tgu_attr->reg_num ==
+			    drvdata->max_condition_select - 1)
+				attr->name = "default";
+			ret = (tgu_attr->reg_num <
+				drvdata->max_condition_select) ?
+				attr->mode : 0;
+			break;
 		default:
 			break;
 		}
@@ -186,6 +206,19 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_DECODE_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_select; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_SELECT, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->condition_select[index],
+				drvdata->base + CONDITION_SELECT_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -225,6 +258,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 
 	devid = readl(drvdata->base + TGU_DEVID);
 	drvdata->max_condition_decode = TGU_DEVID_CONDITIONS(devid);
+	/* select region has an additional 'default' register */
+	drvdata->max_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
 }
 
 static int tgu_enable(struct device *dev)
@@ -357,6 +392,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(0),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(1),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(2),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(3),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(4),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
+	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -412,6 +455,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!drvdata->value_table->condition_decode)
 		return -ENOMEM;
 
+	drvdata->value_table->condition_select = devm_kzalloc(
+		dev,
+		drvdata->max_condition_select * drvdata->max_step *
+			sizeof(*(drvdata->value_table->condition_select)),
+		GFP_KERNEL);
+
+	if (!drvdata->value_table->condition_select)
+		return -ENOMEM;
+
 	drvdata->enable = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 732126b896e1..1f46da35b40a 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -50,6 +50,7 @@
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
+#define CONDITION_SELECT_OFFSET 0x0060
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -61,6 +62,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -76,6 +80,9 @@
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -106,6 +113,15 @@
 	 NULL		    \
 	}
 
+#define STEP_SELECT_LIST(n) \
+	{STEP_SELECT(n, 0), \
+	 STEP_SELECT(n, 1), \
+	 STEP_SELECT(n, 2), \
+	 STEP_SELECT(n, 3), \
+	 STEP_SELECT(n, 4), \
+	 NULL		    \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -120,12 +136,20 @@
 		.name = "step" #step "_condition_decode" \
 	})
 
+#define CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_SELECT_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_select" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
 	TGU_PRIORITY2,
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
+	TGU_CONDITION_SELECT,
 };
 
 /* Maximum priority that TGU supports */
@@ -141,6 +165,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -171,6 +196,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @max_reg: Maximum number of registers
  * @max_step: Maximum step size
  * @max_condition_decode: Maximum number of condition_decode
+ * @max_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -186,6 +212,7 @@ struct tgu_drvdata {
 	int max_reg;
 	int max_step;
 	int max_condition_decode;
+	int max_condition_select;
 };
 
 #endif
-- 
2.34.1


