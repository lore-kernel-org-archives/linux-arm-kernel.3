Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2149EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/jHbf1z3/GwHh0dqw8iaphItBx/HLohsmLRkiqAGrw=; b=ZAsa4nLEYCx8aaNnw5YJ0YdQ9W
	RuQ2e0ymFA3Uo+sT+fdWtMvasTDaRCHnxBBjnp1rxWnTuUVqUwAnquzqhZQhn7kKJfzeTdsO5DVdN
	TNv829R3BU3WKbth8l0xJYGe//uKqIqR7wXl7Fnvhbfp1SjodUAQQzZOSLQjcPc5+twNCNk2yWzqR
	yclcE5QNJoL2CK2TRM3mgFBstH1Ejk36J4m6wqBur2UwnFI5JT0yIbGro/b12XfCdx3W7yeo4ZTZC
	qMy9Sx+yPYMst82P86SSb8wdBbh4jo+nUdIa1vbMol4PVQ8wutM+4nyKz0pC0nkwvqXx+9/qNOArG
	r4eVWFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAc2-0000000FdCe-0UVE;
	Thu, 05 Jun 2025 13:26:30 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNARm-0000000Faps-0s05
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:15:55 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54acc0cd458so1081839e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129352; x=1749734152; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/jHbf1z3/GwHh0dqw8iaphItBx/HLohsmLRkiqAGrw=;
        b=lvqKx/HtgKTIkvuY7BzArpX4JshYdZWTGQMH2MrZ30XbFmeMALSxtdrAhnc/vZrXh6
         y6NIBM8JX3U5w25GodNnMMDsSU3ZjjJIURrzNlPPXr/lEOhsW6VcO6n/5TuyEAedxIna
         kU7+b2V86hq/WKYQ09m3YO898Gc+HYVBPHHcqDfocJvE+P1stSS2P5TVWFqyK+L+VvvX
         xeC3+ZTwBq+IJXz8Mf1236ElOyeFxubYS2F7EOCSKRKEujPuPEfHe4QRhvJp1Ku/fziw
         EW44XbmvYuKD9dDMK9ms+0GQp3pJ6tKOWeFVO0/VLfZvVRVoHffM6ELTAoxAWqcUN2ke
         5rLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129352; x=1749734152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/jHbf1z3/GwHh0dqw8iaphItBx/HLohsmLRkiqAGrw=;
        b=jIdFNZWBVaXPBDCU/pT6mVMAyMlh2LALZGc8+suj1VmLtGSwFG8Fe9bsJfNE3jvnp6
         tkPfUzPfrOagaWPaTedVMAwBtKEHp1w4dYPpKRsPSo160g8bC/hxqM/D0HYORJZ2LBjt
         feddIZmkMnouFfMVgGcSdL0NrwBPCQaAcwe1/qS5vaUighJMmXFCrUishCGPCdeamjus
         IbUSD4ctCT8d9XMt1tH0JXcAdrtIyhzzNRPVCapq8H/0GLUZ/sztLBMApgOVt+DWIvkU
         yJcCXK3MHLQI7TFXUaWE62ra90zhO9CO9z0gqslrPULyAIQC/52waTaJo2DAaHAxDDH9
         AwAw==
X-Forwarded-Encrypted: i=1; AJvYcCVwx9CsGEz2Fv7jlMWTeC/8J+elevVr8L7L/4+KAaNs8BS5RyeCedmZIfpqaxJqNZBqQNQvM6Q6Jn1jC52rEufd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3FVp+pvEK9GJ0aeo6EQ5nAfz0nclzMVl9mLBRWRkFldkksXJj
	qV0+nIrXPnVkD57DXJnP8svAkZ7wGesVziXgLrZOBJUoGasVfUmGYUdTs6JwKjFuR30UBeTE7vJ
	BtS5kB1bwr9XLoYLcqtTNiPQhS5Zn9cgdDSO1QUIPzw==
X-Gm-Gg: ASbGncvEdEJ3oeUGWKhneYPa6MEphvI2RWx9behrMfzm+TePt3mPTgTfNjbY6nzoP1E
	NLnR6k0Ie4kq1+JzJkLkNN+rC0A3HJqPpxkJt0gSCJj+eaPx8863iN8SdYVexDbBpnlXI1xpzzN
	T0XmCLvGZSpju0b3rYsttshACx2DCx0HH7
X-Google-Smtp-Source: AGHT+IEtw+KFs74hmFMtpGQr1aKa935b0NpsGGWQpNnG5XrBRWdWQpRB3tC7HlaBnfp0RMDHb822Vw1dn34eoThSi1s=
X-Received: by 2002:a05:6512:3d9e:b0:553:2eff:8d74 with SMTP id
 2adb3069b0e04-55356c04ba8mr1984451e87.42.1749129352237; Thu, 05 Jun 2025
 06:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250528092201.52132-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250528092201.52132-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:15:40 +0200
X-Gm-Features: AX0GCFuNPPFv5Vg_JE6Z7nHnr_dSwu-FURjQf4TaIcbuLPNkU0UKRo1LK_MzVe8
Message-ID: <CACRpkdand3H_XzUk_hSXxstPhbdfxd-hUP-nZUcEe_Qa0D5j7A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: st: Drop unused st_gpio_bank() function
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Mark Brown <broonie@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_061554_245323_A7A5391F 
X-CRM114-Status: UNSURE (   8.19  )
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

On Wed, May 28, 2025 at 11:22=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Static inline st_gpio_bank() function is not referenced:
>
>   pinctrl-st.c:377:19: error: unused function 'st_gpio_bank' [-Werror,-Wu=
nused-function]
>
> Fixes: 701016c0cba5 ("pinctrl: st: Add pinctrl and pinconf support.")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied for fixes!

Yours,
Linus Walleij

