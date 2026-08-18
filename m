Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88807C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 21:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=czqQj/DkLiGDm5PELPaIJngrIu9Dzte0G0O3+qijjbs=; b=zHMvWJnXb5axEk8Grs0HyPMUOv
	wxPoWrjJnI9557zhG4AichTD3W40vT6DH0CY0yk+td8Dq4Z/GeCixk16j21+fBPFQAiJ9m79JJPjl
	UY/fW4nBtPwQFVdb7EwpW+mdwu0oDou/6koqoEV5rejrfPpKKMr1LadfWaFMxbZBQEZhC5cw96ei8
	06n5naWojldHwTU+QxBn1iSbzXuPO5ewQSY7LdxxaUr/OzBVXzN6FD/IOESQaeRbhur2tWonlpdbN
	8NkIg+A4eZyz/P1WLIXZT800R04PHZTaKqrFcsm5MYAsnKJENo6/m0NIw6YNvHMhWb3YGzOtVJZKw
	9l9ySDYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRBN-00000008fOk-1XzI;
	Tue, 18 Aug 2026 21:17:17 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRBI-00000008fN5-2nHv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 21:17:14 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 765B51400150;
	Tue, 18 Aug 2026 17:17:11 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 18 Aug 2026 17:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1787087831; x=1787174231; bh=cz
	qQj/DkLiGDm5PELPaIJngrIu9Dzte0G0O3+qijjbs=; b=juiodm02hjP1aYtQoo
	o63/CVZIe7bO+IVRQAfkOikdf1pdZMxiMxHrfievNvD4Foh1RuTqipJ/za/HRb2E
	PC/B+p0eOrRkU0/vX/91478g7It5fp8uG44t8+xtAV4iprliE9Jq99iBgkyEtkD5
	bVqRF/XwwS5RFFqXMvwaZ6HViVmvUK6aU7+1BGaMFUt9H+uO9N+fkoDtTGQtQBac
	JG8+fIa4pljNE0j8DuZyb0/t5l3dWYl3snAdb1grLFYdIHmatXtcqDyUAx9ZAPgo
	HfkvCZOx3n/lcTVoaN7jjmGHUqD/G2AD2JpIVhP5If6EM+PHtKpcSKWSXc1FznN2
	OcAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1787087831; x=1787174231; bh=czqQj/DkLiGDm5PELPaIJngrIu9D
	zte0G0O3+qijjbs=; b=iyZ1B/F62IfqJq9y8fTenUfV9+GjmZ6q3k7e+TRBktF/
	VdPOEsFN9xflYcV8fIiXpIbka0tpaweU35p3hWe0UKaJFtXpOQZK5q70ItxspMSV
	1xC+fti72qKqXigMGcX+fzLvQdqI6WRf0X3x2DVlpBIrLIBjFkzZSFcgPRu3I+qc
	ttk1JHFSqvIZRSkcHFcwn4xJlZd/su3OgvWi5Rvh7qhkpgTnx89zFNLea+Jzc+4x
	NRE2x46By1APdO09NsbKEL+axH8/Xm5VtkXQCTwFxkbypTOECKcGOVKMFSfkrPrp
	/oVj6hwVfFieg4XVpxmlC58DO0NSwX8ALz/1/7SIjA==
X-ME-Sender: <xms:1MuEajpdviEuuef9EjONQsO1keH23JRb5Aq3GacgzQ77ivLcqBJ-ug>
    <xme:1MuEaoeh1n60ZwCQI_gyFwbdd-vl0ctLab-8MZqGDiXcrHEErC5hWTAFoBuJjJ7eC
    H4eD1O_GmO4zkBbSYeak5pzfNy1A1cr0aY4Gdb-z6YUrIF07KppMQ>
X-ME-Proxy-Cause: dmFkZTEPivZYlYvamL7+G+QmhG+yYD3xbay+nzGw4hBIps2OlNLJtB64guFptI7zdZsmu9
    4+lob1BHl5aQsuoQlTjf9eckaK8alWKGPxGaHPj3eWeOmfT8yYWt3jVNLcLjoQkosaaSsh
    ZE7sTORLBg1TfXeDAMOMjNZcP2GVOgQ3yRTaRuZh+Vr8z7dq3dmO5qRfptjjWplW/F4bxC
    6oC8APHtVAY7MvfXmaiu5i+NDpWLqTvtBseJXKo5sqElAv9/LFVBQyJo1BSmREFGKGGv1P
    XQjfDcJ/EUGb1JH55RMi2Z4ThhE6zKrVCZhml3JQyG2IazBBeiiGEoCfBI72R2hcSXmpl4
    7bZSei0LyhpppwowadYt1tSJ9AQ8gdMGTkXERL1S1gCHRBirJXqTiTkUI9JpPzrBQgULgX
    mPgfJwacHtE0146kCuWIeHnlu6bBg9EDg80Iy7Q2kxfH2y+ZMlYAYD6TP9pLzvE+UBELZ8
    5DEYnWDHNva+f0xCSi/UrQhOJXs5ytO1CO0c/KGAGav5czKDgwjU3Of2F57NPriTA1vMEo
    0ZykYocxtd7W7Q6ED2IdYG4l5xp/ouPo4PxhFjP/2MTXNqDoDGAV8GMx3/Bc9SJp05R2fS
    DS5zZhNVnKlXgs5PSe6EmchLfqoxw3TlNbvMTIJy6JJjFok7RNVxGHP4xpLg
