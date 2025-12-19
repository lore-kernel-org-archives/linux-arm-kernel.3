Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A11ED7495A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 06:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNb3PE7PkFbb1OKX7X/dVO7SyYEmsv5UgQIPUG7b+c4=; b=aoDaFEOKGxkkZ4QXC1q6FsLipW
	ADxxDlkkEpYjhLeW74zrxZnYzGkwqz51j1cmB9RwaEbfwaWSg658WOFMZnZnb4i1i0sty+JCyekj+
	F8buF0gSuiM1HAteL4IRFkQCYCjlWsNnz4txLNw0mCAGYtgbdriM1DCMqgpg5hSybyMZA3M4kz4Qi
	3Jyla7Pj4uw2uehkT4KFITwIxR3LKP7YQjYy72SaXFNzAAnDc2j2tchktAc4tWoMF22kncc9KufCt
	ahVVnX8T0gyB7nD587cPxZc64AWqZgW4q50V5kE0aD9841t98Rj+j0T2mppaNGY0Pz0KZgXvJgMsc
	+4MYgrxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUSk-00000009jSu-0SM7;
	Fri, 19 Dec 2025 06:59:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWUSd-00000009jLm-1WQK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 06:59:36 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c4vp091384
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LNb3PE7PkFb
	b1OKX7X/dVO7SyYEmsv5UgQIPUG7b+c4=; b=dTt+Cr69q+2OjmahuZQHwxjRpPi
	T4YWUtr0M74vgKWruP6x2deL0IIRYm2pe2h/cDOJHksCnzYLSlIoiTexxaYj4KZo
	h0ik3rEtuMufJR1+w85nc0qoAz4fv3dS3iKXtwtkxePJjw0HPFrmYv7ROL8QWsql
	dKc2IU0TsClBGsseQNCbn1smID+6vpdeKVyb+Jj+44O2XrBOm1v8FkFK6JrIqpK+
	4V+eT/GD07YCk4ZF1yHzDAsHQQpw00Kxk3t0UK7cKZ4qeW83zgSPwGYAgDzuChH2
	L2feyeDHEZgepSqt7GnUX3PVs+GvMtbMMf0M0cQAkkQ7cjfwQ02l4vADALQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2e9m6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:59:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b99d6bd6cc9so3016913a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 22:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766127573; x=1766732373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNb3PE7PkFbb1OKX7X/dVO7SyYEmsv5UgQIPUG7b+c4=;
        b=XqlRP4CXdtvF2pdSf8M+/pXA6cOZoxo55qZ8T58ERmyRRQBACmvUIBmELeeFJNhMz5
         E3eJbm+aYLm1xtOs4+cwCBvZHwdhiWgQKg6/DBDSuzW8vjUMgEeTucQ59/RaC4YYn+G+
         S5FK80/tHFcw/DzeobymOaFYqgThBmiWWr487DTIqZD+AKXekpjlrpJ2uTmSv+Pt93dU
         ldgeZzaTFhblFrNnK84a3oshFB7Jz9jXFb2xWC6FVLZFRCkK23dDTkXQGmmbaaT1XgJC
         JHK8xTkQJrIPnSjHYYkgNU3wOQISme315BG2TbZkVy8Bmsbu3rmSuDFuILjPd1CkkDWn
         L/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766127573; x=1766732373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LNb3PE7PkFbb1OKX7X/dVO7SyYEmsv5UgQIPUG7b+c4=;
        b=JJRywXxwqIhMLOKVZ9UxzWsMgoEnvmzOgxBKj1tly6BMRkJjbirra7rXxGPBBs+wVV
         S9tBLPAEgpYdCQYsAvOa/ceB9VXJCPcxNORHFWgn5k2gDlw2StFVBUSGJ1yDOEInTcz6
         ZYUxybI8WB9tVvyLbgyctVofplaO603/v+Bxy4NV98fA2rjjwB8csc5u3wPA4xdW8Tod
         LW4exp+z2L53z5uSSYDKOMOTsPe6CwnStj5AzlTmlLpiHm0ZoJCV4laTUu1VLBQlosdL
         CAXmZBILVr4kQ26rJ9mDGQuMvgIRSZFyyRnkQNVhhntUWmBiHSIP5PUpfDYOQs+X492R
         UoUw==
X-Forwarded-Encrypted: i=1; AJvYcCUNAqPr6wthGD/8g2jGsgKxf5kykDGpupGGxNi7GpYo8QH8hrYl+sqz7AJfmdywbAoPlkwmInzX/59arfC2r+YH@lists.infradead.org
X-Gm-Message-State: AOJu0YzhNiAly1gSVXpSoB9m8XS7nJNqeuZQn3DbIUJWqkY6bezrnZH0
	prcXPA8umVmSN5sx2Wm5bW9oC9TAcFX3IycG+QcDwf9g2Dlb/+ultoT9tFBUaWUMRigYOipq0xK
	FYHdEvkdaoBsyPIdCa3OX3zIp3/sk8BQM2ctHk96sshgpVxS8XtJprfr4LIwwnQSZEju6EHUyek
	LTPA==
X-Gm-Gg: AY/fxX4uUbMBvbiys2JuuC8ax5/q1gMuiAJQvpAxqyupNV99mbw1cSyO2thdsgyigIL
	aBO7jS1OjteHYetb572CvwnnCIqMuSLptLarj6nBRWZ+Cwz9PQqFk1GRbWjBAdCv6zw424/a4bT
	98v8g04I4xRxL5rmUeUC30xTFy2gRpnjaJIC/ml5EXN37Jmyb4oN0NPvx9z36+ckICioc60A06v
	Ilg0c2TMFdQfTLUp4m8mrhqIuO6Q1je1liPqh7NxuT92OBjjfCyyLEzIOHbXQy7NiFtwyLJsA6j
	fbPm65WxghzpnhTRkYNxjiKyccQuoNL4s2TGWi9QiDy8HyyRoAOc0V4heVoGhK7Ww85vLXDi+BF
	B4PtI0w/XfnqR7qcW5KyajqM6gd9ayMeDNDhkPsgXzyF9Av2cQBA8yUOnNllAXubs
