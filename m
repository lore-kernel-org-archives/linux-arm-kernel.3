Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238B2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 19:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gPjOfJWBv7udEX42R/lPZwZsVT3ZK5coiNp2Efpmis=; b=ol2IVe2oDrNnTVM89r+ZuevcCr
	pHdFJPoOSUrpQ2R2SLUyym73JhftwJIsnFgfBl8cJ6GKDWASgOovHPg6F3RTin/fVUgxYQswpNv80
	aUWxkA7Z8xt196qhWvex5U0wRFi7rQPV1CUN0798JyK9e7RM3RKw568sZjbpeQvW9dpMhXIflQwZ3
	fxbYwSd/Ar3kWHwpFtG32L+LCMl3QGRud5jS6eSwE5Jqk0WOXQGiCTm/nv/tl4I9M59vOAa7+NtlW
	Sizf7jzdkwYixfiQXKGUtscEBPbcPwEeKtn9zyoOeoA4/jQrSaifLw+/I6eO1XxNyrCKWJWkJRcQA
	KxSifzbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmqV-00000009ZRp-0pGw;
	Tue, 14 Jan 2025 19:45:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmpG-00000009ZJB-0FWS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 19:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1gPjOfJWBv7udEX42R/lPZwZsVT3ZK5coiNp2Efpmis=; b=IRrYUzAugO3/WJKjyfu5tCo/9D
	5cB5/kySBRqgAhbeuBNC90rwIyArkS0KHDIjAJkZZEcw0JDxubQ1JflJe3u4i2k6EE7wEv5ciBYKq
	5snjk7rOQmkUQOelcgk0t+hycPrUgvSjfozL4wDTDoXt3UQFhPBn4tknk7u+AF88qugVq5dav48vv
	TagToW5mmviKIvZNMzG97Rv017jfuBKYpPRdojSPOXU2kDXU71/6k8wUuj59KMPD5+kq/VxeVgpnw
	B/BO3J+p1q1fSZk8b2aM00jnQfwchfuNoQVlyIEhQGMLVarHVSYyU6xbfbyyCCJWxasv/v7I5e/sO
	nupItSFg==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmpC-0000000Aaho-3zQb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 19:43:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aaf60d85238so1075559266b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 11:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736883819; x=1737488619; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gPjOfJWBv7udEX42R/lPZwZsVT3ZK5coiNp2Efpmis=;
        b=hR/Zo+ILp6g6Tq9SWlL2M+FwE+ljmzQgZt0mGrflULAZ4+/1qeaYNW+9ESbxzvOdwu
         eqiHY9Oq91ax6EdPlgPcDIx47TkGfgoko/QdCxBy04h83TWdn9pqktkUI4NkFaim8GWb
         FJFSpuwQ1JuJ9aqI33niQrL+isYaonNp0WzTqIcTwpQBS07CHnI8cYva3/ld2PCbDrBS
         7MfGS7ywxPqFgaV10BavMHsZ61Wj78VhsuU3Z2WC/N8mB+4YmhBvFKg+rkRyMMuCpBeR
         /o13gWnb9gwd0OsRTNyBO3dGjXC5iFlfp8ntqapGTvw4qRMXjxc8L5eri8fS9PSIIwGj
         IooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736883819; x=1737488619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gPjOfJWBv7udEX42R/lPZwZsVT3ZK5coiNp2Efpmis=;
        b=h5u15btV7SLpHdXOPig2gh3+Y8WU/VPJCqEajx7BHSerbM0W5YodW4BmC6gdcQN3z1
         Udg3s+wGzpuYlVipL9pkD6k2ed1zMPvLb3nWYYtdPulYMKJZflWQMvUjnKJbsHCl0qNQ
         HAgSescaBOO1JGVEaaQePwaWIpY/fQKfcXw5cI7Ah+Fipb3j/je+uS9DwI5jIFToiLdN
         y29Po+VS0l6tCrSMuOdYAI2WiUfDB51jhOPGUk8BGQ8yTMvbnCF974j1d5HVkozglMOF
         t0bJHUiRsv6AxZoQnem4tqmu8Wr+2Wax5ZEtLun1V64Z6nQBWv/r4h/uy+UfS6KXbHTv
         Ciuw==
