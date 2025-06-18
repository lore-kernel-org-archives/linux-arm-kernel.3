Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07CFC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=; b=w4ZW2GJYTb/xwBBkmxhIuK5eXX
	h4eohIAWoQkIx7OlgHcJU3pdZP4CSLl4EiR0cA+wr1c0exPikoTsNmEhbVlmRDE+FhIpCRgy6HPuq
	SuEBHDpAOV9LzwuG7c5sNNHABaWRs0M4b/XXCuPgFqvEiobSe/vBOy6A4eNC94kmHjGVuFLqAisID
	MyLErey0XsxUGyXFK5B/l6s934Q5oF1JICrVfOBSFKTFwD1m2JvWuCTjG+86a9Lhta8XN7vPXLiBd
	qVSZzh01cyDY1DTrR/GGpsIvjvdK/+tAR7BrfANeVZcGZ0SywJtXhBhgVZgMfPCwRolLim8H330DX
	yb3PzMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsjv-0000000AHCj-30RZ;
	Wed, 18 Jun 2025 13:22:07 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrbP-0000000A4Xl-3lUC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:09:17 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5534edc646dso7282758e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248554; x=1750853354; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
        b=cuohZ2PX43z4AJzcJyTdWojadd6RRiscCqSzobxXPlkY4KzEsM4WICQIAPiIhdqM5U
         CIc4jF7BOYpWLLkonMM6dVePNwO4t8mTjIPygfvkVwYJ5xzd4Hg7hLx89zHviBkMkxea
         PH0JoS0MZ8iXxm3CHpAmmk54dceWzMIjq70KSBlbswoSktAzCxEEPYR8qv+o0h8sK+YD
         i/WFol0fGEEGnAPE0uCN1Cvvjuf3V0uknk2zhyW71FCpeB6hY3+SmNvZc8rt8JakBgbf
         rqFwQuoziI9dqd9CUgvpLFsfFfgMABWSKTthz1E7I4DCciPa0pipc51YABijb2/mjhui
         4oLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248554; x=1750853354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
        b=wI7DbfnKJ82j2ynpiyILmgPrylMbT/r0NtiqgqrIFxJU2pMPax3gEwey952cYuEYQE
         O48XfMsvgbRgBSHJWCtj+vloEflQ7U0lbWkORzw4ZxfTFKl4pokajODdYmv7M30jfEUI
         6ElpQwqajx0yg+aPll50VLJYrzwX1CxkgJkIShfVSEJm1I8wCMf7YCRkrT7xuAH9ndjg
         SxC8h7/cFRKZT3NorrHMA5tLvPoOgaShOGbxraGlfoGXUCmtKtd9PskCDE34BARVF4px
         /N7BSHLBrPDKI84Y8+ZFfhckCQx1DB09AJZXzVP3Qy4jQ+7hZcregYtdGVjTVLJzGvVs
         /biQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0j4WAw9HVXqdT9F6/Rj2pK5eIngisRMJ/fW2mNUpyASxddmggZfNKE8Utdw7ofd/ETW1hRfz8EWriVyZ9Vab4@lists.infradead.org
X-Gm-Message-State: AOJu0YwcwOWBE9M3ll+JZQhlJnW/aHLroUSoSR2ntYVoSYzqddDFrZyw
	Cvi4riBWbtwDT0y2V7QuKXrF1gBorg00ael0UV6yZvkLokdPVrk8JeYI5p5apqv6D3xt82rCUXE
	dxdvj3+TuXxZRRTh7h3VkdCdEGaFZ3UMrUT5bO72GGw==
X-Gm-Gg: ASbGncsWFHXFa9sxtGE5yrK98xib0IUzL7LWwlI4u+RdvTT0PNU5AX5J3x76Yi4cY+m
	ViRP38tFq+KNgEMdx5g4ojup+wQVuEf9E9jgtv65InQU9vdX7EyhdwfgVUWjLJx5XdYGHzA6PR1
	VYOJwu8Hds/S38fpHAnBZXsNwROdDq2CB/SrAQva6zp4w=
X-Google-Smtp-Source: AGHT+IGC0m4FXYYQm+k0AXFCSy3bx6F7/2cTaiKhBBnuAbB+6N8ybTZnHZCukOOueaHxtyfLbUpPRBURy2oO4IVfhl0=
X-Received: by 2002:a19:5f17:0:b0:553:ca33:46f with SMTP id
 2adb3069b0e04-553ca330808mr1234493e87.29.1750248554215; Wed, 18 Jun 2025
 05:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:09:03 +0200
X-Gm-Features: AX0GCFtzAwHH-ht5UUznh81aEY-DCCdnUYFURG79_8pBHXv4vb2M7QItIyT5tQE
Message-ID: <CACRpkdb3+uQ=PG+ne48hyvdTFeEQBxXtq3CwxpqEmd1m9o9fNA@mail.gmail.com>
Subject: Re: [PATCH 00/16] pinctrl: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, 
	Support Opensource <support.opensource@diasemi.com>, Baruch Siach <baruch@tkos.co.il>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_050915_942283_A1581017 
X-CRM114-Status: UNSURE (   9.24  )
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

On Thu, Jun 12, 2025 at 3:15=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts remaining pinctrl drivers that still use old APIs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij

