Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7C0C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 19:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=waJgXQXTGwqxVCoKMxFRK8UAG7XXejyC9jdURlCNsnM=; b=oN8XcECnJZpL24o3+71erujWKl
	cyxWURZX0cy+eSK1CFnGvJkjxO1nAOwyyPwnwXtGM/FojYlqKoJEocVUHKFXlwBzPgi2WFMrraT3H
	SkfP490125Nyig1+gYKBJvfrWzodokLHJucs1sgeRjDzbCQU26GGvKTwU0RLckgy7dDqBU/42gqDS
	8xgOMcQHNxQD2iVNv5X3+XwefoEWc1nIkaXXVQlDb1BO3IJ59U1xC9o9UZ7nscw55S2QupiPlTnQt
	zvNH64RYLE/6xp1fplKdzx7iZXEWr4ecSGbiMVEgeRaMQ3C18S60I7Gjag7mb9+hzoSPmSrcUtQlW
	lB2nEdDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFyK-0000000AH2Q-47ye;
	Tue, 21 Jul 2026 19:17:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFyH-0000000AH16-2fiC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 19:17:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso28165815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 12:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784661460; x=1785266260; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=waJgXQXTGwqxVCoKMxFRK8UAG7XXejyC9jdURlCNsnM=;
        b=0+9EqjuUwRH/7PRMpagV2Hy7w/V3jIhIGSleSySBADqtpnWY5+rpeQR1/83Dm4K9HR
         oR6P9S6XwW5Q/ZR4vX6ABKyee+XOmY8azREqEcnhi9+3+ujNZ9vG5JS790er78a4umSP
         NHbbcvQ+LyhUwG7nS/k0tFnbWlseihvEKmO6AvDZINPGLxezWpsNBg2mS2bFozz8voTa
         UCzQXG87uYGK3Gn/189gp39O35qPFlJdcULWWD8pOPC/wbZDMDuBg7LMhbWj9ycrx6yf
         wn4a6z0KJBG5GHT7Thygf7uZnz3sJOQ6AWIB9BVI+SJ2sujiwGA1C0I9DBqX2bGWmYl5
         zjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784661460; x=1785266260;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=waJgXQXTGwqxVCoKMxFRK8UAG7XXejyC9jdURlCNsnM=;
        b=A5BdZ9YLWRYviMJkxwbMo7k3xytPUAczycib6s3FbM4m/DShMPYUXDCzwU8vwwIhRx
         o8Eaf1L6iHjz1xNcUIscjtfgwVePWx0ht+zoq7Iz9BRogkVXmLrBq7As7zMmDUhoWa0Y
         JDUs9jDJrdooQnNdVDfIlsPVujbOk6ZDku1X9jySmywqC6HhwT+6z+XCzyzfb9vvteAg
         +FJoV5sHtOeyu4LlnUsiiyBc70u9Y0WkyXX0NGQHCnoBXKP+3969omwLKRYoVDIwsgS/
         rHMKkoADgXGH7bfqP38wy+J5spB7XkFCh7U4ZA/hqU23TDz1Yhajm0+gmNeOyY2nuTJ0
         eCfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtoEtoToH1yg9RY9kc7wTmQxsMCQ8MpDIY76yPd49i63HlsAMoyJO9D43rhIDSXtfNtl6SH2GWYBszj8KeIjYH@lists.infradead.org
X-Gm-Message-State: AOJu0YxZqT3dDnwZh/gN7ni7oRr9uoCiAaVLf06tSHEh0p6EAPD8xYNL
	/btTH+H9TktsZZ1a9nE8YXIMeAChxsY1hFPrY1KDUKKjNzXATElCwIPe4YLXP63cpfI=
X-Gm-Gg: AfdE7ckQ1msioVkjJDErMr8uNyAl2LPqYKonJ+h12fG5jCMu1G0KAzS4mvEmDIKXHlr
	05FZudIOrCPk6rY9tPZ9BzzJ2CSsxTVshR8os2d5MDC436utte6oDQ8OpwIISLqtMEtJh8rXC1n
	twzLLdR5NDBhxfICt2qHS5OH49pSDhOzOPkpNZ8I/CjiahG4PPMLE489NzJ26vk3Ck3pHrsmWy+
	8u5iDaEyZ19A1ogB02zpkJnY7qFSFTNAZ+wxfs4inW2GBngUGrosfK+nSPHAi8Xor3TCPZbxyCK
	rd5ghBHBOcImzaM5L6rhpyiC20LHK3jtJ+bctdHyhPXlCdZBPwMGO/09SEXncwMNA6mhTFeYvPt
	9fc3KMNb085NlhjhzeOB9GdeXJ5Q8OQvTbG0CRzOS0rj3ltxiIMH90NXzCDtUGb/yHZE7lHN7/2
	Jh+QxiGduSRMi11Y4rAvqSxqTTohc28UjpbM5b4j8xsU/GanEMvN/ksw==
