Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D080CE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+68C8P05ehiszBwfU5pbI3MewYs+8o/ivU0GxbGrBsA=; b=S6DnTQfBHCCFRGsK3CiL+T+6vY
	Jns9Yj9WUcgHJwdyB1l/x8yJI+h/LiFBkhPTBLvcjLuqEw6X96mRV9X6n6Sk+sAz4CpihCt4kS8p2
	PYu0mQ/IhEdMg6NWXROPLU9VzzSZGaROC5Z2CaZZP51V9GktUjB+V4uH/+L4c/s01bYtKaDHAveJB
	dW9fV6qC0N3QfMrgbU9s8MuQNCnshfY7OM2i1JTKxwyzfAPu0KGXXmtGxOzaKPybvYHZYP4P9NLz9
	9Rkpy4xAIZkMHa/uJtZX/sorYHQPclOkGYTuDyJOocB59fyuP60sdBtjSs2pJXT4IYi5Xs22TVwLR
	ZoAqGqbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwU6-0000000Cipa-0zZP;
	Fri, 14 Nov 2025 16:17:14 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwU3-0000000Cip5-0dp2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:17:13 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-640d790d444so1965747d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 08:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763137030; x=1763741830; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+68C8P05ehiszBwfU5pbI3MewYs+8o/ivU0GxbGrBsA=;
        b=FCy+GDbwVU4WG/ilqzXQI9ayttURhi48ljzVN1DmS73rOO03tuqQArSIlBYRLWiSf8
         1MQEPS9DxtzEV0HF/Zl2Du5qIwHu5rPA6i/lp+VF4ALIQ5vA4ytIff4J6UitZ5sXZXSG
         wVWaDq42gqeZG0ZRUt7rh++VT9myuy9WEUhjet6a14aXvSew7VGXdSAoEP517bnS0skD
         qAUvNFrc0yVe3DzflG5EvyW7riQNj7LGv04TfUUPcTjHMtqgLrK0JYM2CblfWhZp21tV
         pymNJOLS3aCmRWsnkzMpwHmx7MwDhfxnk/jmq8FnbDgguOVKaH/MvuKy7M1jDS6Y50dq
         xH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763137030; x=1763741830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+68C8P05ehiszBwfU5pbI3MewYs+8o/ivU0GxbGrBsA=;
        b=Bpa9lGLZEccJz1TGz/CaTtDpZMpbZvst8TUf2L5vCINjCi2cHFeRXwXBPFX2dJMvEW
         Jn+/x9ep+4xMub+KN8I/fPxllzCwF4bUZ6CbNptmHqV7C8w6xVVYK0y71ZTxkXuiOkeD
         5Q+kgk4OINYjqMdnFu5xDXqwJpljvp0U1ShXGYnDmLd+ZQlT/Lvefc6g1aGsEgQh4qQR
         z6DJm1O9SvlulqzicZ0xv8J6tImiNSxItv06Y3FYvjn8mseMoeVXDgyPPUIxxdUWD9Lg
         DJAYSDfGeVUpHOIPdwgiYq37aFeJuAM7fkvd3zotpEDXhmbEVKc0boX8q/lfUMilg4Bf
         emGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgHi6u8rssSJNn3kX18TSY5O/X+rZ/tjgrxslbhy6JcSvX5rBBaDhWEGbZGw/67/QOpXP2z9jlwLFSmhLjJ7QF@lists.infradead.org
X-Gm-Message-State: AOJu0YwT3ALhQtEwKJUMPb/NCGk5eegGzsdqQ8TexLW1zcHjgmYNExpL
	lMYxtzq56LxkCB6KNz6q83QQzRv2q3+Ev63Micb8BjOnCvGg3dpdo8VFbr1XarCtDwkMoBrXNrh
	ZGD1+sd4jszpRiSGLzJ7rvNQcRC6Yy4YaJgmNFmZ/bg==
X-Gm-Gg: ASbGncug0IrPSmyBqvZbltgp4hOSiDGVEtZWZvxBZTw9Ig0m6xjJUUmg+ouklrTRJl8
	yVu6eMA4RVFwibATjkzbzb4E+Ms2YBMNJLg+7mIpn1blW6z5B8a6UKpVHlCnoUQ+HW/9nqk339r
	CHslomVlusjQJlE8cxqAf3m4bmSGYKFy9o2+pJWxlj5+g9aAgWzY009R8WKteO+rYLWwbO8vIDC
	6aFdtqwjRcqBAszV2Vp0UMzBXKTmYkjafsluY+JAo16ykkhdHLMiH7N+ywSYqo70N6TV6QU
X-Google-Smtp-Source: AGHT+IF2u3OHz+gDlMtDxnSWseapvAQvqP7XLj7Iw/7dpTrGPniYJ5fgz5OjyeTX2Hv74MloNFC74k8FEtz04zmSx1c=
X-Received: by 2002:a53:d057:0:10b0:63e:2d17:6a67 with SMTP id
 956f58d0204a3-641e75bbe5cmr2760050d50.28.1763137030018; Fri, 14 Nov 2025
 08:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20251105095415.17269-1-ulf.hansson@linaro.org>
In-Reply-To: <20251105095415.17269-1-ulf.hansson@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 14 Nov 2025 17:16:33 +0100
X-Gm-Features: AWmQ_bnGF5L9SDMykII4EF15vkBInQsc-nLOhsh7Tw7Z2aJya79QRcFM--SxzKQ
Message-ID: <CAPDyKFqtJDoFwCB8_GG1XUVmmbQw=Wc+CEfuC0V3qqB6Xz3YtA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pmdomain: Improve idle state selection for CPUs
To: "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Maulik Shah <quic_mkshah@quicinc.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Ben Horgan <ben.horgan@arm.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_081711_198196_21FC902A 
X-CRM114-Status: GOOD (  16.18  )
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

On Wed, 5 Nov 2025 at 10:54, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> Platforms using the genpd governor for CPUs are relying on it to find the most
> optimal idle state for a group of CPUs. Although, observations tells us that
> there are some significant improvement that can be made around this.
>
> These improvement are based upon allowing us to take pending IPIs into account
> for the group of CPUs that the genpd governor is in control of. If there is
> pending IPI for any of these CPUs, we should not request an idle state that
> affects the group, but rather pick a shallower state that affects only the CPU.
>
> More details are available in the commit messages for each patch.
>
> Kind regards
> Ulf Hansson
>
> Ulf Hansson (2):
>   smp: Introduce a helper function to check for pending IPIs
>   pmdomain: Extend the genpd governor for CPUs to account for IPIs
>
>  drivers/pmdomain/governor.c | 20 +++++++++++++-------
>  include/linux/smp.h         |  5 +++++
>  kernel/smp.c                | 22 ++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 7 deletions(-)
>
> --
> 2.43.0
>

FYI, I have queued this for v6.19 via my pmdomain tree. Please let me
know if you have any further comments or objections to this!

Thomas, thanks for your guidance around this topic!

Kind regards
Uffe

