Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94562FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 17:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=; b=xV/iwJWkYr+/WV8wQM/0NRWNBP
	J7CuPCxP/u1DGSzzxk5Ma8RfgllAJjkDqcLw8M7uYsuCu9wJcG386XvIyNiUg0CsCaVad1B3p5/tB
	ijqAYYt++o9u7a4QCJpw2MUgDJ+XK2++vwOpvcVrC1sE27U7dbpIuOjt0JT3r9bvU48mdx6BfqLa+
	Gt78FjUOzYHtygDAIO5Ck9em+ieaPbIU3+OhjWXxajSFlwxPGRY5ovA5CMn3dFrsRCsKX81ndQKvb
	JS9obfl8tsubASo5TqgsJbmt4DhQBbm/TMvTYifUQwI4y4FHvbDOV2SMOF1DKxBjexVgOfA1RsuYk
	d0dwRZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPrk-0000000HTVP-1IuW;
	Mon, 27 Apr 2026 17:35:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPrh-0000000HTUg-1xfN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 17:35:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCYZuT429204
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=; b=lRZIIfxyLmSdHEI1
	2wK9QYlFisa7A3/TZfGTApXbHOkOhRixgMzzkZh0Xm2+PiAepXQeodVY/tFdNGyv
	7ll2LzC/ts5bywDNMKoUoYUWqjZYM2sBaXVxodQORlohMBntTinYX3OGr7W6thoW
	fd2Tag0MhgAJmHZa+R3MlEdBZHHpQ4yyDoPXzImzCeplEfE9JT94AQuoaGg40jji
	3lMrkzm8BdsNhzyymzjBZCTQKE0u9pDjG5ZrwUU/8B3UDUczpEDxkmFqbRiLElEt
	Qs701sG670k2PFWgODLGAbzf/6coazRSyiBv4s3Q4aSs0lxiguBLaT3xyWvhQz2M
	Es8/cQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x3153c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 17:35:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so95788015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777311323; x=1777916123; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=;
        b=XgQqm8Vda83IXJ0iSXVwZxUakilBTRnSnxvgMEewpbCE1Ve6QVSTkwjykIrMDycQkY
         3US1LNDxhISO8N5Pd9uauf0o1rme1xsimIPeZJD2p5Gi7822iyQNVYQxjQtwFALHrI1U
         pvUU7eqfiyhMb96ONUjCKdzpil9gKGrL61J/nkXAS49bah3KJFmQeP7/U9ZIZuY/MWE0
         oHD/w+bC9KvWzQabWjynXSFcR64bKaQBVGoJLNjkVrX1ken8Jx5MuqSgxNywDMOKbB8m
         qGZblk7tgQ8R9l/K047hSiSKbMEtcI5RmNjSsGsl5IP4oiUEBx3cpZ2PPagtRc0oyLe8
         Jscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311323; x=1777916123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yLDNWZoJ4xbnRu6GNfsuL+e+3Ruoq1OnR+K2jzbSWN8=;
        b=oR3tuVor8R34d7YNXsUTS2Sjmx6+reTMYB2mz19mPfX/pZKYFaDXNee9RQVA6EBMnZ
         mXpiUzshXOvnpXQopr7qnv1OpsNeO4f4AK8NO9p0/brTp2nRPV7faZLcr1J53xzz37Y+
         hpPmaaSCvChyqQwty+/xVCFgsQnOKpwbfJrnU4y9pcsWllxeQ0hONhjKKEdy4cx3hMrU
         XheCbupaE6+KqlR7L/7zHasUzAAngwo3dMem8V/L7vFtTduEdSL560kL86ovmRG6JOOP
         Bqte+uVwR0hSTDBC7DjTN5IPZLxJixzbGxQ39WEg3ifXHcjnOpDHDQc05l+IhZ0S3V21
         HqtA==
