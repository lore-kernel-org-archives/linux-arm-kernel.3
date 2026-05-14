Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED869CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=; b=PjdETbHvG6+ZQYbMg7k4gnlvWR
	qqZX7vErrQYHzNyBETZ3PB62VbxJ3lIdwh/8dI/HiqS0J85+ieOSb2xeyeQvOwR3EghcrIyKet9rN
	Ja70y0Cu39+5F1MJMj0hONxxxVXmewuKpRn+wbrSsYf8aUSXD7Q99Mw978/+VwWthPQ3GvvsvxGJB
	VmeSM4z8QbYJEIKbW7sMZt1ghSRDn4Bu4eoPYgeeUqfzAw8o19yEvJO+NLgNLjGFATH9sl/GcFnn0
	+SON3pKmx8pzO+0sA9qEcMoIplR1WRL2tHPMJ29ySd8zkhITP7PNI/YqkUfkdazKLJjZ4yDXWAurU
	0ABQ926w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX1t-00000005iYc-1YZS;
	Thu, 14 May 2026 14:27:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNX1q-00000005iWt-1rDQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:27:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeV8c2713286
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=; b=jU57Hsc9Cp+8w9s0
	CGvG16i8lIutD7VhNK4+CDEjGWZRymQ6x1co06YI7nnSqkdKIs/HiNRRLEO7Pt9E
	gOJKvbpQR2B82eB7NA39SHqJAXDW7IufZ5hH0LiscTGLub6A66gnxnDqgpTOk+hj
	56noyvHc3WSofy0NjjnrKxSlfT3FtYVUy/ocxi2P+Vsaq1HfCc+u38V/4mtAI2PV
	vaelzXd8V9qQ3gilUk0FY/4ut+8epEVdYW0I5CSwFPEEwDmJZNOk76TpfmCR6ptc
	cOTHx+aHR4fG/xNniazrfsvpZoumzpizZ5Rll6cAmIHiCMYPyaLJ6QI5+dKEd5vX
	WQbqtw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v89per-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 14:27:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so83919435ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778768829; x=1779373629; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=;
        b=j4X6ejhx8W6vsdFORUtalrNfkq1MLK3G5pvmC1yJC18yuU5p88iAB5wI5XP4BSuQzX
         cCzak1wj3QSMDuNU9NZ9X6/h0KhOoPJMr8ZgP5FU2JN5QwuhZnJZVbCGsa9lOOTWSNX2
         PttLiBc3DjHBLdpdC3G1QXTxLcFtNdxmYhCUcUwdAellUUomzkx3PCkKJ7uUKMlhE0M9
         pJryIXAXLurktZae3n4ZAakx8GKuwa1pYnw0q1gdKcINyLNXkBvHWqMlK9xx5XqUtdUk
         WFwLpRInW2y7UVolzhxyLrzNrqxksN1ynMiOaVMbEWt/leo+4AgH5R07XVKY3P4ih7vZ
         xVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778768829; x=1779373629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=;
        b=Soz3j5Xn6MlHT36TKCdUFU6n/ZpUU6VYMjm/kX5EWZK6B6+68IMgRyQDPfBv20IltF
         VxdTqSNDKuvVKhAqeWk8ndOPsktH8me1NHJ1YDJMfhzyDa8QO8GR/dlvGrHoiZxGkAl5
         Y0c6+CeINo65fLskx1LSJRi5ut7sDHyYgbQ/10W+SIAxqvVWrlqn4JdWLYZeaABH7lT2
         fvvSVrgp6ffldZScq7Ln0n5rmgN2chtZF2cu9KZbIYEFu5t7ppcxF2qZRBkO4r7XZGfd
         0sJU5pWbaLHZVrhPam93B44zE8cp6EumRT0U8jtUj3rURMGPqTNGGG6RYDpT07Hl/zv8
         7pJA==
X-Forwarded-Encrypted: i=1; AFNElJ9lRp3CcZEQvLsLijJkogg98eA7/tbFDBogJrjBdNTa6MVR+8BEC9C9YCPqIDvCLnLEvmi1+zUquLWs5eFZIWjT@lists.infradead.org
X-Gm-Message-State: AOJu0YwZhEa0m88WG/DsSS0zTMigOyRCfF7TEU4WZWS8UKv8kh/UC9Sk
	ql6qUmlk32gV8GCMrn/JJ7k0ml/FzCViSZ8Ci47ree5LTvm8cvbMtJo8XUaHij/z76rTjXnouZi
	8ygNbVi7PTK64Y7YStoMzD+4T4FRs+Lv8MGQBpEOzWF/M34pQreXrGLc9zmQ49H+4vwFjPsN324
	mTDw==
