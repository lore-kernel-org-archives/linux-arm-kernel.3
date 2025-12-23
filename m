Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF4FE6FE26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuJzfruUe3GRTHem0CZT3bmLDfnPw1fzYeLWKqeqq9k=; b=xKBAKbVj5VrBGVWh3fQ8/O7My6
	D3odbpUHzDU1rry7Igh8ZtQ1OgkHd8TnnDS+gJSju9roTJGV10zzBx4Yl1A6LcHtjGdlzVQdTuXPe
	wU8TSZ1BdYJr0UZnOioo/ObMeJzy7nAwz3ZAZDwZiI8RAHsPoINEEiaWFKCSMayosBxwgR2Z2X1fq
	NgDoroZe9qDPvOFcfpcDICN7eCbiRlAMfZSy9W+pD3EZOnbgGrNNZUzWpRlzHQydRatsaLGWu8PKl
	vy9qok5GII9cJNy5PCDu3vF13X1dOuQYFxBS1t1416cT89SPBa5igNoUWe022PyIm52QHlcCbhaJF
	HVQiFxOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5rk-0000000FnHf-0WnI;
	Tue, 23 Dec 2025 17:08:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5rh-0000000FnGS-3DFR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 17:08:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFcEV14044261
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BuJzfruUe3GRTHem0CZT3bmLDfnPw1fzYeLWKqeqq9k=; b=Z4HDq0tTHyRZcQul
	eGnegLNHouBadD0uwEWvImFKSYkryEFUBZgjlEVV9OyK/pInNCS+ow55edHoxHhy
	8T4cpVGebhej3OwEI5tRUsNOgER2wDwWy3fENnvld7UPLf5dlUh4UF6xWMbadoPd
	1dLpHy9hAG7QvZfAIYpjlE2tcCUihUL3HYaVR/EOvBTo3qfh9JFp2ujHhz2JA8o7
	aks06gGT/DVPLat20Cdg3k1gJ7yjhb869O0BZUXPzAkTXFybRuDFGuBs94TzNViL
	EavKkml7cO7lyea9YwSi8DKX5ZnsxsnQDvNEmavTiT84LaQCCsiBUNY7nYI9Dd1f
	kVfcMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhbe8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a08cbeb87eso81378475ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509685; x=1767114485; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuJzfruUe3GRTHem0CZT3bmLDfnPw1fzYeLWKqeqq9k=;
        b=h7B1hmkecAGhL9o4Z4oFOeIpuLS3zKFHFn8hYKxEQZCMZXZlj6sUxHhjOlyFm2tp/J
         N2KXNXPAAteL/p2iliGHi4D/WBuqI4KuiuWBFNGE+wWOf8vlO3JjDzR5n3jj46cQrZ+1
         bAQaDxau6iHZzf8byjU+v0YI1SVXdE6Myr7p2qx1trZc7EJj8hwhk+x9CHSpMtqPgm/n
         tIeHLal1vq2rRa0sG1lTRxuuKavj66h2YALOQw791gnKJDzvT/WeRz5OWPVIMeSyiFxd
         nDnMxn0kor1u5pXUa3gz/Fw40jQCIkXiEN9+9vzEDWyYbxJTjm1xs7oWru11T+0eHbAN
         CZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509685; x=1767114485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BuJzfruUe3GRTHem0CZT3bmLDfnPw1fzYeLWKqeqq9k=;
        b=ODJjTUBb2k+lkWS8ECPzyM22FLHdTShBENTqCXSAJq07jcBHPh27AF9Fvwhz5uHyQ2
         Q0VUt2sAnX8RhlAIzrSfG/j1woPksj/FMkQuQ6VC9KM4vJFFDKGZzVbTyFGFinonZ7aA
         EZD8w8xDChsBO21sf3hLv7I/9FbRn2NsiXxb6yffM99MCEu/qM3cMaCAaeYacMkg52uV
         sOXb4q94JPmxG77Tg5KWyOp7ZLk5iPX+XqB4mJbhesrz3jm5LeYv7LZE8uqH4uh+R4yg
         NVfTD7kClOLEzKo605LDC5WTsK7sVZf+rmVFlDDhnjZwRA/wop7Hve00blbjx8EUsusV
         RIvA==
X-Forwarded-Encrypted: i=1; AJvYcCU3lcj0RNneToFEF53kQ5OIG7RKXuC4WgTp05VTNlcsLuYJrMlt40m315LNYjMBNhr1bqAmIn3Q965NaW6Spamv@lists.infradead.org
X-Gm-Message-State: AOJu0YwxNKyz8cZpADWpvGNPsfDaD4AFCxZDk/H0L/d8oblbvp1MZVCN
	RWfMo4zMrNHWYtZb/z3G8lLFmxAvHmO///CibR1T3rtNRpb8lTDYb5eg/fccdf7qDg/rsf4gFpn
	bPp7qT+l1mTsTzHNFOY39sKm1+OhjeIBqOaLJ2V17t/WZR2W/MEO4RfstuXUZ2ZZlLZ2avwqeFt
	86wg==
