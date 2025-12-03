Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207C6D12695
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULWrtdqRd6syaSFbhD1pjKGixctTc63ZKRvNoZJxlNg=; b=jIRolq72Ssmh70Bbuy7p4CxyOP
	pKEdYk23M6/7BRhFnOrj4JGFkP+SFEczRPMMmW2BGCM2k2nDqIWNqT7uCQHMsOFSBu3AqDdjf9wvK
	6OVE5E9/TNK6tKU6Xv2ZIBNUeLY+BHkii35yMV+UJhD3B1g+Re7cbsratlLvxroSZ1fgobrF/8cHd
	zxNh9mDcw5qPcPqmi0Vcy8Cf/HhTHaKXixYAVA304zXk1NphrRcgxXL+HVdwU8036+nVXAQ5HeG44
	WGvBLinQDZLpLFF9ou6J8ZyBdhQJmkuQvDT4SWz8xzVm9833OMBPtqK0mV7f+hS/0rpQ1UUOWH3De
	EsJrGDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQikK-00000006MOZ-327O;
	Wed, 03 Dec 2025 09:02:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQikE-00000006MIS-2sKJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:01:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B380AHr404967
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Dec 2025 09:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ULWrtdqRd6s
	yaSFbhD1pjKGixctTc63ZKRvNoZJxlNg=; b=mxhvJGN7/GPI4/ILPI6kl9jlrEm
	ysSBsnwnd3tT7EMgbr75GrsmYV75MhrK9hoDXRT/mLOOvoMs0Jqq1xQZvy4TGokp
	zi4BhOMw4OSpjtC1rS4B0EeLyhsrUvegYYlVH9yW7IeyF1a2ifkEZOSauWb2IrnH
	bY3K7ZGdZrAQbySn4zQn4uIrzAStEmmZL3kA5vBS2aCsQqrjKZsjkO+XMICSZ4We
	opX34G0ySlnALaBDPB39X0L+NFNmyQsw1sKok6BuaB3VCP1W9QaltmC5NadJh/cE
	lrrKxTiumz0NGSLum9Z6HOcz1361HHaK6/qQvMgs3BCGPEK4Wx8qnodZXLg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at9fc9hgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 09:01:54 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-11ddcc9f85eso1120710c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 01:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764752513; x=1765357313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULWrtdqRd6syaSFbhD1pjKGixctTc63ZKRvNoZJxlNg=;
        b=BwM9rezhPdqQNiZdmjvBs35a1ubop0fC6Z94Kzv+YVEAJ2iPillJQGv+EoaZkGjf82
         ULC6xhILdOsJvsCvZmEcFefjN3cPYecfcZVr3AMkVjb2f9BsqHQCkrLb/t6uaa2Cpwmt
         ZymjgNu0QPPkLEhQO4l8pDeXwhmC2CcgGNxzvAg+v5Am17ckVqweY3wmxfj+dkKHA5bA
         nMBuNnoQ0dAKxnHSxY5j+ytfjMiTW6JENes+ZhPIpmLZgB+QzNaTdIIOF/KhywE9gBVr
         ATT9v89S7TlrtSARtBFyxlaJuQSae74LBFVw1ImqXqtWRy3CxknTnwK4LS7HSTuqSn7P
         qpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752513; x=1765357313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ULWrtdqRd6syaSFbhD1pjKGixctTc63ZKRvNoZJxlNg=;
        b=XYVy8Xs7QcCsrGuGgllircTeNQ7Dx9NnS8Vg83pL9Bmo+v4dHXYzq4O3h1/Qj02Z3T
         AylYCLGipk/o/RQ8cnrL9uI8VBAlSMJX59lwC9a2/eyhf/3f0RIPjsOKFweIkmE2i6y7
         Qp0P93Rli5OKuzKBuxtnFv8wY5/kMFcwskfKRNIae6hW6uJgw3gxE+dB+ohnWFNd2b73
         fOog9Rxc/VkR+d+3QfJPH/CRuB/XJE+Gb2Sn43VKW+E4OqgAyoCR6dY9tqVkK5Zn4Bf3
         h4bjMRR7CygYpeQuoYuMaw6wVzS1hADjhlCSRYh9utnpMcJ/q2x/J8H+Fae50a1//O+e
         sbCw==
