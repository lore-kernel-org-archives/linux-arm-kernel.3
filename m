Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F61F436B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c0h/bSzKrRDyDdmyG30auftZMv/S6b+0T+VipJS3jxA=; b=uAVFdrlsBIFfV3P3Bw9XqLyo2y
	F3dygqWMWoVpaWxqPlGeKb8yMh+2przOnevxLQWkjNfyz/LMqfi3BajRI/E8n1nxzwNqA+3p96lLy
	W7FYbfTNyVsYlL+Lily2Ii9mgwlUoJYRv6ABJq62g0hvr4Pl3LPvw/6Nzkum3DUeLE0FPs9ab3rPH
	GuBtmIscqg87C94qR2eaoEI6ISIMYKZ457sf/iOMA4TWsRwW+WyubPUI8ao2tVy0VgXsU1rVmypTR
	J447iIh5s7JzgZmRzmfHB4vGpcPpg3He5huy9RS+87T3czF7w2wlJ2BHdEAVqEryjaKtLv+I4AlAc
	QfGGZ4SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkrX-00000004Bht-27S3;
	Fri, 17 Apr 2026 15:12:07 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkrU-00000004BfM-3qMN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:12:06 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so531651f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 08:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1776438723; x=1777043523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0h/bSzKrRDyDdmyG30auftZMv/S6b+0T+VipJS3jxA=;
        b=nrAM5JHg8gxjJhUtBs6pXjAMlIjnkw5oodZHLNlOqScUmGKrGa9PBTe9HXff3KoqHd
         vQ3yUwiwBFWnjQlZkSOqMpX/WDJp/x5z4tkWybZMGclgC5jSWsylroTaQlkO2DukwB1Q
         jq/ECyjwMaj9l5ZMasTHHuBBecoXF+G54xG5D1CuSA2Ly1mVPqLIIND3XihRL+igZQUj
         2NX23UKtAZEPbzAZjR5YANJkxAeTuHntYgAEkLdkLlOUVHBzCcZ0lYQ7H81fWOfoYpVA
         oRCX8Uw1ZeDEF3ehE+4g+7UgxkC0IrMeBXtf9lqveeryHLo8xPPYAjL6p3J0zxsL2wGs
         lYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438723; x=1777043523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c0h/bSzKrRDyDdmyG30auftZMv/S6b+0T+VipJS3jxA=;
        b=p4P+K1VT7hWDm5Yvyi6dyYZHPiSmN9YSSKoXG0bHIHKBcZ2N2/bjLD2DUdAGIdTRUD
         kgg81dWHiEm1m5Y8OZCGUTvFV+8NYBuI1DP9EiSOgBRulU47UtyrFgf8W5rzZ2qm/Msa
         5GyZd+YapJfMbSgSI6xGi2Ix41tlhhosSyKPctEdLrktf6Yw5Ys/guEnHV+o7NivClVP
         rjCOxxW8R5UY8couU87AT7F0LsEl2y2dsGcIw3lZl4zpdebbH0PO3qW4CmuaJAoTtlkt
         UQiiPCeRVZPenfjVty8lpGK5mMLsaZ+sdj2+WDd2FyCLM49CX+t1wLpZimBhqIuSsF7W
         YQzA==
X-Forwarded-Encrypted: i=1; AFNElJ+MnmZtuPJG76ucHa9KtUz7p9c6v2PBjvKDAziUHbIjt2kTqxBDPU1CHVXiUcAZZon2kHrKqhfBxscnFoWtnhMT@lists.infradead.org
X-Gm-Message-State: AOJu0YyB9qJXkAHzMrxJ6QcYbA/yw+/XL0T7+jg8QlcNIby+L/oHhjPa
	nXR3nZkULnu/AtpGMsuK10akqSG+LaD9MIAKz/f18dnC5gtAX7AnoqXUwcghuAcg9B8=
