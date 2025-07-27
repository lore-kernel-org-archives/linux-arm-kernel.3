Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD2AC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 16:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDqwUezYGa9CZCaFbdXED7PEdoZ055Cwe3xHxx1ns7M=; b=38dxnFbhAjC0WYovnaP+X3fjMa
	Js55SxwTfvgZGbmFSenPozAKc1DeLxTUVZ/R+cMciaoo3nKTkajbtc48X9+O8QA30v8KkhivmAAeE
	I5YGHOgG2uf2OnfjGOD5mezKzls0O2B9tCNv+9HvOBDHOAGK4VWr4HZQRs1VH716hZ3bsfklauJDW
	aPvamtjzLYFik0wUNfuyQSey4kLGK409mCvJCFF9+DFlltZMaeNkv0Y899xFTfzXfk28eQPSukY2M
	l1XaZG5+UCs4McjCscZzt+DX4ho4Zq2TWbIIpDTOyi9tHWCI7PwcMr9Zk4xQVMbcxgvBOWZfp6kS1
	IqHUkJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4Ix-0000000Cw9t-3su1;
	Sun, 27 Jul 2025 16:32:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4Bd-0000000CvAc-2gO8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 16:25:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RFc6MH005152
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDqwUezYGa9CZCaFbdXED7PEdoZ055Cwe3xHxx1ns7M=; b=J/BytHoonSw9xSUD
	9FUMpWgPz9gK6FghJ2oSve9fB3dXPTaQWoIwi4uo+sq4SZJ8zkLcgZcJqKR2MIZK
	PMFc0ro77zh19a58xKnV9dWNpschQe5SynxvLExHlGci9PSPGhUhXlKdAonkUYwL
	cY1ZxMD2u24cA6asaUYxmijyNP0xbxl0ag4KDzhGREZRnwGyAbumFG3Oi0myZGJL
	+jV1aJlVeBkS3rEFK6ZiPQHk62sqlRXrVkz3ZaqZ4uEI4XAYtfiJc/DN9x4evNpe
	OBp5kPanJl9IgAUz30YYYOUj4YvA7rxOmj34vIEEyix2utgUcT8HT1g7Rvm/nfVJ
	+KWMlA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2aayg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2400cbd4241so4314095ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 09:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633519; x=1754238319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDqwUezYGa9CZCaFbdXED7PEdoZ055Cwe3xHxx1ns7M=;
        b=G4R0u7WnmlwD+h6zL8GzRBzGROiHOQgYeS1pt9L3lQMc/48+h5vIK0RkBhDWs44kZ8
         2d5eKKKTJZqsXnLw1hN35uLTkB/0GDkhKy01CeApNGgDhyETzzgaWXNGUHhi5u10Iho3
         C9B/N4asjNieAqTH+ve/6OiDudfpOMNp+YdeEhAQEaPQwjuk39aHlWmTIESUnWatJbul
         ZyDa+mhI7iaTYAjWldyJoY0fAKQweQQ7byB6MExi8e3uaZ8dnanXLhMLVmRu36kVuceM
         RPBfknfB84AzXUJmI413mQhhU9GCCuVocQm8ulXphyTxPDghA55RwVBZt2V1LWZjqX2m
         aGlA==
X-Forwarded-Encrypted: i=1; AJvYcCXhB93VMvPIgRrv3mQRuBlnE1N9PSzyhEsg6PaJTjWzr9nWmwEwaVC/Tf7SoJsnkRGvbfprkdfjaY1sOQLY/Eto@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2gTaVZlM5s7c/L333RxTlNy4DPoITdbUrTqxwfZpjjMxCsdIV
	hRKmFzjG8pMIo5OR70Yt8KdhqDBIn5+pvSbTgi2svhV6JLnUCYnamgd50FqGEpeUvNqrWhISalR
	kKGLJLRfBfNJh11F+iRzZXJxgQ/+kfdxHbBfqLIyoavc0THRZ5i8vWo7mJmTsFeu5Vf773/8tzF
	Uhaw==
X-Gm-Gg: ASbGncudmgx49RcAFN9NPzegJnzIHq4nl6/c1oy0bmMGrASo5Jx97q7HSxDp0vEX+f7
	sooooMeetJ5ebcAlDDPlBNCQNBLlt9cWRLZ3tSt08c7NIcuo4v2ZNcDbYIP/G7sVzv8tHjr2PZh
	me8N9pzzkIdJsj6YKkZN0OFA7Tu1wQCYoEqJ+kdxTB1JR6YfiZc44jwfs65DCElI/eIFc73PBt4
	IyyIhJz3vpjzzNxgznhz6Smv1Ctd97I3G9RYo2Aby7BmxOBF2/0/rD9JtJuYEpCGpwtxW3RQ6+L
	7v1cX5i95+5wSYP2nBcUUcJFgPixei3VfO+im2AIql4BD2bXAleGkrvyhVxZR2K0a/wtnLWyaE9
	2
