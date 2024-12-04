Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4F2E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRNozn+CmJ/ud473L/9S72anLINqKxujpLwpR8ystFA=; b=WfiaepT7U8khLKZ93jc6P8j1Ip
	XC1FL1J9C+fZF8lTPOW8kLnNXNEPfxoRv1rt/72faT+k9SWA2B+b6sWNjZUwxl4WrTMIqNrUU/mQU
	5bsGxRJxp6dXpMYZySXrxJTAmMWrO5cm6dmVpdCzLSG0puK+9KjLy2C3qFDTAA4vftaIWJDhKTjLJ
	3u1WK3zZ1zRIiuc8g95ucjpUqRTOtdbjKuFO3M32VbajdTXAcQF6+wn/OAItjDKeGFyFtb2TO22E+
	pZWj+fOY83Qo+NQ1BCBXlQ4s35m6zHeIootnfqxjw9kVnNoo0KYuUacWH/H+FzWCIH7dpgD1WHksG
	WorAO0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrtz-0000000D6vW-405C;
	Wed, 04 Dec 2024 16:06:59 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrlS-0000000D4Wb-0prl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:58:11 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53de8ecb39bso8236185e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327888; x=1733932688; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRNozn+CmJ/ud473L/9S72anLINqKxujpLwpR8ystFA=;
        b=dg9kwk4INMQNP4H3a99qMe4ChztZ9nsFzQPwvN3bXODvqs4SwoUAjmMJsPrgvgx0wg
         1qD4jRDdR0cw6VmZFSXFv0a8EdQ62dDE8GjMiK3MMn1+uulcgbOeU1bfidVgZq42nQ4U
         l3Eo4o8/E8RKjSIL2i4a5kvJLnF5EzcGSpp/zryxM73jxpLUncpFxEuJoSw2+qsQm8fI
         6j5+Of1EmL6MRKubCC/jZvhepAebJ3JlGpiNlF2lBPTDV+qbavFo9/ZagybFfm5m+V33
         fe6QPh57lQM+4h7CC07mklacmbby0U+U1PYN+abh5eM7SZHkTLKPJuVI0R/6y2WzcT55
         hJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327888; x=1733932688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRNozn+CmJ/ud473L/9S72anLINqKxujpLwpR8ystFA=;
        b=RrhrNI6/MpQ/sQd790bjEkp5dUVCX7e6rbNTgediBlcgZ54x2I0WQC0qRuMmumNL5H
         KzWaWuOWZIwpGOWVw9rqvc6D/iuLTUqyt/G/rNi2wVB61Vat6pvrJYqHn9BR5B5u8jBp
         Ey7WFK0f0J0rnowkU4+wtlIyX7OFIb7Vuof7zAoPmq2oxNSb7FU07biE0GiMNhfqJ4IZ
         brd0FpGOi81wgLXctGY6jpsbooRpAw+mC5TBQteUYGJTObq6vQkW00h1GEMDp5h5wtUB
         HCi/O9OYpEPMZan5QcSqChddmxeBR7WKnScog2xDJ/Kav2TgQoXEL3zsigRylid+S/of
         aG5w==
X-Gm-Message-State: AOJu0YwVr4mp2Mcqpz0Aun5mLpzYhHuz+jbKdMGdI7gYFZo5dcznse5+
	XzPS0wGNMHOZ1s3IdQolpEhxiH1oxeqtzLn/FEIh3UQ2EtlH6nNq
X-Gm-Gg: ASbGncsMVahZ9VIKxEuQEDolZKdrSZontQGQ1OwjLE2zzTkjnRrTm5BYM7kLaCxVKdd
	LX6NN++Cd++iGR+Hay5QuvLEBhXxHtDuJGQyND0SG9ohlJ2SdVH/V8vozckW75jwE2I+eJW/uOY
	+DGG+gDDJnLn0Is5o6j2f+vzIO3HqYA2j3CvRJuMJDGbsni3Qcb/IWTIloYUDtRVo2Ckvv6gKyR
	Lb0bqTXzo/fnDuAUuiZqY+GV27RSfUGNXcYyvPJYpghgihFw7nTwrftrtWAPxP85t4BH7bPdH49
	RcJlkkIWjFmQ/wo=
