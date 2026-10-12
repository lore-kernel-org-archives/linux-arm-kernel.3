Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B80CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKOeMXNG1kfy2/JP3GJLdq+HcYyRr6DhQVK+LeX96yQ=; b=fu2Y/VU5M2DsgiIATdG6gH/FVz
	dWjPDuEuot5Kia4wqnf4y6uKRLYpbba4qr607Pb5V6a0b33xMprpqsyCrCqfRwmsW9nmKZOFG4/Qb
	Jdc1VFXCBhn+lq7jFk0o5h8nppojoYuJQIa20mZ+WVtO7dOwYVJmJ34UaL5w8DnwbhyZa6zzM6WcG
	bgwRQ9Nir9WQf45n5SuUmsgdagFHBY4cOVwcZ2W/lImh2jXo0GHZe5TWG4G3g71UJ3qZlRMn9qWJm
	tr2OyNqNDdkEKK7g2/L6ESrR1IJYTkCDfVqPkPVEQLeejFw6mrGB5jbq2IgtnFIsjxNDuHpo1L6va
	L5121/6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9YU-00000009jWX-2nAs;
	Mon, 12 Oct 2026 06:30:38 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9YQ-00000009jTy-3tJs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:30:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2dd9cbb661bso11341405ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 23:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791786634; x=1792391434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKOeMXNG1kfy2/JP3GJLdq+HcYyRr6DhQVK+LeX96yQ=;
        b=nW0DBTNSeS8kLEkujkYx6RHjyiHoAhemjTW4WOT4uX93Y4Py6EPPez36c9Ataq5kZr
         lX53cAyEUsCeVDV6IAS+eoJyyOhGiG06VWScIszs/PwiKdqsHxiZhvL6CgsfjuVS16oI
         QR8VejMT6IYHrgarL+zIJ5o1CDkdCvFdnHjXF8qd8gdBltPMNLz2ROdq6JZAiqH622hE
         4kj0cungQ8p9GBCY3gnqLs/z8RkpVeuI/QFx8oKdcFabsYVXjqqaDC8nmebJQLg8pmyA
         J5G13kr3M7L9kGY6mjtaIC5Ghd3UaNHP+zPXG3m5+lOlTRe/a+gbDXnx91DalkFVGJsB
         EvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786634; x=1792391434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKOeMXNG1kfy2/JP3GJLdq+HcYyRr6DhQVK+LeX96yQ=;
        b=c1gk1rmGbrZtjcHVruW+KYWPXokLN8G40x0ewkCxTrKdMw5/N5ehGHOmP6jr6HKC8D
         sVDesZyTZhMowtGRv3SEkqMkRsS38FdOvtwFPqzthHeg8O1/bphd136UioVFFkA1eklr
         oghj1ae6LbP8By3x2cY6HM4Kh2STn3Za+98akpoNbGRqFUVKR8aPZ1k4kd60Vxtxchbj
         zyxWfCX6+YUPmeiNn01oWdCmcUp4hDry/YG5lYNGIRo1lKhf5/ow6Nh0UHigz7WsAvJ7
         77TbwZAPkt6wyUqDZVIwiK6LOHjfB5l/jkoBnzdzoPgUf1Mk9CFDwoMn5qcNsKtwli5k
         XG6g==
X-Forwarded-Encrypted: i=1; AKwUvBxySPGekaAq7Z6MXI1DWvQe2SCcNe88rrgiCci/BiV14/xrHxZlkJG2d+pc/GhpzejButFDx6JYvf+tmopwvFbE@lists.infradead.org
X-Gm-Message-State: AFq9FYIRW1IicIDKPGZlY8mv7QLSeDiZCIHHx/enWhLazfXvOHaojXW4
	ipXewaMACHn/ppUDqFDwqyT4FzIF2LmxmPgxKvGmUC/SMgNHJ8S1iNGj
