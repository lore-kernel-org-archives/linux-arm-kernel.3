Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C26D232CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 02:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+myu6Q3Uz37abbv2+ZhB/G75uimUCatGO2AyT4TJwg=; b=Rdt47EI7XJ6UxmZQJ+uCTR2Ey/
	cMr0whEKyCAjAN6FGN2BcyqBLE+sS+iwa8EkiqzsYkt9HNtIy2Ncc4pQWlQzbyJqH+Xxmg3UgK6wt
	D/+MmagBDZQdV2XcHh89sisX1K4jzwaMHqstqhfMozUnfJ9+UAW2oaCPDmUy49JZuIP1BxANkTwEA
	4PeqBy768ziLXyeKJX7pJTSqsNne2cbMktAzkBcl+WzUCDmnBO1KWanf8eu1D+g11Y4uUdElWc7dN
	OiMTFBBsMlJ8yHUgXQQSV/igZ3Mp404Bv7LHXc5WyjSHddfqdyhsUrirS59QgVk3+zyNuIzEW4T5P
	T/8AHG9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1zB-000000016cT-1niE;
	Fri, 09 Jan 2026 02:12:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve1z7-000000016Yn-3sW7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 02:12:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608HkFuw2153907
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 02:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N+myu6Q3Uz3
	7abbv2+ZhB/G75uimUCatGO2AyT4TJwg=; b=MX2oC+AtAfwgmCPJG5xQWDNJ91i
	DIiDusEJrCumSG7XTZ83lSU9WwMbmX+dg2fawscZnIODTNVzdvoL5S3uupicvnph
	va1Bm7AshKUxaCmtRpjg3vc/NBI5A3coEouzILYh8MiEF73Fbdd0ya9DBbzXlxea
	aDbaQo1pBPhZ2g5QuOiVGQX2ijinuK/tELSGMvYPFW/HADyqsdcY0vdyk9tovaml
	bnx6iLk4nNIp20wPQwmY/TbqR2p9Omt2AQBIO/sfjUcxF8qXowA76NI0JdJk4Q0j
	c2YuSMbxSMMbLC8PkEwN9yiIj/RhFQnYfZNLM6PjJegnvHgu68Il7puh1tg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj3d6c0mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 02:12:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae6ef97ac5so10626281eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 18:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767924736; x=1768529536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+myu6Q3Uz37abbv2+ZhB/G75uimUCatGO2AyT4TJwg=;
        b=kXKqcwHAK8699uzFj8yttm7BTvYG313EKWE/8/GhzistT9wasIl98yNuccgFCxB8bE
         nO1BRoUjAyuDaSuuZEL+xfxfuKMJAzJoiI79ro7y01HdNojrA1o6A8N90JpzwkR+AFWd
         EE0T+u8c/geGB7oDjFPGIOLPB5phMHoZ/mCEp2sfF6FMK0JAbuhWXQjYFdAFYiNHq+KB
         i8heV353GnUSG067B4+C/iY3s3SXRdKhZzdcPO0MjDWg7LokXSKtrybtK+asdW1xckKt
         vRbgHcHFe2IdvOOXkbW0fTHo1b4eniVXjH8xLvwjVtpTfqPwo2HQ140aGY8Xj0ipJc4G
         iwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767924736; x=1768529536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+myu6Q3Uz37abbv2+ZhB/G75uimUCatGO2AyT4TJwg=;
        b=ofWVIKtfGNklacagk8tMAOKKeMRHeDMihQeU0AYRnM3rqD5niK9Cv82DWpwu/gosgn
         d0RUTKGzlNRYAs2J6wPTLerITqMo2VP6fFbECdlvBHdeIq2/lB1PblXwKNq7nQlIPOOL
         K0uh61qUiTqsu6AOXtzpCqUwGmNdCpg4NP5uFr5HkbP/nsTRD/uR2Ym7HLpLm21OO8YQ
         O5+wi4ScirZl22DxMl5FYPCWfsuU8r47ntqNfePnRW8BgKxoAYI6FP4cEzQzr+CNZVWp
         AilnKc/IzoczBJzFwFrj8hgW39AhxpQhQnpXBHiGqc9scndy8Wyu59YIHlqvOXp2/E4N
         IkXg==
X-Forwarded-Encrypted: i=1; AJvYcCUDIbCWiM4B/7Jr/6zAWlFEiDI0esJ2clZsoLGisoE9Zkz2Y0SA173aAVBZaQ78RG/l3SR+U7zuPrPXlptNtWWB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5iiGenet9dmlEZahe2m7bQT9SxMTUz3tsRgnJnjor/OwRhMrG
	3Y71uzD5S6p9f2Leq/LdtaM/v7V8oow9xrShv6o6Yrazr+IkOeVcxdkGJ5NKLpMafsc4mNUqgEE
	nK0kcwhpEyb926dT0hBXPLSL+jo+8uAbo8zGk+1464AVnrAialxawOylxgpTgJkWkUHpFcJ9Sid
	L2hw==
