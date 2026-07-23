Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58F4C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5GvXCyDbMywePvpWfEAV2wGSAk98JtrF+QMdiv9nn4=; b=DwqqMaxTAb5JPK33uUqNmHb2GI
	JUuKaRt5J2H+SSptpJOe71KOqoah+vJnof2C2nzKj33pwxllt2IfpabP2rQWWAZPzCFA3VCIivGqn
	LhviA8RiAN6D8KZwONbCnTdqpbZxrL+2w/Sbteumy8zuRu/JJVJ5aM7K3JsoSLU4fqo3ucq/HhOfD
	Ec/kjGg6yFbKUOf3IVTxYj2toI9ngrKu1IaDbtpb4mjwrEuULNtUBDgxZ2iBtSu8v9MfPep8K1Y27
	sPmVOx6Etg4SfYcB2nW1iwpWkbcrAS1Gvl8LkA86DZEpcdg85EMcbTdwUPbdO0QlpJ7p5epM0CKy1
	JTokO7yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqZN-0000000E0j8-1FLu;
	Thu, 23 Jul 2026 10:22:25 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqZG-0000000E0f7-24UI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 10:22:20 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so793878a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 03:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784802136; x=1785406936; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5GvXCyDbMywePvpWfEAV2wGSAk98JtrF+QMdiv9nn4=;
        b=Wb3mePyXlT6Jyxn6o/ZfbVQsUBuWOpQIivQNjFc1C2USvk+/BCVAOMABET4QLG+87+
         tHzrBVtaZcHASGAaa0FNwaLmPbmTCWpQnSBMXm2Cg1qf4pOwnUHM8ORI+typfn7oNkcZ
         7opMe8QZ42yoSHlRBWaspqwk2GmZ3N1sY8x4InUWW3ZLzOCI4tJLHTi2OpI3aMcLLst4
         p/iCaFEOwx4NwQYl9Bu4dtVLG59qV8GBYdSJ6cX3Z0Ybvb3E33UvVVff9PlykgLJKRh3
         bTy92HqbR2vCfFSC6y5gYUC6/Fr3mt3Jamo0wuZ2FhmY96ixsbOu2ZM5Met8/EwxIsn8
         R3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802136; x=1785406936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5GvXCyDbMywePvpWfEAV2wGSAk98JtrF+QMdiv9nn4=;
        b=caVLILiHyVypFil29LUz1EVZ3+QaQ9r89/tF6/k872KXyBrFde9b2u/gnyzHkgrzar
         6I4wM0JlddiM3h9D+x9NOzRb5cCfwUXV/59ZR/88L7tOlfOJb3MlHSFgncZLdZMtTbiV
         zxtAhKTOF6JabIcvLqbsklxjWYMamju1Yvs25eECCCFi0EbU1mX+zdBj14NRUzucXdyx
         MZuSxsUKLVufic0geivWTEx4fFXpS/WtNypNMdBDGFwGcP7Ic3QVzpbJJn4FtwyGHmJ1
         HCNq97y6IKzCfj7zqX6LeY7ji7b4ANAHuisD9zzrk61RfDVPnf9h1Uo8xPzTpLlsDLM2
         wQpg==
X-Forwarded-Encrypted: i=1; AHgh+RqdBktDdXPQIdkF1Sm1aLUv4zrg5tdmpD3N2lfUdCAzrcjNfUuH9ucea+zClLRHr2yHkdv3yr20p07e2mjlSrZg@lists.infradead.org
X-Gm-Message-State: AOJu0YwR5hBM3GlLzRP+6WuLMqD4SP6VdCW14nD4NlB9xtEZmBFd51jA
	PY1MMwPSHGI/NJQmtvz4E7IifvkKQa1v3Jq3InWEMhLXwA9c9XtOjPBRXcYd5S/WSco=
