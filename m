Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BC3D6D227
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 19:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lr9J/cpuXulD0Ff4rc9DUadq0FP0SQbYNRM2bsHKwFk=; b=WAQ89s00jNbs5LkCeejzOo2y2p
	AKSpQfq4vy0ZSkeX5HvOXlMe18E0Vh99f6jXpaf1YDJ3YiQnuY8qovDeJ4SijoEQWzrp4Jlzf1dGB
	Tg7vchaF3qsqRQWDh1k9tWrrtFAvS2H6E8Zy/1jk+GfK4fuWTQ6tui2BiitGSfjB9Kr92vXWV33Q0
	NxIEjEN1EYbEbwsGv3taxHsrNkdcjbzEvnt4S59J+IrWkQQwx/0pdjLERzCdC/YPCDkWgXoY/csNc
	9xahznchI+XUlkCANenCb9yDufeTZ+4n+yjgPRK67GGl52ZJAhaoe0Mj4/8C/Pmk4GYIMrhl7tIpn
	AWNrE76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNgi-0000000Dvzq-3ype;
	Wed, 27 Nov 2024 19:27:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNfj-0000000DvvC-42sN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 19:26:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05AFE5C4B90;
	Wed, 27 Nov 2024 19:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3653C4CECC;
	Wed, 27 Nov 2024 19:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732735559;
	bh=LvmHpaWsiLGTPibuZ7yWpqo4clNPX7pnbNk8sleUTwA=;
	h=From:Date:Subject:To:Cc:From;
	b=MQ70w9m6MasuDm59oyN3C2+4FQnIQD08QODGBWdNj04cRVs6ffOk9WH4yrFxIE0yz
	 yGBzZiEhQoxpCfUF2var9/r3m8N7UQArDBKuunJUqn/uEZEfHOIOZ+kvFyjqy7hjXA
	 Y8dzmCk7XwUGe+hkpLRzMXyBira3hzkbMU5OnTlHcwgwB+yiCI2vHhPKyZWa0KocUv
	 9GIqi9WpzDHucgcOTqfYN4PpvCsIZ2NNz0QPvG96JuPF2SW5ufiebvvMN1FP7pFKea
	 UuChfx7Nzos0SGroHiYAdB63i1SZYzBfw3i3ivjbEJZE4LNo5EYuJJktfvevEeTy35
	 Hwctu7ZHwuaJQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 27 Nov 2024 19:24:40 +0000
Subject: [PATCH] ARM: imx_*_defconfig: Fix i.MX pinctrl enablement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-imx-pinctrl-enable-v1-1-d3431a98253b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPdxR2cC/x3MQQqAIBBA0avErBtIyaSuEi3UxhooC40IwrsnL
 d/i/xcSRaYEQ/VCpJsTH6FA1BW41YSFkOdikI1shZAaeX/w5OCuuCEFYzdC71SnjbJK2x5KeEb
 y/PzTccr5AxrmlZRkAAAA
X-Change-ID: 20241127-imx-pinctrl-enable-fc567a5b57b9
To: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Esben Haabendal <esben@geanix.com>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LvmHpaWsiLGTPibuZ7yWpqo4clNPX7pnbNk8sleUTwA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnR3JDS5fbsq6RUbHGhH+FD7nNrEDxNnEzj9wjItiT
 tiBJMnuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ0dyQwAKCRAk1otyXVSH0GRqB/
 0QevSDMqjV7z2IZEUNybXCoiOgt1G9j3SwrjYejb0ukcADztwpxBJiZrtEtBVtDCSslxz4VeNbKwFM
 mT5qegrGRBOJwu3fXmoSkUQ9BGG2qU8PdFXHMNvJL9s0NXZxqm3ZmzDi6tIkTYApw7WeGmBljNntRE
 PdypRDnfX3M7hsycjnQTJsyC37bBg/I9aNxqi4hlllqLbjf+M8yBG7nx9G4zLMhFl7Px/lp+JjL6jl
 TiTGWw0tUo8TnehY6xnIb2yRbt+du6x0Q/sdxqbEsCX9i9rGo62Ul/6l7YX3kxCREkgTSSIeLMsXt8
 7pW2FCyELp+ys2eVoRdT0EsXfjBSG1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_112600_097956_DFC68A51 
X-CRM114-Status: GOOD (  10.81  )
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

When the i.MX pinctrl drivers were made user controllable by 17d210018914
("ARM: imx: Allow user to disable pinctrl") the select of pinctrl by the
arch code was removed. This change means that for the i.MX specific
defconfigs nothing enables the base PINCTRL Kconfig and things that depend
on it (eg, audio on the i.MX6 UDOO boards) stop working. Explicitly enable
PINCTRL in these configs to restore functionality with them.

Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm/configs/imx_v4_v5_defconfig | 1 +
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index 875c8cdbada7d662994c9301c1caf5d30d7407e3..1af29d12129d01b0de0b9dde30eb9b43c5a83071 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -83,6 +83,7 @@ CONFIG_I2C_IMX=y
 CONFIG_SPI=y
 CONFIG_SPI_IMX=y
 CONFIG_SPI_SPIDEV=y
+CONFIG_PINCTRL=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_MXC=y
 CONFIG_W1=y
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 0beecdde55f58330494b98ea0f1ecf9c04643e14..73f7aa7e75f71e304ac4c4c64277066d1c03a72a 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -204,6 +204,7 @@ CONFIG_SPI_FSL_QUADSPI=y
 CONFIG_SPI_GPIO=y
 CONFIG_SPI_IMX=y
 CONFIG_SPI_FSL_DSPI=y
+CONFIG_PINCTRL=y
 CONFIG_PINCTRL_IMX8MM=y
 CONFIG_PINCTRL_IMX8MN=y
 CONFIG_PINCTRL_IMX8MP=y

---
base-commit: aaf20f870da056752f6386693cc0d8e25421ef35
change-id: 20241127-imx-pinctrl-enable-fc567a5b57b9

Best regards,
-- 
Mark Brown <broonie@kernel.org>


