Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA77C44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CpV/surFpPC4mt4ppalNgv6Fp6w6RgS0HjdjNc272JE=; b=yU/surTPLpSPf2zJ/j9PlsDIGG
	IsUNb2h2yUVhO4+0hJcYtDqrRMJ5vBo9rHDXXLhzZQWBk3/RMfRkWic5BlFDe3VgQiVa1gV2HDotK
	iv4+HMSSD0LwzAfK7AjL/ozKY3ZlSp0Ub1DDN5C1hzuFT7Op4FGaq6+tbrjD29bC38WUDfZOZgZ49
	YAfvqAKXQwwhcYVf3dwNnyicENDfIDTVOEene5nYQbs4RcUJZOqieOHWj0kiYaBRY4cN9nwozKzWA
	tnGdo7SMVV5hd/94VhzmdM1RSrxq5mbVLSuGlIbmdMEy6U554vi2OApPCFavTPnOtb3p4tz4uOIuE
	itdSe74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoP-000000007xv-3Al4;
	Thu, 16 Jul 2026 16:19:49 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoM-000000007wc-2qHa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:19:47 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84830c774a0so2819514b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218785; x=1784823585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CpV/surFpPC4mt4ppalNgv6Fp6w6RgS0HjdjNc272JE=;
        b=k1zQLyVnik1mjhOzSCy5OBDmntrI/kPcEmUfoCIgPrpOXLbJvtT9rcBSk5poZlG5WF
         eCTUpytx9ahvp+PildtaUXlW+X4ZaNTM+kSBBDMR6conWAGLI2pA0MinXRffrSeVNMgo
         WjmbyxFShn1saa5Q8xIXG7j/K7VoXajnxSp0fZGUCZsY5RdHTlKlLe+26gnhw0/kty1G
         vGEeEm4izc0JH6hoVF3mzmuen0ewESzRSCEsHV7AjpntL5gtjC5oNJPy85TNCHEMc32U
         qb2mp92XyRU6twIKLPDH4y8Pj8LIHfNIiZFRkNKbpw6YvCp5e1ITYdq3Tz0jwTRA/wUv
         sLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218785; x=1784823585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CpV/surFpPC4mt4ppalNgv6Fp6w6RgS0HjdjNc272JE=;
        b=rTo/vZt63wxTQ1L63Nr656aQvEVDqGctRGSqrhRd2qKT7e6+l83zwL1PKgf018wdjk
         iq2hgMliCmR/1gvTBvgDwHHOG9Fnb0woRNJtxfRmeFQEMgpQ4TriF2E13pJBYdamLt2w
         SIyH2kTSqRBCFmueaqT8H0iDWefl9uVIi5IA5vZhIu42Ap5g5ttM8sc7PvnR5fYTyGbi
         Ae9tpIgEYZeHimCrZ9HUGWPEx5OSj+JBa8Gdsgtk+mWGy8zTpBn+5VV/4ssqvAFImjD+
         WUWNRASnBp0BRZuQ0/cIumQ4kAqJfzU9HfMM3Xu5l2b3W2vUDnTqc33pHOwDF7X2zaqW
         M8HQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+luNI6zVRiRVy0WbdzEfVNnl/PjGL6wx/QKQOGK4iUcpOyoWtICOcxnDwFlsG7Krg15VTrWpmZV1pnfjLUyJL@lists.infradead.org
X-Gm-Message-State: AOJu0YxlxPg2Az7h6MpoW75Xvt4Uan5e9VakKlG64vEHbhthIFp9ivih
	dICYqv+AEv5x5Z4JAxAPHH28to3pYuof6PlZWg524vjV7KfCZOlNTNki
