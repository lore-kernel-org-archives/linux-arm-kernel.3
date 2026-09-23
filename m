Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EADC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1UQRnFmVHWe9Z/cGe8zLRoDzdcB8ekJGDg85/atBZHs=; b=LQGC2SST6lIych36lHvb6D5Mag
	a5L6fDsmGtvD18VpTsePB1WhIxak8bAM92YNmahD1br8+YFrkOoNWK7IKx6fBn86oZUoFH4+Cy/6+
	WPB+enYV6nA7Z4ugb2/MuG77zw6HEfNjJwLwTcP2Kj5b/H8QoYuzES7YOe9MRxG2iCPByhyWEd8Bf
	sufngtZrU+og0hVP7R9H28ZKjDJNX4QMrx3POweggASEthbN+xuFds79XrR6ijk2zgSQbnq87IF6i
	FUu/V9ADD4BE0gxDpkIo/RVqAqTm2R1lxsolcYudDB5RADa23chQyQMoJ0GMByaF4yKH32eGD543R
	cxfH/X5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MF6-00000008Gwz-0bEL;
	Wed, 23 Sep 2026 12:38:32 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MF2-00000008GvM-35AA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:38:30 +0000
Received: by mail-pj2-x07.google.com with SMTP id d9443c01a7336-2d9080b18b6so6286785ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790167108; x=1790771908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UQRnFmVHWe9Z/cGe8zLRoDzdcB8ekJGDg85/atBZHs=;
        b=qLJWyI4T/+yHhaB32K8C7twGenAe7oGyhY5nDDx12ibYfQ4Y7RabLQph8Fg1AP+/Dq
         ZtnroQ3JZQ6cuyDqy6iwzCBO8lcUNrKztN4JfLbp65Q04jhJlPHpgibfqSZFnnfr0oac
         T5Rn+qZuHNk5/rwSC0jvq+1eoHlvLLSfD1uvLU8HgjyVQRUcD7VKwKoKIhF9Nd8f138z
         Wa4+mlP2k9oLWNKIX14PWTvdvWxcKX2hX4WoLdGFElKn8gB++cPz+HZUs/AgCY/N5AJ8
         Yf/qk5KNAVz7YK4AGAc55PjTvMIXyy74QsJrKTXd9TKXzqIGh2yVYyCijM5AMCBsZmsU
         zdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167108; x=1790771908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UQRnFmVHWe9Z/cGe8zLRoDzdcB8ekJGDg85/atBZHs=;
        b=x7CDT1wZ9XfAF7knM035KJvVxX+b7qUIcvsATBlmKU7qeAKDHCNn4QXuR/cgskSdGr
         PIjmXMx6mWk7W0gtyYxaxl3si8G+ybYfSAP9rdpDOsPgLUTkXQt8iwuPE2cbXg4k+yrf
         Ufe8I9Iu6TdSB0g+9fzj/wHQkVuBX3gqkkRfD1zPySVGDa0PFyorpDpFN0wW/vsRayCX
         o8qP9FQwy5JOF195WE12fC8ZqNZ70vhryozk1ks6bsZ+m56fYlQ/CJnYl0iei68Iytmc
         aoZgQNHK/+64ehjtBIWzCZNZGAa+wH09OWIvk2eJ20Wr3mTLTEHwRwt9V4L8UN17Pl56
         i3UA==
X-Forwarded-Encrypted: i=1; AKwUvBxmPjavvvNb47P3D1QHLbUhU8rSsi0Ndzubs7jZcOOSo0zaltOLV5LRY6zs7IyIOIHBH0ipG7eItFDMYDOEDCO4@lists.infradead.org
X-Gm-Message-State: AFuF++n/dL1W4Cj2lwEXzg4Hkgdh4+pmM1j1Fp0W8QekM79QVTyKsA7z
	l61xS/J1xqgE8894g/rQSWi0sDFQDHqZUKMV6lU03a9GBgaSezK+YbKh
X-Gm-Gg: AYBFou3jGvpOLrGFwiFkQZwnT0kMBOtBsD/osL7ztrWOQfUC7LJIa8HphA/j0l/X/mM
	OPn1BH9BKDXMmYet2U6RPNUmcAytQX1ofxzmKm//lLXRPRu6Tg78QtpxIWR6KUZBR68FY/uWj0i
	IABQKXK61g44S9DITBwkwAmh0MLz60w/ZjL5Az1Exa+d1HiH/KKx4rBt4ey+3LP82/p/frcKAc5
	dpO/sfetZJ4czQAQDlQRRSosjAKXCEUonUgiR/NFsoY8Wy9DaBaxq6fYwDzhLRR7kLqirwlXiOf
	o6MwBC6g5CJfq+ASKj6CwfpLCm5JfFb6jqYZmOebIAIuwbnG+fwiPuKv9ynx2iWVI3p4f6+2j8u
	MNtuIYxnW9G8UawntdEJZoURp0bphwglIXsjd0uG+Idd6WaPxdjwqmKShZAkG1sdIp1lHHCRTQD
	nCKk9SPnYSypu2F5SNCH97lS4wx2+k6BMXCT9dmuzMyf0bNGG/anIOY5r342giihrgyuq+XDppZ
	jVlK24=
X-Received: by 2002:a17:903:1a86:b0:2df:5a5b:5763 with SMTP id d9443c01a7336-2df69d1ae2cmr22719205ad.10.1790167107749;
        Wed, 23 Sep 2026 05:38:27 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6afc80easm9220405ad.30.2026.09.23.05.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:38:27 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net v2] net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the PHY clock fails
Date: Wed, 23 Sep 2026 20:37:13 +0800
Message-ID: <20260923123713.3137146-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_053828_793301_F80C1D5B 
X-CRM114-Status: GOOD (  12.71  )
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

gmac_clk_enable() enables the bulk clocks first and then the optional
PHY clock. If clk_prepare_enable() on the PHY clock fails, the function
returns without rolling back the bulk clocks, and bsp_priv->clk_enabled
stays false, so the later gmac_clk_enable(bsp_priv, false) becomes a
no-op and the bulk clock references are leaked.

Add the missing clk_bulk_disable_unprepare() on that failure path.

Fixes: ea449f7fa0bf ("net: ethernet: stmmac: dwmac-rk: rework optional clock handling")
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 8d7042e689261..72bdbcb5e863a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1162,8 +1162,11 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 				return ret;
 
 			ret = clk_prepare_enable(bsp_priv->clk_phy);
-			if (ret)
+			if (ret) {
+				clk_bulk_disable_unprepare(bsp_priv->num_clks,
+							   bsp_priv->clks);
 				return ret;
+			}
 
 			rk_configure_io_clksel(bsp_priv);
 			rk_ungate_rmii_clock(bsp_priv);
-- 
2.47.3


