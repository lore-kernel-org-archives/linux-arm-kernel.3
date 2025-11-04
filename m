Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAE7CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 06:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6C+1a3faEq3osYqqD/ZZ/4ihi2dgZCB7lp1aXLGvTjA=; b=KX3J+H3HrRcOmnDjBs/COOIb8J
	c8y0BOCCCswTNba9cYDo4gVMZsQUJBzjJQGvX5VLLZHevSlo4PuuN2S29CnenKE2CR2apgeT3fTdf
	ESu7QueQbpIjDlA3I+TRBJnyp4uHw6+2ritTxF9R4NUxt63m7gNS/K0SGS92JDsMTe4xhooyoAe9Z
	oRRHiy83Pt0+OfXbYNTap4xLQ+vqeqQkSSv2pIzM91FItJJfZa7YkYEQnfTiIiQp3cZfHrOsyraRr
	x671E5fIKlIF+sdsi2wwS7dDmIVOAoD1etbhfoDsAIGwWx5UE0SPD1C2U/CuqSPhwaoG6GsvbkaJJ
	coOLADsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAkH-0000000BFWx-0Io3;
	Tue, 04 Nov 2025 06:42:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAkE-0000000BFUh-1cx9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 06:42:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A437b2m3744626
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Nov 2025 06:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6C+1a3faEq3
	osYqqD/ZZ/4ihi2dgZCB7lp1aXLGvTjA=; b=kGSQHLI2RCSvkzD437aCsDIyb6E
	D5ZlBYQggQsULBtnCiS1DGAm/jHoLovuJrzfA7pOXZXAVxxx2/a9cSSlPZn5Nq7W
	SWPY8y9m1AfexUtrkkb7N+KoUDROG9jdSiGhSTB1nLEWP6dxxmzLjeJF3p+Nsd5R
	YNAHpTjox0YkS5H/Tbuk0+8Hx763xdCpLH0IfyWMs4qmotd7lyGMZWR2SWySw9Uk
	TjOzIvPxSFfh7V7xUowgJpIRWw96DZDwMaoDG+xzY+l5VlHq3ZTncXR+kKAebFJT
	nQYJrlH6EC3WNF5gBf+02iIyyxkDE/VVZ6/GR8c7hWeaXONV3W2M42tcALw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70kc9xt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 06:42:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-336b646768eso5883698a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 22:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762238536; x=1762843336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6C+1a3faEq3osYqqD/ZZ/4ihi2dgZCB7lp1aXLGvTjA=;
        b=ZYXE4tZRKxND45gtTm0FuQuUUDnzu+W3AAxwNJAcOtXJVtseko463za5858SWdBc82
         7ixfDwrzNgFTQg2TTWvQ8EvtO2amS6PqcG5QHVDq1UtaE+YHlUbrX9l8b2nWjMjgmWHh
         mCipONDDev1G/hQMiislHRoiMn7bmkQmzGZQPi0/U93RLHDNQd8e05vlkacdG7PZPPP1
         cwmomu/7EKcQwXg9OQTPGWEAUsf/NGKhX49/0WfRRdBjCHtaH6ys6acbipnLCEPz2Q4X
         UyugaxkdcZoEa2H97blXzRahDAsinzZE4Ai6UlWnMu/Lw0XLXdx7CcVEJwPYUV1wifbj
         a68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762238536; x=1762843336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6C+1a3faEq3osYqqD/ZZ/4ihi2dgZCB7lp1aXLGvTjA=;
        b=pfwlpGNRKKrLQBbr9Mju5TA1CgbDUlimIFhz4iMKqgKZ2TpILe6GEianWyZ3PYP82A
         NAMRDWqb40USmN3D/KJugwhr9pNDFBk2EbafIN6xrGS2UOIUWsnlB+6/uHz/oHwQjirn
         E1ZENPmfWcYUQkOfr8TqZLnNPK1M0ILfAlxdDF8rcePIRn5XAXzXvYLOa7m1NUk8e/uk
         b/wpIkqLO828suLscsbOrc5+cvjAWoto4rb8ls5VseauRRuJt8u6Gmqg/q9yz3MUs+AC
         cI6qVEEs+Vt/YjTveWvYu7J32Ale4K7YqW52CwWBWox2zdN7nkYfKwZmKnprgtmIsIkb
         QCyg==
X-Forwarded-Encrypted: i=1; AJvYcCVgqXTjKOfO0PNaOxJ07BUA56ZExD7aUpvBRe77X4YqPdCEkP17OKC0OWfdXlkSbu1AJskOWK1hw+qF0UAWxdxh@lists.infradead.org
X-Gm-Message-State: AOJu0YyMeYJ9A1RH/dQvDtYriFxmnaekg0b863rmvZ9d1np7s/bHUVrx
	kGJ46PkTXX82i1FAGmcF9fbjJbbL/4Wyt+xBD0U8YbdZzm+eyd0yGFh8LcmI2ofk9m0xLdvuYP8
	ENQQaBoxaoszyJ72vzYmGHKXn9VQ/2bHdMxPIWGbxAuYKeNVFu8eaBKQXuQm4HE0ilXyqTsUSEo
	x4mw==
