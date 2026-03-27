Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C55710ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnjlpAnjBkbXieTniG8gr1DDDGhDXEBjwY42uzqF9W4=; b=eqDFwXzEZ9k3BhctnzqwPqz8uc
	/2/aZThTOchMxLl2PGsyKBsThVImDo3fuf6So4SN//DVxWqnG+7NIESX6msordHbvTM5mAogZ/Gyi
	Y7YeQh7IRCBRJdP9Ii6EkPFa/cOECkRZjqZrijvQuGyOvNfRhVSSm8SrEpMuM1jXtEjMOO3o91Nlx
	Pv/qEEfmVr6a2G6rV26qUHoAWtYf7xC/quxVoK9T7mVRUbCcu0aEoBGKUYPmqSWA4JZnE4eIOhmBy
	mHiXlnyfdedmsVz6oc0Vh3hZtUq1r/1ebkEWIwBSsL32Y8IKyO+ii91WNIpEumXkvAlGiVNPfqL0C
	PTy6dC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65OV-00000007DoE-0p7o;
	Fri, 27 Mar 2026 11:30:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65ON-00000007Dkz-3k6Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:30:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B04A135A5;
	Fri, 27 Mar 2026 04:30:11 -0700 (PDT)
Received: from e142021.cambridge.arm.com (e142021.arm.com [10.1.36.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18AFE3F915;
	Fri, 27 Mar 2026 04:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774611017; bh=P+xaz+0AM8oCDJ+fmGXliUwK+vicc4AlZE4yIXarY4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AErEQxpSUdhG8nEWVAHMVM7xjAnbqOhcqrCDh7JsHrAs8oudY6AO9ntvfslMtBgny
	 LMsa1o8flPTUNvAx1+9UTyzXeBiFo87WT4urbLcLpBGYvXFHO+TJ9NN+Akt36kNN1n
	 7I1CX50Iaw4x2kFzc8HYE3VrsR9A+bSaE4VUJzbA=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] pinctrl: sunxi: a523: Remove unneeded IRQ remuxing flag
Date: Fri, 27 Mar 2026 11:30:04 +0000
Message-ID: <20260327113006.3135663-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327113006.3135663-1-andre.przywara@arm.com>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043019_971217_35B12A9B 
X-CRM114-Status: GOOD (  15.08  )
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

The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
that line is muxed for IRQ triggering (muxval 6), but only if it's
explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
behaviour, so we added a optional workaround, triggered by a quirk bit,
which triggers remuxing the pin when it's configured for IRQ, while we
need to read its value.

For some reasons this quirk flag was copied over to newer SoCs, even
though they don't show this behaviour, and the GPIO data register
reflects the true GPIO state even with a pin muxed to IRQ trigger.

Remove the unneeded quirk from the A523 family, where it's definitely
not needed (confirmed by experiments), and where it actually breaks,
because the workaround is not compatible with the newer generation
pinctrl IP used in that chip.

Together with a DT change this fixes GPIO IRQ operation on the A523
family of SoCs, as for instance used for the SD card detection.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A523 GPIO ports")
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 1 -
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index 69cd2b4ebd7d..462aa1c4a5fa 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -26,7 +26,6 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
 	.irq_bank_map = a523_r_irq_bank_map,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 	.pin_base = PL_BASE,
 };
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 7d2308c37d29..b6f78f1f30ac 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -26,7 +26,6 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a523_pinctrl_data = {
 	.irq_banks = ARRAY_SIZE(a523_irq_bank_map),
 	.irq_bank_map = a523_irq_bank_map,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
 
-- 
2.43.0


