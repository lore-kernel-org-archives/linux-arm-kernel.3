Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5644AD79761
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjfAJsvyjCO/vjM7jBeWQxefgcvpbHgFUQ72gcagyLo=; b=jO6RAuNiGTXJ6TDE9UypICxcSd
	mVGob4ZhNbQEPBCGl9NfxkwTkoSXc2oc5icECxd5+NZZZ8C8qD5jruvoaQBu/u6hsJpJqla+wNKEO
	7BkP9M6JSEVi+Ed3LOXfiPzzFhNjucSPxkvD8731R9Nf18OR48cA+58I2yVFQtVdAuKX49ZH22D6W
	yZNu1ld3NOerzfCfySyeXJw1vGg4yX0AzJwjMPn2F78rwgl1rYme7RaTcsosH9NO6AffKzRSNEQAi
	kCXqbsPtIq3zab1XqIQekHnZF4nCiR8Vn9HKjsZ830B8lTkWcXSdjeU0Uba7DFqXfkFwvpm/db4HL
	bJam8JeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm65E-00000002PGv-3gEK;
	Sat, 31 Jan 2026 08:11:56 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm659-00000002PFm-3LPl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 08:11:52 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2a1022dda33so18589455ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 00:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769847111; x=1770451911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjfAJsvyjCO/vjM7jBeWQxefgcvpbHgFUQ72gcagyLo=;
        b=Yob2AaqK9AbC6pT4OI3sZYrM2klZF/rcpR+EK3c22y9SAFGlorTqYLUfmWPYySZ+hW
         Y0qEt2UfAi6CKlatImkA2QQYYhGP1kioqezwtsYmNaroZ+HcxFlI++AINOSz9iblsiXO
         knR31kiNjARwTmW9mARl4CbklSBCZNvC5LvgGCr4APal7Bm3urhFMBEjqGyxqqdthfyK
         NdbcA4P3OshGDSuQdcbClNhzUc8NWCicntKOAmdSDnkk0tWyj8gwkanizmGDJTUTZuQS
         XqeDM47ZKpqFlRgFkSOV+sgxu4SF/AKEc8+BwKsdi9cJs5Hdw6+hcr3bkXSr0rpDpQZF
         M/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769847111; x=1770451911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FjfAJsvyjCO/vjM7jBeWQxefgcvpbHgFUQ72gcagyLo=;
        b=psmaKHaRRkVX525P2QxW6TZfgR6FV6fZJ/TvqWmvKVCPDD+xHHDmqfnztNE+4TKazE
         pWCYqQWy/Yd5uytXtCYasNRSkRreIZXBuxHMdtd5vPiyaaoMbNk7SAM7WwUtnkBNIjxK
         O2bltm9hsIPZxO+N4sQSRH4FyvTK003r8ImF0up84uK5Gyrn7UqqUYhJm8dWD07b61Z6
         JLDoT6er2mOskFbTUkGEvUvyoJGVAadMHsgt1RfKX1NB2VjmDHX9+k58Lfn7DmmlPEPB
         I5HsSP/EC0b/uDpm7RjYWvv9fMeLoeoQRHL93fVAl7qxLSaP//8x92ajduW+qNWkwUbi
         NVEw==
X-Forwarded-Encrypted: i=1; AJvYcCUZrzXqZcQPKb5Jhy2JXol3Zit75x9SYBMKXMxBTSgUot8o3iNk3zXrAxOGwMPWRrV5oF/KUgt0+yezIrfeQqQ4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw29MeLKnNd1pg/qRMFhYF3ok30SNBP/xb2pTLaWE9uj081PK90
	nLx5YMKjm0AewO07owDf+sRBEbcLBKS0zLw5dGSSSQegcdLWCCE9DXwz
X-Gm-Gg: AZuq6aJaG7p4w+e9VgsVwOU+uC0NQDK8dQk/Fe65p8zARWGfLAOqwmqEQ3jX33AcupY
	4ndmmZQNq1EEPEO9tCQ3lydTr3nol7sra3SUBtNAP+E5xvdviy0FF02iFfOz2U8CQPVU3n8E9gE
	lfHiP4q3RFRVvgV1UfjGrRqSk4aTyjHiU1dxkfxaINqvKAeShgEjAU+l3ZH+IWubjU+pMVZqVF7
	+qKvOgBLIscXQof+qOXqSFrZULRA7emOj6k8upeH1wiPI8IeCJ2wvRaXycprF4PNJYa4wjJ3JEK
	qPk6MfWWAxzUmktyJHnWcST9jeun0kLfs4DzeyxWUV/xP5fZ0/072lHJ+n1/aYzS88CkkpvvHMJ
	VCF8rBNwOOkwew4PQZnnI3eqHGxrANbNchr5KP29rATJCFaP2Dlo9lyHrYFzGdtV2efRzAXYtsj
	8DpYT35UU=
X-Received: by 2002:a17:902:f544:b0:2a0:fb1c:143d with SMTP id d9443c01a7336-2a8d9592938mr50396115ad.1.1769847110853;
        Sat, 31 Jan 2026 00:11:50 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52::3a87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm92115125ad.69.2026.01.31.00.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:11:50 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 31 Jan 2026 16:11:35 +0800
Subject: [PATCH v2 2/2] clk: imx: imx6q: Fix device node reference leak in
 of_assigned_ldb_sels()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-clk-imx6q-v2-2-70471ddc99e0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769847097; l=1463;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=8z6Jwe22roU0IcUq5EjPKimwprqUXrkhxOXSXzExrCg=;
 b=oiRk1okIysEjvHlGj/5wAp4PFaBltdhhMRDvFAiXGskFVm57xO67i5mEoNGJaNojLeDz5+wu+
 WdOTQp1dMycC//jtDtoXsQb3Te+V7M8qOzaj4IqkCVqdZ0e5zHzDORo
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_001151_842161_2B4A7CF2 
X-CRM114-Status: GOOD (  10.49  )
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

The function of_assigned_ldb_sels() calls of_parse_phandle_with_args()
but never calls of_node_put() to release the reference, causing a memory
leak.

Fix this by adding proper cleanup calls on all exit paths.

Fixes: 5d283b083800 ("clk: imx6: Fix procedure to switch the parent of LDB_DI_CLK")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/clk/imx/clk-imx6q.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index 1d8e8f0891a3..58882dbc3a11 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -188,9 +188,11 @@ static void of_assigned_ldb_sels(struct device_node *node,
 		}
 		if (clkspec.np != node || clkspec.args[0] >= IMX6QDL_CLK_END) {
 			pr_err("ccm: parent clock %d not in ccm\n", index);
+			of_node_put(clkspec.np);
 			return;
 		}
 		parent = clkspec.args[0];
+		of_node_put(clkspec.np);
 
 		rc = of_parse_phandle_with_args(node, "assigned-clocks",
 				"#clock-cells", index, &clkspec);
@@ -198,9 +200,11 @@ static void of_assigned_ldb_sels(struct device_node *node,
 			return;
 		if (clkspec.np != node || clkspec.args[0] >= IMX6QDL_CLK_END) {
 			pr_err("ccm: child clock %d not in ccm\n", index);
+			of_node_put(clkspec.np);
 			return;
 		}
 		child = clkspec.args[0];
+		of_node_put(clkspec.np);
 
 		if (child != IMX6QDL_CLK_LDB_DI0_SEL &&
 		    child != IMX6QDL_CLK_LDB_DI1_SEL)

-- 
2.43.0


