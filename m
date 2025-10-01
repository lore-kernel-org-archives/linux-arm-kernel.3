Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEB8CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 10:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXaRvd/Tl3m+OCCyeRNRvJ/5mgQ4gfksuRE7c8W+vks=; b=Km+arPwvcQkbYfw1OPJN6Ekg/e
	U/hK6mwb5WV+9alLI1njGRTCjw5J0R1Dh7zdISigINf5PIpxlaoCF/frZ3/VgHrj5XX+C4XfFPtq5
	x4caHTHyjLTmlS5S74njFQErMnR3zj6MZsGC+q+2E99NmvMxUvM73DATEqRN6/5ceVtRwumfFNpNo
	pUZO0OZ5eyB3F3/d2km672JcDVNf7xHB480v5OZO28t4aRYIpbtcMi6xL9bdpW1cVI6C5AoG4UeuH
	/ZseTRhjcY7bqGH/pDZDZ7Al/FDGcP2BKumeWhLLspaszpqh7POphU98jK0+c94Vg+9V+lUBoPWbo
	keoOX4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uSZ-00000007I94-1MuQ;
	Wed, 01 Oct 2025 10:53:23 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uSW-00000007I8i-2m2q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 10:53:22 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-36bf096b092so98448781fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 03:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759315998; x=1759920798; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXaRvd/Tl3m+OCCyeRNRvJ/5mgQ4gfksuRE7c8W+vks=;
        b=CXiLLfMygcBHz78RL+6sBqB2wAlw3nzhyJtiseweqOXg5XmzT+t18gZdGLRu2+EmKL
         pGEGNcaXNqng5q26BcHPqEuFLsk+duo4EAC3OQbzRCD3wsJMuPGef71X4EcPSLieO845
         8sPVwY/girxdiSi7dEmHQesgLh/Nt7nDJ7VdiQxF4aE/e/ejav442XhfVtdNbqGs1oOp
         LK03YNyiiUf/wVpz49IFgRYnKQrsY8iYg8BJbqurge2ZDlhgBQrbRXaKDV9PtmCIrXWz
         kgGC8bL7kRVWx8QfnXziePd9MNT2V0MbGnan4Hguw2bRJQZf4Om947Yi6Cs8VouOrZjd
         vxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759315998; x=1759920798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXaRvd/Tl3m+OCCyeRNRvJ/5mgQ4gfksuRE7c8W+vks=;
        b=jS5amzoBonEVO6sW72t+WmPPSHezKtUr4hm7aU7R6ys3HqmTXd9YbRgPDzS0qX0RrS
         0eWCgR1a6duef0qf+0lWB0ghLuIBpDLY3VmB6MhSfo7DOo9tzgRwV/VtQqkkawU+H8h3
         1VaA2ezDw0GtXUFNFy+XqmTA0pkjF8fPjuMcYlqagOL8KxXsjljpZ2c1d01hzxPeYyDD
         Sc8rqwsj7uV6J1yl96SRkSzJxYPCydwmK5b867LWt6MW28tuEVSls6pR8IR3tS4FdveX
         UXue0d6fEMVxVQi1ccb4yudP3M80m13++ApdtFG9nBDD9zeDwSHZQYiErSK5QZOIxPZ6
         STPg==
X-Forwarded-Encrypted: i=1; AJvYcCW5iWuA0QZ4C89503KGMpo+0AlND1IfI5A+JZcbSdfnyZwHYP4Dl3O3AWG1xauGjGKLLj380sqVz+TtuagE/Ueh@lists.infradead.org
X-Gm-Message-State: AOJu0YwneXw29SE+JRbGpRyaybhGk4bQkNqhjjBMgY/15O+zU+ZMUoys
	+d1WTt0NDEWDbvaUWhQV4aMIuGiUrUOC8D9gQ1vee8EOYcQm2LEMxu9x0UPFPYheF0tR2XhMenK
	PlWtG4LkFjZj4ipZvASPZnDZ+x112wD5O3tQwf394Tg==
X-Gm-Gg: ASbGnctzk2U8/ItNMUSzkRNgfN0J+XOP2OBUnNQxr7la+yPCsTtAiFGEaEqS8cQrSpb
	kUMI9EtEjOG86Vb/aoltjN7+i/ORDPSee/5rx0siorptPNGKId2L2EGI9Tl+cPtefhMnLpqzyhV
	b0MCl9FKuB8ZCURDpcpkLY91gcBV6uJL3b03wZt4DgsJnwO7g3KEoHCGcLxEaOgdkXvoHytMbtn
	yhvP3xCTsokFXFArLTwpZFd0+mEAXM=
X-Google-Smtp-Source: AGHT+IHNsDtiUQt/i2npQARVssi0DJ3+LBTFoSnvhtZVkK/xmqXN8oNQNgTvZTXOiQqw4WqXcNYRSxbiHzvdCA73Ztc=
X-Received: by 2002:a2e:a7c1:0:b0:372:9fd0:8c40 with SMTP id
 38308e7fff4ca-373a740495dmr7206011fa.31.1759315998524; Wed, 01 Oct 2025
 03:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org> <CACRpkdYcVtJjRHRJ8GgeU7rZDuyaJKu0vgcknb7DsHPjZGKGuA@mail.gmail.com>
In-Reply-To: <CACRpkdYcVtJjRHRJ8GgeU7rZDuyaJKu0vgcknb7DsHPjZGKGuA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 12:53:07 +0200
X-Gm-Features: AS18NWD2nrQaAyXYNX4TJo-95Uw5nXLztXmSEl4xWN8QeMmA2KtvYABQ1GxMrZg
Message-ID: <CACRpkda-ZvrAC4bNLnA+ao0Y8-Nd_-b89N6HU10hhEdaOUYAjw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
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
X-CRM114-CacheID: sfid-20251001_035320_724778_6D835C88 
X-CRM114-Status: GOOD (  19.35  )
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

Replying to self so Bartosz don't have to tell me off...

On Wed, Oct 1, 2025 at 10:49=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> and every GPIO access on every system will be proxied
> and then this better be fast.

What about I read the code before I talk :/

Inspecting patch 4/9 it is clear that only GPIOs that actually
need to be proxied are proxied.

> Two things come to mind, and I bet you have thought of
> them already:
>
> 1. Footprint: all systems using regulators will now have
>    to compile in all this code as well.

This still holds. It could be a concern if it's a lot of code.

> 2. Performance, I didn't quite get it if every GPIO on the
>   system will be proxied through a layer of indirection
>   if you select HAVE_SHARED_GPIOS
>   but that would not be good, since some users are in
>   fastpath such as IRQ handlers, and the old way of
>   sharing GPIOs would just affect pins that are actually
>   shared.

It is clear from patch 4/9 that this only affects GPIOs
that are actually shared, and those tend to not be
performance-critical so this concern is moot.

Yours,
Linus Walleij

