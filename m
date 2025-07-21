Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89556C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEmpumKrhaODJMwEzzkAX1UibK4n47hwRLwgIiszPOo=; b=TJU5DbKk9EdtwVWERS+l4ltxpl
	078tJDdUokG/MmKCeq0DconlF8Pk2x21KTUTGdQAGy/ZADbYh1B747i3PG1PdVjVW4WxYHkQeMa/k
	sGCMAlaPCu/hQTtnW+hMSQM5881+yHEZFK9gI8URDbcH4wQrXDD99b32VpSqahfDGZQ/Ja0xhIxhr
	XdHIk9aN0pG92MJkwDz/OCN41QxB0qPB+SHJM954THiloZBXRFrtvAURhqipu7tJECGaMRa2xxV7Y
	nv0P4UdaguCmjErgp1+Ef8Li5JZ/tUpbusNGaHSstLw7wJ5KxXpebTDz+Oae91qHRjUq17vpEHVl+
	20+BOFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udviH-00000000SRf-22Yl;
	Mon, 21 Jul 2025 18:58:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvH8-00000000Q3e-2cJF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 18:30:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LGDdpQ016582
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IEmpumKrhaODJMwEzzkAX1UibK4n47hwRLwgIiszPOo=; b=ZgPjvW91SwqWnmVM
	7faHGCv2Nd/EQxZ2UQ88t66pvS6Q1Owj9obnZyrWbzM/Ix6tWV95FIIg96TEmwJG
	AdyfnLGOZZMq5Blxdyn0bsa/j5VKRgbFAWwJHyrCm+zapDwcnhMeRkyENJUYs9Fp
	+kr4Mi7iao0Lh88B1ysSQEh32j/Ag2WMzMpvf6DnqT1sARgtS6FfhjpGrwQYR5tS
	HvDMFPo37PmuRF5nfHG0EknFYGxQO+6CR02MpY8LxAhe+IlxvLE+G72YI/P3TpjY
	eS+N+kFwNhdBaUvBYLgs5NrfzromZWGOShHDG+xehVwgZ/69U4kTDhLbraMzTYjA
	a9dKhQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rxv6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:30:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-237f8d64263so43900945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 11:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753122608; x=1753727408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEmpumKrhaODJMwEzzkAX1UibK4n47hwRLwgIiszPOo=;
        b=OZmjJTvxFvE8RkrOaHIGPdgAvEjHdul9hrCRQ/k3/Z1FwoER1E2LKyknahvHWCnR5q
         zxdKcGooYsbqeh/pB7MiFGi4KWULHlUlhpW5sMJWcj6BZ9qyzT/rBICODJ71xqSfH/DS
         52DV0OIG11YJ4ismAH/x0tYUZ/+2LD5gQRrv26fZZar6xjD5P4IKh56dVf26ELBor65L
         nPVwlL1apMWmlmeIObKhWDaNvBOrX8Sey/EOJB26K7wiVG6oFLNYuZbWViPI4Fz1ok3u
         pwoybDfjXpX5jkyvGK/B9tQsT8fFFAbfeIaEje/7f+cxxXtrOyoyLsHI4/BrY118TiLn
         PtQA==
X-Forwarded-Encrypted: i=1; AJvYcCXvqXx5Xg31UFfvb7G5InLZf7AprEoDm49fzP0QEpFIgS17OGjBsffX2xSuw4SPfdkuo/uAxtWsrH8lodG6ODiK@lists.infradead.org
X-Gm-Message-State: AOJu0YzM2tJDUGAipS+T7hJR63a9QohnR/c2NYnO3Y7MGIjM+ZcT/6lw
	lucaqxGtimKzOHl23LlW3F01F6x3OKLjzctBtF3x+hQzlEJQ6ut9IwlbHlJiWc/YJlTJA6mfJ9q
	n4J9HLeRT3VLHm0+Di3wkTrsZfUPKU1teXvmxwo/gaBlOqEVNuOm7dCVjMLJeAGSOp9Bm63VWgV
	pTOA==
X-Gm-Gg: ASbGnctE9GtTL4AW2LnZ8oqBSiYpv/KEGXYH4oi1AuvYYRRR9trIu3W6WH1oLGR7eFu
	DmEaaloxquctghPxNHWe0FLwJjbaVllpfJHs919LMFI6S0mujM4MUG24rDwOf/knXBmrPCl/bc4
	+tOKzSJOKxCziRxIEV4RqhlUR5DmUe1d6WHly7FdGs6ioAIkuXdQRXxLdtVbMnmJ9YOXedGfFFC
	2bOKcZjH3fxSQENsn/EKR7H1purIm5dz9x+X6wqoaYU72ZgWwCS+euo2li3bhOF1cdzETiww0+G
	pU2TlmQeZRFVILL8TCaKnSf0QfKWDAQa+g2F30cxaTa83uEgQYc1KYD0cMIad8Ynnu3sS8sXPs8
	7
X-Received: by 2002:a17:903:3c6c:b0:235:f51f:c9e4 with SMTP id d9443c01a7336-23e24f49430mr332444915ad.12.1753122608207;
        Mon, 21 Jul 2025 11:30:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzc5T8auyleKAM78gdw7nHnOP+rs5jlCWnnod/hDPSNKGt7NKcw2Z+61prVl/mK5+bZSi2RA==
