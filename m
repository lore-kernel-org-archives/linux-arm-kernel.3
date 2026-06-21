Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774E9CDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 02:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DA836GG3Gp9DG+JH2qQuPWlTVdunQMIMbho/NL94fPo=; b=HYVRqK8YeYq6XFrsFxw9MEtoyJ
	WuhJlTye4f7izJlobiw/aeo7BfpluGSAMCrWIuyi83W4bFYfxXWUIRsWMTA8nFqSB83BCVsvN2m0a
	V1oWoL+MX2P58DgTdtxFn1HRqf/sW67SiL8ApKB2cuFU98v+QEutstUxZGWRoOabi+4o5qSLU+bMz
	yHzwM0bgSRAeGbuKasP0Uaeqo12obG/LbgERq7+OlJhCoZd4eV0oH059L43R3nTxdWhneMynfJDNP
	EyPOo2Dh5xH+ymdouKvLJsVMxVak8e94VJKZ/+5cvJaVTkt9A1BpovcZ21dX2AtChxbwQwI65W3Ws
	v82j4HKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8HR-00000003hOV-3qQU;
	Sun, 21 Jun 2026 02:51:29 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8HA-00000003hIg-1fVn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 02:51:13 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gjbSG5YfSz9swL;
	Sun, 21 Jun 2026 04:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DA836GG3Gp9DG+JH2qQuPWlTVdunQMIMbho/NL94fPo=;
	b=LxTPpyhxSEhyUDh9XXrjXijpn5y0zMBn8bqWmRwvzMQMIBdzAjt55slEx43Cr1BeeKyJqp
	YdBRsEO/J17cNpNGZup+WNkfhZm7p3+iRNeYwH/Uctp3I4zUtcy3k+JtXzfdqVSOYkjU+M
	8BMmjJsjePXDqnmmzI59c2DENaAuF91vTYeP5Kg8NyqqCY8PmfE4qeGpVnVBliPpk0CbBR
	sjsSKLk8JO/k+tiu7SIDxPcfkt6hzoc26LzcIR9Ek2oj7M8nWorgeQTNn6dTSOhT1RX/lX
	Bds2Xojk9p1xlxf6GDXFqDeqA6o1+xnJ49Rb94E70X0Xm9hUn+EEsBNSNaPEIw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="pnbsHj5/";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DA836GG3Gp9DG+JH2qQuPWlTVdunQMIMbho/NL94fPo=;
	b=pnbsHj5/yfg17Peesxnr4zdVwFDdF2vuCRMmGDQspPK42A4UTeEjMB+8rWRy+F+1zzjEm8
	zOiqaS9szgH/tCGBml0AuG16ZAxqNE6kTrYnqgmPLleO8Gs9hIXJ8cRL/0JonFIIukAd++
	BygLz+RSDE2+Kt4D/t6FPs9g54+IDkK5lGVPPRVyRlnhrB9i/IpD4lCyjrgpiWLry6Iecy
	jR7algMsL2czM2bP3ixstBrC0UjgEqSttH+kIynMXKkQEd7FP4p17cf5KknGTGOP5GT1OO
	/3D9kcvHzU1aPTVbcs/I7XTDx8SWCvvjvUzMo914Xex1iGJ+bw5PHSyPEIWNkQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 6/9] arm64: dts: renesas: r8a77965: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:26 +0200
Message-ID: <20260621025052.406507-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: u53zm4f18y64rbosu99e7d1zqwkeujtj
X-MBO-RS-ID: 11d28805152e4a8dabe
X-Rspamd-Queue-Id: 4gjbSG5YfSz9swL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_195112_742086_76508141 
X-CRM114-Status: GOOD (  10.66  )
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

Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
which already has that soc: label. The soc: label is useful in U-Boot
where it is used in U-Boot extras DT fragments.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 611a9335c63ad..70708f5cf7467 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -182,7 +182,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


