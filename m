Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA92AD232CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 02:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VN+NLUr6REuiKzvXSuFSTv5hWAaHT1JfLZCPjKK8pmo=; b=Hj850RvWq6Qdh9cqHb0SvMfIHm
	fVyAnGLJ6uuEgM27N9V5LyQ8URg2MhDEBo055y0KGvlkHVtXqDdcockAwsUIE59V8ELdDKFTaSCmV
	FuHJtmns6TrbmDcwO1ba4djt1CdMF/O30ugpJg8BlDp8uVUQRM5wC49QQxs2Ca1gvxowRXGTpe2lv
	kl3hqisfCmrYElmVLUcXyk7b8UapCEN4L9qTZtpjm6FD5KKX9lZApru5kA/5ZVyIMdSpUZm2BAj4/
	Ftv/k0B1lffJqlZ9F+XQMdkTSpmNRAC+IFhSbRwUrFl2D4urFJOrfkMorHOSb7bYzGYe1cnm7F3Dz
	YrogDsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1zE-000000016g0-3lds;
	Fri, 09 Jan 2026 02:12:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1zA-000000016bC-43Qn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 02:12:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608MpwPK3220708
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 02:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VN+NLUr6REu
	iKzvXSuFSTv5hWAaHT1JfLZCPjKK8pmo=; b=I7IzEYfn4/qwNGCbxIXVx9xmsht
	4nBSEAqubgFJ7pxNaFU7ilbhrjXvhXOPL/5x9EVHewyM1PB02Tx25fjaSFvBcJix
	yipXDunXo0b5FVwyZYBReWhnmozJGobsooGUFXOE5HATTfVjeMTGBYvi0Yu6U6gI
	ycgPwSUSVcGR1H03255Lcl7rAR8tdQrbdM+XzdWNT4Nw6HNAecwo+hMUn5nv2zEE
	rtjJIyXT1mTIu2pruT0ojH8e4XgvQLwvRzOeA7PXtQrDGktkmt5YZ1olhDjmOuKX
	+ADYYgKCdIWQAsaMmX1+emYF+uFwMDtZTpOwmV4DVzRQdi0HJncvIEYDYLQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjt0gu51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 02:12:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b0530846d3so3158681eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 18:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767924739; x=1768529539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN+NLUr6REuiKzvXSuFSTv5hWAaHT1JfLZCPjKK8pmo=;
        b=J2ZXxtmE6ypMKxw+o+34S3jRm9HU7PfTDNdI5wuXi1ViLoifPLoJ4pDUY38G7lCOiK
         agWtTf6IK5yb6QRtDy6BfbyLA6UqJ5rftgIHNW/Z42fC25SJokQFaJeuL7rf1QzCj/ek
         qGEJyRKZGlgP5Ufzf/zB5QDJb7KCqDAAUbNBElwNKVqhoZZSKRA4mjBaqPVbxBTQSW80
         A5A5ic3ha9ZkfcZQTSjvnBTrhfpe/atrfo+5I1C/pdzvB4qGssclTz9+peGMdim1fZBH
         EfcztW1tnRCGtxRAg8XBfGbzuVNZFY7EmCvwTKm3seUz3pQDnSBsxJ8g9+XRHYVTcDg2
         YHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924739; x=1768529539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VN+NLUr6REuiKzvXSuFSTv5hWAaHT1JfLZCPjKK8pmo=;
        b=O2xQSO7xkNDEUbZLf7mfZboXUWo5XdhPQ4kfP+sN/7vBpW3mO1JH1+kQ+vlLZGgj2W
         CVRt7L77BXmk97mp0OKzRjkAMtKxWi0op8XI3bJaoASit5IF+0lH309PqdtoAWGvX3QN
         /X0NCTqxyAUBPe/NLT+LQ4/z64blGK8dXCEDjaiCrFgQedDE4ti8E930hPa2Y51fJCsI
         isrQRWEeKDVovSOJ+3xVFnq5bbcgNgyGqaoQaTUefqvUEsTYXSA10SQCgizL310fXrfy
         q/QiT8AvGIOl5mf7XGmkk5+rH5TdfqnownqAYr5thPqREsuTpAXI1T0z/v/KqQQ6Bj47
         4USQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVkOpw2WdHJhZpVEn8y4FUixNf/u5yig6nwlaqaDBlbNE11qSv94s22luKA+TbhCqMPZHoVU1Nj6iV2HUku6Ps@lists.infradead.org
X-Gm-Message-State: AOJu0YxBx7y/3bubBXIFN8DogViaqIq0OOWygboeRqBgwgYxB2WNoRj/
	pn08/8zKruur/ITBx32UvGOcRACXuj3pC+KNV41MsmOk6JCGeS7s26l8Ry9OJXhnEdryLKL+kmr
	7rFxhhAMVhKwZqBlrO/5BgkhIWp175VFK0xKx/WbI+yStYJ1UskoUJmQITbJDunr4Fs8r4W6wqA
	QLtg==
