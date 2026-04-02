Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368ACD39406
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3ohFTGXI3Em1WV/owX09SmkHTBw1bejtZk7T2akX+I=; b=BoJALGPJENlBvFqvYyjU4db0cy
	NqvW4bp3c+SyRF2dLtoeKT2NsL57ZIQpfPj9wEO0nZ2sq8/zFD/E8aJdiLfnF13yQ1eBDryt0ihb4
	iEr33vPhV4c3n0lyVYB3yx5t7TmlxQXLak9JrLZcW8VgWhxL7+mDEGMqSgQO51Na6QTUG+cKfGoDD
	ZBQp+MDavzowwy4BubPolUlxH81enpu62/QszLzIErsJPExIgBlV80RroZl+wyqzKnS50/c3IOVw6
	6ECatbWATe+H/rAHLfHmSDN8L158f2GfhyvDXqS8OUrSD8I+A8w1nPAwDkH9DpGCBeCTvmGbDSZZ+
	czAIaFzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EMK-0000000HGpi-1JeH;
	Thu, 02 Apr 2026 09:29:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8EMI-0000000HGnV-0n6d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 09:29:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327HtfZ4009493
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 09:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H3ohFTGXI3E
	m1WV/owX09SmkHTBw1bejtZk7T2akX+I=; b=Ltv7CY98ZVPGdW6o0oUAKLo7EVp
	8LyU1nCPRvera+Nsfboxq7qYJWAEFiHzZO2lgtEqmmu1SAywMzZkFBz4eaqsbEam
	orcEeeEt4gr2lPIyTrRb1cLpUPicNEXC48y/MMGu5uCi+gFqhY8xUkiXjGmuY5xi
	1cZZ3RqgeEGjca/ps0buHq3mPiVTKxstveOtAYBWTs+jov4eVwBRg91bK4wExn5r
	JcwQ0p+5JDiD31xbWZ7kZGDqbhOVOuDXwDneYmVxFwBJtOdZi/YnXsR0w3IuTjpN
	xaFc8aB5dO5XD/ON71fT8iav8jG0/3uJcvJk+4cLTI3iwx8C1mk0q2UyqaQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e039kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 09:29:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2cb6f605b95so299756eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 02:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122141; x=1775726941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3ohFTGXI3Em1WV/owX09SmkHTBw1bejtZk7T2akX+I=;
        b=IvN0K6lC1CBmSEGQMsgmJFKxOrQDiJ+uhV4DfWZrCbdpVg4AkKW+5Y8Rv9YjL1Y8t0
         WjRmvfg4U7KYv0jwUBEg/tWqQ1vyajZRNdY2qqySwhAYsErFdlnncFbOUMLyfhOZZ6Hu
         KIe/WSDbwECong6V5S0QfJIW/Y7wXM0QQ00ULLI4b1KoxK4WSx5XVO3kjgOQoDmjc0bO
         Kds7nrwfzMW26jQNY9xerkXZVeN7A3lGPyFO57MBZIGCVoJUlfw+hO5TtBOjJWEJlHh0
         MqLHkmt3j/ociWS417+VqPIAUfiLGmOxDoqt9SPXvLkGK5nj0jvTnUGLCS3YPHto4s1S
         BOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122141; x=1775726941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H3ohFTGXI3Em1WV/owX09SmkHTBw1bejtZk7T2akX+I=;
        b=Q2ZSk5Mvi+es0EnEnuFaazPr9S2744SGjOHRX8kuoZ3GBWMZTTqZjuhIOf18j89Jka
         V3cl+LAQQlyXEdwLBk8mMoEn2KXSgsjwIQZYci0rAazDK/V0R9fJSb86xlrbDTxEeV1a
         twhIvvaPjTUX8oBefqU++0KmhjWQ7hFCOW1q/pRGguEY6Z8vEwq0ipSxIXxi0yI0OyJL
         GJxW79kk9qleUNds3j+wjvM9011R2qF8wUTMRonQHeBFOgiLJPlSIDV4+9p9cdlK6Kom
         yxWb0hNcQjexi/jpf7iQgbOUsRYB65hluK2Vt21f1EvsHk4gp3rSnbR6nssAQ+6Au+gY
         R8wA==
X-Forwarded-Encrypted: i=1; AJvYcCUDYhEOUo6UZjWD+UbtLupCMuZW1Nid10D+ehWQ/XC2itAZtolQZWekGlhe2GGJ3+Qn64lROjguidLDXFiGlywF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz17pDx1nMTvwYFT6L85fdCtbUE7jgeIzEBVfm4cbXyTFgK8N3r
	SmHD6uziyjWf31a3nTeG1eiZrmSA6MJl+zaXocckoGUML/tYfCbb31DZYoUmxSwKnahTuE0fXr/
	xBz4u4OlkahFjZ/1S1cYGj6sZPf5pMKl5vXTZVzDDbvAbusUN7BzHX/fjfk/zkMkhUVw6oy8WYJ
	Klvw==
