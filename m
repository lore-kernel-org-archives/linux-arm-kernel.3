Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFE3F41986
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duY+ZROtfr+N1IL089g5oclcqG4kl39QwJmUtTLl1Fg=; b=dqeCT99MIgaGLq+R1gK2v7z7AO
	ecH2k2uPlbbikd/BnAADw4WdTmGA3D8f57uFGNW5WqXU7ZropxTqsTgkx6g230ecsWH2UO8esE+4q
	cE6ldON3mD+242JolcaL2sKsOTm2KeLUnADf6rtk8haKs5Ev4CSB7x9ej3m0urHx2gifMze5XlDxU
	v5aE56olB98XORgi5DUik5FYLC7WBqZ//poaBhUcqCgQO7iC7mo2qZkALcaLzhKid0CHwZbeURt9M
	/+Xa4/CMKatWfL0kN9cx/LzxVPpqWRCiun/Cx5bsUO+oBqPwls7kazp8e545gyoYlQppMCezdcXd9
	gih6AZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCx7z-00000000wvo-40t9;
	Wed, 15 Apr 2026 10:05:47 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCx7x-00000000wvP-2l7O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 10:05:46 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-66ee7b9af94so2340040eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 03:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776247544; cv=none;
        d=google.com; s=arc-20240605;
        b=BHod66BxEHVbmBCJ8MwncYmI7TqetV05iu790AYjUKKC2V3Eh4XGJ4XAtydT0wBfgr
         ASm8ExYTGXbZy4xFZoo+oqiNkoJwMHk/szC2qS/cr3S4JgDeUDCiXzwl9sLcGDI5YpK7
         RigfvUh+b3MlF2Sbcv3ua4SjAgjWEKfMCXzucrRbd7N9+qODj6URaHMryB4OoR0ws7j2
         FH6LcFLVdLutUH+CAFn3LXhDk5490CV30cqp4En9GNPvmKYe1vUSGo72joAQaywiyuzu
         UHLcXgUAMtANK243Cj0t2eKBao+iQWzQxJND2OMYAFuoIrCDK0nUlupLIYjN2ziJ17t1
         lzfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=duY+ZROtfr+N1IL089g5oclcqG4kl39QwJmUtTLl1Fg=;
        fh=sLmRS42T8B/ysrdozH+HlkbqDxn3Xrus78s8LD6cHfE=;
        b=g5m8tgmqlwv/FmuPT5vv6VUL3ym9gnGFSBQE8qvE6cXzWBqMHTUSaW9xhm7hhSYKLL
         rvesxQa5ttlqa0DekCekZZS9g4DE5w1Bi2LDMFlVLAGm729fhMbNjXWYqVW2zzFddV2t
         OquwAwm+T2HvZ7HSkKik2+BzHnFPm7hJ6ySPFBn0zDQQJ5tniVp9OygUO2A3PXuIBryN
         FZT/HtTdMOxF8Zkua14jA1RDpIMfwx+7EH+ICkqEg+CZeRUB+4iLbW06056rEL7Cpw08
         RnLDXuDqHn3S4FLKiTwnGeu6z+bQoRhkW38oWB1Gon9ktd2XVFMP8ZYjlOgDjRNH9ip0
         8Nyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776247544; x=1776852344; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=duY+ZROtfr+N1IL089g5oclcqG4kl39QwJmUtTLl1Fg=;
        b=hMVNQnTlvyQY5bkEoAV/nKo3C8ZdhKuPYAVt+WHcv5hEBjvDzehH7dSBYf6Vs7ySVi
         D7Spg5SupmEqMrW1KAbE6nVMlokbYvzB6mPdEkuBj3pCceXSTLDrvdrLY6U57HohVuzY
         sm/QfcsTu3qxMc4QzEeSDa/eYg4JuIMOUSsx+DyJCm1ywzs7pZDWZLdpCbTfftKq1c04
         iTP1/8EPZJDqMvkrhZQxDWFGUw4vDxR5SIzLwqETGyh0JIkG83aeIOo8oTPVZMnVLWM5
         a9vFAVDft+ccE96Xg7qWWzQw4eKbfnTK4pZsxGWy9Hy2AlLQYtU1/KGnvocu9js1rnoh
         EPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776247544; x=1776852344;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duY+ZROtfr+N1IL089g5oclcqG4kl39QwJmUtTLl1Fg=;
        b=odlnYJW716VrH2Wk001XhaACTFJC/vxGFp21llJXi3Y3Xev23DXzmX2Byi7Uem6uYA
         31EZsOACOvfb/P6oANC8lXz6LwkEia6hSF+iYMFaLNJjrzrztY7TkbBMFp2xXCG0Dios
         Py+ExRILoR6HcDPYT3JHFpuajlcHiGsWd4i8NerGEv8R+WXg1M6cq8NzcFsDvhhCAPsT
         4+WWUfZiMoF7nqjXtc0EgsIQKu9Fdby1zsg3hO2x03qZj9lDpza6VORmGtjt/9B4zDlV
         EhuERFJGiHhVsruLZG+eIpWYpkmaPhAW96y3Y7rMg9ybPeMz1CedI/2Q+50rllihEwmH
         S+7g==
