Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2809AC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jDZ6oRwW/kw/814suAB5/ov64h9IKkzItyVBfUzYyT4=; b=2+jq4017Wcifb1C3PRI5kSFvPy
	89lEAlSmdvfBvxwY8RMOLIZ+HHHQHUVVspgVP2YC2D4/8QNMJBHQS6T15CflF/Sm91mlFVvr3IteV
	Hid+LycJQuYE2e6FcIss6OO5U3fO6K62m2HNyEzFzjTKhEvk7kQgtlkUbIhJtUgw/ygHM4OKIi1bQ
	gnHKmQiAoM9NU1X3E9XdtDieIjt3VSDHJltWSAdyQmFqLXJVNboGCft6RmSHOpYmxjJXJH3ataxuG
	Dy4D00OWOfNvMio4HPAnub3HeM/TP4xTlPf1pe60++iXYF9ElOAU2wJOmNivXHLzLDd+EhTF7tYCF
	/MEoKWGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Syo-000000062MW-1cYQ;
	Mon, 07 Sep 2026 06:37:22 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Sym-000000062M5-1MUv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:37:21 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so2880123a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763039; x=1789367839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDZ6oRwW/kw/814suAB5/ov64h9IKkzItyVBfUzYyT4=;
        b=AwRVu/gO8/cx7D9dCpGh3dkD34kxQ5BLgl8xuWBVz6rhM0ssgePUjHd+7TQ+I/u8DJ
         TwkuLY12n6fnwQHByAGdv1CWEAeVI4G2imPqxBsONbfFjBJpHtPwdvhEzZ/mZ7uU7h65
         rnG6VF4Gkm+xgApQhokpXFfq5Xvu2R51iIbSewWUsKZPemWdDpAF/SL3uxEMSSoUwhcL
         GRcsoaSVOQab95qVq8Jjz4yJn8QfngAUz66WaAi3MP22o/WCUIIL+4KBddqKj0MIuesY
         EdxWQJyBmiyi9cRQ1q9S8huFRpA6pPazLOcE/X8HivJX8SuuF2Y+HsUMDIfYiIRX6Oik
         QIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763039; x=1789367839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDZ6oRwW/kw/814suAB5/ov64h9IKkzItyVBfUzYyT4=;
        b=RV0ji0sDPUeNvGnEgkmXqVmIYdCU+nBqvWZSPIG1+9xk66R8SlVjlH4PjvsT3Pnth8
         eFf8hNFT8YnzG5/AGogGQry8Y4S/arV7WgWomQSG0hAEAWTrCHiqRmtR7M9JKzSRR3Ax
         WFlyQZ9VX6BDtaVliv9JGNJF0MJHVEWI4leQXijNMP/v+KEBPqPxpmUL81vc6hj59qS0
         BLWJIUnX1TdOSvBJuMohhJTcToVy9Jb69jd+QtbV9eHVCUn7H+ohFqgXinSjDyFBokoh
         gkzSTget9p81b6fTKXaZPwfAAEoyloC1woWZsxauLBpWMtsmT80T3tCiDgrfxw6vsn0k
         q+Vw==
X-Forwarded-Encrypted: i=1; AKwUvBwyDU/I6fV2TWg3/gbqVnTWomOb7XPZi++N6qpD31IPbeQ2hiT+YwMHxl80ICD63JuboIZkEtpggCBdlh9w5eTV@lists.infradead.org
X-Gm-Message-State: AFuF++l23vS/Lks9BWazEOYXXzvMRZ/umchjlSGjo44mfc5Gbf+Xlggq
	QeFLoGVLjbTiM288/AJ8nTmp9QBxV5tkIhEF5TnVaJ86EK0sbhZGKuvi
