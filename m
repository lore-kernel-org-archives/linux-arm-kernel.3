Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D865C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 16:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nz/boegyCEkxuIz7kRr7NgSo8XrC5KjpUvLZlqKGYvs=; b=R6J+iimMPLmWgFpc88fvRIxlI/
	JKYXLXldX2Sp72p+aowVBONSoc/BjfSeiVjOT8HxSidUpnX7269RigzwKoTO6oFsiteq6Xl3qHC2a
	nqyCFY4bGxDzqEAzqahvb5QJvimRYekNfBR5MIiOq29T7PXb71LcTV1Oa5kqzW5d8dt1Svzp4bHok
	TGxowNT5sCoGp5pYBW7ibLsQJOXDbbnXkcU2wmw5s/1EBiOryLy4QiFNfuBWrQ798Nnb04pgYOnRr
	MqY4V/w2IeL4KaTkMTQC6vW1zeY7Ps2isub2Jy85E4drx04tEJJr/VcfFQB4Uon8xP7jLO6rxg/UX
	qQaNInxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4LS-0000000CwLx-44ON;
	Sun, 27 Jul 2025 16:35:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4Bk-0000000CvCf-0JOH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 16:25:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RFU2vv018259
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nz/boegyCEkxuIz7kRr7NgSo8XrC5KjpUvLZlqKGYvs=; b=psFPyugQu8PfrMwL
	GKhB2/DTMk/Z9JKf6x6arpEJ/ynffGL2R/5dneTvY4n/HO1M8F9dtccnzOpLiSYv
	guHpMb+cVTVbhtljACXcNC4gyl7NOpXsQrr+3i6qGcn54HPkuKi7HGGjdwjdatCo
	TW/fkp+bk3OfJNLIInNXK9oo2lOpcqKUx8+W8KwjWJRJRR1quZFTWR8L0gjN/BaP
	vLUqEAzGmVG2H2C4q4i2nTV80svCO5DIIo7wAl+XvpEUO5SrsrO+Y2bHFiuoMugK
	UVLPnTWeyA+LFEuB4HZWAbedp5068tTa+I9YaKmRjvjsYrOZESo20g1iI7aG9k9a
	YbyMTg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484racj9jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235eefe6a8fso28064905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 09:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633526; x=1754238326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nz/boegyCEkxuIz7kRr7NgSo8XrC5KjpUvLZlqKGYvs=;
        b=FeIWxAf9HEcdSCcMRlZLvUZHsAauiFFQNwbO1vaE7S/OdZ5DZ3gYxhOekAY+b2VxiL
         1ZcDrNxP/DSDCQK09ZVSbbr1KflrsOPlnOWzPepgLVZVnsNUHXUdNYKnMZc4UP0nvj/l
         LVqSDo3MZ+tCHD7cSA7ZB/l0YcS3aXBB97IB6lyBVz6fT5AXCMah8l97OQrS/NEoEnnh
         R9baMtDDs6U6YprresS4LV4UpyuJmppGoJ4AB5YJnYfckh8LQTTj2/2Cl/NWK/sUhMd3
         4HlxsYxzcOUxIglCepmEGNf7i5hzIAuIpZEq35mRvANT3Yz5oOUu/P4MRXTdFPkylvfz
         4uJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVdnq7B+GEcvdAQcJaq6Ab/NmbJuAnR3VrCYeTa4MkDnox9KzDi3Vf6LLwm1UoPrm2HSAf2iZl8lRIzlEGLqvQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzMfzffVVp6Ue/08zhQs/oaDYkyrWaPc2Poc7EAHSQD7050z7JA
	axNzvMavQaRTUHBmR6WohzSvSHDCRA4z3YCNKtvp+g5Znx2un1v+0V8wWgCxiT+QfDlktkghP5m
	95SU7q/UgMIqU8RwVQ1GyBGwGxR11O+OLXPQ1S1L+mk7j1juBpT+mTOhqvzl77QSAjBvQKhc2Rf
	azLw==
X-Gm-Gg: ASbGncu5pRziIj258t5YVbqpyoMg0KklbddfF7b7XLTcTjlHEm2IcerwUeudPiEAsqn
	pA/TJX4jMEOhuepNnKwVGtob7lxgy4i5Cd9HA5yv5pqPKa1nmpBKUE8ZVmhzDMgwQshvXcOpGrx
	Qx/+oQJgSOiO1y1z3qdvtdQ+CWza8yYSfNxm7TWJnegDbtnMN6phj8PfWM02c7L4LF7hcsYO75R
	kLEF18HJ/6El2lj48DrVR9mxEe2eJe8QYjcoRzbZkOlcTiWp+vd0EwyKvnaLxNAk1kWJVVsUH+r
	Q4JGld6ob9DM6XN3RtcVSSp/yHCtNDhH90J3Hm0n3y+09VsS+HoVaOMKv0bY5dZkoGAEbBDIilJ
	p
