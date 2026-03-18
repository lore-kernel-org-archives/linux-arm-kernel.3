Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB83103E160
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3bIIa3h2z/cZqqIYFuGVpDrxnGGpkmrifYRg8XYq0Sw=; b=QWrWGpsq0mKUyh/DBibuBIOzJy
	nv9WpfVU2Llo1krHQl7d2/1yargLc9U844pLH2AibvLc5EWmUjpH3P4XyxhT8RLGGeyOV8vNE4PS/
	7pJLMefNxFbuTl57mCnTJyxgWpz4zWdeG3t78nuFkH3ZbH9TUbzDVHiKYIPRnEcA7zktvlRRTH2gJ
	ZFXd4euPF+xe41LYu31vE3QZEdIYE6KZtbapqTEKcN0tVh0ZVE8Ps4yni+DkYfY4Fmtt8GnNCqJvo
	bnTNrBqcyI9UPhgUe1PE0fJdtyL1iCg2+tY3T03W2OwoYOGj+KCOXdMv8mdy6Evyeso6Yd+a9npsM
	1YJ2CW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2okU-00000008HG8-1J1q;
	Wed, 18 Mar 2026 11:07:38 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2okR-00000008HFm-3LBe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:07:36 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c741bd1ad11so519390a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773832054; x=1774436854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3bIIa3h2z/cZqqIYFuGVpDrxnGGpkmrifYRg8XYq0Sw=;
        b=I9rWvBsFL4PXMiaB5G0XkpL9oc7ZZPOId49zFwVp+jt/Y4V7OO+xrCpZPIjVAB6fza
         Flr+L4wKQT4bjIgZwqkaZox9k/YFzp0LtD8M+dNbFzZfcA0BWl+9KL3LQ6c6vi+OUfec
         g+Mmu6AZRV7Vz3PUAXmtOf5RP1GEZbgjGxgTqJc0zsfwwaeQLlanbGqki3+gOQ0KFvm7
         M7tYS8rkP3IP7zXXUa9HxRlxVweYn07LhPxmJFXGv+4ieq3UeeKGwPSUGHMFPbYiJdjS
         Ec0tzzJDLvvkL+hTr2Ie52gZu5linm/7kh2WwgiXCPU+2I4jPvrlhcFr96d4kvYAshRR
         qsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832054; x=1774436854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bIIa3h2z/cZqqIYFuGVpDrxnGGpkmrifYRg8XYq0Sw=;
        b=knNTfI9hCm268+xxdh5Z8FGMfLRCbTIsxdBYU5cwHBuZnedDez7DiyOz8HSpEBNOOT
         GeTsKnMuYjanGAaBiAexYZvHVvhU6+POQ4dA2aOSVRwrEhIfuAAP8urcFW+jrt4eYLDT
         1UGTxPh8Y3HGLWZzvI0dXxR94/BNQH5HwT4ALTJRpftnY0wMMuMFL4yMsNRDloy5DY5j
         Pz/BHMcjxd3xpqJWNnU6uhQ+K3yNQfSX2cYsOIX5dzU77kYP3vIJcs79N2VFuk0x5Syj
         gFehHvbQaPljcDALmHR3Zf3VujWtzvthPIFF5xz91haNxoXZNmE5PSRlU5caXFHdBPCA
         eMWw==
X-Forwarded-Encrypted: i=1; AJvYcCUWPV/H/9NQAI1h2UyUViHHGteXeL+C2OXC/IkcC0VCG2lasdiMcW3gejBM4PpoIUmUBHLI6iXagmbMF3s6b/9N@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0ZJ7450hZ9S5zxIR9iXAXP5UYF3zqWmpOsd0Z1rML8mp95hwJ
	BgLvlQtge4kew+72WxLmdC0gLtoyB4oj6EJt5mekhvFi/Cwj8agDQZplTZ1nuDVF
X-Gm-Gg: ATEYQzyrF6cNhLhmacqTPktnUOnYkQ7aMkCqWgtaxlRza7Ak9e9eG+MCNjSucsu71lx
	PO9fbfd4hFzFY+HfEIwZFFJquFEoDAexV65NrzSTxETZb7GK183u24kIXKLzaHq84qujG45mG7b
	4+/3r8CNAMIhWNKWCzGLE7g64/Yq3nMCgatCTptihC8KjUbXDMzTiBFwgZrET7zp//zMouDvUJq
	wWFQ0TplQUtrnENOwiRcZX233hy8xJApY0COmtEVxYYggwGhdyI5/epXw2AjaaB6VPQhWlpWnmB
	tCPOgDsO5pQQyW/Lyql1tTpe7TTyT/y3pnMiqgRv3MwAgseKEBEqYpIZ4hFKC++u4WORQIGpLBr
	Y7SL+lj398HUEJaUCKrZyDnbGcfWYcckxRQFcZym5rq5iMJNYP+AvEYDReoLMo+1EcWw2LtyAsH
	v6PU0OuTzrxXF6TOLwFJDLgJit
X-Received: by 2002:a05:6a21:4603:b0:398:8f2a:5dd4 with SMTP id adf61e73a8af0-39b99d01abemr2840291637.8.1773832054324;
        Wed, 18 Mar 2026 04:07:34 -0700 (PDT)
Received: from ubuntu.. ([152.58.155.3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e0b2015sm2355531a12.6.2026.03.18.04.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:07:33 -0700 (PDT)
From: Anas Iqbal <mohd.abd.6602@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org
Cc: hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	yamada.masahiro@socionext.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anas Iqbal <mohd.abd.6602@gmail.com>
Subject: [PATCH] clk: uniphier: mux: fix signedness bug in get_parent
Date: Wed, 18 Mar 2026 11:02:51 +0000
Message-ID: <20260318110251.2412-1-mohd.abd.6602@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_040735_839167_6D47A8F7 
X-CRM114-Status: GOOD (  14.10  )
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

The uniphier_clk_mux_get_parent() function returns a u8, but
propagates negative error codes such as -EINVAL and regmap_read()
failures. These values are implicitly converted to large unsigned
integers, resulting in invalid parent indices.

The clk_ops.get_parent() callback is expected to return a valid
parent index and does not support error codes. Fix this by returning
0 as a safe fallback in error cases.

Fixes: 734d82f4a678 ("clk: uniphier: add core support code for UniPhier clock driver")
Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
---
 drivers/clk/uniphier/clk-uniphier-mux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/uniphier/clk-uniphier-mux.c b/drivers/clk/uniphier/clk-uniphier-mux.c
index 1998e9d4cfc0..f3b21ea96649 100644
--- a/drivers/clk/uniphier/clk-uniphier-mux.c
+++ b/drivers/clk/uniphier/clk-uniphier-mux.c
@@ -38,13 +38,13 @@ static u8 uniphier_clk_mux_get_parent(struct clk_hw *hw)
 
 	ret = regmap_read(mux->regmap, mux->reg, &val);
 	if (ret)
-		return ret;
+		return 0; /* fallback to parent 0 on error */
 
 	for (i = 0; i < num_parents; i++)
 		if ((mux->masks[i] & val) == mux->vals[i])
 			return i;
 
-	return -EINVAL;
+	return 0; /* default fallback */
 }
 
 static const struct clk_ops uniphier_clk_mux_ops = {
-- 
2.43.0