X-Gm-Gg: AY/fxX6VRHAoB7ll7jzGEaXppRrnJVNlnJDQxP4Y2yNNaCgpySS+rJJjOVSmKAiVvm2
	2VA77iG5Y2NyDh/Ly/ZIRmh8SoIQIbEQOMq7UpI0i7DziOS3Cr3UPRnE+PjMP35lmbx7NxejvbI
	4a722H2FDQoyzVjEobavl49wpsFj5COLUeHmWwk3mx2eZ3rdtlqCdvtnqJcrxGB/tZ7bepH5gNz
	/y4NkHDBBEPK+sR0jbdGVci93UjN2aCiXmF/MXL2BhHRAXR5d/j9mIZxisqaa+XvEVp8/C+jV6V
	evcxBnWP+nf2rkfp3bEoVx86vF7/Qiid9gqZXkY8xZW6lzagLg/ydQwj1bLCkcBIEsytKiMMwrl
	V4lVhlkPhOubDfCwjvH9o2YM4moX+sD6OQgtaqs4idSLjyGtfmlKSNo3C5XFSkyWR
X-Received: by 2002:a05:7301:3c0d:b0:2ae:53da:9787 with SMTP id 5a478bee46e88-2b17d341ae8mr6720531eec.40.1767924735556;
        Thu, 08 Jan 2026 18:12:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKFgWsIT72dZ/Xuo5XHw8dLQ7t1LZ0LXIEV72FJw3uERtVeUXXDTK+zXUN1oaEW4j99yYURA==
X-Received: by 2002:a05:7301:3c0d:b0:2ae:53da:9787 with SMTP id 5a478bee46e88-2b17d341ae8mr6720498eec.40.1767924734978;
        Thu, 08 Jan 2026 18:12:14 -0800 (PST)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707d76aasm9459111eec.33.2026.01.08.18.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:12:14 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, suzuki.poulose@arm.com, james.clark@arm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v10 5/7] qcom-tgu: Add support to configure next action
Date: Thu,  8 Jan 2026 18:11:39 -0800
Message-Id: <20260109021141.3778421-6-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
References: <20260109021141.3778421-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DuupGz5P3f1UBRz2_BnSbt7OIw-U25kh
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=69606400 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Q9DP89o4N5N1XlnrPa8A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAxMiBTYWx0ZWRfX/U4rIzKAG50E
 jUbvCFuGHQNef+1nNGJNrzrgF8wtHqU0D6XCHEuNGdfjT0k1ujs/UIVfRcHqa4dZg63fYbk620p
 MuK0oRx/NJCZCXkofWLRDJPqWZXSFjF/CssthxD79yPQnFjGi6N1A9L6F/0OU7tNzhJFvhypI0n
 sROYcGP/FAtS3Kx9RYGGutRfBzXFV2ucURT00tTGN4f45jYCYyOqUXRzxdTWKeqEBGjK+smAYQV
 sf3JxfJrMNewIF0Jf+gXangjhoEdyxufSX0fkc1z1+9L4QmcJAVkYtymDG0tPHrTHOkwnlnw3s3
 5p7p/VfKsmO8Us6lXZnSfJTZmgheRXVAx/zrJy1HDIhFIJ78j4FS6bDPAJkY3xzUTwX0aPi1EoN
 ZRzCdI7KSuh7CAbrLtu4B0KkTrbslvGl0XM2Plag4qTRvLZi3CV1lgEuNnlhB+yaGcgPFYF4yhR
 IjbfZEE6NDoPo3Wbzjg==
X-Proofpoint-ORIG-GUID: DuupGz5P3f1UBRz2_BnSbt7OIw-U25kh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_181218_091501_72DF4985 
X-CRM114-Status: GOOD (  24.05  )
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
 drivers/hwtracing/qcom/tgu.c                  | 57 ++++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  | 27 +++++++++
 3 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 4efa36a11d8e..fffe65d3c0db 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -21,3 +21,10 @@ KernelVersion	6.19
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the decode mode with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_select/reg[0:3]
+Date:		January 2026
+KernelVersion	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the next action with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 39301d35ee9d..e1a1f0f423ba 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -33,6 +33,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 		ret = step_index * (drvdata->max_condition_decode) +
 			reg_index;
 		break;
+	case TGU_CONDITION_SELECT:
+		ret = step_index * (drvdata->max_condition_select) +
+			reg_index;
+		break;
 	default:
 		break;
 	}