X-Gm-Gg: AY/fxX4z/Q4t6nmDQUbcdvIaG+66wi5LS0J4l4PLYe56UUypSBMONVI23SoaiRbpgoK
	p3wsC9PPkKicgxtO9QYj4Mp91/ZGLCm6ApDaTtfJSztE5dV40v+U9scPSpojLdDMapKPWL+MTbs
	GBf+pnywQILZxors/eH/MLrQHQDnsyQYZqstgMITpysEleQ5+9bTEPKvZ5OpNjY0C37/h+h0rSc
	JdTvCq8kx8jTXfj8EQIS8MpGa/RnomTPKJkZRwgfOuk4Z9tN10cLHW3Srjxp7TJZiyOM8cHYo8Q
	vLdFYZ3N26NTgR9vMo+xPnz9IvqFSjeGxtCi9AS1J7HzdD41HSgUM5k2u7pJKb9BzQFrUPlHsU5
	lPnAoGFGkzOkfR44cI0Pze1g7l9YQe7qEa92NmONWRCv4POTg6srpLwAShibepytW
X-Received: by 2002:a05:7300:c7cb:b0:2a7:1232:f3a2 with SMTP id 5a478bee46e88-2b17d069324mr4710510eec.0.1767924738393;
        Thu, 08 Jan 2026 18:12:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNQKSPU9AaSxqFHao7LN5YXfpKAC0MLeIPxREDaQEYuh0jQ7nhOShJHhPVFAwqyO7aLAVLLg==
X-Received: by 2002:a05:7300:c7cb:b0:2a7:1232:f3a2 with SMTP id 5a478bee46e88-2b17d069324mr4710489eec.0.1767924737731;
        Thu, 08 Jan 2026 18:12:17 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm9459111eec.33.2026.01.08.18.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:12:17 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v10 6/7] qcom-tgu: Add timer/counter functionality for TGU
Date: Thu,  8 Jan 2026 18:11:40 -0800
Message-Id: <20260109021141.3778421-7-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LxQAwrDKwaFlUBlrBzMidvPyret0_8Hj
X-Authority-Analysis: v=2.4 cv=VJzQXtPX c=1 sm=1 tr=0 ts=69606403 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eGDQztGCVwpQsGOtWZEA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: LxQAwrDKwaFlUBlrBzMidvPyret0_8Hj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfX9HeNx/d/ItX5
 rp8a8lexs3euo35l+6ItBXLSsfAwvNlLUxDCTUKEJN5DgEyZdd7P0p5bJZbjmgqW3L/W3BJbXds
 T3LV1kNqo8R7f89bl8bdA18bUF3l74lAYwxyx76E78mv18XYc43JKo/wjRbQguNiUlrRvqt300a
 nrFicf99hic0gfTPePMMYaQjbH1gRC7hlUuYzQVpPnakLStnthEn1OmKtcrQOiIJvagtaPv6Gan
 ZSVMGfu+oz8u8/MHvbK69ejBZ/jCkMLYoz3t2mj4cMWp7iDobUjnB5vuPp8sx+pGONhXEBf7SVB
 oFTyIrbFZoOBQUC2KObrBJp4H7K83ZTdBdv/PpxfVv2A+UbTwZ3Cq+WVmRv+jxMx6FEks7zK7c5
 DbFHyTMKFne9TBn78MMdwqSlrS1CEKdd1p17iKuE1h7FvWu9k8AY3ZLNpvtkt6adjES52chW2pd
 Gr39R5goUDj8yHWm0IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_181221_140250_14D5C394 
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

Add counter and timer node for each step which could be
programed if they are to be utilized in trigger event/sequence.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 ++
 drivers/hwtracing/qcom/tgu.c                  | 126 +++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  |  54 ++++++++
 3 files changed, 192 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index fffe65d3c0db..61b5a08bdee1 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -28,3 +28,17 @@ KernelVersion	6.19
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the next action with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
+Date:		January 2026
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the timer value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
+Date:		January 2026
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the counter value with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index e1a1f0f423ba..a3d9c3c4e28a 100644
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
+				drvdata->value_table->timer[index]);
+	case TGU_COUNTER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->counter[index]);
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
 		ret = -EINVAL;
 		break;
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
 	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
@@ -399,6 +484,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -406,8 +507,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	size_t priority_size, condition_size, select_size;
-	unsigned int *priority, *condition, *select;
+	size_t priority_size, condition_size, select_size, timer_size, counter_size;
+	unsigned int *priority, *condition, *select, *timer, *counter;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -426,6 +527,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
 	tgu_set_conditions(drvdata);
+	tgu_set_timer_counter(drvdata);
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
@@ -470,6 +572,26 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->value_table->condition_select = select;
 
+	timer_size = drvdata->max_step * drvdata->max_timer *
+		     sizeof(*(drvdata->value_table->timer));
+
+	timer = devm_kzalloc(dev, timer_size, GFP_KERNEL);
+
+	if (!timer)
+		return -ENOMEM;
+
+	drvdata->value_table->timer = timer;
+
+	counter_size = drvdata->max_step * drvdata->max_counter *
+		       sizeof(*(drvdata->value_table->counter));
+
+	counter = devm_kzalloc(dev, counter_size, GFP_KERNEL);
+
+	if (!counter)
+		return -ENOMEM;
+
+	drvdata->value_table->counter = counter;
+
 	drvdata->enable = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 8c92e88d7e2c..94708750b02d 100644
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


