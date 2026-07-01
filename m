Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F330C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 05:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g78us6s87bgETErPwAMlIT5CZOZ9CsSfglFtXPl5hhY=; b=Qj15HUgkjF3dPdvzoH3sJBG8ob
	1jh7NQhL3WGMtyXuATS2DoCfq7JdFmsbg+oBs0L1hMJAewx3UM88NS1Q3DvYxvXySHhspIz43MCwg
	JzsBkKw0CZXxAS9PAHda5cmpi3fvIoL5EVTPLSYRfAIc6zaCAN3O/RWYm5zztgKVhy6x+w0x67UOw
	4lMWU6589slvjiB0yhLEeNy45SIYOjdKsIB9u3IzYAfcco2nS4VjfLfqKwVphVYBIzvz/dSQWcQQv
	0UHGRpIyQZybLP6wQmQ0JQfvXoDPP5JP/bnoz1rBenPB8aQHEu2BrStXhxyJWiPKa+bxDwvqeoRB+
	QN9N44Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenvx-00000000kRI-39K3;
	Wed, 01 Jul 2026 05:56:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenvm-00000000kIV-41VN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 05:56:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lZr3058559
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 05:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g78us6s87bg
	ETErPwAMlIT5CZOZ9CsSfglFtXPl5hhY=; b=YoBIfGITWKlpeMgSPf4k+KCH4Zq
	jaggw4JG+jh7R5r6EecPI1oRmG3MVw5UDpbuA/L9vRMDNsFduY6b/qFlmgFBJ3pd
	xi4GG3hmH0boFZnfOIbYoEl9rVfQDlaH1llPyWecjoStA8vBM4koQZX5HZ4q/QKk
	KCagVmhVWytvvMEQ7JYp+r4lFq7pq+7sILiSceBrCxA901mTYOZFsBYt5WmEeSZ6
	L+3kRvw2CLcY7inkosoEo3XPl66zTdS2ZadUmSU/9PMOYQDvjMlzJTbAqviUnSUO
	ALhQwGDehHQeiRs8t9ZWTfXt52TUtRGwrpYiK0yUwyLef0colYRYJhVf35A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hfyau0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:56:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c8e14ebb2aso7556405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885377; x=1783490177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g78us6s87bgETErPwAMlIT5CZOZ9CsSfglFtXPl5hhY=;
        b=JnmMBI5IWkbEC83XRUVqxHzyiIxsM4mVSUSF6+FklAfX75uXyIIq9t+hnSaKHxoOWa
         faKlnqpcBkjzeX9z7028yzHzgdcgDOzK4QRiMf8d5igVVfvWxq/XJbezRHDBp26lOY3I
         rPUbSyhzfYeTBqGdRQ0M2evrHT/5eYHCNIoWH4fbbqnKOsXUbZP29kmLNr4IviVImqh0
         GfWgK+K10rHun26CAzC5bH4JTG8/XGzRfwskUPJuIQZuf3VfIu3gJBGZ8QQGJuCi23bz
         jRzjuP2NWtIgBf5/cxN1phQDfBu7gp43Nm4Z08q2SOwktg9Uj6PWQEgwcOnb7uKkOhnH
         uEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885377; x=1783490177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g78us6s87bgETErPwAMlIT5CZOZ9CsSfglFtXPl5hhY=;
        b=cbdDVZOu5v3g5LMENKwvgf9Cx+lx/HahHq7qobog31hZDdJQvi90vtypuzeOe81G+D
         jv5yqmpWgr8J4NeZuIwr7EEWCoIWW5hxkybi6CeOvxd0kxH5AK7iAudFdu6g81jOPv3a
         TgK7zJzXqRuru0RJcxSaruXVZuw88qsHQjr5jNAZiNSbdHVfYZSeAKR+6s5e1CIsLFoa
         /SdegWf2t9+qMy4PzD7jgq/C77hpiIXtIXK0ebPIueEU3P9oQidOOKcloeExaci0ef0k
         vEYz8iSdD7z/QP9Nn8aROk+qP0YErBg1n/ITsXpnTvgPemovhQPPG7uEnrZaopP9YZYe
         UktA==
X-Forwarded-Encrypted: i=1; AHgh+RpAcQJFhO5J71RGHJPhjdtb8npVOmqgBL5gQQxKgv/AN0DmRfTcM5P2jbITzQ3IHZB55XE1uXLilw4srv69GEvv@lists.infradead.org
X-Gm-Message-State: AOJu0YwIVSaeMD94MESRgOuqfMKH7GMiZlqYqmpIgrCLAfDobvfjlmgu
	4AJcXJ4yQtUWDULDQNU6keOQqmBNI37gz0wW3f5TagrlB3LCbsRB6jld31CJefQvvFzAo2yHs1k
	rFCT0YUogJQlOM/h+Ggw6NXM7YJCttO9LzBu3utkTDoViOxxYzCYrUuVVyURHZ0d7M/6xQcAazA
	AfTw==
