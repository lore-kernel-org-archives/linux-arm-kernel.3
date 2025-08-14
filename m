Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B3ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7PQL+hQ5oTZXy55XFweJgoguGD9rwse5jt8tj2j0INs=; b=ZDlQQU0VqctxSYN4Er3CvuD/Kj
	+Lok8NrSWPgHE7fqZToqDtqabLSbOI6sRuf0finkI2UqeDw429IjdqpFLNOxKfA+CmiHyRsgB9Pzm
	VaiX5VIbK49p6CamxwFgPR0ALMyQcEZ7QIenopymjx4ZKQ49YzTomDTBreFJ1+VqY9niZCiiwejB+
	SzX2bLvElDP4vKhYKe1UL+wYoeaHA81c0qfA1ANFyWOn6mOsXGIHGt11mILjp8vuygWV77v2Xo5/m
	e2S9IpTrC9c0O93ZCoYx7G7zoPqiD+38loQZ/mfqm4lpjEsXEyQWVEbJW4NG88SuJWHi8Q15mtvxX
	z2dlx70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVTV-0000000Gdeh-1o6C;
	Thu, 14 Aug 2025 10:46:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umToz-0000000GKL4-0bhE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:00:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMjkfG012182
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 09:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7PQL+hQ5oTZXy55XFweJgo
	guGD9rwse5jt8tj2j0INs=; b=o/yBAERGwhFsxJ9QtVLNymAbOSWBbIeGxnOjXa
	LjROrc3RJ6pU+4OzYRZZhhwgL5qrv3MqJirpAXWKJ9zlCEfHUGBxWOhQ6bsgkPEy
	hxnMeUYNID3qRP7xiV6Sigt5eI5wBrIgWR9wee8XYrcc+nAULjEV5ZWsHSTFxdQ4
	H8Pk8NUbEYClw/mcJfa1LQakGgreOXloDYwpZYW0EIhSi+Y5R+W1jJJPXfc+zp/W
	lsZiKthAd0mJIbpWPoa9abtANjWFbRBrWdAy+kuH77zUprfYfDLNmACfmFF3L/3r
	p7Bq6vB2yqLMmMq6ijJ5xkelQkis0aJjGsNA+naon3wmeotw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxd71j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 09:00:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581ce388so14237015ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755162025; x=1755766825;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7PQL+hQ5oTZXy55XFweJgoguGD9rwse5jt8tj2j0INs=;
        b=JeC6Q/E0fLlIJX5IE4oNgCJLb7s5ceeJtTLP0zPmYVr9aUSkVOsmth5c+S3CbdDnGC
         BrYBMm51VpuK4Awaju2q7fVTlOc5xIyUOCoCxmaF+bRoz65bcjGktbOrluuCkmxqVajf
         wDgdUcufe/JbBj3XiHlJ8zpMlk43KBl2uoIZU5GmU5r0zT66aW+EPkYEpqnnQWgvUGBh
         yqPyYbTu+Ds+bO65MXDpuRoNio9zzu13GDL4QOcX5NCUdPsc7hKw+EaVjVeSJXZuW32v
         o5k/4ovyHAvz5OmnFkJwDaLNVxNxx7BNxJY6MF6T6M9uqYcy53+IWCYi+k7+2fucJhHq
         zH6A==
X-Forwarded-Encrypted: i=1; AJvYcCUBUkOSHbjX2k2/fyMeYlRrAwPzp0YOs9JH340aYKP+mN3i7Fgim3lku8mNQ9OkWFbEv9Yn0nJ9rJ6dcSPcI0S8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt28Y1DTHW1DBmyjNSqUilYnskED5mXFSQuf54+zqf2tq0HzOp
	UDrw5FqEETdWy/6p0I4e0t2AztiMb+guLFhtUaQpaG6H9Pzh3+xpC3YSuLPssWfhP3cvEm9tYA9
	zl8q/9IpedK1ZWJD4UyjkhLUOJVqrnQl8bOdek4AJUbMkCAIsoHXWPdQ2LBReYPMsElDqlvYuLc
	Hc6A==
