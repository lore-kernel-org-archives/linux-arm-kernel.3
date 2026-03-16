Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A560F30297
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 01:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=; b=N6QMiBZfCyiCoDxjIJP66KzGck
	2J5ualzdPUJpKXt/V6jeq4ailVP0wTD3hPhHhV2rksakf7sQJB690iAh9i6upXT6XyHEYQ9G1ES+0
	zOkmi7sggipY5N2L4jeg4QQmaJ1ivxhFmFQ6sWPWvYgSKeqg3KuU8Cy/cHvcqDp7j/d95rUIF+ElL
	b87Omq/RZUVbax/DPKn35tJfgjaqbWwcTr4SOOy9N5WSzWbeTQea/GdgYcYkAUPX+o2kFdR1bRurn
	PT03KVoQ44ilT384BVOsSH+6DbFE9FPYEgpb2WqRpdobWiRBreh1yRaODDqjMgKJTO+E6fpapvNyt
	9sMHhUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKd-000000033ul-3WY4;
	Mon, 16 Mar 2026 01:01:19 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKS-000000033qL-2JfU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 01:01:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ad9a9be502so24074285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 18:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773622868; x=1774227668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
        b=StWovg+q8KzraaaXWp89k3z4uIxWpIEQN51TBifyEaEZFT70m/MavH1Z3hGoAWGhLr
         +jfxx3I4Aphvde/STEULC82le3gzGuiBVkOL1akkkOmGUUoV8tWIFxQQScYph0b7Fuc7
         R+1smO4sYKwbAlvvDOVz7gPlxSmpjbC2noHkn3iB/BmnfFGagQhBwndB3+ya8WRDqTs0
         AkatrfPzPR/QJ2WY6QeeXeR26ct0qYmUi1O5NxK1mGkkKkkPRsneQeqlfjVqY/5Ojhub
         SHe8UhEWxNaxmtfbhPdERrZH7etI15GE5HqEbBftGj4hnSo2wT5Q6ZtELyPIgQhMstJd
         iWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622868; x=1774227668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
        b=S3gqee9qC4IrAFORabsR62B2zO9PzOnYiSg3/Ll3xsntLrpPUZUFW0PjlOi/wlaeZ2
         Lgna3aESb4yk+2qp/zWgrxXqM6eI7R56Hbk/ryNmqg+ayZbilevDqWzhuD/Uev1XDfQn
         Grk1oWDj+pXryN/v4GmKOAVsAGUUtK9dU8Gup4h4pfvsivi8jexGaJwTMzuvGwwnMeaM
         jtQEafLy7eAobJCuTIiWisnr09r+mR3SedGZ+7Yr2FQRIsofGzYFn87M5aLyO10H7/Ly
         0VvB9hbvW54nbSxvk8H7KAQFwE4dRJ2cohPCqwAB929d9HxnXjGfrwrxv97/kQ6uABNo
         YrBg==
X-Forwarded-Encrypted: i=1; AJvYcCXbGCpctQc1PjrdTlLgGBJK3CPwW4jBQFPPjOxAfZhV5R1Z2JD0HntaawWCXghTrbbAfVR+nfN0wn1/FDjsgFcZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxSs1wtxy/PVgWcqjjzZxDKc+EcbfWXRnDQNIXs6ZwdsY4T7dkg
	JBiSalOoWA0uzPzs39yai81Ofmb6BEqiP2L6KrVk/NAm3tMFInf+q+KJ
X-Gm-Gg: ATEYQzwrNzsQJYy5YPbfyw8O2KN+BE/YtqA6idnPMVO23VVC9LqqCSSkhHaMtXFd0Vl
	kL+ZXmXwuCTL+aoiqHfQC80Jt8Jhuv8xrUb1izN3UFo1fHQ9QtFXPuaSObC/ZDKsjJmBxiGG2xD
	TbcSxIYd1/1pS+Bs0rXxnvMK4so8ywzWm2sHAU6Uu7oE0VrI67fDpfGoVjyVT7emC8Fq659C6Ua
	fcrHN7zN9rRxARTJ3+75w3oSc5lL7x/n1/pwYnQI+Qfh9YpJh+rYvm4XTpIaWgTYs12K/KoeEq6
	Q3dv//pjvBYQFCwwrK9rfYzCtBUPxUHWhKKglCNwR63NdYpk3SQ5nfRBZn/3lhbNx7g9WvHfGlr
	znFaPT1kMOf9Zd/jzPV86t+Ao3ONL0MKPA33qQhMCTy6HAwtAv6AX3buAfZX5J6yznhVd3Sm/Gi
	+MkekYQvQ81oRoYZHUr7z4nXVIiSy7iGnKOA==
X-Received: by 2002:a17:903:b8f:b0:2ae:4fc7:8053 with SMTP id d9443c01a7336-2aecac6c131mr104368395ad.46.1773622867648;
        Sun, 15 Mar 2026 18:01:07 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece839dffsm89559855ad.78.2026.03.15.18.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:01:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v10 2/4] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Mon, 16 Mar 2026 09:00:38 +0800
Message-ID: <20260316010041.164360-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316010041.164360-1-inochiama@gmail.com>
References: <20260316010041.164360-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_180108_746195_D59E59B2 
X-CRM114-Status: GOOD (  10.37  )
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

Add compatible string for 5.40a version that can avoid to define some
platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5c9fd91a1db9..02303a808fb5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -396,6 +396,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
+	"snps,dwmac-5.40a",
 	NULL
 };
 
-- 
2.53.0


