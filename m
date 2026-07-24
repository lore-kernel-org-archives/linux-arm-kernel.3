Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7923C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQddTTwM0k9Vodyi3BYe9DGecCKk+Ahu8ONHXQFEWIk=; b=feQVgmCr9zNYWBOcNPXl/j6c2/
	mliDn8uk3S+uM8/nPQLOLWmhyLT0bNNU+0FL4ZYTxHoA+QHCnp8joer4c61XHqp4lzJY4CFUhvjyo
	+81HjvV+8ga1kzhhmPxbFjBRQIV8gtpK15aPNhsfdQRbz5YLYatNBFlkCv002VaCeTWyn2nNvzFF2
	8x/85ZtXTdO8xT2C7aBqUAenOctRsJlFazNpjJI+pUUXV16oNED6sn6uwbee/Q4YfMGIRu0c9NTBa
	3YllufR7+9q9V9hZD7IXJzw7JVVyfIyI93kyfBqAfWsYI0aWP/rjl7yAZ6UQFKR81wV8MyUYdIdUA
	v/i9sOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpQ-0000000FuDj-1HL9;
	Fri, 24 Jul 2026 09:04:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpG-0000000Fu7Q-2zyK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:04:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49553515a8bso2482295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 02:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883853; x=1785488653; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQddTTwM0k9Vodyi3BYe9DGecCKk+Ahu8ONHXQFEWIk=;
        b=iAQP6qVG94GYOeOxvDPOXFvOU47mk7BHpM8ReVPEYLvuI/4T2QTK3OG8JphbufPMXI
         LUJ9hGLQgS9K+2hJvl0Q5eNMqxOLPnxzVezHRQOh9HbvkHxaqeIgSugF82LQaqmFhDDf
         nzI1BD75lT+2ynsqTDfq7rPaItTd9C1kF/NptUaRvDlAXCOT/9zMnvd7ezNy41dtzgLu
         vAEoMVO4V9kn3YLLcJRtrIy5dOXJzYAeto+d20L1JRuIZpB5adiMZAv+RiPgH2fLRa63
         cI90dhHZ/gPVWXYTvtr4YSIy45+197UaAvonDgU2PRw31lRDpUw3scAcaivDSy7TQhvV
         wnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883853; x=1785488653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQddTTwM0k9Vodyi3BYe9DGecCKk+Ahu8ONHXQFEWIk=;
        b=JBG/8HZdP+A7hOeBnnJf17i+eZjuFpUy7pfyH5fj2911S7CNOg116ykatUSsZlx+3I
         rj+JPDOcBxR0dy6gXaCSRPuPtnmS8nZM8zrnohXNtmX3wyEqg7uDwuzGOuxhXm1yJw8z
         jOpFEhHcHJCjdeDogWt7SstfCrnJVA3WBum14grTbg4titGjKtgAATYTcTjMUzKQog8d
         Ydb/z/nv26PJD6Q/D8qCuYkAFev4XJqI22AhWKAlrbA6Hcd9oUdjSoRY1HkZElLOowG2
         biM/eNBM7rYCP3++vnpMaG8dBnsNb9ZBBAqDR/LGryzIk9VUOejRuIHXbMsqc7U+AxX7
         zZGw==
X-Gm-Message-State: AOJu0YzhSIbhNg9CgRNZ6Xg4EhDf7zy30iPxp0AW5kAorAN/oF1myt7m
	+1CQSl1J6WPh6x3BZxiGlActOwTrCSPhatbAWnZogxMELE5yOPIt4limnIvIJ39Zqag=
