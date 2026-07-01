Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FADC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 05:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUf0NyAIldlG+omXNsLNYooLiKFeXObyleB0gNLxAbs=; b=vnxwhZjtjrTKqBPUfZRDPLXA5P
	rJhs9+zpnBkAvaePvBDxS8JYaWOCVsmc5s+rhJcLT2lLBpisq5Elzwj2FbrdFSDIDDl2n78YWJ+dt
	mYEbfXavAiXlcfbX5i9Z6fEggj9kNpDKBN24BEi9B+pK1Ox26xH1is94Z0D2Usl2QD+Vp9u3YvMRk
	pxryDCphrYr79LGtT4rI4RvjztH0mXYErExJCLmnQ0I+xYDWTsESF6vi60ZrI9/RIRhaKfWkSZZCO
	nmY+4CdG2zXN3W5ADk2lwZpPgy95gS/G83tvrWf0vWtkJDHUoGFpNatqJBKNKE/TFOWWJ97CYHUxK
	CdCI57Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenvx-00000000kR3-2jzs;
	Wed, 01 Jul 2026 05:56:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenvk-00000000kGB-20rE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 05:56:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lj0w145191
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 05:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MUf0NyAIldl
	G+omXNsLNYooLiKFeXObyleB0gNLxAbs=; b=kWgk8PBU7QmAldZL9uoCBLS3FDR
	oPKlZT1GJkQGSFooYyGnPRQ1a7tPiJ9Tde9755Ibyp2+KVodBSKN/GanwQkCH/fL
	NXEmpHpYCCFo1kwLa5oc87cbsWIsbpjBB3WpzDgYkhl6KNM76sftC1N/qwQUyfiy
	NTbaT481hHbnI1hD40DZiG106b1Ja1vxVvwfuAchrS39W6mPFHd2K8iqqk6FJO5x
	KQiosz7rbmNINQ2gunlKpFESvgUtDxRY8kmQqY06FkeIswCRxw0bnFnnMSvsJTHx
	O+wjRvmhxobI0Zojg20GYLxc53j85a3M+y41yOT4SZTxN8uo7ZtE9eJzgOQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktad3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:56:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6bbd0afffso7289375ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885374; x=1783490174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUf0NyAIldlG+omXNsLNYooLiKFeXObyleB0gNLxAbs=;
        b=KLTe1cuk9UdDC+t2SEauxvrRnIxzumfy6h7X8yeUV4FtpVFeZRzI0g7OnqYuJgCWtN
         jfE5BkYF+FMFSFKtqfROyhcNYTwmlxu4jN/5UuzDNnAtKhX8Mj6lEx12VRakPSlGV1T2
         Nnr2vsg9OrImwb/rGREe6xqeBmpphB6vMxJdMjCWXKV2Q7C7LTMz+9NmZp2dPd/QnHVP
         Dd+//jmZEtaf+vwCyqNofISYQkV+iDTLhQKz2Gd5OghNDqicXyhrhMd+uK5lkgfYnfrz
         3otwGsPSl1N+RBdN0CxNXuoq30j+seK2ARHSUIa0RYXjVX4QTS6UexdhIuqV6YcannME
         ghTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885374; x=1783490174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MUf0NyAIldlG+omXNsLNYooLiKFeXObyleB0gNLxAbs=;
        b=NB3p446wLlVxi9hi7CGz5jIuiETCq28rcc47/FxveqtcmjDSjq/vyv0iXMeWc820N3
         +dcb/la+01fwpWl3+dVbtAw6JvBUbdR1nHVYG+4sEbgj3qwfEIizOdDkmsp6Rhznhox1
         WT0UPrZx9rSV+yBljERI32+4ZzWJJH8J3hG+neAH3ULSqITD/Gr+V7scAFLdDXyNm0hS
         DS+HGysYmVjLAmiMfjYQtliX5ZgPTUpQ4R9oMSk6PvvbK7xb+Pvo9i3LZ3hsy2MtbQUB
         uEGvJMRzAMWv0m4oIClhgHet6K/156oNjS4GLhWcqfPCZpc1c/P9f1LywmqybYnG1Cfv
         4e5g==
