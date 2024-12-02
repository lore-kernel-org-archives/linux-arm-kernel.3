Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83938D78325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt9rbvg88W4Mm9rufdW2t6Ewrnb3f/HKBLkJJoL/hiY=; b=mmpBmh3oyLxoCf844d8BM/SgvM
	TXkbbeWvEZw31AHkfWPvoU3bC5/FSA4c82soBMHe99gq6hcU/ZxNqq1SijW1BotWGMEkJoLwOQhwn
	tZ92ONS28+D3ZlDjgUrwNgYD9CsCIqeCV4ugvgX4VlflKOid34q+o5qDVa8JaT1dP1XF2CuU1NR1D
	AyFhRK28nwL/GY3DMMXydsL4hIADrVunFlca3QRZOduJqxQHlecKFHgf8xhVesKGd1+OhuBqcc8QH
	CkairTsCyE+qSKmCMrkeNOeKLW+8ef4Y2Gbg3ZTQ6D0eW0IGkEraEyclqSIeXcxbnI4SyKDn/7wAe
	q/YPkyDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI71a-00000006LeC-1DB1;
	Mon, 02 Dec 2024 14:03:42 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI708-00000006KnK-02ZG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:02:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385e40aa2e6so126777f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733148130; x=1733752930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt9rbvg88W4Mm9rufdW2t6Ewrnb3f/HKBLkJJoL/hiY=;
        b=smFiBeavLwAX/hJZ9+X7vPqhICzXXD8zmOvyjZJM+JuS3VJ9jTJnFJA0HsxHbEUw/O
         Kc0dtfojAD9gDxdje844tUq1lPFEHZDiOO+O51pqgI/ezEDlTu3YJi4yBKI0rIAK6RJJ
         1jLRQ2T+k2tOTSqbRgwU6AUYfsNxG5GZ6zhwL2pLdhHm4fPzELSh5m6GUvqWd5Oee9os
         H3jacx0LFSI9KQoJOFjdvYUb4lpqdDEnL6MqSWjVREli/bPmkab1MssZ6TuOSvD/kTzs
         TYUmzCWyoijov8Hfq8zVVFLNp1xpYCNxG7XbcqGkxunZDu5fV+3IbYXcW0oOqduNYiu/
         kESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733148130; x=1733752930;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bt9rbvg88W4Mm9rufdW2t6Ewrnb3f/HKBLkJJoL/hiY=;
        b=MwAtL38TqODSHQCICig71wGxxfS9fGrTzpA0vFri9fM0Svd5E0YRiBetwVKyXsAjJl
         +tTc7jhGu397GTjDCT+nPHry1sRfAfYrwtQipL254vW96eaa1RKrJz1Fq3fKVOmdOs+G
         ApfFlVEzVsgb2JUydzRE4GA215M5aHQ51YPz+djJGQLE4HTxAramx8OK4A2iXo0TbLQh
         K5PjCaOLnTjonK/byC53ISeDHzGJEpQCtm7zByJNMdL+XNHYrRgicfAl1/t3qd5kfI1c
         /2I4JnNwUfPuFi7akKaN2Xo4P2EEKxB48E/O7A+cpNN/BU7aFaEW6VTxX4ZkJ3iQ/ZoH
         Rzug==
X-Forwarded-Encrypted: i=1; AJvYcCVG/UzzMVLuNMECBY0AxNmKYcVjBc+rfMujhieYbMp5CfHaZSR0G218klYiuh1730V47DBsJru38IwYeDDa0xcf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6ulQ73LJqiyyP+hlATKKTkptij2zGMqGb5/yKwmrcvlZMASk1
	QrxoNQq9j4IO/sulb5+0FtSOuLcIQ2psPTtziNOys+ETbWKQPYRsD6HM/aoHJTo=
X-Gm-Gg: ASbGnctle3y7EhIPDWpAhUXz3C91xMT0ywxGQjFcxlisRjd1acSiuqwK0txcTernGAL
	xdSaAm+L4suUkW9mItpBKAI0VEmUzascpqZ/eXRcgeH6v2l74nTqNHSgDc2F7X2tFCRsLT16U8d
	wKws8y9GOEXSfIIxZXYgY+KGi6VaDLsB5RoakMsDgNT/ye8TwkDia+8GB6H7tSV/F053Q2DsY5m
	SLIl30mJZ/QIwHlGy0p0df0WkvxF9SrLW7i8adsUCStOrSVANEpNKYfa6v6HYlv
X-Google-Smtp-Source: AGHT+IFbpzvvcbBvcWNOUYta+EWWguWeH07ZXYUdJCdTYkzN3I9OEgPah3/QG+sVL8wvnjrRt4H4Kw==
X-Received: by 2002:a5d:6487:0:b0:385:e9ba:acea with SMTP id ffacd0b85a97d-385e9baadf7mr2382448f8f.10.1733148128320;
        Mon, 02 Dec 2024 06:02:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385eed2510esm4232260f8f.69.2024.12.02.06.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:02:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
References: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] pinctrl: samsung: Fix irq handling if an error occurs
 in exynos_irq_demux_eint16_31()
Message-Id: <173314812685.47615.16378245073169097611.b4-ty@linaro.org>
Date: Mon, 02 Dec 2024 15:02:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_060212_057877_751E0466 
X-CRM114-Status: UNSURE (   8.70  )
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


On Sun, 17 Nov 2024 13:03:32 +0100, Christophe JAILLET wrote:
> chained_irq_enter(() should be paired with a corresponding
> chained_irq_exit().
> 
> Here, if clk_enable() fails, a early return occurs and chained_irq_exit()
> is not called.
> 
> Add a new label and a goto for fix it.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: Fix irq handling if an error occurs in exynos_irq_demux_eint16_31()
      https://git.kernel.org/pinctrl/samsung/c/f686a2b52e9d78cf401f1b7f446bf0c3a81ebcc0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


