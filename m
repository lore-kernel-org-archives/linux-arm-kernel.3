Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488C8C71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 06:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TTVupIh3/NLv+xYBDsRvUPwD/5Acjy4PdaTxo3ztWzE=; b=cmyrV7Ryn63b63fGbWtBfypdEP
	D76HRvf2J83zG0nWc7pjXkWlI78XDKJmJTQ9hUaEiy/sjrJLCUggXe0Kia11YEtTNt7W2jTdGhAMU
	8H/KnPuEaMIVt0o9iabRINM9cMCt8y2JZ7SWq+bZSkf/PKGcE5c5LazyzecV+jMByCEZq9b21qUCM
	lxnfFuB7i9BReg0JEqPR6yarur9iWlhetw49s/7hlwMyHnSceTuCVJ9iDpEGn8SOwDzZUuxPXTGYM
	Tq/FTTQL2DhY5drz4SC6F0eQvJGY1TS+OwN6wl2ODA4hURbaYkHNkwHBnNaL7uvQOsUUIBeqg5STt
	qR3tVPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8KV-0000000C7JL-1G30;
	Thu, 19 Jun 2025 06:00:55 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS85e-0000000C5Hs-3M29
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 05:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1750311934; x=1781847934;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TTVupIh3/NLv+xYBDsRvUPwD/5Acjy4PdaTxo3ztWzE=;
  b=eog0HCtNXBWbltPYtWh/Gb3/FvzJREAcy+7CLaPmGCK3NmjZhYbiyP2T
   GIua8zUAq1fQMwWrtBWngxBnYgQ5sAj3SOouHsw+9ejjWmjFJM7yKGXMf
   ACMqiKnhUxGZBYBCKSjVE9AZ0aRifKhCjzkRmZZ7jlMnclFE2asntRGCo
   +bDoe8Z0VsSV8yyFvsJw7Mp7oVbvs+FtVdA0F9bz49NE/6rVR8AtxAddF
   r1Rwv2GxiaalIoesu4MpwmF8MNs+NRUdOtk+OyZr66rhAshVTIC1bpmOa
   CYNIQVNp9Km6s5rIpy/b38viA0G0cYFHd2dGssspbja+BDQPPaKDlIrHC
   Q==;
X-CSE-ConnectionGUID: WD3UMgvQRs+EzjKKO2jI5Q==
X-CSE-MsgGUID: KE/UAAHXQ5mhrNJ2FGrXVw==
X-IronPort-AV: E=Sophos;i="6.16,247,1744063200"; 
   d="scan'208";a="44731634"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Jun 2025 07:45:30 +0200
X-CheckPoint: {6853A3FA-3-569BE4A0-ECC5EE08}
X-MAIL-CPID: 034B6BD5CF42ADFF2113C74676D88493_3
X-Control-Analysis: str=0001.0A006378.6853A411.0009,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE378160EBC;
	Thu, 19 Jun 2025 07:45:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1750311925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TTVupIh3/NLv+xYBDsRvUPwD/5Acjy4PdaTxo3ztWzE=;
	b=EA0qTvV8oKUkp8vUNmNET8RoIKQnfWcJ7ND4g4sdTre5HFh8HpcjS3ujQM6PLu6Ap1neEe
	KnZuaRTuykMQJyx2rgzo4nuOOLVjaS2ujXq22i1wBOTMNXQdchKVOQFP5uwXXX5vuzJaN/
	B1LLafpTbxHiLnEnK6+plKU1R9Yu4rrF0PNOkgG+zbKEmI0j+v0HXSprIesp7QHn7s8P1e
	jzX3SxQ8VvKN4uUPIDd8+wScrB0Fad7Qb7VooDycqFlnuFPozJ7NCxXGu/dpBkgJkov7Lt
	J4souz3Xnw6AGOe/HbdKOFH7MkasIaJLYmzIiwtRmHw/kFzeX/acFEpa5p2mzA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay to include display name
Date: Thu, 19 Jun 2025 07:45:11 +0200
Message-ID: <20250619054513.2134620-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_224535_326826_CA983D08 
X-CRM114-Status: UNSURE (   9.38  )
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

This platform supports several displays, so rename the overlay to reflect
the actual display being used. This also aligns the name to the other
TQMa8M* modules. Apply the same change for MBa8MP-RAS314 as well, as it
uses the same overlay.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
* Rebase to next-20250618
* Include MBa8MP-RAS314 as well (uses the same overlay)
* Fix DT order

 arch/arm64/boot/dts/freescale/Makefile               | 12 ++++++------
 ... imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} |  0
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename arch/arm64/boot/dts/freescale/{imx8mp-tqma8mpql-mba8mpxl-lvds.dtso => imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} (100%)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0b473a23d1200..8403253eadb9f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -260,16 +260,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
-imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
+imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
 imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
 imx8mp-tqma8mpql-mba8mp-ras314-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
-imx8mp-tqma8mpql-mba8mp-ras314-lvds-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
-imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
+imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
+imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-imx219.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
 imx8mq-evk-pcie1-ep-dtbs += imx8mq-evk.dtb imx-pcie1-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
similarity index 100%
rename from arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtso
rename to arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso
-- 
2.43.0


