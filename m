Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812A8CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 14:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHiUGzt7WA5d+ZZv2cAEdOLPNuf+lkNI7THaM5BmfBE=; b=t08sKGW+xugt2Gh9WcLQklzwR6
	F30bDfj3YMiHah2KGdO/eMaV/uR7wgZwQyKvV3PM3vfu4Q6BoNxWihZdzzFoc2kdenUglZms0g33K
	oaJszlc7L9InxCih2J3pRCU8QRzpYrf4DuFSKmqpH0MkX8TtgFPKVyXvtLbtWqWqH+CaEezpw1hLf
	NtRWsRPw0Otyfaave+3mz558unid/WmHUtk02t84Iwm5spDLhS1K2eH3tKiep3gNhjnBk6jxv8dsa
	w9USqHbmkvATCHY+UnSNYvftOaA3cIcYPWjuwENJf6U4+ztLdOQAD1S1UYFR/V8RLZCDXorcPe69V
	J8TcaG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6ZA-0000000453k-26bV;
	Sun, 09 Nov 2025 14:38:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Z7-0000000451r-3BBc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 14:38:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9ERXrn808763
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Nov 2025 14:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PHiUGzt7WA5d+ZZv2cAEdOLPNuf+lkNI7THaM5BmfBE=; b=Z/frQ9Ff9WvMicSf
	jXePQiSoQ2DCGdI57w/z4ylqCylDODHu4P11/CPUpUTBVhxa6lqXX24xUWKEVNei
	K28GJrz+2qUR4jSnU81xzsyG8e4ey3To1iSlmFaU7sm/p2pP7OvPx2Le9QYB4WkS
	g7O9mdU0ZY+W6FsN19wOfeD/ylwHROcMZPsXTGluKMA1dExpOw7dtyLpqDj3hdr1
	BfR/F6FxZxnTWQ9xQhVF3x/DdZvqVUsFXDPprIC2voHF5/aPTbHaqIvSKdYi2a4w
	8ViGj/xyE+eyU4bzexf/YfLdClCKkLAaNzK6mJq2yRET2pBzKbeHJ4uYPW7KQ3R2
	UKLBcA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aaue0g3ea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:38:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-342701608e2so2679843a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 06:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699128; x=1763303928; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHiUGzt7WA5d+ZZv2cAEdOLPNuf+lkNI7THaM5BmfBE=;
        b=ie9N1SHHXFkHqk0tsKJMrEAj3rEEtdYjhENUzYEfcqqmhmKn5Fhlo4x2XFCfJ6tISI
         YPK6WW4c91/aP2TonnnvsWH/xrUhRqKcLTUWz+QtvcOoomtzBL+9NjfJGRhw6WkAqef3
         4butzzgQr3yLh7u1XQF9ylw8OzjRJ6e1LkteCIzGzHPOLRjkejhn1PDjhD90kbCjdOEJ
         GVGn6EeSns27pJw2nShQxccWveTFVcHkmYPoKoshzMTWVXFFuc0kANb57m0FBnOJArHl
         srK0U26c/SzHTFxWn33k1pbQRTggkRGI0PaszPXqY6EBwykVP2GNWJQX2EVVM7GCRV1/
         5Xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699128; x=1763303928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHiUGzt7WA5d+ZZv2cAEdOLPNuf+lkNI7THaM5BmfBE=;
        b=le987ahtRgy4T/+wXCfKFcqpolmAeGtKqA53PxVR+vU8dKdlcsZ++1Q6YnvTx+RSUi
         zTQuESPK4ILWQeNBD9f3ggCru+wlmKJNzQpG+dmqNa3edvqmhGNu5dE8qL6ccyXhNe9q
         YpsUGgwvIECBOR7QHEf1qpRlD4CP/TWJDnTNZxaLQJNtujKex7lqmlH+A+P4gWJKViVE
         1HxcPJPrZhso6MpOi/+c1AlNqfgcOBmlnIEu1Szx/tZtqpW6qef7bw8oBHQCK9r7zgsL
         8PaUk9jhJPBZ/1fAnbpcZIaa5y+WaNh2MMIk/lzM7TbxhVdqoIg9sNjWN9pDMDc4ZmNZ
         aa6A==
X-Forwarded-Encrypted: i=1; AJvYcCXC4xjDycwYDNZfcrJfvD/rAtWUpAC3bQ8qnPY+SpED9zOexW4fHHprVC2W5zb155wGYpQBXg5p7WerXlmUiwYs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4qWyYgzq3F1yCVab8Yq1TiMdG7qr6oUSN6eftLfKYdrJMqUUZ
	OdsaLsVjCIhTDyPVymnfIW5Bku7zXY86wU2EzrtGGc7IgfxzBOQCJe6jCPzfTwIovzmFgzugLmD
	TJsS21FlqGIZ3rMKTFeItRPjAB/ByDnDjIzQAEigodP0uaWpff9GvuXatTYbiRqVj2cKA9eySeL
	kB9w==
X-Gm-Gg: ASbGncu3zfmfkkRHQI5Y5jXOzYIy/45HG++fsHyBXIwLSK9PhdbLD1m2qhwqtx8Gb2H
	30bUOMaU6mOWuchEl5aGgVzaaL8rlMgsVKWnKSg6uDDgswlrVjVsX7P2XKC5uO6c8NBAEEom9cD
	GAdXwLMkVQKWhxwJRoDcsQXV570aa/0xo+4uhhKqoBXnO33vZAqK85VsjM4inQuTFrF7X7xj8YH
	kXYhPcrA/h3Uy3E40hIsTN9HhalAYZQMmW23tGTE6m6nNWLe2GIBcdqoc56zeh9n6sJs0EQfEi7
	4MXt3sN+YT3csnMFSw2JB35L9gNubTHgswwHKC3HyK4S9HdjRUVfQLGfiV3PG3xN4TciiUILmWI
	V2qqM37jrUwHNngSriI4bMo/xMiAi+qp1ZbI=
