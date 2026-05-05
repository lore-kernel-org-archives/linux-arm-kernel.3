Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F73CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNQeM4CWq6GEUrlO+R6vYzykbXC2BbBSiNTrZjov5SU=; b=GsoUM1lkPG9Qp930dW0eGvkLO5
	6yR6Qw9G4vCs5z1mySoqxGYwRV04fozl4EBoUJeMd1oOaY8YILDAdHit9EbHo5nVh3Fu7rU1v8r9M
	BtINoT4YCjjp0pxbuAVpOSst5Pf9ATzkX2XoTHneuQcmb1bUnj+DPX5bEQz8JL8FVjnLtj36Srk2Z
	UWTGpxp6rbfLo+RVo9dqc1QOjx3Ubqwl8kUCg8Wre8cIcFQUjQ7uVcHoIUQS61I4shsgQin2Fe7hd
	vADxgGxGF+hWCI6N5BQELBvYnL1o6OYNDqts0rwA1vhaeML0TjHFCJSfeHrBWYCVbniBGLh0pPnnB
	9iFO+K/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEq1-0000000GAgI-1L4g;
	Tue, 05 May 2026 12:25:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEpz-0000000GAem-0Ytx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:25:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645CDnft2187253
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 12:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vNQeM4CWq6GEUrlO+R6vYzykbXC2BbBSiNTrZjov5SU=; b=RAaL/5NtaOtf/UeJ
	61uZt5QhzCTyJJJm7qnLWJcbdhiiZeVsNfEjlUC6woArxVpPwCTBsn4awDbGUihp
	27m2eWPYJKNON/xUpn+L9hzcGnm89BUF/dnxHZtnlwwB7mRg5QKxVDIu85W1vUn7
	QB0G5Gy3ZDJcxTkbr8k10lpd0xaDWK/i46+Wk54vw9AcceF3hjVkWUXrwgbYGcvn
	sYyHqRHQyheK6Q6aJ0nv9R0ijhpT0ota0WfayP1o1VrX2YDmmGIoU94djvlKHZ/w
	eojB50BIDZ26n5gv9+YFMedY9sIeJD53+3gtgYK5tppWQq1qaIT6v+7Hp/0RUdWW
	h/l2ng==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dygce00w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 12:25:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8025414a5aso228748a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983918; x=1778588718; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNQeM4CWq6GEUrlO+R6vYzykbXC2BbBSiNTrZjov5SU=;
        b=JP8mAjz7W5aOdQmQJmH5lMIbCE3BJhqFg9y43iJ0vl4YuZ9N4d+AAIbu2MGmbYeZuz
         2SXEalU2cdAs5QCiZm42ZOZLz/HS+2JOSQKfKtDxuDDDm+m+CR5sAfKdYi7s9J5r76HZ
         3r+o9tHf71TPzwQ3c+kOm2HSpgnJxwaFWeSRTQFjI8SiP5iBFZT8gQMyO9WOoRTnxQ10
         TEQTLemZ/HPZAVPZUGA8QfTiAWJdk8C8gH9W3sqJKpY8FzrPprux2PLZvTGLq9sLwFLK
         vy/rZQsTOoN2X00STtXRMmqQaY1egv9sAfVbSJ5WpItk7mOdrVrdg64w5WjJiM/aFjF/
         oLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983918; x=1778588718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vNQeM4CWq6GEUrlO+R6vYzykbXC2BbBSiNTrZjov5SU=;
        b=MnpE9VpoY2RiyKBYsRURX6MwMdGTJL32EMLwU101AZxgXTkwJ2/2hTzErMmzDmEu7N
         7PhWabqpOgGS6rm2S74AgjvR5CQ9gkqiyanGv1bJOVuEJDUjH3vWIazFJT61VQNvES3D
         KfZuiTDfJohwRMISu5Ot32c+G0D1ry3K7mAwVz5FRWaTqJ0BM/vs/EoR7pft9OP9U3Ay
         9ZwGymHafF+NzKe0TLScGjo/aZD1kkp9LKzifOOdZMJhwZersARXJin0smlQv8UUVFno
         bmJeuUJ+Q5rYwpWwvZ4q7/eRvxsNWDEB18gnOAJNcw1MHUr3rO8tbKNDhgj8/HhdxptJ
         AWZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aHFZQsYzAT5U5oXBfY85S9yawxZ9/QV1pCRHDcFizjoCpWR7CSzsh6oZe/PMWxJJQ9c8srsJSD5x8B/oOnVMm@lists.infradead.org
X-Gm-Message-State: AOJu0YysszNU4NWcotjxFaaQtcIEb1ZYsfxR2SRlhP/YwCG19PkPm2SY
	PL6I6b3n7YRD834/rBsp1bw2YlTYVwfYlGo2LUMjZH6+gf38Blgm8Ro3Lyaybr1v12LrtNF8SXy
	7wubvDK8PJFdcxcVRI6N2S6Bl9U90PqAp1XIuv2TrzmMTN0PEvA8MrbOVGToXANTFrMc3YyKfLI
	JNHQ==
