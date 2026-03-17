Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43591FB5EA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 03:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iv2BN0cKboDuBtfMG0o05Gbqs13lk40R9DNkNpg+u3g=; b=VdzToS8enZQjgnZ9EW+gJEKAEg
	EIDmIMKoCaYvT2Sqf0PgiKo746dQdb4tcJWIV/ETmBOYooXpg9Db5XQMCr6YsFDpzZTNDeL8hWNev
	E9GVkxZPhnXH7XC3wYo4JSym8ewHXybxCtxp2VFVEQzXNKy5vHXi+pLOl/gzxITcKtTyW4mLtJNTG
	URemKibYcuXzRu2IWIJKn3tDxdmWZUikgUCcdXCFE5EP8R6neUvHbyzVue4fOo0I3+HKnGMM1r8qJ
	XP0O/ErPHkldpLVEGwL3ZKIGBAKGtRi3DqsspS3e4HUlEr4nRYGXh3b4Sg3wDvAiMFe1hjlZ7Ni4A
	hYfah5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2L5L-00000005J7t-1YnB;
	Tue, 17 Mar 2026 03:27:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2L5F-00000005J3y-2lwq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 03:27:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H2ZaJJ3124536
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iv2BN0cKboD
	uBtfMG0o05Gbqs13lk40R9DNkNpg+u3g=; b=HFq2dNYI7mm0jRu5I1JE5Nx0q9j
	/nBO10rPhzNd1EXEDG/PmxwWXQoai2SMv6AAU+n1NLRPJFWy3rTZxAB3/LVEBu5J
	9G2URoIJEf8Pfh0UVGI/03rS9ThwIo+zGdgpQMqxLQSqq3azWzG96KtPz+ShPnbp
	ZlY3cOOHQc8RfcNuOZRYMiBxikWCJgzCQ1tuBsVE7jvfMXoTCErCf499v+RGaEVr
	HmhEF98x/0GXvmaxzdCtrz6T0Ozut6CIt8rJnqSbfuJ+Kl7ddMUP15zDx6IAExfo
	TAYYSacruayqYQfb5/Raah7ddyXkQdqFieY88PFwehhCcoJgvlStX1riLeg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmk90d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:27:05 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1276e71652fso5954535c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 20:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773718024; x=1774322824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iv2BN0cKboDuBtfMG0o05Gbqs13lk40R9DNkNpg+u3g=;
        b=js7wEQwnv3UckLwYr7qHWBDsifLZy7NexApcHgJh+b1vNlzF2v43wO29SrUusCDUhu
         dkrlxg9wghByXH7ReLVuZo7kzRCTfulay6dbJbJvESNP+WtGZwWbLIbVKojXjepdoEAi
         01nTSGadGFjbVHX3T06vWDDwHJvq8L6rquOOF/+4I17U8PGmK4lczFibGg1HSq12saRW
         bX/6LwzsIhMt5gUuS/I7gG6Fw//0vEpeaFakIgUNwj/4OlePTTuLSJcVJVd7N1uG/Hc7
         V0U158MGyZ++AWKAqlkB6Xi9lUZAVctP5+Vf34BnFJliPcwZp81IyH+0EY54oIVg1dIq
         z+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773718024; x=1774322824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iv2BN0cKboDuBtfMG0o05Gbqs13lk40R9DNkNpg+u3g=;
        b=M91XaPEof/xWC41XTKl6EQrpQjhYdUDP+HIi8tnqa+Yclr1qChY6U2GZ30DDGuQqcG
         mQ/WiAH/GQEYHSW2zYxnsMTUWm4UunA7gAml6JUTSYr04Jp6vdc6GUQjrCoFBqvw06p+
         elgHvclyP+rkYYmQQhmuz85NAdgBmcQlIqL/kjBQl8RXFvN9tuFkdcQarvg3o4ckqott
         jx1EJFqzsR6LDSBFfnFALhkk++fSFLLN9tXlNcABWl0xe+U46HxxgOrOolet4MOC58jV
         QxZqqzpfDv/HkjfYSo3jJlFCHW6SZJ6gWMzTU8QXtkOYJOmKN+V2UL+vZ5yVV59QsgC5
         enbg==
