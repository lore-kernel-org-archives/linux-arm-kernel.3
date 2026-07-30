Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D36C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfH1Ck28PN3WVuajMVN8VUNzgsO8gPW7AD8bgfNeufU=; b=3fr+LRo6j46hv/Q5mmB4+BEMM7
	akwY8RD/j2QmjE7J4UaewLEhjx+T/DcQdEaLdTvOq8e825fR4Jk8qltB3gp1h4nh+x6NwZMuo4ADZ
	wu+DX+Kx6ICipGi8Ki+Yd5OsZMcW/d0exoEwj8HE5Dhl/+Ra0PUwLYAr4TUjQTzeZmv6WgrqaePNV
	Q0pvL71XgvQRp/44b1vLeogMnhhqlMWboCio8LE+O7dq0Pn9XXJhUNYF/HeGrdKmd1xbHxxzEj7nA
	hn8mXn19HrbkqRLDHCrKnCHt1cRZlwZfbl4UYtpKDszts+I3IM8PNYmxGfXnbVQc7Z0fetTI3rlpF
	qoLouncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLoF-00000009o2u-1sOL;
	Thu, 30 Jul 2026 08:08:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLo3-00000009nwN-1h5d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:07:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U7xqT7395690
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DfH1Ck28PN3
	WVuajMVN8VUNzgsO8gPW7AD8bgfNeufU=; b=lBVwFDwBiexPCUDBOKjEJXHp8tg
	mXgWWlgWVwuwhk/6oWoSCW41J9fINEea6wrjjQGgQNWpeZ8j+DR2vSltfDX1D8j3
	yhZZrHNVXk0EhMhY6wfM2xmRWTiFD4Xc+p4Qd/3hk22Vul6AeK2Tl3a3MpFm1m4K
	RMqHpQUroBabBZ5w6i9A06i2VcY7kEbeFUnrt95QaSuOMQ1QdEl0tkEPauVZ5jju
	FytY1/+CjjHuhY/6gMRmyymiI3Z8GMMolXcoOBUfIJPm9uO3mjxeN9lB0bNrKJl7
	A4pVr+S3WloTBBxh+Q4nEjZEv9CShlPWqj0OV2563/gY6vdBG76IVhRZ3uA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2qbg185-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 08:07:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so23228265ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398869; x=1786003669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfH1Ck28PN3WVuajMVN8VUNzgsO8gPW7AD8bgfNeufU=;
        b=bKPXs67mJnuOGsdyS6wvbHo6sVH817KfScr5copCfItI5f2QFpfTAJkg0Crfl1NgJu
         dV7HJV5ZmmgTODzfFGYRecdhDbnxnc7Y2Tb4hJgXh6seYj4wpL60dKNWGUnELu+3swJf
         zQVWfU3uMbWWTcXz7SCxh9wHkTYN+gERKs7Ft4liejZQBvKFp9/oP6qPRHIHrZPj5/Ay
         /+A6fS7ennNr3NK+ayENHIdkmRrc7FFIcqHvDt5jC57Ok95U5HTlOb9yn31LUjm949wq
         +0OhE1nAxrqxUoNPSjeO7IFMlETInZFt0+vIrgNiOZl7EzzvgMgQUWJwUCvDPce7jXDC
         YDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398869; x=1786003669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfH1Ck28PN3WVuajMVN8VUNzgsO8gPW7AD8bgfNeufU=;
        b=SNPyTzOeDo/6mwBk7073d8nkVOQOqdQ64L0Erh/6b67b+CLsjIgfeVKeBKADKNVJJs
         ZKQgbEpIi//OXoqHo/WnS/OX+fl3TPbggHF4o4K9bb6Dv+SxFNo0kJr+Y2pJOYgzy/qq
         z6C5YKtbbVvKbRLwlJFC1H2R55+GJ2URjpmhzI+VX9Ah9+HRbpN0Q7QVbUfSf//dPDY6
         LcWbtfDYcsPhRbVoNiBzyKn6MnQfjz+vy9fXWXSH90E7Xgnb2X6GSggg5I6HfUMe+ur5
         bXz9dhfd0Zsp2WBfMV/qEk338oLUD7kq+H8Se8nA4zKgk95wj7EssxJ76h/jbB0MJZyC
         KqLg==
X-Forwarded-Encrypted: i=1; AHgh+RrO1pR50/0nfD02PaPR1zIL8Of4QbQz3/xOBaYLp5RXmvdX6juUC2R9lHWsWw8mhtdSRsOhK6qh4rFrbiChHRQ6@lists.infradead.org
X-Gm-Message-State: AOJu0YyXIujV5kXKLsDTPHSrq8+Fdd6jhqcT3Xrys7ZIK995ic+N4voU
	jZYkoq0jKyhceVXCmuwgOBdvm2xPu6iU5BAwBTew59pXNK/Bu4fuLHyD4qjHj02LEd9srI7uW2B
	OKn/CWr/ePx93Qs3RCLC8X2vynbnQj+JBK2QsMI/WajO/rWmw7n7kGbQ+nCXDawIP2Eo3M1jar8
	P8Hw==
