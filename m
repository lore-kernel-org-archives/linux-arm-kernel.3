Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A56CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrOrNsgBB4ApEJhsQnAwXueczH37teuImyTZcRxvw9s=; b=F5GmPKFn0gCYIPfDOyGQj5rMwR
	FbDjedqOKInt2CTsN9sh5Yj4sS9q+fC5nZtuxWqowzhnjN68LqIf27HxdSlJJKkCr2gP4CJNUdtgO
	S9Eqz0Rx0SYtzB0GPXXwFXsA/pLo+PqB1Ytt8gp2z7mUCdbcHSBRW535RB9THfUJwoA0XXYrkE/UA
	lPX/hX6Y05HDR5VBWqs4oyhiJY7iOy5TGB3JL3WG5GW3PyWkj7DnCBl0CKZ/OlMyh02cwb/27BA9b
	wHy8r66YlD03e/4T9PhwK3HFqDkSGjU5cMZ+GYIfShZZSSeIGPNALA33mZ2M/1IUEfb5eLtpgDGtH
	xfZE+ywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tI6-00000000RBG-0FeQ;
	Wed, 15 Oct 2025 04:39:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tI2-00000000R8p-0YN4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:39:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s7Ua003992
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WrOrNsgBB4ApEJhsQnAwXueczH37teuImyTZcRxvw9s=; b=eVbfbNGpU8zcYAVW
	GPz0AtqXtTw8qfqAx3aL6Gm1Ykkra8Wn2LmzG/Yj7U5FXmjlxhSnUsRFKXOBJUXP
	ckd01ra9HbgNQIuDezYW37K/GDAFPHQHDDsoWaCn7NeDYZdhVOBnOVcTs6Hhd50w
	Lu4fQDgLXKmvTRsU4xrFP1e0Ephu627Bbz1ydWEGF8oMZ6trnoHIoksHMOgnez4k
	L8J/vLGAy6XmLlkwOpA4r9tMwxEQtTOraRk93FvA91WDUHUUvy0DMLhn9OHjdadt
	Pav32PCq8hldiokCuePYRsM88Xfcl01/BPDwEOvwudFwcAkUoMblnL5uELtxIBMH
	jA9kig==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwnbra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:39:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b63038a6350so370428a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503145; x=1761107945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WrOrNsgBB4ApEJhsQnAwXueczH37teuImyTZcRxvw9s=;
        b=xIYR3/eTL0YTtq50hlXni/oHim5oGx47iJXKT82SQJq4qwZCVDmjdIbW3u5J8IV4p0
         AoqDR6KyxMs83sKymIPCle3sUREqmMm9Ha50yJgnht2ZuoVbegQbjJqagsvIDpbIahRS
         tN1R2gxY8yehBSvYdfmh1mlu2UDqYBNQs6hg518bxKgG+E6eP/SK01lTafHcs8DwLZ3D
         odACnQB5So0kAjPDv2FJr+h/Q26eKUEve01jvCL4UOIYucq5E431sKhv1IxRem25+90r
         YQ9HibU8kHgC/j19uUYv8JMWH9co0I1+ti30iD8mpAnzwCKKgj2oqRhvip0CBcn5mGPl
         p5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs3lfUeeq2zfrdwRQL+n/MPisTNp1ievMZjzllSp3bp0rlwHrtFj3v3zHkgrIGmIMQD2KLfwlX3sl4zK9bQj8S@lists.infradead.org
X-Gm-Message-State: AOJu0YzyOXAhdxtQcV4JX/m/E7Rg4e936Ip4Rsaou7xZJAFrt8I2/d1x
	d6Rs7a3GaFG1vaEicWrsrIdBgASEXUfXa138yzCwJcIgaBijFLV+OtS0F+MJHnDqgUXyth4h7kf
	IusBmWJ9XwQ+FbBEPzBTveWoUqJ4xLjet5HWdFMNcFIYHW8nCPZDjFnl0T1HwGK1Q1UwO+IhgK2
	tgrQ==