X-Gm-Gg: AR+sD139mxCyy5SLWQZIFKGGJ+0Jx0RWFdAlW54cRVavIqo024JwrNObLPrQVnccCZB
	vX+dX9g/RdoIk984q9xMWpijgsnW9TzJOnbrdYwqJ5rOEVd3J9yV2eidJP9zclV3R6U5tynVgbL
	sXw2Coy3dWHwsu7GhIzQElmIE/xrlR/ugXZr7ZVusPiQVzZj2wuYBK0DvnSmyzFNZ1fjjqMU/Ok
	xxopOxmhtZAqAcOPguHDSJIxEZ250xhxo/ufSHj/i0zxIeQnUASIiDuhGsfZ6bk7n6rWR0UQ/KN
	H4OjNC3swlR8MlgTHq4VDT5IhL/P9MeIq7/Q7zFIxHetG311jZpNfvMifYDVOutHrodcKkYQH2y
	xW1sigg6J1vhts5l4tpQv3WLaj2qWrYpIccxodwRPmJpU4LnNSb3gRexEYEfDvrFD1/7wFDtssF
	duwpl8aPco7LWg753XvMOhwg==
X-Received: by 2002:a05:6402:551b:b0:69c:7985:5aa0 with SMTP id 4fb4d7f45d1cf-69f6bf195b5mr892015a12.16.1784802136598;
        Thu, 23 Jul 2026 03:22:16 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.32.126.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f35020dcfsm1944928a12.20.2026.07.23.03.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:22:16 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 23 Jul 2026 14:21:58 +0400
Subject: [PATCH v2 1/2] clk: rockchip: pll: Fix the fractional part
 denominator on RK3588/RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-rk3588-fracpll-v2-1-3adfb9dda235@flipper.net>
References: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
In-Reply-To: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>, 
 Wyon Bi <bivvy.bi@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=alchark@flipper.net;
 h=from:subject:message-id; bh=jqtEtaQJKghCWQEk2fjI4x9WFEAteFPftL5uLjU7sBI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQlvvZq/Tax+UyJXQSjSdG9r+cSuRpOND07vMZbwq3TZ
 fnb033tHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1jAmMDGf1FxS+Z5m+PGMVe/ec0MPTnzm/ePReOV9O+I7ehRMB3VkMfwXOq3/
 ZrqSrL30u0pVX6OyUn9yODO1avPmq7VMncge+YwEA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_032218_711909_B3FEC78E 
X-CRM114-Status: GOOD (  14.23  )
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

According to the TRM, the fractional PLL coefficient should be divided by
65536 rather than 65535 to obtain the output rate.

Fix the denominator and add a comment with the TRM provided clock formulae
for future reference.

See RK3576 TRM Part 1 V1.2 section 2.13.1.4 Setting Guide on P, M, S and K
or equivalently RK3588 TRM part 1 V1.0 section 2.17.1.4 Setting Guide on P,
M, S and K.

Fractional PLL rates don't seem to be used by any current mainline
consumers, so this is purely a correctness fix. It will also be important
to properly support DisplayPort output going forward, as the video output
controller derives its pixel clock from system PLLs with no dedicated PHY
PLL option for DP unlike HDMI, and some display modes are only achievable
with fractional PLL rates.

Fixes: 8f6594494b1c ("clk: rockchip: add pll type for RK3588")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/clk/rockchip/clk-pll.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 6b853800cb6b..bf8acf7cee0d 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -900,6 +900,13 @@ static void rockchip_rk3588_pll_get_params(struct rockchip_clk_pll *pll,
 	rate->k = ((pllcon >> RK3588_PLLCON2_K_SHIFT) & RK3588_PLLCON2_K_MASK);
 }
 
+/*
+ * 2250 MHz <= Fvco <= 4500 MHz
+ * For Fvco > 3 GHz: period jitter +-1% frac PLL, +-0.75% int PLL
+ * For Fvco < 3 GHz: period jitter +-2% frac PLL, +-1.50% int PLL
+ * Fvco = ((m + k / 65536) * Fin) / p
+ * Fout = ((m + k / 65536) * Fin) / (p * 2^s)
+ */
 static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned long prate)
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
@@ -915,7 +922,7 @@ static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned
 		/* fractional mode */
 		u64 frac_rate64 = prate * cur.k;
 
-		postdiv = cur.p * 65535;
+		postdiv = cur.p * 65536;
 		do_div(frac_rate64, postdiv);
 		rate64 += frac_rate64;
 	}

-- 
2.54.0


