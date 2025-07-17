Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54618C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 13:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkUicWB76ieKISxjnwkwmUAWcFBcwTj81cvO9nIz9Bk=; b=WCQqr/lIg2QE9Xa4820qJEO6W5
	LyS5Z+dJy5P0x1Wf2pKaVW1nYf4mRjmoP8hXgZOB8Os34KgXKN1el7caC+iBNtFLfPGt0R0LvpbwC
	DVkIou2r+jO8vJU9xithuImZ0VButboKrJfc5q6nngEAUf4R0estNWgPttCclsZFZhJft4mf1tLyT
	6k/Fg752OeK6Cv2zPbV3CF7WQRR+hGmhGR81nKZ6TL4i1lV4nO7nV1a+aSdqr6KT9r9+ZJGrOm40e
	yu0yodbdujKh33lh+OOv6/yvRuEk6LMBtxNrXb7tW4geGpqMKQL8sb7ldgkhnyz7Rx8Z96P2vVnAJ
	wA9JyumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucOzU-0000000AIPM-0Eh9;
	Thu, 17 Jul 2025 13:49:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucO2b-0000000AA1g-3N4B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:48:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HBic32016170
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tkUicWB76ieKISxjnwkwmUAWcFBcwTj81cvO9nIz9Bk=; b=hdoC58FpNpctw++K
	Sn76G/AMFCO7bv26b8rfuUDuFzPS3sIvTN7q7prrNRsltvbpKlpB22Y2rJ3Qss7T
	oiJrAVXBKFTGXNyOahK+h1OfF4BiOdmyQFcmTelI9TKvwiyorRz/7LUEMf8x5fSS
	I48DeEMHVqDw/exasxqGNnUFzWbJX5D3eAquUHbCYv69UMXQvia6a9GsBQTsneyq
	ohEOQEa0ksHtb+Y4TKkzS6Kfu6AFDy9LjjXR9tu4u+C8V5PinJ7ozUhPVM8PajIO
	iLtHf1gB8fiUWBiYqhigDtQByywBztKFN/KiQKYbku1WDuqyLEbpNWulhXBkwaO8
	5wrx8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dytmmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3138e65efe2so964315a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 05:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756528; x=1753361328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkUicWB76ieKISxjnwkwmUAWcFBcwTj81cvO9nIz9Bk=;
        b=G3PvxX8ccki7kTQqufv1JwI5WNbA+DnLdAUFeWFEOYXjhnP/tAKJ4FnIoJ4bHYL6Ec
         A5ViyXxhQufSygWLQkk0xyhvv4UR15cebf7gINHoK3iXec0JOaFkp1M1C10biFNkYbUc
         39ZsqhpXUe8RPEkAfYzFgejpm0WHd7Pb/Ypj/wQ6DYZ51QP8Q56PBZPQzTKlSODqxLHy
         GmMpNIGDVTd9fexSwipKPaahyavVRwz3COUdbogvbwYkbXL5VinyaYoMvMyQAl4rh6dO
         z33W0N5aNrQTtjX3b31DD8RSO/KS01P2LmZ/OlYV5XbABZzFRRK545UIw4pbWYjLUIRY
         yu3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfGK8o1F9aDxLD25cpG5FqftFIainOJ5LEOYsZsaZInqofc0Y4D9CzbFkZkkpbut7g0DZIlwa5GHLtoQqjSJjA@lists.infradead.org
X-Gm-Message-State: AOJu0YzWlsCETFtUQQKkOnRcw1R3TJYYCWqiqipYCfxqIi2iUvykcb4j
	QsU7iR/ELt6DlFTCqfjMKbAfYufdSv80WzOPHgi44yO8KOZorKb9amszWOmI0DtBRbQP0QR58JC
	jarpaGaRhcddaB8dznOfcbtvD5b5Fk+IiSYsKkCeIalMqiRh+/SuCl834I37fRCFLGvWBNHlwxL
	xCnQ==
