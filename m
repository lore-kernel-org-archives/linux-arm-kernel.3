Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF297FD4609
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 02:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z465nXzp8HCBbM4FmGtCUWDvb5Hdu3C6MJbefety11I=; b=vIFIIKNjL9AO7kYI0zb4CjTxCF
	MFhWiHVYZkmC12nT4zNwZCG6FMGDXZtkL5wFkFJhHGhppLVs21l6ACLs6DGF427O3HVLq5iqcWBlu
	uqH+CE3LDZu4F632Divu78okYQH93kgvLgzcW7ENwxIIJv23XS1hIThHe6hziPC320j3pj+MUoc+I
	I3xhQ+ArCb0Tdy8wTCvSykVTRPzFkK5Vh/S5fEWCAW9Yilp2X+0a1cpcVSxzmGP8ZXf6lqgRIOzNw
	/cQgTaXiyLkaPZ57AXIk6uMMVj9VI+8bGseVod9BipzXsbOpCNNilx7i32kOERaQ3G9/NPgcaZQXR
	YsmggLVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQkt-00000005DN5-442u;
	Thu, 26 Feb 2026 02:05:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvQkp-00000005DKU-1YUw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 02:05:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PGkG1W3632307
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 02:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z465nXzp8HC
	BbM4FmGtCUWDvb5Hdu3C6MJbefety11I=; b=lOAU6/ZcYPvVfNLJPEQq4gjH75H
	YxqUdBwVI6DuUK6KtgugySG/Vwi4exzQoyQ6Dnck/2gKv52xvfNzJylst84COvgM
	yyIvGcKKXaZC1PitLHKGT4/hQFrh/s/1NViUQTAn1kAOj2S8I3v/MbDULSY8cP2x
	s7rnkNih2eH4A0mMDrmTMLWU2stoWo/oRs6cQhZLJM9u5B349tnfey06d3p16IPC
	wvxCT7C6NBSiHtz+ccCUAfO835UOWQYIj7QgbnVDoGg0jU3InZaPu7u/TNNhxtWI
	6TtblXGpcS9osf/vEwKHymcN3js5QQlJhpHxKd6O1/7l2GTn/O6/GvT+rbw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj4w4sg0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 02:05:26 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6798747187eso4135245eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 18:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772071526; x=1772676326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z465nXzp8HCBbM4FmGtCUWDvb5Hdu3C6MJbefety11I=;
        b=HPhNAeYZelbtMpklj4ZGzKvEIcbqOJDSni5UdkmqVjacuer50bdqIrnCw574nsKAGc
         HasdN1zsMQHHdAwDAKZsk3zL5QAwBrwDoDzPt/CwyAPQ6ucw5wJYkQlSLZi92HGWCz5W
         VcOh5xGYrbDg25Zj4j8AFSxHAZQSiO/bi9jaRulJlvfH+rpM7C9Fkb8FvvY9q9KMtiWV
         rhrgt2bXVWipTjfWfsVYsYpwUtg8ceXGnlUYms7oU/jYs1uOW604xgrDWhSSp9vZODcf
         6Lk850Ro74PaV0RrwcdSJ4NDZDGliHH9YhWoNebce1IO2caMF5dsq3go98Hff8hTU9f3
         lWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772071526; x=1772676326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z465nXzp8HCBbM4FmGtCUWDvb5Hdu3C6MJbefety11I=;
        b=CqTw3588zB0fVKpIGSdMae6ZiUX/42dl85PZYcji5AAd689q7xh/nEvXtDJNVKoNlN
         kvtK2jSkLkYyYIGbvvTQstiaTW1ufV+fE03BDHWxJ3ox9wsM7M1/rzb9dWD91CQPtTax
         NjhyVLnJZCpisopv5+UE8HjzSDUA2ClLXSjB/up8TU9lOYGoI/clULYzyda6S59HAZLw
         PcRZufB9DBWPiq9QxlOv5mFV4Bubw35HbDx0OBMove08D2WSEaF8AsEaP9qKqoWr6Yl5
         9jAYyixTgZykeCeCo+n6FeVrJvdIqgAyyTO24lGYg4Fvua4pjWNOee5duZXQVq5nwU6A
         884Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8m8nFSguzs7Yf0buov9FVWAZF9RwNI7p/4VMrXCK460FKbId3XIgJxIyF9easI2aEiHCQ2G/fikfiNQQDuR/l@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrmg4XOIVICmseK0wvrS6DOXfmlVkJUqOAQuLqzpAMXGMw9MKz
	iCzy84ujT2XGz6ReHNLxP5YIabAYUstZvbq2P68kAFJJMmkFy+HCdXnLHdwzGiuFM7Xc3wOE3y0
	QemXPqV+o5lHYFzfAs03pZeEVMt8oW8I5KnXkrjdhkuGel3y4sqM7r6QXvoEiN4Oxot97HvDA1K
	7JdQ==
