Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4D9CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Bdm4klfKmI9KtujwTAZDFlBBRS0qX6qK7HSOvDmFEM=; b=rqjWAC+JenutE2LH3MaBekOSBE
	l5g/1e7DIrkLyNZCZ1gephkDPGR1XOsxaLN4L0hJ98UQ1ffZj93oNZpru8FFoZJeoa4rA80pW5MQ6
	cTjeH/atNToqsEIScajybSgK9Bv0/m3K54PcUlpML9ZDQS1Qd0dMbL434vHlHnRnJA5tZ+apLZgx2
	F1FON/ONj2icqWQM56DIzShzEb1TeRnyEQpPZrHVllaiF7TFwwNo7Pcu2HPyT8cW/McCsvQyp5CS/
	9DDfpkpmM85bx9/S7IDDeRPKFdPlUIAc5Z0CVfNC0dxuML52Vk1qKFhTT2YFJgKqGcs37R6YMamrr
	F7weNf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tIO-00000000RLr-1HyV;
	Wed, 15 Oct 2025 04:39:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tIL-00000000RKD-1VU4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:39:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sENV003541
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Bdm4klfKmI9KtujwTAZDFlBBRS0qX6qK7HSOvDmFEM=; b=oMke+GiAFO7Cwfgu
	qyZ3JD51wJqMEuG3eyQ17e7NoiwOuZZiMnmgt3/x0AqubPl6imwjIZKa52RfK7Xu
	Zz1vvIfDLUXbdWytwC/SVguc9nONfpCIwmloQ1sRoi0a+swDEsoMP9zG2UKnWZOi
	rArAioL+FTOjl/tQkCq5M1qjFgI5wBXOCBdzORQY5Z98dGBxDGnplhb6WUgJq+ax
	72ez3J3RfdgiCjB7hzusyFqOtwax2EBc7Zh2uTMslsKejg3K+ht5pjwg8IbAvrgF
	e2v8W14y0Tu3oPp3u7cvRJ8jWlxi+B0OffWxDSMdxeqnYu0LULzwVLm/5WqlBryP
	thLJ5g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8hmep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:39:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so9675912a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503163; x=1761107963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Bdm4klfKmI9KtujwTAZDFlBBRS0qX6qK7HSOvDmFEM=;
        b=QCP4qQsSma/BmPDsNkYgUn5jM+1e9NDR8sTSlaWpglFtDLLXXf3GKpxEPgVAQ0oMqr
         5QCFKw2xWz5KvKQzA9iGfcyN9UgSwO5iztomPBaczmF/8K7gxtv54o8g7aDh0GW930oj
         AoHQ2uKu1do4l4lujyiJTtLMjeKzGpP89KMe9BUzeJdbXSi2kI9wDXrovCvM2MEs9Zyt
         Rap3nf1fVGMdo8foZSoLrl+I/QA/2DhPhHbS/ZCRi5RB2Jhob/WVEk2M8m40EGrTGafU
         Gb9NJz9Ic7JXv9sC7nxIHLoCw+wIk5SL9CZvut5B6twl20korRUaBX777Qyho7BEeFKi
         E91Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1JLgdzN8wEja7rwIDrRb7kfAbFMpwBCAZxrdQJ0dV87HB0nVEjLQMmTWPv6wIxzs8QaM8euO0wYtCh8snMOda@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp85ZywkVlXqjGvvSzyJHZDZJHEbFkPSSGfnuX5d1w8V/7+pOG
	tvAKuxMOXJBmKeM0IPvmV0g9HKkrB6viuAZ2YkU8f6JS9zflbrDW1P9+4oi+xoyXQcDccoKOA+6
	GkMBnAUTPOkvQsRxmqQPbkvTaWhZOR1NzIbBltHam//8IBuFzLXUDKxS1PivkR9zkkZsQiOc/oM
	p6BA==
X-Gm-Gg: ASbGncsyDFHJHE2KrMCtSuiU7DJz0bqYaehAcrmhid8QlnQ3PdBmxrm2Af+MMKAjfEf
	yXH3kV5TlZctipRXgxwI73zhCQktfEL+tqsaDuo5pTKnZS566aBzWH+EIAUtCPLYAiP1BZXjsmC
	L3i4EFNsOQZQgA63pgAomS3ALEcgXmo4cuABkyyG6czazxT1PzXdSiyFDVEZpmsSelrFC9H5Vav
	O0WurogaEaNXU5IVW8woUmFzrtHcbQwRYXoH3pWJOXZAhgcmG4FbG7ihYyOGiSn9Bw+s35zyVd1
	+Q1pnva8FVGQCwwpsaxe1pRlOVkvBLX6EUcpguGnwQav6GscAnUf4vX84HeyriWbjSVGiQ8eKMS
	D
