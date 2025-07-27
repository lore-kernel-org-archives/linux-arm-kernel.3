Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC316C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjg+v7QmECaMK4O0WsmDewSJVWQyUa1xzMTrttC4DDk=; b=QmX0vE2Z4N9Ed2zQa9ky7DykbT
	NDW8+AYbpTu8gnais7B4zk/iRwV2Te/3D2YrmVXvuKthJSMw6v45VAlXwsQrnxCOxdRNunWhgqVOh
	ZVG9Vn6mWOT/fMi5a+suy+OxuEAqCFC40gi+UO0Ew4lcsTkIyjJtqY8WLAEVAvXVSm/eDFvFOSTIx
	elQYweztw6tdgPMOip+ALMdzKUN8mvpjT7NocFID+Ma/Nhh9guMOWn2f7URw2tJNbUnnXUzRnhdD7
	Ivn83bpqOZzMslpYVFuw92EbMLqUNMRYBKDQvZmv+7WYT/4Ti3QldZbIjn627cDBElDtbxRePNNN7
	A9Up5QKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4QS-0000000Cws1-2caa;
	Sun, 27 Jul 2025 16:40:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4C0-0000000CvGy-1Lui
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 16:25:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RFR04d001396
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjg+v7QmECaMK4O0WsmDewSJVWQyUa1xzMTrttC4DDk=; b=enerPKAIDY9iQur+
	upaFxsO25ySiMDPy3qQArSQxC+I2irkVoo4+2300XOd9qzQ2YHaeA81CvKi4ZX69
	9L9Z/yGrQhgbhK7E4/XYg/GNIyii7W1W+JHQ+TbjrH+HXyDTQao2CmA9I3RpZGjP
	8zsTgesorYKkKON7WCPI3HcPdaEXaYMdAzN9k0OPhpMRwQRsBzrUkl59I8yA7gOo
	J82r72GwebN3IZ4cC3nFZ4MJBHUOzD8Y9BSyncgK01e+ApQzwvZ7LuX7hZNyiKr0
	fo36EHW/rQhN5HKdkngLyzTYLZtbVY+KdT95Ua9wRa5jPzLkFmmEgkdQ8x6jA0Aj
	dVyQWw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qd9tarr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f77f86f6so37264985ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 09:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633542; x=1754238342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjg+v7QmECaMK4O0WsmDewSJVWQyUa1xzMTrttC4DDk=;
        b=o5nyxywE48v4q0r3Cod3K6mfs90HYflmvF52YLKQwJYgcgvT+wJ9bTAV3HF/V3uUY+
         xNMNP8RpqwwRn4zIe9A6U3BskhveUN0vhGGLrW2FcqjfPqsmR56KBu66EEQPqwotA9UJ
         ozovJ3aEYUydulymazelMG8PgMA2xHzjQCbl923OZaWH7LrIUatGZzANOLRXqHnZ6qk7
         nDFUN45FHUm6CEM3XX3/bsjwm/1cGQXMzAkwtmwPPJ/+EWES8Rzk/+6InaTdl3T5Ia1y
         YQJNdsm2Zn/pYnK9VAcAWFw7EKxUBYBXad0LHjZpZ3mS+T8pJta33ocT6WkaA3wS/Sci
         jZbg==
X-Forwarded-Encrypted: i=1; AJvYcCUqRqS35+Ar+209VloxjY80M6n8eQSqiuhgH2phKCECD1byVInBppLoneH+L3PbjiULJb9dejgvn/U7IqijiGMz@lists.infradead.org
X-Gm-Message-State: AOJu0YwGnIQcxLMffiWt661c8lU+2NQfN/iB+wiqU1PruXu42BXUGKm8
	qsKVZP82uSuUCQsv/MeyeY13BrHx4INRbss42BSdWyt5vWKH8d5j/ayEP3Bk9KXtLa/vvi0nSEG
	GzgbrhxliaSgXeOqo26iD2s2m9bPV18TL3syt6OyzXCto5TpuL2s9c1l4c/Mj7RIU8eDbvLLeLm
	xVkg==
X-Gm-Gg: ASbGncuSWODURhOsJjxj5C8nmpvsgkVRMIntWpXLnGdaGlAd1gAmzn/4Z+2c0sXksSF
	ZU9xqEe3Js55KwWplDv2XuJb3EqFiCCa0Rsnm2AXpAX9Bh/U2/dzFBc3CRUGNaYHPYwYBQWOxFu
	f1bR1M8iy9Er1JfQDn3ctglHpgqYJUeLMY50Y+wSeO4B+0vjOsBRqBFkWi/XrDlrPpTgPYCrhSo
	f9DCcO0VKI36gk+o8aoDhFoAWt+7RY4ZSQiMt+0LioaZIx11WfT6k6KJ9w+GLTU1WHKx4TU0Cp0
	7A6aQVlXa7YmvRdPJkY7qI5R6j5gLw5xxkE0yk0LXBw+Wu94ssUVEC6yF6vb4rPM5wZPJse0dn+
	T
X-Received: by 2002:a17:902:d4d2:b0:240:11cd:8502 with SMTP id d9443c01a7336-24011cd8924mr21873935ad.13.1753633541686;
        Sun, 27 Jul 2025 09:25:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF64zD926zPgoLnZHbfxHUg9o9btJVPhQIA8eXNOi4vpCwnfXohmuBfaMQGx77pfDBk/lpsfA==
