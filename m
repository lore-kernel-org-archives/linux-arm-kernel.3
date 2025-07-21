Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC97BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rG45QmRI9+iBqNCinCJQTKzCsl1+wtsDTxp0VKROmY0=; b=qQOcsDkbfPVt/ZHFTHgESdl+Lp
	bvO65wLnRMQWmW9rJRvMjCppcZw+40fkutdOmwvLXR9BiBv7pyJtZjpOGcyNWPLbjHvC55OJpSwyJ
	3tl61C55+7mTh0sysye+e1We2I7QiBdPpk63yLHjlDOYoCH4r2mOsFzS0qaPcY8mg+V+kX9d/0Tx7
	+WnbLL/C70lhDgobmm4ZLlyBgtWfIlCbuds3n/Cd/yGZNNdNlIToPiO7qt/IA30s5RczM4UF936rl
	RNP3gWrWp+tq8JGo2nV+vZIFMMpqd6eHM1fG5wsdxuW/aEv91zd6/VXSvh1I/z4GoBkLw6/qYAVS+
	OVVzdO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvi8-00000000SBX-1paP;
	Mon, 21 Jul 2025 18:58:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvGH-00000000Pry-1d4r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 18:29:18 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LFT6FM016274
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rG45QmRI9+iBqNCinCJQTKzCsl1+wtsDTxp0VKROmY0=; b=N+DFY3KrKYEQTf10
	IOll9qIyYOdXsk8tbVQ+zsB8byxO9bfpS4MgnaoiNCnHbsmIc1qnh0kA4unf0ain
	x2q6O6JM/MFzVdQMyc8wQUnUDGrrFFqVww+dbvF/uYy1UtxaXR8zWUGVgYmPU+Po
	1V1vNZhL0WpFoCtzby3UGPozbxUfP6J+HykvVKSAc4xmzrlrg4LF77D5pmnYh+VB
	phvZc56K/jx0fIEzoHKY6NNvwp/zcJeVbCbkwvmBJeViMksBHr3TDaEWHqEgRRiZ
	cEedjqxO6+odjJ6otUdQQ4EGAi9GNQyXOGaR1sp9AxPB7KRLrJg3GNfbESGXapit
	L3wh9g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rxuvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:29:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2356ce55d33so76372405ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 11:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753122555; x=1753727355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rG45QmRI9+iBqNCinCJQTKzCsl1+wtsDTxp0VKROmY0=;
        b=BLw8ueGOFbbhVVuNhwuqxVGP9YWI4JPDE50e8uumNZQtqgcMrFD2O+AIqm5Fvs36vm
         DddX9q5LnIs5UXpIw9BhiyAEjXwgF/iZhxsrsXweT9ZzNfjyew6anSIfqXZLpSj2cAzG
         mugruDEV6eo/U7N8vNkN/u1zrhhmNrr/nwZtn+6M12rqTUnVL07z+rFp7XZ9CmlulG/H
         SVOZkmeJ/GIuO8VjreYpVHMpjqAaaH3lPK9UtkZO4CW+VbZS6/xA6z2Zztz9qboDWv0r
         MMsKxdoxbPVvGMBHndYxjcfZlVORC5XYE/j+xXYfkaZvl7rzBzXyPuNbern9jk3GLZlb
         8XbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPjSjzj7C/eeABgfQud7Ey53mt7cZ1HnpkOipxnHnWZWNR3rvCZJj6aIQTjloMiAmI6I6MsFgNT/y/gXSrWv43@lists.infradead.org
X-Gm-Message-State: AOJu0Yzph9FXnaNYVeP7GcchBEPl5z9tzgMakupyzS3LDTNG8GXa1TOx
	Dh1xyb0wdyT9ZRUV4NfywDtyXczzPWXhSmf91hNWwDDpdiX0JY7tgiDdzf4NKoNLCuSYvY2WTEO
	k7ilef0uf+taAwPSOPTh2T/ah8EdrJzlO9Pa2PghCm8RK6SOwTBr5yTDGRG9zgvAfi7Zgqa+ALK
	ST48PwcvFTMw==
X-Gm-Gg: ASbGnct993A77xHaaoIsecUM8H/ftB9pWizzqA1K7ZeVeFZFbkyyDwHO29OPUGgDmA2
	//F+iCkenrIF04ZmShB0Dt6g73VaqtRzsU4CuUgeThj6RrZBzzYSGatfGLicpu/FQbpj/1+vUx2
	bepzvMvmaxeujZYwyMokaBFlxtuNw2oqk4lb/4+qIttGPIJ1zZZT6/M3mowktGgz0jN+1MZak1r
	E/Y8Acy+x1welVJtOBTqleGEapSBnAlUX6NZK1YVex9asLehBo+3rD39bb0Sqomzzt5YRasJ+7s
	AiDBMr6s9heubU4OGD/IKG/RBGsi7i/c5RWvu2Zfz18sqPaR7We1SxVLh0b23Zkt1K568MYySVj
	s
