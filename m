Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4E4C83F1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEQrgZfA5rhK7t8SJQh+Tq/CWC0djSnOhUUgfmLwz64=; b=3jlTlM+i31aHNXTckk5dTRtO16
	u3qOUZUuvqb1UF2GE7/R2gIMgWQ3CeboapKXxK/uvUK5BElbSPhVXKGnn8r/s/0+NzLWIlo2GabE6
	yYle+WIlpWh237fB+YbGMTpOIv1ZgMMiiIjonuweWSu6IA8iypDGAEtpCzn8c7tFIOORy+AKGj6PY
	3grvDUVzRhLp+ZAel24yW4KGY36CV+5FIgxeyWkKt2JFqjxUBCfRk8tjtFAXUbW11KHX26PHZGphj
	5yNvWdKLiYf0YPFuSoPpQ0NbO/5Xa/e+ihvfIeqDJAbYHusmdd0lvsDjIJZPPPwP5vTgPxzAImCCY
	o5PiLSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZojK-0000000BVvN-3MwG;
	Thu, 10 Jul 2025 10:42:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnQ3-0000000BJsU-1OcP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:18:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1NwAT011520
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEQrgZfA5rhK7t8SJQh+Tq/CWC0djSnOhUUgfmLwz64=; b=WhW8TMTQz9Or+5Ut
	JV77FzjSJBAAEaojl+gFV7Zt/eGLI01ypAewarNdVghtsxF2oIGT3R2uBsC4Fifz
	sZXNEm7OopBVSXerUVYv7zTOkEXYpRO0bqiv5AukWGyOSFdNGBm/QrajE5LLYJKM
	dtKH00yzERyxM/vIxhFGx7QNoKPRFkRIXXVg4r5cLhNAXPMYx9UIxBKwr5x9SS4x
	axJWAO4HzKZ833OVJ8Vt0OP68tWBjTFuYcg2lr4jT+qoxOOSEe/ILATnfYIsFtvW
	uW0iOGtC3IUBiKhfuHzJBf33uzKm1hkJg3B9OANZv2zVPByDU9gF0N7j2D60IdR0
	2lv4wQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafmauh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:18:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235e1d70d67so8819415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139097; x=1752743897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEQrgZfA5rhK7t8SJQh+Tq/CWC0djSnOhUUgfmLwz64=;
        b=tCaLmobw5FE1m1q3aNUXL9CyW6OzVsdfH0pwYoQS+8npsc9grCHaAaUbXKOPCWTDw+
         ret5SfemcPUUMWcZOug3cFGwi6aMKO5EceBECUXQMxLQoD3M7Qur758Mx1f4N8xfYr2N
         1kMHeEbw+NLSbcH912vUtOuHwCat1Cm4Is1cF2NFdosSBzz77xj3mVr3WDilU3iUvAKz
         cH3JfmayRDGTSzLu3fZaCZubXqraTTvnakcaQHHVF1CYDanpp8Jo73X6C2DaZIvjFwOl
         xPycYenH2egxd2pS4qfNyQpUzVUUvpo1dxHtmcU1FM3OzRj8ZABFMi0eN/M1zPEb6ORT
         Rh8w==
X-Forwarded-Encrypted: i=1; AJvYcCWVTgH8mpqWrLVUFxgO/O16d9GR8LdA8q0mIhKHxchGtKcccfFMU9cA3Y/5ZI04qKgwY9ZIMqKI7qrX76yVbzmP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1lEbyx8s4snmBxG2wi1pleAewuF9VDhi+DGubc8+CSeGRuE5i
	hnkd1iJ4UEkVBIS8hyaredlJN3lAAEMSLP2hHKNvVzHWLxPJLlrw2durfeSJLjc9cCppFBlZTah
	XOiUSRc+NAAfbrUw0nEkySQ5exTAG1emB7zRsUgT3SjvAI+heYnckX/IPQUayjiw37TEFcOGCWF
	IpLQ==
