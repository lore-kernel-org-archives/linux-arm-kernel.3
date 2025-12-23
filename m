Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274A2E6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mc3GOn350tsV5ROq6wQgRZLIh0hhlkh6WOkw1l+Vmk=; b=fo/C440P890YEcDwlYLzdRJG3K
	VLCf3/jc6hLme6F7vsZpi6+1yQ3TW8/8B3VwSyBk1Bd82rG5Xjrbrj5c7IdgpG+C0PVPvOUPRy8/e
	Bo3D2VJBd14thJpNs5KOX/7aprlsN4xO8h4+3RM5hz1xmB8BG6jHYGIqZyKqVV5pAd7zkxRtAs91E
	bvkvHJlB1c8bm2gBHN2pMm4MZFAO75dHMbrxeIK7wInEDmTLUSxwaNXW6njHVOaVUovwEpDWSJQM5
	Od4rzlQ8W2d9QPlGiQ/uWC1c/hBzc6xmNe6d7kvjJ2M8x9b/suBmFIBxM+PB4RkMGm/G/f8rZMVsF
	QAep1oMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5rp-0000000FnJu-3sXv;
	Tue, 23 Dec 2025 17:08:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5rn-0000000FnJ6-3y9u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 17:08:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFr9Rl4134198
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7mc3GOn350tsV5ROq6wQgRZLIh0hhlkh6WOkw1l+Vmk=; b=KJW59uGpb8HkkLVK
	xDoavrn4MmeLJb+PXS0aMTmD105NuKRIRhuMJXXJ88k5I20iGy98cfm9pu1cLNEp
	r5Th+IFHeMFZ+XxFQy5FovEEooftgnFr4tNojHWbEfmq3sU+/e7razRdqO53YORY
	ow2q7Lv4zy0Iv7v600styZbeIVlOTUWXNL1vFRHpaceZwy4PR0earaGHH5DeOipc
	eMkHNsDGBVuyY9cwZFFqU2rPpLCTfAzGq4xQhPt4GJW0tJn+QC17kY+2BUmIiSJC
	StkG23iQYhqctdzgZV3qJQZqfvNWOsaMkUAfdibJCGJSlQuYzwslIux0pvNzAtvy
	jM41GQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46r890-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so136817565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509691; x=1767114491; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mc3GOn350tsV5ROq6wQgRZLIh0hhlkh6WOkw1l+Vmk=;
        b=MBCWEML1uJ/nEGgHXhecpAFyZFfvUqSQQgApe/WLuiqEnpTTlGtX2SAF0m5Vrxbxpu
         CJNQmBwxcepk8F4QzAZffHMkTTUV4A7fUhoMTmbkx0itL1XjtuYRUPyxvHWBzR97KusF
         6RRQMsiBTg/BRO05EmpAE+qy53xBh9Li6bKMuW9jsWNBTu4iA0zNMD1eilpEwpY+qnOh
         dUDawCHynlcPu3MQfTdAsVGCRvRW8z3My1ftdV8zE0pcxfjdPyCjBeklP7WyYLSCOtL4
         svaCNBg/AnrvTcn3TLQrBSi3L05JTWjYNF7xpjmFaEDwv8beq14jXhlemlA2lYiS7I3k
         8XUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509691; x=1767114491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7mc3GOn350tsV5ROq6wQgRZLIh0hhlkh6WOkw1l+Vmk=;
        b=T3lBP1vsKQSutvjdT3ZM8lTwbMCQWf2iwPxn6V7lj29W0w5QhdldDMmjUDpYnbiIah
         NiL43H7P+3fnsDNqqn2UPIycO5Ny4gy3/+RxWcqybr2iEPsqakgTVEDhAOOfJeiiNrcd
         2u+4uWIaZEWg55b62d0gKEpYlEua2FPcWSqmS3A3kfkEsMwweSiju+STcdheL/k/ndSJ
         C/nP/bTuRCQ+aHUYvR5PAf8FuCYQIXe8fdOjOq7LAUF2BOx/CBjivydyj8pl864Sl2Pi
         wQEq7bGe0+hmJMbx6iu19yWDRqe28WMcnEgn7o6bZL2Er+A8OEja64eiZyR4nvpNPeZe
         Q1rw==
