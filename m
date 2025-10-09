Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2422ACCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 10:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SO/OcY1CO73Q6LYMqOLX5PvBUeNoOpjpPrCz+L7Phi8=; b=VMtq3oV6crwoI0CCyhyhNukcGh
	JNpzkQ8f6iti0/07DuSYA89MbwDsO5pcVVU9vGcFefVn9s1TzI+hvVUbajBpUsFAVLexav3XBD+kt
	66xq1Vr9Adjk0o7t5XmDIiSdcZal8aMWIIt2g/0zBsEtDTDPgCiWMlWKQSI/tyMfTyk14OEQTdqmf
	mF6ChjvWWaNWeA+iwtttddW4fETeX9CMH3CxLDPNGxoj46FV9Jtx8wRZFMimRm4Y6JdvmhNVlchrg
	10zPMgc/QIETvEkdQQHkA95Apqi363lBjWj7ymAbhBm0+U1V/vZtD+V4tKBsDy9FxMe8UEck1bSuw
	fnbLoZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ndS-00000005kz5-3v8A;
	Thu, 09 Oct 2025 10:12:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ndQ-00000005kyf-1PTw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 10:12:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46faa5b0372so5027555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760004750; x=1760609550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SO/OcY1CO73Q6LYMqOLX5PvBUeNoOpjpPrCz+L7Phi8=;
        b=hG42ohlN97TH7bLnPH/9Ezz6/+vWutH4oUXtc5e5YSz9fPOWLoBvkODA6PI8cCoFvc
         ROjBrDRSFpFrBnb5e1sbRCPRCV8ZEc3Bbej4fu3PFbDZdjdY25ra3epS78aYGuqKmB7b
         XWPwmGFEP5GcZbxg3TZ/n2Ex9xNeI4X7UVb/Ikb0IOWDMTk3hMKISugTP5LUorFyewys
         j1clsU/LI6KvAuLs08H/iYA47N0w8QopTfsNtXVrEiNiz+yvjF4QBvsTbTg51VUQbja2
         ySBGY4zVja9u1uuligQsVOm6KDdajgnywbJBGLc7+5r/QJj5QARKXGYQkP57Qw86lU4h
         Ta6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760004750; x=1760609550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SO/OcY1CO73Q6LYMqOLX5PvBUeNoOpjpPrCz+L7Phi8=;
        b=I9EIGixLkPo48sZbF6AnLG1dFa1UeuOMSTCXI8iADHsiSCkwCOkzwFGc1YE1qbai97
         zuszmfzVlbqExnV6AcnbmRoex9LFsGGYcUfTeb/sP+q4nNySZfSWLdf3p6LjhMAlcAVZ
         XAfpeXdQWrbH6X4Y4U2WUSlBM6T7ht9XwpNvvL42a0A+yzWgPZ1MJDTXhamSpcZbFqI3
         be6Loa1knf2q921nV/AGz6g3FBwZab+sJk9LJ7p/WXo90VGIfI8B6MbBDYRMuI/dRV2t
         +hKcBSn/fxCg4K+LhB5I9bVefsw8f+8A2psVWibIsbEeRsApQVHoo5wD/dkgrk+VBM6L
         IkLg==
X-Forwarded-Encrypted: i=1; AJvYcCUsEEw59lRV1X0JtCy8yK6Pw9dFB1xA/Fn7TBmpCRBOYSdjMxRQT68cC1uBn5ffvdz1PSPER2J0m3LZQP/jI8OL@lists.infradead.org
X-Gm-Message-State: AOJu0YxO/FkFUfMSFDkyligLSEwM51PeP1UixuKLPDyGDNYIbGIA1LzS
	1vmO8ZRTG1bOX+qzDmOEZPQzI/0PE4mhZ7sAYT3WAhT1ZwuDzUK+lzk5b8lWwI5rOtg=
X-Gm-Gg: ASbGncu72XgIITyAuF5X5oYn0IqeKX/2lkYkIGORB6a68VCfpn2sJ06yAS1Yq9z/gxq
	b+2+AEbFTcKtexwxPDqy736usxDWbqYAbON2jqt716P0shuieBAHAao6MPB7qzxt0g4a/p6LJc0
	JIzHZFCdh9+V81HZRSzyLmjSMjbFoa8cgXOJhVvfEd/ukMRvlg2t8gEoVSAlNlibBRl3bDDCdfb
	BfSEcmENO+tOCobrqOfcMv03/s6gqfnBd2TtgWm87StLIZElmTi51yLnFcJilAQTj98JqX8sSra
	cRSLWdCg+QzsAGar6rCOVVogD99KqCXsa4PeuyvM4QUXXzeAn8zl3lF0mBIUFDsYIvBe375drYq
	WBSisU1Ffop4JgH2H10KHFPwmrQnrVeFT4MfAPLipVkZbbNA=
X-Google-Smtp-Source: AGHT+IG9djRtuVw+ie4GfUE2fCKVw3VDvAD/MGwTeuRqIhTj3DidnkwSdyN5TC7cZH1+rVL/DgOUoQ==
X-Received: by 2002:a05:600c:4ed4:b0:45d:f88f:9304 with SMTP id 5b1f17b1804b1-46fa9b0e7b3mr50062135e9.30.1760004749930;
        Thu, 09 Oct 2025 03:12:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a78:91ac:9309:82b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab633badsm34723735e9.3.2025.10.09.03.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:12:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Date: Thu,  9 Oct 2025 12:12:27 +0200
Message-ID: <176000470857.91617.1046632810440589541.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_031232_412605_4D2D2148 
X-CRM114-Status: GOOD (  14.39  )
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


On Wed, 24 Sep 2025 16:51:28 +0200, Bartosz Golaszewski wrote:
> Here's a functional RFC for improving the handling of shared GPIOs in
> linux.
> 
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
> 
> [...]

I'm picking this one up for fixes as it addresses a locking bug.

[1/9] gpio: wcd934x: mark the GPIO controller as sleeping
      https://git.kernel.org/brgl/linux/c/83d314fac266a3d9de61e4a4490c4f2eafc86b05

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

