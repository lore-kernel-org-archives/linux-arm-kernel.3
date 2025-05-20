Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD86CC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 21:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuzhlNqyJc6n1p51Wy6w2ws8ML+CaNuBHjlDaIn4jws=; b=KREyi2TduZLw7Vr362IbRjxugk
	emUf+OoIxjJJrGbqWbGCu5KruiaDFKXPZrFV6T6Arj6zGOXe+IaYle8pwvgTvfDFRsJyMk9QwgmEt
	/Kl4pntdbp2RdFRiK+swki9O6HQpOMd+w6Vr5DPlZ/mrzLvOkhck4xLJQmGVckLbKAZ11XOjwX2/q
	OTpg3PE1t3UR8Bjl63JX7oV+c7uPV+hCbuLAqi+3GGI7+li1efW0v+RT6mGQJxWXgz07l+XA/kyP2
	XoK9kK+pSQ+uQLhuv+WKiGYbvJWEsgi4feCwrEKLKY+sRH0TxlucYrPQfbhyMF7LrvpgbQwqj4hEq
	TjzvD1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHUwM-0000000EEHZ-3cPU;
	Tue, 20 May 2025 21:56:02 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHUu7-0000000EDm0-2FOe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 21:53:44 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5499614d3d2so7488483e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747778022; x=1748382822; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuzhlNqyJc6n1p51Wy6w2ws8ML+CaNuBHjlDaIn4jws=;
        b=w01vwR+nPBm57XLMgH6AMhHscL2ZE3VyDXtFTIjJBzTMG80KSbzTldsZyMgB3+gmAm
         mXbaUJTY5GbX8WLiEWnxioTunV6h8hglaVy5kWnMs942Gh98aZsaRxI0b8E7K1tL/gem
         PNsOMaBdFQpMa4PKE4xRG9slD93n93KMvnGT9o3hM947smkZMD2tYG8XJt7J2J2TBQhO
         asbR8xRwYh2nrMixHI7jM3VqmWCwvz7NIafzItjJ349FiW6+PBR2X52UsZYmzoaetT8W
         rFb85wU6h84ut+0NaKNfMJ9QQ+YC70AcJY7Z9jj+7xWAtLP42ReQfRpFAgwnXEbeGTN9
         VBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747778022; x=1748382822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuzhlNqyJc6n1p51Wy6w2ws8ML+CaNuBHjlDaIn4jws=;
        b=Y2AbKAaGN3alamV2MTZIvfq+0fZNJ0hJHSNU6zK4UzeSRMF8ogmM5iGowTdeE/np/E
         s9M9F06O7vEqbZsuF94RuOxAB8DJqIOEMVb9TG66wvbhW2E1xWikxotmO7PZ2BDZMh6P
         GMGDsBiAIG8oBYncnHOe8M21zIhtW3wpaR9mWecPUGNWpQYeVLx86DyOYGLHcq4HM2NW
         JIklHnE97+/niax3iPH1yDX1CjlL4l78MwyO4hzz+sPpe+/aNVspP3kM7Zu5af9TZVvs
         zg6sGfI71lisdU2nVBvnmbhHzxpacn3kwaWfm/9J3XSa9Yu/u2kAZKkt/Nx/Pe7xw0Lz
         SlqA==
X-Forwarded-Encrypted: i=1; AJvYcCXSL/xs6Liq6BO9knJJzBfREJj7PZ3VP/U4U5sB3ll+4V64AI1pud1BTAah5zrOZm9GtqzfqglfJbTLKOdqrbDB@lists.infradead.org
X-Gm-Message-State: AOJu0YzvbOoGL/M/sJe7KAdhKCcPJnCCjZ5Ww0YiyNTzoAr0vI1KQs8L
	GKhWHA0FwUiSNo2spEx5DZ6sWZQX5LkinhlCr1bODwyywpMfMcHiOrDOY/hTi8bVNJ3w1gGyoQ5
	OKnPUoXFOAIgc5NSs/bWddC1abf9+wEyAo1/2eh2pAQ==
X-Gm-Gg: ASbGncujVzdiyE2Q6QD+QZCILRxLwBQmQAHcHcfwyBdFIFqeBwRcME40WVb8GW7Cr+a
	kxUvUkb7BcZs9L+ziXn3fJoksoZaRljHZLkxTjXTMNZGcq7hs7Wk0vwtF8K2CELGlHfx3dMxDuq
	7uJmG6GVmY4KKfZSRqn2hanBm2TCPsqr8l
X-Google-Smtp-Source: AGHT+IFDmcGo1axArvFCz2dx6uFyFqkML6kJ22pcoHKMMAfAxgp0/2ysMJ6m5JO5I5AyQlwSQbgeg4ij02FeQU7FSkQ=
X-Received: by 2002:a05:6512:6317:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-550e71b4e43mr5955773e87.16.1747778021614; Tue, 20 May 2025
 14:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com>
In-Reply-To: <20250516-gpio-dts-v1-1-a9c3505f54c5@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:53:30 +0200
X-Gm-Features: AX0GCFsoSIZvC7lGTFU51O8wPs6RsCUHG2kDfSqZhe8h4hkLrUFi0bw--0irOtg
Message-ID: <CACRpkdZRdFLyGJrgAf32V8snnYW1gPvbtxSPQaSBFSMkt+y08w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: add ngpios for vf610 compatible gpio controllers
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_145343_577699_81AF14B5 
X-CRM114-Status: GOOD (  14.74  )
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

Hi Haibo,

On Fri, May 16, 2025 at 12:57=E2=80=AFPM Haibo Chen <haibo.chen@nxp.com> wr=
ote:

> After commit da5dd31efd24 ("gpio: vf610: Switch to gpio-mmio"), vf610
> gpio driver no more use the static number 32 for gc->ngpio, user has a
> chance to config it through device tree for each port.
>
> And some gpio controllers did have less pads. So add 'ngpios' here,
> this can save some memory when request bitmap, and also show user
> more accurate information when use gpio tools.
>
> Besides, some gpio controllers have hole in the gpio ranges, so use
> 'gpio-reserved-ranges' to cover that, then the gpioinfo tool show the
> correct result.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

the patch looks (very) good, but it seems the .yaml DT bindings need
to be updated with ngpios as well.

Yours,
Linus Walleij