X-Received: by 2002:a17:90b:3ecb:b0:336:9e78:c4c1 with SMTP id 98e67ed59e1d1-33b5111580emr38598229a91.15.1760503162931;
        Tue, 14 Oct 2025 21:39:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBkK+NiykobnCG3bWTEK1vwo/Tixei5xALFMexfZlmErkfY9V/XJttVGTpCHIhloygGQKJvA==
X-Received: by 2002:a17:90b:3ecb:b0:336:9e78:c4c1 with SMTP id 98e67ed59e1d1-33b5111580emr38598192a91.15.1760503162352;
        Tue, 14 Oct 2025 21:39:22 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:39:21 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:20 +0530
Subject: [PATCH v16 05/14] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=7370;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=8AcG56zSaj2lb+5LiiVME4iAOJl8Jy9RSPWY/3KevJU=;
 b=F+ABZJAmqdzEeh37h5YIzUWAPnWH1l70KDEJ6TYBKxBmDBSbKGc60FieOGIhiVT7o1tAjn4bd
 VhHdkn3bHpnBN+ohs3uJyoWvlwFJPwN47tR1qT1aREij+bKdg6GUKgs
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: Fc65BvL-Podyionw3VMsz1hExxVu4azR
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68ef257c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=I4qJSSq-i-5ETPqSmjYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfXwHheErWBF/iN
 GAnCQt8HQhIKLyo+uLszwm87qvgsy0UzCSsTX6rYLFXEbikQK3vJk1AHflYJFVkk1HPcskptW5O
 NJZg3na2pHRpAsIo5eJwOav80epjxEbJR8tAffxuZpBDHQtOiEFGMKoP0lcxBQkmiG6FOEfAqyf
 /bi55SD6yge37q0k71qnPUHLFwi4YiDCJ8LujnA9xbWTika653UcxJ6QGk38IMTgEWZ4C/C5ZVF
 5RPGv0jDA+Zh6YVdATe74zYhyKcG8XvEb2flWzx0uZhqm19v7FwqZZkXSp/6xJ23tdPuaoYxvRu
 JJLuJ/lmVCewcjK7rluLXkBkSiTWzO2q4bhzCDaMQg9v/EpHVx4V0DzdQX5eyz/NH9ymPHfMoCa
 FDz79zJPh5+4+2JYMhCZFUKhgi0w/A==
X-Proofpoint-ORIG-GUID: Fc65BvL-Podyionw3VMsz1hExxVu4azR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_213925_544915_67C79A29 
X-CRM114-Status: GOOD (  27.39  )
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

Currently, there is no standardized mechanism for userspace to
discover which reboot-modes are supported on a given platform.
This limitation forces tools and scripts to rely on hardcoded
assumptions about the supported reboot-modes.

Create a class 'reboot-mode' and a device under it to expose a
sysfs interface to show the available reboot mode arguments to
userspace. Use the driver_name field of the struct
reboot_mode_driver to create the device. For device-based
drivers, configure the device driver name as driver_name.

This results in the creation of:
  /sys/class/reboot-mode/<driver>/reboot_modes

This read-only sysfs file will exposes the list of supported
reboot modes arguments provided by the driver, enabling userspace
to query the list of arguments.

Align the clean up path to maintain backward compatibility for
existing reboot-mode based drivers.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 127 ++++++++++++++++++++++++++++++--------
 include/linux/reboot-mode.h       |   2 +
 2 files changed, 103 insertions(+), 26 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 79763a839c9b0161b4acb6afb625f50a880971cc..1e78eb3d0fe513c934b37bf7f0829e1f9f4634f0 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt)	"reboot-mode: " fmt
 
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -23,6 +24,8 @@ struct mode_info {
 	struct list_head list;
 };
 
+static struct class *rb_class;
+
 static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