X-ME-Proxy: <xmx:1cuEatWcL_I7bLhLl_gQantIdnXdPLJ-IN2SR5r3-aAnZ6K63lMB-w>
    <xmx:1cuEakcLtkrPsIaTkxBiahr_cLp21lhjIpVFA3qHF-H_SuRZ_x8Dlw>
    <xmx:1cuEahsqK_hwiOIgCRy3CN0QueqihXS4j0KlbxI_-srbhwvOd66PDA>
    <xmx:1cuEar9ZujKgic7VWBxEJFbVzLztU7DLoAf1Tc6-w05eEG2ASpu-tA>
    <xmx:18uEavsLLPGyn82Kmt9wHWw-aEhnXJ-YMjVrR5DGCQuBaxwHDkRdBFns>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D7F7232A0074; Tue, 18 Aug 2026 17:17:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ANg3mTpjYiWJ
Date: Tue, 18 Aug 2026 23:15:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <ee98fe32-e635-413e-aeab-caf9f4b98431@app.fastmail.com>
Subject: [GIT PULL 3/4] soc: defconfig updates for 7.3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_141713_197756_0F45E1FD 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.3

for you to fetch changes up to 373eab9eec316c315e884e9cb520c6d8c3236e0f:

  Merge tag 'ti-k3-config-for-v7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/defconfig (2026-08-10 09:44:40 +0200)

----------------------------------------------------------------
soc: defconfig updates for 7.3

Just the usual updates to the main defconfig files as well as the omap2
specific one, to enable more loadable modules for better default
hardware support.

----------------------------------------------------------------
Alexander Sverdlin (1):
      arm64: defconfig: Enable Allwinner LRADC input driver

Andreas Kemnade (2):
      ARM: omap2plus_defconfig: enable things required by iwd
      arm: omap2plus_defconfig: Enable multi-LED

Anvesh Jain P (1):
      arm64: defconfig: Enable Qualcomm reference device EC driver

Arnd Bergmann (5):
      Merge tag 'riscv-config-for-v7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux into soc/defconfig
      Merge tag 'qcom-arm64-defconfig-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig
      Merge tag 'omap-for-v7.3/defconfig-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/defconfig
      Merge tag 'sunxi-config-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into soc/defconfig
      Merge tag 'ti-k3-config-for-v7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux into soc/defconfig

Judith Mendez (1):
      arm64: defconfig: Enable drivers for BeagleBadge

Marek Szyprowski (1):
      riscv: defconfig: thead: enable PCA953X GPIO driver

Parvathi Pudi (1):
      arm: multi_v7_defconfig: Enable BRIDGE and DP83848_PHY for TI AM57xx, AM437x and AM335x

Ravi Hothi (1):
      arm64: defconfig: Enable Sound DMIC driver

Vishnu Santhosh (1):
      arm64: defconfig: Enable Qualcomm BAM-DMUX WWAN driver

 arch/arm/configs/multi_v7_defconfig  |  2 ++
 arch/arm/configs/omap2plus_defconfig | 13 +++++++++++++
 arch/arm64/configs/defconfig         |  9 +++++++++
 arch/riscv/configs/defconfig         |  2 ++
 4 files changed, 26 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 2de547c8b901..6131cec01b0c 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -149,6 +149,7 @@ CONFIG_INET6_IPCOMP=m
 CONFIG_IPV6_MIP6=m
 CONFIG_IPV6_TUNNEL=m
 CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_BRIDGE=m
 CONFIG_NET_DSA=m
 CONFIG_QRTR=m
 CONFIG_QRTR_SMD=m
@@ -288,6 +289,7 @@ CONFIG_ICPLUS_PHY=y
 CONFIG_MARVELL_PHY=y
 CONFIG_AT803X_PHY=y
 CONFIG_ROCKCHIP_PHY=y
