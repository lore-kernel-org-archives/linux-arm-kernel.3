Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8CDCCA472
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 12:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnIFXZqKjMmu46oO94pEByawVJ8hwocGBr4EM7AEbYM=; b=fX9b0zkDdZQn/TM0akRYPB9iFm
	yG8CPPhDyIRGp3Xvq24mgjPBpC3scSJlKvXB29N8h6u6P5x62iX51mE81U4ENXkaSPDenba/cV46Z
	ohu366K1uCvj3WvrLwtYmvV0Ff/KOyonHZA7Z7jcJCHYqHzOQn75/ejU6/qaP0OExlSqs+OmsAhLO
	SJnt1x/3OkrhvDkiOIFKl5tS3v9KOcXbudhI4mHO0KF47b9imFvSLAj3LsaZXqIPkHtorlCkfKZVl
	qb2eBhzgNvKCGvi9UX7EsAQicekVHOM+xlc8hcDRNkZ+/IG3/FAnDVaoBAcmfIQWZ0jPNgV9v7/FF
	vEcwBFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66oi-00000001yu9-045U;
	Tue, 07 Oct 2025 12:29:20 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66oe-00000001ytn-3WD2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 12:29:18 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5797c8612b4so8193951e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759840154; x=1760444954; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnIFXZqKjMmu46oO94pEByawVJ8hwocGBr4EM7AEbYM=;
        b=wo721jlA8V2uQSyh4cEJ9H9gC6r0cuAxBU8GcB37gUP4rWe0n5EAHiTpyX+1dPhrgf
         /h4o2GCV5XjUWs6j5vy/ZCyhKfF1fVtv91hLpOq6m+jUiKVTh2T/QZrzawxChonhmVhI
         O/JF0+QEdSbiIfCkC6ZdFpvEK7ASUT+Q2GFPCO+w234Lz0D0rfslgKcIMJw4+I4HJJl2
         +HOkcrBq5Dw8y5ljpFup0UzfO44GC5dYsW2A7Brfbivb9UtlsoiVqBOcDShv39hRSWoH
         dk5nDTpdt9SFx3iGfX0A4rxkn2532h8VZp/buBQjszg8tZSZeHjESLg8MbLl+i2mzayz
         dpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759840154; x=1760444954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnIFXZqKjMmu46oO94pEByawVJ8hwocGBr4EM7AEbYM=;
        b=t41sCOYSm50F5RliQPmTyzfjgtOgIH+haF1RdE4nfJCvwrKqIzfEMn4ueVTS3tMiaC
         YwauczyqhVYa68KxFopjcqv6zxTe4i/0MNat3/QvnJvxSI5iheiJiICbbCvDFDjXHK96
         nI/X1oeVtXkTiaZjFCmv/OCtl6TyebnMrf1hVWYDuby/xhpKz3c+tNwL9vI28Gm35IIu
         pexCVzW7KPXyh9lnfpbcwlUjLbxBpU7kPIE9xKYykGxAu/v3kPfve6KvS7CaW6+vofSY
         XtwWjDAA+sWxiHRDuF9FMQyS5uxqFERHvtrwFgswaVwVCxScuWRNVnMPtBZJKx2DfuNY
         Lmug==
X-Forwarded-Encrypted: i=1; AJvYcCXCiuGR4c7e8Ezyi1MdS8AVAbKBShzWU3EQ5TXRfqR2O+0TqbX12GRt4cp1vqHrLVqh6atEevomQGE3k7BcBG7N@lists.infradead.org
X-Gm-Message-State: AOJu0YySEUYI0MoS8bnKB04J4DnDolFmk/vlV9MU8DWYBsYb/R2qGQm2
	WImDAiqVFamxWtbieLSa05pcoHMVvToY91HFCeAiqSizqJt/De+zmgW8fxlTozXnA7OYqWJlxJj
	myqWyQsv5rouNX83nMg7LE/uQuAFZG5QS4kO+h7XzMw==
X-Gm-Gg: ASbGnctQdtWJn1lGadI5AmUN7F9qidpnrsh7+yzZfgCuGefey4w52xdNNUlvNFE52Du
	yAQ2/L7qtF6AcT0v0NpC4LW0yb1hZ7W+WDYypyKrMYHGzS8e1oxsm/0gvEC5Vwehn2mDbz1GmPe
	6uK4j54Ys1BGVUQqpz8P/2QQJdJgB5fPt1lKL9v7B1UcmEyZkWO2R35k2btELKHKh4XE5ysUpIh
	S7yvefOld3zoggfFNIBQFdsEwpYRhdXOWCJeX19n/URwzT39N/8N6kkErZUPbo=
X-Google-Smtp-Source: AGHT+IFvEXq4IGvOkBEwLnkFzMNYQoqXWta+MRuNZ6zy5QIvEZlr/9df2gaJ9h0Z2yhh4+vKPvuKBvTOlCdfwhpYHf8=
X-Received: by 2002:a05:6512:3e2a:b0:55f:6fb4:e084 with SMTP id
 2adb3069b0e04-58cbc776474mr4804386e87.50.1759840153971; Tue, 07 Oct 2025
 05:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com> <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
In-Reply-To: <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 7 Oct 2025 14:29:01 +0200
X-Gm-Features: AS18NWAtiT9xc4AHDK2XxNjFXsHbeG0TTtUUuLHamMaXYLyXs_iBH5F444RGyw8
Message-ID: <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_052917_132187_E94CF018 
X-CRM114-Status: GOOD (  22.24  )
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

On Tue, Oct 7, 2025 at 12:09=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> > >
> > > Not always... For something like shared reset line, consumers request=
 the line
> > > as GPIO and expect gpiolib to do resource manangement.
> > >
> >
> > They could use the reset API and it would implicitly create a virtual
> > device that requests the reset GPIO and controls its enable count.
> > Except that some devices also do a specific reset sequence with delays
> > etc. That would require some additional logic in reset-gpio.
> >
>
> I was referring to the PCIe PERST# line, for which the 'reset-gpios' prop=
erty
> already exist in the schema. Now, you want me to model this simple GPIO a=
s a
> fake reset controller and use it the PCIe Bridge nodes through 'resets'
> property?
>

No, not at all. It's just that a shared `reset-gpios` property is
pretty common and Krzysztof implemented the reset-gpio driver[1] to
address it. Drivers that request a reset control via the OF interface
will notice that there's no `resets` property but if there's a
`reset-gpios`, the reset core will create a virtual device binding to
the reset-gpio driver which requests the GPIO in question (once!) and
registers with the reset subsystem providing shared reset control to
users. Basically the abstraction Srini mentioned minus any reset
sequence.

That only happens if the driver uses the reset API. If you go with the
GPIOLIB then none of this matters. I definitely don't want to change
the existing DT sources either but I want to find out if the code in
this series is suitable (with some modifications) for supporting the
PERST# line or if the logic behind it is more complex and possibly
requires separate, more fine-grained handling.

Bartosz

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/reset/reset-gpio.c

