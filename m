Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3582CE9271B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 17:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ncyvah5e5r6XDWMSFFSo1CfTUNq2hV3TRvAvXWzPgXY=; b=tt+yUvK6i7wYE39gdnEUzI5DWR
	07e4+LxOLEYwNfRj8ZVIlwyCaEtU0ow6DrILV2b3rtvEuyjM4n3woWJUsHtVbMy/nL8Vbbyo7dECX
	5ogd0dhJuGDLkHt5VF75OBy+SnqfmcxF34yFP4+oWeqDpK2bmys44Z3nHDyPz8P8wV1b0uA6cq6qy
	qM8p02tUXMTI+lbhXpLUi2QA99NG3a2FbW+18z4cAENgjlV+WHGiuSjVQdToTQ+mohb4Krtzicc6E
	tO1NlvaDPIb8++gPyr/NJ/RwLALvPmsVNCYWh4ImdUPYCzyeqydOztM1E9I4Wtbd3aPvrCQWo5NKf
	6dgnuNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuRh-00000002uBu-3sez;
	Sun, 28 Dec 2025 17:20:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuRf-00000002uAq-0fHL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 17:20:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS3TlSj1464434
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ncyvah5e5r6XDWMSFFSo1CfTUNq2hV3TRvAvXWzPgXY=; b=CsAEIi+H4I3xtisP
	SoQ/SvYTumEBaxTPnC1xk/lGc/cyHA5yP+3+stHCh5YICgohzQNOXA9F8TCxOc4N
	c/SFAuYmsfe4GBrQsN/xYpNLiktvDnUH1KzCinrosKElrqUTFzYNv+JiSpIs5LOC
	4jAejny4jY44qNyPsjEy9N3LKPcX6gNnGMKN30RO0OQq+fAFxCeT/GlFiHnC2I6u
	JIzjjcyUHJY+Po8tEe0jeOpmmSZCvmuu1z0uAngx2XjErYkAK4Qo9WRhfj/NOePB
	Uq2rUnnKj6I+5un11dfCYfuF+ypfMpLFT7DQr28f6hfSiLUXsYp6x84IEcQXwCrb
	FBStqw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7p1tgxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:20:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a377e15716so43100375ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 09:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942442; x=1767547242; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ncyvah5e5r6XDWMSFFSo1CfTUNq2hV3TRvAvXWzPgXY=;
        b=KAEwV8uAHMQcud8AscQUfeBhVN4h0BPGy40JVtWemh1b5BgLjI3V0Qf+SZ7o9LKRHu
         uRNclTjPzx4bo7h2zCiarX2KBT2jARSWPOqgNpTNQwM4oMYOHEtX9h3/5msW9CzvN+KD
         rfmpQDwly3GfAlvzA7sR2aT+KxGp5grPPmzBNkAGpeuQ6TFxeL5X/7RpBGlW/9pIk9tL
         x5hlSL7x1BgfqoRQS2IooQkKm0RriQetUUWtBySzc1Az/ra0A0maDdjA3N9cLrcLvIj4
         OWaAnm8jNSG5tXVGMuNbLgv7Q5Xf9LZvKcC1Uzv0QoTeQa2LD/mpdWgOeqQtLSeAw+vy
         YNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942442; x=1767547242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ncyvah5e5r6XDWMSFFSo1CfTUNq2hV3TRvAvXWzPgXY=;
        b=g6WYO05hGgRmdIf/of4fn35NgGAOhOgpeXnucmL1SMw77cN6TIdbXyn4IKaDGnbHnl
         65KTC2VCmZoFrMGQqw3UIhmK9QyS0lG9/j/n59c0Y6XArUwOCQugzoT5/1VjLZdaHCYX
         6yOUPx+xXN4tFpNsiDx8SoKzNmG6RYFgKnBnwExAFGoA+LMHcZrw4gVpa3JIbDJZD8q5
         j9NPCYzAN2BeIWV6ujBG6dFmh5WeAIgwPIc62kS3XNerP4OoqRqzDbRZd+k0yzRdF9A9
         PmXPJpVe+z3oAkYaA9sQlEpIpjg+6O1IZNysRXdblNIgha6EBDricZgVDyQZjO+49DiP
         K4/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW94gazYH8uVtUfarEDtQA2/BY/5ZGaw3aA8F7xNL5vrKFxHoGuc5UnXppumMiHVPHpLR/WeGPf1AgK1t081+hl@lists.infradead.org
X-Gm-Message-State: AOJu0YzuS37J6mN53Pc1hTLnlLrK6SnKQ24eFgddaD8GAEYq/MiroIhd
	/MIj4OQwehanOimtqHnNjx+zlsZ5mW85Z9o9TKzgyH4C97BqVKYT7ZHMac2MQcehCKVUWRHvM25
	pxHiPEYGKABRMq0lo4a3CmTezPt48vBwJtEZMXjn/4KTlkSqPOsVdBNUDkqNgIO+crpL0dExfNh
	x8Zg==
