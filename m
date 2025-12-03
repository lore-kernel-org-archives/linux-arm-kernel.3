Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79856D12697
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bIRhKus1dFqwZ3vvpi/ou3+lJE0pioMrLFSKPQXZx0=; b=TkfBAuL8BSu6AutuVXICu70yEY
	FbnbeacOxrV4CesRZG2aIqTN1PveCQGbPYpHQBV5ND/LgY5BBAKJwzu7sXAKsE9JbHA3GVKWhoOGe
	s4Hd8ewp9JMglRUNm7oWbdABDTGOnnvgbzwml2aj+AGBFSyfRF+hPMPPxg+BG0zTJv5wsncaL4QW8
	UYuL0kgczofLdIL7RJHrifxYEDSW1NL/2v3qLjDTsYMXtjOMPigY15iVA34ztyuwQz65Gbr05nCnq
	a3p7PgXFMBmkJJhbnFX5bjBy5H4PeBeVlqGzlpIUk37DZRaoipIy47AOdMDhaNLcHfEmJZkX3F0Wv
	NwP0YOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQikH-00000006MLP-0m48;
	Wed, 03 Dec 2025 09:01:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQikC-00000006MFM-03tf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:01:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B331VDg3191757
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Dec 2025 09:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9bIRhKus1dF
	qwZ3vvpi/ou3+lJE0pioMrLFSKPQXZx0=; b=MMXM5Smxcm/n9f68yAUYfIhSzNt
	SMJdCF7089xPtMYkvhX37jr95+Z/qr0BS+/gKhxRDPSDSQvW6f5EinV5ZxHxL/ww
	L34TxRboVJwHUCNUCCnZ3F0K/wB2/d6+AU+WXTNkT0Li2BjEsQ/UC8qYYVCqaInx
	+chQL3fXKhbKZaoW2Ert13oPi92NSWqdO7S60mCYXynQselTb8tkgQVRZagLtcvP
	CJGrWkdmP50jHK1BBjNCCZs0dc6CFzpBbL+43nuchrRmYFMLdaASbmTFX1dkgo2c
	Wqp6S7eiQqnDZ0x6RToDLt6+6Q1/mfcjI9KFbgxnmy5YrEK3nzkRkZUz7Bg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at3qjjkx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 09:01:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bf06c3426b7so3165826a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 01:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764752511; x=1765357311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bIRhKus1dFqwZ3vvpi/ou3+lJE0pioMrLFSKPQXZx0=;
        b=QgkkfPxPA8y5IDHRp5oALDeXhgjAPTm5pV6A2u+bexb4NrtozvqL5NSX1daZNhn5Hd
         JVTZ3OtPGuEgZCd0qWRjmwbsh5oY9szwQcM4d/DH40a53438FSOZdDZYidmbpU6tBSf9
         wno2jraU2n0NIUL3TfSIvXnwswZWjAXYXyDqYYo3EKSxVGUKXnS31iIXfvloNCmSuAn1
         MFqzqUtENxJLps6IFX9VdlxuhgmSI9h6ErdN+4Dqat6d7CfP4P1myO+U/NM6vYIfevGs
         e5rMRMt2dCOOwy3wduOXMv5p7ARmMYeKv9IDaEMaXb/ypXc6h7KQyac6NDj1j40M0S0E
         lqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752511; x=1765357311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9bIRhKus1dFqwZ3vvpi/ou3+lJE0pioMrLFSKPQXZx0=;
        b=wfEs82jC1/7y3PXi/sS8G7BIoxQZCoyNJ6CHUZPDKpJAmJhp5PMJqliM9fUAXyd3lo
         dPdLtF1jw0ZKAQItvwmQPez5++45XUfjSoo+vcaMmDPY3karT2O9iTFnIQtxgvVN/jFq
         /BjaBtCnwTTgaVTObPAbfOxhxXNDUJBuvPW10BRfFmWYu4+kgsWKRDHF0ASHbydKGKnl
         YGnj8p0XVE6+w4t22PEzR6E8L7gjcrAIePo1f2/Bit0qLb9o0psWF53XhB7grzxFzSsr
         XQCa6D3mxEAMEn5WxGnMrHP0d3ILdwFamcAFe5VaXMTvIBckol/N3fNd+lcrzN3v5Gaa
         lyMA==
