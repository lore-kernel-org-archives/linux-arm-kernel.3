Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91437E9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o0bP01qFBrwLQV21WFsuN0zM6OdwGcJ2YrdhXKOaIYw=; b=0tg8R6+RcP/+X7jczzouIU6rGj
	6QqF4NdC9NwBrtGIK3Lt7L+mY5mA9EMSN3pLrCjNhEAEQfjotmXWUzL+3NKlkYmcWnAXIHeEJ3y1n
	Pfq2TVTnFOgC8+CHlml++1iJVe5EO5zRL4ooNYRw+JhaewDUePqLwW9VaiSAiSNiTp8N+rNmce0Z2
	QJ7/TUkmsAEmT3+92Tox3roiM2GGZ6GpFCE/mYP5yFP3/Yx7SUTBJk2dtKJjPvKuzbICsJky/UjIf
	cU6t6nkwjeI3B7EU3sBalF5D5zZXe1PfZXupeUQkMg8DwLMyAvHRWiqBXXU1JwTdIq5EmmKqvedxV
	oIddEVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vscjm-00000009Roh-1n5Y;
	Wed, 18 Feb 2026 08:16:46 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vscjj-00000009RoD-44Eg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 08:16:45 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8249aca0affso2902109b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 00:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771402603; x=1772007403; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0bP01qFBrwLQV21WFsuN0zM6OdwGcJ2YrdhXKOaIYw=;
        b=Hge9TwK+X19dfAzBnf77qOvod1w2DzD7wlWSAhSeZAm2mWkgk2pkiSjxhZQ/Y1QIjv
         3zeAQC9UuLGODvL8OV8GCh2iz84dwwUj1Y6md+KnCURcMGmKxwEXoz+FvM4+FVaja1bn
         cIjzPLGNRqfbLsUtkUn5LD1qwnvUFoMr1byawqfIG0eqRVr75R0hdplLKmE4ibHe40u5
         bxLCThVg31yRBfT3C1Vz1NreSAt1zxwjFGzlfi8099zs51WkY8ivB8HNqo7cYD4ciRWc
         NudcO2ct+/RPja6LhLnsKCwXUeKsD/qPfw6GI0w1pmEamNmubF5MiQEWhfo5y3X0qqVe
         QJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771402603; x=1772007403;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0bP01qFBrwLQV21WFsuN0zM6OdwGcJ2YrdhXKOaIYw=;
        b=hdCXyPDm7x5AbhgZRZn7KMOWCtVpCzkydV7+0UZuZHRMft/llxsdOBNLX4ZaS44RJc
         MgsjAp9vtUF5O+NEkGB5QKB6gEfysxYbtVdotNwBTMTFMYeWQmp7qvCf/+98lzNHXviS
         bCz9dMP5za1074VTmfwUI9M0KkyHDpan/+ecjs4FIfcFSM88T7yk/Dp+VtYJDfDdEuhL
         fiv3XYTLtfjhbismNJ7tZl70yrjca8+nIUauUHDgzQOoZgc3ld/LbXYmLRI0+aRTKBf1
         /wxK4FgMvfpm/9Wo/cItX8P8IRhdkx5xM40rmBcG0D1fRiBDkRAaHmF2ohCkabKCWNTA
         SP6g==
X-Forwarded-Encrypted: i=1; AJvYcCX6+pFP5V4uNhnqKPBMP9WvN76kJZ55idqOQN9JF2j03/MXUImpgdiZ0z3Nfju5n3IqCiVMZ53PF8Z9msg4FDKs@lists.infradead.org
X-Gm-Message-State: AOJu0YwcClLt4dNzkwnznOwcbKTQ8qlgce6gdT5NXFysPh2m98jTUbHY
	nuNdpqfLNEaG15GAugAiVgFa/argkYGmYkK8fUm3KGbyu/kFBmmybd5JU7jAw04h
X-Gm-Gg: AZuq6aJ6nSwPb0FVes5DjJVWmtTJon7KB/RVGiWaVY3KHdnqSmw5CacWFGVvEBKLg5O
	XxBpXFi3cdj/CYVVsPTxWukLB3op6iHX5KHUVlEFV4BY2dkgxWinncvqXezt5PjFtBiBIBxSSaG
	cF2XGq4N8vOdBYfkRqZ1vSXnLRY9yzcKUShrt4av3o2XcKGE6OFWpEpx7r9JLzN7zwbm1OnCn86
	EmoKNKNSxcVBEvNLpYGevo2nBn8SVScaohewc6CTFtK2VrN92gjL7QjLus66K5SUjXzHI4ea8ku
	7wZg8PN1YRgj7dMNWzNMZUmoqkrQI2yVwouTt05f4Seaxg/njeUj+o1xoxV4Cti6JjoI+VraskL
	uKNy8mdvywwiWxZ0wLnNWa/w1PU+7TbVUTaZFAn5XEMJRw2AEkJ9K3s60RJqKHZ91MtKkZW/x9v
	2OGjlinGrWYWwCViCcaqAmL9WtVn8CcZwH+nvH
X-Received: by 2002:a05:6a21:748e:b0:38d:f250:7a79 with SMTP id adf61e73a8af0-39483780690mr12105647637.15.1771402602733;
        Wed, 18 Feb 2026 00:16:42 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:403:e988:3f54:236b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e5331ba14sm11966535a12.29.2026.02.18.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:16:42 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 18 Feb 2026 16:16:37 +0800
Subject: [PATCH] clk: aspeed: ast2700: Add missing NULL pointer check for
 devm_kasprintf()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-ast2700-v1-1-2388e0fe3597@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGR1lWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0ML3cTiEiNzAwNds+Q0C/OUJHMjyzQDJaDqgqLUtMwKsEnRsbW1AAt
 +zz5ZAAAA
X-Change-ID: 20260218-ast2700-6cf87db729f0
To: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771402600; l=1056;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=ATLkbn8TN+9WkJGc0zUgyg102ukNwiK3cRL5DAp1VH4=;
 b=mbhAFVh+U+0K5i8+MeMwiZF5g2QdlgYBo36O8enjZLUm7iFq7+Vaki2aS8uPGORp5U/erYDXe
 TirWXZT+NRjA8lBL1zQsJf5Aq5gsMXEhCXt30+bItwC7kLUzMkRglut
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_001644_018024_BBA58917 
X-CRM114-Status: GOOD (  11.12  )
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

devm_kasprintf() can return NULL on memory allocation failure.

Check the return value and return -ENOMEM if allocation fails in
ast2700_soc_clk_probe().

Fixes: fdc1eb624ddc ("clk: aspeed: add AST2700 clock driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/clk/aspeed/clk-ast2700.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/aspeed/clk-ast2700.c b/drivers/clk/aspeed/clk-ast2700.c
index bbb2b571eb72..011f8be03edc 100644
--- a/drivers/clk/aspeed/clk-ast2700.c
+++ b/drivers/clk/aspeed/clk-ast2700.c
@@ -901,6 +901,8 @@ static int ast2700_soc_clk_probe(struct platform_device *pdev)
 
 	clk_ctrl->clk_data = clk_data;
 	reset_name = devm_kasprintf(dev, GFP_KERNEL, "reset%d", clk_data->scu);
+	if (!reset_name)
+		return -ENOMEM;
 
 	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, clk_data->nr_clks),
 				   GFP_KERNEL);

---
base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
change-id: 20260218-ast2700-6cf87db729f0

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


