Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA82C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f5vPhuIo2SHslsd7MapcfHU+4gnO9e2kMXfZOPlqC5Q=; b=AiBVE4L/TGn1wfkn79p8bq+rC0
	lmXIJ3fEYbW0Df1OUO36ld695OC4YSTiW0SnkmHTwDsHHGrYLHyuZzk69KCg85ca4cVmWV9lJ6Tdq
	lH1na/4rAcd5clgeA+Ux+lmQy2xEmrN72mOlJQI+J9yoXlLMYPDmrBJA7XrfXupa3AwhwyZ0oVwyD
	NyVZTur6uQJfaLFIVZIh7vMcoZlDFqczE7ch70mIZyRXx6Mh2gVjQknAffzFo+KSWV793ggucnI3m
	1djUiHETeEnTesffDZ5IkJBflJ5P80HnwEUQQd/Dx7KfIvkBdlW/bOyibSzpPSRJ5EyAehRKkjmcS
	SjQ3gewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Km-0000000EdBT-3b0M;
	Fri, 14 Mar 2025 15:52:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Ie-0000000EckH-0jKE;
	Fri, 14 Mar 2025 15:50:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A28C5A47738;
	Fri, 14 Mar 2025 15:44:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CDFC4CEE3;
	Fri, 14 Mar 2025 15:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741967415;
	bh=yd6hd/BIcy+u7PxvBdVNuloLY1tbTq52bYWAIn5DalA=;
	h=From:To:Cc:Subject:Date:From;
	b=RcyzSwVfNUARNiBeEW1oLINmdQnOb3bKeLpd+DiRptcO3R8BSB2uMDYYrxqcBdSEz
	 9hSbhEUg2dCFoKOQPs3NXhS2EJAfQMxXZcMgKGWCi8MtSEP0cNpi4HUN7jCLYRggNj
	 xVr5Vz6GH995FIValA497TwC9j1ZpcLqH7Ud0tZhK35Ysa+zIHMp4yE8FCzaWVBDwf
	 o4qBSg2eQdF4HxTGUhGqPumQQpU7mf4np2DK9Qf6aoot/HTyhihVga1isV4UdKQCWe
	 sJsqzB67HopEghFtRaFz2C3mBJnqqxdZqB5XDEYlm6d5gRTbrwU/mDrfZ0Q1fDQh4w
	 FG19YajDekBdg==
From: Arnd Bergmann <arnd@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Simon Horman <horms@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: airoha: fix CONFIG_DEBUG_FS check
Date: Fri, 14 Mar 2025 16:49:59 +0100
Message-Id: <20250314155009.4114308-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_085016_279781_729F1160 
X-CRM114-Status: GOOD (  10.46  )
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

From: Arnd Bergmann <arnd@arndb.de>

The #if check causes a build failure when CONFIG_DEBUG_FS is turned
off:

In file included from drivers/net/ethernet/airoha/airoha_eth.c:17:
drivers/net/ethernet/airoha/airoha_eth.h:543:5: error: "CONFIG_DEBUG_FS" is not defined, evaluates to 0 [-Werror=undef]
  543 | #if CONFIG_DEBUG_FS
      |     ^~~~~~~~~~~~~~~

Replace it with the correct #ifdef.

Fixes: 3fe15c640f38 ("net: airoha: Introduce PPE debugfs support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index f66b9b736b94..60690b685710 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -540,7 +540,7 @@ void airoha_ppe_deinit(struct airoha_eth *eth);
 struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
 						  u32 hash);
 
-#if CONFIG_DEBUG_FS
+#ifdef CONFIG_DEBUG_FS
 int airoha_ppe_debugfs_init(struct airoha_ppe *ppe);
 #else
 static inline int airoha_ppe_debugfs_init(struct airoha_ppe *ppe)
-- 
2.39.5


