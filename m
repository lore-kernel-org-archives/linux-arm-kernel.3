Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02E9C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 08:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rCtnbZWFEyClftfNf+97GB/L/vNpKwxy5TFS7AwepY=; b=G9orHB/KUUTG8TempKp+XQ5PBP
	O017AYTQOHrf65Wf1j2CRl85gIeiGa22Zpd3E5rwMXhjPOC15cGJqK1usdM60mcpILYPssWFcYF+5
	R7SxKQd+qzCCjw5Z/lEhDhesbGuV3GRf6YonNUKIdaXeOXRGq5spJ1nwfxETQKSAt4cbRDjjzNaTB
	VmSlkkTv9R2B+Ju0vUr5BxQUdSwMoz/IdH3V4Fp2wpC2GB1WEavqpF8nPFG8wJEYl72y/lt6PGLB6
	yhoc/K88zw4+GrQBaCtPFeswD8geD6vaN6Ca16/P+lBVG1Pf+VX60CScJNI2a6l82a8gONHXrth3i
	B9Of/ggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEklE-0000000BjzD-0a0u;
	Tue, 13 May 2025 08:13:12 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkj3-0000000BjiY-2zBG;
	Tue, 13 May 2025 08:10:58 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5240a432462so3784988e0c.1;
        Tue, 13 May 2025 01:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747123855; x=1747728655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rCtnbZWFEyClftfNf+97GB/L/vNpKwxy5TFS7AwepY=;
        b=vGpYuRXaT/8IbVBWDKvBNkdkGRQ4yWVf2A/gGbwPymK7c0svML8AZ95vH7mkTBM1E2
         s/3Vi04tZ5pE53wlC8qTG9ezSrNPPuecLS5FzrqBoW38kOnJdaHvSTVXgmFyAZw0vn/y
         +rETlRP6F8sky7Mxhce+q9AyO2c3a1nV4wFBzJPbeF2cAGlVS7GOj7pcpcIhwEqwEJf5
         IL9664oJuRT5AIa16zx8+fW0/NERGQvjUPk9SNOZsG+4VHziajj384DfdnfmfC66ZOqQ
         rE/dNShYlj5PxBvm8LQhjitxPB7U3xsYP/CZ+TpIkOu9QiUpAxogPFO/ASjtZOK1aqaN
         /z9w==
X-Forwarded-Encrypted: i=1; AJvYcCVkNEpoPFrZ95A1/rNp/ePfF3JuM0mS41fMr0oOIR1P/+2fWmaEPDCp0xC/W7ek046srWnH9pPWd23jnolKJ+QbhQ==@lists.infradead.org, AJvYcCWg9NsRgOLeE1/BH5imERFk7okFdBITO/bnKthsk5uryFjipO8EviAt3qRL06G4oy6NN1038gm1/iUUcni6jRcK@lists.infradead.org
X-Gm-Message-State: AOJu0YyL1q3V+jnDAIUi2eUFRb3XXdkJnavG3Bhpai/4LqgEIGNcs6Hh
	u8NUVGqIOVfNEUxhoOGy8pDpvA+keDobEZAEEXRbLPAaDuzNZJa8+2LrUJV8
X-Gm-Gg: ASbGncvaxVpgoeYAPF/6QNsVCf1cmjmLkKXHJi4Fz1Sp3wklXomi89IhEY0yjKMqYwB
	1LfYPAWlEcjySfaPV4J3VtFdnlfjVQjwm0qwD6XJRXNRRjTSD5V3C/4GB9fOH1pwZ4aaIiDJdfi
	U4tPGR5xT15nY0RMfEbJeTgqbgYACAfZ6p2xtn/ZWM7InxedWi46y/m5EJDOU7TuGKBr2tJUCiT
	wicpozZx65OXfM1wZZ/luWz+SWIseSH3kRWnOmmJtul7VXFzHsQTtLf/FBao+C5U4oFkpslS0mJ
	EWUpEVur9TSKOc99G8Ijodd/9V9IGv/rATCyUPBjAA1tf8rTw04Mka3SkyzklLwzM0heZ8LZaRB
	OGi0jKLZpZRij0Q==