X-Gm-Gg: ATEYQzyPo2fwiM2IaXhFk/mRsM5RawxS8sMs40yl0NtC7FT1rIbRjA3hBgdithw9c9X
	3FI9D5tF7uvGvbpptw80gpqAyH/Vo3XgyHcaLbmk9NkztfLAZJH7s+DcI5xXBavGEabSefSHRVq
	T16iJcafHG9CmvkNM/ASkS3W69N8LG75f0Fo+qleQ8WZCbDcCCyIoLjAD9pCIqoZDLjrPTbiZFN
	YJ+n+NXDOnIPa7GsIaR/zSkmfIDJDnkX+0KyC7wAUv7Te1FnzcEx7sAMfkZhExkhUBR6yrUtCDZ
	Mwv+hRNhuAiKNXXXTe1Y71TtqFEvupfPzwG2FZsdfZHHcE9+UuJYXuYPJkbhoTKjRVS+zt30jlw
	wd34PBjqvCUknyjAYxbFJVusREb8ljfmnnYuDefV/hOPW2P6kesnM4C5wSa+PDz8Y/XHK7AHyDO
	oR
X-Received: by 2002:a05:6820:308e:b0:672:8d08:af5a with SMTP id 006d021491bc7-679f3dc2fdamr267201eaf.66.1772071525810;
        Wed, 25 Feb 2026 18:05:25 -0800 (PST)
X-Received: by 2002:a05:6820:308e:b0:672:8d08:af5a with SMTP id 006d021491bc7-679f3dc2fdamr267180eaf.66.1772071525405;
        Wed, 25 Feb 2026 18:05:25 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d9e8d6sm549939eaf.13.2026.02.25.18.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 18:05:24 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v11 5/7] qcom-tgu: Add support to configure next action
Date: Wed, 25 Feb 2026 18:04:52 -0800
Message-Id: <20260226020454.3210149-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
References: <20260226020454.3210149-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wOeJFiWn-3M2AKFfeoB7lscoMTC2VotE
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=699faa66 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=s623Ih-0px1LxcEVn60A:9 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDAxNiBTYWx0ZWRfXwTldDwmeYaSe
 4Aum5HpTSghAqMS89+q3PcXip6AQ3yvYT6GA0MoS6EnC4bdEGZyaLdLcPj2xvzBzXBfSQyIHfDl
 8J3oFJn1jfetW41Oo9dJpkOw7HCKWaClJ/2IKJma9LVqHPNxXrhno9FmnXr64Z1XD8LDxTlGNja
 dwuLRND/dccq4XvJMgP7fLa9l7x6PeNCLOoRt6OV4xZ7br+k5LMaHNnZRpRfraSMLKi4RzvmrZt
 TWNAS6iH+b70rYtu//Ao9j+7UEGv90Uh9NJrDWkDFx8ItveZvlVSc7551oLr6bJX3RYWJLB2pqj
 96yx9mZiMruiZcoKCalUzyz5ZLtw+qyhYBN+sJ8SPNw+iLjxVaRR0O5335lwYrgu6Q0lowVeBPz
 jhSI7X0/D8ARB+MLSwS/ufyEvd1aE7gt289jo2G81xCx3lAttHstrj6Bn+rArd4MQR63mAqUqmo
 CCjYUQHegNMoDqmJCkw==