+CONFIG_DP83848_PHY=m
 CONFIG_DP83867_PHY=y
 CONFIG_CAN_AT91=m
 CONFIG_CAN_FLEXCAN=m
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index ad5ae1636dee..f827f89567fd 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -257,6 +257,9 @@ CONFIG_RXKAD=y
 CONFIG_CFG80211=m
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
+CONFIG_RFKILL=m
+CONFIG_RFKILL_INPUT=y
+CONFIG_RFKILL_GPIO=m
 CONFIG_PCI=y
 CONFIG_PCI_MSI=y
 CONFIG_PCI_DRA7XX_EP=y
@@ -602,6 +605,7 @@ CONFIG_MMC_OMAP_HS=y
 CONFIG_MMC_SDHCI_OMAP=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=m
+CONFIG_LEDS_CLASS_MULTICOLOR=m
 CONFIG_LEDS_CPCAP=m
 CONFIG_LEDS_LM3532=m
 CONFIG_LEDS_GPIO=m
@@ -611,6 +615,7 @@ CONFIG_LEDS_PCA963X=m
 CONFIG_LEDS_PWM=m
 CONFIG_LEDS_BD2606MVV=m
 CONFIG_LEDS_TCA6507=m
+CONFIG_LEDS_GROUP_MULTICOLOR=m
 CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=m
 CONFIG_LEDS_TRIGGER_ONESHOT=m
@@ -703,7 +708,15 @@ CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
+CONFIG_KEY_DH_OPERATIONS=y
 CONFIG_SECURITY=y
+CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
+CONFIG_CRYPTO_DES=m
+CONFIG_CRYPTO_DEFLATE=y
+CONFIG_CRYPTO_LZO=y
+CONFIG_CRYPTO_ZSTD=y
+CONFIG_CRYPTO_USER_API_HASH=m
+CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_GHASH_ARM_CE=m
 CONFIG_CRYPTO_AES=m
 CONFIG_CRYPTO_AES_ARM_BS=m
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..7f24c9559553 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -521,12 +521,14 @@ CONFIG_WLCORE_SDIO=m
 CONFIG_WWAN=m
 CONFIG_MHI_WWAN_CTRL=m
 CONFIG_MHI_WWAN_MBIM=m
+CONFIG_QCOM_BAM_DMUX=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_ADC=m
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_GPIO_POLLED=m
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
+CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
@@ -683,6 +685,7 @@ CONFIG_SPMI_MTK_PMIF=m
 CONFIG_PINCTRL_APPLE_GPIO=m
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
+CONFIG_PINCTRL_MCP23S08=m
 CONFIG_PINCTRL_RK805=m
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_PINCTRL_SX150X=m
@@ -764,6 +767,7 @@ CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
+CONFIG_SENSORS_SHT4x=m
 CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
@@ -952,6 +956,8 @@ CONFIG_VIDEO_IMX412=m
 CONFIG_VIDEO_OV5640=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_S5KJN1=m
+CONFIG_AUXDISPLAY=y
+CONFIG_SEG_LED_GPIO=m
 CONFIG_DRM=m
 CONFIG_DRM_HDLCD=m
 CONFIG_DRM_MALI_DISPLAY=m
@@ -1132,6 +1138,7 @@ CONFIG_SND_SOC_TEGRA210_AMX=m
 CONFIG_SND_SOC_TEGRA210_ADX=m
 CONFIG_SND_SOC_TEGRA210_MIXER=m
 CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=m
+CONFIG_SND_SOC_DMIC=m
 CONFIG_SND_SOC_J721E_EVM=m
 CONFIG_SND_SOC_XILINX_I2S=m
 CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=m
@@ -1318,6 +1325,7 @@ CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_PWM=y
 CONFIG_LEDS_SYSCON=y
 CONFIG_LEDS_QCOM_FLASH=m
+CONFIG_LEDS_PWM_MULTICOLOR=m
 CONFIG_LEDS_QCOM_LPG=m
 CONFIG_LEDS_TRIGGER_TIMER=y
 CONFIG_LEDS_TRIGGER_DISK=y
@@ -1425,6 +1433,7 @@ CONFIG_EC_ACER_ASPIRE1=m
 CONFIG_EC_HUAWEI_GAOKUN=m
 CONFIG_EC_LENOVO_YOGA_C630=m
 CONFIG_EC_LENOVO_THINKPAD_T14S=m
+CONFIG_EC_QCOM_HAMOA=m
 CONFIG_COMMON_CLK_APPLE_NCO=m
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCMI=y
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 74ba5acc12a4..472e03eaebb0 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -174,6 +174,8 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
 CONFIG_GPIO_SPACEMIT_K1=y
+CONFIG_GPIO_PCA953X=m
+CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_POWER_RESET_GPIO_RESTART=y
 CONFIG_SENSORS_SFCTEMP=m
 CONFIG_CPU_THERMAL=y

