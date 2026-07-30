Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA538C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55O37ru+YI+oIT01KiSDZ0BqJT+tlTXLImDEwJE/6EY=; b=l5btbtu3NoLwIQLImPpwW8Fg9T
	c6siIJEz4PGDMpY2sVEUFPP7nNXZs6WyjAIhRsyDmXr+J3xlsm3dSk9JymddufAy8DnSElocj7fCI
	nZu0A84c43k1HXLG2Mk0dMp11t6lmWh2RE5Riwj/c6QlWsAIVoqabm94XbVcP8qS+AyDSNgz1/58w
	utKGhKwpgkdY0IspLYAW122/YhnW333FVAb7ClZz7WyWLai2mASW+0aDo5i8hfrMVYy4buddnrs4h
	fHdtTAhrZLI7E3lYqc/RwqgepbeWWCPpftjyruvJqQ0dVq7b6EaZgUP9nUyEdx7KMCWGr/DkPlGUW
	RvY6fI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLoF-00000009o2M-0Q0s;
	Thu, 30 Jul 2026 08:08:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLo1-00000009nvU-2p3z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:07:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6axJb4140869
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=55O37ru+YI+
	oIT01KiSDZ0BqJT+tlTXLImDEwJE/6EY=; b=TPeOW48QTpgwkp3XycO6fbjeD66
	5j9KPcqEIP1llETKBBq4pUQitqDxAXmifbx4evBaknrGcHEqdfn2uB6nmiQ/0l4K
	YBe1esApUON9gwMOdY2+sbK5r03CRkhhotbkK2BqPod1MjumiigkzLbSTmEnOK4n
	muaNP7ANZBqMayJJLZXR0YDlMXuP8yBdBjk9/jko1h5/j60W44SVzhCPlNgRiwmM
	oHyv4jWzoNviLGwsx78EXijT8gZwdoJDyRdtQrl0jUv1QAVNrHdzlu/cx3ng4IvP
	7Cdf7DBdtAoPze9i1BAnGH/sQkpoJ84Pql0ox6akhKXgPz7PTBhkdikr3wg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr19grf3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:07:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2165586a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398871; x=1786003671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=55O37ru+YI+oIT01KiSDZ0BqJT+tlTXLImDEwJE/6EY=;
        b=ZfV/Oygrcl9Fn2EytBA8a93Yqmr0Ck+DcfiPzCiyM4yW2/A2wjGcrMuHezzm3PDWoW
         9Pl9CHA1jsCBBnzcW+dPvP7l65+MyW+zbMmDvQlu4SwhJ0XTdPEZXJng2SW8wB6XrFsu
         rhxQzemiCHBLZy1V+Kfx9krzyXl6zjE9g2oI142XX9OxCGkMQxh8I1kOH6ZIqBFJEWs8
         uF9sll8slbTxOshvyOujdzuJwebEoFLhkAFTZQ1kvmay79kJY9Nsg/rpdve/JZ1ytUiV
         GkyzXiTfx2msdh5DoJ8KRfWllhUpXj4e5H8MZPTgiCZI9sHt35wwFJDCV+pnTObA/9XX
         Vr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398871; x=1786003671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=55O37ru+YI+oIT01KiSDZ0BqJT+tlTXLImDEwJE/6EY=;
        b=VPtECm49hLpxWSoYQpzFk/3Tb8BTUIBB5K2eo59OABM4aA1KBu+BVySj0Iu12pjLbV
         /PNc2O+gLvBKpi1dNncAYSK5b1VU+2rOA0OAWVlMCrVVbE7iTPoFvH6w5o1wxvYdnRa5
         JJRv3th2Jbbuq8mpgMfZeSjV1D/IybhBEGCc/qPFnC6uDLAH5xcOdcj2EBmpdx1geb9L
         RC2lNXhgm2SDm7jvHdPDQepG1ub3Zs+n7ZDFAsI8aPkmWAIAnd09/rb5NnwgiC7d1g0S
         RDptL6d6UnzFUUnYPub98hKlnxBIlfcE4TpernvkgztB37dfrpILkbumJsUvUe060dIY
         C3ug==
