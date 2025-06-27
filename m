Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BACDC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M4o1mmAGEsf5Agze6Yc8E7yYvvCWB7C1WHPlHiIkd64=; b=DqGt7ihWAB7O7hZ/IK7McLYoLj
	/r85I74wriAi0bzOmZ0Z7Uu9A47Wl0cziEdwVsv/uhvwKAZ4jiMVQUpZRJgudmczelH2pEnUNbuMy
	yXmzQOEBKDKM3NLKf9rgLeK4X7lfFYB8nbsDJZjdLo2T/BHhXLGZcJdQdmdvdmnns0cWx8BPdqNgS
	w98r313EsSnMogc92tZFbCag7t7HZvT8iZg8Y8gMcBao7UlcK0PNA5niN56tuza41GyWooZCEPaVo
	0jisN5cygGtztFN8SuGp8r2XFpDK1zfmqbUzcNZBkMbEv16OD6XPJ7KzYaT3lUg8zQnVMxSzn6C4d
	/zRw3i3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9Rx-0000000Ep9N-1WBJ;
	Fri, 27 Jun 2025 13:49:05 +0000
Received: from mta-64-225.siemens.flowmailer.net ([185.136.64.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8ua-0000000EkGc-1aVP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:14:38 +0000
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250627131426b7b319e1720e05636b
        for <linux-arm-kernel@lists.infradead.org>;
        Fri, 27 Jun 2025 15:14:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=M4o1mmAGEsf5Agze6Yc8E7yYvvCWB7C1WHPlHiIkd64=;
 b=NknhPClr7PprOtuFLqVoQoigCsC/fp8L63nr9ZT+VhQURM3aPPKa+CvAKrjU+CNT0j47oR
 cm7e26Z2e73zs9J93WZi4lyoAafUooAJA7vj4pZGSBa/NioXPq44qsO2MGZW3tYb+AXe2foB
 2HXutKzK/P1+B9fYXP/M9oYSQDHxyDAd96brh76vYblYWIWOtCLS/DQ92HQgSIcpNR9zIoMv
 nL6cRWqrzkk7fL03/zD9kVf8yvzLrpob1pUROFsvDWIKlOodJGipfrh642fs/wwNxV4+zBt+
 xwHk2uQnntmavXFmfpI/Knj9SoFE1Kl7ZqvueMrnHxvWChTmufnW0JxA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: k3-pinctrl: Introduce Schmitt Trigger macros
Date: Fri, 27 Jun 2025 15:13:23 +0200
Message-ID: <20250627131332.2806026-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_061437_013611_729BB48E 
X-CRM114-Status: UNSURE (   7.00  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Introduce ST_DISABLE and ST_ENABLE macros so that they can be used in
conjunction with PIN_INPUT* macros, e.g. (PIN_INPUT | ST_ENABLE).

Note that K3 might have quite strict input slew rate requirements and
all inputs actually have ST enabled on reset, but AM62PX_IOPAD macro
will not preserve this power-on default config. Therefore ST_ENABLE
is encouraged in many situations, especially if the input is to be
used as IRQ trigger.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index cac7cccc11121..3e371be7b8062 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -8,6 +8,7 @@
 #ifndef DTS_ARM64_TI_K3_PINCTRL_H
 #define DTS_ARM64_TI_K3_PINCTRL_H
 
+#define ST_EN_SHIFT		(14)
 #define PULLUDEN_SHIFT		(16)
 #define PULLTYPESEL_SHIFT	(17)
 #define RXACTIVE_SHIFT		(18)
@@ -44,6 +45,10 @@
 #define PIN_DEBOUNCE_CONF5	(5 << DEBOUNCE_SHIFT)
 #define PIN_DEBOUNCE_CONF6	(6 << DEBOUNCE_SHIFT)
 
+/* Schmitt trigger configuration */
+#define ST_DISABLE		(0 << ST_EN_SHIFT)
+#define ST_ENABLE		(1 << ST_EN_SHIFT)
+
 #define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
 #define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
 #define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
-- 
2.50.0


