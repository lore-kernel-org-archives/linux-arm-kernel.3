Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C353DD277C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 23:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvh5+c9d1qbVeHgj6hfcSp+Pmonb0UmxmVQR5Zl7mpw=; b=NJZcHbPI9EtGE10MZtbNf7lbMz
	fl9s/oMQJUCMxrvB+VoF4vEgx3HEVXyxyilmyP7Eqn8vn1yoTCTep3w1O58RF/45nkfK6K+2T2q2j
	bWL7p6niMsei36/d7dlthaKG6E1hiJzDxduMjn6HBgtJ4Xo5ZveTtyf1GHoeazB1AtCNdHtXzuV1/
	xTm+QvKX/KQzr2abEuKWZ6yQl6KAm8a7rLxkECAcP+48WvYVp24jho1OLIHo1ZCTUgmGWvHIOubIb
	0iU2R+X5oDeoqQFIZuvBALuPkTuOb0m/jnQJA9HGEdMjF21TC2Y9pvq4U8z96GAVjunxtl5jK3++K
	r50i5u1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veLcf-00000003616-2vFm;
	Fri, 09 Jan 2026 23:10:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veLce-00000003610-0wa6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 23:10:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C6B860178
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 23:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02956C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 23:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768000223;
	bh=pvh5+c9d1qbVeHgj6hfcSp+Pmonb0UmxmVQR5Zl7mpw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TrU5JAn8ni5Jm2xeVBKnI1iTvpE9pEvXsoUOkJiUtO2zt6Y2Zn+WuPmVx43mhmam+
	 2P/wh94LKfRQICQ2rZyhHH6txfijs0pp6tgrVFmEUbSRlNHEfTHDpAwNI/kpzlprO3
	 eCBO7cPIMRExmW8qj+Jib32pXH0VEiROHzZd+kpvdTszNXkTM32CfxJ5Ov/ZkbfDhw
	 LG7HKdB7Mlb0n43jt/T5l3szGXQVDKNKz7hUABHULiVEf8+eQKwgftNZpkOdJCInHQ
	 PF+z6j1910z8iglpJGC+aGWkfrZSFBUynujsocf8dajDvQgxJWtgQDa97Xia/QVEIj
	 9xD+kaj/k4ooA==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-790b7b3e581so53653137b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 15:10:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUP80tc7wDJcAdjKVdQzHcTXJZ7RIPSxgL4yCRp49oCHCk73LnPj/2vkcRC8qwWcsx17cF6T0GhGvHKo412bKQh@lists.infradead.org
X-Gm-Message-State: AOJu0YyPg9py3xhR9fWS5LXADF9jvtGOMl4C9gONr/3Wkp8qe+4EiziK
	vvOsTvhLpNDA5yBFGEWXqx0W2O/zfn4HJ+WLaiDNnWb8fVNsCvQQySWYIC+fi7X3YqV9tXMUpWp
	Lxlh7buJPcoFf6wn0hPJsAZCJpmGF3ms=
X-Google-Smtp-Source: AGHT+IFEQO71e4cYNJObSCgFIiqeKEccxRrR8aY+yYr4ri3WGCll3aL6B5arU8gnOcBLuhvTFy39ew8yzQuWGlAloxk=
X-Received: by 2002:a05:690e:1188:b0:641:f5bc:692b with SMTP id
 956f58d0204a3-6470d2f46b7mr12056434d50.36.1768000222173; Fri, 09 Jan 2026
 15:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
In-Reply-To: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 10 Jan 2026 00:10:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLmk3RCf19yPvE0E9X3b+gy0XghQTbmMPfioBkSKkAaLpQ@mail.gmail.com>
X-Gm-Features: AZwV_QjvOySI13iVNOTYfIXgnODwhGbGn87uLlGk8QzCNwneRQXoKJ0Qs0Jx1Ps
Message-ID: <CAD++jLmk3RCf19yPvE0E9X3b+gy0XghQTbmMPfioBkSKkAaLpQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] bus: add stm32 debug bus and coresight support for
 stm32mp1x platforms
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Antonio Borneo <antonio.borneo@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Gatien,

thanks for your patch series!

On Fri, Jan 9, 2026 at 11:56=E2=80=AFAM Gatien Chevallier
<gatien.chevallier@foss.st.com> wrote:

> Stm32 SoCs embed debug peripherals such as Coresight. These peripherals
> can monitor the activity of the cores. Because of that, they can be
> used only if some features in the debug configuration are enabled.
> Else, errors or firewall exceptions can be observed. Similarly to
> the ETZPC(on stm32mp1x platforms) or the RIFSC(on stm32mp2x platforms),
> debug-related peripherals access can be assessed at bus level to
> prevent these issues from happening.
>
> The debug configuration can only be accessed by the secure world.
> That means that a service must be implemented in the secure world for
> the kernel to check the firewall configuration. On OpenSTLinux, it is
> done through a Debug access PTA in OP-TEE [1].
> To represent the debug peripherals present on a dedicated debug bus,
> create a debug bus node in the device tree and the associated driver
> that will interact with this PTA.
>
> [1]: https://github.com/OP-TEE/optee_os/pull/7673
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

I think Jens Wiklander wants to have a look at this partch
series, so added him to the To:.

Yours,
Linus Walleij