X-Forwarded-Encrypted: i=1; AJvYcCXPI4U8VcZARsnlJb7HKBo0/1EYem9ufYtBoY4xi8EZ6LdXeMpl0ioRWZf0XcOuF7CZp6f2nJUoE+rFM5vLJSyv@lists.infradead.org
X-Gm-Message-State: AOJu0YzdPFMFPOa3RmzUFChyMRIMmBTStuCr0/cDfzhdp+z6KIwkdFLA
	ERprnZsRn6o9llGfuL4MdZ4pVDeGaqtByC0sxSwj9M7Zoy0C3BN2JU/uFmAwEC9nQeP/xvSFw6d
	Xzw7EI2ysqs4803PhhFoj6J6Z6bTo+PlrC4/0URG6ZGQTA6EH8q/GD61uMweiMgYdQ2Xv0ReimX
	cCYA==
X-Gm-Gg: AY/fxX5Hc/jTAIGqEHJv6chH/wZzjYlw5TFGdX4tMFh6On2ZKn06fkYc2IEhHIGbf8w
	LutIN7QH1/v5bGUQswwicE/KFL9GlWGLE1LFfBbaiGYHlPOb+YmAMrQkguXn+4eb4NHxLfqXIbj
	OsNrrzIImyK5jYx+0SalZbr5aBzaywbJyIOMUijRR1ZMFs35OcpARfd+vc5g4+72riqDp9pcUHq
	YYrky0wvH7d1q/JX2kfH2IEdXIRMkLRT+QjTQeYm1AfyEzgVry4VnYYw8MmEnbaCpwRyL3WCe6d
	LRVHRofx6oynuC38noQfzrIK2Am4Ycp+YLuaPC9phMr/dtmVxjGsqjYwhmIUKLt77FSf0cHZmcQ
	e9GakmK+yB3RwwhaUR3t8R0HVYTeYFrmQRroZuDxWtp1J+A==
X-Received: by 2002:a17:902:ec8b:b0:2a0:d436:e7ad with SMTP id d9443c01a7336-2a2f2832c51mr157277935ad.49.1766509690515;
        Tue, 23 Dec 2025 09:08:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQ4aOnLvyrVaT66N/eDSlqnerZMeyA1rrRBgGG9I3JAKDcbQUsSMiZ5xQmSXBqsbJ2CmnO9w==
X-Received: by 2002:a17:902:ec8b:b0:2a0:d436:e7ad with SMTP id d9443c01a7336-2a2f2832c51mr157277475ad.49.1766509689927;
        Tue, 23 Dec 2025 09:08:09 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:09 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:33 +0530
Subject: [PATCH v18 02/10] power: reset: reboot-mode: Add support for 64
 bit magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-2-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=7589;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=2o2cT38Ly46xd/419lqAtzNeNc4dO02E+TShPOPKLWU=;
 b=ErA8eTOuOFOVhrWwNxeIIP8Srfsn/pUO1IpTWe2NedElfQ2IN4YB6eCoG1OL1KxxLRWA2O5U9
 jE3AMKHa3WXBeBut/eiy7DVsRaP290clHrPDEVmXVTJPn/xTrYR/pwP
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: ExxBQnTmwnWQaMUfbti1BBihD1S6ds2i
X-Proofpoint-GUID: ExxBQnTmwnWQaMUfbti1BBihD1S6ds2i
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694acc7b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MO_J9Aa4ypbE8kPWTcIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfXxakL2dJQRoyJ
 Z0/MYPZOYKjH2W6FB9CwKSKA1dwe9C75L8rhElVJL/7eoay+fRarYc3hD7EBc5qtFttNDmeJQzv
 ZlyQllcCeKpvtJRgBxyxdqnG0XRXPULvljjrbvdFY04IvIkAG9f0b5jvI0zH8mI2I6zlDqgetfE
 QDyjrkeTdG3MRb1m2o9b6YYMR78peNxWE52FNHs1BQzpAqETppXqKQNlB1GXtotwL1Pb4LHzmhV
 zqllq/53W5Uf5njP7AyvRW+npXDLoAYFOreeTibAEnfGRiCK/ICz36vQdXEV49a4OzvWVxffiTz
 9EKqa3/K8AXed8wTOOzjIllo+WiwjXmSaSBOOSyinTGiinDJxuvCBofL4o+xaUPW+clSu/mi5T0
 QAQ5zLSG0KYzBVQozKu5hE5ZuFd5ln6GT433pOrYPjhW7gNJTr36HEERoICzlU2SZPCj1hAGMsY
 FVipk8Oo9liwYZo4rag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_090811_993794_42977AEC 
X-CRM114-Status: GOOD (  23.12  )
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

Current reboot-mode supports a single 32-bit argument for any
supported mode. Some reboot-mode based drivers may require
passing two independent 32-bit arguments during a reboot
sequence, for uses-cases, where a mode requires an additional
argument. Such drivers may not be able to use the reboot-mode
driver. For example, ARM PSCI vendor-specific resets, need two
arguments for its operation – reset_type and cookie, to complete
the reset operation. If a driver wants to implement this
firmware-based reset, it cannot use reboot-mode framework.

