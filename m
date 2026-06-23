Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16ACCDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 07:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOXvZJIgT1xf7y6r5/ilxE6ikYQEvsUFg4mACphcji4=; b=u+cBUozXyz8fBO4YW6q2uWgd2y
	O8dtiTpuCYU9+wRtqi+1MkFLrqDA45KHo75ANmgCIzcDiPVlCfwhUtGkWxbdGjX39uM6ivjPjtxjQ
	QB5GVnOUwAkeM3Uoc8bnjfWUCqDtnWptdhKoNPrs23fLvqslj2WwmlrnxMW96PklAHX3xPRn8hGF8
	AOWiO+bGwZA5ebY7epOG3BiP7rJgEH48bp2Hl9oxHBrAJ6oEtAbIfBn6r/oeR0QXe8lCP2Jarff5E
	vpmwU5g4zP0yUrud114LJp+0HlLzRJjogV+0q3VTSQOzWV2lWiZoulbj81QWwdyjrLbnmoJ9/jJGJ
	oR3uPMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvqd-00000005qtf-2N6d;
	Tue, 23 Jun 2026 07:47:07 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvqa-00000005qr3-1ICn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 07:47:05 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84537777d45so4259116b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 00:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782200824; x=1782805624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOXvZJIgT1xf7y6r5/ilxE6ikYQEvsUFg4mACphcji4=;
        b=c2++I6FuNyJMyrp7YCdo/dOuPrCTBFNVDGR0Sl08/36Qq0dQ+bQISNOjrsudSiMdt0
         S1Q64hHyZhyBieZ2wRUljt+rfIlN5YoG/rAoJ4iWggQ8J1dmmk76WmdoCVISXRTEG3KS
         LBhFNJ0a840olgFdHVMe/B9PmtEuhqjwp5cvBEu+H7pLbdHBv6Cgz4sVwY7SSGsyqN8N
         6V1R6bLuFNT801vn3fy0AbhIgBDGvMwrmAsRZSj5zv2Ug5K7MC0yIJhlL+lQWQTs3zTk
         +udIg4nP8NVMkMEQ8k/G7iXV76Hue0+SQhcPN7wCs8TD4dwlyi2/jEkHybNC972MovFK
         dXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200824; x=1782805624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HOXvZJIgT1xf7y6r5/ilxE6ikYQEvsUFg4mACphcji4=;
        b=BsnWiW1k1nAsiQkDQpLuQwnciT+EXnDVy6IGyjQiFmpzhlwO9H1L8rnYppIdD1tLpx
         or+8jfEQvC2DrIIPztuh6z/hxlFa827mlOou3qYP7vkAOZ9i1IJrI72aqd9EUmArtda+
         b3qC6eZNgGLB41SXgizObXoUql+jE3P3UyU7+p50S9vJoN6/20ai5z4bZhdEntX/hcOu
         iMqOrWCAyT65w5pWyCs6RdVFmAD+JnFZ2OI7rnbsIRgpxnHoKd1pLBXBsMwcTvBHQ7Je
         GZLvisHDEPdRIpX8iIBbuLL/c9jRS19WQKPsFC37P/z1OwbvsRdwpAQ5YYTmEdDOcuOc
         c/pg==
X-Forwarded-Encrypted: i=1; AFNElJ/U9r8dMjj//urNJiac6H4CLwkTvjSmDUwUoCAvJolYQ9Ser/flKfi3h2cIA1j/JbyDb3z6dE7PTSqJm5ojKuZq@lists.infradead.org
X-Gm-Message-State: AOJu0YwCSRAwKbJRF4BaPqjFNnlQaGjYJ3BASuD7mCex3/1Dpa2p6IKz
	O+lPnP/Wvq6UkGqbvhvvvIIGqGYXbjn1f7nn9GTZaT+zNfJBIVvyX+Md
X-Gm-Gg: AfdE7ckhzFS/ETDGgDZb9rQt1ktc83BJ8EzKSXJifVuUwfaeoGPEdSVNyJwlnmZSsEq
	QhJb6ny4AjCssP/Vj72jmudECw/qPfhiT+Yc98ZRpgeY32t3lJ15uWd4859+zhSiFvPcVuPgWYQ
	1xLWW3kxqnD7AT/yqrVponTAGEKzeCXu+CCLKol9dYdO+4OcBVBR82cXktmB9uCVNC/jPCqqXHz
	6fAbIf+N0ALzRzxg3WzMiW1C/rkVtoYWg+m6X5s7akAloN1Jv8IS9ZeUO/Ru9uM4kpxrcYthnEw
	azUlBB/vyeC5Y5YhoSVaSAEnl/2n+JQD+wz8MV6IxotSPxqMQd2xkCFCa0mVWsvQbNzlNzNWCKF
	EjDp/UWm09rvbIUHssEhJ/B10PLBlXaaVucdnm//Y+rx5vIN5ZJvK0W+27yZQCcZdw/O+L2w4n8
	XAsYMmJdU3gTo=
X-Received: by 2002:a05:6a00:3e21:b0:841:69e4:f21b with SMTP id d2e1a72fcca58-845508d3c1fmr18398996b3a.39.1782200823739;
        Tue, 23 Jun 2026 00:47:03 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d8f1a1sm11063117b3a.18.2026.06.23.00.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:47:03 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yixun Lan <dlan@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net v2 2/2] net: stmmac: dwmac-spacemit: Fix wrong irq definition
Date: Tue, 23 Jun 2026 15:46:35 +0800
Message-ID: <20260623074637.503864-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623074637.503864-1-inochiama@gmail.com>
References: <20260623074637.503864-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_004704_360881_AD092D04 
X-CRM114-Status: GOOD (  11.54  )
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

The current irq definition of the wake irq and the lpi irq
is wrong, replace them with the right number and name.

Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
index 3bfb6d49be6c..322bdf167a4a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
@@ -22,8 +22,8 @@
 #define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
 #define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
 #define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
-#define CTRL_WAKE_IRQ_EN		BIT(9)
-#define CTRL_PHY_IRQ_EN			BIT(12)
+#define CTRL_LPI_IRQ_EN			BIT(9)
+#define CTRL_WAKE_IRQ_EN		BIT(12)
 
 /* dline register bits */
 #define RGMII_RX_DLINE_EN		BIT(0)
-- 
2.54.0