X-Forwarded-Encrypted: i=1; AHgh+Rr4j0A7pt4sR5/oCzeJKqvvIeZq7+EF1NjsP+8VkrmuK9omRzIHu71q0s4qTN6gsrGJIgYSKOEKQufLiulLKTbz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxej9mutEYDUYcvbo27ms7+kF8frzVaqZ917C/WzeJDHZjs7PTo
	5BPxNXs66dR9XNJVAIJX41+qMXBs5DAWKJ11gFm+1jDqY2uLroZMqE56MvxYmXgPpzCVbsCtUKL
	CKGpfDpsjQ+BtYxSziSt0YYfssmuSkEjiL9ErZWKvJFmMYN4Fb7/3OpJdzeZb+iF+cS9Sw+VDhZ
	TcEA==
X-Gm-Gg: AfdE7cmN3iGkDyQH6YsFE7HWZGZotkfD007blZb4+tqvWCXQiHmmmcQgwLUAKzj61bm
	/95sv64O4AinHiwQnTzx0iDRT12B7BP2qWSN/+46rcS1T8Xdzt1X2eDklHBY+/QXkqugKG/rKnT
	J6iurLBBrsbXYFi6HYu34wKXyxYR3HVHwFS7L7fBIFCWctVaE1oVWelZ+xAslgNfTQg1mcDDI4X
	gb46pDt9rbkq27eueQtww6pQBWqYzMX8QtX8pvLcB7TH1Rvjf8wQvn1ZVkTpy6h58Ms/52ZFTlT
	t3QMZsKtOUdSHq9kzsG/LJ2kvMRsylKHukOLDo1kRE7g43hovs4J3upyVvmSl5J6yhfU4+hnYdI
	dHa6F443wJ0hmesN61MQwWhJN4pZgVWL6rltGVBlfEUD8FEYcko+gGebWrZNaj+lz9Q==
X-Received: by 2002:a17:903:1ce:b0:2ca:26:195d with SMTP id d9443c01a7336-2ca7e6a9f0cmr3874895ad.11.1782885373748;
        Tue, 30 Jun 2026 22:56:13 -0700 (PDT)
X-Received: by 2002:a17:903:1ce:b0:2ca:26:195d with SMTP id d9443c01a7336-2ca7e6a9f0cmr3874655ad.11.1782885373278;
        Tue, 30 Jun 2026 22:56:13 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382b5175sm25451645ad.63.2026.06.30.22.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:56:12 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v15 5/7] qcom-tgu: Add support to configure next action
Date: Tue, 30 Jun 2026 22:55:27 -0700
Message-Id: <20260701055529.445819-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
References: <20260701055529.445819-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfX4CMIqNqAt+Xr
 qqfak7iVcqQiPqf4ZK88kPodwwhswnGSHSZSXDOeXsDbRDZ6RJtlhzc905g/UuP/nCKAtdk5Vfd
 RSiNfOsntetpsu8rKf2jTpreJ9lEjZ4=
X-Proofpoint-GUID: a2PTpd-YE5HHBrqE3YjSbTLXv8662RKt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OCBTYWx0ZWRfXxfnUIqvS1pCs
 k/ki8LpqqUOCFlWRaGoDZZ511McMma5DTOzWH6m7CRPZhDGb4ZwWHXk6ym62KmblFdzU+DQuKCf
 N6BYZ8fp6OMTp/BZXrBaNY/W8AZNZqhFvz26wMrCSIg7kNE4mtqKto+i4DzZhv3qSl8LrXB3Xd6
 tf2Mn3SwpG6T1HxwwE80vd5zuYPuj0i/121+J67oPHa3CNUU5woT25NJQuCUc1DP+XZQOj63QYA
 OAWq/kZfLtGOHLcdL90EjztISrn4ksPcReTN9koxahSCXLa61kf65sR8Ukur8B6d/IV05fonq/I
 MbC+qeEuZaYlDNIeiOfpTQKGfK8BK6yuAJ91LiQ/3sSVmFsX9vdnLuMd5oMnSbUxFQSzI6z7Rsm
 awF8ODCKswq/riqj4iwkj24HsDCooFVfvAHKAUFS0bRi9Z9G3l6ArjE8C4oAxVpKKpZJPrzBx9x
 iKy2el/QUHF5msBjPGA==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44abff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=s623Ih-0px1LxcEVn60A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: a2PTpd-YE5HHBrqE3YjSbTLXv8662RKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_225616_798387_7DAF0BDA 
X-CRM114-Status: GOOD (  25.84  )
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
index 81a4e6036b72..f8b4ea199faf 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion:	7.2
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		July 2026
+KernelVersion:	7.2
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


