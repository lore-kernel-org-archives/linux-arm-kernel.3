Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C52EC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1j1BA+HGOgIyo6xuYGOrJ+5+PYPIB/d2Yf/ee1CtZE=; b=KQju7PTZZJSwgRRPyuus+b67aN
	a5CnKi2YggP7eVu8InnBcR5OMn+lm/NtxHD9h8PDYYy3l1Hjo114T8sdFJ/Zd7NyGJRKKxFgFfRjp
	/822reuO3lSg9VIpuurGWTDst6Zp0DGHQyq9Jct/0KPqEB0RrP0AowbpS7Op68wiriGoY5xXSWsnR
	Jn3kXjTXkTIa5EBZas8U+fy/yqihEQAKdqtTNBXb9PbVr3N9adua3j3UWg5dFZgjGr5AOa9CQ44Ay
	AisiOXE7fvByGhC0NvJlHAAYdkba8/LFbS6HbKH2pcFF2gK4uGSs/VkBJcI0dyRbYqWoCIfAZIu19
	F3zFAOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSFc-00000008mRo-3UPu;
	Wed, 26 Mar 2025 15:01:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRvO-00000008iVc-2arK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:40:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so49034615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000009; x=1743604809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1j1BA+HGOgIyo6xuYGOrJ+5+PYPIB/d2Yf/ee1CtZE=;
        b=SiEoKuvtaWx5uQtBUQLPrlGI56l1ZwJh1PM6V6zA4zMt74UvxLbYRc9BnHbqrUhL9q
         qlLT1Hqo3gnZmcS6UqWt9oxUw6UL0VAIsSyg2f14KEpTCyAIYJcniV4wvB7hKFOZw8WE
         wFDVUZKH0Gg73YdswZ6nW5C+SmgvparJ9u2SzljYgoX9ZWpsvbqpk2pclgQHmpkThR7S
         yMILuds6wikh/ZsV3y6+jr2XUiDpHikUhoT9oqX07JLfbk7m3Or0aQN0TXd6fElhSFr5
         AElMKKwd02XpGFa8zJaGvyOHY8eL9b0aK1tnX97Ds+eBP+Ks16HYtVqQsm7Ye75bbe5s
         F9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000009; x=1743604809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1j1BA+HGOgIyo6xuYGOrJ+5+PYPIB/d2Yf/ee1CtZE=;
        b=uP/dIq9m8ud0XxWx7EVXnI/6y8rArgsMzeZKnJP79MOhKir9LmtISb5kOBcyFmYTmK
         bpLyv9mzs05IrRR7sthxdeUC+9D9zmpmvh5gZbwObB3AUQpL5DeI5ymWXJbERHEQgSBT
         fXbEEzOh+8e8cS+T0mGlH6SxmtydA9AOGOuTeC1ViOmU05TyY2iJsVz5BqAZ10PUcbkT
         fRwYhktXrMxulXusWhgrm9guKTVbAD1iPhujulP7RfSehT7lJ+mot7qYSKshQtCqZFgZ
         yur5VYG0UiwvcFPAv0/142H0ap3lVpUvJi1JbdnndSSMSa2tWca7xlfeIkZqZsTm8HJC
         0okA==
X-Forwarded-Encrypted: i=1; AJvYcCVQGbuf70LA4laMwfCd/dQC0o43BOChvgmvlM2LTmUYeDZiCH8gUXl+14POHPBgM3FtyphmqVUQuyvQGDo7I6uz@lists.infradead.org
X-Gm-Message-State: AOJu0YzDNEcMHz1O0s/zNIIfsYBao6MZ8DgFoYo1pB9wHciYEDXg4cEk
	6QireB8qV1bViQbtJG7c5p9/qggXU2f4G8fbK7n3LbqMhqHmKzpk
X-Gm-Gg: ASbGnctg5HRkNZoZfEnSBC5/LJtbVF3wO9VKl9RNAFhYYLJy7M4+4P7E7hgXAMiwCBU
	8qa1ecTmyW8r4HGu6qAC0ckboTr1t5v0YwxluvPy+hgwk+B3UpG0A69UGCnTYVz9aXq7tGKHBmw
	N6bHEpYlvOkqpBxakpkH+l90yyQCnEvVDbccCLxAKiTRyJX767ijlEDUDUyOErnjWtBp4IyBMXo
	UMQirb1homLJoLNksh6Iz1OV+v6LYcmIhQDd3Xw+hn/O4zYLGkFbqIvxZwwS35X3AGnD/hyZ8hv
	/7Jt3uN6evGfcjhaO4Mx0QqDuFARxjSrpBLUKCugbkrza9d4Dc+3LqJ9rxDnq0h5Fm6y1ixP5as
	WbXc=
X-Google-Smtp-Source: AGHT+IEKbkR38dvRhy1sUXeJxZCnKrWnPS2l5frO3p+7xh9t3NKy5sNOQr2iTx/hFYOhXUCLD0Hysw==
X-Received: by 2002:a05:600c:4747:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-43d509e43e3mr201240375e9.3.1743000008858;
        Wed, 26 Mar 2025 07:40:08 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 09/15] clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part number
Date: Wed, 26 Mar 2025 14:39:39 +0000
Message-ID: <20250326143945.82142-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074010_661044_02A34E40 
X-CRM114-Status: GOOD (  13.85  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reorder the compatible entries in `rzv2h_cpg_match[]` to follow a
numerical sequence based on the SoC part numbers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 4c0247de6cb0..88ab26a077ae 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1367,17 +1367,17 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzv2h_cpg_match[] = {
-#ifdef CONFIG_CLK_R9A09G057
-	{
-		.compatible = "renesas,r9a09g057-cpg",
-		.data = &r9a09g057_cpg_info,
-	},
-#endif
 #ifdef CONFIG_CLK_R9A09G047
 	{
 		.compatible = "renesas,r9a09g047-cpg",
 		.data = &r9a09g047_cpg_info,
 	},
+#endif
+#ifdef CONFIG_CLK_R9A09G057
+	{
+		.compatible = "renesas,r9a09g057-cpg",
+		.data = &r9a09g057_cpg_info,
+	},
 #endif
 	{ /* sentinel */ }
 };
-- 
2.49.0