X-Gm-Gg: ASbGncvcK1J0Gf6hoy7ekrrE6WodHv4ZM9PrVd7zVk+EyO/UjHpRxjxv4oip+NyeA5k
	+NLTzM9hD3D507meu9uoeAcQGquhVP0W3xrQibb6/YObcMn3/EYVwqx3PKyrJlAYXf1DIekKaMz
	EO/7Uqfp07ODMqsKy8zNHlR9Q5xDGpLoeqRZuZeOh9UicjIs5rEL9PTuPqlAoEa3H3zYqe/9BJo
	ekvvrGm8GsP8CG8VPxE2JHN9zKirLpMe4adbt2Du/JYipJp+hugHlCkhTA39TXDAGOVSZMVfUfm
	5XiFjgGhdzwFoF7CaWIgNhxvt+91WT6VK258aOfnOTUyJb2tHawzeW0Vv6srr2SrmiOtQjPHPUB
	uStH8nFzj28JXymXMNkyt7g==
X-Received: by 2002:a17:903:984:b0:224:23be:c569 with SMTP id d9443c01a7336-2445853c0ecmr37034955ad.22.1755162025575;
        Thu, 14 Aug 2025 02:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCPIhhh+ffqme6GqAz5zor8kZgBnNJnCyuurrG1fH9jDZVLnI3y3Mm4ZKFoKE+VFW0fePhfw==
X-Received: by 2002:a17:903:984:b0:224:23be:c569 with SMTP id d9443c01a7336-2445853c0ecmr37034385ad.22.1755162025119;
        Thu, 14 Aug 2025 02:00:25 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24308b184d5sm54553785ad.51.2025.08.14.02.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:00:24 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 02:00:13 -0700
Subject: [PATCH] coresight: tnoc: add new AMBA ID to support Trace Noc V2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-tnoc_v2-v1-1-3285e37280c9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJylnWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0MT3ZK8/OT4MiPd1GQLs9Sk1KQ0M6NUJaDqgqLUtMwKsEnRsbW1ACl
 mJERZAAAA
X-Change-ID: 20250814-tnoc_v2-ec86ebebf62e
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755162024; l=955;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=cSYi3PG1kmS8EsKKSpfDh3ikLpsSAPIjPQtCcqeK2UQ=;
 b=6VYz6XW4DASoJ2Bdk2MJld2ZcPHftrmeKhgON+JIS01U20il0rE/xsHRWDPiudmrxUOJACA1b
 WH/KlBBO4waAAKxNSASQVdXVe+dG8WfNq2icjcUnf+4kDPbxny0ec3i
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX4NPqUOagTOvz
 lpTpEIu4hTKPadWrXFmrk3aa/uk5huWEuK+CRa0hvLn697okvULp3jZm5zFAuznfA3bl8cfY5S4
 nejrPuh+97uiU8PtNO2Tn9yvzuBdZ5LxDa30FF5JC/yk3GheKt9s7ZZuQjgGV3uZFw5sZdSpNgV
 HRHO73ufcyimkhY8WOjB/9rsT/C6S3wl9mGlA4OxvSX6vDIC29O8kpgJgH5aFvVDicEDv12zDAv
 pfsZI65sJusS6KWMqyRgRYpqzGdJemNaLEjJKLK4qJHBIPCFVZj6abWNkIlHoDCav9w4MBWnEXQ
 gBpbEsabdXQzkJOEOFoj5RnkMJtmdiPL1gLrRbt6uMORUsu//lWWNDEnWT6zFJg4Q/Whv8GhSlp
 7+G9W8Ft
X-Proofpoint-GUID: FqNILeAYOEzC2DzIy16GtoArfgfcB3z3
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689da5aa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=w0NzrND8Ag9NSurxa6IA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: FqNILeAYOEzC2DzIy16GtoArfgfcB3z3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_020029_302352_63099418 
X-CRM114-Status: GOOD (  13.81  )
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

Add the new AMBA ID 0x001f0c00 to support Trace Noc V2 instances.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index d542df46ea39314605290311f683010337bfd4bd..ff9a0a9cfe96e5f5e3077c750ea2f890cdd50d94 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -222,6 +222,10 @@ static struct amba_id trace_noc_ids[] = {
 		.id     = 0x000f0c00,
 		.mask   = 0x00ffff00,
 	},
+	{
+		.id     = 0x001f0c00,
+		.mask   = 0x00ffff00,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(amba, trace_noc_ids);

---
base-commit: a80198ba650f50d266d7fc4a6c5262df9970f9f2
change-id: 20250814-tnoc_v2-ec86ebebf62e

Best regards,
-- 
Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>


