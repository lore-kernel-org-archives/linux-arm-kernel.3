Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBE3CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 20:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l4wFVxQBgL8B6DVjVkF6XY4KfSRZqxPxMXAGErUdUOE=; b=3FQdShGSsERymvxtE++QiEXqrr
	axBsfIuroNbq/13GytS7H4RU9n0E5C6IwitV0YrnnGR1SYJPQ2BWSaflRYLEXrM9tyiSbnB+qH905
	K8RkD+PGV1Ia5PnLB8tlemSrnjPclghONVnSKHe6K8BWCxWve4VA9GowTo26enwuTSR0w9tWhfgBn
	9QapIocKvd9m5BC12zohZrF63W1KgLrZrxojChyxyhIPUeb+E/SFylJBi/z5TsujSZjM7b879ngIz
	e339P1+ib40TrZ0d1yOKKmLzrandT5x/+hsZ4mTk/BN0OmEdrvB2AlFOiQORa+SM19dij+Oz7uHgL
	G9kjGRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOhmn-0000000DNzq-1AoL;
	Sun, 17 May 2026 20:08:29 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOhmk-0000000DNz4-3M6F
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 20:08:28 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gJX7B09s4z9vTD;
	Sun, 17 May 2026 22:08:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779048502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l4wFVxQBgL8B6DVjVkF6XY4KfSRZqxPxMXAGErUdUOE=;
	b=ON+4ZOdDioAhwgYq6wu2cWAZ3cNX+m+ypBoHVg81Nv3MXcUxvt/woO+rGux6YwY3FiDJHa
	m03vd9UcQ7DiPJG5gZT27AXBo6k6nrldJdGaevjzPr9T/TEOXS7YwUQv6BRX2ciOL/PqEL
	tjmFaGUIkztIeX3oQ404Uj8XHm2IZ12HKSJr8Bxw7NIPs3bgN1ynk+l2HY2X5X4/9h78/6
	JyCZ0GlRsfvc6kL1/keCF+ZoSmhDiSt0UYWY7VtB0ubkuODxg5sLZCGTL9zQ7K/7bQ+JfU
	fPaJM1m/IAz0wmbmp566FhWzELv0+RpaR7Nt2mAiLVwGC9JrxkVMeTPxugREVw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CcC7WRiX;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779048500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l4wFVxQBgL8B6DVjVkF6XY4KfSRZqxPxMXAGErUdUOE=;
	b=CcC7WRiXiGfj9qB3IEUc4W9PX+ThhzSiQxdNpIUcfFltXLJW6dDgJsPmiX5Xv/Mm0QdsEK
	CuP1hqrGnmuje1VrxDDNnh4zFy9xW+3oiRnjUnXSTrd1BG0VJQiVVZVun/cTVU5KSKwAoP
	MTjaOmbG/8Uz07ukSTjcwLUJo7dzPSRko/d3UL9raDkLOkr504tVEfysJ5wKEk9OlY5bzL
	y03hd15AGO6KCSsK+ENunR410Tm4sr9Kv+rapXxpfl6Q/Woy9spJ/dDy+hAsADCjOIi2ob
	97Q7hoOmMSD0xb4YSQP65Kbu1iYqT6MBrDaHNE0nIebsRubHXfjX/SiP+8EdGA==
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
Subject: [PATCH v2] arm64: dts: renesas: r8a78000: Describe all reserved memory
Date: Sun, 17 May 2026 22:07:40 +0200
Message-ID: <20260517200814.21624-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3e02abafad4a71cb2b3
X-MBO-RS-META: xrb9uyt3n4p1aa9mmtafi9o74nrhuoq8
X-Rspamd-Queue-Id: 4gJX7B09s4z9vTD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_130826_986986_835CBB2E 
X-CRM114-Status: GOOD (  14.60  )
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
V2: Run checkpatch, fix indent
---
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 35 +++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index a721734fbd5d0..ed027a6c356ed 100644
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
+	};
 };
 
 &extal_clk {
-- 
2.53.0