X-Google-Smtp-Source: AGHT+IFaHu0p8meQ8L3Hziy4MXUTfssymJH4vo37O/hYKq4ya/mGS+ElObDyqmeHNSYxvva8OfGHwQ==
X-Received: by 2002:a05:6512:224d:b0:53d:f82a:deb8 with SMTP id 2adb3069b0e04-53e129fdd73mr4650320e87.14.1733327888326;
        Wed, 04 Dec 2024 07:58:08 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:58:06 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:50 +0100
Subject: [PATCH 8/9] ARM: qcom_defconfig: rebuild default configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-8-86587652d37a@gmail.com>
References: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
In-Reply-To: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4815;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=qLf+OscItBw8MHpWEaV1DqM+RlkXLw4hOz0zFmKFx8Q=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvr/6QKFOKNlHDLGT9HydO3AqmoddYqDOLYb
 y3vjUNPVy+JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B76wAKCRCIgE5vWV1S
 MquMEADEJAgMYnB4LEUqby0BzakaMLt0xuqIwLK/I4IR9GDSOtruMFF/LXX286F0WmJhfTDHVON
 jtC+Iq4/rAI0I5VuegINbTSQVqenwvxL38AkPwGec41R9RUSns+kSXnt4F3on88h7cSBZJ91JSD
 k0GWbGDK5JsomO8p1YSRB5ompRKJjwVVGdw4MmeVe5vusSE9TUgMequt3bW+jN3vJn3UE3T9H3f
 Iz7AnxwUr93ORQiIn+s6TOe+I0jO7kOuAV2Eqte4xt6Wmh7aU5xyEXv1yMZBq7Q0ov8GmKKlxt2
 SaKk/AZUyXc/89i61PSij2pPSfhkTg0WzuAfagBsOoEaRcXQIir7rKN+gejKKT6D63Ju1eDmkVj
 ESaMxOn+jFfN+QaOZAOLLRn022nciPMkoFgxYmK+jOlqVifMrQkbU35j/KnUC0+Icg94+F/WQ/A
 S0X+ef7BCKBy+E/NLI/0vmMi6EazfwVy3rvXAqstvhM3lRVfKtfvWRHIwwHsOcwNcD5cj+QeM6e
 vFMQeZWcLk9WbJh8PzsPuJOR90smWU3Sj89f0RvpoN/n7oxGrt06H5D7Q9d95leoPmofN5QpDut
 jMdLRUXZO0nQN9jGQzKvWyjV9wOrIYKcPs/kD5JcGMFqM4xsv9HvhLKJ2A6Mm01Ak5kdHBp03EM
 YdOO96nFKbFvr9g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_075810_248667_03940B9F 
X-CRM114-Status: GOOD (  11.20  )
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

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm qcom_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/qcom_defconfig | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index ec52ccece0ca7d6471f04ef4a6953f02530655c5..bc58e76eee18a583da4a591d57dcd632eaae862c 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -10,10 +10,6 @@ CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_QCOM=y
-CONFIG_ARCH_MSM8X60=y
-CONFIG_ARCH_MSM8960=y
-CONFIG_ARCH_MSM8974=y
-CONFIG_ARCH_MDM9615=y
 CONFIG_SMP=y
 CONFIG_ARM_PSCI=y
 CONFIG_HIGHMEM=y
@@ -43,9 +39,6 @@ CONFIG_IP_MULTIPLE_TABLES=y
 CONFIG_IP_ROUTE_VERBOSE=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 CONFIG_QRTR=m
 CONFIG_QRTR_SMD=m
@@ -63,7 +56,6 @@ CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=y
 CONFIG_MTD_QCOMSMEM_PARTS=y
 CONFIG_MTD_BLOCK=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_QCOM=y
 CONFIG_MTD_SPI_NOR=y
@@ -105,7 +97,6 @@ CONFIG_KEYBOARD_PMIC8XXX=y
 CONFIG_INPUT_JOYSTICK=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_INPUT_MISC=y
-CONFIG_INPUT_MSM_VIBRATOR=m
 CONFIG_INPUT_PM8941_PWRKEY=m
 CONFIG_INPUT_PM8XXX_VIBRATOR=y
 CONFIG_INPUT_PMIC8XXX_PWRKEY=y
