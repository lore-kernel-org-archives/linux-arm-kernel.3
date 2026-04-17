Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B0BF8E4B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrhUtaBSTzsU8W96kBFiB35356EKBZpAIWMjLMD2QpU=; b=MEL/ZjpOrVMnSM8Ib9x2t3ewW/
	z8/gZ9wiJXtY8AN+QEN8BGKu/jJI/IziqARsGRod92koNQGeYI3jz7q2DZbvmZR4CQPtD2qZWRDI4
	FEeY1l+R2JFJ0JhcPJxJJrAntcCqWUisfvO8VB1vmRamH1JW7BiKzKXTfOKEGLJISECFtnx6581SD
	o4lndOphN1HV64Aj487N6XE1WwjQjJmcg9JbATiwJgZ7FzfXCYI99fgWuRggF9m01b3RslFkiL0ek
	wdzwLDtGGhzMvs9IU4Jathv7aKVv9XrbkUCDlkURec/AvxFSpfj2bR0L8cmTNsmsCwq8Kj0+Yrfau
	T7djjZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdk0-00000003bDL-0Inv;
	Fri, 17 Apr 2026 07:35:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdjs-00000003bB8-1XzK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 07:35:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H79TIb3942119
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 07:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DrhUtaBSTzs
	U8W96kBFiB35356EKBZpAIWMjLMD2QpU=; b=QrQGF8tvSW+CXiEpxM0RycE+tM7
	tcQAz7PP9TYrnhUd58GjxYoPin0+uladLptA8UuaSSW4BPqKYS0WceXfoeLTxRSy
	x/0kF+dKwQKyoMlwTX0T461C6ssDK32I/tCvbhHc0wErW4upNftvBKVuEfiP1BHW
	AaH4Ajq+xKNtcDB/hDaZPe3Zq2VQjWJjv5p/XW0XTNccQj7ML+pyHWK/nuRfEpsa
	Z8RVmnJF1oTGRPyJEoRmPC+7OUWbpWrH0vFPQy8e7zgSR5ES8cXYKwBnteLRQ3/O
	EPpHgCMWFEzjlI5HKtQb/EDf7/FCTb3fKyhl11hoccMLXfxcbR7QFebjlIg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg7rr4f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 07:35:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2dd6fb4c867so492191eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 00:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776411249; x=1777016049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrhUtaBSTzsU8W96kBFiB35356EKBZpAIWMjLMD2QpU=;
        b=Zy+GqBa0TNDrnssEfe3FlqEzl2jLHZTFS8eIRGQN25srRmagIOdY2WLChMYD2vRvOT
         k0MTNQpS8BjSqIfPVoJwQGtbyvM784SYUPq5gzSUCuNstdgd02YqURnMSna1ex4QPtrP
         8pW5NWDVDfI9NxJrg5sfUc2UR6wNPpQuREGdNgAhopQPBbJRV13Q1uZjddUWSu3eBSO8
         oKLkLcvIncKlrXz+LFB4iKiqi+Ehhe4YaDqpD4ybCVMzgiggBsmASiZkhcjYoA4YpP23
         SGG00TVqKD+gyKILB4bheHtdQsLirEia9fYV43qmbZ8Dm+YljZRooKM+ilkJZx6kz5De
         FU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411249; x=1777016049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DrhUtaBSTzsU8W96kBFiB35356EKBZpAIWMjLMD2QpU=;
        b=j9HJdXTLOlNGrwmjU181N241TLf1iZF0ZlZ03Re45ad1RoNtHYWE/GbohbwNidgLxZ
         txdUh1j+hbhPuvmBuG9aMI9zrjHQAhb10JCg8Unqlmr573Z+x0s6P61m0Yz6yEzT2fap
         bcYOYmnJT+2uJZm+ePZ3mM2WwbhNiDPdk2mbQAOQWIqhtYTPO8DTrltOr/V3Oya7D7Ea
         fmIOZWt3hJoxj34IR81gu6NLt0kMqXjoz3SF4Giy3B7dowmJrt/FS0uxIqKbfYb8VDWN
         3H5kqaahXxxT6973dkUcF99Latb4Pi+bBhLjfPEJRT8IrVtLeJX9pU4KLnxE2UiFId21
         6rCw==
