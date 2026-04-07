Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FD1FEEF29
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 12:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I+WojEMYC6/0fW7pAb7QL78xV/89mZ067SHdrUCnECw=; b=geQJu4xcGuPovaPB5AnNI3PH4d
	g6ukN8z5bwKlmNlUHCYpz4dBJNrWNLM06skyIbgeh15YcO4a3jTr0ITwkPmC6J+gKPfCARejKtvBA
	YVJ8gXFK6Rh3TJ0dcxbv4656kNITqp7HnRrzfjWUvokqq7xQa/2YaFVP0j8kfK60AdwE4fD2oZHBD
	ZqBk4YNjgr91tzn1qDWvrXh0OGlDkqRi1GK6fDT6+LQ0BSC3QY+dDiX7TpYp8jjsx1UN+jIIhjoTF
	sPeXDx8ykE7VhkGI3/K5x6ox+YnPN+HwsQugfiwYVdBakOZ4zqynmTrIFLhg9BfAwL4K3tlLO0x8U
	sT7R7rFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5LT-00000006Qiz-1FFW;
	Tue, 07 Apr 2026 12:15:51 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5LQ-00000006Qi9-3XPR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 12:15:50 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso5706580e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 05:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775564146; x=1776168946; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+WojEMYC6/0fW7pAb7QL78xV/89mZ067SHdrUCnECw=;
        b=Eah2tlvDgT4gb3RGDoSFJoAq2xgDn1muZEVFgDDSCtdSPF3ElWqSZVBVolLV5WLCCc
         COX6RQt4E2zLwcj520iVp6hCtNO30cFSxw1VTD0FR9+WfXOj+muHPa6opaKyUpPg8D65
         jtYcEpsi9Nz61uXMvdd/wnpPmgVGQDGqJbN/M3aZ43zGTc3Zqqxbh9htsVBOurCTPDj/
         y+55CwWMHITTjA6VYFqvWdTEMBm9ceA7KNA2VMUxp8MzF8oCSQxKeI64OqeZxlZBhoPK
         PgmP3ILVrJP69RLKmsgMIx919Ca8B03coXO5ly2uca3OEnSbKWfvpQWXvb6Ea4tuUU6N
         j6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775564146; x=1776168946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+WojEMYC6/0fW7pAb7QL78xV/89mZ067SHdrUCnECw=;
        b=Hgy48B+Vvfy43o5N8Q2Y12lLaoXlCtafoFEpMfxMR9DS2pHYh+DRPHCsfWp27OI9L3
         GUcqcZmmWqMxxr3PaUPXLiNXv8FpmBdoBWCA0UlcnRwfOazYgpqIGOnq84EVSAKlcArf
         NTdxFXHg9djKmDbqVsePUwd0xWNW/+qzWjWNft9cbuwGdFjrStKV1lv5/Z1NiH6pUnLE
         pm45Sw8eBMS7tsmXL9MIEYXL6vuSnXEUmJibs4rxGpdbF2vil6xGoB0z/w1yvXfYvyxz
         mY1hjm/wPr3DVXxlzaX9GcVHj1SC7er4SVcAif89hKWGe/8aKFRftNs01Sal681EDtNX
         t7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmb/Uy4pRPmrpaYKoDL63A9l5tYxutmsplZEWbTD+MB2RnAlyIUH7x6Y2DCeyRCib0fO6p1MHp6EQYDv9zaDlp@lists.infradead.org
X-Gm-Message-State: AOJu0YxahfUWwszbL9/3pGYho1bpdUzJDROtNP2/F6ZQb7W+iJkCZyPu
	XY+5GNjqXzDJCmatY/vJEcG6ep7UhEbD5kYQop3vFqx3TXxCDQ10AoQhuSQTEu3abOY=
X-Gm-Gg: AeBDieuEpjYgtKYaHNptNrgxbUkzDCYIu6rnuxmCKFtiEXrsZR0Qgk4mUOd2Ur9Tha0
	Di6INMnZnvGPZ3rEEAxyXSyxZ78L42uwvBrOsVBPCa+1m92XTRkQScIgS1LjJsQYntKKJy0ygOZ
	o6c+l5na8PjesXvVvlo2m8h+HDn1jp82CQQ1EPZt5gZhRi93bh/heQyjuNrZfUY7lx7U63ymtSS
	0P4y/WOesUYwPFeyuTXokksW2To/ajp4ddjImnutO3++/DxU9w7YaYhL1MOUtUVEjpMwfMvlUQC
	HtqbfHnfSRuqDjWpoVqni2TnvpouZgpPIHXsOOR4c18wa2dh9s7QUT0lXR+DVw16F/vHjSBz2ue
	TcMi8dFZ6b21erYabS6Klm+L+v/3aAYIvdtk7JAToTLy04HpevhF37TXCOWRswyEp0Xt6SPa9YO
	HP565MzMCAl+9ZUf0gO4OtD47tQb7a4hGQLD9xehz+EAfFPmdm/6DdHgoNJLcRdPYTXhBhBKcn6
	J6hFNzOQlw=
