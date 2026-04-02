Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40996D3943A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3bPD24HOXZN3kgTTA30LveYpkBvROd5J3kwaxcJHYOQ=; b=1c3FP5ZX++TVDe5XoEiI2v4GaI
	PT4WB/0lmYmjTqYJuM/5n0b8LEN35RXjdj1I9J2cbqy7p2XJpHoHyoys5NFFj9tt6t08isTFTIsNU
	el2TLooqvfXs2BemiQSr4Q1QG2X0nVkIoD+wN1FVQpd1crFA5ZfI/2FKom9pAyPngsn/db4PZdAoe
	eEIgVFM77B+7LCl+SkCHptf6+fmu2Xw42uqvkGO1GIoLFQE/reNvZWM3FBsoOp/8CQlxhPV66P+6u
	7bpxjKtSVsCrlGnH+h2dUDaTuPJVrpuALJP6zi6hqMmgTk9PZ3MaZxKt7seFWuoMlOSonLc2p6LBZ
	GzMNMg0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JVm-00000000P9r-3eeP;
	Thu, 02 Apr 2026 14:59:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JVk-00000000P9S-0sCL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:59:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso10573965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775141946; x=1775746746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3bPD24HOXZN3kgTTA30LveYpkBvROd5J3kwaxcJHYOQ=;
        b=Kq7IYv9vkftq08TFBzVrOHMQaIZt1U78qD8ZqKgYTpBbGdMKeW1BJACI95RBcCMFyr
         +roGit1JZN7x+4rLFlMwNxOo97YXxZ9zsLpt2ew4kHEDKzg6vJpnx3T5zkyI43tU2x0o
         6YHhlSiF56Tf1dsYWqRmwiWbe2uE+//CI0Tx9JF8/LWjts38egVHVUuykWfAUc1QdJwa
         GUNoT72ILleq/hnVh59RiZM8gUW1ZJEPll82mUE/JT3vPewwNDssg/6TDxwZdGgmV4ET
         +LNgS1Rc6ZA3iPWRXkch/IDkxAEgsdBAoSAQWJknoON2ytBaoi0MK2NufZV6CU1g8U/o
         mbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141946; x=1775746746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bPD24HOXZN3kgTTA30LveYpkBvROd5J3kwaxcJHYOQ=;
        b=Okl/Lx17wRWzJolTKdo9MVSnV24QHcGXKEzqkC/b+fB4Lx0CVgG6evqNMfB8VUIjuK
         RWDXNmZiSYwgjl7B5O/XXmN1VQYJzsINVYXtbG9w4md4uVvGsyBr7NPx57//fkEi4mTQ
         pttpMnBFvwfXjzJ5XOGCEQTVauizhEUbkCczcc6jUBbsi0gVrilfakBza6H/2hdyTso8
         wn3e+KAI0hHnfwy25ImqG5rYE8bdKYm9ZbOrF/DmeUdccjiolrPEnDnQSp7fDK2tWjV7
         m4DYpmnucQvzAVwKsHtkDmytYJytBzEQR3YjuFx/uk20KdKocCTVz4pZExOoKOE1lr5S
         UEDA==
X-Forwarded-Encrypted: i=1; AJvYcCV7f1pmrdkNLZoyZpVxXJevxNmCtpPNv4P+Nm8emhFsriGBpWMRHcBscTMR65V4gv078dih55TUQwrNkeEPWEdY@lists.infradead.org
X-Gm-Message-State: AOJu0YyvBAJ1F7tddl3IVx1g1Jl1uh0rgsGkrUsFktxnDmdHam0rOU3r
	Klji1ZxKO9IOFRgSTSZMwBYWzqS9Qpnll/yHWcVzhtNnSKFEC5Q0xfcY
