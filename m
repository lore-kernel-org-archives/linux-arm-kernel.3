Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33250C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=; b=rK1t1Aixo0x+8XcP8KPkOemRxT
	NHzYKg+UIv0X3B6TWZOI2rQMFV+nTWeZCsdr8Ad2NKxGzaPXdjzNmaAODwoUwdd/Rm1UkSSnbHtc6
	ILRyPz9t44wLmXaFE3fU5V9BET29oHTH8fhVqrXtDoWTmPIQqhpyLQE/FQ70fq3ZrneJDKDRJJkm2
	w2uBvxxMBQHhxCdVzyVojVTXGFXmNdfIchde264BDCtyQpsnLatRpF8iShe/Ov6p9VSRul0QXFsnz
	2pYpAForXyjNZfffes2CQJaLTi8AvTTk8kJz/fJA0UHSBjGVZL26g7CYE9TvSH6upajn7DsJgJVc3
	cOXxx2TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7o8-00000008JnP-2tpC;
	Tue, 10 Jun 2025 22:51:04 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP72f-00000008ALm-30gA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 22:02:03 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55324587a53so296715e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749592920; x=1750197720; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=fivpXqDnEwMYYCaDwwn3qaiLgkoEsadMB9SX2YN0Wy/jMw4Q0mDKIAQRRk3mHiNV8f
         ea+tLXxxojx8ZCcec05SXdQEsq0EgqPwjLAHQqwuA1UUYDu8HBtvdOyQO+65Y43YS8W0
         xKI5aTqgcJaC6/oc1UZ5w5wEC6oLVfjFhi6fgPAMCMJGuUTg3HiLEDh4C0VtGlORyNGb
         X7ykJj6JAyTeUB+Xjgw9SmZEqPfn+ymfJ08R3GkjSa/IidSa4tchqb2O1tSZUchIkdhu
         kxpL5ujgU8TP6zHIP6ryxST3W0NLPBZfBdmh3V1zbc1qYxB5PTHH05rT0GCE4UHLbSkK
         FvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749592920; x=1750197720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=w6XxEFMx8DkkCBM0RyN6xD4sHnSsOqGhA3+X07Nlcl5DQMN+sKE+L9SdRZ4K8xhGHv
         vWtHcUBIIeh92XgqVzLD09HC1pPFEH8knwEN+6N2cg9mm6xuKiOH8bEOvYaF3LJhG038
         LwUdC4N0Un3W7Fo2ID5vRSgq+r9WcN/MsPeSJ23rvDAPT6SxDsHYKkX10bQ+8Gtj+4lo
         xUqD9LtBNhaVYaOWUUXJ3r1Sf0KTNfaDzJxxhlFKjq71ltJeXViYwqf23QYTH600aAWP
         ALrfFU67Lbv2Lzt5xLJHplMPglKftzNP7XwnDQtvyo5n2yKLWBT3YTLG4uS7+pfd9gn4
         UG4g==
X-Forwarded-Encrypted: i=1; AJvYcCUklEcTBg+RGq6dDeAGYT6v/OwHAnO9bHYqqmjscvMAdWZO2HC5EnBtDnHr4zpTlhtfTHwkenLObtxKGQ/XL9Vk@lists.infradead.org
X-Gm-Message-State: AOJu0YwFdP0FDbQ0YuqN6tNp9Llgfc9lKkuWAqNSWP6kNcVeFMTvBKZu
	6xsvXCuDGFP5ezxd8meojD+HvSLw5w5RDuMP1znEZV/EEwl9BlAFCDEhRM3R/taZJnV570A8enK
	CA9aLpXeW5fwYw/dB+mgJuweukqf18ZO1/hIW1gveVw==
X-Gm-Gg: ASbGncv+qwMYS2l7oQQT4qSE4IBIDWWRsT3ad18xxEBL3jkhKuDQ0VeKV8hIwBPqumL
	6hev7ykhU3MRAewF8slYauakHzWtMKWxYk7mciMNSKHFCFqC7paPRhJxE2d4wfRfyObJ8ngisw3
	G8OwFpjOvZ8hPViCJwC1Pek14NLp3k3RmWZ6HTbS/Pe5Q=
X-Google-Smtp-Source: AGHT+IHHOhOUj30OWDDSx+2F42g2fLc3I9bcRSXhW2UcQzuablZdDsnZ46Wc3GihsOmkn7ZczCyHo2K03K0tk80OU04=
X-Received: by 2002:a05:6512:1504:10b0:551:f166:bbb with SMTP id
 2adb3069b0e04-5539c5ff09amr174150e87.13.1749592919907; Tue, 10 Jun 2025
 15:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:01:49 +0200
X-Gm-Features: AX0GCFufuH4LiWDSgWF_9h-zk6BcvJ0Do0hqFlGAZPq_9bZnp7tz4BcqtgZHIfw
Message-ID: <CACRpkdaK=Ua0=Jgnff4xXxVx9W=LcLg7RykR7CozhqtAb+8XQw@mail.gmail.com>
Subject: Re: [PATCH 02/12] gpio: mm-lantiq: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_150201_773080_965012EF 
X-CRM114-Status: UNSURE (   9.37  )
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

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

