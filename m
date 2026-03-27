Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABC910BA434
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 00:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FA7vRkaUWeTAiIDXNhp4k7I+V+nhQPb2VXXYgIo7eRQ=; b=wi10r/gvI5HUqanQVN1Xi5fMDY
	tyZKsWS3T/TEZLZFJwxp5r6KlyBbA/rghHE8hurKmt523nX9b7atKIGFKhdBA9Nn6Ggv1K+Tz6vuH
	S2alGZ9Pi7PUQcgDV2+QYWbp6CXOEYhq9IDMeOpZCthFdZI9/VZ7CXxoKUyeGDI61h5vyDdG9517e
	4dDnR5+Vn0BU+VN9qDDQYR84mT0y41+ZPnpZvZINoOhtLLHDg2kBC6MwFsiuycRGhchDSFo+2eWRX
	4K5oMv7tGPfjIRNgyKKNl6QmIIN6HnD3Aj5NjCDgbd8FzYkByiMYqdhnxVkgjc50P8xjcPlYg1ZJJ
	ZUnu9/mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6H72-00000008Ljv-0ZCP;
	Sat, 28 Mar 2026 00:01:12 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6H6k-00000008LeR-31T5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 00:00:58 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fjHj049zlz9tQq;
	Sat, 28 Mar 2026 01:00:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FA7vRkaUWeTAiIDXNhp4k7I+V+nhQPb2VXXYgIo7eRQ=;
	b=o1KxClSY1eeSPxPVEvF8mWbox8jOPmegvPLmiGnUYeAkzZaY4E5rC7U6cruffz6PTvXQLP
	UFgL2TgBDDNbEPiYAS4ucQ6JCcCrh8Tlmn+f79P+U4qlNtyIC91CIjnDf9NqrKhyftMmYf
	C+97uDOFo5LryFCi92dlguzcndbDN4IxTjnFbc8zY1ruskvEj4AFRnyKb3xzZUtLozd/VY
	FkjuQYGncIO6rHs1aGgfyoTXTkoVMtWuxx4x80qYZtpxrpdDQqGMSPOGFtNW20zoEkfKZ8
	IV8sCYlALmSv3jsxk7IZTPJq9M4MlJX5b3uvSBiaEWuXn+0V+dIoFsvQ7G4sIQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FA7vRkaUWeTAiIDXNhp4k7I+V+nhQPb2VXXYgIo7eRQ=;
	b=Flu0XLbqQyKdp4GJqX0R0GesdtjkM1G7HlgcKzSW2bJIzzKjNp4bwHpju7LtItWoiUbzH/
	pdZAfqf+NBCAdF6SwDxGazFLbTo9Lrey+oBchca2BUzwwlRbClRWoKrNIeFVxVxQ55Y+WF
	nYclNd01Bv/cdKvRTN7NAoVYkSwEu60ZioQlQRAWaZasw3FfhCj1o8uj92yorb35AeoB67
	mrut8yO0g3bPeuiEe5Whma8CALLCzxQG1vNsJcS/ViIm++qbcPDkayOxnFzY8i7ViiukP5
	9mNej/Ur7FeMZO+3yB18BfRfd5nQtelnBHrkUhIKPXXfs4LgEjO0K12xZCtJCw==
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
Subject: [RFC][PATCH 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock on R-Mobile A1
Date: Sat, 28 Mar 2026 00:58:20 +0100
Message-ID: <20260328000031.94645-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
References: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e99503f44b42a0a902d
X-MBO-RS-META: 1s68q53skbzoodft3bacmomj6bgdeui9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_170056_792409_34D08859 
X-CRM114-Status: GOOD (  11.09  )
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
 arch/arm/boot/dts/renesas/r8a7740.dtsi    | 6 +++---
 include/dt-bindings/clock/r8a7740-clock.h | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab47..0a622da79dc1a 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -551,9 +551,9 @@ cpg_clocks: cpg_clocks@e6150000 {
 			clock-output-names = "system", "pllc0", "pllc1",
 					     "pllc2", "r",
 					     "usb24s",
-					     "i", "zg", "b", "m1", "hp",
-					     "hpp", "usbp", "s", "zb", "m3",
-					     "cp";
+					     "i", "zg", "b", "m1", "ztr", "zt",
+					     "hp", "hpp", "usbp", "s", "zb",
+					     "m3", "cp";
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