X-Gm-Gg: AeBDieuv+wU8cE/41UwGJe2Qm8SEAErG2T7paLnfIxTsklo6wTM2xwPOn+nJ8+Gu61g
	C5ZDnpoShc0ocL5aMjtwcThgQjcZ7C/lb80GlLFoXeFwAijyeZcLelFKUGod9CWjeWl+V5qWIzA
	mwyHq0OnzDGtbwQAe0Glnoz6owxDaPiVtbHOvM7lDp6Qr0XxeQtiQCfhVraSQ9fZBiE0uIcnI2i
	wJ+rbgPP/6IcmdihTu+hNtcbWUtPf3nas28U6lEauQ7h26ulMigukME/eaxN8q4J23KG4lGZAqh
	mHJqzlTHNTpSBsi1p6N6Icq3kKcRP/UFsdK8hmn1Iw8MM49FRLfGrPHfiM/iLHIAnynPqYFg8Ia
	e7n2nhxcYsIdMqoK5gEE1nvYIqNESp5Gz92txbGpgwzoPHYJ2QZVgTHN8vxDLlgQ=
X-Received: by 2002:a17:90b:2f03:b0:35d:ab8b:abe6 with SMTP id 98e67ed59e1d1-3650ce1146dmr7079546a91.4.1777983917985;
        Tue, 05 May 2026 05:25:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2f03:b0:35d:ab8b:abe6 with SMTP id 98e67ed59e1d1-3650ce1146dmr7079533a91.4.1777983917473;
        Tue, 05 May 2026 05:25:17 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:25:16 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:48 +0530
Subject: [PATCH 4/8] ras: aest: Add panic_on_ue module parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-aest-devicetree-support-v1-4-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=1723;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=85/U6iXBPakM0Mmmb5NPMjAPvvGqfJ6KU2VNXgLZ+Sc=;
 b=uAueX0E+J7mO3vSlmsfq2s5T3DTennvda5xbsWtVnYuvom+4lJANe1HZ9CTFuHCFI9bv0MzJh
 UVBLIZVfoxaCfAJSibykZ21OmsQSeQN479uLTCjjakaC2Y6xWj7Te3x
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfXxfZUPzf4s0CA
 QLKSy7qK+dg4Q2Zvy2g8QpKAW7h/WrdGJ2cUzN+SagezqRIoaOg4DpnaGbACMMlFT9lDws1aQof
 J6RlL+MtwcjTUao+evE+LQqSItjezFCaUeVS8Zzz56wtGZ2iHVoqyj1TJ7r/1Agq5kNbadWMgN0
 aW2SFTbak3tR3f3qga4tkHChuUYmY46j4M99OgPKQxr9lHwkHDaNbgeozKNzpI6aX/64YQ4GoWG
 t4kO70zAdxZzhRK7H5aajvIGRiuDMGt1SfOfLWOR0O9ADZZL3fj+sN/qfIodf6WFIRglSFNVYx4
 hfc/XJdH9myg/Khryx4f3+VUYlfRrZQsB5Itw/OYFCuhzEBCOyl2mWy6MaSbSqEEZxEHQem/s/Z
 wtXIT/LWgwCPwRvezRStLwD9btrVUkP16ZhWboqkjydLbSidYNJZynufvWve4+9ppqwYHbLG2ex
 8n3GbzKO6BBd00EdOHA==
X-Proofpoint-GUID: gDL06UihwZ69yCeBCVwLCMjtdsvNUOZf
X-Proofpoint-ORIG-GUID: gDL06UihwZ69yCeBCVwLCMjtdsvNUOZf
X-Authority-Analysis: v=2.4 cv=b6KCJNGx c=1 sm=1 tr=0 ts=69f9e1ae cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=y-mMqNAVNQw5A1T741kA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_052519_198563_0F00C8F8 
X-CRM114-Status: GOOD (  15.03  )
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

The driver unconditionally calls panic() whenever an unrecoverable,
uncontainable UE (UET_UC or UET_UEU) is detected. There is no way
for the user to suppress this behaviour, which makes it difficult to
test UE injection or to run in environments where a kernel panic on
every UE is undesirable.

Add a module parameter `aest_panic_on_ue` When set to 0 the driver
logs the UE and continues instead of panicking.

Usage:
  # Boot time (kernel cmdline)
  aest.aest_panic_on_ue=0

  # Runtime
  echo 0 > /sys/module/aest/parameters/aest_panic_on_ue

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 drivers/ras/aest/aest-core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index b4f4c975da1d..9ce782a66edf 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -22,6 +22,11 @@ DEFINE_PER_CPU(struct aest_device, percpu_adev);
 #undef pr_fmt
 #define pr_fmt(fmt) "AEST: " fmt
 
+static bool aest_panic_on_ue;
+module_param(aest_panic_on_ue, bool, 0644);
+MODULE_PARM_DESC(aest_panic_on_ue,
+		 "Panic on unrecoverable error: 0=off 1=on (default: 1)");
+
 #ifdef CONFIG_DEBUG_FS
 struct dentry *aest_debugfs;
 #endif
@@ -342,9 +347,11 @@ void aest_proc_record(struct aest_record *record, void *data, bool fake)
 			aest_record_info(
 				record,
 				"Simulated error! Skip panic due to fault injection\n");
-		else
+		else if (aest_panic_on_ue)
 			aest_panic(record, &regs,
 				   "AEST: unrecoverable error encountered");
+		else
+			aest_record_err(record, "UE detected, panic suppressed\n");
 	}
 
 	aest_log(record, &regs);

-- 
2.34.1


