Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1DEEFCE33
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3mGKt2hZAc1/fLOvPOaHv4o+LhU4pbbCYTJr7cvoC0=; b=4iVkJWCAXVYM8K4xKC7p/1KHWC
	ZsVeeofFjeyHvYY0gmbBj/h9Dxywdq94EjAyvpT/y8NG8Tflxo32AEeyKrh2ZyePr6nMDm51ChmwL
	YpgGVIEV6cRJ5m08p/01DKXG/Q3Vj2J6RLnmpujplgd/6KL67kHlwTIGxDiAixymCgphx6qCksOid
	R5aYs40Bi4hQF5TKpI2mzw7QAaKuJx9bQX79yFxgjwcRJ8z8dikFPbjVOiy0WnLiIoKZk0qYIRIWK
	N8FCXhDYtEgBm8f3G6Tu7Sd9rymm26tKi+KWP6AaynXbOroS6+9BG7rJ344OyMSfVNXL0VRQSYCp5
	jGopTmvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqZR-00000000HmP-3gjM;
	Wed, 04 Mar 2026 18:03:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqZN-00000000Hkw-2EPU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:03:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624BVdUu1677919
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 18:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R3mGKt2hZAc1/fLOvPOaHv4o+LhU4pbbCYTJr7cvoC0=; b=GTl/xsZhfZm+uECM
	Cdv2UOoxCyv/FNB5aHi0HOMmTs/tdFSMn+u+2HlMSZcdsQsaoIGdoXX5CUfXM3nU
	RbuKM5FoBt/MY9FodKAiOT3Ah8/frxa4ewWsP1Ve14Ud9k3gXNQsP6GWTVnyDQcs
	r9RgSDhnO/yaIaP8RdeB03NzWHdqxgVyZIDzKt3iqly4GvRVRVHPf8htg6/lT9w4
	q9L5smyFl9f/16FvcbSpURF7f6MZdvGmkXeZNv+ktHQipQHeonV3fQ4QWt3tUEqp
	ePM72MVA3rFC8+Ivu/UGmegFrg6voFc11bgULVPnMY/O86SEOUY5SQFRAT9sK9Vd
	8Rw9kg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73hbvkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 18:03:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35982c5940cso3019325a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 10:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772647416; x=1773252216; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3mGKt2hZAc1/fLOvPOaHv4o+LhU4pbbCYTJr7cvoC0=;
        b=XXYUYPpzr8LkhA4jSoUmXZJtvqavRJnUVqMw4bLEOo6FfMYSa2wjDYWtuXTFIR1A8C
         41bFbrXU1p6OPyBGCb7B7Wo5GqbREJLDvwox6jPeQIy0g7Qg2sBGZF1uF2GDwvuoYzgX
         S3SC01NovQF6a1NPxzgC2k7M0KqCwcPJkmDlzvJsBlbypeBo426ZKOocEThzw4f3uhYx
         bsq99L03Gjux8TTyQgZPh5QNEIjrje/skPAOcl1ds1ea0mCq509nnNoqS/BBl7SKd/xS
         cngqXwUVq2EEycAfPrqm8FS5qXF0zkSVbyabA6EDmzJW44sxJo7OIhRREAv0tO8qV1Ed
         W2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647416; x=1773252216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R3mGKt2hZAc1/fLOvPOaHv4o+LhU4pbbCYTJr7cvoC0=;
        b=wosSJxUNmBzjaWqfiQUVtixyG5y5rq6GopnutKP74/eyzCsMaJ8Os/COaoT0cL8L2u
         n3WvpyMnH7B491K+biniWFBIvpB0l0OevKZmQVmrtFGg+xu1UtRkqJkL567YKTce9qhc
         SCRkWElj4hPlUTJXrf0jrIS4IJ2AdPmtcrmhknnA2FRH7Hdd58LXvb+jl5IsqZwLl9WW
         rojm21uVl1WqHYGHntaL8PPKt7L+Se9O1rweXG97pu/MDW518vL8NKckQI7RTP4q0gs3
         gMOzwi9wnEb0GHr+N/SnRCc2eeJhPJgXbNCaZgZxK+WdAZZiNtyBpz40oO4iNy7TsPoI
         3k7A==
X-Forwarded-Encrypted: i=1; AJvYcCVoBxQUWrNRZHdiCXDMFiRVRrLacWNCNivc4gZWBYvr2yqtKQhvxd+c4dvmN0+9JsXxItKmYXR8GDbpELfw2q8L@lists.infradead.org
X-Gm-Message-State: AOJu0YyI4r4BGIEJ4G0yB7fILkjGaA9kN3XKCJdMihp7e7+CJ7EALvpF
	xh/vY4jHs/ZlBU4YuW18ETNxLUaV3q0IKvyNbVAyJAXJyvR/5zetYQD45P7dZvTt/FyCsagwy60
	6gu6NyRcbJ/l18GxRjqA1N5OSpSmVfJgxDKuxcLh3tMoGTOY59lFzajuQStywANvBc3sK0aBzcG
	O4cw==
