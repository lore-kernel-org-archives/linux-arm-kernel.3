Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B373C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LjfnxeX8KjYcJvDNbBVoMz/4vGL/XWHIgMI/rffXzxY=; b=gVjAanxUPd3VTOpxV5pJfJ2Jvy
	A1ZRrAV5vWJUSrahQyyjh7iZHF6xZDdFSaV4qOVBiepLE3zvFO5GuhsEEWmehGDxS70OPdU19J+jQ
	CYR1M52d0vy5FmOwTMlsU+1KoF7F/hm9xZ97JLgh0e7+eEgkHp+n2jTUWbZzCM2T94nB2FbSJX/+W
	v6Ji4orC9UeFtaPdGX0n+ROsVf610SD2FZRJtFdmhv7xUYEKAa3cbz8nkuJLPMwdacGnny1+MvDeB
	NOTPOeyXDjW00xgsnGIjOZemko08UJCKKCLfrF18uqEYwEsA0wulvEN4BF35NegXfu1zx7NkHeGJZ
	wOo0LmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1gj-0000000CwxQ-0b6p;
	Fri, 25 Sep 2026 08:53:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1gd-0000000CwwB-2pTx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:53:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1422241AD9;
	Fri, 25 Sep 2026 08:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7F21F000FF;
	Fri, 25 Sep 2026 08:53:39 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] dt-bindings: clock: renesas,r8a78000-cpg: Add MSIOF clocks
Date: Fri, 25 Sep 2026 10:53:29 +0200
Message-ID: <9a5f4e324e3b67d367f850264cbaf7e830cec182.1790325809.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790325809.git.geert+renesas@glider.be>
References: <cover.1790325809.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add definitions for the functional clock parents of the
Clock-Synchronized Serial Interfaces with FIFO (MSIOF) on the Renesas
R-Car X5H (R8A78000) SoC:
  - MSO_SCP_MAIN is the functional clock parent for MSIOF[0-3],
  - MSOCK_PERW_BUS is the functional clock parent for MSIOF[4-7].

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/dt-bindings/clock/renesas,r8a78000-cpg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r8a78000-cpg.h b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
index 7fd09a3fb353d952..14b3885f2d9933a3 100644
--- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
+++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
@@ -10,5 +10,7 @@
 #define R8A78000_CPG_SGASYNCD4_PERW_BUS		0
 #define R8A78000_CPG_SGASYNCD8_PERW_BUS		1
 #define R8A78000_CPG_SGASYNCD16_PERW_BUS	2
+#define R8A78000_CPG_MSO_SCP_MAIN		3
+#define R8A78000_CPG_MSOCK_PERW_BUS		4
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R8A78000_CPG_H__ */
-- 
2.43.0