X-Received: by 2002:a17:902:e743:b0:236:748f:541f with SMTP id d9443c01a7336-23e303381e2mr198330155ad.33.1753122554981;
        Mon, 21 Jul 2025 11:29:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpAzVNLaCg2Gv77/iRs3fyWlqjCLVrcaPExqG0knuGIGBMl7og87zCiNVJnrLBQrLtETRsRg==
X-Received: by 2002:a17:902:e743:b0:236:748f:541f with SMTP id d9443c01a7336-23e303381e2mr198329695ad.33.1753122554498;
        Mon, 21 Jul 2025 11:29:14 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef4b8sm61414545ad.194.2025.07.21.11.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:29:14 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 23:58:48 +0530
Subject: [PATCH v12 1/8] power: reset: reboot-mode: Add device tree
 node-based registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-arm-psci-system_reset2-vendor-reboots-v12-1-87bac3ec422e@oss.qualcomm.com>
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
In-Reply-To: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753122539; l=5726;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ZyOHLYhozG6V8PN3U/0QHQPmjuZ8gOT3WNXbJbdwhzc=;
 b=KOFzSAWzGKbv+M79egz/GChhgHU6xfaA5O1QqIxVw6CFdGzR5PYARtR//aW/C6ryBSPhMCl/x
 gkyK0fDoyYgA9Q8BCmazAW1z4mUnbbRJq0MZuXwYtmoqTpHggSB0btB
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE2NCBTYWx0ZWRfX6OmM7sm3wteS
 UF2H0t/16W1Yc+Wv8awV27aFxi2d3weAfEclzET7NNFdD3FiN/JWjqsRf0LcaLhavQ5jqy4cEne
 rk3D1ZB+rPBLq/2dFEHweKpc7EXqnSdbO5wEZIaamVIs7jIJQMU3yg+qve9AhS3buCchlx3pehI
 oXRWGL/+BTZWDlULi5PLeHTMIkHL5WpK9LfwRT1yYFEK5qOjGd5WE/dMxBSe/ywhLV6GSrFLIac
 sGRTy0zuJ5afkTl9d3P+c2CPkfogrBfwoSAh9kkmK5XwTKrBM4hu4eoQ/NF5jKhdyfZSW7kPdko
 geUTTtJxNbJzngHjAipEo95lsiAuX5mOMWIWgDMQxZS0tfoxt1dp7RVWESufQH1xxF/U/RkNDTY
 HS0og1z2+lyGXKJUV9g2oU+EjE1CFnrwNKwcw7382WMMef2L3Vu+ouXPKD6qkFI7wtPou2Lj
X-Proofpoint-ORIG-GUID: ty2gU3fXovxiiuhOrsExrLCIfvHV6bFG
X-Proofpoint-GUID: ty2gU3fXovxiiuhOrsExrLCIfvHV6bFG
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687e86fc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=239sejjMsMoxT4pUUhgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_112917_552703_F8AC94D6 
X-CRM114-Status: GOOD (  23.42  )
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
 drivers/power/reset/reboot-mode.c | 45 +++++++++++++++++++++++++++++----------
 include/linux/reboot-mode.h       |  6 +++++-
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..5dd3f06ca88cb28606d9fd2100ce03383c14d215 100644
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
 
@@ -55,7 +59,9 @@ static int reboot_mode_notify(struct notifier_block *this,
 	unsigned int magic;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
+	mutex_lock(&reboot->rb_lock);
 	magic = get_reboot_mode_magic(reboot, cmd);
+	mutex_unlock(&reboot->rb_lock);
 	if (magic)
 		reboot->write(reboot, magic);
 
@@ -65,45 +71,51 @@ static int reboot_mode_notify(struct notifier_block *this,
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
+	mutex_init(&reboot->rb_lock);
 
+	mutex_lock(&reboot->rb_lock);
 	for_each_property_of_node(np, prop) {
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
 
@@ -113,12 +125,17 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
 
+	mutex_unlock(&reboot->rb_lock);
 	return 0;
 
 error:
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
+	mutex_unlock(&reboot->rb_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_register);
@@ -130,11 +147,17 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
-	list_for_each_entry(info, &reboot->head, list)
+	mutex_lock(&reboot->rb_lock);
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
+	mutex_unlock(&reboot->rb_lock);
 
 	return 0;
 }
@@ -162,7 +185,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
-	rc = reboot_mode_register(reboot);
+	rc = reboot_mode_register(reboot, reboot->dev->of_node);
 	if (rc) {
 		devres_free(dr);
 		return rc;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..98f68f95c9e8460be23282c51ef7fcbed73887bd 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,14 +2,18 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/mutex.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
 	struct notifier_block reboot_notifier;
+	/*Protects access to reboot mode list*/
+	struct mutex rb_lock;
 };
 
-int reboot_mode_register(struct reboot_mode_driver *reboot);
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);

-- 
2.34.1


