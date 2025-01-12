Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7405DE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkxcGNEB2JVbUM+gOy8SUbx7zqelxFkMblu3o9jMzUg=; b=XEiCvUHi6tHM/QTcls82f3bWtM
	b38koHBsXIC2HXRM8MEpXc6rwTrpdGhFJQ2M6V96SY7ziF2N1ER94bkl3q6dcPqcIWeZeLrp3SATg
	IyibxOQtBmo/6PigRBzTsD3PzGHybRs7DB7u6LpybXHXOMkUUkD1iUNN+fY2h0DTTFVW4wgH/GRB5
	g/u5H0IcgWMNYwcc/L99TlEuR9EYbWsN5T8gzU9b/3gDvPsudGNmHrnvrZkSz6yrVO3uVWZCFpr5M
	gwNbgFcKKxFF8hPqe1FunuIgoR1GhQn0iKMGprKmnzBt6u0nAqVMZWypmkoTDdW4io3nxz4zlRgX5
	ycFr5gxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyBV-00000002mmz-1jCh;
	Sun, 12 Jan 2025 13:39:21 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWy5W-00000002ldm-0yab
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 13:33:11 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d8753e9e1fso631273a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 05:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736688788; x=1737293588; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkxcGNEB2JVbUM+gOy8SUbx7zqelxFkMblu3o9jMzUg=;
        b=H90HAlhEj6VppLipJP0ygRLsen5fdK/wVbvvIjjDH4uzXFgmXwbg2GuVZOqhfU7C2a
         Slziby1YC8mwvc5gu/IrgRhbH17iE/KS8hZiO1z/wc2O1kD17CiLz5brG8OjiBkKH6vo
         L93uOJEeBCNSUD7nVUYtdcdBkXM2poMzzbeFoSxnMgo/Jc+zT/2X8jDZhN5wV0vsodi3
         XEuZqukdxHShTZnVJW5NKLgelKFqI9XZzd/KdZLfQMXJ8Qg/a5ifR5cPh1LiflryN86O
         E0avTCYe8ibN2rsDqUE2EHBC3D6fkOJ6eNn0evRWGnjwvMJHdDqasdoxgF0OEQ0CrXG/
         EtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736688788; x=1737293588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkxcGNEB2JVbUM+gOy8SUbx7zqelxFkMblu3o9jMzUg=;
        b=nvnnej40VjuEcBs/sWMZtXCa60JU7QBjrz6Mwr+3CodxgPiPhjU3pujaxeXFM4Y4Ub
         3wlU+s99RcVj38Qu1YLh7JpkvMq2Lqf/Czuu22oEj5EeuJbqHgVjla6jv1PkyeTXvLcY
         muqQBSTXf7IcRUownJqLOFfPESTVGC85J4ZJ6cioBou9FEld0pI/Gk5ycFxO+OgZkYCk
         RJSZ9h58i2MVNYQrTboHyUdlWMIbPi52V7JFJpbky9rvC441UwrCsgXXL0NB9GVCyIpe
         adxXpyuWh/ovBUkDKr+i7ms1vIX+3/KR8iSt6FHDTOo+Hq8JBGACLTcjezaU2wCD9aIh
         bGIw==
X-Gm-Message-State: AOJu0YzFkGMtnwRdw3CXq6u1M2g7CaVolmJc0ZugPUmqkm2KOboo9R7y
	Q5ZF3tZ8gte1ImJCAjagWu6ex/DnkXa6N3c1fMtaF+w0GTt2HL7ldMLcQ4VOhlE=
X-Gm-Gg: ASbGnctRgFRpvq7sN19T5ogxYStdmFW3k0iNj05cwBS9sqyhPRLbBiQDl7JRXn6+NmT
	h5/viVJ1UwThi6JxN7+0rfsuc77eGc9ptg2rHHAFq+e9y+4sQ9DZ4GZb1eDUzhHRzImw0y8II+D
	P2eQs9J+T2Ov2S2SDEKMbCUvxcvoA6tk87l2dkc9sSnd2vDd9+ErzEDnZNWCIjoyuygL9UpAJTb
	LeUCUjm+AcgkhMkQrXfXyp3ay7D0A4UIK8n4AqIQiStywxm9ZytvyFoGSmGLJqf3y9+CX1L
