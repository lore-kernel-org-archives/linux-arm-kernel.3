Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73ADF433CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 23:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Uzpxb6DtyGHQDbmAOcel7Q32uUlKf4f9KooP+/aMlU=; b=3tUgd0RT58TvWsn+vWSR8PQLoU
	qCWVT8TIFNjtdiRFkXjAYd11YdD6inhr1ZKxWGEZaZr+pfdD+L+k2OapTa1NAPfafqV0Jmu1Js6QP
	wZXXs4QZj7IYVthHTO3Q/dMChjyDzc+DzqytUBxiejypHa0ZWqfz2sEcSr+Zr4RaL6esAzkADiS1H
	LsQfCf4266KDxzX76lSCEB1ykPXRnYA+twn5ez9aexgT4uzH1rUuYVpOtuYLCZXnvvxo0Lr7IblkE
	T06nk1Je6YugMGShcmLhoTPL11y0+3WsRhAM/E+Vu083Z0xctcNNFlz79YC1gYO7vlEezChWKLC6+
	WMWqCwgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9jb-00000001l4T-0L8V;
	Wed, 15 Apr 2026 23:33:27 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD9jX-00000001l2d-0x3o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 23:33:24 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fwyBQ5LQ2z9v1T;
	Thu, 16 Apr 2026 01:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776295998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Uzpxb6DtyGHQDbmAOcel7Q32uUlKf4f9KooP+/aMlU=;
	b=I+YJxD6JOeTuvdvqBS4rZfzM3Gc/UQ0dyk3c3R9qyHX9c7om+ifxD2VWesTrgTpZ8Ic3kN
	u8vrGhcawLS7uBNuBy/eQbK3/5OuiCHJpqTRsG31VepWRPHbYqqy8PVEzE2VY+kcfqhWzU
	+Tnl4cfTyo3WiPr4NMpP13mYS+rtbtY1d2S9fGmvJHVzvwBAUjGHOXSj1Xncu/tpzFqN9Y
	PJYBTHouqPICc0kjB6zlHd08rKBGfEqY5ZKSmr35keDdNkXdTvCOA30al5bb/zcdUBzX2L
	mW3KCUKSEB4EnqwPHiJpApR1kLUDTBf9DlPUPZtc7KXGdqu6Tk/RiTi9bRNy1w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=kBBG6Pc9;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776295997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Uzpxb6DtyGHQDbmAOcel7Q32uUlKf4f9KooP+/aMlU=;
	b=kBBG6Pc91jhmGNTDv5o/v4UchGhW+21cU+Iq6ekWDvr2C95gjGBShLMXDppMLS+DN7hdPx
	QBojmQ9NhAr/HvUz8MprD3y8sAH59dWZTR6GL8faeqjCRKwtFeZapxQtOD9ShTABFoDzFn
	W6Lh1gHlTHnRdb/kWOlWqNQJNRG793j68YNSjQmU8697itXTSdr3H2yuvAbStGDvFfn8CM
	0KB8jNEzM7slP2K0E6PoK18WqyzT5+B1s9Zbfc1Yw31sUIN1i5JgHLDwwhmPW7O6mosMVP
	xLJz06XWt7qj5fCYK05mc1plWk7HgXSg8Vr+a+BlPts9sLJFAALYV6n3xqqd0g==
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
Subject: [PATCH v2 1/4] dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile A1
Date: Thu, 16 Apr 2026 01:31:38 +0200
Message-ID: <20260415233300.457892-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2307a0a962d2af639f0
X-MBO-RS-META: yb79zqqnpc4e74rh61ehhwnu18fx1bsi
X-Rspamd-Queue-Id: 4fwyBQ5LQ2z9v1T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_163323_406353_54BCA616 
X-CRM114-Status: UNSURE (   9.87  )
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

Document ZT trace bus and ZTR trace clock on the R-Mobile A1.

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
V2: Reorder new clock at the end to match bindings
---
 .../devicetree/bindings/clock/renesas,cpg-clocks.yaml       | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
index a0e09b7002f07..925ed35d6658a 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
@@ -41,7 +41,7 @@ properties:
 
   clock-output-names:
     minItems: 3
-    maxItems: 17
+    maxItems: 19
 
   renesas,mode:
     description: Board-specific settings of the MD_CK* bits on R-Mobile A1
@@ -123,6 +123,8 @@ allOf:
             - const: zb
             - const: m3
             - const: cp
+            - const: ztr
+            - const: zt
 
       required:
         - renesas,mode
@@ -240,6 +242,6 @@ examples:
             #clock-cells = <1>;
             clock-output-names = "system", "pllc0", "pllc1", "pllc2", "r",
                                  "usb24s", "i", "zg", "b", "m1", "hp", "hpp",
-                                 "usbp", "s", "zb", "m3", "cp";
+                                 "usbp", "s", "zb", "m3", "cp", "ztr", "zt";
             renesas,mode = <0x05>;
     };
-- 
2.53.0