X-Forwarded-Encrypted: i=1; AFNElJ/LBTASESrfrzPdjModB98IhXWpKLSKDX5NUoaM8f/k3Jvdbhn4fcr5MFbRrL3DoSJkeqF+8pHuDqq61pRon8pz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz28s4KqavhsGHxCXIlHU+JfWbHXG/f4g6o81k5QUgi3I12Peg0
	rbaMvR7V8RxCZglCEF8xulTnH+xaX/LgPQsdGSSXnJPETOdCDuk2XYM8yGbkqgT632aqEmnZpq+
	xnY35Ic1Kh2Z5RJHjKDIaLeqrIbQtNgw=
X-Gm-Gg: AeBDievs8uhmT8GzKItfj8ECdx1ek94hWEXwWo2h9JboV3ul0WhYQQCsnoxHJ0PywdH
	giL8h50/zyyKEbgvCLcxcvg9gKibPwn+dunSo7YY/xU7InX9U1yOm+d7F4BaNQmJ7baa37fGGEo
	lKcZcvLN9WaQB7ZSiE6x/0wkUE20YacGfoHAgVG2zPsmQYCLoWgR/6Czn+Pc21+VUiAiyn2Z7RE
	mNevpqEpXDrZ2FOKCKKJVsWx0bd2s+WuU6jNO4K9JyrRsh/rxvxpc/BTvInzdRqaVZHWcKUzgvY
	FuhOrPIE
X-Received: by 2002:a05:6820:538a:b0:67f:ab29:e2d7 with SMTP id
 006d021491bc7-68be7ee673bmr7560700eaf.32.1776247544096; Wed, 15 Apr 2026
 03:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260226055521.1655243-1-pkleequanta@gmail.com>
 <20260226055521.1655243-3-pkleequanta@gmail.com> <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
 <CAK8yEODCyYxkggU+7=xzWFcXP6RMTpNbHyYRHZhahX7=b6reqA@mail.gmail.com>
 <435616b8-8d4c-4814-8f21-d667755473f1@lunn.ch> <CAK8yEOAYC0iApNHBApt+xu1Fz=+N1wX0XrLGOPzmeRq=OjWnhg@mail.gmail.com>
 <e7a1588d-b4d4-4aa7-ba94-da3e2591d49c@lunn.ch>
In-Reply-To: <e7a1588d-b4d4-4aa7-ba94-da3e2591d49c@lunn.ch>
From: "P.K. Lee" <pkleequanta@gmail.com>
Date: Wed, 15 Apr 2026 18:05:32 +0800
X-Gm-Features: AQROBzCKi3mcri0LxIDQl6oKuIIwXm5p7sK3cRsVPkitktyR35BUd8JHeo19VuI
Message-ID: <CAK8yEOAOhY25R5qt82LUkGifg_9HLia24-E=WxoEwCdbft1eMg@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_030545_702628_98B99F7D 
X-CRM114-Status: GOOD (  24.13  )
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

> > > > > If there are no devices on the bus, why enable it?
> > > >
> > > > We intentionally enable it so user-space tools can access the switch
> > > > registers. I have added a comment in v13 to clarify this.
> > >
> > > Why would user space want to access the switch registers for an
> > > unmanaged switch? It sounds like you are using Marvells SDK in
> > > userspace to manage the switch, rather than using DSA.
> > >
> >
> > We do have a custom user-space daemon that configures the switch
> > registers for our specific use case. Should I remove the &mdio0 node
> > if it is only enabled and has no other configuration in the upstream
> > device tree?
>
> Please just be truthful that you have a user space driver, so need the
> bus enabled.
>
> I also guess you have some other kernel code that allows you to
> actually use the bus from user space? The typical ethernet IOCTL
> handler does not work for you, since you don't have an ethernet device
> using this bus. Such code is unlikely to be accepted into mainline. We
> don't like user space drivers when there is a perfectly good kernel
> driver for this switch.

Since the kernel driver for mv88e6xxx in kernel 6.6 used by this
project does not support LED control, and this feature is only
available starting from kernel 6.13, I had to initialize the LEDs of
the 88E6393X from user space.

In this case, should I remove the &mdio0 node?

P.K. Lee