X-Gm-Gg: ASbGncvadj8DQ1v74U7YqoGtfEedAuQTJKpYcvkLydo7VCrXdo0gfbNmW+ZDUlMsBdi
	Xw4UCCrJs8Dxok3SauNoa7SVGDW+xnMilgZosR6esMXJiKAb6388O1na7oQQlmF6lFW3FH6IZmR
	JdYGVmb/WgPhamTX2qbOX26zNQbX+bFX106JIHef1/243iODQi2NRirY3fgXSwgTGbMJOgZEo4F
	e2EQxAuFUZAd+otEShMEabwEePMabyBqXnDPoiV08JkXM90xVwgijK3F5cU80mqh4Kz6ntF24lD
	JaSH5DegqX+xhqLyO6nEwzYN/SekNyAZ7/Bcn6NlL6zWPjn6tfP8lp4QSzkfJP+roas8VH7232W
	S
X-Received: by 2002:a05:6a20:430e:b0:334:8d0b:664e with SMTP id adf61e73a8af0-3348d0b691fmr161608637.19.1760503144572;
        Tue, 14 Oct 2025 21:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED3KT6iJOHB0QR97LJwnEFVWmCUIRvccoaecK/jxZmN5wve0OZM1pA9n7IiCA/VdzfV9Ya8A==
X-Received: by 2002:a05:6a20:430e:b0:334:8d0b:664e with SMTP id adf61e73a8af0-3348d0b691fmr161571637.19.1760503144066;
        Tue, 14 Oct 2025 21:39:04 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:39:03 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:18 +0530
Subject: [PATCH v16 03/14] power: reset: reboot-mode: Add support for 64
 bit magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-3-b98aedaa23ee@oss.qualcomm.com>
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
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=7035;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=KFgiW8gV17tkLoapLwqyOAY0szRkrPgc6e7FXqmO8tM=;
 b=vYHU640Y16ueIfSEsXx9ZkAmLg1yZeeXz7AhUc80IUcqyjYAZTjRXXEIYxLt2wTSBgb409YGb
 BVxS6XyIC9+BBxWrgO988e22RQvhoJmf3T+IfiQZrnY/PapgeZ/Ej/7
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX946q3++LaOHN
 P1P/kbO35vgCEsFIqM8VxeoE0CqkNLRmdpTPousTY2AjuVRCF9c+bxzg2SOqYvmaPwlBII4MKNh
 y9ZY6zmb1xk3yLdLM1tbtCwOdMs0+pdCKAA7Paiqn2v4sVBjNFvOJWVs5nCm8U+t0WkESI9Mo3P
 0p+IF7YPpacXLOzeRvh7ikptwI3JQbYnnR3VaYGcIhHRXW3PdHypzqfD0CoeEYCnx+jaXGT9f9c
 Lva3ukjS28crNSHeQlE5Fyi/7ojOnJ6OblpRFWK/vUd1ME1i8U1496ELOaZDTJAvrCmjPaIvQsE
 VzgFwNQgADxAVkHV2F0uG5d84zLp8y0MNGxrZadghgN9crI7nyuN+ijxXRGuTIpndLy/n6QMrdg
 CasBtmlt/+07ngc8jXCeXxq3tNrDyw==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ef2569 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bqVjg2-MoX4cBg1ZSeQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: -2VRF8UvKbxDDcBPVLVTOX8y6_XFIP5K
X-Proofpoint-ORIG-GUID: -2VRF8UvKbxDDcBPVLVTOX8y6_XFIP5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_213906_179189_6D5CA903 
X-CRM114-Status: GOOD (  23.67  )
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

Current reboot-mode supports a single 32-bit argument for any
supported mode. Some reboot-mode based drivers may require
passing two independent 32-bit arguments during a reboot
sequence, for uses-cases, where a mode requires an additional
argument. Such drivers may not be able to use the reboot-mode
driver. For example, ARM PSCI vendor-specific resets, need two
arguments for its operation – reset_type and cookie, to complete
the reset operation. If a driver wants to implement this
firmware-based reset, it cannot use reboot-mode framework.

Introduce 64-bit magic values in reboot-mode driver to
accommodate dual 32-bit arguments when specified via device tree.
In cases, where no second argument is passed from device tree,
keep the upper 32-bit of magic un-changed(0) to maintain backward
compatibility.

Update the current drivers using reboot-mode for a 64-bit magic
value.

