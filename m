Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61CEE64004
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 03:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U/FN5NlH0iS1DMIQZnLtbDssQz5F0UojDeaXB8HEsec=; b=vQNShHxTRATpxAac/lhLSSonmM
	qYkFYDZZxyp6QN6B1eHqNbl/VYmJoyIlyDPrcdwURQ+g+m1YS5xi1gW2mgdG+cLn3gHnCCwG/im3X
	BBC4wTwwpfSEoGdjaz6J8Y6w3OO9eNT4BBb03OcsN9SyHpH+w4mfzVkTweEaTwHgyObXbNQuXDJaX
	v7QzA7CDFa7qxMdns5RdgtjyU+FeCaQNP9Nop7y9VLIkalbDkLS/vqNneC7czOW3DylEgfAXkBU2s
	DSRTkLof1ad1tzdOn2OamWS21ZpGvVycYuqdLC+7phjhZkA4gmNv/Vuo37TnA9nNilWwO3gUlE7lY
	uCQEOnbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9ELp-00000003w0Y-3abP;
	Sun, 05 Apr 2026 03:40:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9ELm-00000003vzl-0r4w
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 03:40:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ad9516a653so14415525ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 20:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775360436; x=1775965236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U/FN5NlH0iS1DMIQZnLtbDssQz5F0UojDeaXB8HEsec=;
        b=kCduTIsn2sGDXKYbISvDdiOPvsrV09Hez9z+kzpfSJDuUbSii4OdTQpgtXYaSQwM/5
         02aRhLpO3JCIfgkuctHphQ9TUWuA3qzoQPxLfVEsY9OETcHU3Fjgpwn+9UJcmD+M3Hgh
         KGfef06IAmp73iSjlND0Zxike50qD88+oqNBAAW9hJbPOH08P9ytgtVxVTgSTNYyNkdw
         69c1HZ3hSs4c/1mkYJrMbTNFmqw/IxkGofy1tVnzNmgiyEQlCx9DYUdttXK0BVdYz+mi
         QuXa25PuZHfhapHg430gCZEozhQPWEJqkf7KEJXG5OA6VDqmy5i07hclf9wXxzCWWAw+
         l1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775360436; x=1775965236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/FN5NlH0iS1DMIQZnLtbDssQz5F0UojDeaXB8HEsec=;
        b=OC5GNTx1AiB0YOANxdTnmUPrFr0KvLrweHqH8hfWpaRlC7QbhVyOG3F4KVrjThJJem
         CQSE51ccq+A9jm8Kzuq9zlavKj/oA6NByIjA3nCAerL619N7mCvrCFYx9KiCMRAuAWlL
         EEeO1KTwGDI4QBNu+DGqPzbgT9+kbUkBOvRV5AZ5kpA9WNJFh2z1EQMXrnBwnkcAC3eY
         kw89tLxHAm8rxsxSZcEeyfhpcrdglVOSauxqO0S/QPq82GzJtlDqddHLt4QBMVr+ZE34
         YPBdGrQCk7TrSyWxQZ5zB67BozPciRp9oND7QA9L4OlL4smiwU0TLF3ajPGrvcZyv7Ce
         +s1g==
X-Forwarded-Encrypted: i=1; AJvYcCXS415ZnsOKFzjz4rfqFHcJzzbph6aGcLDs1OqrDAg3MqDzmyJ/ieGEBhvxJMN4eJTTPCLDlkf1pTjmtWDh6TXS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/VwG5HHCQFWl52c/SW2S8Y/64R2HtQFaPdg02VBGFJMZyUf6J
	oM4LzMXNxLGpQTt1zrzhZpQXo+J5bhMVzhMDr3w1SObKbqllw8s8zrCX
X-Gm-Gg: AeBDieshncg160aEpH1Gcd+LtJpKmbG5ZQzbWHCpXZAj+uygnv3BiUEQSkTu3UyLzdN
	o8UpNQ3QC2smFnYrqR53DKjMNx98oPSFl5PLgzxNcBz2fBAeulIA5rvIiKwXGJ0fTJ/oigoKww6
	VOU6oSTxFeWMUaT+sNZuJW7VtwuoFadkayS6HZTHAagvAS5PMG0WVyJ3wP4p2JE9bydEHlbzYYy
	3eR1hCZezce3o0X8LB9jhbGFxhg27WUzzig/98UsCQ4N9rai8SLhL3y0YpTG257pPHdPkBxGIlC
	QcL0wRHNtd7UaXLZTRuIa9p3FMww5tmgPN02wKx8KMaTH5Odr/6n4GdhXEiOPtygBmvML5QzLt/
	y+keD+husCX9Ilz6HMuXMG/mqVb/vpRSmgxRKu+3er5CXk9YV9b8G8BBcaxnSBSH7KMK4iGPO5U
	QGTKDR0z6LgFa6bjVw9WXWg0DVy1rl4A3orcQqr+AvyWBZaD4vDyygdtyA1W0UVSWvNoBO3edq+
	MUQFJVKaNwJ1hh9SySqR8k=
X-Received: by 2002:a17:903:2c06:b0:2b2:4b4e:e4d8 with SMTP id d9443c01a7336-2b28164c3ccmr87459365ad.4.1775360436559;
        Sat, 04 Apr 2026 20:40:36 -0700 (PDT)
Received: from adeel-linux.ad.umanitoba.ca (nat-243-cc-130-179-243-228.umanitoba.ca. [130.179.243.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497aeffsm99743195ad.43.2026.04.04.20.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 20:40:36 -0700 (PDT)
From: Adeel Zahid <adeel.m.zahid@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Adeel Zahid <adeel.m.zahid@gmail.com>
Subject: [PATCH] i2c: p2wi: use dev_err_probe() for clock and reset errors
Date: Sat,  4 Apr 2026 22:40:21 -0500
Message-ID: <20260405034021.12435-1-adeel.m.zahid@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_204038_312297_EE4F6394 
X-CRM114-Status: GOOD (  10.30  )
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

Replace open-coded error logging and returns with dev_err_probe() when acquiring the clock and reset controller in probe.

This makes the error handling more concise and correctly handles deferred probe.

Signed-off-by: Adeel Zahid <adeel.m.zahid@gmail.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7f..2be6d50273bd 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -245,20 +245,16 @@ static int p2wi_probe(struct platform_device *pdev)
 		return irq;
 
 	p2wi->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(p2wi->clk)) {
-		ret = PTR_ERR(p2wi->clk);
-		dev_err(dev, "failed to enable clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(p2wi->clk))
+		return dev_err_probe(dev, PTR_ERR(p2wi->clk),
+				     "failed to enable clk\n");
 
 	parent_clk_freq = clk_get_rate(p2wi->clk);
 
 	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(p2wi->rstc)) {
-		dev_err(dev, "failed to retrieve reset controller: %pe\n",
-			p2wi->rstc);
-		return PTR_ERR(p2wi->rstc);
-	}
+	if (IS_ERR(p2wi->rstc))
+		return dev_err_probe(dev, PTR_ERR(p2wi->rstc),
+				     "failed to retrieve reset controller\n");
 
 	ret = reset_control_deassert(p2wi->rstc);
 	if (ret) {
-- 
2.43.0


