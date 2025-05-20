Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB04C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 22:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2rh9i3/PUqd91HnT/agwHUBEJLIceaCRVKrhRf0A54=; b=XTjwrOz6kAdX26S1oumtrF9kKu
	hepMADSCwe/tk2jPkG9JqDdlEV+9fy6KcO50OIiIAz/B1dPpNiUJKzWXKXCHNrzTkrp/LMIw56UI4
	r75mX00/39brWNHIfiyj/lU5z7TdzKUx/L1jfgRTJzO2+ztQTAl/XyJrDpx3fSmeM/de36ImzI9vJ
	wQPyi7SQ69v1PpcjZ7r4/Za0u7Ljsx7xPjyHxOQh4Xhmpv8La6oqssWxOmk5RWdQ01azFRV5UrDB+
	r30rb7U+LF9UuQTOSPgl7mkhsPzVmUTOT2bgPqZWau8leU+vMroKDBhee+qL2O6wqnOVKLg5tJGVE
	k+RmEp8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVgM-0000000EJ2D-15ws;
	Tue, 20 May 2025 22:43:34 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVY5-0000000EHpi-3Em7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 22:35:02 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-328114b262aso41925461fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 15:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747780500; x=1748385300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2rh9i3/PUqd91HnT/agwHUBEJLIceaCRVKrhRf0A54=;
        b=ebMtCfwll37vIRmsRDwZVjrKQyqNuXHESrh47VqWcNHk8rWAmB5frp37Fm7TDevnyZ
         BA0lHTCb3pD/Z9dcK0+886l3KaMQJw4Pt0guUnqIGcyJtXTK1Nid0PttTy1Mmf3tKqHV
         nu4uLqvGseqQ07SojNKpOkendCztd3jJ9y0lbRMj3Ias8z5xl93DJNq4++4W8G5d37jC
         Yg2mizCzAdK3f3eTWpV44APIra3vM7jyyoqydBfmVSVVoIp6uenxzEJOe/vnGJ7NswkX
         PPBqsmrk5TcOj4EU7f6aG3lNVUHIzu4KAU07sxttlpw/pWUTGj211GTX/FldoJO+k1nG
         JpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747780500; x=1748385300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2rh9i3/PUqd91HnT/agwHUBEJLIceaCRVKrhRf0A54=;
        b=U3S+Yz5j/GOVPkFJg7PJypPpt/35OpKPXhTbvi+Sfal0ZhMZ9E6CUv9a+ae+keBX9Y
         DoKIIrWUcqILcrIx4zDG0msfM1jI0g9sfG98uVqhx26PzkZz9FiaEjRl3s7y3ANIDdJZ
         qYyHENXaxN19FKhKrT6O34JYLo7HAon3KOoc+hXBmyWg8e03o3xZa5OhZcMo4925/u9f
         JYPlvJcWWd1qpxTYAK2hd/UIfRJhBtcTl92gAYU3cl+p6l/0JrECqBVta4u/BPmwbgv+
         So/kLK96firiYnAFMaEctLhBy8oFskBQl+6p65ftmhoGCEw48A16bfLV96vQw7ox53SM
         cVTg==
X-Forwarded-Encrypted: i=1; AJvYcCU+3zOcph+Ccmyc6ArNvWIiqFzrWyq9RZ5ZZziHnbpumySJzed69FI00gKvSUE1kgKpRHi7m9B8V263at2wzE46@lists.infradead.org
X-Gm-Message-State: AOJu0YyJy31VFPg2Tb+pKIzK/r3qA6A7nNxoJOPOEQoEeuurrXB0whkK
	i81pdfOKn37Vuh0SSSDAimDnm5Ka4G8rzPIJTUFQc9rb+96oOKoUgiuPB2e5JRIPm3tgXUJHqK3
	YE6Q0NGtIM7mksjDjFXGrGydHwxUJd4v48PHxOfq59A==
