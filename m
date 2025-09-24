Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69779CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 05:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=noPe/4MDejwWFkb+dMNCtABCZ3x4I7fo5qxXPAOehWI=; b=cTqVRrmgGJSZ/is/XND2rXfx7K
	eR2LczPBruEuU19VfXXG2YjWEipvLvhP1jC4e9OGKY87ZMkrnz5p5a6eCeybwA1hBbNtbNjRMPH/3
	fF+dGyVtYAGGIbUKUNwx1p8aqONASnLGQqUt901S/VbhyY35AwqdDA03cWiUhCy8KYafEcLCZIBK/
	RBwZbAIxur4202krRQsJqSud+DLr2/CAIWwKneMYbf6ERLr3dADxFsJic/HC9avwqT5KAMZ0UqLT7
	YSM85a2LsRYk2mCdiioFjIlgUpHa/Rd+h+5uzr58kWRPxqk6UsvmTGLhKLKdO4pT647lXD+Ali/01
	rcja7T5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1HzF-0000000FZ0b-1AHC;
	Wed, 24 Sep 2025 05:24:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1HzD-0000000FZ0G-0mjX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 05:24:16 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-32b8919e7c7so7242708a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 22:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758691454; x=1759296254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=noPe/4MDejwWFkb+dMNCtABCZ3x4I7fo5qxXPAOehWI=;
        b=I+FRmo7TdGtIReq+uZuX2/91ZAvJMUupsKbpXEWcCN9tZEbvh8x1Y1zgzWNTG4FUyP
         bHCr5NScU2suAgyLfxdF5W74pEkDGzo96qLJHlKGR8HGb3hiE5t5svWpEMDChpcIndNE
         35vQ4KiUi5/2BAyILwSFcsfZXx3M7GTWMpX1VVReMjH90B30IHPwPW/8aKtoLd1CfDGb
         ewu2+tNTFO6Xos9eigXHSZS+M+PQwvBh94iU0W0vST8KngpgqnNw5eczAM6wF3fWf5Ns
         jxDXKo0vb+KUOi4x1lNxrjSo2G6pi2VfhRqKO1wJvHEXFwFKQK9YUYfPkc2eorikKtoE
         qoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758691454; x=1759296254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=noPe/4MDejwWFkb+dMNCtABCZ3x4I7fo5qxXPAOehWI=;
        b=Kt6cMLyIRrLYl5LE5CmaL0Yt+tyn/fX3h04R2EZnq3nmCvjzIJZf0X6yKzpTq3I+oW
         JWpSPe83yamTkygeuajRq8VJPbLtx7Ypzz5gffNrq+xUnjswwxxs37RDE7IKhi+gnsEJ
         wxfrgE5Y0uzFNkSNlsjmPeOeBkLS0l2vuUZuw7zTZX6BKfygPwWcIX3tQ5RCkJjFCFPJ
         DWV3rTRhA7QkLDX2/NCJ7RbHORfkCncB6wEldwqmX/NJPorGqoiWAJHv55FMemLG4Ak7
         g+kPJdkHLEkwLcI2bRkb9J6stcgXpL6HHcfz8NDPfKDAY5445LC4brbnF0ALnrHvRMJC
         hqoA==
X-Forwarded-Encrypted: i=1; AJvYcCWfiMNiQ+YKLWLZi5V196jxA+FDWOhsyqIP+auqBvNYBsty7x9K/cL8lfnTu/+wqCUUURLdz1SlgDJs+9RlDYek@lists.infradead.org
X-Gm-Message-State: AOJu0YxB7zfX/wrO7s6OyEWYKQyjQkYFWIWiX8abcUooxZpvLRVd0Gj4
	klWcie9v4/c6iY7hv6x16fpM4O9Jkl01DxIGpgP5xpzfbaPAq0ziCWHS
X-Gm-Gg: ASbGnctsAAR401KKJ79AIbXIwH6unBa/nvWz9jxnHq+nkhXLOSPYoOMnuzAFazo8afA
	4ZGwNllvFkhPSlq9jItISsiO5x8rRegzQRKCQ427AcPQ8S17xBxGeyVcjuKWGygJ76nZGJnjhyn
	eKtjwaBSDFlJpap2XIPsc5ojVNis/dz4VbXK9A+fVX45lHvUt1jXUXE5Avy7V2FKUFRsXfXsIGJ
	F99YtWf99xxsCGxG23713Tt+QG0EH+Ntxqd3LjKcHBxy1ylfI+Xkh26pgbOH0EfZVcAX8D+PxKI
	JdT96KQB7GDKkNmFC2UxNLSYK1VR7uBRy5r7niIPxqC9AgXJJx1nw9iKgWKoN08jLNztNA+Bsaa
	Us7gaP+tabsr15mOHy6QK28vp/LV8UdyQMxmi/T+zdAuT1/7VzUx+LipriWg=
X-Google-Smtp-Source: AGHT+IFuJnZuEPigtlGsjCIYOwzcQzc+p8P/uIuUcX/dg/D4VjWbr0fvJSSNVvasfrPNhXbRbP7wwQ==
X-Received: by 2002:a17:90b:3d09:b0:32e:753d:76da with SMTP id 98e67ed59e1d1-332a95e9263mr6275593a91.20.1758691453823;
        Tue, 23 Sep 2025 22:24:13 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f31:8167:35e6:be:ecb1:9216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f3a9f6e88sm7631798b3a.10.2025.09.23.22.24.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Sep 2025 22:24:13 -0700 (PDT)
From: Sidharth Seela <sidharthseela@gmail.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sidharth Seela <sidharthseela@gmail.com>
Subject: [PATCH] clk: at91: sam9x7: Use kmalloc_array() instead of kmalloc()
Date: Wed, 24 Sep 2025 10:53:26 +0530
Message-Id: <20250924052325.48984-1-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_222415_231112_00DDC8AF 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

Replace kmalloc with kmalloc array in clk/at91/sam9x7.c. Refactor to new
API, for cases with dynamic size calculations inside kmalloc().

Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
--

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index ffab32b047a0..0c0a746a183d 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -748,9 +748,9 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (!sam9x7_pmc)
 		return;
 
-	clk_mux_buffer = kmalloc(sizeof(void *) *
-				 (ARRAY_SIZE(sam9x7_gck)),
-				 GFP_KERNEL);
+	clk_mux_buffer = kmalloc_array(ARRAY_SIZE(sam9x7_gck),
+					sizeof(void *),
+					GFP_KERNEL);
 	if (!clk_mux_buffer)
 		goto err_free;
 
-- 
2.39.5 (Apple Git-154)


