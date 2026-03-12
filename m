Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06490103E2FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 01:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=; b=Ir9WsKBbvdIPdNUAwoYpJKBQ8d
	K8wJhvBLB3H1EAY4Z52UhciewgN2/uwM9qhg4o30uw51jsrTFIgSndx32i4mG5Vx4UHsC9PXWw7Sx
	NiFjyHqeMVz84bEScP0PRJJKYM6IQIr7Xgyo8ljnKFKhWzxRNEBZQUV+3daz7fzqJsb61NXaJ5TFy
	3vA0vdMK+b2z94/D4E+MfGTI8WS9KrDteB8Z6K3RHKWWZ4PozSbOHlGNboUl7nExG8p8r6iUeCKIH
	I9Yh/of+ZXeXbUJUr4qYl4rVeB+xvZs1g8Xiwkz2sDEO8JdoRTHHLaX89XusbR2Q/yaTRhRIyaLpD
	1O3DEKyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ulu-0000000Czs1-4AQ4;
	Thu, 12 Mar 2026 01:23:31 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ulr-0000000Czq7-2gpv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 01:23:28 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-50917e02472so5785601cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 18:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773278606; x=1773883406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
        b=dd/HymQMsmOS1EAd2cS3FBaPFxGhe5fmyIL4uTGBdsqr/HVhKhF46R7jZu1v4lAvUl
         m72F7S8fDvtzCCL8WgLLatloauDBJltg5QdWybMR/TowdFh6eOi7J2WgXssmBh6KykJA
         sglF2cy4VnLB1W5l33XZy5lXDK+EnwrQrgeVg9HBE49NWBGqfC6wYwQDjoyiSaSb2xCS
         hqXV2do6Jo12Y/2Gkv5rrp026kiPBotYvxJUG/YLWwQOkR6QOcAshRscuoJWrKs6UF+g
         pssyvW0rn4/7nk3LaM1higfE5UBF4pLVLNwDjPphQDB5yDkoKE9N8LPdLzRv+eKLiPuR
         yk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773278606; x=1773883406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
        b=IIAOUftCcBZW7kjDrKp3jLgX8H8Zby1ISIYvijK2hzW4hV+tk0QbVYlUf5tzdg5bCT
         K9OU+imYDE/ftrD8gao/NWlSmgCSKKmBN7UgvXc3gOgRxhQ6S3Blm5i1z9Op9owwbIKv
         UhJpQ3fV/ouLb4C2pEizRyS6jDSEyDD2CQgH5P4XaV7ArlWFElifafq4saYs7G0baPe3
         QBuuIO9G9RPIdD4LPoenyd1vQVxLdRrI4PSJ8ccpYqixfCIZsmHV9WaSf+F15rXkimpD
         E31kzX8gIinnddTQ5nD7G6u3a2SmmQicPMsZrlJoofdfdlzC54FenFxVenVBleZt6h6b
         JhXg==
X-Forwarded-Encrypted: i=1; AJvYcCUIUrd4ZwsXYC+MySD0Ddm8c7lPoVN7B2oNoNtWbL2UzrEzhGQig8Rq6CtVVnr0syEjMQ61WBXswLflK2gjFn/N@lists.infradead.org
X-Gm-Message-State: AOJu0YwEfY5taH9smbxjr092IFbVvuyDig0rMT9yHuZizfC0S7KM1w90
	TRG4YOy6Rw/KpeDPkOxemt6vp4NGmF11LhZPLv+dH1M+F/wo7HSMrA/A
X-Gm-Gg: ATEYQzxt9ZffJ79yRADxmM/gFMYBxlvbkNBc56XGq3zY8CzqwxiP5qfwLfme3M0p586
	GSiMIWpM2aliQPz6th0InNllaCZMCTEsPWJ4zPOp1SIBgyN8WlncpAg2UAqpb8T0ocO4IaTtdro
	pCkYluFFOvLKSgQx2CFnd3/lnwTWn1m8cJHps1mis0MfGtlKvdjsvLCfxLODw0kjW6y7al+N5rL
	D5cQ9p5Pq4uCikhGURl6fmjhCbjUp9eM/VmOwkISKWrg50KgdTb/a+QEnptXVGeOSZShEUSCX5s
	puSWNSRl+3DX2ZDz2xpKNz3Yh907hg6p4MzW428basJ02F/gxnYMo06MRBz9AqnS25M5cU7hynO
	THC0cuF4p1JHyDRVaHhak+wxseecmFcWXeKFXd26pM9TSry5Qhj4aiMGWlVy3mpWmtp6W3pqalQ
	2JYL3HBnDZXnarubwgIJ0cmtE=
X-Received: by 2002:ac8:5914:0:b0:509:16a1:2033 with SMTP id d75a77b69052e-50939fc6e51mr61632471cf.26.1773278606210;
        Wed, 11 Mar 2026 18:23:26 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a0ea244sm23041871cf.16.2026.03.11.18.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:23:25 -0700 (PDT)
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
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
Subject: [PATCH net-next v9 2/4] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Thu, 12 Mar 2026 09:22:24 +0800
Message-ID: <20260312012232.373713-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312012232.373713-1-inochiama@gmail.com>
References: <20260312012232.373713-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_182327_689116_592572D8 
X-CRM114-Status: GOOD (  10.82  )
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