X-Gm-Gg: AR+sD10o60rpZ2wz5ZwdcE7ocUreaF80TU7oX2ajKLJIDYX6+AtJeXu2MmHbxZ64hQJ
	/ViWKeeBfqqAKiIi898SASdEtP0ulQykKnqL7f9Dw7TJxR2hau6VzYY3QwmlSiedWcicg6DKa/p
	R1C67HH1vTzedPpzJEMGgO0B5Swf/9BXVzQy8eBQUqB6WgvpZkHPdSXC5t3VPd2Il4i6Os40wM9
	NEcbUssypOGToA6DPWtUuHK20t5xBt0dkq90muSe0ETM5E/65b83waFOdeSwl8FYafpRm2TjLZx
	ReoKPBc+waRMm6utcBoepKqvsOxtHLwzha7FxzAwvl5zpV7dxKjJ9fxigzOw6Yb3J33JS4Bfqpm
	il/XScoIIeCJMeDcUYCu7rwyH/IMZLuldtrsmHzC/l6xMUnoLrg8RP+jfBsz7WZowHD8u6WPFfe
	AJ
X-Received: by 2002:a05:600c:e549:20b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-49573cd3b43mr48859445e9.15.1784883852904;
        Fri, 24 Jul 2026 02:04:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957bfe07e1sm35606965e9.3.2026.07.24.02.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:52 +0200
Subject: [PATCH v2 1/7] clk: mvebu: clean-up simple provider misuse of the
 consumer API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-1-56f306156d25@baylibre.com>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=hQqUrEC2ohspZ0Q9n+8GFiTuvpJJRj9wwBmEqNtW61Y=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyp+rKhEixzWUn4GUS3MJXwAOFpteD1zvevAe
 vX+e+PbuPOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqfgAKCRDm/A8cN/La
 haeCD/0dnjAZeXY2CBNgE4BaUBWX5Y85pENGGuWJTOPLlhZwKkcYkteVXrm5WQpjWWk2HLratFs
 N/arQoP5iOIbdrCL5vpNiL0tKLKbZg6NceVOx6srjc60YNG4QAdLsmMg79jtvQKSecZ9158QZxC
 fr8w+NEDgmnPFMCMgbVj2SvzOyZ1Cb40NKO6vxdwjIrp38SyhPTZ7+ADTI2igbjGF+W4wCNvxUW
 gO0zR3raB3g3p2hn0vnBPkP4QNE0TCARKcdoIm3IBfaPKubO5D8gdpYgh2P4A7wJBeFcnI41jbN
 rWUfUcRonDj6ae0rBIbKn0c13thuoE9DS5Sgdt1FCJ19LHFfYfYwAqBpZ3d7dOytru1/VmOWXj3
 sibrRsKv5DG1OEavYxvU9198kc2EbOyPd8dxBbuO5iTxuS28A/+CHc3xb30thhMowe0FeCB3f3s
 lDTgGxrXx5MrvCwOQL468XgKyTtifJ0vDuB4HyXkW2kQZYxSLf+m51vvKKEHnu+ObnjX5K0ZB/X
 NhFwei8QjV715D5MQjr0e+zn/WDksHg9wWQh0CNelYdqpxeAcML14ERh1MLxnokOvweTmnivysM
 5pLs7XFWLWGCvva7QHRFdHuLxdWFHhtFZ/a5aEy6XHta5USqzKuuwlOLm/aMUbAnsq0gENcoqVx
 8Mzt8HjQPHjqRCw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_020414_776212_EAE9B524 
X-CRM114-Status: GOOD (  13.02  )
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

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/mvebu/clk-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mvebu/clk-cpu.c b/drivers/clk/mvebu/clk-cpu.c
index 26d52ecaac50..24196e288fe2 100644
--- a/drivers/clk/mvebu/clk-cpu.c
+++ b/drivers/clk/mvebu/clk-cpu.c
@@ -153,7 +153,7 @@ static int clk_cpu_on_set_rate(struct clk_hw *hwclk, unsigned long rate,
 static int clk_cpu_set_rate(struct clk_hw *hwclk, unsigned long rate,
 			    unsigned long parent_rate)
 {
-	if (__clk_is_enabled(hwclk->clk))
+	if (clk_hw_is_enabled(hwclk))
 		return clk_cpu_on_set_rate(hwclk, rate, parent_rate);
 	else
 		return clk_cpu_off_set_rate(hwclk, rate, parent_rate);

-- 
2.47.3


