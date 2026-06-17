Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C7FCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 08:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=; b=wRO6zi/cbN9U13XFirFJ3XuC6l
	vbD2h+p/AlXt2yNYZWMeuDxxlEuUgj6HWHp+HBjd1QEd/t+bzYc2UORf3tXmeMf3+S1B6lJ1CFmkI
	4ABhINfZkebfQT3x1LwNn0911a/YSCSlhSqalpnJkukK3lT08pddSqyOPtPaUkx93jJvG8YdbUOFA
	yBE6iEsDWzOc+ZmVKGk1CilHDwsTwSJ+zSDZbwCU4aZ8J+3QObQXpa0bIEuw+IHNs8/IJYiUUS9bm
	qpmgKlQ18vzQF/SsS5l3X4ak2sakCHyYduJg0Up/XnFB6CcUFbkQvfXdWFQk0ZE8gCR2zMtsyloxK
	tpxqGOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlYG-0000000GsEd-3I2M;
	Wed, 17 Jun 2026 08:23:12 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlYE-0000000GsDC-26iR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 08:23:11 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c6be9cd89bso1794855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 01:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684590; x=1782289390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=AP+iMre+3eZK99gGrxhICZXu2/93rO8wMfi+VhxczdbuSD64FCOVsCgVGTVOAIVO9a
         LgtnEWS4MoNUbPgH6VG1CHFMVd0VRXe04eBuZGlQ28+WPctB9zskX+ZWkwxsuGkMFaFj
         lM3Z2b6EZZvdOq2GeY+GKxYADuAmCi6XLrZgPqlI+jvWGI3RhsWzuUdshc3p2d6qohzN
         IGfDmgY8vs+yDoTV/cdIeurGfz41CWqV3OsE5Y8aNxgd2jYmbtZppA2BuAGj/aoaUQ0Q
         3UVwcgdeGC9xl6okCPDUxZs60smb0Q8VIPiJIEVim9dmY7Ko/UP9qcoWavlko2exUZL9
         TKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684590; x=1782289390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=Z9WexMFBBxZ5/myeQssh43oiJnEgZo7FAjIWXUr5NCZNkgubEOmdxJzedf6Do0mqfx
         Jz76b/JWlCyBEVm2T3hxww6WRbr4FvxlmT4IpJWzMaE0AlQy/yEUEX1ZUxhfkEmHoJcH
         na0CISo3+WymrgLFHRN0QadF2eC3IGMXYvi4UKZa6lEARm49/ekHO0GrvxpuP6uNRU4T
         pjyAg5TV2cWZ06chD9/+1ApwtBvNyzh2h97+vHYh7fgsvavxkIXxZk5UURXM9wBi3bbo
         f1msC1SXB4cK1qwPyqoMCZ0ZD0a5boblFdJyyTY/YnEt397p0ugBEn+4Fukym82gUPtR
         cxbw==
X-Forwarded-Encrypted: i=1; AFNElJ84Tz+EN4UFwyvIK9/vup0V3AGmJD0I7LxvWrvJ8bYhWJAhUti5G+aVKmdjzvRoqRkLwvgJ9LQ0au4Z1K1PJ1/Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9eoj3QiQ0fys9NKCuBcG97A51KpiL5rNcVO06qFLohHty3ekB
	/if4mQHcMfGLOKvYVdufNCcEU6Sf09RIfnLoNbN97sQyycJswGzvMhTC
X-Gm-Gg: AfdE7cnPfFqzBMFQGLC5cCcsP2NHF4wtoTUTU907W85vclf3fJ02uGhVMTifVFEifth
	3AECPCMlnIE7zMzBEwrbWR8HnSQkVyNO6hEHU6ESpB8VrZjsSXtT9VKQzb8j2/T/IrEknXy/k2d
	g5HSZRCja54jc+4H7slRCJWOVM+CBgiJhK0Val+Ea4iyUkxbFmO2fFqrw42tbOuh9/dtOjx5pkn
	eSAmaE1ewKRjwn6QJ6c9b2/u8ZouTIm9XfTI7w+RyVixKQ9sfQxttE6bdyM0jwu4vngraJdQrMr
	Io1cnmlslb1oGMCPAIQSFx+NntAMJtqKs02mliwM+9JWRCGlZ1DoXSuw+/AGMdXIGloClTMh+ic
	cQTU7XT1AGTzgnjFErpbsWRtQMUwTNqVGK3KT/BE+GOu8rv7X4Mi3lgkO7zYGDxArU2WhlsBjy4
	V6c6Dce1qqUw==
X-Received: by 2002:a17:902:ecc1:b0:2c6:bb55:4078 with SMTP id d9443c01a7336-2c6bbfa1958mr27798855ad.8.1781684589730;
        Wed, 17 Jun 2026 01:23:09 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm35282045ad.52.2026.06.17.01.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:23:09 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
Date: Wed, 17 Jun 2026 16:22:33 +0800
Message-ID: <20260617082239.645562-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617082239.645562-1-jerrysteve1101@gmail.com>
References: <20260617082239.645562-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_012310_535929_6A930909 
X-CRM114-Status: GOOD (  10.28  )
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

The nand_all_pins pinctrl node was missing the nand_rb0 (ready/busy)
pin description, which is required for NAND controller operation.

Add it to the pinmux list.

Fixes: be18d53c32b2 ("arm64: dts: amlogic: meson-axg: pinctrl node for NAND")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 6457667d974e..8ca3ac09b306 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -481,7 +481,8 @@ mux {
 							 "nand_ale",
 							 "nand_cle",
 							 "nand_wen_clk",
-							 "nand_ren_wr";
+							 "nand_ren_wr",
+							 "nand_rb0";
 						function = "nand";
 						input-enable;
 						bias-pull-up;
-- 
2.54.0