X-Forwarded-Encrypted: i=1; AJvYcCUzHayfxEJAvx+vU/a9F/Cox2bvwJ1S0BNCpdtmoXeD0uUjHKWVvVT6//uLeFnTMHHQOYZBTLX6n+5nNsZ/ZrO5@lists.infradead.org
X-Gm-Message-State: AOJu0YwLW54W2qFhH/A4vgdnEFsda482j5T/3roLb0YcttusgfnxX/Z0
	wgKeY4TOblLitoxJO8Eq7QMIt/qwR4VuywrP5Sw0X7gOOVyLIdP/tXksNPtp/8x0yKPzOjq4kj2
	u6YYbS5VFGOJ3eU4uop22tuwZD0MFGAOI/BLCPAFnOuN08JZYwqpQjLdpKyQYlFeUPag2bEAHNK
	aA4w==
X-Gm-Gg: ASbGncs4a3YAPDY6kDqTASxo7Bgh/gURsp6mkeMA8EtU7hwTuaG9rTnFYHCDjEMxQ1l
	Kp9udiI/1unoIGTMwaiIhPP35abs6tjS1LnSVpsIO2eCACaBChlv12bZ6x4U7jd/Rx6j+j58ONZ
	a7D8UJXarVUuHLuibzpvsQysJBsQxiEjS+b/KCL55JrKrv/lYqpF5XuSkkV8dwSxYwsm3sF/svY
	0RdrTbAmB8OVxcfy5LOJtpOUTmzdHJ+ShqE+3ySHyNnsHE7nK7NVEIXdq4eMVpsYUI37jGjE8tB
	a5WSyg891WhjBDPHnyD0EZmc0JCug9vVksQbcljMfpt99zL854h9HMbHCrsbC3+Ph1r/PCzQxco
	YAZoWF5uqKatWGkeTQ69uhNSxrhAglkcBKtgRbbOKmyFd1UsWUcdnUQlj0LXyCiDU
X-Received: by 2002:a05:7022:6629:b0:11b:c0db:a5e4 with SMTP id a92af1059eb24-11df0c46b3dmr1313264c88.13.1764752513202;
        Wed, 03 Dec 2025 01:01:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE31Pm8e3emwq+vVlvOM23CrzIXHSnE1aUy4o1CxpaoBP9ALu5SFnqbdEDWHJBCp0lqXnI9Qg==
X-Received: by 2002:a05:7022:6629:b0:11b:c0db:a5e4 with SMTP id a92af1059eb24-11df0c46b3dmr1313241c88.13.1764752512537;
        Wed, 03 Dec 2025 01:01:52 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb057cb0sm100001866c88.9.2025.12.03.01.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:01:52 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v8 6/7] qcom-tgu: Add timer/counter functionality for TGU
Date: Wed,  3 Dec 2025 01:00:54 -0800
Message-Id: <20251203090055.2432719-7-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
References: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3MCBTYWx0ZWRfXxqgSUjhnfG+c
 9pK7/w2n7UYieG6RlblpvYMwtkkQjuAfaYGSilg2OfHDMO9dAs/oxCHJXbh2fkSr9NxoVsyjlJU
 39Uh/Qm8jfkYLwSHCCuTFGCF+udUGF3GGFHNxV1O1d/IYg2c39E7CGx8e9Mugspgmy3SFK3d+Jp
 Pmt2xScrCc16XAd0QoCO+VHpRYDjsOpfV7F35m5K4IQFllLuB77A4Bwi8PeByWpo5NdQRee9xqK
 x0FN77WNMa/zrO3V6yx+YCcrX03VcoePGNUw7j4VQlEK7dBt2j1FrYY0FS1TJep1dIe22TYDvE9
 85AmROwjyvt+WtW+7ks+KtQ7AL/e2xsZTVrcG2a9+LogeTpt8hZRgsJLGYQMZztHwXsH97hNNuc
 anEaZFd2e30BsiPDhLZS0vmyfLefEw==
X-Authority-Analysis: v=2.4 cv=Qblrf8bv c=1 sm=1 tr=0 ts=692ffc82 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1rMF9CJPs3E6MplvZ4wA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 9ckhXFmCZm87sJIQ_OKEp3cw1uePb_FO
X-Proofpoint-ORIG-GUID: 9ckhXFmCZm87sJIQ_OKEp3cw1uePb_FO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_010154_745121_D0699A8D 
X-CRM114-Status: GOOD (  20.96  )
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

Add counter and timer node for each step which could be
programed if they are to be utilized in trigger event/sequence.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |  14 ++
 drivers/hwtracing/qcom/tgu.c                  | 120 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  54 ++++++++
 3 files changed, 188 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index a0d5e2eb141b..28d1743bd2fc 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -28,3 +28,17 @@ KernelVersion	6.18
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the next action with specific step for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
+Date:		December 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the timer value with specific step for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
+Date:		December 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the counter value with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 98721891251a..5db876c31a63 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -40,6 +40,12 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 		ret = step_index * (drvdata->max_condition_select) +
 			reg_index;
 		break;