X-Gm-Gg: AY/fxX41k50ebwAHOiB35mQ6/w3a9i59TS44R6xZ7Pq51VRIPSA2Q2HAFXARIJ0KiSf
	iRdaCGHk1gcU/xukpP2j9yHCeEIapuV7S3yb7x0jMjl5Uw2x8PNgA4/qWctkXFsgsgdrbiAIR5t
	ZrO8DGoTXO0R0xOdQ7dbjXOQ6PxK+DNLY1HxErecO7Wa+J3TA8Uz+chQS7olhIGzNNdosBvppNW
	II77SkD9ddYSGYt01aI/OL/NWEioILIbjKlzrbiM4nbEe6W3Kva0AwiA+/c7Gk6RBrI/p+9EhLz
	ZJ4bk0kwNSa4Od97MBmcM9U5UpTHjElPPGivdRIDmm94W28EyCgE+hYI+Fm8EhhiPYsYDkmHjYC
	SDuYPVTieFbSvr1KbBoGsYKL53xsXLx3V9lB46jnW9H3c/A==
X-Received: by 2002:a17:902:be0a:b0:2a0:e5da:febf with SMTP id d9443c01a7336-2a2f283de4bmr95817275ad.46.1766509684536;
        Tue, 23 Dec 2025 09:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGU2BHLXju0TwubxmcjP35lXQk0iO7RIkXm4wYR+cd3MUQx04iH8XUNtFvswH3MksQD9yYDlw==
X-Received: by 2002:a17:902:be0a:b0:2a0:e5da:febf with SMTP id d9443c01a7336-2a2f283de4bmr95816865ad.46.1766509684008;
        Tue, 23 Dec 2025 09:08:04 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:03 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:32 +0530
Subject: [PATCH v18 01/10] power: reset: reboot-mode: Remove devres based
 allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-1-32fa9e76efc3@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=3584;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=PN8XgGtqW6YgfHr48yEyP7m5MdenrdUHWGoWarnZY1Y=;
 b=0m1D2Z2VqYUtb58Jr5qq5+QFqF7zQVLl0MIKYRgyGEScmJsdxNQ7obTCiuD9ICuyXEpMer/7r
 8fzGy1I+5KXAlnJ3EIWW93HGxOjOOaMi3ojDNjX2ng3aE4DguLHklRM
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: zU4f_4FpSI5I3cWDOCPK3tAu8jKLTrpF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX7DfsuopxgZLs
 Rx3GpTMKZkNcoD94w/I+vXbvxKdPjYR6uwOq7C/lQia+WAYKqJ7GQ6pRWUqnzMEveNlA6qiOLBf
 jtsveTf/UTqmFOuFKLyrqWMQuCMYXY9W29R5AmOxWJ71dE7/QQyJQngfo/vqIpIpOki7dyxX2wk
 H4eQw8YD/OLokMalbTQjQWarh988osXsakmlU1ScwIgvaehUVO6NC0e0NTuNCEqD3xzIXVvNOyj
 jE2CsRBKttty12eZkKXMvyYunAo+QU2R4BKsM33X2zpT9SZq3e98Av/N3+A3ab3FV8Cx8e9Y1uW
 LPxJ4UP09sHZ6P6k6NKEuOLJeAsh9Wxn98iYil1hBAFZY2ZYFHNHhiJYb/XHd0+QhUnlLXot7xl
 oUYW7gKCnukaWRySDxleE3jL7CqlP/6MUWzJ1SjTjs/fy/dIndwjXoNgkLyYllNNqVc1+BoUJ0Y
 /oB3uqqZZp2ZS9EIOog==
X-Proofpoint-GUID: zU4f_4FpSI5I3cWDOCPK3tAu8jKLTrpF
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694acc75 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QIdouwm7mKRySFGJXRQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_090805_816214_DE12A7AA 
X-CRM114-Status: GOOD (  17.12  )
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
 drivers/power/reset/reboot-mode.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..4b6ae4007c4f6fb7d51520b4be2bf3cb1dff518e 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
  */
 
+#define pr_fmt(fmt)	"reboot-mode: " fmt
+
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -71,9 +73,11 @@ static int reboot_mode_notify(struct notifier_block *this,
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
+	u32 magic;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
@@ -82,19 +86,17 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		if (of_property_read_u32(np, prop->name, &magic)) {
+			pr_err("reboot mode %s without magic number\n", prop->name);
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
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
@@ -102,8 +104,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
@@ -116,8 +117,12 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	list_for_each_entry(info, &reboot->head, list)
+	kfree(info);
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	return ret;
 }
@@ -130,11 +135,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
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


