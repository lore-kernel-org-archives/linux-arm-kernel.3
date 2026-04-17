Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49B8F436B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=az2KIqgV5YqkPRGM1cxImWSRMVebKiNjnNol2i4MAlI=; b=DrN/KyJeWuLvVHzxraKGcvsUTA
	yIw3jsxhO73opYXC3deMhtP+eajGoQGJdArTAIZz+3ShsnFaP1VzIM3YTtaDxCdh8NzxrU6K6foFG
	x2sgShnRqmceDiTrJMDcC+7stZIxRx04s3MWFufukzrVju7clogMXaqISFfJov583zipyjtWV0U7A
	FkZAABXvscfV3LokLaTjWwNwiztmljjbgAtsQC4VUj8L6vfAwM/YJnd4Vu2I+K4kyHLk8p42I59sX
	6q3N7h7kFH7Zgy4uTrMKXB8lSvBLOXtsQpkSXLyUwak7gDPFIDowFUFeeUdQlRiC5ypHMfSzUQUN3
	j6rgWhhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkrg-00000004BqW-1D5e;
	Fri, 17 Apr 2026 15:12:16 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkrc-00000004BlR-3JPG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:12:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so12176755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1776438731; x=1777043531; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=az2KIqgV5YqkPRGM1cxImWSRMVebKiNjnNol2i4MAlI=;
        b=S4Uc65nleSStbw0h9XWeop5/2T8nCmy7LWryCMNHtVm6/Tccybv+c7IKUku+IsiNFv
         9eWBlR3WjBoRq7XOBB2QXtV/T2IBQB7jPwY1hruPTIsoolDN1YozryhHuKPkv0VnQzPJ
         u/+/AXA8BoDLLbKRNAqr+mONm4VeGVnYEIlzOIr1e3G6n4L9XhNUdW1yNyLDTQzk/G8/
         8dT2/wMKEMC0TY3jzNZhvAkm9AyiC4CJXuIT5PZI0cTa5dLg/Kww79AhDmChtqzak2oJ
         L4xEsAMf+uYIrf/9wkZ0UK6bam1o6HUMFTfBDccsXyrijGTJxbhrw2RXdVzqx8ctpESu
         hc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776438731; x=1777043531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=az2KIqgV5YqkPRGM1cxImWSRMVebKiNjnNol2i4MAlI=;
        b=RykYQ7Usy4KvBF0DgMkhQd1GVRWXXklHf/au5dJgYo43ggBRbnAyJSqwKa3fnUWeaG
         9SEBG6nVbWt3BD4f15RA+mSIkqJB3WTcgm3+/YPYuEfz7IB7wUEH5IwagO/fUgwMGeIO
         5ycNQ6kFiJ7wYPY+u6G9XJW4j0cG2hQTPn0rhakW/dbw1/mP7+AZor5rJkdMeO6z7rVy
         hYlJML+p1AhZVn1nzytfslyzN2+DpuolsssUAqJ7lSvCnjFSPjIS5qqqsCUZDvXjgTOT
         qUZujD1XMCicPRWriP3X0Ayz/FufXwU15GN/9vOmzRDH4/mn0FDaYasfGZblaK3z81k8
         JFHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8SQfYxjGM9jL1m8MuznS43UW0XEhxVEsG2o9nqleNHlYfvDHN+9fkIjEItphJHFTG63Hsy+S/mmClJJYe2krQe@lists.infradead.org
X-Gm-Message-State: AOJu0YxZM8WXKddq6VBbBOR/36GaIrrKbgR7twWqQTHrJ4hqkHYT8vXC
	Zdm5JALBqFpN/rFvhq/2oiamjIyZy3JkjyL8B1mLBKbjm1DwQWSnkj8LppHLXUUIHMg=