+	case TGU_COUNTER:
+		ret = step_index * (drvdata->max_counter) + reg_index;
+		break;
+	case TGU_TIMER:
+		ret = step_index * (drvdata->max_timer) + reg_index;
+		break;
 	default:
 		break;
 	}
@@ -88,6 +94,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_SELECT:
 		return sysfs_emit(buf, "0x%x\n",
 				  drvdata->value_table->condition_select[index]);
+	case TGU_TIMER:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->timer[index]);
+	case TGU_COUNTER:
+		return sysfs_emit(buf, "0x%x\n",
+				  drvdata->value_table->counter[index]);
 	default:
 		break;
 	}
@@ -133,6 +145,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->value_table->condition_select[index] = val;
 		ret = size;
 		break;
+	case TGU_TIMER:
+		tgu_drvdata->value_table->timer[index] = val;
+		ret = size;
+		break;
+	case TGU_COUNTER:
+		tgu_drvdata->value_table->counter[index] = val;
+		ret = size;
+		break;
 	default:
 		break;
 	}
@@ -175,6 +195,22 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 				drvdata->max_condition_select) ?
 				attr->mode : 0;
 			break;
+		case TGU_COUNTER:
+			if (drvdata->max_counter == 0)
+				ret = SYSFS_GROUP_INVISIBLE;
+			else
+				ret = (tgu_attr->reg_num <
+					drvdata->max_counter) ?
+					attr->mode : 0;
+			break;
+		case TGU_TIMER:
+			if (drvdata->max_timer == 0)
+				ret = SYSFS_GROUP_INVISIBLE;
+			else
+				ret = (tgu_attr->reg_num <
+					drvdata->max_timer) ?
+					attr->mode : 0;
+			break;
 		default:
 			break;
 		}