X-Gm-Gg: ASbGnctoi4fX7fzbZdc15LA0KXq5v9Tsy/WsneDlClP3T6XiOOUETxYhI7g04MKxKUx
	ONh92XeB30Qm0MxlGk8EpmTcKzb5I65eIUzQBtpENVNAcN1xUCUNY/Pw9w+wGVMthc0tw2AbhpU
	oShAXj4fIrMHWVTBEeySW60n5aAc2KDljVmYLcVvQvnbVYIdvWbKM/kDymQ+FZa9LxX1lVXZcHv
	Vu0EPHv5TM+Du9ADRWArEPFyH/raR2k2YoUCX76RJLDbifaeBA6TrdaV0pYB0Oq0HWGs+01/vgx
	BuGFJBCYS3pbxbhgGfM7uoO9us9kIZhs/JCpiT9Qvqtkf5nKbNtX3qoeqCWEYgeWuRNXvw02/Dz
	b
X-Received: by 2002:a17:90b:1ccc:b0:313:271a:af56 with SMTP id 98e67ed59e1d1-31c9e78d9fcmr9191635a91.30.1752756528356;
        Thu, 17 Jul 2025 05:48:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRdKlC16lxkWUCUZhw0+fz+yA0Fr68ZbmeflAPY4PRaTdeyJr/foHYSUxJAaxMSb2tkmP1bQ==
X-Received: by 2002:a17:90b:1ccc:b0:313:271a:af56 with SMTP id 98e67ed59e1d1-31c9e78d9fcmr9191603a91.30.1752756527883;
        Thu, 17 Jul 2025 05:48:47 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf828a0esm1505283a91.42.2025.07.17.05.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:48:47 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:16:54 +0530
Subject: [PATCH v11 8/8] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-arm-psci-system_reset2-vendor-reboots-v11-8-df3e2b2183c3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752756455; l=7454;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=dzfywuUuVDRiw0cxEMBMzlxkHVeafnNl2y+/gY2scNQ=;
 b=5xhLKNPQS9288lBeKvndsb2ahvA45N7vW93WeXRvHYkiJ3x0JHi1/4pHQT6SKD9hbWK6UZK/C
 QFftekoiK3iCxfTUpVKLTbdmPu/sUWAZDSDiJeONjmSnzidTJWdlBoA
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: reYyz7USuhYpodYieOvgp6NpHhOBirj_
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6878f131 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=I4qJSSq-i-5ETPqSmjYA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMiBTYWx0ZWRfXzq0FdjZvjO0Z
 WYytfUqSAzOt3ZnVkL+jWwMVOKetubTTJqy0ChDHYdhTNrbPItms3nBPpYMVIGJEQEIq0Nk/CGJ
 Ol80hvFWefYZoC7kqKfz9IyreQvFSESQVUGMuj6YCVQGdiihwGcNXdjU4bLbnwWOW0yFA8DuU6i
 veox4ZhmHIT5fOX9h9tmBKEcO3NPsKgH3s6csgHCYaOFeWTVcQMUnaiw+USoNFOfFXhFY+cCZ3U
 u6clIXcbcbWRT3+S9AzMSQ7rAT6FobngqSxGXvnK0DdiGuWZGyV7Ko5MDNA/Xd34LZvWLBd+xRK
 chC1PXG8ozhXSQyYjkQ4yR9W5AQhsUe9F6BeIKzfTV2TGqe1ZkQ2KyW1yUtZtK4VgkdiigzJ1MI
 Jnz8kJ43Oo9G3YS4wNVzgd3zTlQYy1x+N6dOiOseUmKwBja5lg2igGVgphciZNLU96m59uLr
X-Proofpoint-GUID: reYyz7USuhYpodYieOvgp6NpHhOBirj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_054849_851819_CBE5A7DF 
X-CRM114-Status: GOOD (  31.63  )
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
userspace.

Create the device using the node name of the driver that
registers with reboot mode driver.

This results in the creation of:
  /sys/class/reboot-mode/<driver>/reboot_modes

This read-only sysfs file will exposes the list of supported
reboot modes arguments provided by the driver, enabling userspace
to query the list of arguments.

Align the clean up path to maintain backward compatibility for
existing reboot-mode based drivers.

Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 .../testing/sysfs-class-reboot-mode-reboot_modes   | 38 +++++++++
 drivers/power/reset/reboot-mode.c                  | 96 +++++++++++++++++++---
 include/linux/reboot-mode.h                        |  1 +
 3 files changed, 123 insertions(+), 12 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