X-Received: by 2002:a17:903:3c6c:b0:235:f51f:c9e4 with SMTP id d9443c01a7336-23e24f49430mr332444305ad.12.1753122607738;
        Mon, 21 Jul 2025 11:30:07 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef4b8sm61414545ad.194.2025.07.21.11.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:30:07 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 23:58:55 +0530
Subject: [PATCH v12 8/8] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-arm-psci-system_reset2-vendor-reboots-v12-8-87bac3ec422e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753122539; l=8348;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=WRonUOFFWFBCm1rQa5vJx+BF5lvxtARn9QwJcpcG7rc=;
 b=9+F1OboddRi/w7XhvUe0uUkbbtNToE1ZUmtWBNgqJFlLCQJTdSKDU8SJT9yHw4UaPJOQlMa+H
 49ExLAETNSpBfJ+T/ydBKw6NwtFqX4kK7Hc9yXeVs1ZEly2/24D38Vj
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE2NCBTYWx0ZWRfX6rBTde0z6XsB
 8u3CDdLGxPS8yaqn5XF6HWr4g2+sKntL44HrYFJFLfiz9pn266G3DHm4iqK8tH30HFoVfCoFpzE
 +2vGMh3yxci0SdD3chXWbX6gY7xqf3FE/vUApeDht/rUtJpCleLjbSuRzHzqSryYJosNdfiMAEX
 nCIuDQc0dj1Mf99tmq90YyPcfTWwDd9d2c3K+gGeDOEMI4VjgkK70cJx98ynX6nF+AiinHFhL+f
 m9RyqJqif39HK3EsDixnTzdCEVvJ2d/nRit4lq7FjuKK9UwWmZ6yWxWafmg3wGW8VtOd0+6edkN
 qNUOffZfRr8Vnl3YQ3MgOICenF2Cb9nB/rJAWyxgBnSYVHX1HrhJK75r9/UXZH/XRuW3VV71gak
 kbxHgnJ8+y9/kSB7mzWE3TIT4hGysOpxNT+z/h4hqWY1KXJv2z2DUQLdf8I4ln1gCLvOPsi1
X-Proofpoint-ORIG-GUID: XqYvc2JB6wWUZkpWX0pzW0EdrLMNOY7R
X-Proofpoint-GUID: XqYvc2JB6wWUZkpWX0pzW0EdrLMNOY7R
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687e8731 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=K9ZbaieeY_mUnl2nlUwA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
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
X-CRM114-CacheID: sfid-20250721_113010_792536_7A71091B 
X-CRM114-Status: GOOD (  32.31  )
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
 .../testing/sysfs-class-reboot-mode-reboot_modes   |  38 +++++++
 drivers/power/reset/reboot-mode.c                  | 110 +++++++++++++++++----
 include/linux/reboot-mode.h                        |   1 +
 3 files changed, 128 insertions(+), 21 deletions(-)

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
index a17851a303171fd04a47e240f80687541cc85a24..c22d296c9549a1be10523cd11bb0b77a86e53b09 100644
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
@@ -67,6 +70,83 @@ static int reboot_mode_notify(struct notifier_block *this,
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
+	mutex_lock(&reboot->rb_lock);
+	list_for_each_entry(info, &reboot->head, list) {
+		size += sprintf(buf + size, "%s,", info->mode);
+	}
+	mutex_unlock(&reboot->rb_lock);
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
+	mutex_lock(&reboot->rb_lock);
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
+		kfree_const(info->mode);
+		kfree(info);
+	}
+	mutex_unlock(&reboot->rb_lock);
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
@@ -77,7 +157,6 @@ static int reboot_mode_notify(struct notifier_block *this,
 int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np)
 {
 	struct mode_info *info;
-	struct mode_info *next;
 	struct property *prop;
 	size_t len = strlen(PREFIX);
 	u32 magic_arg1;
@@ -87,6 +166,10 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
 	if (!np)
 		return -EINVAL;
 
+	ret = create_reboot_mode_device(reboot, np->name ? np->name : "reboot-mode-dev");
+	if (ret)
+		return ret;
+
 	INIT_LIST_HEAD(&reboot->head);
 	mutex_init(&reboot->rb_lock);
 
@@ -136,13 +219,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
 	return 0;
 
 error:
-	list_for_each_entry_safe(info, next, &reboot->head, list) {
-		list_del(&info->list);
-		kfree_const(info->mode);
-		kfree(info);
-	}
-
 	mutex_unlock(&reboot->rb_lock);
+	device_unregister(reboot->reboot_dev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_register);
@@ -153,26 +231,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
  */
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
-	struct mode_info *next;
-
-	unregister_reboot_notifier(&reboot->reboot_notifier);
-
-	mutex_lock(&reboot->rb_lock);
-	list_for_each_entry_safe(info, next, &reboot->head, list) {
-		list_del(&info->list);
-		kfree_const(info->mode);
-		kfree(info);
-	}
-	mutex_unlock(&reboot->rb_lock);
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
index 370228b5161963aac1d75af752ada0e8282b1078..d5ffc36272ba776a6bca4e61356714e07a5b0501 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -7,6 +7,7 @@
 
 struct reboot_mode_driver {
 	struct device *dev;
+	struct device *reboot_dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;

-- 
2.34.1