Reviewed-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  | 13 +++++++++----
 drivers/power/reset/qcom-pon.c           | 11 ++++++++---
 drivers/power/reset/reboot-mode.c        | 19 +++++++++++++------
 drivers/power/reset/syscon-reboot-mode.c | 11 ++++++++---
 include/linux/reboot-mode.h              |  3 ++-
 5 files changed, 40 insertions(+), 17 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index 41530b70cfc48c2a83fbbd96f523d5816960a0d1..5d73dde585b1fd438b1847f884feb37cd9e4dd5c 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -16,15 +16,20 @@ struct nvmem_reboot_mode {
 	struct nvmem_cell *cell;
 };
 
-static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
-	int ret;
 	struct nvmem_reboot_mode *nvmem_rbm;
+	u32 magic_32;
+	int ret;
+
+	if (magic > U32_MAX)
+		return -EINVAL;
+
+	magic_32 = magic;
 
 	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
 
-	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, sizeof(magic));
+	ret = nvmem_cell_write(nvmem_rbm->cell, &magic_32, sizeof(magic_32));
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 7e108982a582e8243c5c806bd4a793646b87189f..d0ed9431a02313a7bbaa93743c16fa1ae713ddfe 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -27,17 +27,22 @@ struct qcom_pon {
 	long reason_shift;
 };
 
-static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct qcom_pon *pon = container_of
 			(reboot, struct qcom_pon, reboot_mode);
+	u32 magic_32;
 	int ret;
 
+	if (magic > U32_MAX || (magic << pon->reason_shift) > U32_MAX)
+		return -EINVAL;
+
+	magic_32 = magic << pon->reason_shift;
+
 	ret = regmap_update_bits(pon->regmap,
 				 pon->baseaddr + PON_SOFT_RB_SPARE,
 				 GENMASK(7, pon->reason_shift),
-				 magic << pon->reason_shift);
+				 magic_32);
 	if (ret < 0)
 		dev_err(pon->dev, "update reboot mode bits failed\n");
 
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index c8f71e6f661ae14eb72bdcb1f412cd05faee3dd9..79763a839c9b0161b4acb6afb625f50a880971cc 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -19,12 +19,11 @@
 
 struct mode_info {
 	const char *mode;
-	u32 magic;
+	u64 magic;
 	struct list_head list;
 };
 
-static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
-					  const char *cmd)
+static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
 	struct mode_info *info;
@@ -60,7 +59,7 @@ static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	u64 magic;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
 	magic = get_reboot_mode_magic(reboot, cmd);
@@ -84,6 +83,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
 	struct device_node *np;
 	struct property *prop;
 	size_t len = strlen(PREFIX);
+	u32 magic_arg1;
+	u32 magic_arg2;
 	int ret;
 
 	if (!fwnode)
@@ -108,12 +109,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
 				goto error;
 			}
 
-			if (of_property_read_u32(np, prop->name, &info->magic)) {
-				pr_err("reboot mode %s without magic number\n", info->mode);
+			if (of_property_read_u32(np, prop->name, &magic_arg1)) {
+				pr_err("reboot mode without magic number\n");
 				kfree(info);
 				continue;
 			}
 
+			if (of_property_read_u32_index(np, prop->name, 1, &magic_arg2))
+				magic_arg2 = 0;
+
+			info->magic = magic_arg2;
+			info->magic = (info->magic << 32) | magic_arg1;
+
 			info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 			if (!info->mode) {
 				ret =  -ENOMEM;
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..3cbd000c512239b12ec51987e900d260540a9dea 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -20,16 +20,21 @@ struct syscon_reboot_mode {
 	u32 mask;
 };
 
-static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
-				    unsigned int magic)
+static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
 {
 	struct syscon_reboot_mode *syscon_rbm;
+	u32 magic_32;
 	int ret;
 
+	if (magic > U32_MAX)
+		return -EINVAL;
+
+	magic_32 = magic;
+
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
-				 syscon_rbm->mask, magic);
+				 syscon_rbm->mask, magic_32);
 	if (ret < 0)
 		dev_err(reboot->dev, "update reboot mode bits failed\n");
 
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 7f05fd873e95ca8249bc167c21aa6b76faba7849..3a14df2ddd1db4181ea76f99ef447ed8368a3594 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -4,11 +4,12 @@
 
 #include <linux/fwnode.h>
 #include <linux/mutex.h>
+#include <linux/types.h>
 
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
-	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
+	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 	/*Protects access to reboot mode list*/
 	struct mutex rb_lock;

-- 
2.34.1


