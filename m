Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5361AC02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2kWKgGJwqIvg8wFPSvtYgSdMXhyo06JgkJuml3qb60=; b=batWNDtNhFKu+WmGdq4RP3NaSS
	3F3YcHXd2xPCz6Qg03jzorjP6r1LokQeJ4HnFH1ff3DtFtjP8szVSViBwfn3AJKKyNgJ3i6BGLR96
	uyD7atshItV6elI05jtruJ2NbwTeMNBQX3zWPpfB+g0PZSSOVi6PVTcstEppJf1SD+yyrseZAtEvt
	HglRDtf/Hz6TGQhEZnLWe2Xoq4s5MYcosvIjEapPvsPvEslFYlHD1/p/6sgrs9i+6wA8A+QQbaYkS
	rg8L2DN0yr9oIObucz5ZLdpGtEsbn+Zk4ecdc5WmyEKR09XaWugWegsZ9UY/ygclhJSXDM+Gl5dwM
	YBPkcSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnsV-00000009jJ9-16lB;
	Tue, 14 Jan 2025 20:51:11 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmkh-00000009YrM-21RI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 19:39:04 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d982bce8f9so11229517a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 11:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736883542; x=1737488342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2kWKgGJwqIvg8wFPSvtYgSdMXhyo06JgkJuml3qb60=;
        b=W+p35SkYlhzVppgdFWkokfGIzU2xwXCFlbm6HeU1ZSYkQ0I1KuIKNC9/wg3dI+03Ra
         oEN7vDgULAtH6B6FtE+FlARsvEvLVqhz3zisnYV7p8oGoeCNvcF0cfuqmmOeoCtHqCzi
         ymVILiJ1E2Ps5RTEU40hoNrxjh8wZm2v8pow2uM7Y5do6yoBGFzXflamSmjr+WohD7dU
         u8vKGOUx/SS4N1PQfpBdHvRECkO9xWzY4Xos6TzlyWKJHSp8BxSyina3x06tWc7rg0rR
         a6jiN7OX73RtK/9oVwuvaIc/37bfXGbwPIAq/CLxsFPQNH4+mjvt6H1E1zKpEnkebKrc
         S+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736883542; x=1737488342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2kWKgGJwqIvg8wFPSvtYgSdMXhyo06JgkJuml3qb60=;
        b=G5u5bikkrdVFhnR+yqYfwHqpVmGlDyMM4VOhp00UDh3epRtpji9tL+crxnh376J5JI
         lVXedvRJJgV89WBdG2oc5bypIStGq0icIYK5eMqKQRLx6yXiZKK7OK4qfVg+bN+MNSkx
         vNvJ3j+4rQAiwKixwT17IrR0OEAWhqUdspiWis7msmpy7Gy5+BVPGxgMtB716etL41mR
         N03WHt+N6x1dQvWYKyLDci8gKmpzxrTV+qnRlSzdmhN1e02HwQUzjJWBx9JiU5lrAaIQ
         FRezdotSh/T7WJOTUdIDM+lhFGMS7JrnzOLD1Ml3ChRF+Y7puIDaM5eRULbRmbPKm/28
         QLEg==
X-Forwarded-Encrypted: i=1; AJvYcCXXQOUr4fzJBMRxxTJRQQgMUyKjoYK8wCW4SkeflmlLccRsgkmfS8xGNxOZWwYx3Qq/1/n3/h9+YJU6Uh7sjsHy@lists.infradead.org
X-Gm-Message-State: AOJu0YxTOc5rKEZhnUbV5imVeU3inuNecUsN17rk7Kftbgq0itG62ePu
	eWzPOt6V6fPLX+7C5hTJqUQa91eyXEXC+Y+w7ac5y8NymsVlyR+bc4he+QOiF0qN1GETUt0ez7V
	a6ehzDpQb3921HXyaoCTwNvcTizQ=
X-Gm-Gg: ASbGncvVO8K3dmb/eVc09YyM5RymjEikNAwbJnXbUARN4WCmVJGbsPbHcppM1TWyvap
	0o5wqalh4N/v0geVCYLwYtCGvJkZz94Cy0i8WNJdD
X-Google-Smtp-Source: AGHT+IGVObRTXkJgLmP+wm2jP1YHrpOKzkqy6VxBJmEYGfuoYeicXpLRBMTRDYNPxmMcfQYiic3FDlwA+bhaVFvq/20=
X-Received: by 2002:a17:907:7e91:b0:ab3:f88:b54e with SMTP id
 a640c23a62f3a-ab30f88b5d5mr877315766b.31.1736883541610; Tue, 14 Jan 2025
 11:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
 <CAHp75VcnB37ET8mW=m5sXwP4qDQDUPKL0yRy8n49m++zShqPMA@mail.gmail.com> <97baffcd-35cc-49a0-95e9-d1ceac966dc3@pengutronix.de>
In-Reply-To: <97baffcd-35cc-49a0-95e9-d1ceac966dc3@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 21:38:25 +0200
X-Gm-Features: AbW1kvafmnO2knYXImFWgVHzWQ-97My7fO0qROrQj8PrD4sC6j0CFR5lpTEhMPY
Message-ID: <CAHp75VfAmqzKxgXTc9TqeFOeGSr_D3NmCa0M7+4Zf37CofrHeg@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
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
X-CRM114-CacheID: sfid-20250114_113903_523938_FC1EFE56 
X-CRM114-Status: GOOD (  19.89  )
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

On Tue, Jan 14, 2025 at 12:06=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
> On 14.01.25 10:49, Andy Shevchenko wrote:
> > On Tue, Jan 14, 2025 at 12:20=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutr=
onix.de> wrote:
> >>
> >> Some drivers have had deterministic GPIO numbering for most of
> >> their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
> >> ("gpio/mxc: specify gpio base for device tree probe"), more than
> >> 12 years ago.
> >>
> >> Reverting this to dynamically numbered will break existing setups in
> >> the worst manner possible: The build will succeed, the kernel will not
> >> print warnings, but users will find their devices essentially toggling
> >> GPIOs at random with the potential of permanent damage.
> >>
> >> As these concerns won't go away until the sysfs interface is removed,
> >> let's add a new struct gpio_chip::legacy_static_base member that can b=
e
> >> used by existing drivers that have been grandfathered in to suppress
> >> the warning currently being printed:
> >>
> >>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
> >>   use dynamic allocation.
> >
> > Warning is harmless and still a good reminder for the stuff that needs
> > more love.
> > NAK.
>
> A warning is a call-to-action and it's counterproductive to keep tricking
> people into removing the static base and breaking other users' scripts.

Are you prepared to say the same when the entire GPIO SYSFS will be
removed? Because that's exactly what I referred to in the reply to the
cover letter as an impediment to move forward.

> I don't understand what love you think this will spawn with regards
> to the i.MX GPIO driver. Can you explain?

To fix the bugs you found. If it's not the GPIO driver a culprit, we
need to find the real one and fix that.

--=20
With Best Regards,
Andy Shevchenko