X-Gm-Gg: Acq92OGfrdgml53xJ/hshjdMitJLPL6lNtRgzwzLf8+GqHU3HhAER9/io77HzY6lJPP
	6clz9OELPQhUbEqOOx8CxtBUtAnQ214K0XWFJcXGgoBwrZNTtBffzCOdscOVuepJ9JfnfHtY/m9
	nBrCQ53r/SCyEQikoksLoBDK0dWnbtf+/N7YRH+j/C/stXxbukN1mKPCiNFbBTaoCFWJZPDS/MN
	QfwV6ntvyhMz3LF933ecrNCdt0BwsS0DjvYGl5xnddm4dXNhmlK0WikBJ9DhFXRt3eUPXnywZ6g
	u3WNQayPIgBF3hjn+NSOSVbaFT4hARF46JCpl0QMm7K19A7194SrzpNUDFkX8SOk1Bd9wa4GoBn
	8Tt4TsqULYR3//PL/u7R/tpPfKIe2A5U6TZZilZJjtv8XatRXI8QG4ZjHvQ==
X-Received: by 2002:a17:903:1aad:b0:2bd:5026:ca11 with SMTP id d9443c01a7336-2bd5026ca9fmr51787175ad.2.1778768829042;
        Thu, 14 May 2026 07:27:09 -0700 (PDT)
X-Received: by 2002:a17:903:1aad:b0:2bd:5026:ca11 with SMTP id d9443c01a7336-2bd5026ca9fmr51786675ad.2.1778768828397;
        Thu, 14 May 2026 07:27:08 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm28566485ad.27.2026.05.14.07.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:27:08 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:55:42 +0530
Subject: [PATCH v22 01/13] power: reset: reboot-mode: Remove devres based
 allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-arm-psci-system_reset2-vendor-reboots-v22-1-28a5bde07483@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778768806; l=4001;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3TYOHMcToCIVpsVU2Bo6DmB6sqgmdebWzZn/F1m0e+g=;
 b=YkzrmDnT6IWVQWvAsPWyXkGv3PUv6QacptH7QqP+Tjs99Ct+BZ8eqQmoQSIZra/PQKUTaAkUh
 swxtTXMqMYBAPyIh6JKWAQaN49fbiVTXcCgIb8O4A7VKn2jvOAYjvG0
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0NiBTYWx0ZWRfXwC5R8taNuCLF
 04kyA/sFEPskfH6dzQBHVqev6Nkde/YWdJpAVVxqPhS/xPIZgUNxnoB0s68MJO6Upnp8xid5GAY
 8G0zIDumi4CqcWHMHuL9mMJo5PNHlW5EilQTQhQURczJCzch6PI0HaClZW/EFST5mbHTK7r+EYH
 ALYpiVN30HGPjkgWjirtSDqJGp9DuvYUWABvw/8R6o1lpvIqlsX5Cs2s01w1QIe4/Q55wed3qKA
 0ICmW2kODg1bbFyCou3xWFRnpP+w0uSmY513hqoavxXnRmvGYJS73RCr1q0OvqobiywXxw0gy4e
 S5TU1z8Plz47jvZqhYH0Z+2kgA28WGpXjai9An4y9beirIdkAj6buDLxhlQEtJarYZ1Hefd6X/h
 RAa6GGDtDooxHbBdBhrqvkgA/il+tLExF4t6FoMV0s59xXHhfCK1DLHZ+sD7RWVBhRvcIvne2Xp
 +KrdRtm89Q4xCRbDi2w==
X-Proofpoint-GUID: Hv8r4aG-raKAZmMM2ynVqS45A9vhaRkx
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05dbbd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=QIdouwm7mKRySFGJXRQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: Hv8r4aG-raKAZmMM2ynVqS45A9vhaRkx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_072710_492793_F4FE77DD 
X-CRM114-Status: GOOD (  18.99  )
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

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index d20e44db053256d87ad8034ddab233e49d36072d..7a74f72a8313b73c3e0930a426ebcf7ef6eed99b 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
  */
 
+#define pr_fmt(fmt)	"reboot-mode: " fmt
+
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -10,6 +12,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
 #include <linux/slab.h>
@@ -168,10 +171,11 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
+	struct mode_info *info = NULL;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
+	u32 magic;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
@@ -180,19 +184,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
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
@@ -200,12 +203,12 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
 		list_add_tail(&info->list, &reboot->head);
+		info = NULL;
 	}
 
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
@@ -218,6 +221,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
+	kfree(info);
 	reboot_mode_unregister(reboot);
 	return ret;
 }
@@ -261,12 +265,16 @@ static inline void reboot_mode_unregister_device(struct reboot_mode_driver *rebo
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 	reboot_mode_unregister_device(reboot);
 
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