X-Proofpoint-GUID: wOeJFiWn-3M2AKFfeoB7lscoMTC2VotE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_180527_528294_809ECED4 
X-CRM114-Status: GOOD (  25.10  )
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
 drivers/hwtracing/qcom/tgu.c                  | 53 ++++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  | 27 ++++++++++
 3 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index a18f6e4c797d..fbe8efe470d1 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion	6.20
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		February 2026
+KernelVersion	6.20
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 85fe1140eab5..1d996b9e303a 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -29,6 +29,9 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 	case TGU_CONDITION_DECODE:
 		return step_index * (drvdata->num_condition_decode) +
 			reg_index;
+	case TGU_CONDITION_SELECT:
+		return step_index * (drvdata->num_condition_select) +
+			reg_index;
 	default:
 		break;
 	}
@@ -71,6 +74,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_DECODE:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->value_table->condition_decode[index]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->condition_select[index]);
 	default:
 		break;
 	}
@@ -112,6 +118,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
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
@@ -146,6 +156,13 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_decode)
 			return attr->mode;
 		break;
+	case TGU_CONDITION_SELECT:
+		/* 'default' register is at the end of 'select' region */
+		if (tgu_attr->reg_num == drvdata->num_condition_select - 1)
+			attr->name = "default";
+		if (tgu_attr->reg_num < drvdata->num_condition_select)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -184,6 +201,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
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
@@ -223,6 +252,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 
 	devid = readl(drvdata->base + TGU_DEVID);
 	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
+	/* select region has an additional 'default' register */
+	drvdata->num_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
 }
 
 static int tgu_enable(struct device *dev)
@@ -356,6 +387,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -363,8 +402,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority, *condition;
-	size_t priority_size, condition_size;
+	unsigned int *priority, *condition, *select;
+	size_t priority_size, condition_size, select_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -415,6 +454,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->value_table->condition_decode = condition;
 
+	select_size = drvdata->num_condition_select * drvdata->num_step;
+
+	select = devm_kcalloc(dev, select_size,
+			     sizeof(*(drvdata->value_table->condition_select)),
+			     GFP_KERNEL);
+	if (!select)
+		return -ENOMEM;
+
+	drvdata->value_table->condition_select = select;
+
 	drvdata->enabled = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index ca8dfbef0cd2..5beaf82b4b8c 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -53,6 +53,7 @@
 #define STEP_OFFSET			0x1D8
 #define PRIORITY_START_OFFSET		0x0074
 #define CONDITION_DECODE_OFFSET	0x0050
+#define CONDITION_SELECT_OFFSET	0x0060
 #define PRIORITY_OFFSET		0x60
 #define REG_OFFSET			0x4
 
@@ -64,6 +65,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -77,6 +81,8 @@
 			reg_num)
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -108,6 +114,15 @@
 	 NULL               \
 	}
 
+#define STEP_SELECT_LIST(n) \
+	{STEP_SELECT(n, 0), \
+	 STEP_SELECT(n, 1), \
+	 STEP_SELECT(n, 2), \
+	 STEP_SELECT(n, 3), \
+	 STEP_SELECT(n, 4), \
+	 NULL               \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -122,12 +137,21 @@
 		.name = "step" #step "_condition_decode" \
 	})
 
+#define CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_SELECT_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_condition_select" \
+	})
+
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
@@ -143,6 +167,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -173,6 +198,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @num_reg: Maximum number of registers
  * @num_step: Maximum step size
  * @num_condition_decode: Maximum number of condition_decode
+ * @num_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -188,6 +214,7 @@ struct tgu_drvdata {
 	int num_reg;
 	int num_step;
 	int num_condition_decode;
+	int num_condition_select;
 };
 
 #endif
-- 
2.34.1