X-Google-Smtp-Source: AGHT+IGF6bnQlGOOJSwmTTavg2zo5fkx649YuwkX2KVGh7yeql8d0d2LdpF/plNT/VzyYLuHpWJzKA==
X-Received: by 2002:a05:6402:13c8:b0:5d0:bb73:4947 with SMTP id 4fb4d7f45d1cf-5d972d26b14mr6157273a12.0.1736688788499;
        Sun, 12 Jan 2025 05:33:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:33:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:46 +0100
Subject: [PATCH net-next 4/5] net: stmmac: sti: Use
 syscon_regmap_lookup_by_phandle_args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-syscon-phandle-args-net-v1-4-3423889935f7@linaro.org>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NXMkmgaOV2RUkC4HwkfQVhlGXXVP2A5zrSYO2RnmBmE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SEMvfAj1e6BkujbTFZ72MSWMgcm2SMXQBGK
 GiE3r2n/mWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEhAAKCRDBN2bmhouD
 1+CtD/9NYfzUH01iViVY6CFPIesUd//8aqafZv/j9gif1sZe4BnpQWtWRxsUu6VQdMZlDJKE9W2
 glDpCZIW+8lLh+IbsiXM/flGx1S/efHzGzwpjeK7L/+01H4KcEeR/NDg1+8TsGk3d6NX1yF1/js
 HwaSYCG5gF43SPXB2xa/7mE5PMEKpV30x5gImiU69/kQEkU+hG0h7SsxJIgj3xt/HOP5Z2VjmRd
 c4HXi8KAUcvDdEeAC1MKg7tZ39OjLQFztwEufapop5grKUL5tbxEaeZ8o2BlJwG/uCvWOTpXYyE
 XEW+sImdFKOMeKn464A5PXwEu2KkucXyL08nDihzDzhH4RmuG9XNtHs8yCTXvRmIAMtj1eYy2OU
 idW1s7RxvW3VBVusNX1ehUd05WYPYctpK+gqlj4H6DzxGAUuHu7b+vdVjnbFX+XI4UuUpXlkztG
 TkLWHNjvzf6OnOYG86bYh4Dr8IVPiD9ikN4N4rK+xw3ax9d2rsVK1/7ap4qJJt4iRlNaFQa5x89
 prfGPAHxKBpsWwTTUQYDTjGg46zzir0mxKHPl+GxOyLo/9S+3xMdLTt7AAI874KFG7SjGAIgHcr
 JNJ2MvA9XFr3QF2JPTvtkqonyCssxtjXflAge8uhZAveyDIMEC1DiktRW+Y3V0P5Xxfzk03OH8G
 w23Ba9WErAio4Zg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_053310_275438_972B1D02 
X-CRM114-Status: GOOD (  10.47  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index eabc4da9e1a985101643908d2efdb0b4acaa9d60..d30d34fa6ca52e32b10c312c96d462bd6df859d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -199,16 +199,11 @@ static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
 	if (res)
 		dwmac->clk_sel_reg = res->start;
 
-	regmap = syscon_regmap_lookup_by_phandle(np, "st,syscon");
+	regmap = syscon_regmap_lookup_by_phandle_args(np, "st,syscon",
+						      1, &dwmac->ctrl_reg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	err = of_property_read_u32_index(np, "st,syscon", 1, &dwmac->ctrl_reg);
-	if (err) {
-		dev_err(dev, "Can't get sysconfig ctrl offset (%d)\n", err);
-		return err;
-	}
-
 	err = of_get_phy_mode(np, &dwmac->interface);
 	if (err && err != -ENODEV) {
 		dev_err(dev, "Can't get phy-mode\n");

-- 
2.43.0


