Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E35EC1439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=; b=erVtajnoFCJ/62hSY7kJG2NDyA
	JNxcKFiR0lrhoDEbsOAcCgY74eRrWtZR2vfM9fUsn1/7ZBTu8ori+0ic49sg/qfncaeKJOPFmlmH7
	Hp3pzyITlauAipyoUtkApWnm2t2tdv3fcdD3Nrf7TmOHDvXs1CkqkJ1SfVOnDcXT7a7pOV3B+0sq4
	A7YEj1rYBgZI99jSG43RdIk6utQFNnxCdexrmQ6IihTTTPBWJyfBVUq0BfDkINGJm/qA5qChWyRmw
	hDS4I7SZT0ihDcUzQFYg6OHov5LiFoqEtesCMc30ZCqOWpXt/btZ4SLuZxWfBtJTr3MG/02iSNoK7
	UxQZkIFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhH0-0000000GgvN-3C5z;
	Wed, 04 Mar 2026 08:08:02 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGy-0000000Ggsk-0iEh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:08:01 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82748257f5fso3438106b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 00:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772611679; x=1773216479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=ZYg7XmWJOYt2r+2kD3c85HKWA+rfhH9t6FWQle9yzijek/iOUjrlUzxwp/8I6z7jz5
         hgTHisf3THH1RPCdGb9a9bl72lK7CuguU7vjfyCoIbHI03vz1eCK79kxw536nvp/dg9k
         IghzNBYuDgbw/k9zxE3OzMwm75TMDQ7QltaT4qBn7EST2QYpYmYU80QJPj/hs8Iuftbq
         mpYmufsdPn/iVMnU00l7kjj1El/Ywkod7mtqzXuMUcVFd9pL8S6yyUxUt8gmWkXktPbO
         uUwV+MagfbkIYZZzcllLiNZ+m380C/C3Afr9jq02s3AIgzKu0VWhPog1s7hGqhtrctZB
         iMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611679; x=1773216479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=ChQjxkHVkHHRunnvWnp+5niPPAnPXeexL1Mkss9lbPnA3gIjw1dLgXkWIKxS8JkhEa
         CAB/naJA5f3WBk39+7ATejFRtwHyb8VOgD52rIy14cF3XM8mul0l8l88mAWKyFBk648i
         y4gBVazmDqYhLl3Lx1sK2RWUTLTOF4YT7FMs5oPnjUd6MDkk4xHZqBrQcB1aFz52xDz+
         LrQ4ACT0qA5WgspdQ/BJ7pvcbOtxCL9tvzYTMVVl5dvJb8tihixztEo2fUftSod3+CJ+
         s9h42thf98AB2PJCmVLF8+t1rzOFYEkJ8yAuJ1Kz4RmrBiK3txSRXrXG946qgV8+1jCs
         hICA==
X-Forwarded-Encrypted: i=1; AJvYcCURB8G+uv0TxPTUzd2Plh6QdyyJZ9wSN4extPqMM/XZH5gyg+dIZuzIkWHjH+oK85Satn+jNRknrqRwsL8kBrWS@lists.infradead.org
X-Gm-Message-State: AOJu0YyWiBknCOYQUmtimU1l89mQJiskhrxllfjNoqVfnjXDSPM4hAxR
	WZi+yzT1BJvvjbsUezZ+cmjx2zNrp/MNYIp/T1NKatiTZJjZdk9ZQESS
X-Gm-Gg: ATEYQzwkbkNbDJdGFI7EQGwdJbfi4AqeNXUhjkxLLofSbLT2ygUInTSghOEjthL1gMp
	DWrIDcj09u67Bez5RDp6xmHijwmdgPchydtJstoWoxRYbOYm723TROLj6GCwYJ6kLlDukvU3Wg2
	lba54Y7gVUIrUiFKOzYlitZ8oiVkL96RiRiraV93y/lEDAobx+P598KTY6ohqUyw+oHQHeSR36C
	5Ax7GAKoSu1KB8Z57lC4qT1vzrycHPjG2cDxFcqrVMeXt3MyYTIZjSFIHFnicQl4Tkr4xps8nBV
	LM3XupKTbHZMmrbvOC64OLYxIWmuXCO681A0ub3PF+skIFn/UycBnns3pOhDO5qHcYAMGtxQHa4
	1sbguyO1yKsqyjyUhVs1sH/bvs6S/bifla0inab4MYr6etZ8MTybsc7Xi3Vod+DaFEICwMiPxJ0
	oxDipxpY3R1tMObJlfCXT2FSs=
X-Received: by 2002:a17:90b:384f:b0:34a:be93:72ee with SMTP id 98e67ed59e1d1-359a6d2687cmr1265093a91.8.1772611679144;
        Wed, 04 Mar 2026 00:07:59 -0800 (PST)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm15592172a12.3.2026.03.04.00.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:07:58 -0800 (PST)
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
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
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
Subject: [PATCH net-next v7 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Wed,  4 Mar 2026 16:07:19 +0800
Message-ID: <20260304080721.1658224-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304080721.1658224-1-inochiama@gmail.com>
References: <20260304080721.1658224-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_000800_235652_11A723C6 
X-CRM114-Status: GOOD (  11.13  )
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


