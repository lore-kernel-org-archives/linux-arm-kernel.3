Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3195EC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScUqTDWnzQduLboZQZn5qJxxt7JOhe69U+tproLSWEk=; b=v78jmpC5sggD1lXU2+7azwqm2E
	i6Da7nkKJH4nUB7O27tuBiBfKKK73V5V0eBFSfPAhZGrSMEQdB1rgCBQuNXCJpobDyGqNxLjwDi7V
	+6u0YeX2Pq/p9a8VYGEhxopqLOcyp37XhvEnQNR7VVO3gLaTNT5NTH5W+38/cq2RDci8oINxg2+Ki
	uhwv5CvDLO4xdlAXNUGpn/aGgj0v3xGG6+OtONQxjPp+asPuBRhDRepGuD+5zj9M2HR4HAT01VsYY
	QU9ITEQsfLSoRsa2IMxRy4BFnZ/CsvW31EPpG97JGuOxmd+xW/b+NsM9nyP3zcxLJHplVngxwTCWN
	OTDfwCqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6eK-0000000CVdZ-404N;
	Wed, 15 Jan 2025 16:53:48 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6d2-0000000CVQ3-0Yur
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:52:29 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30615661f98so47172571fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 08:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736959945; x=1737564745; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScUqTDWnzQduLboZQZn5qJxxt7JOhe69U+tproLSWEk=;
        b=MUa4MT93zgHZ/q5A0KjGIlEfXZv9LB68QqlnuazO9z84Spvtm8b77ngKIZe1WiP6Q7
         8LpsHwzrCCJUSB5xSuQ2fc3ZurY/9sbTXvQbFmmWLcxPDYU4sA5iXpX4K88xtt9jLrRb
         3Chr6NF0R+EthxlmPAtfoO6QOvdT58bomr1r238vCQxR3HROnaYcbjc3l51/b2S5hJsT
         7PWMdBtfSMOTlWI16x7cES1J3G+IfNXHpdo7Ly3nbBZIaJar4m5OymKH3Z1inLG8zFye
         WWDaC07NlCjt5HDSKQ5v8iaw0GnpcTGWUUCSkZ6kYpnlkMhsHUGaIxFkadnd12qpUwHn
         guFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736959945; x=1737564745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScUqTDWnzQduLboZQZn5qJxxt7JOhe69U+tproLSWEk=;
        b=pHCAA3Z1ThIYa8n5a0/mOKSYt66k6IDNam5dRfoiOaOEGj1CbOWfS1jiCaNtgd6FJZ
         iiSpvBIftc5UxgJTFI+5KZ5wmnFI1hnW0+441k/FTUyL/QyWTIbgvXhImdE5rKbXWpg8
         /7ZdKFlNAPenuf+UoAslpNmc6SrmQfdcJqRPG4wT9VKbgbkDamR2ob50P4CwyDXhEv+e
         kPjy6umMo2P6oTw8CVUldYRfQ/hBJEwEHaWZrC91oVDesvaD9vSzlVdB+P1UhcTahN+Q
         dtlBUz0ERXlJ9U435bZ5kKHEL+AawGMx76vuNFURCD+X+J3kJCble7gBLAXAmDJI0/tt
         sWcA==
X-Forwarded-Encrypted: i=1; AJvYcCVQF8evSbPSf6/wBBV3idVrCFgIsxNT+oVZVI8hzeP+R4mTnWoDDkOMuOW2OxpHi1KKyWFF8PjTjZsHR96IJz0K@lists.infradead.org
X-Gm-Message-State: AOJu0YxJNXxSR6kIVa0NA6cMDgCSLQiGq7EqTAxND31itQGW01Pd/Jkf
	B/O7f49kHSqk4IGFodE2jtQcYskg5aZVruMOtGcDb9wKr5jH4tx5loKuHQN7uLqB9vJna00gdlg
	p4lFdK8YmsDx2T/wESj8gcbmykXVWNjKnL7LJ+g==
X-Gm-Gg: ASbGncsJn+OkBZXqJDna7sK4mlaRvts91yu+1tVKbqkmsmcHTz0bbX0qp/L4JT2mJNJ
	+29SlZIRGaiUjo9M1ZmV01CgRg/4/tSqpEXZJAoR5HD83Z7UUEr6BvwKq5yuxSeArC+oIcA==
X-Google-Smtp-Source: AGHT+IFbudLF97M9SY4kT51eRu7G8hIOTmWNuILKuPS/5RISLBhUaMA8RaVyreeevht06KYG4u13lDLUp7DnHNKW1lE=
X-Received: by 2002:a05:651c:501:b0:305:d86a:4f01 with SMTP id
 38308e7fff4ca-305f45db5d9mr86648231fa.31.1736959945548; Wed, 15 Jan 2025
 08:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com> <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
In-Reply-To: <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Jan 2025 17:52:14 +0100
X-Gm-Features: AbW1kvab1-KFmYpbsyzdNL2AKyeg7H-EBh1b21mZES0GH7vaSk2m90tKHAwUVsA
Message-ID: <CAMRc=MdYB_XHCaurs1mO+KGX7rB5zFT3zCi=UbNY0rSbMEJdWw@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
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
X-CRM114-CacheID: sfid-20250115_085228_444083_BBB9C258 
X-CRM114-Status: GOOD (  25.73  )
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

On Tue, Jan 14, 2025 at 10:55=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> Hi Andy,
>
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
>
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
>

I recently wrote a user-space compatibility layer for sysfs[1]. While
right now it doesn't support static base numbers, I'm very open to
adding it except that I wasn't sure how to approach it.

Is this of any use to you and could it help you switch to libgpiod
without changing your user-space set-up (given the support for static
GPIO numbering)? If so, how would you like to see this implemented? A
config file at /etc that would list chip labels and their desired GPIO
base?

Bartosz

[1] https://github.com/brgl/gpiod-sysfs-proxy

