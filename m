Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE87C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiZpTfe8Zu+K6BMsKWciZIsGv+skYHmcAh4GOfMFdWc=; b=WuYroVKGMCsRpIizIhN2hapqXo
	D9t/xhv4V0TK5py1rNz0iau0EB7ChX+SH6FT+WK/uEj2xCqXa6NylvKVNZRMZd2jus9ZafUZHK725
	hKpA8sf5+wHRvNXavug630pqsb4JhoxJ/B/LE82lrLWOTVsJqU/gsg1eFJL8e8yBbAkMNYupx4w0D
	DLN5/q1Slyx7vIuQjw4W/gMHlfBqJmD2zeOAfEsj9ehI3UthTmUBAlzhPm3GEHXg7K20mUHnNxiEa
	h7aUrZoUdrRtZxmquPkJUxLdwqMVhmA71Ol7tnvuqtLtrt6Nq+fw0P9A1Z7eootCSyIzUbGcnNQ5X
	jClke1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPvS-0000000AQ2V-2Cf0;
	Thu, 17 Jul 2025 14:49:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucO1k-0000000A9rV-0RC9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:47:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H5OfTF028094
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SiZpTfe8Zu+K6BMsKWciZIsGv+skYHmcAh4GOfMFdWc=; b=Li7ofBKinmY2cAVn
	79Bvy9YiXw96IOTZPfIrhChJkdb0NLe3/fgj73gL9n1PiAE8rgDez6onjPRem/Ir
	fG1CzI65mA7fXo+D53pLUsOvYxSvtm9OkB11r/zbyMyjZ3a/iO8bvCR1AiyjodqV
	0yvnY5m649TXi+94CiD9qs9aDlSoiVvxOVFMc6bDmaDdakcymcR8DEwX+2C0caqZ
	Y6ivNYOqD1aNrNDVBtHHYQE1ToqRe9SG7uV0dCHTD6ym4ZC4+DmoqQZ4gmFeuE4r
	pdId6oTHOopS2eF8yNFCUhA1JHUpu0CJWUbiNotTE0V8Vvnm5CEAUQffJbfLjSrS
	XV6I/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5ywe1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:47:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3139c0001b5so928996a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 05:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756472; x=1753361272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiZpTfe8Zu+K6BMsKWciZIsGv+skYHmcAh4GOfMFdWc=;
        b=n6ZeOHaasT6hE9Ilgq6fGIcih3dut2b4NKp6db9DiqjAz3fQHnRoh8Jh0RjkL/JAig
         hbnmEnkPuQNPMbxz78iv7PS5bjmNctp5YXOux07feAD7FjDXDDcE1LKh03T+Bo8e9Hni
         lbtf05U2QrzxXeR9DefQAvyvmP1mGd28h1y+cBE69/9CcVn9NVMXrl5MilmCtr1jIkPK
         OAzC2pwPRoNyE378GKymkhbV+cZdAfbo11lCoAmb8anZFd2CMMuyYn/2gE3jBla4/yl+
         uhkEpibtWbuNqEscw78KbbkMItKgCfix6VCcGGl7RuCK5YPA5S3PwYxQiYveyO5Us5Oa
         oirw==
X-Forwarded-Encrypted: i=1; AJvYcCWkBaSbYSRE3YC0xhTe+3Bd345ps9xptSswMS+1zCy59XuK4OR3XzvFrCOUtIq9ZQ5TTrCt2dkqqb3xJlK4y/Db@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn8Irv1BdOX1n9BdDoyzAtYnVzJRgJwQZJ+zoiUQ0zLuzd6Swq
	Nd7Z2MB5sN2ovoaCsALIAwkc/ly3R9PYJh1/gaydWlXNEp27YLhQamvUx2BIgUdYaP0bGDQtj4G
	MnRjDkGSxwtYh9DcxEdrarxv5Gzjq/fh8436jIr6wlPhiZBrdF5i8AId/hAn0RjJyNPqtUk4YOu
	3R4w==
X-Gm-Gg: ASbGncueH9k7eet4iII/KN3cchT7N7nqyJMYcsiMU8LbmcT9saUSTg4i/deVvyyZ1Fe
	P56e2K8kKOD0eauEOuqkHo6qGm14kw6VoGTF4fNw8BcVPSXd+j6lnupJepz1rp1FaUthoc0eJUr
	wwEuP4ZZi2TgKXRGyP/GYtSntfkIkdAZPJ39ewSt7T3J6uN5HOfSRqfpJBeN0Z6PazI9kbMb9+A
	kr+DSQsXgu4lu1d7dyar3nkgKOvms2QEK82MZhtrd4PIZbIM25uOZymi4eTpe9Oc1+iaZURVARV
	2DU+Nzr+quUaIsPWDBXYOO5/rxvhw5MVT7pppYdfiN4wpBijNrFAuBqNPcmELrFp09Y8tJWeSJj
	S