@@ -226,6 +262,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_SELECT_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_timer; j++) {
+			index = check_array_location(drvdata, i, TGU_TIMER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->timer[index],
+				drvdata->base + TIMER_COMPARE_STEP(i, j));
+		}
+	}
+
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_counter; j++) {
+			index = check_array_location(drvdata, i, TGU_COUNTER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->value_table->counter[index],
+				drvdata->base + COUNTER_COMPARE_STEP(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -268,6 +328,31 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 	drvdata->max_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
 }
 
+static void tgu_set_timer_counter(struct tgu_drvdata *drvdata)
+{
+	int num_timers, num_counters;
+	u32 devid2;
+
+	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
+
+	if (TGU_DEVID2_TIMER0(devid2) && TGU_DEVID2_TIMER1(devid2))
+		num_timers = 2;
+	else if (TGU_DEVID2_TIMER0(devid2) || TGU_DEVID2_TIMER1(devid2))
+		num_timers = 1;
+	else
+		num_timers = 0;
+
+	if (TGU_DEVID2_COUNTER0(devid2) && TGU_DEVID2_COUNTER1(devid2))
+		num_counters = 2;
+	else if (TGU_DEVID2_COUNTER0(devid2) || TGU_DEVID2_COUNTER1(devid2))
+		num_counters = 1;
+	else
+		num_counters = 0;
+
+	drvdata->max_timer = num_timers;
+	drvdata->max_counter = num_counters;
+}
+
 static int tgu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		      void *data)
 {
@@ -418,6 +503,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
+	TIMER_ATTRIBUTE_GROUP_INIT(0),
+	TIMER_ATTRIBUTE_GROUP_INIT(1),
+	TIMER_ATTRIBUTE_GROUP_INIT(2),
+	TIMER_ATTRIBUTE_GROUP_INIT(3),
+	TIMER_ATTRIBUTE_GROUP_INIT(4),
+	TIMER_ATTRIBUTE_GROUP_INIT(5),
+	TIMER_ATTRIBUTE_GROUP_INIT(6),
+	TIMER_ATTRIBUTE_GROUP_INIT(7),
+	COUNTER_ATTRIBUTE_GROUP_INIT(0),
+	COUNTER_ATTRIBUTE_GROUP_INIT(1),
+	COUNTER_ATTRIBUTE_GROUP_INIT(2),
+	COUNTER_ATTRIBUTE_GROUP_INIT(3),
+	COUNTER_ATTRIBUTE_GROUP_INIT(4),
+	COUNTER_ATTRIBUTE_GROUP_INIT(5),
+	COUNTER_ATTRIBUTE_GROUP_INIT(6),
+	COUNTER_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
@@ -455,6 +556,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
 	tgu_set_conditions(drvdata);
+	tgu_set_timer_counter(drvdata);
 
 	drvdata->value_table =
 		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
@@ -488,6 +590,24 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!drvdata->value_table->condition_select)
 		return -ENOMEM;
 
+	drvdata->value_table->timer = devm_kzalloc(
+		dev,
+		drvdata->max_step * drvdata->max_timer *
+			sizeof(*(drvdata->value_table->timer)),
+		GFP_KERNEL);
+
+	if (!drvdata->value_table->timer)
+		return -ENOMEM;
+
+	drvdata->value_table->counter = devm_kzalloc(
+		dev,
+		drvdata->max_step * drvdata->max_counter *
+			sizeof(*(drvdata->value_table->counter)),
+		GFP_KERNEL);
+
+	if (!drvdata->value_table->counter)
+		return -ENOMEM;
+
 	drvdata->enable = false;
 	desc.type = CORESIGHT_DEV_TYPE_HELPER;
 	desc.pdata = adev->dev.platform_data;
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 5056ec81fdae..de438cf868c8 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -8,10 +8,16 @@
 
 /* Register addresses */
 #define TGU_CONTROL 0x0000
+#define CORESIGHT_DEVID2       0xfc0
 
 #define TGU_DEVID_SENSE_INPUT(devid_val) ((int) BMVAL(devid_val, 10, 17))
 #define TGU_DEVID_STEPS(devid_val) ((int)BMVAL(devid_val, 3, 6))
 #define TGU_DEVID_CONDITIONS(devid_val) ((int)BMVAL(devid_val, 0, 2))
+#define TGU_DEVID2_TIMER0(devid_val) ((int)BMVAL(devid_val, 18, 23))
+#define TGU_DEVID2_TIMER1(devid_val) ((int)BMVAL(devid_val, 13, 17))
+#define TGU_DEVID2_COUNTER0(devid_val) ((int)BMVAL(devid_val, 6, 11))
+#define TGU_DEVID2_COUNTER1(devid_val) ((int)BMVAL(devid_val, 0, 5))
+
 #define NUMBER_BITS_EACH_SIGNAL 4
 #define LENGTH_REGISTER 32
 
@@ -47,6 +53,8 @@
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
 #define CONDITION_SELECT_OFFSET 0x0060
+#define TIMER_START_OFFSET 0x0040
+#define COUNTER_START_OFFSET 0x0048
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -58,6 +66,12 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define TIMER_COMPARE_STEP(step, timer) \
+	(TIMER_START_OFFSET + REG_OFFSET * timer + STEP_OFFSET * step)
+
+#define COUNTER_COMPARE_STEP(step, counter) \
+	(COUNTER_START_OFFSET + REG_OFFSET * counter + STEP_OFFSET * step)
+
 #define CONDITION_SELECT_STEP(step, select) \
 	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
 
@@ -79,6 +93,12 @@
 #define STEP_SELECT(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
 
+#define STEP_TIMER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
+
+#define STEP_COUNTER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -118,6 +138,18 @@
 	 NULL		    \
 	}
 
+#define STEP_TIMER_LIST(n) \
+	{STEP_TIMER(n, 0), \
+	 STEP_TIMER(n, 1), \
+	 NULL              \
+	}
+
+#define STEP_COUNTER_LIST(n) \
+	{STEP_COUNTER(n, 0), \
+	 STEP_COUNTER(n, 1), \
+	 NULL                \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -139,6 +171,20 @@
 		.name = "step" #step "_condition_select" \
 	})
 
+#define TIMER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_TIMER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_timer" \
+	})
+
+#define COUNTER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_COUNTER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_counter" \
+	})
+
 enum operation_index {
 	TGU_PRIORITY0,
 	TGU_PRIORITY1,
@@ -146,6 +192,8 @@ enum operation_index {
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
 	TGU_CONDITION_SELECT,
+	TGU_TIMER,
+	TGU_COUNTER
 };
 
 /* Maximum priority that TGU supports */
@@ -162,6 +210,8 @@ struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
 	unsigned int *condition_select;
+	unsigned int *timer;
+	unsigned int *counter;
 };
 
 /**
@@ -176,6 +226,8 @@ struct value_table {
  * @max_step: Maximum step size
  * @max_condition_decode: Maximum number of condition_decode
  * @max_condition_select: Maximum number of condition_select
+ * @max_timer: Maximum number of timers
+ * @max_counter: Maximum number of counters
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -193,6 +245,8 @@ struct tgu_drvdata {
 	int max_step;
 	int max_condition_decode;
 	int max_condition_select;
+	int max_timer;
+	int max_counter;
 };
 
 #endif
-- 
2.34.1


