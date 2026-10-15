Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF49CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 19:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nq6TXxH9yZegUId9mXUPVGqp2OxE84kDHUHLPk1dkU4=; b=PuwjPkARTfs+s8z/3k/Z6TZ2Oy
	xH9buSi0h7pfyylYzXOQn8OyZkbg90CnV/BpW7VIADJ9aRGrNNTO4Hw7jTiMIv/LCT82Cc7ugmSVH
	XQczq1s/4tEfUBo7DxtHd/FtLh4EjHy8m3H1AEyk1K915l2UL53dTjj3p74KCwA7Hkv6c4S5tNgfZ
	wn9BXyAz0ksShEOM4rrPKxAel2VbDN6B+lS5i7O1KiLBe02iSyRt531PaU1hr9PPSnDRw4sel2tlZ
	vgMtxQ9yhkwnotP8yUgw9hLF1jqirfcBESEa1D9T60ajf6cUpHXnGBQxX63yABZA69uInabmD24vM
	elgjLyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHR8j-00000001F9K-0uDu;
	Thu, 15 Oct 2026 19:29:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHR8h-00000001F9B-3587
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 19:29:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CAD0C60A57;
	Thu, 15 Oct 2026 19:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCC71F000C4;
	Thu, 15 Oct 2026 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792092558;
	bh=Nq6TXxH9yZegUId9mXUPVGqp2OxE84kDHUHLPk1dkU4=;
	h=From:To:Cc:Subject:Date;
	b=aqTdPAb/adr8kVxBfsWFs2D4hMXnHJ5nPVaR73Rum+4y8DI7AH+MJOc52QeHK0uBt
	 Cq8r/mFmrjYt4I9hETDotAz7w0Kqy0HP1Q/9DJcW48B+nBLM40HjUgBf9T8LgP1mXC
	 WgLOaAq+d2KTP0ITGUUrT5Q41qNT5D7//uFy/gM7p7c+CRcAO/K0shlFKKIxPpFCTV
	 kCELMYwTdJCK2DZXRyBV2l+msEdBd1QbszXyhgFLQH8k6kn0RAzQEWUFm3fTTw5bqw
	 bPAkDROCPQ350TxQLPLUdhs9ItGXFWqU0hyEeOQ4P75eK8tMnaiinI2PdvxXU+51Ru
	 qaOTNtF6CEWPg==
From: Thorsten Blum <blum@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: idreg-override: Use property length in get_bootargs_cmdline()
Date: Thu, 15 Oct 2026 21:28:08 +0200
Message-ID: <20261015192810.395975-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175; i=blum@kernel.org; h=from:subject; bh=Xqz00MJh0x/Qe0V1MfC+3rczciKNM/u8s40TIrjmehE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkXNb2emc1qndl5ynbFsb8TwznVW06lrDbuDHGV/GUwu e/zmWPBHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCR/m5GhsdXVge6rr5ZcOBx 98IX219EZC2M/JdgkTTZPdGQl2NS7ymG/yXLrQN4rzzcJMm1b8//ev2UxnWRy9Yb9Sj+0Um9/W6 3NRsA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
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

fdt_getprop() already provides the length of the bootargs property. Use
it to reject a zero-length property before dereferencing it, and test
the first byte directly instead of calling strlen().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/arm64/kernel/pi/idreg-override.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index acaf56234973..588c8af2a567 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -383,15 +383,17 @@ static __init const u8 *get_bootargs_cmdline(const void *fdt, int node)
 {
 	static char const bootargs[] __initconst = "bootargs";
 	const u8 *prop;
+	int len;
 
 	if (node < 0)
 		return NULL;
 
-	prop = fdt_getprop(fdt, node, bootargs, NULL);
-	if (!prop)
+	prop = fdt_getprop(fdt, node, bootargs, &len);
+	/* No bootargs for a missing, zero-length, or empty-string property. */
+	if (!prop || !len || !*prop)
 		return NULL;
 
-	return strlen(prop) ? prop : NULL;
+	return prop;
 }
 
 static __init void parse_cmdline(const void *fdt, int chosen)