X-Gm-Gg: AfdE7ckUQ98t9JZC+ppzYHjp2UxgyJdf33fdhz/jDQ6As0GlsTGJJKtiEIF1T9oAYHj
	iCs5YXZRcGCsLtP+Z3MEuIkbvzruDibb0dHJyWDd0ohrHPytZB4CmlAFfQz5p3n635Lvuc8f8gT
	/K16Rxt/FIAPUep4kvqncmkBNENAwUQxjEvkktNnx1m7Ds2ohE34G6lZRl2WQxwODRMNaiTjZn3
	g3BDVSxLNM7XzqQ3r0QuDtNSju7G6SVAyJHgFfn1naoC04wBqtzRQw52aH6MVObWLj3EDO1wObT
	wSbFZCJuAaX8Kkn9FDxeTYKvOriJxAOOvHWc5WqQmWp9O0YDp1hYNkqCoChy/6QQfRqyqxDsxHV
	pQ4/KJbGQeaaIzDWWjQHBIqGhBHK0BbV7RkrOKTT69oS7TnHRyzMZeWk5JN6Rj67csQ==
X-Received: by 2002:a17:902:ce83:b0:2ca:783d:c5dd with SMTP id d9443c01a7336-2ca783dc6cfmr7048715ad.8.1782885376428;
        Tue, 30 Jun 2026 22:56:16 -0700 (PDT)
X-Received: by 2002:a17:902:ce83:b0:2ca:783d:c5dd with SMTP id d9443c01a7336-2ca783dc6cfmr7048395ad.8.1782885375798;
        Tue, 30 Jun 2026 22:56:15 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm25451645ad.63.2026.06.30.22.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:56:14 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v15 6/7] qcom-tgu: Add timer/counter functionality for TGU
Date: Tue, 30 Jun 2026 22:55:28 -0700
Message-Id: <20260701055529.445819-7-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J5OaKgnS c=1 sm=1 tr=0 ts=6a44ac01 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=eGDQztGCVwpQsGOtWZEA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: cAUz7XBvIyZUb5ZRj_gd8gf20_1KjfZz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX5Moalez3oC9o
 kXd0xunXQMqMP9EOrSvMUZI8G3914AEfqUBSNE+hnKG1cPr+r/dH2UJmcxL3DSRMhGJOWpQn+2y
 i6QA7Oe58Zlc5hULbCDWysoafrkTbR0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfXx6KxXaTHxQ1A
 Spg00nvtpcraKSC7fct84pjIsNHHAz+EncAkuLAtcpZAP1kW8ct6aoPVrpd6Z+Jgi95CWHDG+ea
 c7DrK9YRXyS3870kGSWGId/kBJCYZP3B97w4RdA7as+URuFIRSc0S/B93APHnknHruAssIo8B4Y
 KuznObCQyyKz+8lk4yUFpFh4S/yRtDkYFsXpPa0o+3u4McRIzabgCZ0i9HO0fBvFQbX/POe84X5
 0uA8ICy4FMYSki9ylNze8VF02KwBbHNbN/Kb2Y1YRChhciXtw5WmNt2YluhWFEBpkoa0hIQf34y
 YjA1KHV+ype4dnYr4E119Vdko/YISUSqBQph6LJ7kHvTMhEI+pehFDCjA0gB+TGIX9jcAY1u4P+
 V4lLAMkCSmDsfVyVPqY+ChHjG0yRlGAjKbOJ7SAIpVJnSI8VdcR1qQ9sgCN1fQlEd3NzDFZZ7Ig
 /6d6sHAfLTUpUv7ClqA==
X-Proofpoint-GUID: cAUz7XBvIyZUb5ZRj_gd8gf20_1KjfZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_225619_464629_3CD37C32 
X-CRM114-Status: GOOD (  23.26  )
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

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 +++
 drivers/hwtracing/qcom/tgu.c                  | 116 +++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  |  57 +++++++++
 3 files changed, 185 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index f8b4ea199faf..7fad11eb759c 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -28,3 +28,17 @@ KernelVersion:	7.2
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the next action with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
+Date:		July 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the timer value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
+Date:		July 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the counter value with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index fefe932059cb..6d5bf2621cb0 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -32,6 +32,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 	case TGU_CONDITION_SELECT:
 		return step_index * (drvdata->num_condition_select) +
 			reg_index;
+	case TGU_COUNTER:
+		return step_index * (drvdata->num_counter) + reg_index;
+	case TGU_TIMER:
+		return step_index * (drvdata->num_timer) + reg_index;
 	default:
 		break;
 	}
@@ -77,6 +81,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_SELECT:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->value_table->condition_select[index]);
+	case TGU_TIMER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->timer[index]);
+	case TGU_COUNTER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->counter[index]);
 	default:
 		break;
 	}
@@ -122,6 +132,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
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
 		ret = -EINVAL;
 		break;
@@ -163,6 +181,18 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_select)
 			return attr->mode;
 		break;