@@ -120,7 +111,6 @@ CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HW_RANDOM=y
-CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_QUP=y
 CONFIG_SPI=y
@@ -139,7 +129,6 @@ CONFIG_PINCTRL_MDM9615=y
 CONFIG_PINCTRL_MSM8X74=y
 CONFIG_PINCTRL_MSM8909=y
 CONFIG_PINCTRL_MSM8916=y
-CONFIG_GPIOLIB=y
 CONFIG_PINCTRL_SDX55=y
 CONFIG_PINCTRL_SDX65=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
@@ -156,7 +145,6 @@ CONFIG_QCOM_WDT=y
 CONFIG_MFD_PM8XXX=y
 CONFIG_MFD_QCOM_RPM=y
 CONFIG_MFD_SPMI_PMIC=y
-CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_QCOM_RPM=y
 CONFIG_REGULATOR_QCOM_RPMH=y
@@ -165,15 +153,13 @@ CONFIG_REGULATOR_QCOM_SPMI=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_DRM=y
 CONFIG_DRM_MSM=m
-CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
+CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_ANALOGIX_ANX78XX=m
 CONFIG_FB=y
-# CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_LM3630A=y
 CONFIG_BACKLIGHT_LP855X=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_DYNAMIC_MINORS=y
@@ -187,16 +173,13 @@ CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_OTG=y
 CONFIG_USB_MON=y
 CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_MSM=y
 CONFIG_USB_ACM=y
 CONFIG_USB_DWC3=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_UDC=y
 CONFIG_USB_CHIPIDEA_HOST=y
-CONFIG_USB_CHIPIDEA_ULPI=y
 CONFIG_USB_SERIAL=y
 CONFIG_USB_HSIC_USB4604=y
-CONFIG_USB_MSM_OTG=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DEBUG_FILES=y
 CONFIG_USB_GADGET_VBUS_DRAW=500
@@ -204,7 +187,6 @@ CONFIG_USB_CONFIGFS=y
 CONFIG_USB_CONFIGFS_NCM=y
 CONFIG_USB_CONFIGFS_ECM=y
 CONFIG_USB_CONFIGFS_F_FS=y
-CONFIG_USB_ULPI_BUS=y
 CONFIG_USB_ETH=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
@@ -234,7 +216,6 @@ CONFIG_IPQ_GCC_4019=y
 CONFIG_IPQ_LCC_806X=y
 CONFIG_MSM_GCC_8660=y
 CONFIG_MSM_LCC_8960=y
-CONFIG_MDM_LCC_9615=y
 CONFIG_MSM_MMCC_8960=y
 CONFIG_MSM_MMCC_8974=y
 CONFIG_SDX_GCC_55=y
@@ -245,9 +226,7 @@ CONFIG_QCOM_APCS_IPC=y
 CONFIG_MSM_IOMMU=y
 CONFIG_ARM_SMMU=y
 CONFIG_REMOTEPROC=y
-CONFIG_QCOM_ADSP_PIL=y
 CONFIG_QCOM_Q6V5_PAS=y
-CONFIG_QCOM_Q6V5_PIL=y
 CONFIG_QCOM_WCNSS_PIL=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
@@ -256,7 +235,6 @@ CONFIG_RPMSG_QCOM_SMD=y
 CONFIG_QCOM_COMMAND_DB=y
 CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_OCMEM=y
-CONFIG_QCOM_PM=y
 CONFIG_QCOM_RMTFS_MEM=y
 CONFIG_QCOM_RPMH=y
 CONFIG_QCOM_SMEM=y
@@ -289,7 +267,6 @@ CONFIG_PHY_QCOM_USB_HS=y
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 CONFIG_PHY_QCOM_USB_HSIC=y
 CONFIG_NVMEM_QCOM_QFPROM=y
-CONFIG_INTERCONNECT=y
 CONFIG_INTERCONNECT_QCOM=y
 CONFIG_INTERCONNECT_QCOM_MSM8974=m
 CONFIG_INTERCONNECT_QCOM_SDX55=m
@@ -298,7 +275,6 @@ CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT3_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 CONFIG_UBIFS_FS=y
 CONFIG_NFS_FS=y
@@ -310,7 +286,6 @@ CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_CRYPTO_USER=m
-CONFIG_CRYPTO_USER_API=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m

-- 
2.47.0