X-Received: by 2002:a17:902:d4d2:b0:240:11cd:8502 with SMTP id d9443c01a7336-24011cd8924mr21873545ad.13.1753633541102;
        Sun, 27 Jul 2025 09:25:41 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:25:40 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:48 +0530
Subject: [PATCH v13 05/10] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-5-6b8d23315898@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
In-Reply-To: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=7789;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=UwAuk0mKb9rcWWrnqsEINzklGj3BCiY6oFtAQLs8bEM=;
 b=5nCCrPxu1hs4B4gaNuJable+RSLEjWkwStVjMUm8ziF5OEvY3BzxS5O31XsXPhhUfGLthjPmW
 eujejMPAi+jAogRbdwDQd0+i/4GzTqmLR3CE7VsSLtixoLYokKDmMLb
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: wJJMfrQ1oOrQA4eWSUMzj9aJChxcnIHP
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=68865307 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=I4qJSSq-i-5ETPqSmjYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: wJJMfrQ1oOrQA4eWSUMzj9aJChxcnIHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NCBTYWx0ZWRfX4s39vcDyaeO/
 s6GE/O9XxfG1gZRbrjDtv9VvJPmRIRnUCbkHKVqtn5AuE/OxslITVzZ5m4WrqEFeBWYD6nSAnFf
 wlHRMEPH03Yru34US3KJyyS+EGWeABuQ87Oisn1DVSC7UwuW/wv4cuFmYV6fj+9mn2DGoJ5YXXN
 56eMKTVisQMux2qVpNftCBpoHciZFiRFJFH/okhJcoIMZnao12ZT4S4B6ogoddkmMnLnnlfSEx4
 vGorsnwVitF8n/mrZNPvfYo76zvOEWa84mgCn5i6eAHJqiVdIS+pOkChsB3GNvoeMBiwUpAZJwf
 FztbGnmQlRi6ykJtSv727Owrq+S6pHEAbKSUE5OxoSdd98KsBHeAYXMN64uIi9vO6lwuFGwa03y
 o6TISWF4O0Yvg2cOmVo84SyQqRJnW6ufZyybLgzSeCpOfWNYnehmnxHX0aKNr99oep+TFIDw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_092544_501141_5E1AC657 
X-CRM114-Status: GOOD (  28.01  )
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

Provision the register function with an additional parameter to
get an explicit driver_name. Create the device using this
driver_name. For platform drivers, use the driver_name configured
in dev node.

This results in the creation of:
  /sys/class/reboot-mode/<driver>/reboot_modes

This read-only sysfs file will exposes the list of supported
reboot modes arguments provided by the driver, enabling userspace
to query the list of arguments.

Align the clean up path to maintain backward compatibility for
existing reboot-mode based drivers.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 126 ++++++++++++++++++++++++++++++--------
 include/linux/reboot-mode.h       |   4 +-
 2 files changed, 105 insertions(+), 25 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index ac81b8b0a9b7fc31f8ef21024333a050087ce90f..4c23ff912fc6afbc6949bfdd6607781eccb4e85e 100644
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
@@ -75,26 +78,116 @@ static int reboot_mode_notify(struct notifier_block *this,
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
+	device_remove_file(reboot->reboot_dev, &dev_attr_reboot_modes);
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
  * @np: Pointer to device tree node
+ * @driver_name: Name to use when exposing the sysfs interface
+ *
+ * Registers a reboot mode driver and sets up its sysfs entries
+ * under /sys/class/reboot-mode/<driver_name>/ to allow userspace
+ * interaction with available reboot modes. The DT node is used
+ * for parsing reboot-mode arguments.
  *
  * Returns: 0 on success or a negative error code on failure.
  */
-int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np)
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np,
+			 const char *driver_name)
 {
 	struct mode_info *info;
-	struct mode_info *next;
 	struct property *prop;
 	size_t len = strlen(PREFIX);
 	u32 magic_arg1;
 	u32 magic_arg2;
 	int ret;
 
-	if (!np)
+	if (!np || !driver_name)
 		return -EINVAL;
 
+	ret = create_reboot_mode_device(reboot, driver_name);
+	if (ret)
+		return ret;
+
 	INIT_LIST_HEAD(&reboot->head);
 	mutex_init(&reboot->rb_lock);
 
@@ -144,13 +237,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
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
@@ -161,26 +249,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
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
@@ -200,7 +278,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
-	rc = reboot_mode_register(reboot, reboot->dev->of_node);
+	rc = reboot_mode_register(reboot, reboot->dev->of_node, reboot->dev->driver->name);
 	if (rc) {
 		devres_free(dr);
 		return rc;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 370228b5161963aac1d75af752ada0e8282b1078..0b9844a71224b3e4bcc0d1e396d6c9cb11ad8c97 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -7,6 +7,7 @@
 
 struct reboot_mode_driver {
 	struct device *dev;
+	struct device *reboot_dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
@@ -14,7 +15,8 @@ struct reboot_mode_driver {
 	struct mutex rb_lock;
 };
 
-int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np,
+			 const char *driver_name);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);

-- 
2.34.1