X-Received: by 2002:a17:90b:50ce:b0:312:f2ee:a895 with SMTP id 98e67ed59e1d1-31c9f45b0abmr8446889a91.31.1752756472118;
        Thu, 17 Jul 2025 05:47:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeDXvff2phI+gdj5k/aZjVFSg5HoF5SSERKmlmox6bjKji8pYexr3zYbXI3CwHG6Qv0EEU5w==
X-Received: by 2002:a17:90b:50ce:b0:312:f2ee:a895 with SMTP id 98e67ed59e1d1-31c9f45b0abmr8446852a91.31.1752756471656;
        Thu, 17 Jul 2025 05:47:51 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf828a0esm1505283a91.42.2025.07.17.05.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:47:51 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:16:47 +0530
Subject: [PATCH v11 1/8] power: reset: reboot-mode: Add device tree
 node-based registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-arm-psci-system_reset2-vendor-reboots-v11-1-df3e2b2183c3@oss.qualcomm.com>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
In-Reply-To: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752756455; l=4290;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Ac0WjvV+M2yFP9Da/mh/o8GHODNrcW5YrR+v85Mz4Aw=;
 b=jQZGEPbbqcRPTYTNCkzogKxfIiutINDN+O/ZIaySmkSbWhNHqd/Y/564EWs4jG5AxSxgCntTq
 A4sgUiptrehBNUzt39OkoGp3QkKGGtncvx1v5my+muPAQH1Lc2Z+7j4
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6878f0fa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=IcmTHOqSNbDvJ54L4SUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: HxtQzIJTk8AvmzVkRXW3hUJPY9s9MfWh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMiBTYWx0ZWRfX9wlkcKhm5daj
 ZKfEyIwIKlVUBsLu7FmAppMQOJTq4ghc0hXDrVqWHaADt02/0sCoz7Gw/VlP1dMPsJLdMSjmPPF
 qB+Z66deTA2OeeSJiF+2lT1blzfw4/HZkMnG4eJtXCN2U5WbNLGT2zUfzSIm9xfQYfVWYxyqESq
 kCjSp3xtC562fKB+j+Ul8gQ4pry2QGKkB1xfY0V2QkWYbMnNWQ1TmiyHyWXumk6Jf3wQSz+L4R1
 QKUDlVDEgW903wcyYyMMNqrqqSzzEj1tS+qJI6UG8ptHl544PjP1fCvAphG8wzAoFYQocXqE4rJ
 0yk8HlV6Og6tkNsCwsTFodh7mRnQIdsNu57dJthmSUwHiheqaaEGjLQIMhguRAJrd++vFNLUzAP
 62EBEhCMYSBmQmBDy3YrkHPYjefIJX4/iLuHfq+qSi339Z9UHudDvWTDNcHejLWyltTICLjk
X-Proofpoint-ORIG-GUID: HxtQzIJTk8AvmzVkRXW3hUJPY9s9MfWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_054756_155436_A0906AA4 
X-CRM114-Status: GOOD (  21.83  )
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
 drivers/power/reset/reboot-mode.c | 29 +++++++++++++++++++----------
 include/linux/reboot-mode.h       |  2 +-
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..0269ec55106472cf2f2b12bd65704dd0114bf4a3 100644
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
 
@@ -65,33 +69,35 @@ static int reboot_mode_notify(struct notifier_block *this,
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
 	struct property *prop;
-	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
 	int ret;
 
+	if (!np)
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&reboot->head);
 
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
 
@@ -102,8 +108,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
@@ -130,11 +135,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
 		kfree_const(info->mode);
+		list_del(&info->list);
+		kfree(info);
+	}
 
 	return 0;
 }
@@ -162,7 +171,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
-	rc = reboot_mode_register(reboot);
+	rc = reboot_mode_register(reboot, reboot->dev->of_node);
 	if (rc) {
 		devres_free(dr);
 		return rc;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..36f071f4b82e1fc255d8dd679a18e537655c3179 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -9,7 +9,7 @@ struct reboot_mode_driver {
 	struct notifier_block reboot_notifier;
 };
 
-int reboot_mode_register(struct reboot_mode_driver *reboot);
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);

-- 
2.34.1


