Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5468D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0o1zCXTjNkh/pbRdZs0xzKk67AJPh5NU+NUSgiOw/4=; b=xqMsVms3AtT83T+V7Zkj4KtXZI
	ztvU+HL5PgNFF1Biy4Cx/tH2fQiIrBawHE06eaLC3DbPWugVm4abXrCqeMeo1eird5JtspBvIwa1x
	tTkFPwW5Il1AQhxl0cZPuuni2XF+KmJpiGSnDRiZV7QLB5TZ1E6bcO41SFhbUq016qqIUtMjjcqGD
	7l91RUOHL/tPTlKlVCGzGLELwAceRGhzv6YPZxZnlTSMpDAF7ELrIRovDwKAL65/FaprNlBSDVvF5
	v+CzfWxTJnyGKNi3GS8J5KXGGKpY+ZztdufBApwaa1XTS2KuelbGdrHFAk0xBKq3iBRWCZaNN2d5+
	xWrDrqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuRx-00000002uGV-0OqR;
	Sun, 28 Dec 2025 17:21:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuRu-00000002uFL-3IOQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 17:20:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSHFuiE3070711
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S0o1zCXTjNkh/pbRdZs0xzKk67AJPh5NU+NUSgiOw/4=; b=cp+aJFLEvVC1VWrh
	B4+E+Tql+Q7M3DevsdpOgnBdBBE6ZdphLHdLJKe/+WgjUOU8r2c18uIhXGtN0UF3
	U3P7i2A/fVNRi0WSVPceVbcf7poZ3+OllGDmj504PT2KeVNAEZVNh2QDC6hrMwvY
	PZm+2XHl3I6lModn6uJt6FBF4lUiWQ9pe7H8lVzWGjOAT+YESAkZFWW9Fcj0ZUMG
	RRgnGW1BzbCyw395keZeq32BEIsbjY+sFKu8bABo7jSRtD8hGw1VL1DEyL57zQgs
	2iL2v6Rd5wVN7hGfFHANSDOUndSEeNe0mywMWBUizKdXbOpHZwAtbWBBH386WZWT
	KQ6n/w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7p1tgya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:20:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0a8c465c1so61548425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 09:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942458; x=1767547258; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0o1zCXTjNkh/pbRdZs0xzKk67AJPh5NU+NUSgiOw/4=;
        b=T6l9JVv6aFIwMIDMfTRIxfwSVsO8QlbYp4yOjoTEirJTBMg8oYb+N563+N5HCaoLcC
         HmlmBx90yH8IQIt6eHiuclKmye1/juevPusEKVPbOepiIpUJuzUtb+MDEiWQ2qUVVikY
         x5Qx0pTa8JAlBO7e/cG+cFnggLMAt+8Pst0uu4qKgC7Dz5IVCyAEAnIfKpm8aF6rvXLM
         eSsYLaDIhn/zxCWQBxbtuZeF/tFS5M1Hv1qmGxRoFjugCPYAa6j7I6RYxTbbmoAxOGSt
         Nn2DKcYUDI+e3uFLVT3tm5A5LvdcrEQ77mGsjt67rwv2J9+Zc8xnK6PUbSoN/lLqHE+Z
         XeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942458; x=1767547258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S0o1zCXTjNkh/pbRdZs0xzKk67AJPh5NU+NUSgiOw/4=;
        b=bJFA8Y+cJ5FcuuZyrYke+a38p3VPuak9aBCjc6p9dY9aJqSdOyDxXxC1bjz9c1uYEl
         eMC//8whWLRRavaqBvzHIYF79qiSS5HZnbXzimYjBFTosEanvQzeXIIJW/cAuQnWgf7I
         m7Xb8VB0NtiBbiAmWzgWQjXfIiaHqTuHHzsJw4FKj1bzp+Vpke5AfNsyZ4TvwYBtpWr5
         732tgndOqPDEw2YykUu7EcrqTQHByKoPAt7SOJ3LcD8h/WH7qOlMMIYcR5fWTZC2Asa7
         r/6b0ousGKEcPUGo4bWBMUmGGpKTZ5bjLucoTGvQ3C+XjoDAIePkIgrqRNcZ1mvgqfKB
         CGmg==
