Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC2AC5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chm6WJqiFBjd1MryQLxTRtBK0kEL/sJhlApC0WV8UjY=; b=YwJ88CsuJDVirTu+dAbDOHu90F
	ywcqprk+9GEzULkudYSNBWmyr1CkZD+/FKGPdzeWmzp6fy4RhRo/YdfIlCBSI8ZRcBxXM880ZW+XV
	umknEnFWkf0MDRROe7HakCPigK8waUJRZGKybkKo43mnAAzFDEaRri9qrW6CPC2B/oq9LHZhHElRl
	7ZPBx4a8FW02gLi24bvXZIIykSHpfIOd5YFkHoAcXSdkyk2aNTbW6wAQ7ZwISM72csAVR+1d6HXlJ
	Z3EOtE7vtCYqaBO2x7QNXzHwmZvrw7On972ca4MA6OecCR0fgAYWzfCFQX2sj9xh4D5380H5oaih7
	MddgqfHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63Z-0000000ATWB-41XA;
	Sun, 09 Aug 2026 16:07:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63V-0000000ATNr-1VBY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49800c6a846so9783835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 09:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291640; x=1786896440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chm6WJqiFBjd1MryQLxTRtBK0kEL/sJhlApC0WV8UjY=;
        b=CuthCgv67uBRYA5lbjpxfiyDhLIfXFcvLyAH36s4GNMh0x2ZlPxAWy23fyy5OiOpGI
         HVPnlhrTr0S4qHa4P8CItQ4ikLP963V3dYcIezdaYTpcPXyMrUFctfNVpclkM7CBzvzU
         MkNxPW4JexIjkXPkJH26wCLUhaYd+FAt0I0ZazqHVv+3W5BPDIwVaOmrk1iLOvjzTJKn
         7wPkWCnNyRnrKWcBeIbiY6WCS4XAH/xch919wtGydDK827RbP7MGQ2JE25MuaS2z5Jsp
         LE/NLdIN1ptCUTb0eyca0DVYsR0Oe4LguqY8c0XfYdTirRcN5I3RDKWS7VwZ8Txzn6a1
         4JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291640; x=1786896440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=chm6WJqiFBjd1MryQLxTRtBK0kEL/sJhlApC0WV8UjY=;
        b=UFMkNt6WX0aTyhNPGIdZQg4iv/D9uS19DvxutyNKioQ9M786HvqMXOOK2FE04TPS1C
         WAkyxVf5qeXHeNzBCQJhzRbveCJA/39n85drzVMWAI/oHUsh9OR5hTGJLCI5D8I37up2
         uIFkNzwYXVeiZy6iWad7x6UANUTrX1zQRjMZof1YEkzTJMMeB2mLmrXTHrDURyT8r1ZA
         T8S+8tErS+OrWFtx0ss/wWsmcNj0THKcgUbeaS2eCW8z17939p8+tktVW41bQIkJFJNA
         gewCgp/+9x/0fzI4MfwJms84GEss5iwl5R+ir+lsTT+O5p0v/8xy4vJVvF9pGJ2PkpIr
         4/hA==
X-Forwarded-Encrypted: i=1; AHgh+RpuwNYG5isgZBotHrN8Xf6Jb39I7adDW3+RCHOaajJlYsAnLQdDRxNEXgelKCBAeXBNRM3OviyjurBD42dVNZgB@lists.infradead.org
X-Gm-Message-State: AOJu0YzZECZHx3umto8Pg+Dv9HG1miYe7LgrY9pBcH8JlLizHOJs1NnO
	kVILZjUHpMhVRRisqdS+d1c++ymgQEtR3uWxTzdtDZSpmS5kH4fhSSh+
X-Gm-Gg: AR+sD13Y3vTX7O6Wv6qYFwHe5VxwJrPM1uDSyhZ0L5PLJYi5qymB01xfcOuft9D15a1
	MVbWMnq8JttD8wv7yRKfOalAXP5+yDZyEx6o9r4QZEIQayTfZljAjYIYNqfXfZBnvyqg5RQbvRt
	kcRXetc4ldVchfDG9xomiULATsi7A02zxW9Yj+3qx2+eVocGIjiDeD4IwJ6HH4DuqH0kRNyeIYO
	dZkAHsSoKhb3TDIgf/yCuMtH6o9onAv3/XwxrRrfZCauV/P6ZI7CI+5DJNPO7y2TU8/jNaraZ6q
	rnw9OP86qPAJ6xCjdvZtOa7FIuDu4kygIfnMETkpI/c9gXKUZhl7gvEAxWmwgKRdbz7eP2Ak5xQ
	P7qWvDET8ftHLpoPTXgxhi1FvgVjWSyRe7VZt3pCuQNsVvYyn7CRtug6H1XqXSlA7TZY6nzZkzP
	ylMNzaMJOh71LqBo2lRDw6NCeCH4+Y75zcnI8XXhlbzsI4NeB+KIZ1NVpyxE02vB/6
X-Received: by 2002:a7b:c7d3:0:b0:496:c977:3b6d with SMTP id 5b1f17b1804b1-49959e2f01bmr250237915e9.12.1786291639315;
        Sun, 09 Aug 2026 09:07:19 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:18 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 7/8] arm64: dts: mt8167: Properly describe the SoC watchdog
Date: Sun,  9 Aug 2026 18:03:31 +0200
Message-ID: <20260809160643.33991-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090721_421843_8F54ABC6 
X-CRM114-Status: GOOD (  12.90  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..edfffe35ec14 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <dt-bindings/memory/mt8167-larb-port.h>
 #include <dt-bindings/power/mt8167-power.h>
+#include <dt-bindings/reset/mediatek,mt8167-resets.h>
 
 #include "mt8167-pinfunc.h"
 
@@ -95,6 +96,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
-- 
2.43.0