X-Received: by 2002:a05:7301:18ab:b0:2ae:2c27:fc0e with SMTP id 5a478bee46e88-2b05ec7454dmr2104010eec.22.1766127573225;
        Thu, 18 Dec 2025 22:59:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu2mdPZB4X+UtG0W0ArtTRl+v42P20I8dyzAkElasiwIyRyirg+VeMxOThfyPRGEuydEsafw==
X-Received: by 2002:a05:7301:18ab:b0:2ae:2c27:fc0e with SMTP id 5a478bee46e88-2b05ec7454dmr2103973eec.22.1766127572618;
        Thu, 18 Dec 2025 22:59:32 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fcfc1b7sm3614954eec.0.2025.12.18.22.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:59:32 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v9 6/7] qcom-tgu: Add timer/counter functionality for TGU
Date: Thu, 18 Dec 2025 22:59:01 -0800
Message-Id: <20251219065902.2296896-7-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA1NiBTYWx0ZWRfXwxwF4rZ0ocMz
 YXk+8uOKX1hhpZ2aBOVHGVXF8VyeR47QtHuKIJh4sRBckRTAcsWEwTqUWpR2aJDlJ3iB6DmkLEI
 XU+015dQuGuZ7uCzdXOp+9ll/qhWdwJEkAdN9RAYGD19I/cr4YfnZEYK6YD8lF1p+Qwpw7+ZV0S
 McTu75bts+t8JthIep07CN9dwyNtAR4mDUHwRCSnjdI8QFkyz2+txBA0Pd0f52sV3rZwVnGTtjB
 2XQBfF1Ht/EjyEw04cNs41tP5dt9Hf1mzX3m4X8GC2w5n6gJEPkh1iVncxKZVWIndJC3s/By1lg
 7BCHtJShdSqDqnfXFnXcpsLkkMafUGd83dUlKrSIzaAxYt9mr89wvfZkxSeP0Oz1RfWtRSq+TwG
 FPINlVwKMp9ToPdjgpiQp/dXu22uNtlw0dA2Mfs66oB9l7OaFxHBTvchBg/xlYG1Trp9W9Aqt43
 Pf08mwzmUmx3/J/npMQ==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=6944f7d6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eGDQztGCVwpQsGOtWZEA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: ms1Nc_Gl5GnP0GqS3m0aj0tkNKaYzstE
X-Proofpoint-GUID: ms1Nc_Gl5GnP0GqS3m0aj0tkNKaYzstE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_225935_533331_F0DAEB9C 
X-CRM114-Status: GOOD (  21.05  )
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
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 ++
 drivers/hwtracing/qcom/tgu.c                  | 120 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  54 ++++++++
 3 files changed, 188 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 6fbd86592681..010eade0a1c5 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -28,3 +28,17 @@ KernelVersion	6.19
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the next action with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
+Date:		December 2025
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the timer value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
+Date:		December 2025
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the counter value with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 98648ee61a10..d4210869556e 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -37,6 +37,12 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
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
@@ -81,6 +87,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
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
@@ -126,6 +138,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
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
@@ -168,6 +188,22 @@ static umode_t tgu_node_visible(struct kobject *kobject,
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
@@ -219,6 +255,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
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
@@ -262,6 +322,31 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
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
 static int tgu_enable(struct device *dev)
 {
 	int ret = 0;
@@ -400,6 +485,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -425,6 +526,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
 	tgu_set_conditions(drvdata);
+	tgu_set_timer_counter(drvdata);
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
@@ -464,6 +566,24 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
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
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 1f46da35b40a..46a4cffedd7b 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -11,11 +11,17 @@
 #define TGU_LAR		0xfb0
 #define TGU_UNLOCK_OFFSET	0xc5acce55
 #define TGU_DEVID	0xfc8
+#define CORESIGHT_DEVID2       0xfc0
 
 #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
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
 
@@ -51,6 +57,8 @@
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
 #define CONDITION_SELECT_OFFSET 0x0060
+#define TIMER_START_OFFSET 0x0040
+#define COUNTER_START_OFFSET 0x0048
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -62,6 +70,12 @@
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
 
@@ -83,6 +97,12 @@
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
@@ -122,6 +142,18 @@
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
@@ -143,6 +175,20 @@
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
@@ -150,6 +196,8 @@ enum operation_index {
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
 	TGU_CONDITION_SELECT,
+	TGU_TIMER,
+	TGU_COUNTER
 };
 
 /* Maximum priority that TGU supports */
@@ -166,6 +214,8 @@ struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
 	unsigned int *condition_select;
+	unsigned int *timer;
+	unsigned int *counter;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -197,6 +247,8 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @max_step: Maximum step size
  * @max_condition_decode: Maximum number of condition_decode
  * @max_condition_select: Maximum number of condition_select
+ * @max_timer: Maximum number of timers
+ * @max_counter: Maximum number of counters
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -213,6 +265,8 @@ struct tgu_drvdata {
 	int max_step;
 	int max_condition_decode;
 	int max_condition_select;
+	int max_timer;
+	int max_counter;
 };
 
 #endif
-- 
2.34.1


