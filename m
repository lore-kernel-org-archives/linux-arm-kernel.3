Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBA5CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 22:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H1qqVgQz94jIQFSkJ/1hbgwJdeHiBuk/T3E4kTorrtY=; b=mJEaHC1alIdd+cAsLsD7ZrtPtO
	fpehW/C+ri/tGu2TvhDYG8JPqsrBr3R1suBGgMNzFbdx1GlX+fVBX18nJQC23NlO83pywZEKtCA8D
	cS9O8SuZ9VcfWhy7YF17UKqMe5gZrAjurljCTFiZlr9KokMtOsTNPBx1YS2/W2BbFg9KUfeXjFLY/
	Nf5SsPHdOp0exw1oVxFq2vKStaFHw4TVWT99AN7lOzo0980SD/aTKxVFM0ehlvucQTBKn2l8cLbxb
	2HDvxZoQcxmF5GopUwrGcaHSNkCt8iuqjlmd0wZb5vRxdPSqlSXh9GmwF1UIfvQQczQm3qlC6pn2u
	LZTQ5jCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIPm-00000003xR2-2iBs;
	Wed, 13 May 2026 22:50:54 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIPk-00000003xQT-085Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 22:50:53 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gG7wT0XHBz9v8T;
	Thu, 14 May 2026 00:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778712649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H1qqVgQz94jIQFSkJ/1hbgwJdeHiBuk/T3E4kTorrtY=;
	b=wcAmjRVKKIvAzo9coa2AUtib9WmZjqGs9HZqx0oTMJyM7ewesJkdA5cB91XQJIFJxOtUZi
	UnmUQechNGyPOb03Q9PI9WebK7bPhmaDiMwXbFMgKy0h8iBhSC2Vi26XprieCLNEFUe49x
	zO6gwo8/ajdBFRzXxY4oXZy41wIplvYo4waDIWrENp2a9ej2sFWnX9pFpVrfmhbPEooKcS
	RRuao6PbYhS0u0yzswNCl8FcukgcsJOxMVs67FB8bOSHCIwKozn2i3G6KqSCaVLFcKSyJK
	AGAPYPAF9RSeqv50y7AE/xLILOm2CxVdXzWYybOxuWAf+5drcUmHUcyy3mxVZw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=W2ov90Ff;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778712647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H1qqVgQz94jIQFSkJ/1hbgwJdeHiBuk/T3E4kTorrtY=;
	b=W2ov90FfXYZsBo81P53c4C2fCyYWsUmkYLBJsDby+gNtzIcFvVcpXU7bNiHTwWJB+MSA0+
	A4XnnIeprb1L4YK/K7bjffV5bmZrAk1xNAdKtoyV3VF8Rj4okbJBAqe2g1dx5yA5n+FnpU
	acb0RGCV5ROVO/gjo3l3rut8nEX0V0jeJSGBEOlxjRVxRDUnRVHJcRt9icilmHBoVqOsPd
	Wv83YyhY2SX98OqkptztkC7XDGC/9mN2emW/fYdawvRfbyhlHAfDFTMfoFRc9UaD7pfTEs
	ag63wMIb1ny00o3lJ5rgJ2pMjGDTnLJXCufXrWtyBlxwoDK2LGu9KS1Lsf6x/g==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a78000: Add PSCI node
Date: Thu, 14 May 2026 00:50:24 +0200
Message-ID: <20260513225037.49803-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xrxthdf5y4xy8wby13xewwjhafdkup8d
X-MBO-RS-ID: 69ea00e180005b506bb
X-Rspamd-Queue-Id: 4gG7wT0XHBz9v8T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_155052_209389_D5356483 
X-CRM114-Status: UNSURE (   8.61  )
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

Describe SMC based PSCI access in SoC DT. The system can interact
with TFA BL31 PSCI provider running on the Cortex-A cores via SMC
calls.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
index 73be51787265c..d14f0cc0ad360 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -665,6 +665,11 @@ extalr_clk: extalr-clk {
 		/* clock-frequency must be set on board */
 	};
 
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
 	/* External SCIF clock - to be overridden by boards that provide it */
 	scif_clk: scif-clk {
 		compatible = "fixed-clock";
-- 
2.53.0


