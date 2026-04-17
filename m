Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703A5F8E4B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 07:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hAEvyDRzBM68/uIJNex8X2q/G8gy+MFr0oAB7pUsFU=; b=vog+8gSP0UWPLdJDLdxxEEurjW
	QmhbQ2xFjPFBGsBwd/AGCUz1sbVQYzG9X9E1zJ027LpBux/8EQz4yxFXGUV0w/3vg5VbIziEiDQ3b
	bnrxgqf4q7CoUPs07GwGRZWslQKloUMpTRPfY1Jw9aReBsLB+pfoxADXZs1BtD6pnSEN66nB17HPs
	hWS+oRkrlc7uprq1bixeKuRQUmW63tGsa2HsKh2/q+XejUTWwtjGr7RyB4Qhnvmt53P+fZGRSVnEa
	yZYVEeo0YNVsrbTpcMdXRq6qo87UN8Ov1bD6Xx004mV8tGBdtlOtHhEgBHFGn/zhoYFrlHlUEZSuN
	TpQxfflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdjP-00000003awV-3ghY;
	Fri, 17 Apr 2026 07:35:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDdjL-00000003ata-2H7g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 07:35:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0g41b1982086
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 07:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5hAEvyDRzBM
	68/uIJNex8X2q/G8gy+MFr0oAB7pUsFU=; b=CI014VvtZlMWZP++pC5qlwiyuUF
	m2vo7jwweyJw2zc4XOWoW6ZTCdLzFHawL0NJzKCGTDCF+190sJTvoLv+IyOKffjl
	V4USowF/8+MhavNzWQUPz/58zckt+ELaJ+7dtFwCe+fCQ29Hz/Wqq2ZGZNgAl/Eo
	r84R+pjnKyQq9tlMKq3UHbjfYRB+d+RwGd9MIU1g6STRBmKWu+lDw7rjqEJV7GWp
	lS9DrqnyRgvY7JKw6rIf6wicBF9Ys+cDs1pwjyXMHASrk3wepy8HczeCHAspE3RP
	6k/yVYaVRpqcB9u776bre7oFFKOp2rxyPc+/YqDhbGL2PwmZ9lpuNJAkFIw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk52jj59p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 07:35:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c16233ee11so492516eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 00:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776411247; x=1777016047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hAEvyDRzBM68/uIJNex8X2q/G8gy+MFr0oAB7pUsFU=;
        b=arR49gotnY+B1IZT2wqouv70RfmqAvX9PfAlfmuJOFlZFGniO/qi/vv9A1pJSsc7Yy
         pgvEVjohqg7kyzPyynUggSseRu/BIIlpLPDrFM3SagD5E4G0DlhKS/Dbwq0vPBZfMNwp
         MmlAoRp6dn6F8ykfqE6HsAZ/J5/UOhvd3GbGPptNUpkYd22JaKEcj/AFGgcw0n68fxD5
         FpurCTnD4dWp83yDa7+qphnjDtnz58rdUar9m2p6QhHNKWxJVcsxIYJ4b9ENpmqDw2Uz
         cclLosJXGdEiQL6kJ7uwgL/ua7s/GxyK7Qq8oYCraFPgGVXIPCgpS8Lm+q1JaWbHsa9A
         7xnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411247; x=1777016047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5hAEvyDRzBM68/uIJNex8X2q/G8gy+MFr0oAB7pUsFU=;
        b=Fz2MDnTIWFpj92t5q0m3Ifxgj1prV4oJZedUDSt5F2UY1kmxPamNglDy26sXav74Tz
         j4AgicWZpQSKjhKh/FvpLP0He2JnmmGGoyLM565WYKf77ldpBDoloq3SpVsvLnWPV6zZ
         Gb45gp6kxiTEjoCdNR+KMA5dc7PHHpnzEqXRhq7XNpIr6uTFkGkTmSjqkYpZN+mNfout
         CgEOIX/HyFk8iy6A8OW/sTeJkQSgJAf5jztFUo2qXJMJRRVE4PeFrXvX6ErzIu6zAOdW
         9QzYTFWtVHAKyqdsyx2SEHbztlc8zMEcJFKRifERFzCZ5P6cSuxSDsAqKZCXxbKRVNZ1
         Dt6w==
