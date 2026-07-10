Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E46C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CDpDNvnQLgyr3quS6qpQbz78QxNofrLSJfp6izl15yU=; b=uXvm1Yd2cPDqxNyM6Zob5VFrX9
	GKhFdik/1RhazmC7bZ9PfcslzsR3M3KRSxSOoEzkP8lB1Pm8kphDLmH6e9iNgR426yGWdBdP3w9km
	qJ757hEFtJMw4QuenAnI7UIjxXvE7ViwWp4+TkjjzqlK4v+rqvxmHj5qVJ94ya19yFBTNyY8V3aGz
	+1Q3XW8XyIaeqVvtQvmW/De9frAqMZffTUrt+kjBF/9z3glCk4h3g9vHrFbSvobrflkHyMH7XW/lw
	WEQWh1UA4m4EzjM55qGDdjljxj424+Irq4wtlQVtnDLwH6RyKc4i8NoeTo7mxFEHjiAGwcS05LD6e
	ujKQInhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDis-00000005FpP-0CRc;
	Fri, 10 Jul 2026 16:05:06 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDip-00000005Fou-28F1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 16:05:04 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gxc9S5FB7zMlHM;
	Fri, 10 Jul 2026 18:05:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783699500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CDpDNvnQLgyr3quS6qpQbz78QxNofrLSJfp6izl15yU=;
	b=UhTfV2/J/2xUIMLyx/Pg6bZlMlvPlmDRXKVxpNVfAhg5/XtppmIfYV3eZT0BdiK1fre65r
	JiKF2k0gsIMpJjt11n6RXzQdqbk2NHDwIYU0SieXyzwTLMCQ0jKR1HhHiD8aRkNH5FfDBl
	Yl+mPLA1WC80AgxyIQGAbRRlUaAgCwPWbgH2PizKcppUjOlVKuJlSSQgzSTsJQuNfG/5BZ
	CWr2reeIwtLsHFTbw5MJEkuyU4Ck9xlgaMhaO7WyNeCDTijkvQHyeZ/1x75JnxRBSWUN4E
	pQGqu45dXNA1oCogHGCogfZhuNtMSemdIMDjrRaIf0QT3lsKXxJLUzmQqsJeTg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783699499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CDpDNvnQLgyr3quS6qpQbz78QxNofrLSJfp6izl15yU=;
	b=DcO9dOtr8TKd17O+sfatk3fhp0+Uo3dTlCsP6X1vYumIVvylmZrX/giraWxzQj3iUSA+9j
	khxV/qgqlxP6p2g8NpkowuGUN3BqanVwRLNXluEAHiUTN5GcnXWR6JBA1RJAlQ606wV8iE
	JgZH3Sse6edKRPk3ttvzawDlLeQXywBYF9P1+jkzHXUGAxfaw58ORz3dxsiPuxwO6fnsWb
	DK9hhNT7k7KAUZULFznV7vmuXh9Z6LgeOEYphSn7g3HYYAd9pdeRA74VUiSxea9KKDJ8Wv
	KAyrah0S9lQnjixccU+vc71Sheldi0dx33foco8pVj7W2KhviSx+tpE06Ael8g==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	stable@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
Date: Fri, 10 Jul 2026 18:04:22 +0200
Message-ID: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a2ef8dc264d8dc852ff
X-MBO-RS-META: 37psgr9x8kskyk9qu5wto58symqtbngb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_090503_858628_17077F20 
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

The DBSC5 DRAM controller protects DRAM content using inline ECC.
The inline ECC utilizes areas of DRAM for its operation, which are
in the DRAM address range, but must not be accessed or modified.
Describe the inline ECC carveout areas used by the DBSC5 controller
on this hardware as reserved-memory, which must not be accessed.
Include DRAM areas which are unprotected by ECC as well, those are
parts of the DRAM which directly precede the ECC carveout.

In case of high DRAM utilization, unless the inline ECC carveouts
are properly reserved, Linux may use and corrupt the memory used
by the DBSC5 DRAM controller for inline ECC, which would lead to
the system becoming unstable.

Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
Cc: stable@vger.kernel.org
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Include the unprotected data areas as well
---
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index d2b3fc08954a1..0ab303863155e 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -107,6 +107,47 @@ tee@8c400000 {
 			reg = <0x0 0x8c400000 0x0 0x02000000>;
 			no-map;
 		};
+
+		/* DRAM controller inline ECC areas */
+		ecc@10cccc0000 {
+			reg = <0x10 0xcccc0000 0x0 0x33340000>;
+			no-map;
+		};
+
+		ecc@12cccc0000 {
+			reg = <0x12 0xcccc0000 0x0 0x33340000>;
+			no-map;
+		};
+
+		ecc@14cccc0000 {
+			reg = <0x14 0xcccc0000 0x0 0x33340000>;
+			no-map;
+		};
+
+		ecc@16cccc0000 {
+			reg = <0x16 0xcccc0000 0x0 0x33340000>;
+			no-map;
+		};
+
+		ecc@18cccc0000 {
+			reg = <0x18 0xcccc0000 0x0 0x33340000>;
+			no-map;
+		};
+
+		ecc@1a66660000 {
+			reg = <0x1a 0x66660000 0x0 0x999a0000>;
+			no-map;
+		};
+
+		ecc@1c66660000 {
+			reg = <0x1c 0x66660000 0x0 0x999a0000>;
+			no-map;
+		};
+
+		ecc@1e66660000 {
+			reg = <0x1e 0x66660000 0x0 0x999a0000>;
+			no-map;
+		};
 	};
 };
 
-- 
2.53.0