X-Gm-Gg: AYBFou3LJs/zGCu7W8QjUmcUusnKxjOH60z4yyVEJUADXgLREVHVw4smYzmqSmJC96Y
	CEp/pnypXY+2XLisTMMyoAiR4dXRigCeqCx5aimrfxRfQDNPo7iGTiOJw9yxO1PUkZSGjDmouV5
	UxiQdW6NzpYL9Pa5KptWFmABsuS2UJJA3P9i4+4Dyn3ahz6MUAxwelm2J4LX5AwuHxmTxv9MxvV
	v8GA0AkGRkRleY3VNV+BqhH7e+jrF4iJLvW83XasZMay+Psx8TVVIjjsYGEa/EZMTzWPOr3o4Cv
	Y5HZURxptRT1pFQgtHUkPjYMkUprDnvod8qt7x2J5i34JG96R8GkMKRO2iwJF+YRnLEgFQ6cHT/
	uqcEXO4LEek0MPe9MfB2y7FwemHZqhC7yiTi7pv8OJbINX0ftiow1RWLYUgxNQ24yMRc1/fA/se
	GqjEDo3QYhGjj0LNgaA/7F0DBS0/pEkPaN+D/rFWzvmLT7TxUPR1lejLMWk9Gw/usn+TD2p2oeP
	HNkadLE4naRvQ==
X-Received: by 2002:a17:90b:518c:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-39b0865357bmr28966580a91.15.1788763039344;
        Sun, 06 Sep 2026 23:37:19 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm25325131eec.19.2026.09.06.23.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:37:19 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: mach-omap2: fix typos in comments
Date: Mon,  7 Sep 2026 12:07:13 +0530
Message-ID: <20260907063713.25757-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_233720_367318_A369136B 
X-CRM114-Status: GOOD (  13.39  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/mach-omap2/dma.c                   | 2 +-
 arch/arm/mach-omap2/powerdomains44xx_data.c | 2 +-
 arch/arm/mach-omap2/powerdomains54xx_data.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/dma.c b/arch/arm/mach-omap2/dma.c
index 830cd4e7eb44..cc10439eb856 100644
--- a/arch/arm/mach-omap2/dma.c
+++ b/arch/arm/mach-omap2/dma.c
@@ -118,7 +118,7 @@ static unsigned configure_dma_errata(void)
 	/*
 	 * Erratum ID: i378: OMAP2+: sDMA Channel is not disabled
 	 * after a transaction error.
-	 * Workaround: SW should explicitely disable the channel.
+	 * Workaround: SW should explicitly disable the channel.
 	 */
 	if (cpu_class_is_omap2())
 		SET_DMA_ERRATA(DMA_ERRATA_i378);
diff --git a/arch/arm/mach-omap2/powerdomains44xx_data.c b/arch/arm/mach-omap2/powerdomains44xx_data.c
index 37fd1a567094..ef801e5f3202 100644
--- a/arch/arm/mach-omap2/powerdomains44xx_data.c
+++ b/arch/arm/mach-omap2/powerdomains44xx_data.c
@@ -258,7 +258,7 @@ static struct powerdomain cam_44xx_pwrdm = {
 	.flags		  = PWRDM_HAS_LOWPOWERSTATECHANGE,
 };
 
-/* l3init_44xx_pwrdm: L3 initators pheripherals power domain  */
+/* l3init_44xx_pwrdm: L3 initiators pheripherals power domain  */
 static struct powerdomain l3init_44xx_pwrdm = {
 	.name		  = "l3init_pwrdm",
 	.voltdm		  = { .name = "core" },
diff --git a/arch/arm/mach-omap2/powerdomains54xx_data.c b/arch/arm/mach-omap2/powerdomains54xx_data.c
index 5506da2ceaff..8c8b5c0ac216 100644
--- a/arch/arm/mach-omap2/powerdomains54xx_data.c
+++ b/arch/arm/mach-omap2/powerdomains54xx_data.c
@@ -216,7 +216,7 @@ static struct powerdomain cam_54xx_pwrdm = {
 	.flags		  = PWRDM_HAS_LOWPOWERSTATECHANGE,
 };
 
-/* l3init_54xx_pwrdm: L3 initators pheripherals power domain  */
+/* l3init_54xx_pwrdm: L3 initiators pheripherals power domain  */
 static struct powerdomain l3init_54xx_pwrdm = {
 	.name		  = "l3init_pwrdm",
 	.voltdm		  = { .name = "core" },
-- 
2.48.1


