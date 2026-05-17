Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB26CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 16:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eImlYbdZ7QoBtV/tqV5M9hyci2tjWpC0XXN0ko+thxo=; b=HGz9dSvfgOSTzReolTFQ+iISGE
	u+9bvwYb8+HSH0+yb/uryDRVkDNFdNfNxAce8Yaj6zyNLU6g3anaAdY9QkIuXBJrCuKynoBFcG0Tc
	Y9A0WOQPiZcN7S7IPh3Cung2Ze9Cx/u++sFzukXmON5hNpHBChIU93ywHbEtbP5lKxXMLOIysxc/v
	9+lGexUAg433B9izzZb/Qx09F2mBK7IonKr2K3Pk6eS/5DB+PtPkJrG4mupBl14xmwGpPJ3Cqp201
	Gj3CRp8o/9kgfZHngoN3ok4lXiurlE4DIlEexR8+ugCFlqW0mwkb11QlJO8PiD5ojoaWT615hcduK
	ZoOfiKMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOeQ7-0000000D1pN-3iOr;
	Sun, 17 May 2026 16:32:51 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOeQ5-0000000D1oP-01UE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 16:32:50 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gJRLN58Xtz9ss2;
	Sun, 17 May 2026 18:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779035564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eImlYbdZ7QoBtV/tqV5M9hyci2tjWpC0XXN0ko+thxo=;
	b=s6umqwZJng3J4dI6QSNHOrxKJfT1KGYJmJ6a6x5f1WEThx5Wn0YQ0uvNOgyZU5tR81qA8h
	0vLjcb52aF5HNmkOf6AGFkY19XPw78GfpQKwvlmau7M8jp1e15kVp0hrHbmwsBfM0Qbcf1
	YErEOx5Kx82jqEJQkM5tbPBOqnRbhsnJMqkyGRzqJm4/mus715kAtUODZaBiBeV7Kf6pXW
	r4NnyKfbxZQ1E9Ql8/gsFj4TcdOo49fHOFl8HmfYyU8H7/8lhUIOwLninIwKvG1Gxt9/3P
	IVkJOgviydT+Qm/0iBkTCxY9Qk+DZzZ3Pg7uWJ5hXNWctpeFftIOL3i2PiYBYg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779035563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eImlYbdZ7QoBtV/tqV5M9hyci2tjWpC0XXN0ko+thxo=;
	b=m6Ubl4F48CQtkITSUYblVVCCYh/6nwJalleR0An7QKBiFq19VsZYojgGM/yyYw8wHaXpGc
	frmaX2lFYzdGW4IdaFCXQ1rT2VXTFWN+ihwEi+JRWzzgd3IXBbPGdwg1qgBOLWkYVkYYwc
	NPLCY8Io+toIKPIQmvZV+kLejD07aJCn4ewgPefm+pO8VYloUrvIr1MPD6F1QGo8t9jOU4
	AnZr1Qen0T+52bRttR/FQc9snXIktETZCe7xPppJwoWOLtFzZCH7y1Dx91mUjyMUYtXasm
	IL31vOUOYQJMe1O2VgYjPHtpKYWgyJWXn+4UVa8prveN9fML5HBB4wl19qtpjg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a78000: Describe all reserved memory
Date: Sun, 17 May 2026 18:31:25 +0200
Message-ID: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: rygdoqgc59rsenjakdm5yyot5cw3gfdf
X-MBO-RS-ID: f474707d4ad9f75ab11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_093249_340595_CA4E69DA 
X-CRM114-Status: GOOD (  14.05  )
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

Fully describe all available DRAM in the DT, and describe regions which
are not accessible because they are used by firmware in reserved-memory
node.

Replace first memory bank memory@60600000 with memory@40000000 and a
518 MiB long reserved-memory no-map subnode. This memory region is used
by other cores in the system.

Reserve 32 kiB of memory at 0x8c100000 for parameters shared by IPL,
SCP, TFA BL31 and TEE.

Reserve 512 kiB of memory at 0x8c200000 for TFA BL31. The upcoming
upstream TFA 2.15 BL31 uses memory from 0x8c200000..0x8c242fff, the
round up to 512 kiB is slight future proofing.

Reserve 32 MiB of memory at 0x8c400000 for OPTEE-OS, which is the
entire OPTEE-OS TZ protected DRAM area.

Neither the TFA BL31 nor OPTEE-OS do modify the DT passed to Linux in
any way with any new reserved-memory {} node to reserve memory areas
used by the TFA BL31 or OPTEE-OS to prevent the next stage from using
those areas, which lets Linux use all of the available DRAM as it is
described in the DT that was passed in by U-Boot, including the areas
that are newly utilized by TFA BL31 or OPTEE-OS.

In case of high DRAM utilization, unless the memory used by TFA BL31
or OPTEE-OS is properly reserved, Linux may use and corrupt the memory
used by TFA BL31 or OPTEE-OS, which would lead to the system becoming
unresponsive.

Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
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
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 35 +++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index a721734fbd5d0..99f4cfb53e0f8 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -20,10 +20,9 @@ chosen {
 		stdout-path = "serial0:1843200n8";
 	};
 
-	memory@60600000 {
+	memory@40000000 {
 		device_type = "memory";
-		/* first 518MiB is reserved for other purposes. */
-		reg = <0x0 0x60600000 0x0 0x5fa00000>;
+		reg = <0x0 0x40000000 0x0 0x80000000>;
 	};
 
 	memory@1080000000 {
@@ -65,6 +64,36 @@ memory@1e00000000 {
 		device_type = "memory";
 		reg = <0x1e 0x00000000 0x1 0x00000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* First 518 MiB is reserved for other purposes. */
+		firmware@40000000 {
+			reg = <0x0 0x40000000 0x0 0x20600000>;
+			no-map;
+		};
+
+		/* Parameters set by IPL. */
+		parameters@8c100000 {
+			reg = <0x0 0x8c100000 0x0 0x00008000>;
+			no-map;
+		};
+
+		/* TFA BL31. */
+		tfa-bl31@8c200000 {
+			reg = <0x0 0x8c200000 0x0 0x00080000>;
+			no-map;
+		};
+
+		/* TEE TZ DRAM. */
+		tee@8c400000 {
+			reg = <0x0 0x8c400000 0x0 0x02000000>;
+			no-map;
+		};
+        };
 };
 
 &extal_clk {
-- 
2.53.0


