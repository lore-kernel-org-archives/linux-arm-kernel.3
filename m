Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439CFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPPsVA86aRMmKsehM2IabqFVi4bzGyyaypZ1MvkVduM=; b=nlva1JKcgwllZIcArk6vJpu+tX
	ZPD3SEdikXaS59yjH7KBG5NOHIdxeIeKUKhHkbNWVFiHH469q4QHrDh/gGFLX6VNA+Vf4pV6NGPrh
	KreyFa7c2ASBwMgtXv5/CRLZ+upjPYQfnjROgzcGErHCKrdiq9ZP53vMD+JKwEUCV3nyNm3rhfP7B
	40nAvVHrL8YCRT/J8ZBsZwWbW549gLW1VLy9h5ipy0H943mAoUYRFytNUfcg9CS7NxXLdRNyHidhi
	+mXbQzF6i2lLbSBnMAEbM5GJYIVFTMgpzillgdpwhmWBckrSGRQ65RoAHQqVvOUNtUmXw0oKrafCJ
	V3pzIN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bAk-00000004tlG-3lyH;
	Tue, 15 Apr 2025 07:57:34 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4auG-00000004q3q-0Dza
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 07:40:33 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so45361771fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 00:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702830; x=1745307630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPPsVA86aRMmKsehM2IabqFVi4bzGyyaypZ1MvkVduM=;
        b=qJAc7EztUIIBe7cgH6F0q8w8tDS20MtbobN7QYaTiYSP87iQlb2cVDFh9AfAWIGLZC
         8VxEdhJjegCBzRer31iKvEGjuggbLBHok8egtSWeXSi1SnrOHtr77ZtcyFZSFnx6qGP3
         uVq9kl9xAbjIXqtaOAzUPsXliLXqdLSVmZ51Vku6ckTnggItyic1O3PP8yWbcCWM1zRx
         h1H51Ba0q4Y+ponVDjR5p++c+hQhNIFVyhGySXUkvRj6ZAJutE+Xu67ehZ4twxZTcfF3
         YUzxy13eGOxAnqCJz1R9ifWAhmQwIX85uKn2SnntbAitFfZDwWblMK8Px/nUWpOlcDxe
         hgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702830; x=1745307630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPPsVA86aRMmKsehM2IabqFVi4bzGyyaypZ1MvkVduM=;
        b=PQCswmdYuzDGGHrTBwp04Jmu3AzoV/814KYSAtypktk/cb0ZDqJ31spyEPeQejQ3+D
         cTbegSe14qCGycOsFp8GS3oQHmMkU1jae7aHIaW1b9VEn7hLQ98q+HYlofnoL29aqC+C
         9zLb+7J8tSj/IYbxieqn/bjXyazefhtW073ZEW8UHVFCPA5dEJXyyRhZv1PXvYOycR9C
         j/3dvuhyHrO3qCchC/79i8CZRGAyfOvuaUcrm1prHpnAckqi7QFWrNVwPjHkRVS9Twbk
         cC0I5mvCi+cGxbeQSfEIPAvIH6F1f6CTokRZMBDWODBZgeEUvYAkUoOJ8emacoFrqveL
         8miA==
X-Forwarded-Encrypted: i=1; AJvYcCUFRgwtusD0UwNqAyeYxc8BK4faSZGQBw+mjpMy5o21flUqZ6sIWpWh9mkdLgUHpSoGUYOXVN3F4WW/awNNao3a@lists.infradead.org
X-Gm-Message-State: AOJu0YyO8Ikk2XUqGc5+EBcyjbCf4KHYyxirZPX0zJfJG2zNo4kohSUN
	g1ituY7EfGjhQe4wiZhA5nQTFkmJA7is5zsmAAi68YXr0ov9CerVsjZemIuUrogiqfQuPT94Stl
	VGfa0COP45dTJKc6M0mu8Bml6NHIAWVuS6XJnUg==
X-Gm-Gg: ASbGncswjYzOo0rX41KrwXe4Uas/xkL3Tl3ifN/KmPHzo//koMknNXvZC1GbNgdqQTB
	wGgfl8UiGiQEsEjiMt0f7RgLL2K9clOVS4N4DDWiIviVWqvyaRXBV3lhq7vOpiC/7NGmSYtqvL6
	/cBDtM3h30A1s5+oc72vH4aMdAnjo64hjX
X-Google-Smtp-Source: AGHT+IFWYF5PBFz8bdBMKs/hFSmP9qdyePV80JdSmzpOU6YbNPT0plMuK8UpwqvumIMhMZzLrddrNlq7JqXr9GLcwmY=
X-Received: by 2002:a2e:9214:0:b0:30c:3099:13d0 with SMTP id
 38308e7fff4ca-31049a01919mr40215891fa.21.1744702830214; Tue, 15 Apr 2025
 00:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com> <20250403-a5-pinctrl-v3-1-a8c067e22295@amlogic.com>
In-Reply-To: <20250403-a5-pinctrl-v3-1-a8c067e22295@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:40:18 +0200
X-Gm-Features: ATxdqUGH5zAtbvjbTyVv3OZBDQWbnPFIqXVT2OLZ9OTJTUgQ_9-qW1g1gPLhhII
Message-ID: <CACRpkdZATVbE8nrk7_B2jE7MOqqeruV25mRdZaXdGNJ_kh1S1w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A5
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_004032_092843_FD8A5854 
X-CRM114-Status: UNSURE (   9.18  )
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

Hi Xianwei,

On Thu, Apr 3, 2025 at 10:33=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Amlogic A5 SoCs uses the same pintrl controller as A4 SoCs. There is
> no need for an extra compatible line in the driver, but add A5
> compatible line for documentation.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patch applied!

Please funnel 2/2 through the SoC tree.

Yours,
Linus Walleij