X-Received: by 2002:a17:90a:bf11:b0:343:7714:4ca6 with SMTP id 98e67ed59e1d1-34377144d90mr3756505a91.22.1762699127684;
        Sun, 09 Nov 2025 06:38:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJi8IG6JcT7AZMHFUMvIpgZqX/jl5jfBcQHPdOcQ8sjNa1J3m8dUnVgXFrv/h62wi7ogujmw==
X-Received: by 2002:a17:90a:bf11:b0:343:7714:4ca6 with SMTP id 98e67ed59e1d1-34377144d90mr3756460a91.22.1762699127112;
        Sun, 09 Nov 2025 06:38:47 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:38:46 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:18 +0530
Subject: [PATCH v17 05/12] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-5-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
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
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=5178;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=p8VTlQ3pXarRYayw8UBrYcTj+4OjWYYKSpMSZeU0bPM=;
 b=MD9m7lTEeVEibrUjikce7zPcaS1semLkXOkrguR66wGJvIqOv+EHyzaYktJlvdV2jDw8VWpxB
 tIqnoN5SuPkBCmyCv5QcKTnCU5JaIMN/Q1g3pDkebYFGBmrGkIioukZ
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: CITKkAfq6ozBaMJuZtwITvvV8HaclI-s
X-Authority-Analysis: v=2.4 cv=BfDVE7t2 c=1 sm=1 tr=0 ts=6910a778 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ogmrOWMnV0kDla0zgWoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: CITKkAfq6ozBaMJuZtwITvvV8HaclI-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX8Po3yYDrWCaB
 AkrUZHtgGPhDArDS9O4/OQIkWCR+MXJ1JK+vTZlGK2ZrRO/PJzcsiZ68h2XwWyoPwDrch13v1tE
 3lA18zRvaKE4Ae0K/1uTvdT4CndeqYf52P9CiwV3xwJvx/rTCmp4H5CWXcFuwd2qWgYFAG7Zxl8
 yHQhebUQabEGJdPXv2tm90ZMeRInPWIjmN1FmoIxJsqYxh9j0eEwvV8kgUuJQqL1DZT/Y16S1OU
 iOk8EdP/hm1gk4jriZnJHMQUNDMLWsJ7F4usuknNgWg4R3kONY6Tkob1OAHzz9GwC5MEBig6aOJ
 dQ0a2p6Fg/u23/3C06oL20d5A5DnsXWLnwFGDmBWGvE37fJssIcYChFS6tOXoz5wQL5jIJsIR/E
 OphnNG3rCOlqRce1gW4EoJhf0FC39g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_063849_927652_250DCC27 
X-CRM114-Status: GOOD (  24.99  )
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

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 62 ++++++++++++++++++++++++++++++++++++++-
 include/linux/reboot-mode.h       |  2 ++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 873ac45cd7659b214b7c21958f580ca381e0a63d..582aa7f8ed7fa485c5a67877558c9b15d3600ef4 100644
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
@@ -65,6 +68,51 @@ static int reboot_mode_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct reboot_mode_driver *reboot;
+	struct mode_info *info;
+	ssize_t size = 0;
+
+	reboot = (struct reboot_mode_driver *)dev_get_drvdata(dev);
+	if (!reboot)
+		return -ENODATA;
+
+	list_for_each_entry(info, &reboot->head, list)
+		size += sysfs_emit_at(buf, size, "%s ", info->mode);
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
+static int create_reboot_mode_device(struct reboot_mode_driver *reboot)
+{
+	int ret = 0;
+
+	if (!rb_class) {
+		rb_class = class_create("reboot-mode");
+		if (IS_ERR(rb_class))
+			return PTR_ERR(rb_class);
+	}
+
+	reboot->reboot_dev = device_create(rb_class, NULL, 0, (void *)reboot, reboot->driver_name);
+	if (IS_ERR(reboot->reboot_dev))
+		return PTR_ERR(reboot->reboot_dev);
+
+	ret = device_create_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+	if (ret) {
+		device_unregister(reboot->reboot_dev);
+		return ret;
+	}
+
+	return ret;
+}
+
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
@@ -83,13 +131,17 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
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
 
 	for_each_property_of_node(np, prop) {
@@ -142,6 +194,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
 		kfree(info);
 	}
 
+	device_remove_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+	device_unregister(reboot->reboot_dev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_register);
@@ -155,6 +209,9 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 	struct mode_info *info;
 	struct mode_info *next;
 
+	if (!reboot->reboot_dev)
+		return -EINVAL;
+
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
 	list_for_each_entry_safe(info, next, &reboot->head, list) {
@@ -163,6 +220,8 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 		kfree(info);
 	}
 
+	device_remove_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+	device_unregister(reboot->reboot_dev);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_unregister);
@@ -192,6 +251,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
+	reboot->driver_name = reboot->dev->driver->name;
 	rc = reboot_mode_register(reboot, of_fwnode_handle(reboot->dev->of_node));
 	if (rc) {
 		devres_free(dr);
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index e0d3e8a54050a76f26846f456120b4c7e371d284..81c149edf40fbcf0d3427c2e12eb415199cb153b 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -7,6 +7,8 @@
 
 struct reboot_mode_driver {
 	struct device *dev;
+	struct device *reboot_dev;
+	const char *driver_name;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;

-- 
2.34.1


