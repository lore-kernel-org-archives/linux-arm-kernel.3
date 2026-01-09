Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C412D1A63D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 14:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYIk7a1gCCG7n+RBrMe0NGvx7QrZEksVmyl38VoBD24=; b=Dg8CDKOAZv28su5Jg1R3+VqAVA
	ZwLGkPr0S9a1lVNDKW1Dhqet5tUQlTpwkiwiDzbTGJMYAWqz3/+yyrcwxli7HjndKREwWH95y8DPQ
	GCUQeM9qFFAGrNjLQcrZW1IAjz/oq0i0n6emV97AhA0iqcaJCpaBM3e1KJa60W8cxKNnwLkeyl2pm
	uBpRCm2i/RkH+KkCEK8BEGyIkJ4n7KuYTTjZOyE0e+Y/2oryKIsif3zubUzixx9MuUDewvrxOSoy2
	hgQGA5/upTFuSfL0GKxfwZJg6wvs19Bfm/xKo4H63cPme1aY8hwuthe1pnenhuiO6gu7DZue+/ADr
	DV/n9w1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDpZ-00000002Qpj-1UYK;
	Fri, 09 Jan 2026 14:51:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDpW-00000002QpO-3pXM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 14:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71C7243FD1
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 14:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC5FC2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767970269;
	bh=ffSIdQ2PNsRvxyqqOyb02+48iytTLOKjoT6hEyjMSVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mbGMHRlLhqYS2ya4PyuJMIiYA0doc95NeLBSKbWu72RoIOpYxxZelGFa1RhLnEDMb
	 DcOYX4T7pxbpP1KEJKt8yUk/ELRsg9xKd8WzbwxwKqkNt0Y9X+k9HQnhZ+Gcl5s0Y6
	 uq4V5NEO6nSo0b7r7soNLkfc2P+N5Dnw7iwytQA9BUOYy3TFjxRXyZqnuOIy4tlfae
	 cA3rsav9akK4sFTS5cv526uys25TkXRsk4E0JUHTnWhU/nbOmQQT+YKxmBdNWdikQS
	 FjKKYgy24mrSYdfVfl8DTK/MC2V77OUiBnnO/w7JGwBogtzAVqHaSYXvCG22Ne4UNB
	 peJVTULZiLheA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so4352121e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 06:51:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKCERNlKX5hwlhFFXPMIGVr14vcwM4YmAW9HBbHNRa2G16Box7ycA6HMzen/d3WEwL5eGsP2jHMO3lf+enW0PD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu3a/3Pm5mJgj2Me9+g613yhDOpvok623CxdMAvb1lUG5l29SX
	SoVwH3Ie/iMAiVmWvOjTxvi+EJe4sYDTyeExKR2oD83S17oofRUy1HVADY68um0tryMclMG1lah
	pT/Dvt4JepX2QznDid+WjZGPi6X9jkYZioScqFWcvSg==
X-Google-Smtp-Source: AGHT+IFWLhfvuow8qIMZYK/7g5CiMgRDievFLnj4NheWNLi/FbbvnO/XWEOCiomEy5A3LhBVoz3hWrlHQBZegWrkP4Q=
X-Received: by 2002:a05:6512:39c5:b0:59b:7df0:112d with SMTP id
 2adb3069b0e04-59b7df012d7mr1084680e87.44.1767970267847; Fri, 09 Jan 2026
 06:51:07 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org> <CAMRc=MeQ_zr047PxFFGhfZ43TuHoKG-9VLLefxVyScpO5ZxjzQ@mail.gmail.com>
 <DFK4Y3EOXTFL.1M25VAPJAS2BU@kernel.org>
In-Reply-To: <DFK4Y3EOXTFL.1M25VAPJAS2BU@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 9 Jan 2026 15:50:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeG9fPaq8M8ACq7_9+ysmYX+aRRzZVgApv5YMGtjx72Mw@mail.gmail.com>
X-Gm-Features: AQt7F2p7IS6vaLQ0dmPwJ8037-3GQtwV1AnCbiyFDt_1RcT0ou-6dHscMRpm2ns
Message-ID: <CAMRc=MeG9fPaq8M8ACq7_9+ysmYX+aRRzZVgApv5YMGtjx72Mw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Michael Walle <mwalle@kernel.org>
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_065111_013288_E262C4EC 
X-CRM114-Status: GOOD (  31.86  )
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

On Fri, Jan 9, 2026 at 3:41=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:
>
> > I am aware of the issue where
> > false-positive shared GPIOs are detected, I posted a fix for that too.
> > Without logs, I can't really tell if that's the case for you though.
> > :(
>
> What I mean is, GPIO_SHARED is automatically selected by ARCH_QCOM (and
> probably others in the future). But GPIO_SHARED_PROXY is
> selectable by the user and it can be deselected. But you cannot
> specifically deactivate GPIO_SHARED. So there is no way to go back
> to the former hacky shared gpio handling; which might be intended :)
>
> If so, shouldn't be GPIO_SHARED_PROXY be either y or m if GPIO_SHARED=3Dy=
 ?
> I.e. don't allow it to be deselected.
>

Fair point. I'll send a patch.

> >>
> >> This broke my board (using the arm64 defconfig, works without
> >> GPIO_SHARED of course). I'm seeing two issues here with my board
> >> (arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67*):
> >>
> >>  (1) It's GPIO controller (gpio-davinci) doesn't support
> >>      .get_direction so I'm getting ENOTSUPP during probing of the
> >>      (some?) shared GPIOs.
> >>
> >
> > Unless this board really shares GPIOs, it may be due to the
> > false-positives that will be fixed by this patch[1]. If you enable
>
> Yeah this board shares an enable GPIO for two regulators
> (regulator-5 and regulator-6,
> arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts).
>
> > CONFIG_DEBUG_GPIO and post the kernel log, I'll be able to tell for
> > sure.
>
> See end of this mail. I've applied the mentioned patch.
>

Yes, I see there are indeed shared pins.

> > Though thanks for bringing this to my attention as I now see there is
> > indeed an issue when the proxied chip doesn't support .get_direction()
> > as well as a duplicated check in GPIO core. I'll fix it too.
> >
> >>  (2) GPIO_SHARED_PROXY is default m in the defconfig, but I need the
> >>      pins for the root filesystem medium, i.e. the SD card regulators.
> >>
> >
> > I'll take care of this is you confirm, the issue persists even with pat=
ch[1].
>
> Not sure this is still valid. Because I've just learned that
> apparently, the arm64 Image shall be made smaller and thus "need
> a driver for rootfs" isn't a valid reason for =3Dy anymore.
>

Is a switch to disable shared GPIO management entirely via Kconfig
(depending on CONFIG_EXPERT) good enough for you?

Bart