X-Gm-Gg: ATEYQzzP6sfxVrpjBajcwWurrmbFoJlqJhCI24MmuIrlM70cSeaI8si8GSMq5oHR70Z
	qLfTwLqkAXKzgXBAG1pZRCMklmz13LW60ZuJfafrRLegMbYB4hn+kZwLb6BBlq7hNhcTNuP/ptr
	olfoMWeBoV1R43TPtEuxqJ6gvir9QUmXIxQtlSGM/vFonHwCY7hoPPRd7AfKj/qqkOSSDcrwA0r
	XCPrwbm2dgxoadZC+Pk5mJukxVNxNGStW6+/XAsYa+FoOV0pt717KeszTYEKPIAmZ9GgR6w1JwJ
	nQSf2euwgHo1l8DlGVyQ/TFX5Bb/ANd1RHMsElsAgFcKriEcGw/dHHUw7QfEnu3iQ5mSgEbRtmM
	xeTdSWUFI40ukmPkQpDMuqWP9DmNY+186hnCTrKVT6U6Tol1WZnxHgsvtog==
X-Received: by 2002:a17:90b:1e0b:b0:359:2d1c:9206 with SMTP id 98e67ed59e1d1-359a6a97876mr2870348a91.33.1772647416137;
        Wed, 04 Mar 2026 10:03:36 -0800 (PST)
X-Received: by 2002:a17:90b:1e0b:b0:359:2d1c:9206 with SMTP id 98e67ed59e1d1-359a6a97876mr2870305a91.33.1772647415618;
        Wed, 04 Mar 2026 10:03:35 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8f22062sm1080606a91.1.2026.03.04.10.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:03:35 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:33:01 +0530
Subject: [PATCH v20 01/10] power: reset: reboot-mode: Remove devres based
 allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-arm-psci-system_reset2-vendor-reboots-v20-1-cf7d346b8372@oss.qualcomm.com>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772647398; l=3628;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=nI413mpH4Vny/jDMl6dShEe8rWIdtCh49blRabGf3jA=;
 b=tmuPFucdwo0CFgiVjaW74q0jpCSADUah6j2tcoEU889L00rSI3hCZWyRg9lYeuJLkbzcgUbMl
 lLhJoaewZdSC5aD3/VNXRx2t/86PDFYYBGaT//NQg9dHrzNMmUC8aZ3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: 6P3BpKMs4BbyiXTBB5sYJ9A0l9O2ayjc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NyBTYWx0ZWRfX0xx/Oj/5fpNs
 iFPwnbqc9sCQAbjOPIlXQpBDF5QH8I7oYK3zwFK1iuvrncer5SbT0WYFPWsZNeVEFzXuhOmkTSO
 uAIdLqNhIyMlY+n9XaG9K5+uLoodtGaT/zKtHkVR9GTJiYQ88ZALYFaeQh3/IIC6LZiQyYMQE46
 FwhqwXLsGFmOHigPnYADtsgotlXn7x9hFa33XDCIPAUVpJhAkSulDrX5wzQrDdWOVvDVE38ukbi
 J82vudfEuViZtEWgGp6RR40wjXwmt0Q22ejE4q/3sXa4j52SI0eUBONZB4aRSl9dW8S5ab5B3mz
 PC5UchZoX2+Zf3X42CEUCIBxJCYxdAvb37OCv61QnhJzRq5Mb5e6U67sxNilkFHkBzZIRAPWkTG
 Rq5JGZhszLyHxb0svSUWDhrwcha0ao8zx8TUWRee1eFNR3C9pyqte/Gl0zIzjEpXF2pTWV8edAt
 O973Q5noo12wsrmtVqA==
X-Proofpoint-ORIG-GUID: 6P3BpKMs4BbyiXTBB5sYJ9A0l9O2ayjc
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a873f8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QIdouwm7mKRySFGJXRQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_100337_594204_EEB14FA3 
X-CRM114-Status: GOOD (  18.45  )
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

Devres APIs are intended for use in drivers, where the managed lifetime
of resources is tied directly to the driver attach/detach cycle. In
shared subsystem code, there is no guarantee that the subsystem
functions will only be called after a driver has been attached, nor that
they will not be referenced after the managed resources have been
released during driver detach.

To ensure correct lifetime handling, avoid using devres-based
allocations in the reboot-mode and explicitly handle allocation and
cleanup of resources.

Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..d033043f5250a4de152a7786ef37e88a0ace3bbb 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -3,13 +3,17 @@
  * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
  */
 
+#define pr_fmt(fmt)	"reboot-mode: " fmt
+
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
+#include <linux/slab.h>
 
 #define PREFIX "mode-"
 
@@ -74,6 +78,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
+	u32 magic;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
@@ -82,19 +87,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
+			pr_debug("reboot mode %s without magic number\n", prop->name);
+			continue;
+		}
+
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
-			continue;
-		}
-
+		info->magic = magic;
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
@@ -102,8 +106,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
@@ -116,8 +119,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	list_for_each_entry(info, &reboot->head, list)
-		kfree_const(info->mode);
+	kfree(info);
+	reboot_mode_unregister(reboot);
 
 	return ret;
 }
@@ -130,11 +133,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	return 0;
 }

-- 
2.34.1