X-Gm-Gg: ATEYQzzXP0+Ex8br5uCRIffKD2EIW12HjdoGt0Fb4qfMUXVvPDB1hEtW2uJblYjFB9G
	ugx4QB0K3TMGi7IC4E5ddTDKwQQ2kGmFylpipdZVBpFC1zYWWRoEXJY5PD74Xdp87Z1mjLLV6UF
	t0cEbeeyJ+NFnaDtyIo7gOyc82Km/9yHgfbmMbJZF6C/Rn8A+JYxJwyoHe/3rQNRbYyVMBYGX28
	VaV/rseLYomrLtF4uPelJ4hGz0od+G32l5PRB0cLsFuC8BSvF1cNCU6yi7zJnT1h/uV+Ous58Ts
	PvMB9XLS4Pn9mjBsRmrzQwlLGe4hAW6KtKxj0cQiHNADIxDgJoE7OsgKQ8Xs4pk2D6o1BEqe0WL
	Hcq/BoA6iH70nzm2WW/RjMAA49SvXG+yeJKqv8M++TlSYqnzyOlqdF4IJKPuJX+gg7SpBhSZC1F
	qRZrYGl/qBgIPCPTEb96CFOTdfeCDDoLdiwtUqoyu6jrZzzwWv+Cl+YlQ8KERWEr2Rmg==
X-Received: by 2002:a05:600c:3516:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-48883597ccdmr119887005e9.14.1775141946108;
        Thu, 02 Apr 2026 07:59:06 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c769841sm93671845e9.7.2026.04.02.07.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:59:05 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: davem@davemloft.net,
	peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com,
	linux@armlinux.org.uk,
	kuba@kernel.org
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH v2] stmmac: cleanup dead dependencies on STMMAC_PLATFORM and STMMAC_ETH in Kconfig
Date: Thu,  2 Apr 2026 15:58:58 +0100
Message-ID: <20260402145858.240231-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_075908_284499_406F1DC6 
X-CRM114-Status: GOOD (  12.90  )
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

There are already 'if STMMAC_ETH' and 'STMMAC_PLATFORM'
conditions wrapping these config options, making the
'depends on' statements duplicate dependencies (dead code).

I propose leaving the outer 'if STMMAC_PLATFORM...endif' and
'if STMMAC_ETH...endif' conditions, and removing the
individual 'depends on' statements.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
v2: add back default STMMAC_PLATFORM for DWMAC_GENERIC
Link to v1: https://lore.kernel.org/all/20260331125817.117091-1-julianbraha@gmail.com/
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index c2cb530fd0a2..e3dd5adda5ac 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -20,7 +20,6 @@ if STMMAC_ETH
 config STMMAC_SELFTESTS
 	bool "Support for STMMAC Selftests"
 	depends on INET
-	depends on STMMAC_ETH
 	default n
 	help
 	  This adds support for STMMAC Selftests using ethtool. Enable this
@@ -29,7 +28,6 @@ config STMMAC_SELFTESTS
 
 config STMMAC_PLATFORM
 	tristate "STMMAC Platform bus support"
-	depends on STMMAC_ETH
 	select MFD_SYSCON
 	default y
 	help
@@ -336,7 +334,6 @@ config DWMAC_IMX8
 config DWMAC_INTEL_PLAT
 	tristate "Intel dwmac support"
 	depends on OF && COMMON_CLK
-	depends on STMMAC_ETH
 	help
 	  Support for ethernet controllers on Intel SoCs
 
@@ -371,7 +368,7 @@ config DWMAC_VISCONTI
 	help
 	  Support for ethernet controller on Visconti SoCs.
 
-endif
+endif # STMMAC_PLATFORM
 
 config STMMAC_LIBPCI
 	tristate
@@ -381,7 +378,7 @@ config STMMAC_LIBPCI
 config DWMAC_INTEL
 	tristate "Intel GMAC support"
 	default X86
-	depends on X86 && STMMAC_ETH && PCI
+	depends on X86 && PCI
 	depends on COMMON_CLK
 	depends on ACPI
 	help
@@ -420,4 +417,4 @@ config STMMAC_PCI
 	  If you have a controller with this interface, say Y or M here.
 
 	  If unsure, say N.
-endif
+endif # STMMAC_ETH
-- 
2.53.0


