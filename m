Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E47E6BF1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 15:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zBCSSoRoE8bVuHZUQ0AtCJQPfPq1ZSOXtwQ+4NnM5Ps=; b=uKVBjdsRkfdWrw52Own2OLuX2H
	VTSCLgTeXy6CGpxysq2h36UdNomglzg+m47ZAjKvgih4/sI0+bNFbBnXZsioqeaYEBjxfiNXxn8HQ
	cE6U1orJ4HSOTP6pqJ/s21Mpq0UaG9uAfhgiaaPPqRGEqEDPFvvRyLvP4Iy12cjpaMldPkBGVYQCW
	yMYLKvJ2wicby53TK70mJusRY56/hpftEBexYciHInsulN1xnQEST3GQjyaqkyDlv50GQrC0MIvBQ
	ZsG6dVsbn1uw71NqSmpl2H4gWgQ/6gbY6jQRacWcx7EQx48AI1hI6gJgHbx8Z4en0xhCJ1JEVE3Vk
	JUtQGkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqrN-00000001gh5-2ex2;
	Fri, 30 Jan 2026 15:56:37 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqrL-00000001ggT-263T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 15:56:36 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-823210d1d8eso1231304b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 07:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769788594; x=1770393394; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zBCSSoRoE8bVuHZUQ0AtCJQPfPq1ZSOXtwQ+4NnM5Ps=;
        b=Z8c+saH/koPU0pJjp5jg+iDlaphNzbsa/CuVTLh4rfWwQlc2yW1ufZpX9NwW2O8S3Y
         MsCWZz2xceDkLJf4rUkpx7JdZ2PdJfnv7kNqyAXuw9N4kZ9kZC3QzPUVBe5gC4mVBdG2
         uGRAbliRv3slTgK+pYF3qeHZGB+vHXNqr+CM0ssA1udEfCr4n0+dgFDSfB2UBu4jn+tT
         5tsQBj0cGP6Ndq4CGUuh7mOXDUFVvCSNPF3W3aqVapmC7/pxKTSjveejmLRNYItCwoQ6
         rypekkKQXcscNeBZyxAbUBOmNS5WO6SgK0dfsUh/hmBBOjtfmXRR8QOhcobQ8oXPlS/R
         ZwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769788594; x=1770393394;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBCSSoRoE8bVuHZUQ0AtCJQPfPq1ZSOXtwQ+4NnM5Ps=;
        b=ojKO69vrOVf2AMGjyXBdJfOyKNP3AgoVkg+rluwLcWa4z5NTwbpvz8KlM1Mj7T8DGu
         9Xjni7mbEqXM5Z5XhamwuHWWuhujjagoqmOzhJ5XoQuhAmD2SQb9o0vMlC5CfNGlE4//
         RbBpGITdNPhLfVo8DIR0S9ZP3hwioMizXGGcxFzxuCYLGZAJuBBqejER2ZgrDfnubGFg
         /FgyqhRJ27UdGYyebatsfanL29dr7qrZODz2T/FCTiGkVMWMbFdgAETKO0nWsalfZJO1
         T4055dj3RXQNAt59BELEw2n0NQiwuOlthhue3bs8OoaHpKhGU15Kr+U356bgBzDVmqk3
         SNPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3iX1TcgVG0KZd6V08ziB22qzaNI6r/fSKoVtVr5wjAjC1qudXfePbv2H3K9nTW370ojybp6xT58cwbjdNbUsu@lists.infradead.org
X-Gm-Message-State: AOJu0YyQG/fQajVbuCsdyOrYLTPrRmeedcfaZl6zBt0ipYASL/GUCHKr
	/3RduzBrNd4GFNuZDER/WxptgPWKzrSCvr43twZIbqvjkU6rdnx0v2qk
X-Gm-Gg: AZuq6aL1PPcna0rVFWrCBSs2OFY8jCV4Oghz4Zd+o9Yc+Q82DbT2ugP6jNUO2DPXCa5
	FPjSRBA8V+gekH2KBemRdOrPMalTl1tsqEWyz8UdDICJba8aATKfhOQGFZQ1I6aqmk5uyU+9mpH
	TgRJv2vakaaemlUk1mNopXXUBgc9oJU6+E9lp2CXV7OuTDMHdvop43MA4TUHK3K84yDG8eeVVpl
	CFROjmYgSl2yP4BnELeZHxfnletv7hoao0Ldkc0OqdNDWYoxVIeJBXCd2DqmywtKfKaZuJsG3cO
	fXEYghnqJIOGuQ5yxHiBcu+h6zSW1J46U6bbLwYfsieAr2hOC9DgR5T30rBmLlma18rr/N2AO+I
	idVmdP7NWnD9ep425aO5GKSncRC7B9/TQuBI5XUtvl6LCJlifYN1+aCuVtQTKf8ej3FU3evsXkf
	yDfxYjMtM/K3vHw6187GO7C+pu
X-Received: by 2002:a05:6a21:6490:b0:2dc:40f5:3c6c with SMTP id adf61e73a8af0-392e0145956mr2877751637.54.1769788593981;
        Fri, 30 Jan 2026 07:56:33 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:53f:14bb:e0fe:f839])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d94c5sm80540015ad.71.2026.01.30.07.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:56:33 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 30 Jan 2026 23:56:28 +0800
Subject: [PATCH] clk: imx: imx6q: Fix device node reference leak in
 pll6_bypassed()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-clk-imx6q-v1-1-2fa4da5dab85@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKvUfGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ2MD3eScbN3M3AqzQl3LZJMkCwtj07RkIzMloPqCotS0zAqwWdGxtbU
 ABfTUf1sAAAA=
X-Change-ID: 20260130-clk-imx6q-9c4b8835fc26
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769788589; l=1401;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=SpffUkjliwaKx4GCJ0zzoKE4MJf/13e/7G80/BLtTt8=;
 b=RenJYBVdy/Ov1ruNAsJl/+5Atz9o7oZITqzqfuFckxK2XcbQReo5YwVM9xuKAyR0SSGv96MM3
 NctQ2VuE+pNCrMSbJ7AHd/nF0J8oRW4968bGtYuOEoGHg8D4lH7rp6s
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_075635_549229_C4E0320B 
X-CRM114-Status: GOOD (  10.45  )
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

The function pll6_bypassed() calls of_parse_phandle_with_args()
but never calls of_node_put() to release the reference, causing
a memory leak.

Fix this by adding proper cleanup calls on all exit paths.

Fixes: 3cc48976e9763 ("clk: imx6q: handle ENET PLL bypass")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/clk/imx/clk-imx6q.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index bf4c1d9c9928..1d8e8f0891a3 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -238,8 +238,11 @@ static bool pll6_bypassed(struct device_node *node)
 			return false;
 
 		if (clkspec.np == node &&
-		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS)
+		    clkspec.args[0] == IMX6QDL_PLL6_BYPASS) {
+			of_node_put(clkspec.np);
 			break;
+		}
+		of_node_put(clkspec.np);
 	}
 
 	/* PLL6 bypass is not part of the assigned clock list */
@@ -249,6 +252,7 @@ static bool pll6_bypassed(struct device_node *node)
 	ret = of_parse_phandle_with_args(node, "assigned-clock-parents",
 					 "#clock-cells", index, &clkspec);
 
+	of_node_put(clkspec.np);
 	if (clkspec.args[0] != IMX6QDL_CLK_PLL6)
 		return true;
 

---
base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
change-id: 20260130-clk-imx6q-9c4b8835fc26

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


