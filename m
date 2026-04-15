Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AF6F433D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6F3yeHMy8k25IIcLnYtW7efe2hdiABS+2+40RvkQPK0=; b=Ez6g+5a2LQTXzZuXQgUHqGBwUG
	+Qtwvy6GoCUBA4bQSWU0fpknjVfec4u2LT6aht5e0Cqd+f8/DhUApLD10pSFIPjSaMsTznZAObvdG
	V18ifvEXmYRi3y2SMziGWS55Q0X5kdSE358/z6xxVTG5M4HyL+rLQoAAmZ2W0LqyGERUKOT+LGocG
	4Zr+33jWDrhbtLxiimcaIi4CaqX7V/cEjCdG2tlP0TmpPXduU77wMrDD0YeZgj+P4YsXS+AChKk1Q
	5onZMK6yNjNw86zXSNtdh18p0ZHjmKT/+WxKPL+RvrRy0zCt5MLjtdWQxzY3jhld1Tm09fwFHHIDk
	mQhW7iTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9jf-00000001l6T-35Kc;
	Wed, 15 Apr 2026 23:33:31 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9ja-00000001l3p-2jMl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 23:33:27 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fwyBX1Q2Mz9tMx;
	Thu, 16 Apr 2026 01:33:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776296004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6F3yeHMy8k25IIcLnYtW7efe2hdiABS+2+40RvkQPK0=;
	b=OP26vKUg94ZqB/QvEdD8yWrTgN+fPL8+qKHSy5om4XvnxX2HFQcb7+VmpycG2sNTtw9At+
	am1h3N6vngmYigfANbULAVLVXSYJn5ZLBVgh1yd+Q6twoXCYWUujgpEqett55nYJqbH+t2
	+oG0YPreBVMD7VRwmtUsMu0/wkdE67z3GQiWKIniChlCdoYYNo55774Rr+krBaym+a8oW+
	zMk8dKAdhrmQRydbIhk+LS+eUlUXZYmt6CJ+/ZfsOeXt4HqdKgTzT1OC5O3fH40Cayiv7C
	bCTs51ab2KWO5adwyYmNRua3i6ZZ2tbynVtXrqQAiGosYxJ3rNaq83SBT4jeDw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=S+RzvFLU;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776296002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6F3yeHMy8k25IIcLnYtW7efe2hdiABS+2+40RvkQPK0=;
	b=S+RzvFLU/hIIasb9u/MYjs1BdO1bQp04VevVabJ5E/ngJ2x3dQmXc4ItwQsVTnOZTdP53E
	OS3rAj+W2JDqtTI5hUdEVJzVCEwJcG1JaP/5vZ+MUDLnqIY30l5zCHxdDrdjg86nVOiTsT
	Ku7NZSi8FHOVECbmjB6uxH7XLhzNHV0hIf62p5TR9CF6EU0+pqWa6GJbSFhSbFexS7loR3
	uYvJK7IyMZWljWsdjze0bejUDZpaZMq1pAqfwXRFLgNp26BURsiXosI60W8mmHxoLP78Ik
	UXVjXwADn0A581LbVVTIl177NllAXyIvFvNZrmISgma9CjstGJf+3afA/+tKuA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock on R-Mobile A1
Date: Thu, 16 Apr 2026 01:31:40 +0200
Message-ID: <20260415233300.457892-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tofh1r39zydi3jr553sf6yg73abnifyf
X-MBO-RS-ID: 03c2ac607c39a231650
X-Rspamd-Queue-Id: 4fwyBX1Q2Mz9tMx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_163326_836097_02EFF107 
X-CRM114-Status: GOOD (  11.91  )
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

Add ZT trace bus and ZTR trace clock on the R-Mobile A1.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Add ztr/zt clock at the end of the list to match bindings
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi    | 2 +-
 include/dt-bindings/clock/r8a7740-clock.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab47..f7136db7a2eae 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -553,7 +553,7 @@ cpg_clocks: cpg_clocks@e6150000 {
 					     "usb24s",
 					     "i", "zg", "b", "m1", "hp",
 					     "hpp", "usbp", "s", "zb", "m3",
-					     "cp";
+					     "cp", "ztr", "zt";
 		};
 
 		/* Variable factor clocks (DIV6) */
diff --git a/include/dt-bindings/clock/r8a7740-clock.h b/include/dt-bindings/clock/r8a7740-clock.h
index 1b3fdb39cc426..8a8816b2ff6ac 100644
--- a/include/dt-bindings/clock/r8a7740-clock.h
+++ b/include/dt-bindings/clock/r8a7740-clock.h
@@ -24,6 +24,8 @@
 #define R8A7740_CLK_ZB		14
 #define R8A7740_CLK_M3		15
 #define R8A7740_CLK_CP		16
+#define R8A7740_CLK_ZTR		17
+#define R8A7740_CLK_ZT		18
 
 /* MSTP1 */
 #define R8A7740_CLK_CEU21	28
-- 
2.53.0


