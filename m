Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045F6CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 12:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3AsLWil8PBob2O8dydof8HQR3siAaGno/l/LgxOjp9k=; b=Gg+SQvS05+KYS8rpQ3Vq6xtHD+
	JQoGLMe3Kfbx2gyZ46WtthX+Zm5hmk9EFYUaTEZvcACToJXJIm/RdHaC9/WHveveBzBxusyWzAPTH
	A8Glg+ljQISKhyvpPg8n/TVFenPz6oEKwYD2xaVI4K4/HlcZYKd5A4EjoNBSoWdVAF/p3klrRJsUG
	tfV59jHg71fZLF7YQ3Whkf7jLR3I2y20i5pknMtfjr5SuFsuGtWzFBl3PidBHy7a0juQJnMwY8AAY
	PRoviwi3ktJinDUzPJJUAkgL6OTYCbnRIjNSQ58NbmwDy1Mj05a7PKBOmaes4npVak/Zv+tBDapxj
	VFLOKrng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ9FS-00000008yUv-44pc;
	Sat, 02 May 2026 12:15:06 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ9FO-00000008ySt-1RvO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 12:15:03 +0000
Received: from ipservice-092-208-105-007.092.208.pools.vodafone-ip.de ([92.208.105.7] helo=nb282.user.codasip.com)
	by akranes.kaiser.cx with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <martin@kaiser.cx>)
	id 1wJ9FK-00000000146-3SKu;
	Sat, 02 May 2026 14:14:58 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/2] ARM: mvebu: simplify of_node_put calls
Date: Sat,  2 May 2026 14:14:27 +0200
Message-ID: <20260502121438.116288-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260502121438.116288-1-martin@kaiser.cx>
References: <20260502121438.116288-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_051502_382124_272A56A3 
X-CRM114-Status: UNSURE (   9.90  )
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

In armada_370_coherency_init, cpu_config_np is no longer needed after
of_iomap. We can call of_node_put earlier and summarize the two calls.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 arch/arm/mach-mvebu/coherency.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
index a8288a29c1f5..f27b4ec13df2 100644
--- a/arch/arm/mach-mvebu/coherency.c
+++ b/arch/arm/mach-mvebu/coherency.c
@@ -135,12 +135,9 @@ static void __init armada_370_coherency_init(struct device_node *np)
 						"marvell,armada-xp-cpu-config");
 
 	cpu_config_base = of_iomap(cpu_config_np, 0);
-	if (!cpu_config_base) {
-		of_node_put(cpu_config_np);
-		goto exit;
-	}
-
 	of_node_put(cpu_config_np);
+	if (!cpu_config_base)
+		goto exit;
 
 	cpuhp_setup_state_nocalls(CPUHP_AP_ARM_MVEBU_COHERENCY,
 				  "arm/mvebu/coherency:starting",
-- 
2.43.7