X-Received: by 2002:a05:6512:1088:b0:5a2:c199:45a7 with SMTP id 2adb3069b0e04-5a337552810mr6556311e87.5.1775564145863;
        Tue, 07 Apr 2026 05:15:45 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccd2dsm4025361e87.67.2026.04.07.05.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 05:15:45 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] MAINTAINERS, mailmap: Change Ulf Hansson's email
Date: Tue,  7 Apr 2026 14:14:53 +0200
Message-ID: <20260407121458.252451-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_051548_966978_3BECC2B1 
X-CRM114-Status: GOOD (  10.77  )
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

Change my email in MAINTAINERS and add a few entries in mailmap to start
using ulfh@kernel.org.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 .mailmap    |  2 ++
 MAINTAINERS | 14 +++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/.mailmap b/.mailmap
index 2d04aeba68b4..22c5ab1c5d55 100644
--- a/.mailmap
+++ b/.mailmap
@@ -849,6 +849,8 @@ Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko.ursulin@onelan.co.uk>
 Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko@ursulin.net>
 Tycho Andersen <tycho@tycho.pizza> <tycho@tycho.ws>
 Tzung-Bi Shih <tzungbi@kernel.org> <tzungbi@google.com>
+Ulf Hansson <ulfh@kernel.org> <ulf.hansson@linaro.org>
+Ulf Hansson <ulfh@kernel.org> <ulf.hansson@stericsson.com>
 Umang Jain <uajain@igalia.com> <umang.jain@ideasonboard.com>
 Uwe Kleine-König <ukleinek@informatik.uni-freiburg.de>
 Uwe Kleine-König <u.kleine-koenig@baylibre.com> <ukleinek@baylibre.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index c3fe46d7c4bc..7167dcea737d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6716,7 +6716,7 @@ F:	include/linux/platform_data/cpuidle-exynos.h
 CPUIDLE DRIVER - ARM PSCI
 M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
 M:	Sudeep Holla <sudeep.holla@kernel.org>
-M:	Ulf Hansson <ulf.hansson@linaro.org>
+M:	Ulf Hansson <ulfh@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
@@ -6724,7 +6724,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git
 F:	drivers/cpuidle/cpuidle-psci.c
 
 CPUIDLE DRIVER - ARM PSCI PM DOMAIN
-M:	Ulf Hansson <ulf.hansson@linaro.org>
+M:	Ulf Hansson <ulfh@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
@@ -6733,7 +6733,7 @@ F:	drivers/cpuidle/cpuidle-psci-domain.c
 F:	drivers/cpuidle/cpuidle-psci.h
 
 CPUIDLE DRIVER - DT IDLE PM DOMAIN
-M:	Ulf Hansson <ulf.hansson@linaro.org>
+M:	Ulf Hansson <ulfh@kernel.org>
 L:	linux-pm@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git
@@ -10729,7 +10729,7 @@ F:	Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
 F:	drivers/i2c/muxes/i2c-demux-pinctrl.c
 
 GENERIC PM DOMAINS
-M:	Ulf Hansson <ulf.hansson@linaro.org>
+M:	Ulf Hansson <ulfh@kernel.org>
 L:	linux-pm@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/power/power?domain*
@@ -18089,7 +18089,7 @@ F:	drivers/mmc/host/mmc_spi.c
 F:	include/linux/spi/mmc_spi.h
 
 MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND SDIO SUBSYSTEM
-M:	Ulf Hansson <ulf.hansson@linaro.org>
+M:	Ulf Hansson <ulfh@kernel.org>
 L:	linux-mmc@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
@@ -24696,7 +24696,7 @@ F:	drivers/media/i2c/imx415.c
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-M:	Ulf Hansson <ulf.hansson@linaro.org>
+M:	Ulf Hansson <ulfh@kernel.org>
 L:	linux-mmc@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
@@ -27615,7 +27615,7 @@ F:	Documentation/fb/uvesafb.rst
 F:	drivers/video/fbdev/uvesafb.*
 
 Ux500 CLOCK DRIVERS
-M:	Ulf Hansson <ulf.hansson@linaro.org>
+M:	Ulf Hansson <ulfh@kernel.org>
 L:	linux-clk@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.43.0


