Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC93C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1SW841llZ/TeEXc7OtrdGQp8Q6S49QXPRYgXl1e+Uc=; b=Qpubvzk92UfBjM2TCActFIR8oX
	AfbdGcQAoXPFkpXcgDt+yWjA60H89dM1oSwVGnHKJvoLkrN0Sy8eJmHq4D3Nhs5e3HaX8vUMdoS0j
	1nthFdN1Cs3OLZ3oaXXSOYNDt9TeZvP7itLT3ZtqBfScE89bfRLEntimZ3rVmZ6OLYzJwZembitoL
	BI72pU5w3AfLVkl/ZtcZPynVRy5xA4skTgOtep/1PVd2nd2QB9Q5lE48xuU/xdx/rzCmlRb33k0Sk
	EJuYjmzRAQi70BP7kLq/iZYu22dMROMYmrLU9ck8OuCoQNnL1pmPlTAXy7uRu0fSxpwcIYe/9IOqQ
	KWWQnKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAKW-0000000FYkm-3kV6;
	Thu, 05 Jun 2025 13:08:24 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNACB-0000000FXRf-14gM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 12:59:48 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5533303070cso1058585e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 05:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128385; x=1749733185; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1SW841llZ/TeEXc7OtrdGQp8Q6S49QXPRYgXl1e+Uc=;
        b=vBLI6q2erBuBQ5NO0gflnF0iai07bd4AP5zGnk/Kno7/pLK8R8gJR1nFt1uxT5Zk7Q
         dFemGmZxcJpz7l1/bbc9RJAC5IYYo6PjmZcxqW7/86TmZis/UFwKvPPQdyWEvZ6Wwkec
         igSlg8O9OKGgVSCct4uM3VWEF4zC0PAXwDm3c+Dtl2HFxrEsHzzNhmf/4la6zNIIOj0t
         463mPrNvbelLv66jDFv0QFwuQj/SWspimUziENio6GtmeholPKJkdelZsLWWz3SRMQOH
         7LVMvxfbfpzspgs+tUdO4y75o0BPElvAbEpB9xobieErnef5rFXWYSfwcOUlrYs9gmQN
         G9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128385; x=1749733185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1SW841llZ/TeEXc7OtrdGQp8Q6S49QXPRYgXl1e+Uc=;
        b=JYaocv3kccGMt9MuS/uQqO3jji51X1m0Tz36hXOoRWAnz4htxgLyVJpmHU7MHZP5uO
         iLKafHwDBnwWzNvbrylV00Yn89LlU2ZpQR6/ILEmlAVu9+mIPOUvUsbovjGycZRivfaG
         vdukQ/+oq2Wosxzy59l3rD/iMDCrwUOgGLC/vG+ppfbAdxwT6D32ZXJIE3ZU7OrwCJIG
         0YsTbnah9eGmbf8RJaPNh6r0T47z6X69u5lbkL+HQc9ZCimvmj9L4U2qsoQw1m96cn1P
         xtkenitbxbEjdwav6/KZb1HH2fg438yPhZ7ZUsk+NTJF0pyGS3rESq7xr5cGFQZ2uQQ1
         eKQg==
X-Forwarded-Encrypted: i=1; AJvYcCXBUzXiQgRQi5tO8OcqCMiaYLcF3/+T0rAHctJW/xsdRpAyfTi5aQ7fWTNjaLrkZgRBhMKQQh2IU3NntfJGPIsD@lists.infradead.org
X-Gm-Message-State: AOJu0YyTCxiSPTLOUR9jv51EEn1ImNUQgN6HfECkHYLt+cphbcByCqmn
	jefvL8yCl4kfK+TjnE/7NqcRV9qqckMQDTjGGBUs/G8aA0L4HMB0zSL4Wa6DXfhoPwN9WFr1Fku
	a4xag+OTSgHEnpN2NdtMbDcjSlJQv+QBvuVknHJ8omw==
X-Gm-Gg: ASbGncs/Ctv3LkgesWnZvekF0g9Uiz4qC/sV/3XgBqvk4lHWTbJShg4btsVm0FOCGo1
	5OGCWiFXKoL7lJPjeOwXQb9FYj6YNQsS9u/pgVlIEAhvtJzj/5FYbsuaH8+ETsYAbIom9QxWlkr
	2QPh0ecQUt/HSoGtnuc96OS4u69+hK1VP6mS3FBNZ60wk=
X-Google-Smtp-Source: AGHT+IFCavHF9adGcVmqAC/SJ2B/xxLRQCctMY8xdnqc9im25wwFXVUPSZMsCxZi+sqtxi8x7B4+E8N2egCUTx7o6NA=
X-Received: by 2002:a05:6512:2399:b0:553:3028:75bd with SMTP id
 2adb3069b0e04-55356df25f4mr1863539e87.49.1749128385410; Thu, 05 Jun 2025
 05:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com> <20250528-hdp-upstream-v4-1-7e9b3ad2036d@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-1-7e9b3ad2036d@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:59:34 +0200
X-Gm-Features: AX0GCFu6YXXSfinnPxm6al8Hk87Fy7463uSEHIJGoc535sekNRVPuuiSEP4FOgU
Message-ID: <CACRpkdYfU0xGAWwjJVaDLS_QjT2jjVZouQ4bVU8gqMkfEc05Bg@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_055947_295163_B06E45C2 
X-CRM114-Status: GOOD (  11.82  )
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

On Wed, May 28, 2025 at 3:33=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> When using bgpio_init with a gpiochip acting as a GPO (output only), the
> gpiochip ops `direction_input` was set to `bgpio_simple_dir_in` by
> default but we have no input ability.
>
> Adding this flag allows to set a valid ops for the `direction_output`
> ops without setting a valid ops for `direction_input` by default.
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

