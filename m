Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAED2C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWdKSLMGtVhehTwaDiWa/QdGdTyZRwxOUPS5ZjyNBak=; b=XX6Ima8AUsWJW0qzOQ/o+Wizyj
	NomGm+O67V0eKpEyZjyaxZXAlrxSJ4QdFJKnzpxW2kPuWZ42Al9ZGXZ88rjmke/hUOizIsOQYNA2D
	tRH113Zicw21tvMQz9tS7Ryx1tkZXdZwUObQvHcTGqEubPGIKSqZquguCLxomYcZBFNPfX9cuT7eu
	XIcy2j4uUD0MOjZax3CCy6yJD7scdUfu4PsiCFBhwIftkdxiXpjzfbrtqrzf/dCNYQyKpN+70iAUJ
	lu12leufdwErkPvaS6ByCmkgIow3fXR6vmvOLZD1GeCwzuJM70GOwkHQoiLr2YiPQuLxdbrJP+BVE
	Ya44mPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1n-00000000Mop-0TBm;
	Tue, 25 Feb 2025 16:43:27 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwsZ-000000004i7-3GiY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:29:52 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5452c29bacfso6224537e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 07:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740497390; x=1741102190; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWdKSLMGtVhehTwaDiWa/QdGdTyZRwxOUPS5ZjyNBak=;
        b=MXx4lixaC+qwYbiv5jas6xGPRCLlLA9jblVPvbGCWgVNHlvcgdouamiDEuYrdI7iMW
         a2Xc85MOKLIIsh8cSahP+sT/AMMxR3YxxZKKSOsUWy//OK9htwjruW0cZAWjyostpvcU
         LvAOl8LuzJDXdDTIbO+F/uuYCyVxijws5R8ods9o4m8lJMI/+JaLCe1WVeqzVbmH+Oot
         DaKOdQE+bYUjbPx5zAwJt4kAKnanPiM8szNFGqAmltGx+lGrcQR3drDK5aw28Q+hrIZQ
         rwH94gU17Qo3k3/BK74tFxU150pAU/8BUJta2z7h7k1/gOQtE0eE2gX0X3lsnUe9kXAI
         tquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497390; x=1741102190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWdKSLMGtVhehTwaDiWa/QdGdTyZRwxOUPS5ZjyNBak=;
        b=PZsjc3QNLkIHDxcdo66ShcohCZkDXcsTtlKaofOz1TioLuMsVJjiqIXC2AjmlByW67
         Ucjv3EgJ8ZqgnLUB5bd5jeKH1h2BsWmCeC3z48uyyaPRxARs4UNUMqJiDZpHxUxzNGX2
         ZeC9i56Ak+sOrl0k9XWjclJWURY4YOuA/k1g1u9Aj6TcJtfCqTaBs3jjBzjRFZNdgp+G
         ong0TyidPbouiNy7FTscWBA3F3jAfORJl5qR0REnzh0fELQQQszfgUxhCMzjBee1hniU
         Qf/XyugdQRZbMLaZLl82l7l/0kNnhk4voael7DjnWjDLiGVrsACzjfzpPZYz5urDnb+8
         4nXw==
X-Forwarded-Encrypted: i=1; AJvYcCU46K7KcTMubqg9iV1KVnOkBf/UkFR+vwAskC6XxHAz8DLjwjOsmx89xgDfMEiaFpbus7MR6I8fWmBDfePVSrcD@lists.infradead.org
X-Gm-Message-State: AOJu0YyVyvAmuIzWtLS5HE0uFqzcNwDVGeYodLbnvBfc5wmgASO6JZJb
	kKT9sAGrVBwp/+AaacYSZHgYZZt0IiA7AtE2ZuJxPzcVm/a6HxhMbqQhe/vzflgHOBf0i0mLWSG
	WOFwVkaLiZuBIXcuvhTze7Pe9Di3dlCD+XycfXw==
X-Gm-Gg: ASbGncvg+MuGuqNzfrthriDI+4x4cZlBcNknwep+TMLkVUqry0eizE6YZIGlwLoqBcI
	2t+QJ9u3zzKih+7bazpZC+7UNsVd7UYP9NTDVg9WF1Wl0xVT9lUwl4VuwrGhYwo9xcVgI/mCJ2q
	8rcLEbdic=
X-Google-Smtp-Source: AGHT+IHvpjreeVdSU9R9yS1LahY6jIM253YORDAz6aGw1c4d6Ig0oMzawVusMy/Ox5z7NzVK8VH5Bf9FnhT6749AFpc=
X-Received: by 2002:a05:6512:2204:b0:545:2300:924d with SMTP id
 2adb3069b0e04-5483913b648mr6916367e87.22.1740497389960; Tue, 25 Feb 2025
 07:29:49 -0800 (PST)
MIME-Version: 1.0
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com> <20250220180427.3382482-8-vincenzo.frascino@arm.com>
In-Reply-To: <20250220180427.3382482-8-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 16:29:39 +0100
X-Gm-Features: AWEUYZkxyqLZJ8PShNH5_rYAenOAI2e1xZONqXj_RF2KAU6bd0KxT-okASSmRCo
Message-ID: <CACRpkdagr5EhOL1K=SYHxpT3KV7J2WypynOEpTmExK16Nx1ezw@mail.gmail.com>
Subject: Re: [PATCH v6 07/10] arm64: dts: morello: Add support for common functionalities
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_072951_814443_35945BF3 
X-CRM114-Status: GOOD (  12.27  )
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

On Thu, Feb 20, 2025 at 7:04=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> The Morello architecture is an experimental extension to Armv8.2-A,
> which extends the AArch64 state with the principles proposed in
> version 7 of the Capability Hardware Enhanced RISC Instructions
> (CHERI) ISA.
>
> The Morello Platform (soc) and the Fixed Virtual Platfom (fvp) share
> some functionalities that have conveniently been included in
> morello.dtsi to avoid duplication.
>
> Introduce morello.dtsi.
>
> Note: Morello fvp will be introduced with a future patch series.
>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

This looks like a good base to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

