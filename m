Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC90C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 19:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiImoVKJXxF5Kkx3zdXXXFlWOb+F7YBai/OtGKstv94=; b=4a9Z1EYwwJzAJtqIOC7CLJBL3V
	A7CWXOGA0YN5UleJFgDwsYL2M9qrpUMJvdP5rbRaVo3h6ks5NfV5w4RoUVqIaPfMY7RnwseDk+sA6
	9HVVNBPPugta4eRwGCvZos7zss6QDs4LbuZsxocfXLHzDZU1FXmdRROk76YpyoCZGUs9OY0AQCnPK
	BwKe75o19J4JMN4lixrqd1fDTw0dlSKnjqX9g5eVXaCKf3nCZ4phI3BDbzCRVTwxvd4KKJ8ABQ8ze
	+tOoV3+WSkkGecD3jLpHYGPk7LNRjLMPwMHqlgMowSwj0o2ReDB7XqaUirYKJ5NrzEgZ/BICbIfyB
	GChivc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u97Xd-00000003v7n-18SW;
	Sun, 27 Apr 2025 19:19:53 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u97Vg-00000003v18-2MWO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 19:17:53 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e8484bb895so1083038a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745781470; x=1746386270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiImoVKJXxF5Kkx3zdXXXFlWOb+F7YBai/OtGKstv94=;
        b=upEuqWXXM16jxxLw8t9gBu6QxKpmIVNlzsnUyrnmovNZM0I6V6xa6cPVM4E1IQ6c6A
         1Z0oopT89OLLkCPgCJEHT40E+DAqeOVdUCppeqhvfU2JUQX54xaoa1YRTUo3Cy0zmAU9
         a5IbcL709R7tVHkdu33Jo37BAjuOl8rsRtzc405HyDkXJXwbj1CiiDngAjakkv7DxxJo
         tOpW/RBrjXL8yu6QLuNs8cHR/voNWXPKAmraVpFeiAfqa2u85lWs8Arbs0lxALV3LMZ6
         imU72uxU+ra8KS05QL03wf9vdmqh0ynfLPTODiMTeFG289mNGutgNWj+fTucPtQDFSUF
         Twfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745781470; x=1746386270;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiImoVKJXxF5Kkx3zdXXXFlWOb+F7YBai/OtGKstv94=;
        b=s6EkUif9v8m9WCIwxK6UllemhHTnVNJ2WjoZwaZK8ATr21Eg16RGJFAzvtnNrD6zCx
         DVoNWmRtcWgpEvH2g8vDB6cR0xxkzFZrYD0dkHTlUN/3Ys49aigJ8/sf0Fyt/66CHRrp
         BkjUcTeC45q3b7SQc3XhMpilZjZAOaN01Q6AWZ8gbCKNEAJxF/5pqtWmlGbHxcR8tGcc
         EhNHyZ3NyGE9XrTNEhZ7H1CG2+xyNvKCJ/+NC0TOhadYvYEhpqV1QRxMEgsaC3jJ/lAl
         jTTFZgF9iuF2SO600dri1GjYvmuGwAi6J8r54TOLUfIJlqyTh1V9VglLeThR64/C+ql5
         OfNg==
X-Forwarded-Encrypted: i=1; AJvYcCVVO9iBDYufmy87YLmCbWZ+AXNPzoOPJ0axS04YilG1MaLPx/fFAG4kfFW9GXR11zZopiLAxHeZ3XpTF8mpst9o@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8zDTklTJq94+GdQgYhsTNb3g6ERzxK3CujfeDa95W5aQm939E
	tGNjw4Yx3dhkN+RyJBuMmEE+dRRNEH5Y8uMz/SvTYcKRMg5GR1KVG6mFinB6xGM=
X-Gm-Gg: ASbGncskT4PjWcZo4Do3b8MJ3/w1434sZMS1coCA/65A8yw80SDZXn8eE6nGk9Qo6w7
	kFm1of9LXk2R1QZm3IbmXzmO1bRyUhvBgZQBfrXh5ph3KCQl+fGBk8vqr+AB4znBxdoPLBDucZA
	s6vd2vMBfppefOZh2GdZJDC7RE5PKS3ygrym3UyuEvpotOlW/R9TCfd0NiQYYxXB+iWUcV8EcKu
	cfjpHHC3ayJawMzKfgsuO/CxSIQoeR+SjfDPwjEsxo/cuMTE/FlgSNFrooKnCrZvVL6j1/B/FCs
	Aiz7WA7POtK2g+w5vFSkbRIkku2l+N7c6GPMDmAq+xcbZnl4/UkhX28qU9o=
X-Google-Smtp-Source: AGHT+IGubP2iCTuCyZ6yE7PZ7fqh1WFD1EalA/6wRofWBfLKR0gPhAxQUDuoA/JPJLBw75qeR6aCjg==
X-Received: by 2002:a05:6402:1d49:b0:5f4:cb60:b1bf with SMTP id 4fb4d7f45d1cf-5f72297d704mr2493639a12.5.1745781470559;
        Sun, 27 Apr 2025 12:17:50 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f70110791bsm4547238a12.13.2025.04.27.12.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 12:17:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-12-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-12-504f91120b99@linaro.org>
Subject: Re: (subset) [PATCH 12/12] pinctrl: samsung: use new GPIO line
 value setter callbacks
Message-Id: <174578146801.16256.5835084697538702793.b4-ty@linaro.org>
Date: Sun, 27 Apr 2025 21:17:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_121752_625331_C5170931 
X-CRM114-Status: UNSURE (   7.82  )
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


On Thu, 24 Apr 2025 10:35:35 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> 

Applied, thanks!

[12/12] pinctrl: samsung: use new GPIO line value setter callbacks
        https://git.kernel.org/pinctrl/samsung/c/0a5b9be31f78898c7d6e7778377e8ab6ab0399d2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