@@ -69,6 +72,89 @@ static int reboot_mode_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+static void release_reboot_mode_device(struct device *dev, void *res);
+
+static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct reboot_mode_driver **devres_reboot;
+	struct reboot_mode_driver *reboot;
+	struct mode_info *info;
+	ssize_t size = 0;
+
+	devres_reboot = devres_find(dev, release_reboot_mode_device, NULL, NULL);
+	if (!devres_reboot || !(*devres_reboot))
+		return -ENODATA;
+
+	reboot = *devres_reboot;
+	scoped_guard(mutex, &reboot->rb_lock) {
+		list_for_each_entry(info, &reboot->head, list)
+			size += sysfs_emit_at(buf, size, "%s ", info->mode);
+	}
+
+	if (size) {
+		size += sysfs_emit_at(buf, size - 1, "\n");
+		return size;
+	}
+
+	return -ENODATA;
+}
+static DEVICE_ATTR_RO(reboot_modes);
+
+static void release_reboot_mode_device(struct device *dev, void *res)
+{
+	struct reboot_mode_driver *reboot = *(struct reboot_mode_driver **)res;
+	struct mode_info *info;
+	struct mode_info *next;
+
+	unregister_reboot_notifier(&reboot->reboot_notifier);
+
+	scoped_guard(mutex, &reboot->rb_lock) {
+		list_for_each_entry_safe(info, next, &reboot->head, list) {
+			list_del(&info->list);
+			kfree_const(info->mode);
+			kfree(info);
+		}
+	}
+
+	device_remove_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+}
+
+static int create_reboot_mode_device(struct reboot_mode_driver *reboot)
+{
+	struct reboot_mode_driver **dr;
+	int ret = 0;
+
+	if (!rb_class) {
+		rb_class = class_create("reboot-mode");
+		if (IS_ERR(rb_class))
+			return PTR_ERR(rb_class);
+	}
+
+	reboot->reboot_dev = device_create(rb_class, NULL, 0, NULL, reboot->driver_name);
+	if (IS_ERR(reboot->reboot_dev))
+		return PTR_ERR(reboot->reboot_dev);
+
+	ret = device_create_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+	if (ret)
+		goto create_file_err;
+
+	dr = devres_alloc(release_reboot_mode_device, sizeof(*dr), GFP_KERNEL);
+	if (!dr) {
+		ret = -ENOMEM;
+		goto devres_alloc_error;
+	}
+
+	*dr = reboot;
+	devres_add(reboot->reboot_dev, dr);
+	return ret;
+
+devres_alloc_error:
+	device_remove_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+create_file_err:
+	device_unregister(reboot->reboot_dev);
+	return ret;
+}
+
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
@@ -79,7 +165,6 @@ static int reboot_mode_notify(struct notifier_block *this,
 int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode)
 {
 	struct mode_info *info;
-	struct mode_info *next;
 	struct device_node *np;
 	struct property *prop;
 	size_t len = strlen(PREFIX);
@@ -87,13 +172,17 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
 	u32 magic_arg2;
 	int ret;
 
-	if (!fwnode)
+	if (!fwnode || !reboot->driver_name)
 		return -EINVAL;
 
 	np = to_of_node(fwnode);
 	if (!np)
 		return -EINVAL;
 
+	ret = create_reboot_mode_device(reboot);
+	if (ret)
+		return ret;
+
 	INIT_LIST_HEAD(&reboot->head);
 
 	mutex_init(&reboot->rb_lock);
@@ -136,20 +225,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
 
 			list_add_tail(&info->list, &reboot->head);
 		}
+	}
 
-		reboot->reboot_notifier.notifier_call = reboot_mode_notify;
-		register_reboot_notifier(&reboot->reboot_notifier);
+	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
+	register_reboot_notifier(&reboot->reboot_notifier);
 
-		return 0;
+	return 0;
 
 error:
-		list_for_each_entry_safe(info, next, &reboot->head, list) {
-			list_del(&info->list);
-			kfree_const(info->mode);
-			kfree(info);
-		}
-	}
-
+	device_unregister(reboot->reboot_dev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_register);
@@ -160,26 +244,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
  */
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
-	struct mode_info *next;
-
-	unregister_reboot_notifier(&reboot->reboot_notifier);
-
-	scoped_guard(mutex, &reboot->rb_lock) {
-		list_for_each_entry_safe(info, next, &reboot->head, list) {
-			list_del(&info->list);
-			kfree_const(info->mode);
-			kfree(info);
-		}
-	}
-
+	device_unregister(reboot->reboot_dev);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_unregister);
 
 static void devm_reboot_mode_release(struct device *dev, void *res)
 {
-	reboot_mode_unregister(*(struct reboot_mode_driver **)res);
+	struct reboot_mode_driver *reboot = *(struct reboot_mode_driver **)res;
+
+	device_unregister(reboot->reboot_dev);
 }
 
 /**
@@ -202,6 +276,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
+	reboot->driver_name = reboot->dev->driver->name;
 	rc = reboot_mode_register(reboot, of_fwnode_handle(reboot->dev->of_node));
 	if (rc) {
 		devres_free(dr);
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 3a14df2ddd1db4181ea76f99ef447ed8368a3594..c68a671f6947f2346e1e6a0ce3c6ebc18722b98e 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -8,6 +8,8 @@
 
 struct reboot_mode_driver {
 	struct device *dev;
+	struct device *reboot_dev;
+	const char *driver_name;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;

-- 
2.34.1