X-Forwarded-Encrypted: i=1; AJvYcCUzOFEnWHPcVSWcW/pffLqO0oVmWrt0g/TLzM1SoEckVIZiPAXCfiO2DUwjBcnV0nV0wbhoORxRee/2sCrzbRlp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+cMUClU/3wr9EEIXdPA4DVJd19hlYF/Xak4GlygcoFo7JvVyE
	JpL1UX9VzjF8oG6MsTClR61+LmnV84IMpt27jp92/r4xK59wbUOuV94rrbmgVRH/NuxzdLoYLZG
	n3AWphmkpL7i7ifi2eMboqnbAqYu4doZuWYl7x92ifAi3SUvfbYJVk0eqNz2+7f0oaT1vZ1jEHC
	OwNw==
X-Gm-Gg: AY/fxX7gs1VmoR/IbVj0Sdhk2t/ttxwdHLlNp1bdNk+GfSMKOvlhJ/rgD73eyoi8015
	XTCtIFfqDf66XcNDHu9ly7zfjQ2Doyyv7rgxwqwerq+vqNTcpOph1i5uI4mJzvAMKRVAxa7sYJi
	f6/Dt0wK7u6r7zBYBt4NcEnGB2D3QA+Qn1jJNaERQl0PgatAN5s6FlsWbd43htELKvPCBt05q2y
	TXND5v5HKyk+TtZJx0zy9bNgEt7Dbsr28WdhLRuV+6Fdq6JEhxw7NXOTtSdukzfRTMiYCBKh2K9
	Q1L6aJUOy0yOa/r9XrzOHq8JgrPPw4qG02GcfuFOzOG+T+PSNl1vOBs1yjfYqOhM/8o0OUFlhuF
	gPwRIwXAPPIOyyNeW9szPdz3sjIu12wyoJzNQ2o03C6GmlA==
X-Received: by 2002:a17:902:d2d0:b0:24b:1585:6350 with SMTP id d9443c01a7336-2a2f0cd2058mr314763745ad.11.1766942457544;
        Sun, 28 Dec 2025 09:20:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBe5Txf/b1blWPhrmKhnlyFpaO+p9BsHeyiOjkOmGftLhpF+t6BCy4iYoTHXTykwYPFM84OA==
X-Received: by 2002:a17:902:d2d0:b0:24b:1585:6350 with SMTP id d9443c01a7336-2a2f0cd2058mr314763345ad.11.1766942456990;
        Sun, 28 Dec 2025 09:20:56 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:20:56 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:21 +0530
