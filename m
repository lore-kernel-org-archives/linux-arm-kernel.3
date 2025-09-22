Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF225CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wck1RFL3Etc5iANJFBisnl6A9QEEqYSWtMuEcnVHG7E=; b=D+t5T1ZintjT06ZisoMOXlMHdX
	TL2K92BsVrjwvqoHmZQbzIUwDsoJwDZqBF1HZ0kz9Zji7gM1mQX+XMkJvEBNzmpIWDS56gFIk8jVR
	WDXlFa1l1Ish4HRv7cFflhgKg0WeLL8GLx9AIM5+ninEjpQuln4l6pAcUI1KL0pqNd1Zm4KSmshvz
	FSDOzsjO0c/tZpu68aE7a4OGlnIU7nJOuJ1h7kTGQ3r+m2iz6qnOgGEiJNZUocK0mvagL0/el6l/c
	W0ey46mV1E6u34pry4VDrcxhH8qj8i/OZYQGtrIH/veQROZceP58WAZhIK5D9Dd4zglE3eLKfpXLe
	GpJg+a5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gmb-0000000AXAE-27bF;
	Mon, 22 Sep 2025 13:40:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gmZ-0000000AX9F-0lbg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:40:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M9BF4n029389
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wck1RFL3Etc5iANJFBisnl6A9QEEqYSWtMuEcnVHG7E=; b=NYGtS06HtujpjOy7
	EaoMP5NEqsjM5+zsN1ce45OXw/3Z9TlNtgIumlgKxHX//KFHHzHW+xmQr28/ArdH
	0Whc8vUWcy0pgIrlBvaqAsDmfJfyv7WciT6wvZeROXDrRCyEr8BpIzr7tm4PRsGy
	+7S9JnKlXrX68Y5kTbKezzUPPCoDQJh9cHAUTIrX+fdDAfZ8RRD379r8TVhkknKD
	aGpDMz1l9xnB6/sKJa6gFskwBkXQaKVAKbjBBasf+CizCXLByRl+tUcFAvfLX2pA
	TlYTDfdaY8+NFfq2nNxMzjosgWykffDR3DrQIPYRA8iembPFe4H1EkHlK7Pv7xvO
	n/T50A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk0rj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 13:40:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-248d9301475so62186595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548440; x=1759153240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wck1RFL3Etc5iANJFBisnl6A9QEEqYSWtMuEcnVHG7E=;
        b=dQWDvhdQLj2dMu3wqXfGXvVAWni/al+XWD/L5Dco0IKJB53kF3mcmCKzMyN/r2f/KL
         QqYQrTTPinvBazESuDJYdJp+ExpB9IOBo0342+naAL/HLqG6JllK5ONH+dYwDd3XNP3F
         CSjMh2ZDDrWUowlGMjpCEvSzd2wfNH/7/ZCmZka8F+TVeSlcqWlW0V0sNGOcFBj/9cNM
         KPZ4GpBaZUQZzbRnll94tG9EgOg/ENbHsrbJXSSzOpzMFRCFI3EXOvS5fl3EPVxFs8YZ
         3e7+tdwe509g5dIQEP6kG0m5DORijpwk6ux7ObeTxwRfU/N2Feav2uEdDp2Vfp8vuNOJ
         /FIA==
X-Forwarded-Encrypted: i=1; AJvYcCUZvhhz/AeLU/zjUDt+vz3IN5ruuVBbyFlCi+wtQCchL+gMkjGIS0qXCe2AkRFacBnF3bUsROPC4TNeMpzLgJiT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2qGzWen+5T0CWVVD8AfpizpoMH1eeExm5KcGOEcwvCjjS64L3
	K9/ZJre4GMXDfBgIWtHgz+SeGNylLqw5we0MgT8AsQoUsOqnwPBFkk2hxsl3AlHQkIfpl3qJcoP
	7QLQILVkMvh7vPUThgPjmIsvU59pdYB8iSJBOpR2eW4Hq3S3b2HYQ/a53wE7g3jk+UQOXqz5YAL
	5snA==