X-Gm-Gg: ASbGnct3iuJc6RVyu9Bi6EP5fC/aDEY016mAkhkDECmJ6PiFM2EFjA21vKS9qTMQBcT
	tFKeHx4b8Wd61d+Ub+dZhqiJ7eC3LreLVrImUK3MD+YSrn6DBKkOyzoj8oMxD8dWYVxe5HMnfwf
	aGe5RIlFAuE3KXHIgM+L3yQ8e3fb7RXKU5ByBTj58uxjTBP5HaNo5Ia7tyhQ20rKtTT8V6xKx33
	Ukidm+rdi776lQIaiU3gT2qpgcXWH/xVCFJ+EQhUxP/21huLdnQDhuaciSZf/NeurLf5Es5qYY1
	V6CcIMWW9LAIwvuDoXb9PWl9ucKkxEM8Y895ml2NOyXljjIiVuLM4Y6RzxM=
X-Received: by 2002:a17:903:1103:b0:236:9d66:ff24 with SMTP id d9443c01a7336-23de480adf5mr26735195ad.8.1752139097015;
        Thu, 10 Jul 2025 02:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGJGyoIrfBA9Zxl0Ughrj3uMKfz6jdSKT0NaAjnNjMskqdtkAKMLUS8x/FzIhDGTyLMPqU7g==
X-Received: by 2002:a17:903:1103:b0:236:9d66:ff24 with SMTP id d9443c01a7336-23de480adf5mr26734395ad.8.1752139096442;
        Thu, 10 Jul 2025 02:18:16 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:18:16 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:52 +0530
Subject: [PATCH v10 10/10] power: reset: reboot-mode: Expose sysfs for
 registered arguments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-10-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=5404;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Gh0wKF8f8obJZBIFY+YXRq0mvEFaXxY4KjC0e6ESP0U=;
 b=lw/w70/5HLBy4afjvzlsoilkn9KNGxxeob32fKCnRPLyN8EQy03rSeyCWxEC8VvLFF42hMkAU
 +dipiHJKDdAD9k39uxR5AmQE0RPKWUW9koD6OoeU2qqjpwjX3QrfMdd
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686f855a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=YvCmAYiu2kffolCFmWcA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: eGHak-zMx6hLhs-ZhTj0j3qFQGonztee
X-Proofpoint-GUID: eGHak-zMx6hLhs-ZhTj0j3qFQGonztee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX3XNdUuwnNJqe
 aPbEMv+rXlFK603NwDvUZ+i9cBT8nvglBkbouT8N2+kKYlv0I2PquFh6+R85n0MQG88baofZR8w
 66Y8Lk6n4VhnTRfgtIhPmvkA+4QUJuH5KielKjQmrCmmmZbEoNwGjyuCJPF2iEK5B4m51GCZkxV
 Pf9jxxevgC9pe9mdPwORCY0yziLjFJrmHrB/dSKJvOZcmdpTKlgerwwjRLchPafVE9D9sAV6m26
 eBp2+I7px8GLJugiRlYk7Hg7vOmFkxqB+h8Vv369wbi2GtD535GiBkKSbnM7NBaeBRDl1cUqGhK
 UpJ4ODvq2RKAzXm7TmqSNdLz5UNDqZENzOp3520m2gWPtN0ucS+9FMzM4+sNSluckpoI6qXrjuo
 jPsguOo9aGa8fLXFib4wLQ9vjj51WT0yihIYUYL/J9CSZczjIV6PNZXFEjFOP15+Z8CxbFPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_021819_498566_32082064 
X-CRM114-Status: GOOD (  25.99  )
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

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 95 ++++++++++++++++++++++++++++++++++-----
 include/linux/reboot-mode.h       |  1 +
 2 files changed, 84 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index afadd823d62d0f7e7e645746b978cc8fecfb9ac4..128192d49d895beeacb180c1a92b44a5eddccc78 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -22,6 +22,8 @@ struct mode_info {
 	struct list_head list;
 };
 
+static struct class *rb_class;
+
 static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
@@ -70,6 +72,79 @@ static int reboot_mode_notify(struct notifier_block *this,
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
@@ -84,6 +159,10 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
 	size_t len = strlen(PREFIX);
 	int ret;
 
+	ret = create_reboot_mode_device(reboot, np->name ? np->name : "reboot-mode-dev");
+	if (ret)
+		return ret;
+
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
@@ -140,24 +219,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
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
index cfe18cdc2559be249969bba6c022940a508dd188..3aab8700a5961b90b07ed4d722c77484213ac6c4 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -4,6 +4,7 @@
 
 struct reboot_mode_driver {
 	struct device *dev;
+	struct device *reboot_dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
 	int (*write_with_cookie)(struct reboot_mode_driver *reboot,

-- 
2.34.1


