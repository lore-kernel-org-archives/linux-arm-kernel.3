Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4AAD79762
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 08:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E79QyFHl6v9hrcpW7a0gJg/ST+Ia1jTsFgjOY9hJneE=; b=ijWRtnxcY4qP0S4gGC8uqV2hM8
	fHbd30FBiI0NnQ8VyIs7aEC+DfHkrnKF4cdqdPTEeDRsTh43172vCOyv9LQTOgN/cT5FL9xZ2MFmZ
	P6idEq2B5cFEQ1OYbIU4y6e2J+4Y6/MDceh+Y9o84GphZxcqDHO3TzElk45oBTDKIa3WTshd4pVrC
	YOUu1sGbWLwF8F0Feuz/TGpD6mYxaV9P9GvZI7Guhx0aW3L1DtFxMKqUVZ8Hp8tYxDX84CkRqSUed
	jas9298HETF0/5/nye1XllyW1sxGJ4dYuHL7Xhk4Qyut9CEUqen89PS019jzMoYpUMj9BNIN/BJNu
	DSrZx4xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm658-00000002PFU-2Q5t;
	Sat, 31 Jan 2026 08:11:50 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm654-00000002PEX-41YD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 08:11:48 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2a09757004cso23094615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 00:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769847106; x=1770451906; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E79QyFHl6v9hrcpW7a0gJg/ST+Ia1jTsFgjOY9hJneE=;
        b=CSkpIM5bSOwsGOcX2om6h6Hqt7dpyNTabucdP1OzlL4/FJSVv3rV6kCh7GxmMiBJQf
         clAmIAmjyrqsGy3HD53j0IqtDw9U3vugXmY8J21FhUmW1FtL2kUdTR1jeFc/F0fv1FIs
         F6twvFMwJ0XEwcEjqGgdrQgEP77FjmNFuk0ex6ngzkxRTbSZlD8lAZPEQrzR4UEoUT/P
         ehtTtNQ2IUCJCHCaZkOBtFwq4h5bdzY3J19iBnKTn5GeOKyadvejQ5iXYko4BM4AE45t
         Fn+gqgdzJzAL5AqisAIddjF4rwHSqOIgftlsNZYOKBzbKP2EEPNxL15BqQWg872bKNWZ
         HBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847106; x=1770451906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E79QyFHl6v9hrcpW7a0gJg/ST+Ia1jTsFgjOY9hJneE=;
        b=Th6pKU/EVnJYKVO6o7dIIadjiSS6iGYTjVSPFZzSZ9ZFb0Hg6wtvKT68VXxlI6scHJ
         d9bOH4zEbjpHWsfRrnM1gbQcQ2+r/ipQ1dBquMJzgvXi+njeXnafkFVl2NxZMQnvKvvV
         nAxFSu8Dd0ZQeYsPNay6NwY0OoemT/eIWc9Od87wSfHA52ntQ+7x0ITtlNArqIxrQt1C
         Ug/VKw9sSw8GJg9a5oXZubAdSOj/nFwz7fE27OdV7bU1EWp2sbEx30DBv2hbe8nQ9Nrh
         lpfBbhed+JSdZA/Tb9abOWR7DL4jRzdyMNr05ENzEWQF3ggFW17KjixjYnv/mYCz9yY1
         RhHA==
X-Forwarded-Encrypted: i=1; AJvYcCX6LcLCPcrmuB4PdcA5CasMckYaZWMsDu/BTXIVXZALO8yWGx36Hx7abI/4fS/gpH2/tT5ajNlv/NSBof0OwYj0@lists.infradead.org
X-Gm-Message-State: AOJu0YzKjezFWZytDHXDZ9tRuf3dGBYO+w8mYtsxaILb9G+CSrRhbI4N
	MzWiA1y3yt9mUVWb3zeMiiDTMcg2gmKh/yCDyzpvobGFH8rMN5m6LoGT
X-Gm-Gg: AZuq6aJ0on7feUvF8A73Fx7VKmqnK5VifNalHmuqmxFWwTQXjZfpeuSdilhQW540UGH
	n/poONHa4XXPVOH1vcpun51fHDVoCZvPaZUbTH4xT5NwrJ3JKtr/7cFz6gZESj5e/5yXWneoGgD
	LBusBxtB1eSmQ5pd9jOaH1Ps5vjBWGvpXRVdsX30XAxS9/48jEbk+tSws65xyaX4SwZsmJh7+GI
	Scp/XziMmNfk+d7hXhIb0KGk48attEgoElsu74PTage/Y4H/3RbfCamqlxNt1QKbfnKFviqqQMz
	4sNWni+OxuWtL9EE83xo/KnpFndC8nFnfisGxQDEFkm/NgaljRxDrBCkfGFWVJK4w+VQMIMHmd3
	pz2jyxTPF7XQAbHFH+Ux194i2e+3xCUlaUcyOiSz8gf0S3KErBC68uR0c12NoLynS3M6sEwt5XL
	hOChNDp7I=
X-Received: by 2002:a17:902:8218:b0:2a7:7c72:42b6 with SMTP id d9443c01a7336-2a8d96a221fmr44250135ad.18.1769847105996;
        Sat, 31 Jan 2026 00:11:45 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52::3a87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm92115125ad.69.2026.01.31.00.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:11:45 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 31 Jan 2026 16:11:34 +0800
Subject: [PATCH v2 1/2] clk: imx: imx6q: Fix device node reference leak in
 pll6_bypassed()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-clk-imx6q-v2-1-70471ddc99e0@gmail.com>
References: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
In-Reply-To: <20260131-clk-imx6q-v2-0-70471ddc99e0@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769847097; l=1258;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=9OAQjhZI4G9NDVTt9f0prwiTo7Qoj04+zj9JpK/zoHA=;
 b=Amf+HD1p3lcCeTT2eWu8v7JUo6k/cHzSXe1AmMAfSN8hyokQgHe/dh6dj/P7sHbmDWKqueAlg
 HSqNr6tFh10C/GLl9mZ/HUETAF9ASs8izJZ1BX+ZQlQJkLbXzj1mf8y
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_001147_019716_408F5389 
X-CRM114-Status: GOOD (  11.22  )
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
 

-- 
2.43.0