new file mode 100644
index 0000000000000000000000000000000000000000..63b3ef1ecc66c73744fc831fa9864592c514bd56
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
@@ -0,0 +1,38 @@
+What:		/sys/class/reboot-mode/<driver>/reboot_modes
+Date:		July 2025
+KernelVersion:	6.16
+Contact:	linux-pm@vger.kernel.org
+		Description:
+		This interface exposes the reboot-mode arguments
+		registered with the reboot-mode framework. It is
+		a read-only interface and provides a comma
+		separated list of reboot-mode arguments supported
+		on the current platform.
+		Example:
+		 normal,recovery,fastboot,bootloader
+
+		The exact sysfs path may vary depending on the
+		driver that registers the arguments.
+		Example:
+		 /sys/class/reboot-mode/reboot-mode/reboot_modes
+		 /sys/class/reboot-mode/pon/reboot_modes
+
+		The supported arguments can be used by userspace
+		to invoke device reset using the reboot() system
+		call, with the "argument" as string to "*arg"
+		parameter along with LINUX_REBOOT_CMD_RESTART2.
+		Example:
+		 reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
+		        LINUX_REBOOT_CMD_RESTART2, "bootloader");
+
+		A driver can expose the supported arguments by
+		registering them with the reboot-mode framework
+		using the property names that follow the
+		mode-<argument> format.
+		Example:
+		 mode-bootloader, mode-recovery.
+
+		This attribute is useful for scripts or initramfs
+		logic that need to programmatically determine
+		which reboot-mode arguments are valid before
+		triggering a reboot.
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 1196627fbf98d87eec57a3d4ee544e403e6eb946..af3551fe2f625aacd31699604b7cbdd66c318c00 100644
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
 static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
@@ -65,6 +68,79 @@ static int reboot_mode_notify(struct notifier_block *this,
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
+	devres_reboot = devres_find(dev, release_reboot_mode_device, NULL, 0);
+	reboot = *devres_reboot;
+	list_for_each_entry(info, &reboot->head, list) {
+		size += sprintf(buf + size, "%s,", info->mode);
+	}
+
+	if (size) {
+		size += sprintf(buf + size - 1, "\n");
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
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		kfree_const(info->mode);
+		list_del(&info->list);
+		kfree(info);
+	}
+
+	device_remove_file(reboot->dev, &dev_attr_reboot_modes);
+}
+
+static int create_reboot_mode_device(struct reboot_mode_driver *reboot,
+				     const char *dev_name)
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
+	reboot->reboot_dev = device_create(rb_class, NULL, 0, NULL, dev_name);
+	if (IS_ERR(reboot->reboot_dev))
+		return PTR_ERR(reboot->reboot_dev);
+
+	ret = device_create_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+	if (ret)
+		return ret;
+
+	dr = devres_alloc(release_reboot_mode_device, sizeof(*dr), GFP_KERNEL);
+	if (!dr) {
+		device_remove_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+		return -ENOMEM;
+	}
+
+	*dr = reboot;
+	devres_add(reboot->reboot_dev, dr);
+
+	return ret;
+}
+
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
@@ -83,6 +159,10 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
 	if (!np)
 		return -EINVAL;
 
+	ret = create_reboot_mode_device(reboot, np->name ? np->name : "reboot-mode-dev");
+	if (ret)
+		return ret;
+
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
@@ -137,24 +217,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
  */
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
-	struct mode_info *next;
-
-	unregister_reboot_notifier(&reboot->reboot_notifier);
-
-	list_for_each_entry_safe(info, next, &reboot->head, list) {
-		kfree_const(info->mode);
-		list_del(&info->list);
-		kfree(info);
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
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index d9d9165a8635e5d55d92197a69c7fae179ac2045..8fb35ef1c00749500a99d088b5f7010d57547844 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -6,6 +6,7 @@
 
 struct reboot_mode_driver {
 	struct device *dev;
+	struct device *reboot_dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;

-- 
2.34.1


