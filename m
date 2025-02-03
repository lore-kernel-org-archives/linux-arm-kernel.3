Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA683C02196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 08:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IIA2EevMgnUnT2y0Tcftlgxz2rZdSe6sO6t8T4gDhc=; b=fN5NBxrLUSfAZ6Cn0U10NN/1TW
	q8wvgKnijdNrdA0QwpCMFS/rAskiY2UpHeZufa672TbHta66Klm+kesVrGaVmWVBtDJyg4wPIIuhm
	HcdhY8PXyN4HQJ1SDNQlbrLQeA4MCiYAZrt7VhH1QmQOkif6hvw8q4a7F4MvgOtlUxJHhRr5Hcnt1
	jmVXR8jFYzY8PMApME9O/WGdyzjkT6gjEdJgaHDrsZhwj3ko2HxR9SJNomI1PmFVKpVcdX+wZldIi
	8ELEc6HsVOBfVLTu68dZ83PCUI5+5QclR2VNknmOSyxQQNrBbsAf+LOaaGvCJM7h5Bw+qCwo4vXnB
	dBrKXKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tereQ-0000000Eo0o-2UlX;
	Mon, 03 Feb 2025 08:17:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1terZq-0000000Emsf-49P0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 08:13:08 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-385e27c75f4so3414405f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 00:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738570385; x=1739175185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IIA2EevMgnUnT2y0Tcftlgxz2rZdSe6sO6t8T4gDhc=;
        b=ttfnnUgQvhUIt4LxjgolUhlhalz4Jdm1V2VPWKtx9vWwbujHQiv84D3lbZiOhsJfGH
         YLtB6FEKFulS3LWQcuIO6QJm0NhvWUjVpL5DDrkfEj5cBRTXfYrjnAVJs/So7mvO5KNt
         G003yr9sFiqgU1MhWsq6OaZHpgLY4Rtt064OXUUpdfKmOYKjV48wEhRQJn26J0uyn03Q
         Yhlhv1gjgs1qUna746Q3PWvRUOlk7BReENf7+eFfrMG4ygGMNzLiKEIfODZAGnoX25av
         vmmaMwl2jO8y2369pb98qeps5nypI8Z85ZhkAbNF60Wp1J8Ui8gFPGBEt7Otj80vajCz
         sHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738570385; x=1739175185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IIA2EevMgnUnT2y0Tcftlgxz2rZdSe6sO6t8T4gDhc=;
        b=MRurxmB+0lPOF32viZwiGUtrYYLREh/7UU/kOwet2GXqd585C4a2aqEW5/6+BmCxzv
         vRplxERncgjB3G/HlZ2dZJ9dUG5jaZ9Qg67UqHoFAId0uaZEXqM8GsLa+XMj9i76mGKY
         mPPwRcPB+7NsI+wYiQC7T7H8pZm+CDDOkcvBA9YA+pT3qSDuZbUbdbOUB5MLs36B/GJo
         aEDm9qnRenF7etYmI2myApIQeuK/yzTf2fIG1ncDPVDlFs1zycNmZ2gAYJmm7kkxGg01
         2IxX1ZSFqlJNenOHd81kIwKdYP+y2o+ZlCF7eSoug5IdvCXMeXZg+U1aYSJyql0DB731
         bsBA==
X-Forwarded-Encrypted: i=1; AJvYcCVQjazIZfgr8ild9xKaPk/cloEr6S5RHQqOTF2yb2aSR8+HDsLvHNWNHaSUYWKilP1Up8kHjG7cPXKYNQ9A5/lO@lists.infradead.org
X-Gm-Message-State: AOJu0YyiaeLL5sxtkCMHlzRLzfcVVbrcpohWgb2QGJ2LWp5BeYaXXHsI
	0Z1YnW/7rneDHUkuDxstKimweDssM7H6GfnHgRru7rQW4bVE71u0b2Vh2gSeihA=
X-Gm-Gg: ASbGnctYCkvi2hTyu11x5Pzz28Fl+VCPZmlPxcll1weBRVG698QyBCQ5W9k+ncTfLnh
	StmCzR9QPdK+mU51NgPojt6XP2QZQdzPwLdn5LpyBkXGgbkxgphJM5ekz3zpir1bWiEoxGbgBii
	hmhFJHZtCU5lD9kaERLfS32+Can9aCVmTWPotk3ZRdly0foeLjC5uc1WU4mrifE6zXe9eJ4r0GH
	2MotQrAUwe54PMx/2K2W/2HQdCepv/Ojwa5Y5zpLpFowYe1Im0QQB8C8ISI5FdcVheHMSM/fdoS
	GbtCFxwSnlCBvA==
X-Google-Smtp-Source: AGHT+IF3lNNZmS2B9T8gXfcE5kd5EuOjnSuh3iWUdY1d50Algj3kP3sHpQaRcW0lvgZf4+fEDGkUsw==
X-Received: by 2002:a05:6000:18a9:b0:385:df6d:6fc7 with SMTP id ffacd0b85a97d-38c51b5efb4mr18533137f8f.25.1738570385202;
        Mon, 03 Feb 2025 00:13:05 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:62d7:938e:c76:df44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b574fsm12019825f8f.70.2025.02.03.00.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:13:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Nandor Han <nandor.han@ge.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpio: Use str_enable_disable-like helpers
Date: Mon,  3 Feb 2025 09:13:02 +0100
Message-ID: <173857038027.20723.17081473974273068659.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
References: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_001307_032778_B18E3E2A 
X-CRM114-Status: UNSURE (   9.54  )
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


On Tue, 14 Jan 2025 20:14:38 +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> [...]

Applied, thanks!

[1/1] gpio: Use str_enable_disable-like helpers
      commit: de454ac4fc5a117a4264e8bdf60fca58021574b1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