X-Forwarded-Encrypted: i=1; AHgh+Rqm6YHI5eehZ6XieQnntltt9IN6iBmmbk2J8rJqAK2P1EPsnXff57ZyigkYAcRaSB4igTvS8CGJxtYW4hAMpZ5i@lists.infradead.org
X-Gm-Message-State: AOJu0YzIVSNJITGiNYprUsmmWOsvZ9ES9tW1Kd+vinvAb2kz9PY3E7/s
	J74E0MWuja1diCOiPJ7HRsKuqNxwWXeLprA3BgodGGYw/4JZ5pc0QCgPTWMVntQNw6c6Vq8llsE
	Vb3x0Jc0eRUFHk6Zx2Z+qfBiKZyXWl3VbEx4yKVlqnmkAW7vbo34Lfb1b7U+jpk5nWpvQUxNasp
	l6Eg==
X-Gm-Gg: AR+sD11y1NytBcBapAzCfzP90EyWSY3aPwhc79W+7eebe2afC1/qoeUfc0YjL5OMP8j
	HsXAVDoF34rQdeu8/FI18Rmak0duTWx3xeJKULsVaMi7Plv1vftasmfd06u1Cuj0OMJC8SeIjVm
	ydWS0skZJlOKxGzRIbQPht19Pec2HqziQTxFx0mN5Cmtj+Y9hbpNS5Oh3gQw0m8irH/rSBgpp5H
	A/2RrxLkusS/XunhuLMAgjo9gXAYtAWIPAWllWehkbVDNbnPHPWoECexmgiuBEJNtD7VUPDhYF/
	f7tw0KEGA9JjonP4gAXcQ+MuAqXsuvd4viutn4MJXHOxbZ8QnzWKVJ+XfYaHyUUvVub59MuREwA
	cm7kS6zpHwyD3hQcHQcJZ49wu/oHF6EuZKC9M0GcAq7GRTQujPdfgsw0=
X-Received: by 2002:a17:90b:38d1:b0:387:e0db:bc30 with SMTP id 98e67ed59e1d1-38f9c07e874mr1237464a91.38.1785398871074;
        Thu, 30 Jul 2026 01:07:51 -0700 (PDT)
X-Received: by 2002:a17:90b:38d1:b0:387:e0db:bc30 with SMTP id 98e67ed59e1d1-38f9c07e874mr1237438a91.38.1785398870544;
        Thu, 30 Jul 2026 01:07:50 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9bab61desm619516a91.13.2026.07.30.01.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:07:50 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v16 6/7] qcom-tgu: Add timer/counter functionality for TGU
Date: Thu, 30 Jul 2026 01:07:03 -0700
Message-Id: <20260730080704.2903540-7-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX+SKcGyoPYDYa
 dKVoWErOja3aslsqE9i7wzdbdfc/Vl7b0rBa7zWagZ55UnfmX/KDATE8lkiTm0Ws1n494bzLiZs
 abWPHwaKU5lncjg/14EzJF+We1p/qOoIjYeN+wSqtGhYxTUMUYaOlPy62IDOgYWaYhLkcRS5XPe
 +CwACQvL60MDJkY7E0masvMUHdQCtS8VKBy+4xlsvjDqdzyJGtG5XA53sUXxUNuxoVayzzrq0OP
 9evtb+u9znl+BSZOCjNm5FRmlyJF+Ej3MRiPeXbgDTCk81+vI2jWkOEiqyPPuAwoKo57bYXnQgG
 qvH9U8rZozSnLVWfw4bCZqUzA8QmmGfxP9BRtfNBSzMLppJIBE6JkEChyJwYuolM/V1iE8sQf7f
 GUPRgogFSkq2lS8vu8xEmieeEozBxCJpDVeMES0fhAztzTySBjwc2OA8gjY1iJ2GDMRirmPWMml
 bxckiskNlAn4rmFqaRg==
X-Proofpoint-ORIG-GUID: 0B-rCbUWgFpmYZQWlxluu0JHW7LVMiAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfXyKoo+TBM1UFD
 37JIn2ZXNifWiwpQ10IYRKkAatGcieLEpKsyzPeT48rN5ZlSBwAIWMHT3GRWXVEghskRgTs0hO1
 xUgrFmnDd7bE0899CLR7ie8NyI/3lYg=
X-Proofpoint-GUID: 0B-rCbUWgFpmYZQWlxluu0JHW7LVMiAE
X-Authority-Analysis: v=2.4 cv=d7bFDxjE c=1 sm=1 tr=0 ts=6a6b0659 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=eGDQztGCVwpQsGOtWZEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_010753_731960_38BDA0C4 
X-CRM114-Status: GOOD (  24.31  )
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
 drivers/hwtracing/qcom/tgu.c                  | 117 +++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  |  56 +++++++++
 3 files changed, 185 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index fa9e9083065e..a0cad2f16310 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -37,3 +37,17 @@ Description:
 		(RW) Set/Get the default next action for a specific step of the
 		TGU. This is the last register of the condition select region
 		and is applied when none of the numbered select registers match.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the timer value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the counter value with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 7f0a74514e40..ea83273a628c 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -40,6 +40,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 			reg_index = drvdata->num_condition_select - 1;
 		return step_index * (drvdata->num_condition_select) +
 			reg_index;