X-Gm-Gg: AR+sD12L05HPOWzaCimzqq0PgvJjZTcTsQ15tQbs4uyC0t5s8vyA9GWWWZj+DUCe6qs
	1fmsDpHOj6223tcty2Mjiph8TGtFHzh0GIp1VgxaFbDhUaHJZKn+ItdqSZmlfPmvhTYqRNP8DIj
	7GgF968G4ly/5SVkJz4shVhCbjUX+Yb2QgxSEESv2KNY0rJqbNKA5VbRskW4WbxJbiNolSPBmR0
	1Yyb+5QVYZe0DjrxzhqiulvcsdvCCcJnc29LtoMzk2w7y+zDRuAvz6JdtcJ1JrGfO2T+11oc7/3
	TCr8g9h91b+PoeuyfWzLYCoYITS2UQZEpryxgKrXJ9f+gmdsRMwciORbnOQuZxcMWp0R6k3JeEl
	N7p0C6pcUUMSJ2xhQTX/Q1FIqsvxEd6XOUh4vGy8TnZhgDlCuIhsqnfQ=
X-Received: by 2002:a17:90b:1e41:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38f9bd692c0mr1274845a91.7.1785398869216;
        Thu, 30 Jul 2026 01:07:49 -0700 (PDT)
X-Received: by 2002:a17:90b:1e41:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38f9bd692c0mr1274810a91.7.1785398868613;
        Thu, 30 Jul 2026 01:07:48 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9bab61desm619516a91.13.2026.07.30.01.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:07:48 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songchai@qti.qualcomm.com>, songwei.chai@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v16 5/7] qcom-tgu: Add support to configure next action
Date: Thu, 30 Jul 2026 01:07:02 -0700
Message-Id: <20260730080704.2903540-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E3JdaV4sEvb6xhJhtY9nYWwVrFCNxaVA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NiBTYWx0ZWRfX7nECQE7R0qYd
 abHW0PT21cLzV4TaYeABoxlV+4vQ4rV68zLIcKRGVX3JT6XHYpb/1/GiijC4200BWlpb2jGGACR
 O7G/8xqN4xlD9Q88epilzOxB9P7bWDV+hQKh8AQvc3fTLlzVrhl5jqsXSMG7P7zKnqDxo9AGxcU
 6d6bh491E0Wh5vTbAIA5X9Zcp9H0EcQc7HHhhAB2PVKvBuVthVybsNC4b/t439WNjVyMGWzaH6x
 3DYYXPOhqzQs/10D8n16nLXqzruf8+eZwrt37K+Hib5A3dABW9UM8M6z1iPs21kBLmUFcCUWPbs
 CODX6Z9JwEeg4URlNWxnGh8loLRdkDPZcHe1sVPMUXTLLMPJFB6s+QO1mtNKAwtJnV4qq+BnJmh
 VNzC66WJm6DoP86AgleiHXKK5uzfKQfkSPu4fPgF6Lf8xeoRyDon8gREiMTzLp0wREt7WPEs+Nz
 dyGSUSoiApjK+YQsg7g==
X-Proofpoint-ORIG-GUID: E3JdaV4sEvb6xhJhtY9nYWwVrFCNxaVA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NiBTYWx0ZWRfX0236xbbeSIN7
 NNfd8+56RV6lzL4j8K5bXTTtlyayVUjzdUcTsQb/Ryon/z4DY/3wVSZdyNk08lrhf11pFVWiQ4s
 vEM4paUiBnrY8PNEfFI4ffC5qoAonIA=
X-Authority-Analysis: v=2.4 cv=SoigLvO0 c=1 sm=1 tr=0 ts=6a6b065a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=M6CtMt7H_-T_vrAemPkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_010755_468103_A54F29A8 
X-CRM114-Status: GOOD (  26.73  )
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

From: Songwei Chai <songchai@qti.qualcomm.com>

Add "select" node for each step to determine if another step is taken,
trigger(s) are generated, counters/timers incremented/decremented, etc.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songchai@qti.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    | 16 +++++
 drivers/hwtracing/qcom/tgu.c                  | 68 ++++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  | 41 +++++++++++
 3 files changed, 123 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 705e75c776d4..fa9e9083065e 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,19 @@ KernelVersion:	7.2
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/default
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the default next action for a specific step of the
+		TGU. This is the last register of the condition select region
+		and is applied when none of the numbered select registers match.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index e83295217e7a..7f0a74514e40 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -30,6 +30,16 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 	case TGU_CONDITION_DECODE:
 		return step_index * (drvdata->num_condition_decode) +
 			reg_index;
+	case TGU_CONDITION_SELECT:
+		/*
+		 * The 'default' register is the last one in the select region;
+		 * it is exposed with a sentinel reg number, translated here to
+		 * its actual position.
+		 */
+		if (reg_index == TGU_SELECT_DEFAULT_REG)
+			reg_index = drvdata->num_condition_select - 1;
+		return step_index * (drvdata->num_condition_select) +
+			reg_index;
 	default:
 		break;
 	}
