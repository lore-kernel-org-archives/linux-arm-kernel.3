Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82994CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 12:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzHRHpJND4TnCraxbJBF3MO0CcderUVj8bIeQmekwCc=; b=16oK6yNjsk1Z24l9ugQQ7nmiJ1
	DtEAEJ0TMrTeKRVtSrS/xP2gSoj1jDGn/Wx1L3nbAb1LRYOCB44jjKGCwjVWi+/mCiE7LdHSf80qS
	T2EM5X5JjB0qpD2FmPvoE5tQtqnBSLULKTahxfDBTiJEWigo10uuIMJ5adhS1Et39ZwnDlulRkUaF
	LWjiO1oB1JD7LQ/u7iODOvEu5czMR8cMOmDIqkSwY+LRXLkVh5rD7HxuAwIXkb2OrQc9TH9CzX6/n
	FBZownRSpNfU4v2Nkb15hiXLXAyXcl085dxFlQavIwOqBfX1o4EzZ5xn0OYZ69jzYmdOgvMbQncqJ
	6WPSrVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ9FQ-00000008yU7-3hAc;
	Sat, 02 May 2026 12:15:04 +0000
Received: from akranes.kaiser.cx ([2a0a:4cc0:1:11ef:4484:ccff:febf:ddfa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ9FN-00000008ySs-040r
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 12:15:02 +0000
Received: from ipservice-092-208-105-007.092.208.pools.vodafone-ip.de ([92.208.105.7] helo=nb282.user.codasip.com)
	by akranes.kaiser.cx with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <martin@kaiser.cx>)
	id 1wJ9FJ-00000000146-1dOB;
	Sat, 02 May 2026 14:14:57 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/2] ARM: mvebu: drop unnecessary NULL check
Date: Sat,  2 May 2026 14:14:26 +0200
Message-ID: <20260502121438.116288-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260502121438.116288-1-martin@kaiser.cx>
References: <20260502121438.116288-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_051501_049629_63D8362F 
X-CRM114-Status: UNSURE (   9.12  )
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

Don't check the returned pointer from of_find_compatible_node.
We pass this pointer to of_iomap, which handles np==NULL  correctly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 arch/arm/mach-mvebu/coherency.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
index fa2c1e1aeb96..a8288a29c1f5 100644
--- a/arch/arm/mach-mvebu/coherency.c
+++ b/arch/arm/mach-mvebu/coherency.c
@@ -133,8 +133,6 @@ static void __init armada_370_coherency_init(struct device_node *np)
 
 	cpu_config_np = of_find_compatible_node(NULL, NULL,
 						"marvell,armada-xp-cpu-config");
-	if (!cpu_config_np)
-		goto exit;
 
 	cpu_config_base = of_iomap(cpu_config_np, 0);
 	if (!cpu_config_base) {
-- 
2.43.7