X-Gm-Gg: ASbGnctYZA3R5TSTMh79mCLSRvgY97sLgD05NyPmmKWNMnciXYVh/2rILypD1zXcCoR
	mM92r91kfw6NHo0ltBdB1UhGXn6+dQEoVYp7lALW/WO+F7uzEeklYLTNql0ExjGSusaRvBmIuBU
	JNX4kH3nKO3RvniKQLkTvd0F6mtir0Ga8Ymd3DDfKuaonW/RE66zENINxI+7fOfeBueZfstSOk1
	30GoPuOrsiMCLdMJHqkqDFKXwo3xgN5FqRKIiZm7Uy+XbOmX9gqCnRiiOW65yFovc20GLOaZlUy
	9Y3dX7SxYhksYrHmn3iRigb6mSzUkVrv841qGd7yxZ+KuWRG0VPy+024GY5LcPk0OVW5C0Y4jpT
	x
X-Received: by 2002:a17:903:2342:b0:265:982a:d450 with SMTP id d9443c01a7336-269ba533c6cmr153441715ad.40.1758548440289;
        Mon, 22 Sep 2025 06:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo2/a4BVdjp6tjYR2Y07Siikp43uvotxG3p+AwbYTvOOPwZqz5VaSP3wBnmdNsJoZXYNxiFg==
X-Received: by 2002:a17:903:2342:b0:265:982a:d450 with SMTP id d9443c01a7336-269ba533c6cmr153440945ad.40.1758548439664;
        Mon, 22 Sep 2025 06:40:39 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:40:39 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:11 +0530
Subject: [PATCH v15 01/14] power: reset: reboot-mode: Synchronize list
 traversal
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-1-7ce3a08878f1@oss.qualcomm.com>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=5404;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=+LF5Rl/5f5znpMQv1GLZ4NG0dpObtQwZ7SckbxZ5OJg=;
 b=yzvvk3xOQzGRIfbypo337GvXrt2u9sEAEj3aA6MIS0LHEOylzx77NGaQMiaatRSoiCZG1XFdY
 RBTwjziAxJgBmHAO5r5GKKjyxKj4zbZtbDfuYZM8V2wAKDMIVJwAOq8
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: Q1MVXLgWpBvLbHCn3mOL0pDAbz-4DFHq
X-Proofpoint-ORIG-GUID: Q1MVXLgWpBvLbHCn3mOL0pDAbz-4DFHq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX2eWN+AH/eavO
 p7x1EHBuJF+mVTufxNWzxS+rtpNct13m2+18EWmDw17ezcLk9gQCDV+AbwWOnRLA/wOTWLC0fe8
 bVmYcPrHlvCBQJWAkur4HUktx+s2FzH/7DqspQVfqRoNenxvbgmZM+ba5bHWOXjNR7Uj+hS9XcP
 +lgI4Hr+ej8Oc/rP4teb6PD0t3NdQksXGIDCCkXdUruP7B32UeKMt84JdPn0jlOirhOZ8os/9OA
 dYTWW6ENUhl8URYiLb5Es+7CyHI2Emb2xcdG6ccuVxbm6VcxM0KUhtpjF50UUeumNSucJ9gbaiu
 Il9l29C3xziTX9COW3uZl/bxcYU5oreIBMY0+G/Pf8WpFYH6XCZ5TcXQnKb8u5dO7/+dpL0tTuL
 WHsuISId
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d151d9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gP18aZtcJwKeVuiPoooA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_064043_401265_F2900A66 
X-CRM114-Status: GOOD (  21.15  )
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

List traversals must be synchronized to prevent race conditions
and data corruption. The reboot-mode list is not protected by a
lock currently, which can lead to concurrent access and race.