X-Received: by 2002:a05:600c:3512:b0:493:cfe8:5b36 with SMTP id 5b1f17b1804b1-4954a3eec4bmr228858235e9.8.1784661459576;
        Tue, 21 Jul 2026 12:17:39 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-41.alshamil.net.ae. [92.99.174.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f7feea1cdsm9351011f8f.32.2026.07.21.12.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 12:17:39 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 21 Jul 2026 23:17:26 +0400
Subject: [PATCH] clk: rockchip: Fractional PLL coefficient on RK3588/RK3576
 is two's complement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyND3aJsY1MLC920osTkgpwc3TQTY3Pz5BQLA0sLYyWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgCE6LCrcgAAAA==
X-Change-ID: 20260721-rk3588-fracpll-f4377cd80983
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Wyon Bi <bivvy.bi@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5756; i=alchark@flipper.net;
 h=from:subject:message-id; bh=4IQcuuUttHjx+yzAyu5y+EXz1z1kR8v1d4gWKmLHTsI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTFH72wem3K6Tc2PHar3FZM/Blg9foU59ulu4X/Gf56e
 TT/wW1Tro6JLAxiXAyWYoosc78tsZ1qxDdrl4fHV5g5rEwgQ6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 z9BIx1jHiIGLUwCmetIaht+sbmaXQ5WWLuXfdnDXaqGQKT2u5/UF+E4Y+pp2HDmpyPCUkeGe6Jv
 PoT5V8RHvnsQp1YUUrIlu5ZqzY1lKYr64k4pQNjcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_121741_749024_AC4BEAB5 
X-CRM114-Status: GOOD (  21.21  )
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

When the PLL rates table was first committed for RK3588 (and later reused
for RK3576), the fractional PLL coefficient was defined as an unsigned
value, while the TRM clearly states that it is a two's complement 16-bit
value.

Rockchip's downstream kernel later revised the fractional PLL code [1] to
account for the two's complement nature of the coefficient, but that
change wasn't upstreamed.

Change the PLL table definition to use two's complement for the
fractional coefficient and update its users accordingly.

Note that a negative fractional coefficient is meant to be subtracted from
the next larger integer multiplier, so the _m values in the table are
also adjusted accordingly for the two negative-k entries.

While at it, fix the denominator of the fractional PLL calculation to use
65536 instead of 65535, as per the TRM (RK3576 TRM Part 1 V1.2, Section
2.13.1.4 Setting Guide on P, M, S, and K):

Fout = ((m + k/65536) * Fin) / (p * 2^s)

Link: https://github.com/flipperdevices/rockchip-linux/commit/7a72bc05dcc3a51e85ae531749e6270bf9b9212d [1]
Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3588")
Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3576")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Not adding Cc stable, because while this fixes a real bug it's not a
regression, as the issue was introduced in the same commit that added the
RK3576/RK3588 support.

Note that there is a separate unrelated issue with the rate table, namely
the 2256000000 Hz entry currently leads to a VCO frequency of 4512 MHz,
which is just above the TRM-stated maximum of 4500 MHz. Also multiple
entries in the table end up with Fvco < 3 GHz, which according to the
TRM leads to a PLL period jitter of +-2% vs. the +-1% for Fvco > 3 GHz.
To be revisited separately.
---
 drivers/clk/rockchip/clk-pll.c    | 8 ++++----
 drivers/clk/rockchip/clk-rk3576.c | 4 ++--
 drivers/clk/rockchip/clk-rk3588.c | 4 ++--
 drivers/clk/rockchip/clk.h        | 8 ++++----
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 6b853800cb6b..f445b01aabd0 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/clk-provider.h>
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 #include <linux/regmap.h>
 #include <linux/clk.h>
 #include "clk.h"
@@ -913,11 +914,10 @@ static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned
 
 	if (cur.k) {
 		/* fractional mode */
-		u64 frac_rate64 = prate * cur.k;
+		s64 frac_rate64 = (s64)prate * cur.k;
 
-		postdiv = cur.p * 65535;
-		do_div(frac_rate64, postdiv);
-		rate64 += frac_rate64;
+		postdiv = cur.p * 65536;
+		rate64 += div_s64(frac_rate64, postdiv);
 	}
 	rate64 = rate64 >> cur.s;
 
diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 2557358e0b9d..63f229e73a45 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -79,13 +79,13 @@ static struct rockchip_pll_rate_table rk3576_pll_rates[] = {
 	RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
 	RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
 	RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
-	RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
+	RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
 	RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
 	RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
 	RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
 	RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
 	RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
-	RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
+	RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
 	RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
 	RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
 	RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 75d42fea2a11..24baa0ef9bf3 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -79,14 +79,14 @@ static struct rockchip_pll_rate_table rk3588_pll_rates[] = {
 	RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
 	RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
 	RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
-	RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
+	RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
 	RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
 	RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
 	RK3588_PLL_RATE(850000000, 3, 425, 2, 0),
 	RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
 	RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
 	RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
-	RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
+	RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
 	RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
 	RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
 	RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 9e3503e2ffc2..72b36bba3152 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -635,10 +635,10 @@ struct rockchip_pll_rate_table {
 		};
 		struct {
 			/* for RK3588 */
-			unsigned int m;
-			unsigned int p;
-			unsigned int s;
-			unsigned int k;
+			unsigned int m;	/* main divider, 10 bit unsigned */
+			unsigned int p;	/* pre-divider, 6 bit unsigned */
+			unsigned int s;	/* scaler, 3 bit unsigned */
+			s16 k;		/* fractional part, 16 bit two's complement */
 		};
 	};
 };

---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260721-rk3588-fracpll-f4377cd80983

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


