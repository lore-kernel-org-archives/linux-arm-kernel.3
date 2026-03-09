Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02D3EA854B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 00:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=; b=DlVI1NzNZdWsSOSSjiu7l7CYPD
	xndbIsDgw0QadlZ77cnQor/H3H0Qe6HBBdcxJpSbeQChhRI6fTQMKAqSKX+RKKZZ0jIvd7JcZpvlG
	FMFpdHdDfq+6/duww740+ER8Jgx3qSm7Ja3/CVPOF6LAgYLsJ+ooOPBJy6u0Vbj52jHZP9j2rKMWW
	nwI7aTD/m4OHc4DkBo43/utsthTzmdSZGhv6PZPwK3zVhq7W/kQ6Lmg8AEaUA32d6t7EDYGVLNbPC
	ECMSh+SkClb+gnjhyVyhiewwfapPdNV8Z04Vpip/ORDSskrQ4WJRfrhJGZCXRNGFh/9pejQEfvKoL
	SYhxLF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzOir-00000006TrZ-3jlk;
	Mon, 09 Mar 2026 00:43:49 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzOip-00000006Tpo-0ph7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 00:43:48 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-829a568f3ccso1140165b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 17:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017026; x=1773621826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=fcvru1XLpYLadaajF4UGItuCRaNJE8xnCctD4/Si8MDQdgPuEgR363SKpGVrwjVD5/
         2l1S+gcp6o6mV8jBtIDepilaVAGnOXtxpSuNOSDyPn4tWySVlf+pd66QTv92JJS8Li8e
         woyYmwKldi1aYrusO0a5XKX70W4ZjzPUna1khJE12F3HgGCVMdZWjQl98RghnG9iKz0Q
         l17oCKCRnGnQtzFtjhGQy5MVDQfO3HCnYkIEL7/S45FxOlIE3k1Wi197W0Sba7U6f+kl
         85ew/dRi2DAw2FBVVA7rypPHl5HcSeFg6B1fkD9hRkje8FbA2XF4Tj8C+hCrTk7w/G5E
         1zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017026; x=1773621826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=nV5fXzw2FTb2EwuLNHJAK6TKRAyfNaVt5xdgHLts67y0LPL1Q6qt0R4gXxhH6n2qDW
         mMhaha5bQ8WYWcEUAXRgq+ufDMkcX7/Gjop2qByG/1j0gPhzqhqop4/mX0lm/rvW4TSJ
         P0TgiZSk87MdVZj7BNvER8Bu0dVa+rC03uf1QPNc3L4gcgRW2WXdfiCKwtXwc4i88Eo4
         Ki7gYDyi++iKPxMkPIsrPg6h9vHLCbzWbcxTWq7ZUnpO881Khl5Z7g9rxArUvyjlJcDk
         t7NtQi9jClOCLsypPWcXP9KcYaSJ8fagKlZsDbcoxRj3g7Ik7TwPsP15DdOi2BHQ/G1r
         v8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4phTwVTkKa24D6HYsFgdArcVrzOs7Sq0zTiXy4ljWP2FagfoerGcrj90XRw1ECeFfh3caBOBdmXwoMv3Iu3qW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8AvsEg8iISFyuPxkUj1C9jbHa84lqpUTSPwSjF6LB1a83ZRcV
	7bkac+6Q8cNQcivN8ArWKnuIt3+TQ0Rp+UVh8ehHsZV47pj1RY59Y5Ek
X-Gm-Gg: ATEYQzw1cB5454F5dx/HYdfsgq00KG11LydyMRt5cyUhXz4r47ld2dOjacw8yLH6UQz
	cHVaYj/QMHEcIqvsFhTvTRlVqYyqDRj+6pJqg5z+hBEhW4d8EoYtAekKC9OJEzt2q/EexQ34stM
	U6zRMbcYf+Cd5ggimJsXUlcAta6gCj91qyEUAKXBzAP1ZiDa/z1DtrOzmQdwFWw6mllzcX185qp
	K7P5nHV/dv3GAI5MOvzd3NUIz1mPInLl8nlRMtq4xCh3npqs0A7Mi0kQ5P1ahNU7hhpgBi4MHkb
	WEPdsY+oLA5eQKCw1qIbRf7bpSjY7NDRSYz0XWvjlNGS9tqhfBd0O/b32nwecATIZmrWgh8c8RX
	tuvqMN9OF4M7Pbl9WuH8MARZraSeATOAASwsi94yv/kJl7jnIFy31xXITArfeIgeGZHFCBT/OJD
	nBs5kxnD2d1cqlhgiTdR6jpCA=
X-Received: by 2002:a05:6a00:1954:b0:823:9b7:9c0e with SMTP id d2e1a72fcca58-829a2f348d7mr8883510b3a.34.1773017026266;
        Sun, 08 Mar 2026 17:43:46 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4656f43sm10324424b3a.16.2026.03.08.17.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:43:45 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
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
Subject: [PATCH net-next v8 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Mon,  9 Mar 2026 08:42:43 +0800
Message-ID: <20260309004305.315018-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309004305.315018-1-inochiama@gmail.com>
References: <20260309004305.315018-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_174347_248003_D257C0C1 
X-CRM114-Status: GOOD (  10.84  )
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