X-Gm-Gg: AfdE7clswL26EIyvZ6khTrzx6igjSmp8UU+srAcMjeuiGIoUrlaaCPfq7ezAWb2UFYF
	CQkHK2ukE3XQdma3u2UjCMJcjxemIvI+eB1dYM2dEZtjJkuk6I4ANBfN89GXwDl1LqCL03IUT+1
	mybuAZO5Q+6cfx+/ipFYTOyGbTrVbTgyTMZZq7gThJen9u4sTWXzYwyrDnDcYOcISeNaxhqPDNK
	r+LoNhNS4VK6mHaFXrq9Tx118M+sm7pqypffXJLTT8R1sUPEUetkmZZ1vtRReyynbulDJRTkuhr
	pea7+XB0R6GRmP0N5x3/30OUK2Ae/d08UTd1AOrh8eSX0yawe76QdHZzz7HT+LiYCkETtfwJnhA
	5Q1nGIxLwCAo310cN2fo93f0CCkwzzp8+VQdzaWBth9mNjXWBRr1GD/MWPgA/c0KnOoPs5KX45L
	c8hM+I4rQxmoPZ9V34anrEfAH9VUQfWuJFcw==
X-Received: by 2002:a05:6a00:2d25:b0:848:425a:4e31 with SMTP id d2e1a72fcca58-8488971545amr21155827b3a.24.1784218785118;
        Thu, 16 Jul 2026 09:19:45 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:44 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 0/7] Add reset support to MT6589 wdt and remove fallback compatibles
Date: Fri, 17 Jul 2026 01:19:16 +0900
Message-ID: <20260716161923.266315-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_091946_770434_8446B648 
X-CRM114-Status: GOOD (  13.89  )
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

This series adds TOPRGU reset controller support to the MT6589 watchdog
and removes the use of "mediatek,mt6589-wdt" as the fallback compatible
from many other MediaTek SoCs.

Many SoCs have been using "mediatek,mt6589-wdt" as the fallback.
However, they are not compatible with the MT6589's reset register.

To add reset support to MT6589 wdt and resolve this problem safely,
the series proceeds step by step:

 1. Add explicit driver entries for the affected SoCs,
    so they can be matched directly.
 2. Extend the dt-binding to accept the SoC-specific compatibles while
    still allowing the old fallback form.
 3. Drop the mt6589 fallback from all in-tree DTS.
 4. Remove the fallback from the dt-binding.
 5. Add the MT6589 reset dt-binding header.
 6. Assign reset data exclusively to the mt6589-wdt entry.
 7. Add #reset-cells to the MT6589 to enable TOPRGU reset controller.


Akari Tsuyukusa (7):
  watchdog: mtk_wdt: add explicit compatibles for SoCs using mt6589
    fallback
  dt-bindings: watchdog: mediatek,mtk-wdt: add compatibles for all SoCs
  arm/arm64: dts: mediatek: drop mt6589 fallback from watchdog
  dt-bindings: watchdog: mediatek,mtk-wdt: remove mt6589 fallback items
  dt-bindings: reset: Add bindings for MediaTek MT6589 reset controller
  watchdog: mtk_wdt: add reset controller support for MT6589
  arm: dts: mediatek: mt6589: add reset support for wdt

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 26 ++++++++-----------
 arch/arm/boot/dts/mediatek/mt2701.dtsi        |  3 +--
 arch/arm/boot/dts/mediatek/mt6572.dtsi        |  2 +-
 arch/arm/boot/dts/mediatek/mt6582.dtsi        |  2 +-
 arch/arm/boot/dts/mediatek/mt6589.dtsi        |  1 +
 arch/arm/boot/dts/mediatek/mt7623.dtsi        |  3 +--
 arch/arm/boot/dts/mediatek/mt7629.dtsi        |  3 +--
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |  2 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |  3 +--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  3 +--
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      |  2 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  3 +--
 drivers/watchdog/mtk_wdt.c                    | 18 ++++++++++++-
 include/dt-bindings/reset/mt6589-resets.h     | 25 ++++++++++++++++++
 14 files changed, 64 insertions(+), 32 deletions(-)
 create mode 100644 include/dt-bindings/reset/mt6589-resets.h

-- 
2.54.0