X-Gm-Gg: AeBDies4k34y9AGGUATfRVDYT+Cl7wJQA31XtjsJ2MrfZM6MlINjgh9LpmWZwfGeAfQ
	v/xkp9kPZXQPUDYESzQM0q7jWticYWUeFUcWpnKu8q215fP8rgYVbbFfdOMftuwr9HXVnlZGecy
	KTiH5HcbX/QNP1QDdmPXCwwgCt8WL0pZS6ktMYgkrjmQB4lfQ43gWevQoVc/ywFI6MsZ8IaPrwp
	dAllk2UJT3Ba+Q6agaRqNQ9akSWbJhLrat5TdqvDThaeNhsiBMDdOmSqbPMoAX5L+/dQd8+WZz7
	XM2Zv4em5qZ+98te4INed9ojk8uRLqVEY1/rVK3RxnoCm4odrj3tK2rMfUcp+8/AKJ6XpLNPjQT
	Xki1p8wwt7yoZUc9YlAkVSwQXPJsoz9HXJA4VA7PKKAedKYzf3rJHU/mojPH5h1mgDcJvkT1Od9
	uer4W2u7Se8essnxPMoPPc/wLZqpNrn15q/lLX9nSgTxiQRkzZaWqhmr3Y97chQXeD6s8Z5f1ln
	hWVYryHyxUht0Is
X-Received: by 2002:a05:6000:18a6:b0:43d:70de:1c68 with SMTP id ffacd0b85a97d-43fe3e08c35mr4827304f8f.30.1776438722860;
        Fri, 17 Apr 2026 08:12:02 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm7376426f8f.36.2026.04.17.08.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:12:02 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 17 Apr 2026 19:11:45 +0400
Subject: [PATCH RFC 2/4] clk: rockchip: pll: use round-nearest in
 determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260417-rk3576-dclk-v1-2-26a9d0dcb2de@flipper.net>
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
In-Reply-To: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Pavel Zhovner <pavel@flipper.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1952; i=alchark@flipper.net;
 h=from:subject:message-id; bh=NvfvyU1IImSrCF3iQB5Qso5w+H1TNTTu2n7InPVjkh4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQ+8t0mFK38Z9ft90/KpYsSdv70XXD10YenzgXaixSqJ
 vwM+vdKo2MiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICpzipnZPiXM6nmzcpO/RZJe/8Jl6LLDT4zicyQ35vOmzlnyhXFdRGMDNM+vyo
 6x3zN912Ur3S2wqWjEzvDkpb/1XCwURZbUfi+iREA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_081204_985880_A72BFF78 
X-CRM114-Status: GOOD (  14.53  )
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

rockchip_pll_determine_rate() walks the rate table in descending order
and picks the first entry <= the requested rate. This floor-rounding
interacts poorly with consumers that use CLK_SET_RATE_PARENT: a divider
iterating candidates asks the PLL for rate*div, and a tiny undershoot
causes the PLL to snap to a much lower entry.

For example, requesting 1991.04 MHz (248.88 MHz * 8) causes the PLL to
return 1968 MHz instead of 1992 MHz — a 24 MHz table gap that produces
a 1.2% pixel clock error when divided back down.

Change to round-to-nearest: for each table entry compute the absolute
distance from the request, and pick the entry with the smallest delta.
The CCF's divider and composite logic handle over/undershoot preferences
via their own ROUND_CLOSEST flags.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/clk/rockchip/clk-pll.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 6b853800cb6b..c142f2c4fd99 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -66,19 +66,19 @@ static int rockchip_pll_determine_rate(struct clk_hw *hw,
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
 	const struct rockchip_pll_rate_table *rate_table = pll->rate_table;
+	unsigned long best = 0;
 	int i;
 
-	/* Assuming rate_table is in descending order */
 	for (i = 0; i < pll->rate_count; i++) {
-		if (req->rate >= rate_table[i].rate) {
-			req->rate = rate_table[i].rate;
-
-			return 0;
-		}
+		if (abs((long)req->rate - (long)rate_table[i].rate) <
+		    abs((long)req->rate - (long)best))
+			best = rate_table[i].rate;
 	}
 
-	/* return minimum supported value */
-	req->rate = rate_table[i - 1].rate;
+	if (best)
+		req->rate = best;
+	else
+		req->rate = rate_table[pll->rate_count - 1].rate;
 
 	return 0;
 }

-- 
2.52.0


