Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF05AD68BDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 23:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qcrQFln46UFlE694DWfC1ZjSKJsmjOjqAXF3uHAiEnk=; b=NF6hsAaPFCKojYzaYWyhzREHOd
	b13E1PJb5d3fF1Yx5ivg1IYy2n7W2QjpYpUI0n3rMX0CLNWp5bAKyOfmZCaQd5EADLDW7lifvAY0/
	/u+LYQHUaIhmBLN+eIIO2cBo0C0DqAacskbAzo2vvsYvM7zOA70/5jA52V6JLBWOqcH77rp7OR3Uj
	us9zCSlD3fuj2hNg82yWSiV9U5IS+9K2/TtaXLJcvnm2hYlRu7JCocaJB3NC4E4Mq+4CKnSLwTn3y
	J0kXcDKvGWVEko3fjxCrfgnqKa3pDKe65iZU3O9WUtIe3H387FrCI2cihc/X2Hv8dZHmutoxJazPF
	9y5wohBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5P2-00000004Vq8-3yZk;
	Fri, 15 Nov 2024 23:07:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5O7-00000004Vf1-1fcY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 23:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D764A41EC0;
	Fri, 15 Nov 2024 23:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8F9C4CECF;
	Fri, 15 Nov 2024 23:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731711961;
	bh=e/qjcGC/Gz+mw55kmBF1sqB0PcOV6jBJy2tWUAT/rrA=;
	h=From:To:Cc:Subject:Date:From;
	b=nbpOA4J6ApxLj+x+T5PhlAzZATCwyQyhz9cFaeuFTriSV4jNBgkbcr+YnT33CYU8f
	 eb8CEWGe+UYmE2Z1tYhdoNvTCMqp/8kQiVF+u4FiY0b6NUVDACoDDBTYWU4G2s+c5i
	 4CmvxKD8UuBy1FbWwC/Tr5lR5qYs6ArlnuKhMyv+o9vfI4QT5aAEwNOT9K9xvWwCFC
	 Q6EVTnvXodkHea6AHDiFU8u7n6qvsNnp3gJGfR54eNhE6qBSNIjR2C8nixbI9E1jIc
	 qc2mh+B1ItHKTHebK/Fv2URc/CxqJzilq8FPBpLHWa7fz90Xj/2piDikKkbT4IPave
	 Y30wzoHEagrsg==
From: Arnd Bergmann <arnd@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: fix i.MX build dependency
Date: Sat, 16 Nov 2024 00:05:18 +0100
Message-Id: <20241115230555.2435004-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_150603_571532_9CB7ECD9 
X-CRM114-Status: GOOD (  22.54  )
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

From: Arnd Bergmann <arnd@arndb.de>

The newly added SCMI vendor driver references functions in the
protocol driver but needs a Kconfig dependency to ensure it can link,
essentially the Kconfig dependency needs to be reversed to match the
link time dependency:

arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_write':
fsl_mqs.c:(.text+0x1aa): undefined reference to `scmi_imx_misc_ctrl_set'
arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_read':
fsl_mqs.c:(.text+0x1ee): undefined reference to `scmi_imx_misc_ctrl_get'

This however only works after changing the dependency in the SND_SOC_FSL_MQS
driver as well, which uses 'select IMX_SCMI_MISC_DRV' to turn on a
driver it depends on. This is generally a bad idea, so the best solution
is to change that into a dependency.

To allow the ASoC driver to keep building with the SCMI support, this
needs to be an optional dependency that enforces the link-time
dependency if IMX_SCMI_MISC_DRV is a loadable module but not
depend on it if that is disabled.

Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MISC protocol")
Fixes: 101c9023594a ("ASoC: fsl_mqs: Support accessing registers by scmi interface")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I'm not sure this is the version we want to go with in the end, without
having read the code in detail, but the version in linux-next is clearly
wrong in multiple ways and this is the best I could come up with so far.

If we can agree on this approach, it needs to go through the ASoC tree
as that contains the 101c9023594a commit at the moment.
---
 drivers/firmware/arm_scmi/vendors/imx/Kconfig | 1 +
 drivers/firmware/imx/Kconfig                  | 1 -
 sound/soc/fsl/Kconfig                         | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
index 2883ed24a84d..a01bf5e47301 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
+++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
@@ -15,6 +15,7 @@ config IMX_SCMI_BBM_EXT
 config IMX_SCMI_MISC_EXT
 	tristate "i.MX SCMI MISC EXTENSION"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	depends on IMX_SCMI_MISC_DRV
 	default y if ARCH_MXC
 	help
 	  This enables i.MX System MISC control logic such as gpio expander
diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 477d3f32d99a..907cd149c40a 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -25,7 +25,6 @@ config IMX_SCU
 
 config IMX_SCMI_MISC_DRV
 	tristate "IMX SCMI MISC Protocol driver"
-	depends on IMX_SCMI_MISC_EXT || COMPILE_TEST
 	default y if ARCH_MXC
 	help
 	  The System Controller Management Interface firmware (SCMI FW) is
diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 8e88830e8e57..678540b78280 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -29,8 +29,8 @@ config SND_SOC_FSL_SAI
 config SND_SOC_FSL_MQS
 	tristate "Medium Quality Sound (MQS) module support"
 	depends on SND_SOC_FSL_SAI
+	depends on IMX_SCMI_MISC_DRV || !IMX_SCMI_MISC_DRV
 	select REGMAP_MMIO
-	select IMX_SCMI_MISC_DRV if IMX_SCMI_MISC_EXT !=n
 	help
 	  Say Y if you want to add Medium Quality Sound (MQS)
 	  support for the Freescale CPUs.
-- 
2.39.5