X-Received: by 2002:a17:903:46cc:b0:234:8ec1:4af1 with SMTP id d9443c01a7336-23fb2e7c3e1mr130462365ad.0.1753633526351;
        Sun, 27 Jul 2025 09:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcLfcP4DWud+dQHLaFr4TwKmT0cP13tCVOrrDCUpPkeJPY7Si6qU2vgqkckPcdUpuIiilxyA==
X-Received: by 2002:a17:903:46cc:b0:234:8ec1:4af1 with SMTP id d9443c01a7336-23fb2e7c3e1mr130461965ad.0.1753633525824;
        Sun, 27 Jul 2025 09:25:25 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:25:25 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:46 +0530
Subject: [PATCH v13 03/10] power: reset: reboot-mode: Add support for 64
 bit magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-3-6b8d23315898@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=6956;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=RHatRDIyZlkowVAM219pHMxjJ5gZoVq6CrecsaGvXwc=;
 b=52Q22NFhjGYVUrMs0Fo4KMiutv/G56uSyH0ijdtSPbYFl48A2e2/sYcodSS6LzS/lXph/bhvN
 vFbY7FnkOPHDzPpMUGfqxfUATJMWWtlticzkRbpu6d1DjFmugSJrTGl
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=WqsrMcfv c=1 sm=1 tr=0 ts=688652f7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=bqVjg2-MoX4cBg1ZSeQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: C-LX_3PNjsIzy92wVpyKWrNvjjqsfC_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NiBTYWx0ZWRfX2wstEuVjZJEH
 4fGOg7s4HEUQDTU0zNAOtCnBPqzTNGvLhfvvx1rxHEyva7m2xjwY2yLgxrWQaZBcHTb1oxHDtLS
 N7qn0GcQXYiKgnDYY2HYzxtAVBokNHSlh8aGFk3dZpwoGPpehKkU+8HIWNOmX+To2dHyUHyMS8D
 VpvJouJNUxYhBpBa09r4skbpDoKK5tMaUkBuFXvbNTV4CDid0UJ571kbKAEv7qSVnyW1GjT2wAw
 JkBDtcHjxKRiWTpWpuXl9ZAPxb3dHDfFYkeYp3aFFqoykLv2hxUD+A0PCzkE3v7gXJL3S8NI1Z8
 lz4i9C5gHgWty9Yck9PdKF7qK+v29raBxik6f6LBrfi0Tkz9yYsFeacSxEaVxcWSSQZ4YKBpDYj
 07vUGk0BKbqo2mm1vPkkNjN1nbT59c6Y1ykFqW9dRR/foIWO41HHL/peEooZDP2Dwr79HZFv
X-Proofpoint-ORIG-GUID: C-LX_3PNjsIzy92wVpyKWrNvjjqsfC_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_092528_136964_D3456CC1 
X-CRM114-Status: GOOD (  23.25  )
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
index 9bb97bcd33cd3d58c75c791e9b568024e810e5b0..ac81b8b0a9b7fc31f8ef21024333a050087ce90f 100644
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
@@ -66,7 +65,7 @@ static int reboot_mode_notify(struct notifier_block *this,
 			      unsigned long mode, void *cmd)
 {
 	struct reboot_mode_driver *reboot;
-	unsigned int magic;
+	u64 magic;
 
 	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
 	magic = get_reboot_mode_magic(reboot, cmd);
@@ -89,6 +88,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
 	struct mode_info *next;
 	struct property *prop;
 	size_t len = strlen(PREFIX);
+	u32 magic_arg1;
+	u32 magic_arg2;
 	int ret;
 
 	if (!np)
@@ -108,12 +109,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
 			goto error;
 		}
 
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			pr_err("reboot mode %s without magic number\n", info->mode);
+		if (of_property_read_u32(np, prop->name, &magic_arg1)) {
+			pr_err("reboot mode without magic number\n");
 			kfree(info);
 			continue;
 		}
 
+		if (of_property_read_u32_index(np, prop->name, 1, &magic_arg2))
+			magic_arg2 = 0;
+
+		info->magic = magic_arg2;
+		info->magic = (info->magic << 32) | magic_arg1;
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
index 98f68f95c9e8460be23282c51ef7fcbed73887bd..370228b5161963aac1d75af752ada0e8282b1078 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -3,11 +3,12 @@
 #define __REBOOT_MODE_H__
 
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