X-Gm-Gg: AY/fxX5AEFu0Frob8LLS1P5uBFfL/5VzjTeiws+q1CFRT3zN59ZrT0pg4tvNxC//xFv
	JL5jQ/ZZF53PeHX41gYaHwq6NNYyaZDW3Umm6eJ35znI4mLGt4Rcgd95fIBKUEft9LBRY+CE2Ns
	sh6DcwGbxYnISb+AljXUxeYamyokvqY3REYk/KN9LN9dBOLI8jWSBt+pgNOuHEFcO+qLWFxRCVY
	PHsUwm5Zq34cxamEF+uH/hlJhD7nW6TjXsgvMZB75sNpGGx7GnLrdRX/yAgyt96rhRcpOHkHhil
	NFPQKzpz89zXfmwkY4RLm/G1tZovOMkbdd2TQwsiWnMRT4hjD1ueFD/HkTI/1NEdciidhuBppHp
	2Vw2ihvrEWCSgfyYO9KHB1eAMQjBaBuqOftKcmvwVnljh2w==
X-Received: by 2002:a17:902:ebc8:b0:2a3:48ff:32df with SMTP id d9443c01a7336-2a348ff336fmr203369055ad.57.1766942441871;
        Sun, 28 Dec 2025 09:20:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHN95+Mh2TIq2sK2yELjxg5pJShOwNEfi8iqz115YSh9XEjuzYEa3oHJxrcZLIHspPckdDAJQ==
X-Received: by 2002:a17:902:ebc8:b0:2a3:48ff:32df with SMTP id d9443c01a7336-2a348ff336fmr203368615ad.57.1766942441364;
        Sun, 28 Dec 2025 09:20:41 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:20:41 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:19 +0530
Subject: [PATCH v19 01/10] power: reset: reboot-mode: Remove devres based
 allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-1-ebb956053098@oss.qualcomm.com>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=3746;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=rk/o3/dn1oyoyEh9/h7QN6VQvqM1qIx8S8Xwn8+Lv1A=;
 b=WE4KkMlDQE7y1M5MuyPJ1J7DZ5mg6wAYvAt8IvFE22WMA3CeJgkTNkCcQPVJBpH5LcUfAa3Tt
 df8S2bPCksBC7ZHZmNVMKfghCx06BAEc/44PoXkkmPTb4hFQJGCixP2
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: sj_xejqowm41F5JxmQFXhQfq5NJAnJlz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfX6+N9u2wUejDv
 HFVZ5t8L4JBDOXpMwVtjI1NBBdBBQTdCoT5ll3mOZ/IAp63g51A8eziu0J4IqUkceekyXDGpk6A
 htEJIUc0iszqnKf+dP3YcO99+/OPItpn1spGO3vk5ZYMC/WfC315Sh4KT3KakQXWddy8i7xQqrJ
 cqj4rd0W3YIazcXyVV5jGeUsGZDqXaTtuYfKYXqRd3o/AzPXzFREK96/bkFX96F4SKHHxd8WYRN
 BcDN8SXzz/jWs+nF1Qse16uqj8tiRnxJnT+EojKuCNzM4I5x5br6n6hKiXoH8MVOEXR7vBQollu
 KCd6wuuJkxvUEKyk6zSTmfnOeKjcQ+Vrq4MPcWaFIxX/YjFo+Zc3KlkAfo8tEbuFf/yWc3dRibY
 OWtzYAag5RhwcwzdYIkSOEtkG7ma4p2gVs2y6+FKIjCQV+9XIGwwhZsb12ukKsa4M/SVFeqBUEp
 O7TvDM4Begt678VqrqQ==
X-Proofpoint-GUID: sj_xejqowm41F5JxmQFXhQfq5NJAnJlz
X-Authority-Analysis: v=2.4 cv=PKMCOPqC c=1 sm=1 tr=0 ts=695166ea cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QIdouwm7mKRySFGJXRQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_092043_212331_6E5BA808 
X-CRM114-Status: GOOD (  17.36  )
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
 drivers/power/reset/reboot-mode.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..3af6bc16a76daee686e8110b74e71b0e62b13ef8 100644
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
@@ -10,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
+#include <linux/slab.h>
 
 #define PREFIX "mode-"
 
@@ -71,9 +74,11 @@ static int reboot_mode_notify(struct notifier_block *this,
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
@@ -82,19 +87,17 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
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
@@ -102,8 +105,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
@@ -116,8 +118,12 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
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
@@ -130,11 +136,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
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