X-Gm-Gg: ASbGncvVRTCtXRafKqBE0DoixHrkkcFYwwFAyUoUjqWUsqCobV2OVBNgtwf80fZCqzk
	RkvNpOr6MLJSH82CMkn02rFqUuLO/98Fd5yM/fjT4q/uj46OXSO40s2WA7GJ8pmDsm/r+g6n9BW
	3gS57esZh4/85OLYh+g1i+Q87I5zK0K34a1LBEUVIsyns=
X-Google-Smtp-Source: AGHT+IG3zE80N3OdjZZgIj1CBi8G4bnNpTjDsApWfo+qPPNIniOdUu0Ts+pT4sWio2WYX62CWpyx5h4GPmpl48aN4uk=
X-Received: by 2002:a05:651c:f0a:b0:30b:ed8c:b1e7 with SMTP id
 38308e7fff4ca-32807728eb8mr48465441fa.18.1747780499896; Tue, 20 May 2025
 15:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com> <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:34:48 +0200
X-Gm-Features: AX0GCFuW4vdoq3ZxavI5D-k3WcmH7E3A9H2e_P8Zln_7BppO66UxFChz04uYBvs
Message-ID: <CACRpkdZp6D-duzyVRLv5+PURb3Nu69njJx_33D-2aYS4DjmsoQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] pinctrl: stm32: Introduce HDP driver
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
X-CRM114-CacheID: sfid-20250520_153501_818265_7D87FFDB 
X-CRM114-Status: GOOD (  18.26  )
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

Hi Cl=C3=A9ment,

thanks for your patch!

On Tue, May 20, 2025 at 5:04=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clement.legoffic@foss.st.com> wrote:

> This patch introduce the driver for the Hardware Debug Port available on
> STM32MP platforms. The HDP allows the observation of internal SoC
> signals by using multiplexers. Each HDP port can provide up to 16
> internal signals (one of them can be software controlled as a GPO).
>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>

(...)
> +static int stm32_hdp_gpio_get_direction(struct gpio_chip *gc, unsigned i=
nt offset)
> +{
> +       return GPIO_LINE_DIRECTION_OUT;
> +}

That's reasonable.

> +static int stm32_hdp_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct stm32_hdp *hdp =3D gpiochip_get_data(gc);
> +
> +       if (((hdp->mux_conf & HDP_MUX_MASK(offset))) =3D=3D HDP_MUX_GPOVA=
L(offset))
> +               return !!(readl_relaxed(hdp->base + HDP_GPOVAL) & BIT(off=
set));
> +       else
> +               return !!(readl_relaxed(hdp->base + HDP_VAL) & BIT(offset=
));
> +}

...but you still make it possible to read the value of the line
if it's not muxed as GPO?

Should it not stm32_hdp_gpio_get_direction() return
GPIO_LINE_DIRECTION_IN if HDP_MUX_MASK(offset))) !=3D HDP_MUX_GPOVAL(offset=
)?

> +static void stm32_hdp_gpio_set(struct gpio_chip *gc, unsigned int offset=
, int value)
> +{
> +       struct stm32_hdp *hdp =3D gpiochip_get_data(gc);
> +
> +       if (value)
> +               writel_relaxed(BIT(offset), hdp->base + HDP_GPOSET);
> +       else
> +               writel_relaxed(BIT(offset), hdp->base + HDP_GPOCLR);
> +}

Can't you just use GPIO_GENERIC for this?

bgpio_init(gc, dev, ARRAY_SIZE(stm32_hdp_pins), // =3D=3D 8
    hdp->base + HDP_VAL,
    hdp->base + HDP_GPOSET,
    hdp->base + HDP_GPOCLR,
    NULL,
    NULL,
    0);

The default behaviour of GPIO MMIO is to read the output register
for the value if the line is in output mode.

You may wanna override the .get_direction() callback after bgpio_init()
and before registering the chip, either with what you have or what
I described above.

Yours,
Linus Walleij

