Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51ACD277C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 15:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=; b=Bjt2RsDYedD4Vj45mIqQ1GgqoJ
	4rGyqn2bn32WwATSb65NcZGNM+qHSuQhFuLz5jBV8AMGPHW33gdACcJtT5ltkECxLrofGJMyx8Q5S
	ZVbYV3U8DJtCtm72UT2y6KqHK1MldfM8PkCXDuFjgm3JWGdtxDvpjzQ4GDs4/05RlMBdNpqoWgdlD
	t5ke34hxCzWR4NIPCAEwSFFmi95QuJdCKgqVB5+Ov7HNDCs3rMMmR6GWN9Y67+e2oSq2yAbOJAQC/
	qu/Ysdv3wu8lriiwUxjO7hFsjzdox4DIhoQ7fwwFldgEsRl1nN59z42bf6N4t3hi0xInqFdj0hyBM
	RhFOByiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veab6-00000003VtT-2Luz;
	Sat, 10 Jan 2026 15:09:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veab4-00000003Vss-1J89
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 15:09:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-432755545fcso2961669f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 07:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768057784; x=1768662584; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=;
        b=TI5BN97v10dlrcrUBDhmAqc5EItxlPZiKYpMewOjqLD8GLHwFiGNpLUDZtTewgWrcj
         2fGX1O3dFaNuUCZsmNfXJ7YpaiZNUJbZ5fg2QV7E8G597A6rdoMZF7a2Oth5bPEj/yH8
         N3winG0OeWRBFc6y0w2LwIfBU1OxyReqh8p1/5EKDeMXEap1ZIKkUszf8wYY7bnyKAZj
         mQLgZPMWqdNUaRzJ4hKkMQfogJNOJYYLXj8IzmNeszn7bT7f/7Ihq2wefEZj+q8zXNN7
         CZBUwENdtGnFwhgsaCwibUtEr3GK1WCl3UTDFobvDlwxHmIrPjZafdmE2Y92MlKsA3UX
         VbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057784; x=1768662584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=;
        b=oHu0qQ4aTnAvN/R/6EF7IPd/fVzIjgTWSCS5AjqkV01rj126RQeuh0wUSjXmERVrF+
         OVfSdXw4nbc58Dxr2DUEn4l8zwLixMxvpBzrinIeGGTs2mKf2a0u6c8I4W/FWSHr22g8
         SC76Oa2kJIV7e9hqJn9R149KOJVFcLEMY515AkFZ7MaOyUaWqiyG+tcGifcGwAJVj6wv
         7qkUKnUiNoBjlvTzcaTKFiDv/H/P2PV/KudeOxPobhohCjOVF4YX2/ZBLr/IINolxW5z
         6nfRTwiQ2KC7YRvjNj73BSddOC6AiPd3W+EN1xjAv+XEa7JTdCjIi5+BEifgQ6M9+4vd
         srww==
X-Forwarded-Encrypted: i=1; AJvYcCX9vfzxR61RvImjEMygyKFCWpqou12YSYrTte7pi9ah+qZ+kcz00+OztXm/0GQd0swx6BXHMsU+0aD1ziPRQlhe@lists.infradead.org
X-Gm-Message-State: AOJu0YxlvzdjBMHFa7Ls+oRO2xrwOIlwlNpr/l3ttzdFigC7gM9lryXN
	CWV8qsh43Y2POh3c2EB9kKKj4CAq+PN7Ut2CRFIUx+9TVBMzDoyuyddul/M6r3eWQK8=
X-Gm-Gg: AY/fxX5g7oRVLfekbKsS6itsp/N/OaaVsOiJXfzKu8tiz2q+mGxuRQhP/JsfjBPX9aB
	aH7oJJe/Pl3oKMnxRiN0t7J0HUs9+7G2YrVbVqugx+Yxvs36oEUkuETpi1TyaalMUAr8bzU5qGz
	EfN1jQiWhDf9AGEFd7azbAmJx+csfKJyKmSKWvNWtKe85Zis0DfhF9fwyFexK9jCJ5/i4YMPMLO
	7C3ieXhDP7FTWuXkoXuPD7fuuq4faWt/7vOgIOom5pteRUhSghOjBRwNEhKNu6/zWY6WKs5v0A7
	5Ll0twDuxMVAXTPWwHqHKHaZlunDsOQcu9DqXNt+ZULsxwQx0J5tveoCn0rKvWLToLKQvnzp8UT
	n0jaKE5bc1zCHkpoDvI/NKCq22N6VHM+Q8czqiffFRKybQQGCIAPeJX2Uvt6PvYGFuOlpdZioPC
	CsL5Xzw6UTjqLXqeDKgqo9DOvsZqwu
X-Google-Smtp-Source: AGHT+IHwvRNK+qwBLjP9mJj148RzU5png6+Rsy9u3J7EYhE07UUYa3vVSxYXarlT5BZGC6AC5xVP2w==
X-Received: by 2002:a05:6000:40da:b0:430:f23f:4bc5 with SMTP id ffacd0b85a97d-432c3760d02mr14529601f8f.45.1768057784134;
        Sat, 10 Jan 2026 07:09:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm28208208f8f.16.2026.01.10.07.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 07:09:43 -0800 (PST)
Message-ID: <6c2612f9-97de-49e4-a7c2-eacea2d33f51@tuxon.dev>
Date: Sat, 10 Jan 2026 17:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] ARM: at91: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
 <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_070946_389560_CD33EF69 
X-CRM114-Status: UNSURE (   7.87  )
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



On 1/9/26 18:57, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