X-Google-Smtp-Source: AGHT+IFOmOi/RnkQHqGe4NKl4k0+SG+wm2+/P5lE413IlJmvuiSg5gj3PxmPvNsxdqG2GPYe/jWW3g==
X-Received: by 2002:a05:6122:32c6:b0:520:4806:a422 with SMTP id 71dfb90a1353d-52c88a6d7a1mr1926521e0c.3.1747123855462;
        Tue, 13 May 2025 01:10:55 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c5372fa9bsm7077377e0c.20.2025.05.13.01.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:10:55 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86d6fd581f4so4143542241.1;
        Tue, 13 May 2025 01:10:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVR6BQIsbJvthru3Ag8F7Q5QGQjlJGDC4dJR3VBfdWR/Q4CGJD6fwC85V1+SjJqFM2E/AfF3xItDnRVqw2yr32Yg==@lists.infradead.org, AJvYcCVexIh9Rw104B/Vh1DFNgX0JqcSliNAr37awSCL7jh09ax+pjUN6Yba92JV3NR1L7HduGwYiYrDhsE0fNl8IUVJ@lists.infradead.org
X-Received: by 2002:a05:6122:3207:b0:523:6eef:af62 with SMTP id
 71dfb90a1353d-52c88afe8b8mr1778704e0c.4.1747123855105; Tue, 13 May 2025
 01:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <aCGPuKtfprIvwADa@smile.fi.intel.com> <20250512173800.6767-1-trannamatk@gmail.com>
In-Reply-To: <20250512173800.6767-1-trannamatk@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 10:10:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiTLbazxfe0joujONfLTQXT73WE=sq5F-4dwOq463b4g@mail.gmail.com>
X-Gm-Features: AX0GCFvxUbYICZnIC49acrtXEhbKJaNQ34KnJ9GMWMjpL7F8L3vH5lZ8JuyNYOU
Message-ID: <CAMuHMdWiTLbazxfe0joujONfLTQXT73WE=sq5F-4dwOq463b4g@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Nam Tran <trannamatk@gmail.com>
Cc: andy@kernel.org, lee@kernel.org, pavel@ucw.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, 
	corbet@lwn.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_011057_747042_A747F2F5 
X-CRM114-Status: GOOD (  29.86  )
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

Hi Nam,

On Mon, 12 May 2025 at 19:38, Nam Tran <trannamatk@gmail.com> wrote:
> On Mon, 12 May 2025 Andy Shevchenko wrote:
> > On Sat, May 10, 2025 at 02:48:02PM +0700, Nam Tran wrote:
> > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > > On Thu, May 8, 2025 at 5:27=E2=80=AFPM Nam Tran <trannamatk@gmail=
.com> wrote:
> > > > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
>
> ...
>
> > > I think setting PWM also same as brightness_set API. However, there a=
re
> > > many PWM config for a LED and it is one of other config to make auton=
omous mode work.
> > > Therefore, standard led API can use in some use cases only.
> > >
> > > Please see the link below for a better visualization of how to config=
ure the LP5812.
> > > https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/
> >
> > To me it sounds like you should start from the small steps, i.e. do not
> > implement everything at once. And starting point of the 4 RGB LEDs soun=
ds
> > the best approach to me. Then, if needed, you can always move on with
> > fancy features of this hardware on top of the existing code.
>
> Thanks for the suggestion.
> I understand your point and agree that starting with standard LED APIs is=
 the preferred approach.

i.e. a drivers/leds/ driver.

> However, the LP5812 hardware offers more advanced features, and I=E2=80=
=99d like to support end users all
> features as shown in the link: https://dev.ti.com/gallery/view/LED/LP581x=
/ver/0.10.0/.
> It is easy for end user to investigate and use driver.
>
> If I want to keep the current driver interface to meet this expectation, =
would it be acceptable
> to move it to the misc subsystem to better support the hardware?

I guess you can add custom sysfs controls for the advanced features
on top of the drivers/leds/ driver?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

