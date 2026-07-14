Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1F8C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icPHz4GNOy1/1gIz+yOBY3gb4ZMu3uYYLdHZrFuqdC8=; b=fGTy8CHtuhxj1H8NkNOyK9hApN
	krHHE8SbleMuAw775sJ/1bTM+FB9hM/KMY6lbkNX5dKFvhijAjB1fXRpwAPMUYrMr5ZJyBqtD4hs4
	Lna1lpEfwV0ils9DUpNK45ajrzqHgWnfh+52qeUq9PjIfvOdDxsvpP+GJdASR42d84VC5Qlvhxns+
	KAo084IEjuC5xAzhcicWmn5/v3Wo2/adhqlKN4beBPUAuEpN2fpEOhKRJiExUIP+GxnCOeCwPbuO8
	5jWYoBQLBhg5oKCdIgKr6QNnDrP+jdnGLBjFfX/IZk6TdhdqfbEc77TZ69nq1xPz5BO99pVsN9eHj
	tskY9eJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgki-0000000CjYz-2IiI;
	Tue, 14 Jul 2026 17:17:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgkf-0000000CjYF-46kw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:17:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6nek1097022
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	icPHz4GNOy1/1gIz+yOBY3gb4ZMu3uYYLdHZrFuqdC8=; b=pQRQxA+/1t/wHLtp
	9bH7qrghD7GWtYyd9/rP0xceQn03HfHHxwiReLYufo6O1c6lp/JoD801sHtZ8N8M
	eCDc9vRoIJCAO8bGYEZLUzaNM8PSbpLYzjgZVomAHZeYv5VMH/Xt1b8WwPasbGDk
	yOWEjTUkG+IJ6+DxBPgjkVAbS0ArwGpcZRwy7+90saDzN6TA9yGHDZ1vfiKzFgu9
	jbiLv8Vw7LwANZ797B899Bh07TFr3HOT1lvxflM9YoNeuYx51zMUuYOeGc+Tv/x5
	Bvqsy2ssn87mR2JOQ6cSXHYvPg47uvT/pP8dSeHR1p+5K2Afo7cZHCbEN9GLPvY2
	iEgeeA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnqs3ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 17:17:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848d21bbb55so5808549b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 10:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784049419; x=1784654219; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icPHz4GNOy1/1gIz+yOBY3gb4ZMu3uYYLdHZrFuqdC8=;
        b=D35654+UWW5/baj5s7ylx8M5bJNT0ysBRbx+hvtP+Mh3b2rEpSPdIZ1g3ohqpCzrAL
         lOAy65R6dvMEaZoeJllSMBWo5lGpw2cr3ZSsvuHZc6GPmZnOnltp9zvj0YkKfAvJ/QwN
         MD1GI3Nh1WOfQnWTOU65mVQ2bPZWfKFYkWW+g4HEdxL6Ou/NJM2ABFaf4gygAt/sqgcl
         AlhriIHAtIGb+eDDUPz21CAZ2ftJeEzYUynQwg2SkKLChY9t/6RmO995OpKTz0+ckku6
         ayUID6W3EIScmyN4mSRhaeC2dnfsF2xZSjzl+YfAyuqorntK4ii1u5WIge8c1b6qZSEG
         b8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784049419; x=1784654219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=icPHz4GNOy1/1gIz+yOBY3gb4ZMu3uYYLdHZrFuqdC8=;
        b=HAxXZGivYE0d6gKd5TRhNqXqI77ck4c1CvUaNi3z9pwXx4rumeGZAG8o9LmZPbFUSM
         fozxhLJlVUXRyliiUdgksVuMRy9NuBaQ0lWIWU90drIJlyw4m3cuvlqFgnEbqdme+iA6
         naxYGZ+cUsbxYf2w5pDrodtSjn5gkQFcwVvOEV7lJun/Ft8vjv25wJhPQscAc72KumB+
         8uppRsavnPAG1UHWKYDWnHHFTMwS0ONSdeWcQDSrp+F2Qsm5VNIURLhfdh5vzVsstuq1
         rpbTXCjrDi5gjLaV+gSIG1mYPrlietoXpK91muDWsEtCBaAGV8CqaFyr19q8sH3kyEGW
         3dKA==
X-Forwarded-Encrypted: i=1; AHgh+Rqfu/R4mpE81+jznYQwUXgWi0kDJN7+LPvkW2L0ZM3o7iA1P9YBEoKOgy6uwxmQP+vsz8hrQzfgGooZdr/EtMJQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx25uTg1jpL5yEzOeR9Gn7UxGsuv/NyiErdKCeiY4yYMwpt73A
	tMfVrybx8vxAmPZ6V2Z0NOrOYHLrsLvgvX2LpbO6PUEC5BJAcHHxAlGYeB/8IUnncoVFXHN4Lae
	BJICAWvq4MpzsCWWMEe69Cp4g0M9UGTI0nQWA+ov+rhbTxD6LzwJ5kTqTATqIwnvcAJ7Enux0S7
	oGIQ==