X-Received: by 2002:a17:902:c7cd:b0:23f:df36:5f0c with SMTP id d9443c01a7336-23fdf366308mr55454975ad.29.1753633518993;
        Sun, 27 Jul 2025 09:25:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElN+SPhw8k792Rzn0TYr1j23uV/PBVvafh2zJyXG1hP+afi01ZKCrh30mmgw+pZFEK3C4rbw==
X-Received: by 2002:a17:902:c7cd:b0:23f:df36:5f0c with SMTP id d9443c01a7336-23fdf366308mr55454455ad.29.1753633518447;
        Sun, 27 Jul 2025 09:25:18 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:25:18 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:45 +0530
Subject: [PATCH v13 02/10] power: reset: reboot-mode: Add device tree
 node-based registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-2-6b8d23315898@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
In-Reply-To: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=4877;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=BzWfToJE3ECxETuJZ3k/sBp7q/SRF/jEhj86+u2O1rk=;
 b=GE6STsqGX975fKj8Z1KrwsY62SN2T3Ty4HgdyhnwjO42V4WyuNyRkjHVvNq3UY4UsFHB+HdQi
 rEVqNY7DrZ5AQkVVZqOBQUd4giAmSraiKzKugXbVhvKrIpJAQNPgyan
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: 3_d8eB-aoJm7NHFyWw4uXYTQG1Kioi2E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0MSBTYWx0ZWRfX+5hZhq0/neN+
 yAhAu6Qyg4x+4TFCQvWCpLcPHiN9jsoWSl1Ay5NWr/bh8ufKSOy+s6Qkizuvn9b/3F8ypvlImbH
 OyQNS1Nf3covOkjE7mLlZ1o+71ChqSHsrofqJzlluAaETMmSFgNEnVGrDFpyA8mR3/8sJUgN577
 vGqgCDfWJ/UMSostkF4ixXFZ20ll7Skt9Te3t6MwQVzXpDncNMk78sHLEgp2VgnSnzOtPCA8inP
 zlrglkr0vl5W0QJscSTziQcf707SR83rYMy0augfnuJirenNVNNXcxSTb6ZShUVwWVeMo7GWKPw
 sbgZiOJShRnd15UFmKv5N856/RqNul8LzsR4iO0RqEEReNtln/2ahzOvKBHU94Q3TdPVi+BLTip
 1u0jhuTW6dWl/A0gdInIWmUO1LBPh1NvInFtcjcKXpwoeZr5K0EmgC9hErNAxs850U2tCfOJ
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688652f0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=IcmTHOqSNbDvJ54L4SUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 3_d8eB-aoJm7NHFyWw4uXYTQG1Kioi2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_092521_806687_36068E00 
X-CRM114-Status: GOOD (  22.70  )
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

The reboot-mode driver does not have a strict requirement for
device-based registration. It primarily uses the device's of_node
to read mode-<cmd> properties and the device pointer for logging.

Remove the dependency on struct device and introduce support for
Device Tree (DT) node-based registration. This enables drivers
that are not associated with a struct device to leverage the
reboot-mode framework.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 37 ++++++++++++++++++++++++++-----------
 include/linux/reboot-mode.h       |  2 +-
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 42bb99128ed3846d4bff62416dc31135ddeaeb90..9bb97bcd33cd3d58c75c791e9b568024e810e5b0 100644
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
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
+#include <linux/slab.h>
 
 #define PREFIX "mode-"
 
@@ -75,17 +79,21 @@ static int reboot_mode_notify(struct notifier_block *this,
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
+ * @np: Pointer to device tree node
  *
  * Returns: 0 on success or a negative error code on failure.
  */
-int reboot_mode_register(struct reboot_mode_driver *reboot)
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 	struct property *prop;
-	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
 	int ret;
 
+	if (!np)
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&reboot->head);
 	mutex_init(&reboot->rb_lock);
 
@@ -94,28 +102,28 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
 		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
+			pr_err("reboot mode %s without magic number\n", info->mode);
+			kfree(info);
 			continue;
 		}
 
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
+			kfree(info);
 			goto error;
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
+			kfree(info);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
@@ -129,8 +137,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	mutex_unlock(&reboot->rb_lock);
 	return ret;
@@ -144,12 +155,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
 	mutex_lock(&reboot->rb_lock);
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 	mutex_unlock(&reboot->rb_lock);
 
 	return 0;
@@ -178,7 +193,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
-	rc = reboot_mode_register(reboot);
+	rc = reboot_mode_register(reboot, reboot->dev->of_node);
 	if (rc) {
 		devres_free(dr);
 		return rc;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index b73f80708197677db8dc2e43affc519782b7146e..98f68f95c9e8460be23282c51ef7fcbed73887bd 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -13,7 +13,7 @@ struct reboot_mode_driver {
 	struct mutex rb_lock;
 };
 
-int reboot_mode_register(struct reboot_mode_driver *reboot);
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);

-- 
2.34.1