X-Forwarded-Encrypted: i=1; AFNElJ9t0GEgFMOydZmrKo3Pio+uxMA1IhbflQy7YXtvSv/y/q7S0aA3E49aZU87doFK/Jv6m98Om7/9SvAvm6Lvk4Jw@lists.infradead.org
X-Gm-Message-State: AOJu0YxIla815na0P4IkrXs8BIMRrG3FROd/mdd14nuAhRnCGT8HAwEK
	YrwHgbPZrBUjXJC/UaTqFOAua+GlO+Y3qzFfd83KUce+ofheZWVgi9TBcmvOzbdhmGROJcc4QGO
	SD86qHznCxqEU6IJ8Uuy0aCtF4Bc2wTYPoYQlz2uNaJCs/zxJ6N13+gIaqFqxasus8EXTzeSFZ7
	HIzw==
X-Gm-Gg: AeBDiev8en3fuWokQalvNjI2zaHsHM8J4KjAst9oaoDwfmZk5huYjndITs8u8z/YChe
	DkH29kIOyYjaMHEWkF1sjMTKFWbeZp2oA4Kv+ot3NwwSNM/bi7IxFt33sXQZkut1O5ybazidkJE
	KRflRl+4Kmry80GxMF4wEFYL2KPfPBL1vGVRPKhXtQ87ObOjuZdssu0ymVwHcMnswFHnKqOQHyv
	LWtbXbolAX6fQXhjlFRXdRulxXGnedMW/guyHC52trIH86Fm8BNSLMO3PktT/m609f4v6aAEBnn
	TNHiK8QBOX+29M5l3DotLKgQVXeHkG3oLMo+Tcd3IFTXPUeHGkHMGZTR0VwbwRmXo2NYtAGdzS0
	swqfs6udPbMksw/LU1WGr9z4AexNIIrWRJYwKPYh9UorkYr0wbb+O5ZAef3AmeFIEzyvxwUlS/B
	F+bqohyxk4nkk=
X-Received: by 2002:a05:7301:d17:b0:2c5:60d0:702e with SMTP id 5a478bee46e88-2e47873bcd5mr821998eec.18.1776411247290;
        Fri, 17 Apr 2026 00:34:07 -0700 (PDT)
X-Received: by 2002:a05:7301:d17:b0:2c5:60d0:702e with SMTP id 5a478bee46e88-2e47873bcd5mr821970eec.18.1776411246688;
        Fri, 17 Apr 2026 00:34:06 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm1135168eec.18.2026.04.17.00.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:34:06 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v14 5/7] qcom-tgu: Add support to configure next action
Date: Fri, 17 Apr 2026 00:33:34 -0700
Message-Id: <20260417073336.2712426-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=buR8wkai c=1 sm=1 tr=0 ts=69e1e2af cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=s623Ih-0px1LxcEVn60A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: JVFze8pc-1PCMWOdM5NkLx7yb9fbeXFv
X-Proofpoint-ORIG-GUID: JVFze8pc-1PCMWOdM5NkLx7yb9fbeXFv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3NSBTYWx0ZWRfX4rlN766edIqQ
 a8OcnBqesPIdtANdtRLhnBGyCUJKthev3n68Nb449aDfEIXEeHgQep/nkW9vb+BYZW/vgqotP8x
 QFAwurxMVuo+JR+YiLhjpiBSQOLlnYIAEfXSrcNKanmQbr5dnOvUy9BjUD2S2F7CVDUhP+BH1H8
 a4pBI1A+W2w/uMpdL98hqAomczJUqpf9jSjBu4MHggy/RZmUuLkDXh0Ie8dDwTxhI1bSaBbfYZQ
 5yBLQXtbLlvsTsincni9yfLZKvyI0cbt2nVCBR+sde/6uudwx8xds4/bqVEiAy+gMuI0yybYvxc
 EYftM11JUKqEo72ZNyCOxPG+F9ojTI3n6rum9hvebR/zjiaTqnspGc6LgcAh/pbkXKAHBct2Vbd
 2cLbeE08mcknakl8hMwqzVK8lpiJKcx6M4+OrwjXtxPQkcxLAE9oHm7GNoUWzpeIdI/5uZmBAor
 3oOQoKysc7cEhQwAi3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_003511_606033_F5E66E0B 
X-CRM114-Status: GOOD (  24.02  )
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
 drivers/hwtracing/qcom/tgu.h                  | 26 +++++++++
 3 files changed, 84 insertions(+), 2 deletions(-)

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
index 937211923d93..fefe932059cb 100644
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
index 56e4161a8bc2..c61aa8dc51b0 100644
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
@@ -121,12 +136,20 @@
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
@@ -142,6 +165,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -172,6 +196,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @num_reg: Maximum number of registers
  * @num_step: Maximum step size
  * @num_condition_decode: Maximum number of condition_decode
+ * @num_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -187,6 +212,7 @@ struct tgu_drvdata {
 	int num_reg;
 	int num_step;
 	int num_condition_decode;
+	int num_condition_select;
 };
 
 #endif
-- 
2.34.1


