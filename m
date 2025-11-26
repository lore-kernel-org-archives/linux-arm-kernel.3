Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC92D10F5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iShVpMsKdlvrDy6nBGqRWxWtNhTSx16JoMiKyv03HZ8=; b=iWdBOY6nz+aScyskS2vjz0+Y1Q
	/YVN6oEspmlDAWX+dpDX+WlHJsvVepQAT0ZXbiFvxYXrGL3eurXLsfP3owVSAqNGcoEr5jIR+9Hmz
	faSwcU3RKvNz7/vRpI4/+VGVyNu/qpGhCbclUB7YxDrOHnB8LGlpklxdJ17Riz+TOAUWl0AWHtbNc
	UCWLJe6kVczwl8HwIPtEL0Cp/SbApMW7JNDvhMDAoTJMqvjbobLkYNPXrqwqoyo5UA6pf70M6MbyW
	Qc+rsNy9TT1gsZ4NFXwR/U8/+V3Fh4EjtQm8KyT9MGhbUJFmthMQHuKcGnlWBRLLxLTSfJwrTViFq
	YrsX252g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHWr-0000000FBjC-3rIH;
	Wed, 26 Nov 2025 15:34:01 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHWp-0000000FBia-2AMZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 15:34:01 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-37b9d8122fdso57767451fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 07:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764171237; x=1764776037; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iShVpMsKdlvrDy6nBGqRWxWtNhTSx16JoMiKyv03HZ8=;
        b=nyiq47Hl0hvOp2jBAjiJZbwu0qHvdjI8IOy2/KEUGSg7eH3HmGd7rPOrZOXLbvZO/Z
         kXblLUUgqdGodV0eF9iiS23h2jw4FhQr6itoRpAjIaQu75Tjvn/j1YjQBWJdKLdCnA8k
         91KH+hA3F82YfAh99nIqGDN51Q/S5/OnZsELRrNQ0GuvjBxNeVEsIuEfK7dr/vuUtGl7
         3Is+kbzxHK2EJ2cBg6xoHHYc5JI5WJpW1b5oo+yM/vXz8kUMsjp7TGW6s3YbO2JYMQdq
         efpb3oZXhEQ3ZDSPPXhebEcylCZKeDyRP3BRPb6cQ0Ylkhmi+SnE6/ZzBfMV2jntECoz
         1MBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764171237; x=1764776037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iShVpMsKdlvrDy6nBGqRWxWtNhTSx16JoMiKyv03HZ8=;
        b=MOckl3JoQS+16bKfewS/NEys4VY9S+F/FyVhQ0OikNVQcr/5ow6zFIVdYvIc4/Rh7a
         gxm/nlDMq9ZuVMEXAc3/R1SlDfiwDKQQELh++bOLj5ePfKiQdZLhijDwuS4BiXTZtCh5
         K6PqWEbYABh2ThKhlv5wmqlR1yeV3SwQOFS4XpuPMe0BurA4Y68bBsCNHwvEtHvMY9Zj
         b+h9xCFstAc2Q9/ZZX2HZuZW3aZTnFiTbUzR5l6EdeAW65c2dVh265vC1SolLzce2k+f
         6b5+bakSTmICvrCcJvqfXRFPGjp8kGbTCVdKJi93pcbVY18TiiHTenrSX6d3OIc/vB4i
         eLtw==
X-Forwarded-Encrypted: i=1; AJvYcCWOVz3FSNhAFQUPRq+i2ZPiPl/Sq57ZCuwejurd21+LTh0GVM/PBp+BgygDMEbaSGCjQ0vnvuZu19DguadT/ra9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj5f3hIWigKbeNKIAgvswK0fMtHjopVP/VoZHCUVRPkaGkzK5L
	X3/Aqwij7wINLB1nvtKmAoT4PQxk5ZOu3yTNIArgtWBUcbUJlFy2ZSeMYDy/m/ZaIbG+DwA4q9D
	kX7kDtUwoODsnTzeQ3dtxW/zafH8Z8khPzFCKgK3ZBQ==
X-Gm-Gg: ASbGncuZPL151935AkbyGFxKCt0cBNhYm/WYy9ZBWa+iG0eeg1BAJ3hlX+zwrX0GAd9
	dvIPSV8MKv/OxO4vZdIzovNViH4Ydjvjs/6cwcFVjhv87OGsGjs6Ju4TAMH7SwcLJTLouynE6ky
	uHushRwN0hv/UyfflTp90LwvhHUxa4pJQupeljSaNsWqIHyOu6sGZvPF4YbRjL7nAirRkqAjbpn
	DAtdVKZCsF7rMxb44u6GWREZ6JppQyGy/sGh4SVddbpsuOqnXDj27UKk6U1e6HFh2zS2wxnoqs0
	h82Sy2ku7bOalMPk7MMm0DgBPF0=
X-Google-Smtp-Source: AGHT+IHpiJdAZcmd7ay5hxpzMSKF161dOYZF4eYXQjGHf0aIOIU5+E3pjAtawzgBqB2Cu4BXgwWds+NFi8l3GMK+YEQ=
X-Received: by 2002:a2e:6e0e:0:b0:37a:4714:ff39 with SMTP id
 38308e7fff4ca-37cd923e013mr51455941fa.23.1764171237355; Wed, 26 Nov 2025
 07:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
 <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
 <705186a9-a9db-46f0-bf2b-b499def050dd@nvidia.com> <CAMRc=MdQ8QgbdAd2sudZLgcDZu9DxBRJh5sfLeXwcTDEE0F7Uw@mail.gmail.com>
 <c4081961-0875-4a2d-ac84-40df128534e7@nvidia.com>
In-Reply-To: <c4081961-0875-4a2d-ac84-40df128534e7@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 16:33:45 +0100
X-Gm-Features: AWmQ_bmsAdHo5JAtQV4uhxKNZhn_21Nb7ErF3vgXJlQ_8wKth0d2tGKqeTK5e-w
Message-ID: <CAMRc=McSrKgL=q8xfH_Vndg7rCfy1TVgRh+dFRqFCiBwT_J2yw@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_073359_820872_8B6E0702 
X-CRM114-Status: GOOD (  13.39  )
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

On Wed, Nov 26, 2025 at 4:29=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> >>
> >
> > Is the device-tree used here upstream? Can you enable DEBUG_GPIO in
> > Kconfig and post the entire kernel log on pastebin?
>
> The kernel log is here: https://pastebin.com/7rBh3T3T

This is not telling me much, can you try again with the printk() I
posted earlier, please?

Bart