X-Forwarded-Encrypted: i=1; AFNElJ9xhJdTu4U1EqkmRvI0a8yb+mzKL53flcBaO3cycU0T3CLXVEj0VXm1BBybFGgG0v3lsGJdgpktNz7NRT817mC/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs1Hr0Nhly1ZfqzktlBZSr4xney6qWxyq0W+Th7F3iWMl3MXuC
	hT623evQ+IKG48oYd34A9smDtA9irwoaEl+8BdlzrZN+mduk1rO1khDLWf6FB6pPagGkAH8cNYp
	6GZgOhsCCjiXPb7mVH0ULoRCZjtNUTrpV7fMmoCnLKPMevOCjwts+M+KmXt5HxavRMzNk0qk/+d
	vQug==
X-Gm-Gg: AeBDiesGCLP4abrtRijCzNl1NC5RpiqpCy4EU5EJHU6Lm3pVJkkc7AxgneGwaU8CvBM
	iL3hcOGu5MVT5N6C9BNpUAzpLlrcElINjFdfsR0m+ec7JZwLnz32SiS1OOU9vxCUWw/rEmhITig
	HjlAq9VIkUxmKBSQ0Bpgn6+oGFbfw6A22YDzKos7SAq0NBhlRestOG8VcqwdA8NzVmVK6wGLxHP
	gHSvaB5jQBNxwQjdxK4MM5SqOYmw3I+ovBYFfJlPnxkjtJkHTL3ibhA2xnj8vemnpGlIz9Zx51y
	B0UCotD9AODrBATTuIEPJLMht+ZGvgouipXkrISBl5K3Ti2mNAewM6NWRCLbL62GfSYM5YbhEcn
	Or1hKjrN3V0aIXy9MZbUB5szRVJ0klh2TURkObctL7UvMJjGIPQvYTd8pR9oAbrLxrkQHUrYOBZ
	Qi0G5+h+2VV8Q=
X-Received: by 2002:a05:693c:2b15:b0:2d9:b466:5e19 with SMTP id 5a478bee46e88-2e47a1058a2mr897625eec.21.1776411249015;
        Fri, 17 Apr 2026 00:34:09 -0700 (PDT)
X-Received: by 2002:a05:693c:2b15:b0:2d9:b466:5e19 with SMTP id 5a478bee46e88-2e47a1058a2mr897603eec.21.1776411248400;
        Fri, 17 Apr 2026 00:34:08 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm1135168eec.18.2026.04.17.00.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:34:07 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v14 6/7] qcom-tgu: Add timer/counter functionality for TGU
Date: Fri, 17 Apr 2026 00:33:35 -0700
Message-Id: <20260417073336.2712426-7-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9-sY-01ZfsIkJA9HPIWR44t9bfBSrY5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3NSBTYWx0ZWRfX91BVEAb5IIpR
 Jw4ojrV83R5bylNroUyrXMqdjsCscgXJ+uT1WyFuY5XbzTx1DDKSXQTzIazfw0meBaV+jTMLl1X
 tZTqyrjU8vekyGUDgwWU4+leGJHuhNcgohfNQOQRTjYJW+av/HltoUwMC/BUDxtH19e0MNkGp9J
 alUR8GB2iqZa+wB5RO52Ea58QL7rpOZXu2l1u6HBpmYOW2DqI3soMntflCRJM09sJtbewfgKnlZ
 /cEcdVKcs4kP85vXH45hi39S1LF9BMKGATHvVdfcnBUtLiqzGPfjxOv/vhmzdBPpJCyBVkpJl7A
 4rmAhHNIvriJgvFgyQ/Bse8RZ/i4EE+7tI893EhD9RN7k329chgHifO67IymAxZdkBBekeh4xnO
 7VvW6dSdl6qkR9trEjS70SmxL9Gb0PD19E2+fwJBfZHSxbwJ5m4N8dLW3lUww9w6EVKiFIo42p2
 5yWnmcdWFMETAfaQVRA==
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=69e1e2cf cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=eGDQztGCVwpQsGOtWZEA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 9-sY-01ZfsIkJA9HPIWR44t9bfBSrY5u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_003544_413046_AC0B3B7F 
X-CRM114-Status: GOOD (  21.62  )
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
index 786cb852bbe5..7a3573e03e27 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -28,3 +28,17 @@ KernelVersion:	7.1
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the next action with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the timer value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
+Date:		April 2026
+KernelVersion:	7.1
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