+	case TGU_COUNTER:
+		return step_index * (drvdata->num_counter) + reg_index;
+	case TGU_TIMER:
+		return step_index * (drvdata->num_timer) + reg_index;
 	default:
 		break;
 	}
@@ -92,6 +96,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
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
@@ -137,6 +147,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
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
@@ -186,6 +204,18 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_select - 1)
 			return attr->mode;
 		break;
+	case TGU_COUNTER:
+		if (!drvdata->num_counter)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_counter)
+			return attr->mode;
+		break;
+	case TGU_TIMER:
+		if (!drvdata->num_timer)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_timer)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -236,6 +266,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
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
@@ -316,6 +370,27 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 		drvdata->num_condition_select = TGU_MAX_CONDITION_SELECT;
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
 static void tgu_disable(struct tgu_drvdata *drvdata)
 {
 	TGU_UNLOCK(drvdata->base);
@@ -443,6 +518,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -450,8 +541,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority, *condition, *select;
-	size_t priority_size, condition_size, select_size;
+	unsigned int *priority, *condition, *select, *timer, *counter;
+	size_t priority_size, condition_size, select_size, timer_size, counter_size;
 	int i, j;
 	int ret;
 
@@ -473,6 +564,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	tgu_set_reg_number(drvdata);
 	tgu_set_steps(drvdata);
 	tgu_set_conditions(drvdata);
+	tgu_set_timer_counter(drvdata);
 
 	drvdata->value_table =
 		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
@@ -516,7 +608,28 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
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
+
 	/*
 	 * Create the sysfs groups only after the backing storage is fully
 	 * allocated, otherwise userspace could open a priority attribute and
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index cee55f66f629..12d2381bfbe0 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -14,6 +14,7 @@
 #define TGU_LAR		0xfb0
 #define TGU_UNLOCK_OFFSET	0xc5acce55
 #define TGU_DEVID		0xfc8
+#define CORESIGHT_DEVID2	0xfc0
 
 #define TGU_DEVID_SENSE_INPUT(devid_val) \
 	((int)FIELD_GET(GENMASK(17, 10), devid_val))
@@ -21,6 +22,15 @@
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
 #define TGU_DEVID_CONDITIONS(devid_val) \
 	((int)FIELD_GET(GENMASK(2, 0), devid_val))
+#define TGU_DEVID2_TIMER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(23, 18), devid_val))
+#define TGU_DEVID2_TIMER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(17, 12), devid_val))
+#define TGU_DEVID2_COUNTER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(11, 6), devid_val))
+#define TGU_DEVID2_COUNTER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(5, 0), devid_val))
+
 #define TGU_BITS_PER_SIGNAL 4
 #define LENGTH_REGISTER 32
 
@@ -56,6 +66,8 @@
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
 #define CONDITION_SELECT_OFFSET 0x0060
+#define TIMER_START_OFFSET 0x0040
+#define COUNTER_START_OFFSET 0x0048
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -91,6 +103,12 @@
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
@@ -106,6 +124,10 @@
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 #define STEP_SELECT(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+#define STEP_TIMER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
+#define STEP_COUNTER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
 
 /*
  * The last register of the 'condition select' region is the next-action
@@ -158,6 +180,18 @@
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
@@ -179,6 +213,20 @@
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
@@ -186,6 +234,8 @@ enum operation_index {
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
 	TGU_CONDITION_SELECT,
+	TGU_TIMER,
+	TGU_COUNTER,
 };
 
 /* Maximum priority that TGU supports */
@@ -210,6 +260,8 @@ struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
 	unsigned int *condition_select;
+	unsigned int *timer;
+	unsigned int *counter;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -242,6 +294,8 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @num_step: Maximum step size
  * @num_condition_decode: Maximum number of condition_decode
  * @num_condition_select: Maximum number of condition_select
+ * @num_timer: Maximum number of timers
+ * @num_counter: Maximum number of counters
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -257,6 +311,8 @@ struct tgu_drvdata {
 	int num_step;
 	int num_condition_decode;
 	int num_condition_select;
+	int num_timer;
+	int num_counter;
 };
 
 #endif
-- 
2.34.1