X-Gm-Gg: AYBFou2x2AB88Cm/qZP2pMic7YWO8RSZWOYqnOwL26dQiwvC9fQbqrvPd9YunSAtJqQ
	zaH1EiBBRQ20P1NQp11BKmOzQB7uxj2NC1oBlE+85rLVwGV22f5MVG2vFQFKqgvcsNSaHULN8f3
	ctxw99qiLCRZWb9SqNdOgr64gdcet07lBSiBgTLci+aG+KsQnsZtL/7pn41rXLM0u7aLRBDaMew
	FD1zTQGXUW4bV83wsSJmxdrz4xS6XpW0oZPpQM/5Pit40qc0HQIc4tnOg9Gh1LN58tc+cIQif5D
	cSEkDqQ/CyDzCaepRrEovex/CNwXqRrTZdABO8u03qpLkJqAPD2AyVzcucGBnSe5xyJL6kOC8DZ
	1Te5MfD6Av3MfIv8hnTTrBxeQ7+elqTVY1nw+j0dz6y8W60UPsnj+za2JsQxhvEmiRea7Bz0T9L
	A2suh37AN+SAxJtTZFEE8z1g/xUuF1qywiQzgY8Lfwa3iCblBQe0Hm3kHeNrJj6RCEf76emAQ1P
	b1NpANHAPnWgb027HtTvc3Ec+KEGidGRW/0UxjHbrGFFDuoxgEjkBbMMvkJ1L8=
X-Received: by 2002:a17:902:cccc:b0:2df:7fe1:72b8 with SMTP id d9443c01a7336-2e8429a649bmr73282855ad.16.1791786633938;
        Sun, 11 Oct 2026 23:30:33 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422da9b1sm39071745ad.66.2026.10.11.23.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:30:33 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	arnd@arndb.de,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 2/3] clk: nuvoton: ma35d1: use the generic divider for the ADC clock
Date: Mon, 12 Oct 2026 14:30:19 +0800
Message-ID: <20261012063020.3331443-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012063020.3331443-1-a0987203069@gmail.com>
References: <20261012063020.3331443-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_233034_977576_0A0E4DF2 
X-CRM114-Status: GOOD (  12.86  )
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

The ADC clock divider implements rate = parent_rate / (2 * (N + 1)),
which is what the generic clk divider already provides with
CLK_DIVIDER_EVEN_INTEGERS. Use it with CLK_DIVIDER_ROUND_CLOSEST, as the
dedicated driver did, instead of a private clk_ops implementation. This
also keeps the rate request propagation handled by
divider_determine_rate().

The dedicated driver additionally OR'd a caller-supplied mask bit into
the divider register on every set_rate(). Its only caller passed a
bitmask (0x1ffff) rather than a bit index, which made BIT() shift by an
out-of-range amount, and nothing requires an extra bit to be forced, so
that behavior is not carried over.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 09e6ceeb2c556..523493e42e38c 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -1014,10 +1014,11 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[QEI2_GATE] = ma35d1_clk_gate(dev, "qei2_gate", "pclk1",
 					 clk_base + REG_CLK_APBCLK2, 14);
 
-	hws[ADC_DIV] = ma35d1_reg_adc_clkdiv(dev, "adc_div", hws[PCLK0],
-					     &ma35d1_lock, 0,
-					     clk_base + REG_CLK_CLKDIV4,
-					     4, 17, 0x1ffff);
+	hws[ADC_DIV] = devm_clk_hw_register_divider_parent_hw(dev, "adc_div", hws[PCLK0], 0,
+							      clk_base + REG_CLK_CLKDIV4, 4, 17,
+							      CLK_DIVIDER_EVEN_INTEGERS |
+							      CLK_DIVIDER_ROUND_CLOSEST,
+							      &ma35d1_lock);
 	hws[ADC_GATE] = ma35d1_clk_gate(dev, "adc_gate", "adc_div",
 					clk_base + REG_CLK_APBCLK2, 24);
 
-- 
2.43.0


