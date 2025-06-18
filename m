Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1909DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 09:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWFR3lJZvy4GZXmA1xUeMKYw+5FpI0OcmJNgyVyXgIw=; b=mvBXRRj89zvXf8i7vuxm3mmb9E
	huo67a/+cScKIWtDsHZ17d2Hhnjnta8Rl6oDOhFgiudCbagBf+HCKj6w512pX6WueXH8oYcYWFs4P
	+uTScp5/tdOJ1sr8CaBPxtL2/pfqjv1Uew+Xt28dzhw2gDRhSeMezqYWtILEaJDPLM4TuRP3DZp/s
	/bMeDK3sfnwZjJpyCFPa7iFf8qY+AoMdLL7FMwmNWfisq1FQAU53auxruHts1rAk0a+GD5PWgQRcP
	PFp7VRPF8WdyGRRQ2kTJrDsdbPPqYFK0BOGwbt8PPKrddWUNTjrwuj5HpypEdRcYMbjqXmLWm/s0y
	8gINuy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRp7S-00000009arv-2IKZ;
	Wed, 18 Jun 2025 09:30:10 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRp3v-00000009a6E-14Zo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 09:26:33 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5532a30ac45so532725e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 02:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750238789; x=1750843589; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWFR3lJZvy4GZXmA1xUeMKYw+5FpI0OcmJNgyVyXgIw=;
        b=kUrP0sx2/DMp+3d35ipFbA3kXtZjv7GG37rzHXJM4k82jE+j0cW9WrTOaTrLXbD2mj
         ePEvInp1F7uZN2eaIe5wlv4lgwkGMP8TuL0geDGT/AZ5zMKQIB9TJHe7KEgPtReTAywg
         FziVtzRRpu4HDOhhvjtVlHHQEFUyi3VXNc6l0nsSlziiA01N8Gzgkva1aOKjquS750gp
         xdT+K3kKGmBQqwG+mAsmAJTaTI9WnEwCX1dHoUUtthB7NizMviONDh9qhYeqM0qezmfH
         hx1ziRFJEGW+u+n5PzVAbQ13UEBdnMNzP6VuTyoSeLhWhvo6KQzEpHRzqM5u5gjssde8
         nwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238789; x=1750843589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWFR3lJZvy4GZXmA1xUeMKYw+5FpI0OcmJNgyVyXgIw=;
        b=Ah65TAYSC9+l5t6gnf+8nmYISoXZstnQrHX5rqep+WaEfJ7kFhG3Zid1RtwJZrSCP9
         cUvBU0E3FCYlA1+RiAXQqgtUlzsC4G7cYcnsXsqLbNv4s8/OX0MYKGPnbb3mlLy9FJIG
         199uovfuiP3/1Kn/tpi1yA6WVCXKoRGSoBJnWLNH4Ku0Mfon+ln7rQkA5AY4mrZ5xrRS
         BGxvht4Q3ockn2Epu8K3GSJV7Fu/iwOGojXkk/JYDlepbdajUY+qpU+H4G4Giu+HMI8T
         f1c02l0J3YtorcwOU4NYNlK9PXEZcOr8lRoY17lQiTXiB4HjpjC3kSEZjayiPQE6foXd
         pppQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMstgIU2eNwZjECOGzMPsdL2qXUdfyzDMYhtz14BjTf2JVvFG6+IzKPKFwmqgjoC+NSzpHUnBuTDvDbakcG6wV@lists.infradead.org
X-Gm-Message-State: AOJu0YxlmT1xziV20fGavs8xPtLHCUrsdP34145B+o8lU37vDv6jzTBG
	fZ6iAJlVoKB635QDQ3BOKo4c5Vjbof51EBZysLZT94mpvBYbDv47wpiFk6VxK9tO9FS012b8jMa
	hki7S6ixofErLWuQBIBkbWk2deGo2eb5euo8lhfSNXalBBaFplNEx
X-Gm-Gg: ASbGnctqAx7dsHkGG39yha/W9JKvJC5qUJvSnNVuhg8xhLT/xrlCfRIeFzPj4rEBJkh
	DEgpyyqVgnJWjUpcX9oRVO+S6u/tloOnTzYfGGM+szoOunQvaanMrKQT9tpATnh7+9TwrTBoXMO
	BNzmbDSJQnlYuQXg1e5JgHB8CD7UVsYy+XOQMJq8TdJLEHw07RDu26RA==
X-Google-Smtp-Source: AGHT+IGZulR1H9+iCIC55gEsLEoE0oqDCjkL5Fd28aQJZaej+7J7V66hn4S2QtWJZn/tk65wm8JptBmvBC8HG7edLQ4=
X-Received: by 2002:a05:6512:4023:b0:553:2375:c6e8 with SMTP id
 2adb3069b0e04-553d38bc9edmr644722e87.1.1750238782845; Wed, 18 Jun 2025
 02:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
In-Reply-To: <20250610152309.299438-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 11:26:11 +0200
X-Gm-Features: AX0GCFudSA6Ai2Ztyy99YXMMTippK2eV4K98kdxAH7hr-WIHL4mRq5_nr4kVdg8
Message-ID: <CACRpkdYy+sVQAdntEWMfJGqEzw+eexLGG6pXt8QVYD47rVzjdw@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 0/5] STM32 pinctrl: Add mux function RSVD
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_022631_848334_B6B4E57F 
X-CRM114-Status: UNSURE (   9.26  )
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

On Tue, Jun 10, 2025 at 5:24=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Antonio Borneo (3):
>   ARM: dts: stm32: Add pinmux for CM4 leds pins
>   ARM: dts: stm32: Add leds for CM4 on stm32mp15xx-ed1 and
>     stm32mp15xx-dkx

Please apply these two through the SoC tree.

>   dt-bindings: pinctrl: stm32: Add missing blank lines

Waiting for a DT binding maintainer review on this one.

> Fabien Dessenne (2):
>   pinctrl: stm32: Handle RSVD pin configuration
>   dt-bindings: pinctrl: stm32: Add RSVD mux function

I applied these tow because I have a DT binding ACK on 2/5.

Yours,
Linus Walleij

