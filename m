Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC018CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7m+Z48htqbSeqaszf53BBB8XMcsMLgtn18U/+YXKB3U=; b=a14iDtasjvOdeRqsoX9m8+ZUMl
	8V8MNjJpTHHZXIxATvds8+lncOqT8+UpOAT3ySmgbU5X1/nogXvzW2qOtFVj8ItVdZ0QpfJKgv6s0
	Db5VN32+m8TqP4FFgXJqtbSOhQoCoXiRuBsFtZPPED1YRm446l4+yAUJadeFu0GF+eiwDuKHST3vO
	w2I/Jgdzpa66EtVOGfSMlyCf8GvQDMd22xWR2mY1JGg8+4bqnNyvzQyMT9ZT8KYFfpHHSMtMopXWU
	TKfkzAFgOhkH8yFjB+NLFHZFiDdphaDVbbD7xVoOg/Bb0Bu6Zob16fmyMZZ/TBePOdkcw7PFsIE0q
	C/2nKT+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm1F-00000003fnX-0Mk4;
	Thu, 28 Aug 2025 23:27:01 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjpP-00000003ISV-05xS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 21:06:41 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-55f4cf36c00so1516193e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 14:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756415197; x=1757019997; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7m+Z48htqbSeqaszf53BBB8XMcsMLgtn18U/+YXKB3U=;
        b=B7FVS1gsnP2lvG1PplJC/Su5CeEN++J4CieOA0zbAm/H02djt3h8jUv5NZ0ANbmqAY
         bdg8SNp1Z02p4tu4YAGvCd/mHxArtW0437GHPEphFqFE9VDUO5thFtyjhDydWrwP9CIv
         FoUX3+5mPIAU2ALhSL3ufKmz1imT+XAJf6B0hp6zHIIDZGopqs4UhGs36ogEUlIjImRe
         ilb0EhH52FPprVms9XVT++rl3EnsH5TCgTO9mwmmU5/2/0H6hux1xQwv+3NaUgiEge1c
         f24E8bzMvrbA51LtRhcx/SZoc/IiigSmf1c+d80ProBawtMPjy+wL9sQ/cbNmQbPYiHn
         XNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756415197; x=1757019997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m+Z48htqbSeqaszf53BBB8XMcsMLgtn18U/+YXKB3U=;
        b=PTLnh02YNpbiloKASbYlnt4HvVLeODRgXRMUCoBzRqiUCJIZQyEb0tJ7YE8J0W4cgB
         cUinHTeeNqKVpsNz56Xt0RO4gGSkgOP81hLpXVD5zqTzDGf26tbVhuroHe8D3WZ36dAV
         m7NdkMdtyVOfgV9pIcG4UR0pZw5jL/PYg4kgPj9ryYsEeLTDVLRFxDDmeo0BNBw2Bwvq
         8gF2YSKY0oGPCTeA5S1CaYQyY7arRgF/PdV1o8ipkx7/IdFuMwfdcFQ1AoSfbisN1a4k
         8stmi1SQrIyXQ6Vk52m9Sx4rgTkScf9FeGVLb2g9OTva/JnwcN2RZKzS6Q3UlBcY9uce
         u/gA==
X-Forwarded-Encrypted: i=1; AJvYcCWKcytMlGfMX7h9dMk0uJaRIGXIWxk8LrZxRcDXsfeni7gAJFoyJMlW/MHme15f4hc3r2zDvw3naqprPs13AhY6@lists.infradead.org
X-Gm-Message-State: AOJu0YwjCQsNBoY1K/jRimMoU7Q3LfepXZOZzkgmEw8Du66/Z1HUPG2y
	NKv+nwycjWQqSz9Db73SEIL5l7FogB3ySM9+v+xNmmVzqcrvwfrVOg2RDIRJEqM61uTDMU58OFr
	7KxG0pwo1Iv2KE9d55YD9HG4yY+t5i2O2y7Ppl8yXqg==
X-Gm-Gg: ASbGncuVbsU5E5jDHGb7JavnHJOcNJFK6N7HO4VikVXQNI1owWsLeMHCUOhqdpdYkZx
	RwmdvWGmwcpv+ziA2zs5LxnZRl8Z6+LRXW14Vw1vMGwkWku1DuYTKra7dWndJ96GfEjcukfjw5N
	4Fl6+487bgdCTdK/Zqs+HG08TT+81TLTRt4xrnLHP4fu5t3INzOJazqmlx2KwH+p3djjsziOvI9
	vSaXWilmwAb3sTDTQ==
X-Google-Smtp-Source: AGHT+IE8AFltVgez4j91MqcXLZUWY1SjsHiyvDbOchLsj0qPF+cSQKWQwUdlDcjOa51JtKhpYUq7h1LMip4AqNUm6Pk=
X-Received: by 2002:a05:6512:1356:b0:55f:3b94:2119 with SMTP id
 2adb3069b0e04-55f5f08b2aemr1135534e87.45.1756415197186; Thu, 28 Aug 2025
 14:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250821233335.1707559-1-da@libre.computer>
In-Reply-To: <20250821233335.1707559-1-da@libre.computer>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 23:06:25 +0200
X-Gm-Features: Ac12FXxq8e0j1LLbbJOtWrnp5TZSIUBHLi0lcAdK8TiCnwMxmLVQkeLVBf3QIC8
Message-ID: <CACRpkdYMdF43s_hcAvzHJ+wmRGyLoHtiTaG03ULoL24WwdQCMg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-gxl: add missing i2c_d pinmux
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_140639_066615_0E69D18B 
X-CRM114-Status: UNSURE (   8.82  )
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

On Fri, Aug 22, 2025 at 1:33=E2=80=AFAM Da Xue <da@libre.computer> wrote:

> Amlogic GXL has 4 I2C attached to gpio-periphs. I2C_D is on GPIOX_10/11.
>
> Add the relevant func 3 pinmux per the datasheet for S805X/S905X/S905D.
>
> Fixes: 0f15f500ff2c ("pinctrl: meson: Add GXL pinctrl definitions")
> Signed-off-by: Da Xue <da@libre.computer>

Patch applied.

Yours,
Linus Walleij