Introduce a mutex lock to guard all operations on the reboot-mode
list and ensure thread-safe access. The change prevents unsafe
concurrent access on reboot-mode list.

Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
Fixes: ca3d2ea52314 ("power: reset: reboot-mode: better compatibility with DT (replace ' ,/')")

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 96 +++++++++++++++++++++------------------
 include/linux/reboot-mode.h       |  4 ++
 2 files changed, 57 insertions(+), 43 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..8fc3e14638ea757c8dc3808c240ff569cbd74786 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -29,9 +29,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 	if (!cmd)
 		cmd = normal;
 
-	list_for_each_entry(info, &reboot->head, list)
-		if (!strcmp(info->mode, cmd))
-			return info->magic;
+	scoped_guard(mutex, &reboot->rb_lock) {
+		list_for_each_entry(info, &reboot->head, list)
+			if (!strcmp(info->mode, cmd))
+				return info->magic;
+	}
 
 	/* try to match again, replacing characters impossible in DT */
 	if (strscpy(cmd_, cmd, sizeof(cmd_)) == -E2BIG)
@@ -41,9 +43,11 @@ static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 	strreplace(cmd_, ',', '-');
 	strreplace(cmd_, '/', '-');
 
-	list_for_each_entry(info, &reboot->head, list)
-		if (!strcmp(info->mode, cmd_))
-			return info->magic;
+	scoped_guard(mutex, &reboot->rb_lock) {
+		list_for_each_entry(info, &reboot->head, list)
+			if (!strcmp(info->mode, cmd_))
+				return info->magic;
+	}
 
 	return 0;
 }
@@ -78,46 +82,50 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	INIT_LIST_HEAD(&reboot->head);
 
-	for_each_property_of_node(np, prop) {
-		if (strncmp(prop->name, PREFIX, len))
-			continue;
-
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
-		if (!info) {
-			ret = -ENOMEM;
-			goto error;
-		}
-
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
-			continue;
-		}
-
-		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
-		if (!info->mode) {
-			ret =  -ENOMEM;
-			goto error;
-		} else if (info->mode[0] == '\0') {
-			kfree_const(info->mode);
-			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
-			goto error;
+	mutex_init(&reboot->rb_lock);
+
+	scoped_guard(mutex, &reboot->rb_lock) {
+		for_each_property_of_node(np, prop) {
+			if (strncmp(prop->name, PREFIX, len))
+				continue;
+
+			info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+			if (!info) {
+				ret = -ENOMEM;
+				goto error;
+			}
+
+			if (of_property_read_u32(np, prop->name, &info->magic)) {
+				dev_err(reboot->dev, "reboot mode %s without magic number\n",
+					info->mode);
+				devm_kfree(reboot->dev, info);
+				continue;
+			}
+
+			info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
+			if (!info->mode) {
+				ret =  -ENOMEM;
+				goto error;
+			} else if (info->mode[0] == '\0') {
+				kfree_const(info->mode);
+				ret = -EINVAL;
+				dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
+					prop->name);
+				goto error;
+			}
+
+			list_add_tail(&info->list, &reboot->head);
 		}
 
-		list_add_tail(&info->list, &reboot->head);
-	}
-
-	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
-	register_reboot_notifier(&reboot->reboot_notifier);
+		reboot->reboot_notifier.notifier_call = reboot_mode_notify;
+		register_reboot_notifier(&reboot->reboot_notifier);
 
-	return 0;
+		return 0;
 
 error:
-	list_for_each_entry(info, &reboot->head, list)
-		kfree_const(info->mode);
+		list_for_each_entry(info, &reboot->head, list)
+			kfree_const(info->mode);
+	}
 
 	return ret;
 }
@@ -133,8 +141,10 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
-	list_for_each_entry(info, &reboot->head, list)
-		kfree_const(info->mode);
+	scoped_guard(mutex, &reboot->rb_lock) {
+		list_for_each_entry(info, &reboot->head, list)
+			kfree_const(info->mode);
+	}
 
 	return 0;
 }
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..b73f80708197677db8dc2e43affc519782b7146e 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,11 +2,15 @@
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
 
 int reboot_mode_register(struct reboot_mode_driver *reboot);

-- 
2.34.1