X-Gm-Gg: ASbGncvADJR/Bp2igTCXRbLuRFtmC/KvyfCPMPEL8tbRKFJCSUdlbwmMAVlf4bAB9WS
	jLHvv0XeIqVilLEa1Us0NOG5Ku+LImvnLv8RuvYzSISsApXrMpq9WyUDScZVfZ4X/yujPhT5cdV
	PXunWbVuMO8eQIaCG3i6I0A2RFX+jnMb7PqxQ6RRtiuFy4LQCYHV0eqV324pxW8xkU2Vay1t4vI
	DD0rL4zRSdVHV9/Ivqyo9toK/adlbK+vDww7MdpKZcA3GklTINzPRYmX8nE/i4QLfvzfkF4Eywd
	s0YhC+hAYwZljZFtv0hFtQXNgmkJBVv84d3UTjoLxao2bmF+nqKSMwLUAuGGdDjCvO796vm5fVH
	z3sMnI91E1ubZFF7JAddJWomAsmmMXIPIe4xA6rffnkoLQnZnVc6MxA==
X-Received: by 2002:a17:90b:4e88:b0:340:e521:bc73 with SMTP id 98e67ed59e1d1-340e521be37mr11422571a91.5.1762238536151;
        Mon, 03 Nov 2025 22:42:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+yTs2IjF434SBO3J45O3ZS9RHFoYqC8TMkPeVf99bWdNxFdWwJ/Uq7razsOVym9oFtwPUow==
X-Received: by 2002:a17:90b:4e88:b0:340:e521:bc73 with SMTP id 98e67ed59e1d1-340e521be37mr11422545a91.5.1762238535597;
        Mon, 03 Nov 2025 22:42:15 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a0780dsm3294791a91.16.2025.11.03.22.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 22:42:14 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v7 5/7] qcom-tgu: Add support to configure next action
Date: Mon,  3 Nov 2025 22:40:41 -0800
Message-Id: <20251104064043.88972-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
References: <20251104064043.88972-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA1MyBTYWx0ZWRfX0DArYAAyAQx7
 0/PC0tLXbvHec04quytOMVQ0zHsJ6xIsha1Axea2c7467TvcTbnSPMoselhk44LpZuTGj7BPJAA
 EWir/wGySTzdVPBz6uF6wxefjczfymSP3iB+wI1SOqkV2/AWhXf4B0BMtXFmAJRNcLSnVW/xz4P
 PyFtHY0IZpNqLjdz3RIR/5f98EvwOggwAZksluXwGVqi+p8n9dctU71Po2POKrUixJAi4dW5945
 wfUAXOjMQA9qDssf/JjUiCXfp9pPcj/itu5gK2xYLuARFJLrsv1LhwEaa7TpmCsF2o2+7ueOkLN
 cl6H+a/fyILjQvqn/1hzcf0PgGxHujI0om53j+ezUCQcZK37aZh+SEAKVXp5Pt56hl5h7dXASXe
 BBbDp6dmw1B7ogmCwLUENaviZnnFgA==
X-Proofpoint-GUID: ijjoN56FZM7uO0xtkLI2ibQgDwj42VHm
X-Proofpoint-ORIG-GUID: ijjoN56FZM7uO0xtkLI2ibQgDwj42VHm
X-Authority-Analysis: v=2.4 cv=TIJIilla c=1 sm=1 tr=0 ts=6909a049 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xi9iTe-FYOb_EUe3slkA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_224218_549841_B37C0871 
X-CRM114-Status: GOOD (  22.99  )
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
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 +++
 drivers/hwtracing/qcom/tgu.c                  | 52 +++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  | 27 ++++++++++
 3 files changed, 86 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index e4058b950a9c..00615a7c66c5 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion	6.18
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		November 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index b4ff41cf0a11..98721891251a 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -36,6 +36,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
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
@@ -81,6 +85,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_DECODE:
 		return sysfs_emit(buf, "0x%x\n",
 				  drvdata->value_table->condition_decode[index]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->condition_select[index]);
 	default:
 		break;
 	}
@@ -122,6 +129,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
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
@@ -155,6 +166,15 @@ static umode_t tgu_node_visible(struct kobject *kobject,
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
@@ -193,6 +213,19 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
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
@@ -231,6 +264,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
 	drvdata->max_condition_decode = TGU_DEVID_CONDITIONS(devid);
+	/* select region has an additional 'default' register */
+	drvdata->max_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
 }
 
 static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
@@ -375,6 +410,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -436,6 +479,15 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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
 	desc.type = CORESIGHT_DEV_TYPE_HELPER;
 	desc.pdata = adev->dev.platform_data;
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index cac5efeee1e9..5056ec81fdae 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -46,6 +46,7 @@
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
+#define CONDITION_SELECT_OFFSET 0x0060
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -57,6 +58,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -72,6 +76,9 @@
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -102,6 +109,15 @@
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
@@ -116,12 +132,20 @@
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
@@ -137,6 +161,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 /**
@@ -150,6 +175,7 @@ struct value_table {
  * @max_reg: Maximum number of registers
  * @max_step: Maximum step size
  * @max_condition_decode: Maximum number of condition_decode
+ * @max_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -166,6 +192,7 @@ struct tgu_drvdata {
 	int max_reg;
 	int max_step;
 	int max_condition_decode;
+	int max_condition_select;
 };
 
 #endif
-- 
2.34.1