@@ -79,6 +89,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_DECODE:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->value_table->condition_decode[index]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->condition_select[index]);
 	default:
 		break;
 	}
@@ -120,6 +133,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->value_table->condition_decode[index] = val;
 		ret = size;
 		break;
+	case TGU_CONDITION_SELECT:
+		tgu_drvdata->value_table->condition_select[index] = val;
+		ret = size;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -158,6 +175,17 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_decode)
 			return attr->mode;
 		break;
+	case TGU_CONDITION_SELECT:
+		/*
+		 * The next-action ('default') register is exposed as its own
+		 * statically named attribute and is always present. The numbered
+		 * data registers occupy the positions before it.
+		 */
+		if (tgu_attr->reg_num == TGU_SELECT_DEFAULT_REG)
+			return attr->mode;
+		if (tgu_attr->reg_num < drvdata->num_condition_select - 1)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -196,6 +224,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_DECODE_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_select; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_SELECT, j);
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
@@ -268,6 +308,12 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 			drvdata->num_condition_decode, TGU_MAX_CONDITION_DECODE);
 		drvdata->num_condition_decode = TGU_MAX_CONDITION_DECODE;
 	}
+
+	/* select region has an additional 'default' register */
+	drvdata->num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
+
+	if (drvdata->num_condition_select > TGU_MAX_CONDITION_SELECT)
+		drvdata->num_condition_select = TGU_MAX_CONDITION_SELECT;
 }
 
 static void tgu_disable(struct tgu_drvdata *drvdata)
@@ -389,6 +435,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -396,8 +450,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority, *condition;
-	size_t priority_size, condition_size;
+	unsigned int *priority, *condition, *select;
+	size_t priority_size, condition_size, select_size;
 	int i, j;
 	int ret;
 
@@ -452,6 +506,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 				drvdata, i, TGU_CONDITION_DECODE, j)] =
 				TGU_CONDITION_DECODE_NOT;
 
+	select_size = drvdata->num_condition_select * drvdata->num_step;
+
+	select = devm_kcalloc(dev, select_size,
+				sizeof(*(drvdata->value_table->condition_select)),
+				GFP_KERNEL);
+	if (!select)
+		return -ENOMEM;
+
+	drvdata->value_table->condition_select = select;
+
 	drvdata->enabled = false;
 	/*
 	 * Create the sysfs groups only after the backing storage is fully
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 8b6a46995a5f..cee55f66f629 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -55,6 +55,7 @@
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
+#define CONDITION_SELECT_OFFSET 0x0060
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -67,6 +68,8 @@
  *   TGU_MAX_STEPS            static tables define step0..step7
  *   TGU_MAX_PRIORITY_REGS    STEP_PRIORITY_LIST defines reg0..reg17
  *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
+ *   TGU_MAX_CONDITION_SELECT select region 0x60..0x73 holds 5 u32 registers
+ *                            (the last one being the 'default' next-action)
  *
  * A device whose DEVID reports counts above these bounds is clamped, so writes
  * never fall outside the ioremap()'d window or spill into an adjacent region.
@@ -75,6 +78,7 @@
 #define TGU_MAX_STEPS                  8
 #define TGU_MAX_PRIORITY_REGS          18
 #define TGU_MAX_CONDITION_DECODE       4
+#define TGU_MAX_CONDITION_SELECT       5
 
 /* Calculate compare step addresses */
 #define PRIORITY_REG_STEP(step, priority, reg)\
@@ -84,6 +88,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -97,6 +104,20 @@
 			reg_num)
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+
+/*
+ * The last register of the 'condition select' region is the next-action
+ * ('default') register. Its position depends on the runtime value of
+ * num_condition_select, so it is exposed as a dedicated statically named
+ * "default" attribute carrying a sentinel reg number, rather than renaming
+ * a shared static attribute at runtime.
+ */
+#define TGU_SELECT_DEFAULT_REG 0xffff
+#define STEP_SELECT_DEFAULT(step_index) \
+	tgu_dataset_rw(default, step_index, TGU_CONDITION_SELECT, \
+			TGU_SELECT_DEFAULT_REG)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -128,6 +149,15 @@
 	 NULL               \
 	}
 
+#define STEP_SELECT_LIST(n) \
+	{STEP_SELECT(n, 0), \
+	 STEP_SELECT(n, 1), \
+	 STEP_SELECT(n, 2), \
+	 STEP_SELECT(n, 3), \
+	 STEP_SELECT_DEFAULT(n), \
+	 NULL               \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -142,12 +172,20 @@
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
@@ -171,6 +209,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -202,6 +241,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @num_reg: Maximum number of registers
  * @num_step: Maximum step size
  * @num_condition_decode: Maximum number of condition_decode
+ * @num_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -216,6 +256,7 @@ struct tgu_drvdata {
 	int num_reg;
 	int num_step;
 	int num_condition_decode;
+	int num_condition_select;
 };
 
 #endif
-- 
2.34.1