X-Forwarded-Encrypted: i=1; AJvYcCUIPuCOVHH+8iA7AEsWilRi9+rZEgImILSxSSFmATD6e7w2ZNofg5Q8Cyt67zNuoeQ2G+t9bGuvkY4fOTAY45yc@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt+Vo2svS6sL0Q0JVPZo/XnyVdn3Q9ZLKoZkU1gF6la9IHFL4x
	1aQmih84ssHBGCtZlgCZy2dgmAWxLn5hz6B6thDYDiIKKRmftvvrDV9c2BOKNpyJCuVz8iFzbpl
	3jllWNM1PJQNiM4kWa+sWEb7Ih9w=
X-Gm-Gg: ASbGnct0jGahmYTPT3Fo2LpKfOLKivUJdYJbVUplqisjmzUj3X2zVFwQnsGLb3jxEG7
	y5CqNNoPLDHeHEqQ7Pbsg4mI7k2zqEv0jMZs1O1TS
X-Google-Smtp-Source: AGHT+IE4RbVs71/smgDj/TU9UMPWxR9g62d8TumLSWo8W/n9+Z0nM2yXhOXr7N7e9uaINKsYnz0zeibsE5WgKYib+Ro=
X-Received: by 2002:a17:907:9410:b0:aae:8495:e064 with SMTP id
 a640c23a62f3a-ab2abc78b52mr2090164566b.40.1736883818809; Tue, 14 Jan 2025
 11:43:38 -0800 (PST)
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com> <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
In-Reply-To: <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 21:43:02 +0200
X-Gm-Features: AbW1kvZ6R2e3yRjumlny6gUuJSkRGD__NmZWUskaVnb9oMxLZs0nWXPBoBuMPXA
Message-ID: <CAHp75VfOhAmkpB_nhQE8m25p=3P2wvTfOnQFEsLR5KEktLy4vQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_194343_127291_917F9620 
X-CRM114-Status: GOOD (  23.44  )
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

On Tue, Jan 14, 2025 at 11:55=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
> On 14.01.25 10:46, Andy Shevchenko wrote:
> > On Tue, Jan 14, 2025 at 12:19=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutr=
onix.de> wrote:
> >>
> >> The i.MX GPIO driver has had deterministic numbering for the GPIOs
> >> for more than 12 years.
> >>
> >> Reverting this to dynamically numbered will break existing setups in t=
he
> >> worst manner possible: The build will succeed, the kernel will not pri=
nt
> >> warnings, but users will find their devices essentially toggling GPIOs
> >> at random with the potential of permanent damage. We thus want to keep
> >> the numbering as-is until the SysFS API is removed and script fail
> >> instead of toggling GPIOs dependent on probe order.
> >
> > While I understand the issue this tends to get never fixed until the
> > entire support of iMX boards will be dropped.
>
> i.MX is an actively developed and widely used platform. Why should suppor=
t
> be dropped?

Exactly, Which means "tend to get never fixed".

> > Personally I do not like
> > this series at all. Rather let's try to go the hard way and understand
> > what's going on to fix the current issues.
>
> /sys/class/gpio is deprecated and when it is finally removed, this series=
 can
> be reverted again. The alternatives are either do nothing and live with 6=
 kernel
> warnings cluttering every boot or show users the finger as described in
> the cover letter.
>
> Do you see a different path forward?

Yes, try to write your scripts based on the libgpiod or the tools
provided by the project. I.o.w. follow the warning that SYSFS will be
removed at some point and prepare yourself for that. If some kernel
work needs to be done, contribute.

--=20
With Best Regards,
Andy Shevchenko

