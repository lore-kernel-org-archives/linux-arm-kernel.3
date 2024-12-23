Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9734AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 01:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiKcNAywK5Cmu1NkwsGA/Qh6M5B4fnjylkQgAEZo09A=; b=4yFg/8fsfeugxdqieYEvyGCpR7
	11t24rza8ouigGxdOsnrvGiIzrKILWY8s1odTlrsaVPP8R6WHkCIK8kAZT8q11x1l1qoC2pWtJSss
	W+nQXjLucNB4ziDtjQhYMwAHtYuCkr/Ffkkol6k0s5voI82MrmTPpU6TH3johulnCUyzKl4vJmZcS
	rbkQDyYL2Mt1o2Gf1v0/dZbIPLjw7wLmB9cGm7kInZ5ms/pS9+zhzq+3DJTlONtf0wc9l3DkG355N
	hhL4gCXhjxVBAnnPA2cFgeE3YFl8W2oyfOkwLrlR/l7kEtjOc+6JXhqkVd9USfHAlV+heqW04KvzJ
	3BU0qm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPWqb-000000093EF-1Ohj;
	Mon, 23 Dec 2024 01:03:01 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPWnB-000000092b1-0Hbd;
	Mon, 23 Dec 2024 00:59:30 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7b6e9db19c8so275511985a.3;
        Sun, 22 Dec 2024 16:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734915568; x=1735520368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AiKcNAywK5Cmu1NkwsGA/Qh6M5B4fnjylkQgAEZo09A=;
        b=khKaXl31WZVWboUz8S5EBrfHGyQaeSMZvcIwv70AelTTBJv7tDPqqaRVSCzyCRv64S
         VrOhi1I0HsM4eI3IABBgb2pfYD6JdfNUEK/pBsI/0LV+24YajUO50PbIkfqfm9OuBIXO
         iyY+BvPeueGvETaFIBEiOZVOhn1CW0W7RrJIMNTnGPM8Qn4yEp48kqAJyjA4oeWLmJ0/
         YW6G3/NhLW7yXaXpTtTjIKt/9Ff974L/iGuXr6UKsblb70ZHwuAp+6LXSIxMgYVdk1Nq
         +/HnDtQQBDkiDRllgfmWRy3beYoMdMa7dqQLRtrxMp2f+01Pq3zsytqMMqORfD8RQjW5
         NP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734915568; x=1735520368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AiKcNAywK5Cmu1NkwsGA/Qh6M5B4fnjylkQgAEZo09A=;
        b=CG5uRKV8iUN1OvdmqGMumnlx4JrRYog2tR1HIWnXbRdSrw4VQfvRUkM30aFHEhrwIL
         ekWqiw+Xi0fjScD9yIGQpKlwHhxPzp+TbbCbLfd2egmkHJadJgz/nUVtzF6+niF1/Gxi
         gSGGiDPhJ9Cu/6ztjKo6ql5ygJry13oe74TmWBPKPR/pRdegTGi8ukT2yO3RSXWB7RwS
         v3JeBTNNHhzfOXDvewZ78xHYubnzyXn//5qz0ciZXD+KJ2gEnbYQnfsphg9xGtCBqu+F
         TFQzVYE/TJh+cJqSGW0nCi5OCUXh1W+zrfEGNbbp6rxHMN3AF/dUu/j2uOfTURgt4zoU
         9lkA==
X-Forwarded-Encrypted: i=1; AJvYcCUGajCEa0CLsA3vSVORFl/SWpMiwIia30ckI6WEif8onkEqMvSiplrSi3H/overQy/Xp1BQMx1x6/DPafJyiNJS@lists.infradead.org, AJvYcCXnrVxA63tbRdspTpk4SSSKBFbt+6Ja82SdqO7lTxHknwiV17dZXyXHN1ibON9Ea+LHlVxIsuEzR8UcGEo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAQQQDPNHCJgHjkLT/T04TIhWkhVuUZQfod3WthYiRK8N864Et
	r0ddmD4ZLiw+8GDovR39aTKT8yu6fSgiNnd49XypIMKYUIQhT6NX
X-Gm-Gg: ASbGncuPSVMRMMSmlufMduNFxfSk4xCUdOqm+dTOUOy7sr3sRuLNGOTXrt1Ze826QOn
	LrQadXghtMudA+7N5haCWKmAtVwrGBQ8YFmbqNkU3Dx4eEBjvcfT8hLe2ALAaRsy9XKu9us83Wk
	DS0SpmBtVy/2Oss1LRbDIItlqGhh1+lp0jB3fkVjbCUCAn+Q0A2oVAX2lEjB8kuvibJHIqHxPbj
	KYPfmjE3OlC0es8LfWWLySjF+588xlW
X-Google-Smtp-Source: AGHT+IHmWT1/Ptgcfo0yRcOfYVL7jRnYrWxtKz1ZxEcSoQyLNTugTUWefuWbPDDlyPnGLBEXiIHxDA==
X-Received: by 2002:a05:620a:394a:b0:7b6:d710:2282 with SMTP id af79cd13be357-7b9ba80ebc6mr1941528985a.49.1734915567731;
        Sun, 22 Dec 2024 16:59:27 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2bd0b9sm341784485a.23.2024.12.22.16.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 16:59:27 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v3 2/3] net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
Date: Mon, 23 Dec 2024 08:58:38 +0800
Message-ID: <20241223005843.483805-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241223005843.483805-1-inochiama@gmail.com>
References: <20241223005843.483805-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_165929_144169_7F986047 
X-CRM114-Status: GOOD (  10.81  )
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

Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c   | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 3ac32444e492..6ce3e538ce0a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -421,6 +421,17 @@ static void stmmac_remove_config_dt(struct platform_device *pdev,
 	of_node_put(plat->mdio_node);
 }
 
+/* Compatible string array for all gmac4 devices */
+static const char * const stmmac_gmac4_compats[] = {
+	"snps,dwmac-4.00",
+	"snps,dwmac-4.10a",
+	"snps,dwmac-4.20a",
+	"snps,dwmac-5.10a",
+	"snps,dwmac-5.20",
+	"snps,dwmac-5.30a",
+	NULL
+};
+
 /**
  * stmmac_probe_config_dt - parse device-tree driver parameters
  * @pdev: platform_device structure
@@ -552,11 +563,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->pmt = 1;
 	}
 
-	if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
+	if (of_device_compatible_match(np, stmmac_gmac4_compats)) {
 		plat->has_gmac4 = 1;
 		plat->has_gmac = 0;
 		plat->pmt = 1;
-- 
2.47.1


