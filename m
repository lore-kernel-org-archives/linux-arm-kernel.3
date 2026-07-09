Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE953C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 22:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=laLRk3O1bPDNGHI/gc/k6EDjwMB+P9jDPSaWLIRQBbw=; b=tG/GiFQqaIoosreSpjcT2ZFQLB
	cg0hAvwfNzUaBqrkeGcScBdCEQGZ/rZiLwH8qc7BR3N/eIcacByRTEuvQ66OrrNa7u+ehAaoerVzG
	j6r2D90gzC3Nc3A0QvuFO1LaHyGKb77It7OgGJUAHZ+K8RE9xboN7KUNZXdLWMULvjLkJTgJZXqq2
	JRXISdCObhaimkemecsDHduUkuXH7cNArC/nCO7x4R5+oZ4DHkDWS/r1TUHMbyUi2MEaUIb5t5RoE
	xu4ukrHdaP8vNj63K1kDtCC85bSa8euDDKnaOYfNscSTYDbTX62cb1PY1JUp3Kb214F3B3STVvNFx
	Xl5LiADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whwzR-00000003kqI-2AjT;
	Thu, 09 Jul 2026 22:13:05 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whwzO-00000003kpA-3Alm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 22:13:04 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gx8NS4jDdzKnR7;
	Fri, 10 Jul 2026 00:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783635176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=laLRk3O1bPDNGHI/gc/k6EDjwMB+P9jDPSaWLIRQBbw=;
	b=OqvJPZhIiakwtCop6MXeEMt/soVSIahHllBwACDTaxN+2QwcFt2Wh6NafVwkj6QxTTdFR7
	uq7ex/AKbTFMye2Le8u31XmMtt+l5pWdWILFQoaWhCD3FL3Ss4hovXj5VQCoCaL5CorxVj
	r51VM2FT52f59V/54rYVwWFpJzRLPnWutP1RHAyPxMKQWEW1eZXcHN41uOs1xePiEXAcOa
	xsYjXNCPoA6wzO90KsSiulqw4YqGWKChGUyKe3rxgKPM34IzEQBqw2frKjpgxXMxdrFupO
	J0WSHSTGO53Ka7sL1IgbTVnLUlbXb7F7dzboWyXCvlBzRdfe3jWsuuRIZSYloQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DHl5iHBZ;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783635175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=laLRk3O1bPDNGHI/gc/k6EDjwMB+P9jDPSaWLIRQBbw=;
	b=DHl5iHBZuPMJ33GHGleJrtpeJzBwFkFvJztFvwlkPGoyPQpEE9E4SLab+fzrQVyd0MDknn
	4gsxYj2Zudf1S+pprtoDwjKNjUJvsjfLETZclIk3CJlev33PclRiWsjVybn0tJsQMl83Cc
	nj3zxRLIKrJjMlF8Jqv9XfhoyxrOBZxvGZcnSLV9c6QqB5FIhPA0/kpHuPgZ91GIvtzywB
	mLEOhbvwUt6LJ670o5Ro+hEkTwGmelvoJ15dg9ChTK7HgTR4pDyjjR3p6ObVXWFS4oH2pM
	hxr5BjymqQpGtehVhnCC/p0M5QQG9HsihuUaUOSbyWQgxHOzopooOpI4PHs9NA==
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
Subject: [PATCH] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
Date: Fri, 10 Jul 2026 00:12:16 +0200
Message-ID: <20260709221245.146406-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 64a105b4cf20af77a8f
X-MBO-RS-META: gte15z866jw5dyzru7hp41k38a9ssom7
X-Rspamd-Queue-Id: 4gx8NS4jDdzKnR7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_151302_976356_39EC9EC1 
X-CRM114-Status: UNSURE (   9.33  )
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

The DBSC5 DRAM controller protects DRAM content using inline ECC.
The inline ECC utilizes areas of DRAM for its operation, which are
in the DRAM address range, but must not be accessed or modified.
Describe the inline ECC carveout areas used by the DBSC5 controller
on this hardware as reserved-memory, which must not be accessed.

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
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index d2b3fc08954a1..f073145a682bf 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -107,6 +107,47 @@ tee@8c400000 {
 			reg = <0x0 0x8c400000 0x0 0x02000000>;
 			no-map;
 		};
+
+		/* DRAM controller inline ECC areas */
+		ecc@10cccd0000 {
+			reg = <0x10 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@12cccd0000 {
+			reg = <0x12 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@14cccd0000 {
+			reg = <0x14 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@16cccd0000 {
+			reg = <0x16 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@18cccd0000 {
+			reg = <0x18 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@1acccd0000 {
+			reg = <0x1a 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@1ccccd0000 {
+			reg = <0x1c 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
+
+		ecc@1ecccd0000 {
+			reg = <0x1e 0xcccd0000 0x0 0x33330000>;
+			no-map;
+		};
 	};
 };
 
-- 
2.53.0


