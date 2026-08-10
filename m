Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048E1C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 21:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hwj3nUg1FBP5shh7DqZ3NtUOXglAZAadgRkvkF0DEMI=; b=DsvRoigwUFD8HyVWZnQfRI4Pwb
	mqety8W0BXVonsVEsmtbSSiNBThAeKs8ODnRZ0s96HbfmBePGjEdeJLB3XAa2qr4CZOxeqcak1JxL
	ow39001AWb+rlMTtctzmdPF3soqqBMt4PuLvKF3LY5N0Vt3rIX6m+2mj9GAcKjnA9gkzZ7tG0/dF6
	M78NeXVWvVOBN47HjiahpyllRa3FrtwAqmdQ4zaNMmd/dGLhQ0Q3z3rSIYWKNQZhlYNYcbuwWIpLS
	PvSQd5gNKw0kfW/7fgNbFPq2oCkW+PciIivI8MoFhkBarKtnZe/m65ghzYXSeS3PkVVMn7Fq0LqP9
	i6T8Zafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXeT-0000000CuzK-0W4e;
	Mon, 10 Aug 2026 21:35:21 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXeP-0000000Cuxu-43dY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 21:35:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96D48118B78;
	Mon, 10 Aug 2026 23:35:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786397708; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Hwj3nUg1FBP5shh7DqZ3NtUOXglAZAadgRkvkF0DEMI=;
	b=DUDyNCEtSxV9XNpmuwXO4GCErT0GIbCgNyGsEnqjj2wBDaoJJc+tcaYWTblRr9yqI1UUtM
	E5b32/9f83zobT+y4RdaXNfHvv/gwMvS3RUrED9PkX2PNfG/bzLq5/H0JYOFqUYYMCl9Hw
	f7Adbk75G0irnV4xuQVGbgSR7Wdv/UUlUrij3S3FPpjfe13ZMbnwO2rIL0NrsKWS3nygWX
	ty0dnadhaskeTXGO/vmToO4vCoQliuzb7Z9iNl+0aVtf27ZR4vrP1xXDLl0HvlSi3hz6A1
	aJOBuPSzlxZLhXZDWy7aehy1GTA7gClIgbwC3y4h0AVNOmd666chygcBJANJVQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Fedor Ross <fedor.ross@ifm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: Select HAVE_SHARED_GPIOS for ARCH_MXC
Date: Mon, 10 Aug 2026 23:34:38 +0200
Message-ID: <20260810213456.1268831-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_143518_230016_6A14F695 
X-CRM114-Status: UNSURE (   8.77  )
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

Some NXP i.MX platforms use shared GPIOs. Enable support for them by
selecting the Kconfig switch provided by GPIOLIB.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Fedor Ross <fedor.ross@ifm.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac730037..bc279b864d3cb 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -275,6 +275,7 @@ config ARCH_MXC
 	bool "NXP i.MX SoC family"
 	select ARM64_ERRATUM_843419
 	select ARM64_ERRATUM_845719 if COMPAT
+	select HAVE_SHARED_GPIOS
 	select IMX_GPCV2
 	select IMX_GPCV2_PM_DOMAINS
 	select PM
-- 
2.53.0