@@ -74,6 +78,9 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_DECODE:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->value_table->condition_decode[index]);
+	case TGU_CONDITION_SELECT:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->value_table->condition_select[index]);
 	default:
 		break;
 	}
@@ -115,6 +122,10 @@ static ssize_t tgu_dataset_store(struct device *dev,
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
@@ -148,6 +159,15 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 				drvdata->max_condition_decode) ?
 				attr->mode : 0;
 			break;
+		case TGU_CONDITION_SELECT:
+		/* 'default' register is at the end of 'select' region */
+			if (tgu_attr->reg_num ==
+			    drvdata->max_condition_select - 1)
+				attr->name = "default";
+			ret = (tgu_attr->reg_num <
+				drvdata->max_condition_select) ?
+				attr->mode : 0;
+			break;
 		default:
 			break;
 		}
@@ -186,6 +206,19 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_DECODE_STEP(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_select; j++) {
+			index = check_array_location(drvdata, i,
+						TGU_CONDITION_SELECT, j);
+
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
@@ -225,6 +258,8 @@ static void tgu_set_conditions(struct tgu_drvdata *drvdata)
 
 	devid = readl(drvdata->base + TGU_DEVID);
 	drvdata->max_condition_decode = TGU_DEVID_CONDITIONS(devid);
+	/* select region has an additional 'default' register */
+	drvdata->max_condition_select = TGU_DEVID_CONDITIONS(devid) + 1;
 }
 
 static int tgu_enable(struct device *dev)
@@ -356,6 +391,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
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
 
@@ -363,8 +406,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
-	size_t priority_size, condition_size;
-	unsigned int *priority, *condition;
+	size_t priority_size, condition_size, select_size;
+	unsigned int *priority, *condition, *select;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -417,6 +460,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 
 	drvdata->value_table->condition_decode = condition;
 
+	select_size = drvdata->max_condition_select * drvdata->max_step *
+		      sizeof(*(drvdata->value_table->condition_select));
+
+	select = devm_kzalloc(dev, select_size, GFP_KERNEL);
+
+	if (!select)
+		return -ENOMEM;
+
+	drvdata->value_table->condition_select = select;
+
 	drvdata->enable = false;
 
 	pm_runtime_put(&adev->dev);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index 0d058663aca5..8c92e88d7e2c 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -50,6 +50,7 @@
 #define STEP_OFFSET 0x1D8
 #define PRIORITY_START_OFFSET 0x0074
 #define CONDITION_DECODE_OFFSET 0x0050
+#define CONDITION_SELECT_OFFSET 0x0060
 #define PRIORITY_OFFSET 0x60
 #define REG_OFFSET 0x4
 
@@ -61,6 +62,9 @@
 #define CONDITION_DECODE_STEP(step, decode) \
 	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
 
+#define CONDITION_SELECT_STEP(step, select) \
+	(CONDITION_SELECT_OFFSET + REG_OFFSET * select + STEP_OFFSET * step)
+
 #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
 	(&((struct tgu_attribute[]){ {                                   \
 		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
@@ -76,6 +80,9 @@
 #define STEP_DECODE(step_index, reg_num) \
 	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
 
+#define STEP_SELECT(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_SELECT, reg_num)
+
 #define STEP_PRIORITY_LIST(step_index, priority)  \
 	{STEP_PRIORITY(step_index, 0, priority),  \
 	 STEP_PRIORITY(step_index, 1, priority),  \
@@ -106,6 +113,15 @@
 	 NULL		    \
 	}
 
+#define STEP_SELECT_LIST(n) \
+	{STEP_SELECT(n, 0), \
+	 STEP_SELECT(n, 1), \
+	 STEP_SELECT(n, 2), \
+	 STEP_SELECT(n, 3), \
+	 STEP_SELECT(n, 4), \
+	 NULL		    \
+	}
+
 #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
 	(&(const struct attribute_group){\
 		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
@@ -120,12 +136,20 @@
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
@@ -141,6 +165,7 @@ struct tgu_attribute {
 struct value_table {
 	unsigned int *priority;
 	unsigned int *condition_decode;
+	unsigned int *condition_select;
 };
 
 static inline void TGU_LOCK(void __iomem *addr)
@@ -171,6 +196,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @max_reg: Maximum number of registers
  * @max_step: Maximum step size
  * @max_condition_decode: Maximum number of condition_decode
+ * @max_condition_select: Maximum number of condition_select
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointers, clock, spinlock for
@@ -186,6 +212,7 @@ struct tgu_drvdata {
 	int max_reg;
 	int max_step;
 	int max_condition_decode;
+	int max_condition_select;
 };
 
 #endif
-- 
2.34.1