X-Gm-Gg: AeBDieuc1gLsukRfPR0AOLfu6utv+XuUbyFLvAtLSuMAg/ny+ymHxBHZ70Z/Tq9QZm4
	a+3iHzq2Ot0F3IYWr11gEvr/QyML3SDAXNt9MJxixp3QBxU0CX28XXaaOXuZhNzPPSHz5mitoZB
	QAq+fnJO522K3X61dj5zH23dm146p9aYyG5RcVoyaMKyF3CFOm3o/bsR4bbQ7jxne/bXz66zVOD
	obHXt4Ns6S1AhuTdeCOEldSlEvs0k8UlLb4qpMGnPVXQAFsMTdZWrgBDCHuVNNfDNvYBFHAEGnq
	0H+iBwsE1XulYiu1CDG26zOEnk2nKMiGX+uaaFQqLuVk5Lko8XJjABIFI/l0ryDlLXWgylOa54w
	72bRrfzRSZwJPCrY38AFy0lhGJFZ2DWJfpv0YMefsUAME8+TNfiExIFq2V2xxa/XgcU1N9yEHtf
	ls7GJjEaqqP8IGFEbCOzRDZstJfzr1rI2rYS7XhhqB0XA9ovfjPjeex20VnuN6FBseoF+PS/lMg
	/UTbfor/Q7sCXqj
X-Received: by 2002:a05:600c:3546:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-488fb7880camr48839705e9.23.1776438730645;
        Fri, 17 Apr 2026 08:12:10 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e591cesm7376426f8f.36.2026.04.17.08.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:12:10 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 17 Apr 2026 19:11:47 +0400
Subject: [PATCH RFC 4/4] clk: rockchip: rk3576: add ROUND_CLOSEST to
 dclk_vp1_src divider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-rk3576-dclk-v1-4-26a9d0dcb2de@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924; i=alchark@flipper.net;
 h=from:subject:message-id; bh=MJzTscokaYVjaUenKSLbKoiovLeIQbNEzqwhkopLKGI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQ+8t2+8RTP4gqLYob2DNVSvTrzxQ82/a7SW+3xNOBIi
 PINS76WjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKb67UtGho4P594u/vp4E6vSzw6BvvkfkrjvvHc1nO7fp1LJ5CvF9IPhn8bhnO2
 79F2iasptjeP2Blz4f7J5xZTLyz353lo8+H2fnwsA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_081212_936243_0F36DAC8 
X-CRM114-Status: GOOD (  12.91  )
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

Without CLK_DIVIDER_ROUND_CLOSEST, the divider's _is_best_div() only
considers candidates where now <= target, rejecting any rate above the
target even when it is closer. Combined with the PLL round-nearest fix,
this causes the divider to still pick a suboptimal rate: with PLL
round-nearest alone, div=8 produces 249.0 MHz (0.048% over) but is
rejected because it exceeds the target, and div=3/248.0 MHz wins
(-0.354% error).

Add CLK_DIVIDER_ROUND_CLOSEST to dclk_vp1_src's div_flags so the
divider picks the rate closest to the target regardless of direction.
Together with the PLL round-nearest change, this yields:

  VPLL 1992 MHz / 8 = 249.0 MHz (+0.048% error)

instead of the previous:

  VPLL 1488 MHz / 6 = 248.0 MHz (-0.354% error)

This small difference appears to enable more monitors to lock to the VP1
clock when driving output at 2560x1440@60Hz via DisplayPort.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/clk/rockchip/clk-rk3576.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 28eb5a802e83..9fc3264ef322 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -1106,7 +1106,7 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 			RK3576_CLKSEL_CON(145), 8, 3, MFLAGS, 0, 8, DFLAGS,
 			RK3576_CLKGATE_CON(61), 10, GFLAGS),
 	COMPOSITE(DCLK_VP1_SRC, "dclk_vp1_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
-			RK3576_CLKSEL_CON(146), 8, 3, MFLAGS, 0, 8, DFLAGS,
+			RK3576_CLKSEL_CON(146), 8, 3, MFLAGS, 0, 8, DFLAGS | CLK_DIVIDER_ROUND_CLOSEST,
 			RK3576_CLKGATE_CON(61), 11, GFLAGS),
 	COMPOSITE(DCLK_VP2_SRC, "dclk_vp2_src", gpll_cpll_vpll_bpll_lpll_p, CLK_SET_RATE_NO_REPARENT,
 			RK3576_CLKSEL_CON(147), 8, 3, MFLAGS, 0, 8, DFLAGS,

-- 
2.52.0