X-Gm-Gg: ATEYQzwM6jhwhYn88/TR6cjjG1zAOZLvDt4MDL2WcscoTx1WPcEb2VvM+LysnZVsCyx
	5mzx4HZKhoxnLfNJsmQAMIvhf7mQtUeGM8O7hOW9f3FkvFGijmOsD/mVEefwq1JeSXdUPWD7v0z
	ho6WqEOQ3U6rk7FY/W/g/ADBYLk7wjtU4utR/96wlbZkkZ6bHpfInuM3kFf/3xlmfZQkELP8jp/
	dT6pdjCJzMuE1Y1J+YqhfvUP+NWvcIJlQxF4YAeu8MoiXgv7P+sf3ZqDQg1JZT6CG3Z5vTzsVlK
	wyFf7Dcr71bRfYgr6CJ3nmVOvCNgGyoQr/U2l5XJIr8YtHEMBzxXMSxnNEPTLn0lG86ppZbYlLK
	FTRJseDEr+fIFhNw7adNL1zX57aouq8Rybtv5hgSyozHbms36YyAziw2nvH3jXPn60rX6qui6RI
	7J
X-Received: by 2002:a05:693c:2b16:b0:2c5:60d0:7031 with SMTP id 5a478bee46e88-2c930798b89mr4003045eec.4.1775122141050;
        Thu, 02 Apr 2026 02:29:01 -0700 (PDT)
X-Received: by 2002:a05:693c:2b16:b0:2c5:60d0:7031 with SMTP id 5a478bee46e88-2c930798b89mr4003017eec.4.1775122140493;
        Thu, 02 Apr 2026 02:29:00 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cafd073194sm951094eec.28.2026.04.02.02.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:29:00 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v13 5/7] qcom-tgu: Add support to configure next action
Date: Thu,  2 Apr 2026 02:28:36 -0700
Message-Id: <20260402092838.341295-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69ce36dd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=s623Ih-0px1LxcEVn60A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 28fIuaO-DN5f4VgQ5Oza8xEgCG4H0P9P
X-Proofpoint-GUID: 28fIuaO-DN5f4VgQ5Oza8xEgCG4H0P9P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NCBTYWx0ZWRfXxQaUbQEVcuA+
 /x3MHjYf/PlBVDwyuwSHh9cdMBtepD7R92afNMI4hxxSEuKIATdnB33GNnB6tgnMH9GtL7uVVsl
 N1l2NTAmzMyUdjDfUtuGjYSnTYawDJyhHOHHU0yMYox6DHYTYhMrjhKInQUG80cQQNTieJ5qo2l
 F2QUN0uT/B8mcUE1K/8pZk0CoD7GbfwRRNQpf9hvQN/7gtn/Arwxn9V/ox2LCb2UTDCgTWg/dic
 G6oxgvS1Zq3GN4RMDKBp1/afKBNbVG95+4IssEhL2SSHMuwsBKwed05NMUM7D4OaR6L/WTJnFDP
 RL2bXhCAPTO8UIgAWcBDmJQLbvY55zXUlI98yRmRkLvrizWRZ4+D0KUoKKDSJJabC5dz2vHxtBI
 HhKvHZ0hyMaJpDWlIaaPfwuF2Zt0yTkJ8TNRRbRe9N1MgljJSzVEYZZ3/coacTGoP3m4R4fE8AZ
 OwkcV8lkglcPic8O3wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_022902_247121_2F2A0AAE 
X-CRM114-Status: GOOD (  24.84  )
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

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 +++
 drivers/hwtracing/qcom/tgu.c                  | 53 ++++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  | 27 ++++++++++
 3 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 4ef0d696d3d0..786cb852bbe5 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion:	7.1
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 5b37eb10f863..4112e6a691d6 100644
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
@@ -366,6 +397,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -373,8 +412,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	unsigned int *priority, *condition;
-	size_t priority_size, condition_size;
+	unsigned int *priority, *condition, *select;
+	size_t priority_size, condition_size, select_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -425,6 +464,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
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
index 987ea07bd618..ac46a2875209 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -52,6 +52,7 @@
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
+#define CONDITION_SELECT_OFFSET 0x0060
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -63,6 +64,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -76,6 +80,8 @@
 			reg_num)
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
 
 #define STEP_PRIORITY_LIST(step_index, priority) \
 	{STEP_PRIORITY(step_index, 0, priority), \
@@ -107,6 +113,15 @@
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
@@ -121,12 +136,21 @@
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
@@ -142,6 +166,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -172,6 +197,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @num_reg: Maximum number of registers
  * @num_step: Maximum step size
  * @num_condition_decode: Maximum number of condition_decode
+ * @num_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -187,6 +213,7 @@ struct tgu_drvdata {
 	int num_reg;
 	int num_step;
 	int num_condition_decode;
+	int num_condition_select;
 };
 
 #endif
-- 
2.34.1


