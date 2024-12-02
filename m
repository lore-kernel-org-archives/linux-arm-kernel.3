Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0F1D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4WY1vAA0r2fKbPXY4KjAS2UpwZ8hfCdwU02a05Yrls=; b=VL48gyfQdo5Y/u/8WnG3Rv3KVb
	ZRn8N+ooDulCPDrmEY7Su/lQLfJPCkJo9JEFPLywzsx+sEPs1PYWnhVZ26y1cPzBeLLQNKTlMht4r
	MgsWT6fSoW/U1e1JzHIm4tr84S1kRONoZSXN1ziTO6gytahMCxPhLO6sesj8lzggXhewZ8JnsYKGT
	YHf5q4IS8vvb8mnXGStZhxzDIrw7/QySN+yfSHddAiQBpqNljhUA/MhtGFqBb+2af0IK7mCe3gsMJ
	1uDnz5d/z5mdObDdAf/4NowxGWPPSzxhJ0dhFW8+7jchbZN95t6wWGQM8VAjCez6GVyZttPDP+SrH
	wcF5m1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7Dl-00000006Om8-043O;
	Mon, 02 Dec 2024 14:16:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7Ck-00000006Obk-2b2h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:15:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434a29ecbceso5108665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733148913; x=1733753713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4WY1vAA0r2fKbPXY4KjAS2UpwZ8hfCdwU02a05Yrls=;
        b=KkaTYw1pq6m0bakL0URU5jjjmb/Yd+HeJkcIwH7Djwv7hScmJNN12g1rM+tX1ipOTk
         PwV63l71fHFmZNbyzYEVV/lbzGtiOpyPyfZWMiioBBcmIEt8SN/y5g++GCNJ92bcEawS
         0dSPrd3RP2h0Or+wPOKFzLYsUVz3xWZhmccrOXkOOlhdfedxJWoNn8ReWy3o0Ocm+5aq
         eCjNFkzMMtUt3sFahS7tjLdg3ivb3+BSM5ywVmm6mfarFwG5TTnzEfgvgSWJ3tchFKR9
         FfXCMk+ok1LlaNWojaSW8FbMeJ9dxorjJ1QtLko6jL/umGsbTHp9y3zJXTE9RLd2R5+6
         eKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733148913; x=1733753713;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4WY1vAA0r2fKbPXY4KjAS2UpwZ8hfCdwU02a05Yrls=;
        b=coP5HCtHA1Fdv3cNjGxOrXHLsnf/P118j6zekSzHiFAga8OFs10gfIo+HoyEehgjQz
         iUOs7Rks7G2llf51LOUSmzXERg9fvkCwJCqstzQ3MFgkruTT00dVrsZVEIuPD64SrMlc
         mL70sd5cHgQBSd9cqulnB3q4lT9tGzkRB29tQYUN9liaY/MyVy7OWJOexdI0SFYnUUHf
         HheNBofM1B9vn8PdKEmqILou9KIxqeMHiOdAnyF7CnjTSjgqEGQ3tfpaBMZAlcr70CBI
         BGGtXzWUv5aHklHo6ArX82vY4fUj2J3WKc3WCCF5NQpKvujPGQ4deNOfv9vBBXi5PqSW
         PcyA==
X-Gm-Message-State: AOJu0YyeWgd6B1KefWuniSSl79yb6SZ2H/qizkWbzsVUq4dFKcmIgi5k
	AdasaQwF7QacUU8/UEJusVz6NppuNGllNH7UzZU03Fisad6k6QD8Wb30HZ1qAWM=
X-Gm-Gg: ASbGncunZ/H4pb1Og9Mf4Mn/ArrT0iq9o2kHDoXvRg2tBhs8xCX/J1/y6CCokXrK+Ml
	Gtbw2hTn9hhKpVR0YyZR73vSLs/cp/9KzxVco3Dc+GQytcvs7kE0QYuHC+N7/yoHtBgAIIK7A1s
	2LJhqUmVgK1GX8lL8S+MssPUoU1E+CsG2ya1ORMt/S07KtEih4JXBkOBo7iL8d8Mi9QUDHlpOSy
	oPCp/CzFOOzOEEeVOFxtkzp6TAsGOm+aZL4D7/+xeYeYqSJrVf4VUeMxc/SMSYS
X-Google-Smtp-Source: AGHT+IFElDO2xd8mFJCzbrH8EiF3i2wyF8UmcXsrEdAyTq41fa6hejn4lGjAijspgIkC6zPVj6Q6lw==
X-Received: by 2002:a5d:5984:0:b0:385:de67:229e with SMTP id ffacd0b85a97d-385de672523mr4078648f8f.11.1733148912772;
        Mon, 02 Dec 2024 06:15:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dbe4ccsm152388855e9.13.2024.12.02.06.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:15:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <t.figa@samsung.com>, 
 Thomas Abraham <thomas.abraham@linaro.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
References: <20241106-samsung-pinctrl-put-v1-0-de854e26dd03@gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: samsung: fix fwnode refcount cleanup in
 error path and update comment
Message-Id: <173314891106.48956.4220732642073324618.b4-ty@linaro.org>
Date: Mon, 02 Dec 2024 15:15:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_061514_658161_8136B0AB 
X-CRM114-Status: GOOD (  10.24  )
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


On Wed, 06 Nov 2024 23:04:38 +0100, Javier Carrasco wrote:
> The first patch completes a previous fix where one error path stayed as
> a direct return after the child nodes were acquired, and the second,
> completely trivial, updates the function name used in the comment to
> indicate where the references are released.
> 
> 

Applied, thanks!

[1/2] pinctrl: samsung: fix fwnode refcount cleanup if platform_get_irq_optional() fails
      https://git.kernel.org/pinctrl/samsung/c/459915f55509f4bfd6076daa1428e28490ddee3b
[2/2] pinctrl: samsung: update child reference drop comment
      https://git.kernel.org/pinctrl/samsung/c/0ebb1e9e1b12ddcb86105a14b59ccbed76b6ce00

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


