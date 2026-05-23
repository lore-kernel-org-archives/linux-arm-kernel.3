Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3C2CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 19:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bPp4+8gHs4KpY1yto9ukbd7UUiJ/HBW0qlJB2gqUZvQ=; b=MzH3/aWEFiOTqEu/jLqHswrkjw
	G4iRRpemdOkZIPjc1Qg4xdCqWF31mcvDEJDEF8dR2mRYydBPHgALD93NkwcKRe8QlLPz/v/RBo6Vi
	euLANL4Qps9VjjkXNvFfvngSFTqpWV5hhAfiJSk44Dk2QrVmHpfchVex7oIR3L27WJqAPdu5fmBdB
	7tJz5DxeKwg6ts48q2j1K8xp6R6aIMCULPzP9f45gk1WhljCOOumE+n6cUim+aSSjJHVTFADA/gLJ
	Vw4aSZUErKZbblFoBTasIbcItrPWYp0X3Th5OYRX4sM3iVdD1aoDAGTdHvwAieKJQ9+nnZJO76vLZ
	rlK584cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQrzf-0000000DnRW-12rW;
	Sat, 23 May 2026 19:26:43 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQrzc-0000000DnQb-1Jo8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 19:26:42 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gNBw53XDGz9vHt;
	Sat, 23 May 2026 21:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779564389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bPp4+8gHs4KpY1yto9ukbd7UUiJ/HBW0qlJB2gqUZvQ=;
	b=uMn2NwSNknqvca1BbRdF9T6wfxuzG4y+HdxEQ12zRSZf74YECw5iOMXbX4CNKmPZGrc+0K
	+tmuEA471MA02xuMnc/H2oPB7GaOCvB+IZBd02WNgmM+h+tIw1c2wQyR0GgSife4XfcIFg
	rq48EJcgw5pMxW5vnVqO16roC/RmtoOkVct7TbCLYc/P93LvAe3Val8mEZk9ccplMrOQ/7
	smrsa6/yJqrbH4mqQj1n3/ZVF+1GSYwWR3ntbaniqrxaBVKqoT0DN5dUOlknGzOCngdD5v
	KZQSwzHkqD1c+CEIGef0iKy4G/S8bwD6BDuxBhcliF3B2oMr6ksI2tXOCxHE9g==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=kFYN628S;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779564387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bPp4+8gHs4KpY1yto9ukbd7UUiJ/HBW0qlJB2gqUZvQ=;
	b=kFYN628SgsQVc+pzlMc99z4bfbKyZFgZyNUGV5Wib3gvPvvEjNXPd08DK5fCX0DOEFLkeZ
	b36nhGUWMThr5oxvi+bP6nY7hrZxWfdEniDFq8ihAwNyDIExREUJvKCsc9+LHY471FpzA3
	om5vvn7b+HRYps+61LwYr1vDSFjw33bNOdVK/RlMY1rpUg8RyPmreckQIvDWi0MiuLW7cv
	TKB+6QczcHXtiznCY+Nx10/lbd2SZ1Vpa2/2Qpe5mt46K1qEKLD75TQOTDfxtOM/GcwH8V
	G5F/oJqLVqprPyhP1Jiz9olrkEFLROL/kAZ1RcTsNCcnYmzVsVLj0vpkKtc5sQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: renesas: div6: Use ZT/ZTR trace clock in R-Mobile APE6 example
Date: Sat, 23 May 2026 21:25:50 +0200
Message-ID: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gwsnr17ru6mwaek5f7ba9qnu37miwujp
X-MBO-RS-ID: bc1d52ac7fda85522ee
X-Rspamd-Queue-Id: 4gNBw53XDGz9vHt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_122640_508492_C9313599 
X-CRM114-Status: UNSURE (   8.74  )
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

Since commit 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks:
Document ZT/ZTR trace clock on R-Mobile APE6"), the APE6 clock node
expects two additional "clock-output-names" entries, "zt" and "ztr".
Update the example accordingly.

Fixes: 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/clock/renesas,cpg-div6-clock.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
index 2197c952e21df..b6ee8c8efd46d 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-div6-clock.yaml
@@ -60,7 +60,7 @@ examples:
             clock-output-names = "main", "pll0", "pll1", "pll2",
                                   "pll2s", "pll2h", "z", "z2",
                                   "i", "m3", "b", "m1", "m2",
-                                  "zx", "zs", "hp";
+                                  "zx", "zs", "hp", "ztr", "zt";
     };
 
     sdhi2_clk: sdhi2_clk@e615007c {
-- 
2.53.0