X-Forwarded-Encrypted: i=1; AJvYcCVtP56Sej0N2vWKwC7W2p0p8KKWye+HP8AdEUX2bMmDiRU+Eg8KU6fc1zwhtf9hoxXNvtkh7gU5FVaADxlhY2PG@lists.infradead.org
X-Gm-Message-State: AOJu0YxUUfifoP6107OxATcfY34Y02i6zQa0rMSbyb2cV09DFswIHM/U
	01OpBsyZgjNCf+zoVfwlWMqyNDsSRvs9kC2uvsAyISW94Wnap2PH2BzmiuyQdyBN+K2TWcsymQU
	WQ4imX861uIISH23azzH5oafqQORZG0B6vOvpNEobEU0ypt6ecD/y1Nr31GmM85Bao//L9u6K7k
	OwrQ==
X-Gm-Gg: ASbGncuIc1ieps54qoQLQh26e/TX+q25lLv7IYrBiz5L99eAhLSXJR8qYFm+F4NlU4s
	wEOpklHy5D9mbkDTKWUH2KI8ZPW/8//b1qJgIgRfaNMBG6h6mkYF+yD0Q5Jbpj2shL5q89hGzNW
	yuu91fepJb9TB9bqy0kC5cnxLzBE2coNqXzXEZEmJQYEM8wb/a1zTj9q7nrZn9DdQcYIw1Ym4aR
	Xh9bTCIPiFzrYpNFlC+PLIbVRVSqu9CngXnETP9SxPCsi3fCmtdlSIPTpE8inC35+7rKk4i4NDc
	nZEERAiu/0AgHaVNrkYazEvpfiosJOnszOCxYR0HonBQgsjEiKPOjxc+ZKapuNCdHEBIjsgvBAI
	CscrEduQapNJ3aMKu5O5C4z0ks7hvA8nP0k7q8WweYy+5ztHg2XYq66bD2yz5YJXn
X-Received: by 2002:a05:7300:d517:b0:2a4:3593:9698 with SMTP id 5a478bee46e88-2ab92e0993bmr1217369eec.21.1764752510606;
        Wed, 03 Dec 2025 01:01:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8/OkhOr7ph/dfYHXJKP3LjJC7/e6GI5WyVvyFFjgYdffuKOOYpUCd2+MMzoNGnrgWJypi9Q==
X-Received: by 2002:a05:7300:d517:b0:2a4:3593:9698 with SMTP id 5a478bee46e88-2ab92e0993bmr1217330eec.21.1764752509957;
        Wed, 03 Dec 2025 01:01:49 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb057cb0sm100001866c88.9.2025.12.03.01.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:01:49 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v8 5/7] qcom-tgu: Add support to configure next action
Date: Wed,  3 Dec 2025 01:00:53 -0800
Message-Id: <20251203090055.2432719-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
References: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3MCBTYWx0ZWRfX+fTp5bpQEo4V
 Wb6iXducLAunwJ8K4BDBkZWli5meJgLIYoS+m/oZHl729BTS1uhbC3DPERqAcQEdXAQjh3/1SrX
 x1cXfhCVPkPnKb7E6zBQXbRaypA1pj2xoD/wtNTk0ks6VYB0F62G4s6tyPWTMHOm6Pddnqb2Hii
 bZ4jjQLREC3NOsP2ry+0p4oSUb8VlibV2cfE/10RHrRXbDzGwjfTQZIAviE/1W9URIxd+rnipuB
 89lxv1NO8U2eBYtDVFOOcJb3dRd3Ozm5wfOnTSdS++3k3jwe3Tv3ID9T8Po6GE3xz6+TUDWX56G
 P9lQkb2oLQVv/eRmxfWVvWqhY2KTxfxjkKr2RQr+zM8wmUCzjoCvjayay67gzX2VqGE9KG4g3Kp
 nwbTUTRAypjpCA2kfbC0LXmpi798Pg==
X-Proofpoint-ORIG-GUID: EsKz2ixOaQP1zB_Ml7jwuMCw-_3cBu8z
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=692ffc7f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xi9iTe-FYOb_EUe3slkA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: EsKz2ixOaQP1zB_Ml7jwuMCw-_3cBu8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_010152_096695_5541C0B2 
X-CRM114-Status: GOOD (  22.39  )
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
index df73a9d5043e..a0d5e2eb141b 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion	6.18
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		December 2025
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


