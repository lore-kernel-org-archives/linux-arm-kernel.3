Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A44C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 05:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sr/EBTQG4/UwFZx/KYi2kLPC/6miYByKQl01Eq8yNq0=; b=Grik21/iWkWIh7tNAIlaMjdKdd
	41TTjnnkutjyRyX+/4dU2mYcE7Z5c2K9rUD+0Ot9keH0FfRSob4Pl9KFj0zgSFWihiv4w/s/dxLb6
	Os9vI4gTQeUwo33RDBAP4zYKdDATSyGJGP1DRttX1S1GGwaWJalL21sIy8IBXbTB94Gu/0Lj+7mz0
	1kAv7LwRDO1m49xtN55gq3xUG2x/9J6BDOpIMR4Gt8r8IXh91GK1pSrLCpZGyAJpwxgynbrxgKgYt
	yBJ7I4lluyYtHO7Bg6q1HgiqgPK4RJ15IPj/yo+DzbGs+Nwr7tGl1Q8XqN/Gvd/Xmv/7PHSLhMi93
	qG3f56Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXeY-0000000EIj8-2IRp;
	Wed, 07 May 2025 05:49:10 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCXcb-0000000EIXB-3jl5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 05:47:11 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7cad6a4fae4so853198585a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 22:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746596829; x=1747201629; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sr/EBTQG4/UwFZx/KYi2kLPC/6miYByKQl01Eq8yNq0=;
        b=JwxEHQPR90XJWc/rbfdFx5VEdpObHkKtWnEsGKTilkTlmX5EunkXmfXwxBH9jnaA6P
         Rp8DH8rZCBCac3t8n42Ea/GFNt+lstHY85kRxFxkK05nuyPVhxIj706oVQjIjxN5+PRT
         sN1NCFoi/D9ZordyGjTmAbCWOUCmbygH9Gjk3mmkduXOH29VeE3lWFXhOYHcmNagD5bd
         jCzigeGD9+UNtaj8y33A06gbMIn73MErNA2XiD1Gcim9KYqrlDXBxVrD7kziGfCZhNGK
         SKjyiGBz5Ki+plZf4j6n7KSUtqPlZ9XbOUNWlAu9oFe7c5hVkgCbfvzfldsk3McDzaAH
         DMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746596829; x=1747201629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sr/EBTQG4/UwFZx/KYi2kLPC/6miYByKQl01Eq8yNq0=;
        b=Hn4HlzLxULfcbk5/t5oXJERX8A6SXrJtV9jcdds6rkBXQblHdQpZaFuTtjhW8kY28L
         vhZWcF7V1gpB0NK+WA0ku29CqKRQrAd4MA8LOq+zG8Eyr1iQNpHi6f8tJ1C7JP5IN/eN
         JH4H5/PRKJLwVyO8Kohp6Dh/DDeJAQrrJeOMU8IW+7RZAOfuR48y2faFslqsI1IRJSEW
         pawtBGEqW1cui6Fp/87tDDfH1kKUDiVZhmgPBC4zss2h/v4djdYwk2FuLH2H65xc5JUc
         /4lVnMnFn3yV5TDddE1VL2mICbBuy/lRx78HwIUbGiQ5nYDuqsDxVBIuT/UZXXRsJgMy
         wA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUn/pDPm+MEKhVf/an8c4VH6uQHZlZQCPGStjdMRlxXDDSUetuues+IZsPZktKr412ysXgXPWQ2zJwNXDR94vhB@lists.infradead.org
X-Gm-Message-State: AOJu0Yykd795R4ZTd1AAHLnhgNyfg1gyiVAy+xh4p8z3zIr8byM7CNx4
	27984tgKr+fA2Sunx1QTUf1x1ukfpcYmlux+QNMB5YbbSmDWdyIeGlCE+L9AAA51afBGzpRhM4I
	1eb4MuUc6cJMuSSyUgRv5w5mhMdXH/YjnxvxuZA==
X-Gm-Gg: ASbGncuzXD1DbsIyujdOOJz23TLrSvvQb2XTBHXcEM6ldKcOpSHJSP7IFn2kMbKEovI
	E2UGk/BFN6SSERG3bUqK2wo7dDD1kCteErvoSXnGVoZbrqspJ5p0fZBZ+829Uhs6abe1PYgIMHj
	2ZekDbDpzSCgbXz0UmdmtX
X-Google-Smtp-Source: AGHT+IH+l73WkllP0u4r7uaSDidXOWDrfnL+BIbC9V9jeSezy4B7RZaNnCkLw7jvUCpMubvtnuETSM/JFB2R3NarJkU=
X-Received: by 2002:a05:622a:410f:b0:48d:8053:df56 with SMTP id
 d75a77b69052e-4922795ddb7mr32129241cf.48.1746596817909; Tue, 06 May 2025
 22:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com>
 <20250507-vt8500-timer-updates-v1-2-6b76f7f340a6@gmail.com> <e05151a1-2112-497b-affa-d0e95c71b627@kernel.org>
In-Reply-To: <e05151a1-2112-497b-affa-d0e95c71b627@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 7 May 2025 09:46:47 +0400
X-Gm-Features: ATxdqUH29QtBVUIdEBGgpphpU7Cm3yGDAmRazAqGvFsGpNIyRjeSFbKTUq_yrS0
Message-ID: <CABjd4YzmbQj2eDKS1YvdZFzwzP0v=2dwPsPUqZqL9=Gc6zatFw@mail.gmail.com>
Subject: Re: [PATCH 2/3] clocksource/drivers/timer-vt8500: Add watchdog functionality
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_224709_930208_D04B6186 
X-CRM114-Status: GOOD (  21.63  )
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

On Wed, May 7, 2025 at 8:33=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/05/2025 22:06, Alexey Charkov wrote:
> > VIA/WonderMedia system timer IP can generate a watchdog reset when its
> > clocksource counter matches the value in the match register 0 and
> > watchdog function is enabled. For this to work, obvously the clock even=
t
> > device must use a different match register (1~3) and respective interru=
pt.
> >
> > Check if at least two interrupts are provided by the device tree, then =
use
> > match register 1 for system clock events and match register 0 for watch=
dog
> > respectively.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  drivers/clocksource/Kconfig        |  6 +++-
> >  drivers/clocksource/timer-vt8500.c | 58 ++++++++++++++++++++++++++++++=
++++----
> >  2 files changed, 58 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index 487c8525996724fbf9c6e9726dabb478d86513b9..e4f9aade058af1adc279274=
c6c711658f9f4cd0a 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -177,9 +177,13 @@ config TEGRA186_TIMER
> >
> >  config VT8500_TIMER
> >       bool "VT8500 timer driver" if COMPILE_TEST
> > +     depends on ARCH_VT8500 || COMPILE_TEST
>
> Does not look related to this patch.

Will drop in v2.

> >       depends on HAS_IOMEM
> > +     select WATCHDOG
>
> Drivers are not supposed to select user-visible symbols.

Fair enough, thanks. Will add a separate nested user selectable option
for the watchdog function and make it depend on both the driver itself
and the watchdog core.

Best regards,
Alexey