Introduce 64-bit magic values in reboot-mode driver to
accommodate up-to two 32-bit arguments.
u64 magic
--------------------------------------------
|    Higher 32 bit  |   Lower 32 bit       |
|	 arg2	    | 	    arg1	   |
--------------------------------------------

Update current reboot-mode drivers for 64-bit magic.

Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Reviewed-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++++----
 drivers/power/reset/qcom-pon.c           |  8 +++++---
 drivers/power/reset/reboot-mode.c        | 24 ++++++++++++++++++------
 drivers/power/reset/syscon-reboot-mode.c |  8 +++++---
 include/linux/reboot-mode.h              |  6 +++++-
 5 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index 41530b70cfc48c2a83fbbd96f523d5816960a0d1..b3d21d39b0f732254c40103db1b51fb7045ce344 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -16,15 +16,17 @@ struct nvmem_reboot_mode {
 	struct nvmem_cell *cell;
 };
 
-static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
-	int ret;
 	struct nvmem_reboot_mode *nvmem_rbm;
+	u32 magic_arg1;
+	int ret;
 
+	/* Use low 32 bits of magic for argument_1 */
+	magic_arg1 = FIELD_GET(GENMASK_ULL(31, 0), magic);
 	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
 
-	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, sizeof(magic));
+	ret = nvmem_cell_write(nvmem_rbm->cell, &magic_arg1, sizeof(magic_arg1));
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 7e108982a582e8243c5c806bd4a793646b87189f..ccce1673b2ec47d02524edd44811d4f528c243e8 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -27,17 +27,19 @@ struct qcom_pon {
 	long reason_shift;
 };
 
-static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct qcom_pon *pon = container_of
 			(reboot, struct qcom_pon, reboot_mode);
+	u32 magic_arg1;
 	int ret;
 
+	/* Use low 32 bits of magic for argument_1 */
+	magic_arg1 = FIELD_GET(GENMASK_ULL(31, 0), magic);
 	ret = regmap_update_bits(pon->regmap,
 				 pon->baseaddr + PON_SOFT_RB_SPARE,
 				 GENMASK(7, pon->reason_shift),
-				 magic << pon->reason_shift);
+				 magic_arg1 << pon->reason_shift);
 	if (ret < 0)
 		dev_err(pon->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 4b6ae4007c4f6fb7d51520b4be2bf3cb1dff518e..54adcda57e44edf2fd2cda0f752226f747aa72d7 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -17,12 +17,11 @@
 
 struct mode_info {
 	const char *mode;
-	u32 magic;
+	u64 magic;
 	struct list_head list;
 };
 
-static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
-					  const char *cmd)
+static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -54,7 +53,7 @@ static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	u64 magic;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
 	magic = get_reboot_mode_magic(reboot, cmd);
@@ -77,7 +76,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
-	u32 magic;
+	u32 magic_arg1;
+	u32 magic_arg2;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
@@ -86,10 +86,13 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		if (of_property_read_u32(np, prop->name, &magic)) {
+		if (of_property_read_u32(np, prop->name, &magic_arg1)) {
 			pr_err("reboot mode %s without magic number\n", prop->name);
 			continue;
 		}
+		/* Default magic_arg2 to zero */
+		if (of_property_read_u32_index(np, prop->name, 1, &magic_arg2))
+			magic_arg2 = 0;
 
 		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
@@ -97,6 +100,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			goto error;
 		}
 
+		/**
+		 * Format of u64 magic
+		 *-------------------------------------------
+		 *|    Higher 32 bit  |   Lower 32 bit      |
+		 *|        arg2       |       arg1          |
+		 *-------------------------------------------
+		 */
+		info->magic = FIELD_PREP(GENMASK_ULL(63, 32), magic_arg2) |
+			      FIELD_PREP(GENMASK_ULL(31, 0), magic_arg1);
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..eb7fc5b7d6a7ed8a833d4920991c4c40b5b13ca7 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -20,16 +20,18 @@ struct syscon_reboot_mode {
 	u32 mask;
 };
 
-static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct syscon_reboot_mode *syscon_rbm;
+	u32 magic_arg1;
 	int ret;
 
+	/* Use low 32 bits of magic for argument_1 */
+	magic_arg1 = FIELD_GET(GENMASK_ULL(31, 0), magic);
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
-				 syscon_rbm->mask, magic);
+				 syscon_rbm->mask, magic_arg1);
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..a359dc0c6dede0ac5ce67190a00d46a7e7856707 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,10 +2,14 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/types.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
-	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };
 

-- 
2.34.1