Subject: [PATCH v19 03/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-3-ebb956053098@oss.qualcomm.com>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=5544;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=RR0xOQLLtrXPV5kRPIO4cHWLbRM+XB8C1weupKJA+c4=;
 b=M/YNhCaGnRsu/MkjLVjdG2SPg9H51HzeE4kgbtRPGlIFzxuidQi8h+tPHbojQ3ty47bBbQihz
 Tst7V7lloqGAL95py59+K6ejFt5sVD6F8mFcTbr9f2XAzKPHOtnN3aI
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: MGL4rHlyv1cqjjlFGDOi1LE_2I3B7SJe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OCBTYWx0ZWRfX+bodBQpoAAn1
 MIVoihHNdjYv/8i41sjDERI/RXrWYgYpUf7b2dsIqk+YPuDLGe8TyBAHZ3kOyD4J5JGiV0E58hK
 uFOJ7epQ88I+cp4ru1YqXF+ynJryQqAOiHDBtLvI+m/8gga23DGMNKtfDZbbAVTropREOBwg3+7
 X81XEtEGdDh6KPmQcI7QFEPs1p0jwjTk27naaM6HzLGD+KyKwOwTL4DPxIt3RUuAglPO0WGtC7m
 7vn/vkof1voPY88g88j4Q03G1N/Jzlag4kvD0iJQWtFETcMdOL80ouZ5qRyODCge72TMdyatS2U
 knZKyr5aXewfwRZTW2qyWIux/Rg9jvvep3pfGaxR3NP3lQNnM1cv92Np9EKZWZmMaGKyEf7mnqh
 a03ktXeQ1cL0kwu3apc5K3REtzGANhU89bPYbDR23GOJNIGjCe3owdnmw9zvF2269Yz9drXwMqi
 lBttLx90z22TiqZzTsg==
X-Proofpoint-GUID: MGL4rHlyv1cqjjlFGDOi1LE_2I3B7SJe
X-Authority-Analysis: v=2.4 cv=PKMCOPqC c=1 sm=1 tr=0 ts=695166fa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9azGcnLTnVfPEkPguh4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_092058_841597_74A3C495 
X-CRM114-Status: GOOD (  22.90  )
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

reboot-mode based drivers can define a reboot-mode by adding it under
the reboot-mode node in device tree. This limits such drivers, to define
any predefined reboot-modes statically within the driver and creates a
dependency on device-tree.

Introduce a list for predefined modes in the reboot-mode framework and
process the predefined reboot-modes along with the device-tree defined
reboot-modes. Modify existing reboot-mode based drivers to initialize
the predefined list-head as empty.

This patch enables a reboot mode driver to define reboot-modes through a
predefined static list, in addition to the device-tree based reboot-modes.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/nvmem-reboot-mode.c  |  1 +
 drivers/power/reset/qcom-pon.c           |  1 +
 drivers/power/reset/reboot-mode.c        | 28 ++++++++++++++++++++++------
 drivers/power/reset/syscon-reboot-mode.c |  1 +
 include/linux/reboot-mode.h              |  9 +++++++++
 5 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
index b3d21d39b0f732254c40103db1b51fb7045ce344..b02a2af31aac52cb0ab19cf5d4d315d17c208f6e 100644
--- a/drivers/power/reset/nvmem-reboot-mode.c
+++ b/drivers/power/reset/nvmem-reboot-mode.c
@@ -44,6 +44,7 @@ static int nvmem_reboot_mode_probe(struct platform_device *pdev)
 
 	nvmem_rbm->reboot.dev = &pdev->dev;
 	nvmem_rbm->reboot.write = nvmem_reboot_mode_write;
+	INIT_LIST_HEAD(&nvmem_rbm->reboot.predefined_modes);
 
 	nvmem_rbm->cell = devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
 	if (IS_ERR(nvmem_rbm->cell)) {
diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index ccce1673b2ec47d02524edd44811d4f528c243e8..bf7b9f0bcdcc4c168aa7ff8d6494122d898814b5 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -75,6 +75,7 @@ static int qcom_pon_probe(struct platform_device *pdev)
 		pon->reboot_mode.dev = &pdev->dev;
 		pon->reason_shift = reason_shift;
 		pon->reboot_mode.write = qcom_pon_reboot_mode_write;
+		INIT_LIST_HEAD(&pon->reboot_mode.predefined_modes);
 		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 		if (error) {
 			dev_err(&pdev->dev, "can't register reboot mode\n");
diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 1e85f2c052c916e153c7c9ac0b184c91d7153402..877c2459a3b2e47679ee2e9fbb9b0329dc3b1e0f 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -16,12 +16,6 @@
 
 #define PREFIX "mode-"
 
-struct mode_info {
-	const char *mode;
-	u64 magic;
-	struct list_head list;
-};
-
 static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
@@ -72,6 +66,7 @@ static int reboot_mode_notify(struct notifier_block *this,
  */
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
+	struct mode_info *info_predef;
 	struct mode_info *info;
 	struct mode_info *next;
 	struct property *prop;
@@ -83,6 +78,9 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	INIT_LIST_HEAD(&reboot->head);
 
+	if (!np)
+		goto predefined_modes;
+
 	for_each_property_of_node(np, prop) {
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
@@ -124,6 +122,24 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		list_add_tail(&info->list, &reboot->head);
 	}
 
+predefined_modes:
+	list_for_each_entry(info_predef, &reboot->predefined_modes, list) {
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
+		if (!info) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		info->mode = kstrdup_const(info_predef->mode, GFP_KERNEL);
+		if (!info->mode) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		info->magic = info_predef->magic;
+		list_add_tail(&info->list, &reboot->head);
+	}
+
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
 
diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index eb7fc5b7d6a7ed8a833d4920991c4c40b5b13ca7..74e2e14c5d87c54ac24ef63c7905b3266d736439 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -50,6 +50,7 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 	syscon_rbm->reboot.dev = &pdev->dev;
 	syscon_rbm->reboot.write = syscon_reboot_mode_write;
 	syscon_rbm->mask = 0xffffffff;
+	INIT_LIST_HEAD(&syscon_rbm->reboot.predefined_modes);
 
 	syscon_rbm->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
 	if (IS_ERR(syscon_rbm->map))
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index a359dc0c6dede0ac5ce67190a00d46a7e7856707..bddec9b7f94187dcb056540df79eea34c25b1d0d 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -4,11 +4,20 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/reboot.h>
 #include <linux/types.h>
 
+struct mode_info {
+	const char *mode;
+	u64 magic;
+	struct list_head list;
+};
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
+	/* List of predefined reboot-modes, a reboot-mode-driver may populate. */
+	struct list_head predefined_modes;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;
 };

-- 
2.34.1