+	case TGU_COUNTER:
+		if (!drvdata->num_counter)
+			break;
+		if (tgu_attr->reg_num < drvdata->num_counter)
+			return attr->mode;
+		break;
+	case TGU_TIMER:
+		if (!drvdata->num_timer)
+			break;
+		if (tgu_attr->reg_num < drvdata->num_timer)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -213,6 +243,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_SELECT_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_timer; j++) {
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
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_counter; j++) {
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
@@ -256,6 +310,27 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 	drvdata->num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
 }
 
+static void tgu_set_timer_counter(struct tgu_drvdata *drvdata)
+{
+	int num_timers = 0, num_counters = 0;
+	u32 devid2;
+
+	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
+
+	if (TGU_DEVID2_TIMER0(devid2))
+		num_timers++;
+	if (TGU_DEVID2_TIMER1(devid2))
+		num_timers++;
+
+	if (TGU_DEVID2_COUNTER0(devid2))
+		num_counters++;
+	if (TGU_DEVID2_COUNTER1(devid2))
+		num_counters++;
+
+	drvdata->num_timer = num_timers;
+	drvdata->num_counter = num_counters;
+}
+
 static int tgu_enable(struct device *dev)
 {
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
@@ -405,6 +480,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -412,8 +503,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority, *condition, *select;
-	size_t priority_size, condition_size, select_size;
+	unsigned int *priority, *condition, *select, *timer, *counter;
+	size_t priority_size, condition_size, select_size, timer_size, counter_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -432,6 +523,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
 	tgu_set_conditions(drvdata);
+	tgu_set_timer_counter(drvdata);
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
@@ -474,6 +566,26 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->value_table->condition_select = select;
 
+	timer_size = drvdata->num_step * drvdata->num_timer;
+
+	timer = devm_kcalloc(dev, timer_size,
+			    sizeof(*(drvdata->value_table->timer)),
+			    GFP_KERNEL);
+	if (!timer)
+		return -ENOMEM;
+
+	drvdata->value_table->timer = timer;
+
+	counter_size = drvdata->num_step * drvdata->num_counter;
+
+	counter = devm_kcalloc(dev, counter_size,
+			      sizeof(*(drvdata->value_table->counter)),
+			      GFP_KERNEL);
+	if (!counter)
+		return -ENOMEM;
+
+	drvdata->value_table->counter = counter;
+
 	drvdata->enabled = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index c61aa8dc51b0..1bcbc99169de 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -11,6 +11,7 @@
 #define TGU_LAR		0xfb0
 #define TGU_UNLOCK_OFFSET	0xc5acce55
 #define TGU_DEVID		0xfc8
+#define CORESIGHT_DEVID2	0xfc0
 
 #define TGU_DEVID_SENSE_INPUT(devid_val) \
 	((int)FIELD_GET(GENMASK(17, 10), devid_val))
@@ -18,6 +19,16 @@
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
 #define TGU_DEVID_CONDITIONS(devid_val) \
 	((int)FIELD_GET(GENMASK(2, 0), devid_val))
+#define TGU_DEVID2_TIMER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(23, 18), devid_val))
+#define TGU_DEVID2_TIMER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(17, 13), devid_val))
+#define TGU_DEVID2_COUNTER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(11, 6), devid_val))
+#define TGU_DEVID2_COUNTER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(5, 0), devid_val))
+
+
 #define TGU_BITS_PER_SIGNAL 4
 #define LENGTH_REGISTER 32
 
@@ -53,6 +64,8 @@
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
 #define CONDITION_SELECT_OFFSET 0x0060
+#define TIMER_START_OFFSET 0x0040
+#define COUNTER_START_OFFSET 0x0048
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -67,6 +80,12 @@
 #define CONDITION_SELECT_STEP(step, select) \
 	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
 
+#define TIMER_COMPARE_STEP(step, timer) \
+	(TIMER_START_OFFSET + REG_OFFSET * timer + STEP_OFFSET * step)
+
+#define COUNTER_COMPARE_STEP(step, counter) \
+	(COUNTER_START_OFFSET + REG_OFFSET * counter + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -82,6 +101,10 @@
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 #define STEP_SELECT(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+#define STEP_TIMER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
+#define STEP_COUNTER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -122,6 +145,18 @@
 	 NULL               \
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
@@ -143,6 +178,20 @@
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
@@ -150,6 +199,8 @@ enum operation_index {
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
 	TGU_CONDITION_SELECT,
+	TGU_TIMER,
+	TGU_COUNTER,
 };
 
 /* Maximum priority that TGU supports */
@@ -166,6 +217,8 @@ struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
 	unsigned int *condition_select;
+	unsigned int *timer;
+	unsigned int *counter;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -197,6 +250,8 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @num_step: Maximum step size
  * @num_condition_decode: Maximum number of condition_decode
  * @num_condition_select: Maximum number of condition_select
+ * @num_timer: Maximum number of timers
+ * @num_counter: Maximum number of counters
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -213,6 +268,8 @@ struct tgu_drvdata {
 	int num_step;
 	int num_condition_decode;
 	int num_condition_select;
+	int num_timer;
+	int num_counter;
 };
 
 #endif
-- 
2.34.1


