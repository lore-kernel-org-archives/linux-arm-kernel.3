Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14281CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 07:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kg3BU9cKfGHe7tGgdAiZsc5JB/dKxlDiQ/R4O8eZPV4=; b=jK+wxfeJhnJdQvG6yYkwSv9eZz
	aFDHLv4JnLSMzN7IsRmfIiVeaBbI/N8KxcgLrn2eF8571JHDyNv+hGebq6yl6hVs3n057wqdGSs40
	gEHgytFuSUoq1fBLPfdTVs7jVCoDea55t0gD0S05ncvR0rQTqYxl2DjyTWgBXtQw8jgCmyiVvtrcN
	sOZd2Gzs63eDaFPxnmMXiIEGUwI/Iu2+v71xj2+CwM9iFIEHzt96qdPXx3+4Hds4WOYuBQyqR49CF
	PnwJiw59+nrpF4CwZ0/rHxp9HJiJBRfM2MDlCGRrUx1Bm4YDuPR8EYaMVQ0NcrxwfWKPA2mIXJicU
	h3igXEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyHh-00000007ffe-0B5y;
	Fri, 12 Sep 2025 07:33:29 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyHe-00000007fe2-16RP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 07:33:27 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-570d0c280e4so554864e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 00:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757662404; x=1758267204; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kg3BU9cKfGHe7tGgdAiZsc5JB/dKxlDiQ/R4O8eZPV4=;
        b=XJEhRkZZHUTGWtpWeDW4/w5LKzuyb3SO0MvuwewMb9hA9qIXvD9oW+0DXUm/FfJX5o
         /Q1bx7lJ6mhFjcWBlohgXM8GYt5B8IExLANyDtU+PZfFYUEb4szkXCETnF8KqJS30mol
         yJxPTSyPxy+U1wJgnVgN/xYEP6qm97adVEsqfn8T+uXSyzIB6rOXxThPwpbJBLj3d4yR
         +VZAYBebu8J/XamF30gBMHGvnBa0skPC434Oih+P5WA77YrJ1nFynXp4xaWRwqz1iZyi
         cSykjEErKEfQes5nmAF6Wwv7HrEVQVc25nprSm4shuogygSje7qY8kWrM1jN5ajIaboa
         ePIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662404; x=1758267204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kg3BU9cKfGHe7tGgdAiZsc5JB/dKxlDiQ/R4O8eZPV4=;
        b=FHa7FmOza5LRgXT4le+3NT5UAi4yjLYejFO3dz8taIgKhQxtd1qWfaFVLuD1FC7Xik
         dogtp3m8G3gqq/9TMgcgpUnEXg55jZ9DTIvkBfARterPWzy9372UTiT9JEg//LKIRTAF
         KUGIedzeurPu6h8E5aR5PNNDKLRTp54NF78IgUtodaGG4pez6F4TL1/5qE9FsWXQb6sB
         k0rZiNu+L1wzrizENHkaXZXprXUSrKLiuDjRhu/hIQc9yh1myxOgf2u4JI9GE+d9HgiI
         4Ury0V8Ou1rb41FqojFixRTYIcamdHXplBv5+SWx/IooJxrftopEN3a/akDGYWM9poUO
         v4gg==
X-Forwarded-Encrypted: i=1; AJvYcCXwK6tEx3zVIHxI7LquH4pPb0qsuGRGfo4ERqibpTM1/Ups5JNdaw16Af5lLeXui/X5H5iT9578XRE3mK4eD18w@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5C3F/YR4KXai2m6eJrDacX36BxW6Ig8H7AQb0QEw3er1/Uw8g
	Ok6yyST2adu/y5E7zVWHh0fXnD1Qa5SUvnlQKjNlqYFUW9Km6yS3vlNVqqTHtcA6XUr5e9or+NF
	CVFPoIK+YAb9g+LAGoNmNdPAJRnP1/lyu7LXSr0AWUw==
X-Gm-Gg: ASbGncu0tDqTAkhd3zHd49KGmvMVXzQJuOXvW5UscF76w6f3vEIlWO38v9/wR5Yyx8a
	W/Oj+gDyL/wuiX7mJpUvEjxq0GCTBjpDGXXvK6zwuffDBjW9rsGXgX8pyEcb89Irio1PJ1YXhim
	WbPEgm8LohJfR/ClMgBfMcS5y8OlcrBg6TKPL8WN3Zo/lnbLRGVsbJ+CtFYlxOyvaAf7Ocz26/n
	NXwM+LCWfQFCkYuPQ==
X-Google-Smtp-Source: AGHT+IFqJ3rG4VGz2N4HeDjhdE1zZXrIjMGRIFcSDQMQTPILLpM42VNVO1ib5uwXHA7KeYqbyezpYRqeKhIIV796t/0=
X-Received: by 2002:a05:6512:3693:b0:569:a257:c6d6 with SMTP id
 2adb3069b0e04-57050fe351amr473063e87.49.1757662403635; Fri, 12 Sep 2025
 00:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <CACRpkdb=J+hiC5cu+g0Z-gqzpG8PgX01CXc4P98FfSSAf7PZEA@mail.gmail.com> <CAMRc=McbadZx1yK1jGeyUnXAFZgfA8YpLwacmqC0eMonS-c-9A@mail.gmail.com>
In-Reply-To: <CAMRc=McbadZx1yK1jGeyUnXAFZgfA8YpLwacmqC0eMonS-c-9A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 09:33:12 +0200
X-Gm-Features: Ac12FXxWiwLmhQls14nNfaQvMLfIJjlBZAsZhTSA6_U4hnix-0Aq3t1bNNwFxXE
Message-ID: <CACRpkdbSp6ScZrzUtdP0ojP10yOTsbnd33HqgEVdiSwPRomuAg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 4
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_003326_304395_B27E37CB 
X-CRM114-Status: GOOD (  14.70  )
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

On Thu, Sep 11, 2025 at 9:38=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Sep 10, 2025 at 11:32=E2=80=AFPM Linus Walleij <linus.walleij@lin=
aro.org> wrote:

> > I would merge the first 14 and keep the last for the later part
> > of the merge window when all other trees with conversions
> > are merged.
> >
> > (You probably already thought of this.)
> >
> > Yours,
> > Linus Walleij
>
> I already have both pinctrl and mfd changes in my tree from Lee's and
> your immutable branches. I pushed this into gpio/devel and it built
> just fine.

Ah, excellent planning. Smarter than anything I'd be able to
logisticize in my head!

Yours,
Linus Walleij

