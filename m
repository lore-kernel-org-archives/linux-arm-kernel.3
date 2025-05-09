Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCEFC3ABCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFGeu4rqa4NbdBxLMRAKny6nuW4xYvTJilVyN9sQWDs=; b=gqa/FCMeRcK3ZN7NSoIi1KqFDz
	/UuW0hhezhKrtzCmrId/h/ymEX0wBvsUk54apQKRprPQ/3n8svfNKl8GPdmECDsd1Dsr++hjXT4v8
	MsZbu0CmF+v/CxxfHiIyAcB83YB7/NBia7JxyByk53wgUKBmAV3vVxdFHBzEfQHAJD4YodsQAKocX
	iWWYi1wapskRy9dCwhln1jk7Akl4EkQ1tQ0tjwpCEml9G74U44pnxSM12zuFLJK+JwaZR/2hfTGY1
	xghbM9tlCj9tNiPM/Oav6sfn8t6oU+x/cDYxgy4d+Hs33FOZlhB56KX4cIpHdRW70poNYRfs/7JUj
	oHOZwlgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDN0p-00000003cAd-05yR;
	Fri, 09 May 2025 12:39:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLWu-00000003NCp-1EQR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:04:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso13151345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788675; x=1747393475; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RFGeu4rqa4NbdBxLMRAKny6nuW4xYvTJilVyN9sQWDs=;
        b=siqVDAknaoGaC71xWSHwllQi/SlxC/jHFHG2rLbTUBubNCzsSdGfKvmqBR0hUuNoCK
         1nFWKqSMlW96I1fOfR6Jf0eGl+9ZQMkIFKRx1Z2oNRjUnM5q1lXALCdL9oR47aIXHbzc
         OURYRCg28GONNU6tiXCdmSYoetKoQ2QXUsbolAlec/StIScAWq/A8RQO/4/dqHQ2UH1N
         TPUXMMUhsS2OMWIjcYFBTOOyqunRbdZelKfcZasdInioGL8lti2WIPt1shVxC4kxfXGp
         mpd2EBufgpTMSyFOR80RfeJOHhqjNHIrSPtJreWVcvS9kzEYZ5P3hKAKOxKsDX0Qi+H9
         5McQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788675; x=1747393475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFGeu4rqa4NbdBxLMRAKny6nuW4xYvTJilVyN9sQWDs=;
        b=AYXzGeunmy1jcyv8vl0jc8qYcU1ydv5vpsABwk+oiGrQE+31d/JwZRgoeMjMJUon9G
         vGTuABTW1hCNdF8dYteex2DzUNGIV473RcxcYeS465OSH46H413cPAB/XUjiV3S50t9n
         1IOsWIwA2pAn4F/Q2Y9ozLQy4DykBY+C/peHppApbO5TtmVSVZyzbY96Qg1delw1x9P7
         ce+iNUZTTLbdEhZQ2jYbO+pbQUKhCoUTstXg3Puk8C6DREvP7GR0LNP16Kiz3ADw7VPM
         DZFHwDBkBILJfsbyIlUHmV6lJgXWMlBZFR1IKdX/KFd3uPszR72njwkMg8+bQ5Rh3UY0
         03jw==
X-Forwarded-Encrypted: i=1; AJvYcCUtMddLk8uYkSCs5UJzRGQ7p8LUJhkOTcgX3yywHFLRBzrdn0N1fTA8lCeX31VKTC2egkhFRLpmvP10R6GVGMop@lists.infradead.org
X-Gm-Message-State: AOJu0YyKRGJ2XjZNRQ+QTo9wMh0V7+bSfcAcKLUkIqp9UtiH352aUrfr
	2pphRwcOkqHRlZQF574+xLclGlSaZ+dyV0fJyW0b79QGQ5LLjQLK4mCaqqy26F8=
X-Gm-Gg: ASbGnctKjR/1+4zNuO68m+EN96EiM93sGQ07saCWWdhpLQ+/GeHfHbCHPx5UbDi4TIr
	qBnvqb7uzZwjzLDDKp6wnitUoKeOF4CkTX9UHMyIJrsvPxjkc3Mkj8uOx5+anDber3fEpK9N3e1
	fCr5OKiz7SwJGfg1NJmRjbUgV8QXg+41NzNMrbTgzMTMK3ZHJ/OotBpevHgc8pzFeruddT5odBf
	0STC2Erl5mjNVvu+4NU0HyftHAoTBQEFuavbBJMmaBGbybU43PZ7ga99PwQ94GqYqkJRZNWbxFK
	TWjXKmnZNyxj91WTxFwxbMkM6IOwT72I8nqPAMJp1+f0Zw==
X-Google-Smtp-Source: AGHT+IFoLOmKX914wuAyiGBAuaM7PeEJMdeV8PiUZxo0dtylTjuaMjYw6oH6HF/eoBRmbKUgAyX7qA==
X-Received: by 2002:adf:fa87:0:b0:3a1:f684:39a7 with SMTP id ffacd0b85a97d-3a1f6843a51mr2176018f8f.0.1746788674618;
        Fri, 09 May 2025 04:04:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a4d21esm2931116f8f.99.2025.05.09.04.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:04:34 -0700 (PDT)
Date: Fri, 9 May 2025 14:04:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] memory: stm32_omm: Fix error handling in
 stm32_omm_configure()
Message-ID: <a69ce0445324e994ea2ed7493bda1f6046c7ff69.1746781081.git.dan.carpenter@linaro.org>
References: <cover.1746781081.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746781081.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040436_330338_17C0CE23 
X-CRM114-Status: GOOD (  13.23  )
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

There are two error handling bugs in the stm32_omm_configure() function.
1) The error code needs to be set if clk_get_rate() fails.
2) If devm_reset_control_get_exclusive() then call
   pm_runtime_put_sync_suspend() before returning.

Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/memory/stm32_omm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 166baed0738a..fa0f75e4a6e8 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -222,6 +222,7 @@ static int stm32_omm_configure(struct device *dev)
 		clk_rate = clk_get_rate(omm->clk_bulk[i].clk);
 		if (!clk_rate) {
 			dev_err(dev, "Invalid clock rate\n");
+			ret = -EINVAL;
 			goto error;
 		}
 
@@ -230,8 +231,10 @@ static int stm32_omm_configure(struct device *dev)
 	}
 
 	rstc = devm_reset_control_get_exclusive(dev, "omm");
-	if (IS_ERR(rstc))
-		return dev_err_probe(dev, PTR_ERR(rstc), "reset get failed\n");
+	if (IS_ERR(rstc)) {
+		ret = dev_err_probe(dev, PTR_ERR(rstc), "reset get failed\n");
+		goto error;
+	}
 
 	reset_control_assert(rstc);
 	udelay(2);
-- 
2.47.2