X-Forwarded-Encrypted: i=1; AFNElJ+DWnF18XTpV7bUYFyRbx/HEkTvvzAQ3wmxGvMHaowv0prYvGqWHHGwjxl13H8RoBfY6PhFJO3KJBAfGQUvqtwd@lists.infradead.org
X-Gm-Message-State: AOJu0YxPMFRACESQ/+6+4AAfDbwvalviKKJHLD4MOu/Lm5Ww70chiBGQ
	86K+y46u3cWbLa4jVKaGFFlMKsXRnzLeYmlowOsNm+Hs2ayhryF+CMR5MO226oGwrJHuDUwGrxP
	3ZrQVpo6KVQytc1MrjU3XVkQXg7NCHTN8nvkUdRCCOJI7J3CsnnCey8/mKaYYEDrinFVhoGYSJ4
	xXIQ==
X-Gm-Gg: AeBDiesfRx30Uu0RAfT+/dA3FNQJy3eK5gGNhZoCXOy5yUdONOlQkiefCJCcoAWzgig
	SFFJplf4TlPsKionomxqa1q7MC0wcvNb0omM9SaTnWzQUzM6kc8+FLe3PX/fRHlbc77evBd5Ivl
	x/HHn3eMuABqmK7BA7JF/1DjQe3ir3zq8+sUEfKTstPhlk/kXoKuMXG4b9bFndAXv+D2W0twvCq
	2kbMNq8UtwjLYe8in0iLdbXL8JO7orhjE+H9cD50dSB2Cv7+rPq0J97f5wFwbAgjzhyPmeeB5st
	sVwhKpwHQuZTW2PSaNZXiD/MQyXvCu22bmxZSkF904pEot1lM6RBV3bSiTq1rUgZ9wXcR748IIb
	mkZKVqIPZKmiKxyrk8ZM8gDJtkvN03KBBG6hwVCMitz+z05S5lF3ptrHtC8qH4yVnYc67
X-Received: by 2002:a17:902:ab8b:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b97a97167bmr1110075ad.41.1777311323440;
        Mon, 27 Apr 2026 10:35:23 -0700 (PDT)
X-Received: by 2002:a17:902:ab8b:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b97a97167bmr1109465ad.41.1777311322756;
        Mon, 27 Apr 2026 10:35:22 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8369sm329115ad.75.2026.04.27.10.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:35:22 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:04:41 +0530
Subject: [PATCH v21 01/13] power: reset: reboot-mode: Remove devres based
 allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-arm-psci-system_reset2-vendor-reboots-v21-1-dcf937775e73@oss.qualcomm.com>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311301; l=4001;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3TYOHMcToCIVpsVU2Bo6DmB6sqgmdebWzZn/F1m0e+g=;
 b=32A+1VzoGWg9FSbHynSX81qbLupW/hUgrYzIQsaZuSIHuB+n0hQE8ta4k5laVXIaKpofnQnvs
 +fICXcpyJbnAy+fAxeBYskqTifNlGwo64pkQbTOArzTafR9aiuPkzPz
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4NSBTYWx0ZWRfX8FybzqkRIQdZ
 rLUsbzEsu2pFt7KoB4BBfFwaYtJoTv7t5Wb+dXZGD0RTpLtyDbvEFvVeWMUiC7+/05ZLoLLxysK
 AbHNzrJEevLQxEtrb89Q2Xdm5QRlxCyM6l6UVbEUWHHt9SptvwA1RmoKJzqLQFj6QGPfLjDeoB9
 DEpaswTsEXxJcGQ4OeP8Qe+jht7DCfnMXTKkze1TURMzsyuXYdTUHYDLcGgOJ0pvG16u5VYqeC0
 SGLAOYHKWu6e1jTs+buTfJazGALqIG8YIDSRwqPqiKcIDU4opuJtMpxv3ER1cr28xvO6/5eXSbj
 299SMXWt5mOj3ftGvBjtZNUeVUkkGuTarreWv3v+q+bvP4rVlNkVvjJMZS3Tk60z+rIKRihTJjX
 BtdYV6uCvZzDkIHoI6pemc3gEcGE6gWH4KFDW7frf/tC6drp3h7ecQnRrOCa920KyxwZd5UUtkn
 mpEw1LAIgh4hls9mpDA==
X-Proofpoint-ORIG-GUID: UFtvlnKMqixMADFYAc_yQFFgOiIqbCI4
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69ef9e5c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=QIdouwm7mKRySFGJXRQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: UFtvlnKMqixMADFYAc_yQFFgOiIqbCI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_103525_642110_F386F4DA 
X-CRM114-Status: GOOD (  18.64  )
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


