Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3156CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzDrLtK3tVYXpgajpgV5xkfeNF5cniPAFxRcbhLkKq4=; b=1qrPywpzezghufvwmDmgAaKSRR
	RzlehJesyWheVp/WhYcK4wrG5V1jr9Y0bpYk87NKJVUAgIfZ1A9DO6Ml9RmKAi12aK8vqP9TN/JgW
	blhQVBmEti4G69q7d9dlHj3CsFTfMg6bE2bwt50Rqnz31GOxICF0XK1YZvEVydUmmY0SUB14gO/0I
	9RM7iayAseiBarcn9vM8+m0lXkEsW2g0oMepU+LtnDowYrEA52B1QfEdP1XpqTSQd+ZzFGoY246qY
	ifKEqDaVmQMLHKfwGf0vpW5Xl2xx20fetLNL5Ak1O/o5IcgxEiP88st6V0vfHOujwhHzz8E9ICJy1
	T2RUDHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utilS-00000005Wb5-1kTh;
	Wed, 03 Sep 2025 08:22:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uti54-00000005BAl-2dMZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:39:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45b627ea685so52080065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 00:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756885137; x=1757489937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzDrLtK3tVYXpgajpgV5xkfeNF5cniPAFxRcbhLkKq4=;
        b=U1PlgEgLCqjZ8iqNSvcwOJR0QRY0+/sy14yxiN7XRjsxoYE3RX3k5MsdAE/zuwMFvb
         Y88FBDg7Yf4ISyfHjCCzUmtJomS9Obdb//Z7NbRghZzYaoa5oL/0ulOSufYmqgNIOurO
         xzKHXqWxFikxYG/s8qx1DFnNJeo3z0NfGACXhjoOXfezcW/bdi3WrSPem6IGSjOXGTXd
         qJWsAnmk5K2QUDhWDbKug4D/tsn6iwVR6ubtIn6WSMsW4WKG55JWclSBk5d7njTnOSQ1
         BYhjhW4Nf8mt2ch0kPOAyumBa4amTHzV8FYfbeMKiVB/s7akfzByHyHiKrk5/ATeCDPG
         RV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756885137; x=1757489937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzDrLtK3tVYXpgajpgV5xkfeNF5cniPAFxRcbhLkKq4=;
        b=cPUTLp+2zA6RaXnyHRL6HZAfEhJSCOdeNWyPG2up7h6hfnRgXHOUXO9jf6Ovt59W4D
         9XID0HqUp+xfphEcUriSK9ntgVnsMAy8ZFXG36j5Fx1SnMx0t/6yBO+g1LxAjDPyu960
         A0eVUMXqVLHe2dT4Yu+/Imz4kBMRta1bcLwCLdgN5dHUTmUiJjITgMqG4HCavJkhX1VX
         O6HhrYV/Z1+z2QRxiNe1LQoE2x+frRvFxE5IbyT6GdosGWmN1TC2+bMYqr4TfhqEgmYa
         vm7V9jsKklK0/iVnuV6DChcACrTHuXR+EIqeUxFeGHcX9au9n2GDiCGWlO/n5FwJ0+AN
         gjrw==
X-Forwarded-Encrypted: i=1; AJvYcCXjuQjoQTB3d8U3kq0LLOl3hUthiL3hBAcav04DsLmXaynsPfRZWZ5ygMT47qDp/dY5iKcYNYc/emmJQMHcaJub@lists.infradead.org
X-Gm-Message-State: AOJu0Yxji16yovLUwvBzLgGBRpm51aaBW7pz1cOFlYnE4RnNmwGd2Y/w
	D296n3O71nYXg59k1t6EBUGlIX6TtoEUhQxFThwWqY0NyAwLy1mHqRcKaodDhjXrliM=
X-Gm-Gg: ASbGnctnmtzSuxYToPQlXU8P/Y/PO7F+T2YQ2cxy3qGOnaGSPW9WhygkWoCbLQE6o/9
	rjcPOIVvrykpg2pqCc8VuYgPmhVs7TO0nb+ph4+9tbvvso/p8DwkaKzBh1VE2dWTrGqcrsPPQKZ
	8+4mWet1g/UqTJEgcPXfLWoKQb+HBKzjx1S+X0CLbSyIY8ybTgBX882dGpVXM/qOMPSqQHE241J
	LiJNxYGXrgTTeaJES7g1d3wL08w2cfoUXvxmvwJoMWGD45e2xz6slQw/B47e9cdwAxBh5Wy14Tp
	mzdhUQMGaK9E4GuDP7s1oxpzC6NvOd6roKBhopYXH+p6ZiQHCUXBNcOXN6Nor2TxFDR6WdO51Kj
	PYskoof07+5svY5ovqh082mWFC11XBp/O6Q==
X-Google-Smtp-Source: AGHT+IGzMNTEASi0Qi6RgPFb9XAbV8YDnYAnOHuJi0TADIjDiS29XexXLdCQiRjZjgcY+IsF0TsvRA==
X-Received: by 2002:a05:600c:3b29:b0:45b:6269:d257 with SMTP id 5b1f17b1804b1-45b855c428fmr121644965e9.35.1756885137007;
        Wed, 03 Sep 2025 00:38:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d53fda847dsm13417216f8f.0.2025.09.03.00.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:38:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 0/6] gpio: remove references to gpio_chip::base from debugfs callbacks
Date: Wed,  3 Sep 2025 09:38:52 +0200
Message-ID: <175688512869.10115.2172054090244481140.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_003858_671696_B3BC3F08 
X-CRM114-Status: UNSURE (   7.69  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 26 Aug 2025 11:54:34 +0200, Bartosz Golaszewski wrote:
> We've stopped displaying the global GPIO numbers from core GPIOLIB
> debugfs callbacks. Start dropping it from drivers too.
> 
> 

Applied, thanks!

[1/6] gpio: stmpe: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/246b889c704e3209050eb0aa5a3733564aee1b38
[2/6] gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/ddeb66d2cb10f03a43d97a0ff2c3869d1951c87d
[3/6] gpio: wm831x: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/3767426b234f0d7b82ccfa05e53c47c83e0a12c2
[4/6] gpio: wm8994: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/aaa1279b8b5b46cc42b6175c2bcd83d8ac5fd2b3
[5/6] gpio: mvebu: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/2d71156cfea8391625ea146eff32b3d2ef059345
[6/6] gpio: xra1403: don't print out global GPIO numbers in debugfs callbacks
      https://git.kernel.org/brgl/linux/c/3be2d43534aab7291b59c4e66526f911854aa3a7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