X-Forwarded-Encrypted: i=1; AJvYcCUaYfHZ6YmKqESNaAaTIh3No7LzJU55hqSXJDRup07fXJi5RCEzDehKh9riXLGClPFBFHqMERRRrX9dE1JOlPrQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyZuGNEZBXwHAiC0gttLhVhcXGbF9KwJbqb/ELIcd9BoS7AMBi2
	1lMEMotqHo5SPis1xNLdj5UUl22MSR57PlHgsQbNByTl+s1PqJt0wN+MQ/G2qR4TPnVzHLSFhH1
	4YnGIPYlwEX2vOEHfv4I64Xl27rKjrE0FgVSBrDYRuJAa8w/2+9wHKZt9fXGxKy+Mjp7/jfKvsf
	BYDQ==
X-Gm-Gg: ATEYQzyQOXGZsUa4tnigHTFGVhMY2u6W3ipNHcRJKhgAnbPSC26h5QElNXJZC0WGAcf
	QKnrtS9q4IyUjPrDdsAPa3g4QUMQz4pZPAolVoOlfEai9nYq6rkCamQRIvCzS5VE4Xc+Ez0oiOC
	3ODHSGhxLYGhjOtMyYGRobe0WzWtvjTIZP6/uXjFRDFFWUbfrMxq5qurTCVaavVqllXuS2bzN0J
	/0E9T62iL4oavMwL0SgN7paalRhIWZ7dB0I8iSLvYXOmbh+HshAoG2032EDi3KAtfrO/dP3cQO/
	nWOXhKe5P3WlqbTWb9+Lbm52XthNGpkz+DEfwpkMRmdV1vA3A3LPbAxt+drOjmDsXaonxQngoCm
	yzyXurT4neV21kzN/1PxSQjNzzJhH5W2CZxcZubXgGZ/Nbws7jwctFRROATQwTEYC0P18/ixBh2
	+E
X-Received: by 2002:a05:7022:698d:b0:128:dcbd:e27c with SMTP id a92af1059eb24-128f3d5a938mr7419947c88.20.1773718024387;
        Mon, 16 Mar 2026 20:27:04 -0700 (PDT)
X-Received: by 2002:a05:7022:698d:b0:128:dcbd:e27c with SMTP id a92af1059eb24-128f3d5a938mr7419938c88.20.1773718023798;
        Mon, 16 Mar 2026 20:27:03 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3ef844sm17445895eec.15.2026.03.16.20.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 20:27:03 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v12 5/7] qcom-tgu: Add support to configure next action
Date: Mon, 16 Mar 2026 20:26:37 -0700
Message-Id: <20260317032639.2393221-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
References: <20260317032639.2393221-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAyNyBTYWx0ZWRfX7dvg2Z6/XX0T
 KVZasICrbnfepTrP7lm2hWwmLTUkJAG9qd3J3mFPzh82202H4FJqTeeA7UsCIaOQKGMiyG2Tn2W
 mAiMmCywaqupU1ofXni9VThdTeuvwhXxIGrNbynveyJ3WfYgjRiaW1UnTQJY48/W8m8fO7chlGo
 KelydKeyDQ2sAAG4QfuFtVxnnNdG7aEs6sDNB5NqUE4HaYo1dBvwmvbgmaLs8aw7FrqZsvq7DIn
 rO3opE8jkQkBgQg8Wwsd1P/WpdzsD4T7r5jYeLR2VSXP+nwYY4icMBbTLzlF86UZKvun+ZwA9J7
 wLizdCNGRHbC+z9k1t0+bPF8SPf4i92zwlTBlEkpd/YQZSR6Ytk1sJ9K9Iw6bjJyTUmzj/Qv8BG
 NlPARpauKXtSkPlRqR/4kNfoSzR/9EJWRwdLVqRsFl0VykaATggq84MkG/mAU3VW8ayBvQZHMO+
 3B1Ura6FT1lFNpw4eMg==
X-Proofpoint-GUID: cj02w3RwVmX6DG0ir-q0URZRnhmC3NDV
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b8ca09 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=s623Ih-0px1LxcEVn60A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: cj02w3RwVmX6DG0ir-q0URZRnhmC3NDV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_202705_706542_26D25329 
X-CRM114-Status: GOOD (  24.54  )
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
index 18930743c99f..d8431a82574a 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion	7.1
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		March 2026
+KernelVersion	7.1
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