X-Gm-Gg: AfdE7cmJxB3OUuqlAgrOUI4lEIQHtpY+kYxdyk9gzI9gSAvJ15sBj/wzVdnzlLBgowT
	SZJO69WYASdyaEDecpxaZQvjhNNY2yWcAu3gMBnOyYc5CjXA32XHzKg+506gj7FEQ7o5bRto8yY
	CCfEZ/6eAehzBb+yBKLzHPF2cWTUx6+T4bDk/Go4fxXZG7JzMEzomkXFPNtZ8zUmDp3CEjsXfwp
	0l1GSBdBr4YQh710vXErUdjHv+bGr70Tgi1efutM15Tt/CcJHQjx19goeA5tlDigmamzDvRX0iI
	epk6cN+G+KFqyDmqEKBBi26mPNX85iMPisonCLYtsqosve+YAVLbNE/NlMZP+0PFiLz4kpTmNNk
	1WgG9CK+A2rI/UwHSXP8XJN+KmEr3bLhBNHsvpGf6Q1Z8nBw=
X-Received: by 2002:a05:6a00:b8d:b0:84a:2d58:15 with SMTP id d2e1a72fcca58-84a559b1b01mr3518021b3a.57.1784049418885;
        Tue, 14 Jul 2026 10:16:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:b8d:b0:84a:2d58:15 with SMTP id d2e1a72fcca58-84a559b1b01mr3517967b3a.57.1784049418391;
        Tue, 14 Jul 2026 10:16:58 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5bfcc2e5sm731773b3a.56.2026.07.14.10.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 10:16:58 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:46:29 +0530
Subject: [PATCH v23 01/13] power: reset: reboot-mode: Remove devres based
 allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
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
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784049398; l=3945;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=/IxZw+rPFwV39zq+p6TpSHd4rD601RR4H9Jp0jIyzsk=;
 b=FOkQfPXWoK1qKl0kI0Ie+LmI64jVoDcFZgWGS8EMP1eqQh+aDqSNIUpOAP/s/w438Ry6H1wC6
 tPpdm8vhetwDWabHr8DUbmoiap1etgE61m9idry1GmUboP18+EMoF3E
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX//jGAj/s+Sj/
 IxA++917LbuTE5nGZ/MaPA4XmqfDT9nA9lyvFWbmJzLPvYPWvCEQ/MdWODuscIdEBQLrW71dXMj
 MLy3Flu7gOqSEH2s3P1cVTvE8mpCjuOMUXBmICAp/Ts8lrTY1EwbfuFVtDHCsEZWLyNihj7VJNW
 OBLnKJ1GCbAe7pkVKZE0dsJERhjn1An9d167/wRvv4tBNjD5NZnUW+UUplc+QNHoT/RaeIWry61
 sq+7Vg8pPiow9zWegTkR4oQeIJm04kFqkfOLStIQSSqNhXtywD7JLo1yI2J7wTSKuw7VhBGH3Sa
 YutguLuNdlCWAqIYUSLtvXLdmNyiAKOAEPdYtGElynN/Gagd0hO6DqqC7DWqEryKz7aaBYphXH+
 ginCSxKS2X7fgxLY8lvBTP8w0ZaJLd4o9f7ldw5xE5OBkzlPipnkDue4TFbQq0tbO4KoCpgu+tU
 MF2+0wXTIGBk1KVicgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OCBTYWx0ZWRfX5sDUxi0oUQEI
 dHFqqw22fMj5E/ZLabbZ2AYlgKNsAM8KbUYRth9dhJtlub1hVjkqsJZQ3OqvCSiwPpUWUocv6fU
 gbGLQ4LWHehZWUlcR6+j2nzUR3NZUVU=
X-Authority-Analysis: v=2.4 cv=U+Oiy+ru c=1 sm=1 tr=0 ts=6a566f0c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=QIdouwm7mKRySFGJXRQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: lBzXs5pNuMrGvgT74MSMzfwK1IF1V8hx
X-Proofpoint-ORIG-GUID: lBzXs5pNuMrGvgT74MSMzfwK1IF1V8hx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_101702_148766_9303D792 
X-CRM114-Status: GOOD (  20.05  )
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
index d20e44db0532..7a74f72a8313 100644
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


