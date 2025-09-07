Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2039CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 09:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCLQAsYpR6U6YXx5WXyyNz/et5qkwEIQ90qwDmcTRHU=; b=tMjJ4MEqcreig11N4cDZH6EOoe
	IOcKyXXSnM7UQQdQWCu4KE3XyDHlHweCxQn0on2si6JcX5sg0tIghc1URpJmQtaUZnW3Ae87ANLi0
	NfeYdz5C6EGSz4hiXVMYwPeV5UHRvBSbzRGl0tLtkTjsMM6ZMZeuvd61PC6jrtALKewsXtTz3Thky
	Mp7ROVCRMZpM1fIqB/kHQWJpAqLZvO6oVo8bqvqrU7te4mlK+y+J82ma6aZKY8zcQckV9t5/ts+Zh
	sdRW7FGoVNB4CGq5US1yBTV0GqATaU7v2T6aqxr8ngiBxkouDULSeJhs8O6jjmWWPPf0jv5ihUdfd
	uamq9WLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBcb-0000000AOGg-3RoA;
	Sun, 07 Sep 2025 09:23:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBTN-0000000AMIt-1q1r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 09:14:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45ddfe0b66dso1583455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 02:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757236448; x=1757841248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCLQAsYpR6U6YXx5WXyyNz/et5qkwEIQ90qwDmcTRHU=;
        b=cp7CHpmxO5OYsexjAsDStNoOWlgbz97ghcIdWPHY3IR+r7briCg9JyQ/mXP2dEB4mD
         9rP7SzrRAx1hvQ92rLN8ZpmCJk6Kk3NF1vP3upFX94zgVhuehhO/7dKjOMSZR5fByYFk
         HMFGDw0wLiepvCBwZ21ZN/WBFYk6R/ZZUggwGEmtK7fGD/gL95X96tOGKRWKe8IHNhRG
         wofpNwuMrts+Y8U2h3JuihtkV8sQakouILkQ7UNB1FFfpfYIYmPa3LuhCn3FrHCsEc4D
         e0u/1gH6OuEOjU/OhWKNrH2y2187dMU7K7ndwwNvJLCZdZmWLOMW+OVnDoG1HryHb1mU
         ZZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757236448; x=1757841248;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCLQAsYpR6U6YXx5WXyyNz/et5qkwEIQ90qwDmcTRHU=;
        b=E3OtOlSl+EwIIahNyIh2JlOwnATCJ6RiiCumt6QouylO3ZviInNBOG0voivbCNXCkF
         l4kG2EG6bdePl+U8TuW26XJa0YQKhQL6W2eyHJAxKFkJpQsHtM0s84Xn15flwhJMKKk5
         DlwZQNPIXrUVdpyif1hwjeWIteX9sOxl54np/vKa+BnQz7jcGRGyb3BQ7FM9fCG+7MJv
         UqNBFdrxVy0LdeZJKNzEqinec7oiEw4ZIWNVecZud3XkRyJ+LavLaelmBxzxTobi1mJj
         aR0ya3tiiW4EDUMSSEjoGmELIlNAg1DrWO/UP4rf2uON24dNYR6iPkhguBcKi6t9YSux
         30uQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/sB8yAHr7RPQ5GV+7OplYfVh5bvtKg+HwLf/SgnmnvX6xapNlg1ipsGXq11BBfn4i83IJsHZ07cmwID2HDub0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh8UZAH6mZMiydOYqlHfy+Onj0ltzFejfEo1rwmt8lOnmA+qcn
	JzsAvw2p5iCMurBA9Y3NvVOrYUOwKSwZRTD7B0zzwXLJkgMec1VNGu34zhCIAEYAG7Y=
X-Gm-Gg: ASbGnctBZWoxrXihFNb7JanCHWkcij/Oxh4Kj19JpK9EDE2Q2VdQAKiIjHLAUe4Pi21
	WKWTlLNUp+ROBA+LMdVwK/chVARmpIRi3XBPoFMo6JKKFlhwzZbjeI3EXE8bUMC7hJ9Ydth2ldX
	xv6UjuViYR79y0g+JBO+SinlWbkZpRwsv+xb5JDL09CPGY5+pdBDzKzmzrwU7QpeDrodxyKQOJK
	jR/XbK23Kd72ID/8XLMGWuDKyjg7k/BoAjvB34aNH37ntRwLFjg9ELi5BdCZ5PkuTlzBpP9wEta
	JOk8LP8hH70kxJXqmdWN7dsC3swj5AWEtKr+8+PtDJE1CEqdn8bf01sR47FuY1Hv8Pxk6goHt8d
	ve39lKhI6+ZMnQ5+8A5vKTcPoHLxF6s/W3cTPJKA=
X-Google-Smtp-Source: AGHT+IG78HXO5H3PNHPON4QM2B7kxOdyJOW/vdjAFNFZeNRnZqCYRuJ044SQo+Ov8yokKCplK6e9pw==
X-Received: by 2002:a05:600c:6388:b0:45c:b565:11f4 with SMTP id 5b1f17b1804b1-45ddde84ff1mr18221295e9.1.1757236447894;
        Sun, 07 Sep 2025 02:14:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e21e4c0e6fsm10918962f8f.17.2025.09.07.02.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:14:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20250904-perics-usi-v3-4-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
 <20250904-perics-usi-v3-4-3ea109705cb6@gmail.com>
Subject: Re: (subset) [PATCH v3 4/4] arm64: dts: exynos990: Enable PERIC0
 and PERIC1 clock controllers
Message-Id: <175723644648.30719.8043699953915235210.b4-ty@linaro.org>
Date: Sun, 07 Sep 2025 11:14:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_021409_479070_638FF130 
X-CRM114-Status: UNSURE (   7.15  )
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


On Thu, 04 Sep 2025 14:07:14 +0000, Denzeel Oliva wrote:
> Add clock controller nodes for PERIC0 and PERIC1 blocks for USI nodes.
> 
> 

Applied, thanks!

[4/4] arm64: dts: exynos990: Enable PERIC0 and PERIC1 clock controllers
      https://git.kernel.org/krzk/linux/c/44b0a8e433aaad8aac51593a052f043aeb9a18d1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


