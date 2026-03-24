Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CECF532E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=si/eobm2/301x/lhWsQuk+KprwyUBTmSi1/KkCexfss=; b=dw+Z6ekByqUy11kaSn0PjeTafO
	IiWPK7URFK0Lu5jqxrIX+hR6tEG7V/pO3CXDa1NXVuGKiyiHrIoK2rHa2quNT2d9qVNGY6HWP4snc
	43z944EIf1HaKVmMcbbYXtLPG88USzEg3Rtm96mzDCRCMIQovHq9ijRR2Y3UfIeohpiwZv8VyTIIx
	/6WnMoh2Ts1s0YMRDVk2F6dyfxPQSNwkJjBaf5Z9ZuYn2wFVfWVnHK6AKXirp4VuDW9CJPe/U0m/4
	1t4SkF10Igabb0zMfDKgpjO5g3sHIMNncZ4lpiGmBkXp89431Lczw0p1vuSmjpzq8Vodtr2QC50Py
	2ikQYD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wfE-00000000wI5-2nho;
	Tue, 24 Mar 2026 07:59:00 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wfC-00000000wGO-3Q7a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 07:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=si/eobm2/301x/lhWsQuk+KprwyUBTmSi1/KkCexfss=; b=Hjps5GQWep3LPWQCUHnbszejTe
	7xA1D8hzaYKunS5zJ8hp1Bdm0OsuK9dS6vo4H8006fpJ0X73ywNERmf/M5Nkjsb4HEMTDU9u8TSTG
	Sxn2zX8CorzXOMqC+g9A7hwtCajYVkSlea4DcHNpj7C8t3MrfUiShnPqUuFnYT5H7m+XP9l6SX12M
	/Jkiz+7saLmqwNO5Y8VhSiAjycT0aN3ikcjT1qvNc7RcwdESdZ/gzKA2CfHaMsoKl6jlwFIcVeS6Q
	pZLNOM1YWms97B+xAnoLNrcKu5DPb2sP59eHD2NMlguzAygpSg6yiH5d56hwEDZXMw41E5pSWPFco
	Q5b+ltHA==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4wf5-000Hjo-0Z;
	Tue, 24 Mar 2026 08:58:51 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4wf3-000Oz1-2t;
	Tue, 24 Mar 2026 08:58:50 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: imx8mp-tqma8mpql: Add DT overlays to explicit list
Date: Tue, 24 Mar 2026 08:58:41 +0100
Message-ID: <20260324075842.815005-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27950/Tue Mar 24 07:24:19 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_005858_964765_FC547D20 
X-CRM114-Status: UNSURE (   8.96  )
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

Armbian installs DT overlays using dtbs_install. For it to work all
the overlays have to be added to dtb-y explicitly.
Add the overlays for platforms supported by Armbian.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 9a55a86ad385b..fb5073196fdf5 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -347,8 +347,11 @@ imx8mp-tqma8mpql-mba8mp-ras314-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
 imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb
 
-- 
2.43.0


