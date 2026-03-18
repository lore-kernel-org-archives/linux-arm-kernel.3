Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BFA10775E8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8s0iyx5Up+axNLd5N4vYWUUxP+7s5+5idq+mXMf/gI=; b=jTzJls4z4dk14h9U8/PNnDjsaz
	JY+I608BABbfFITQF4jWbLdULCOlSWdyDhtoZJn8Qbb9EJPqP8PGJPz2IXH+G3RSFzb8JPlY7rNbX
	TgD4/7dGnInxbbbZvfbGBtQ48ZYp4w2NMlK6DWv5w5jy4TeFlbKL0+gUZ4C+WNyJfc87PyNRA23w2
	Q/GkTa8NHGwyOUdS/5spMCMItjZh8nMO9Q5Cm1dsNYodqusOGoajOQHU7iIgBEy1uoNXCBggwq0AX
	qlniBkCogcMjzYEC4ZIo+zDTONXpJxWtJ6oP7dwjAenbbtiyrjxX0tOreSdhwYFMZv0iYLwuVK7lZ
	0119TArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2u8F-000000090Of-2PjR;
	Wed, 18 Mar 2026 16:52:31 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2u8D-000000090Nv-0PmX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:52:30 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so2342866b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 09:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773852747; cv=none;
        d=google.com; s=arc-20240605;
        b=ibzvYgZCbVDZcLRnjKs9NMJ7qAT2vBgScR3wKGyzeYXE6AUOWpCNw23nl8guC1Yy1U
         vKYuPKld6RPpMM4Z5znbpnjPOBS6OJqXAexaR5x1vhIBYSPAeIDRpQDx2S/ieWH0VQic
         UHda7G1xpWlBo4Ld9DJ97Igs5GHeXMgOJMyJ8d7MpA3tMSOy6B64QEnFT7/dULdqX0YL
         LPXiha1xeibwbQHFi3m1An7pj382li0zzxkqXjTFmTb6qd9yeSU8wcXYmHDKVfcCkeSN
         DkmUrz0//C8KMSoyIvsnae0jqJLVIROPe46jvY0lnEDZsRjevRBEVqa/3kx0etcmSpPx
         gvFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n8s0iyx5Up+axNLd5N4vYWUUxP+7s5+5idq+mXMf/gI=;
        fh=xEHANycovNlBnctnnJ3wcTRjxa6GabOV+4WLUz5VRuA=;
        b=OpLjBes9vKjsut9TQ/592LtmAE/2/GD4SvQT950jkm64Sf+6t4rsSJlobX+3xaF0ix
         8judGQZ7I+De6Po6QxxzMIk9poA2KuHGaKcC81kLtCFI/B1amgLE2/qRgIbNWcYTU66I
         /uHVxZVewK3VH8C2IIa3gPE7CzHJqLaHfA0bzdM5Jd0M+0zi3byBLw+BtK8EA3k0kGR4
         0yF08Qvob8EMgAoT0JunreHWNEO1gAazz6ciNtE3TreacfyeXjYqpy7XVM/LhzrWBRrn
         96yRQct+rqSo5b93riDCqKlY7QEqYuOJL5nM8xH9pNxjFQyrF4Rd4nqCiW2fD8jKeIK9
         UHUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773852747; x=1774457547; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8s0iyx5Up+axNLd5N4vYWUUxP+7s5+5idq+mXMf/gI=;
        b=Y8AZ+b+i2FJdC2n5Xf5Jiv9843adCoyYCuxNKWUnxMynGs9/KGy6DDuXrVX7BQG6Ap
         Xi+bZZd96I/YqHJtFHqMl2teVnD0AP+PhncaZ47bJej2um8PnF5OUMg+z8Sxvw8Z/6Uo
         ITdFWkqryNsaJfn1YbAwUKna6X7NLiPInMonMai16obnf6McW60BNIvyUu+rtl3GYSM9
         2kHDg/HxcWIM5Uk7Xpz6CFeT4G039WIbP6IlB6VW6ZvhKDtseKb+WZVkIuAfuNDnYm6w
         Ph3bxxPcuCaYsJHn097iKlx7uK62KYxhrpipZUDgIcCr8isOpkZW4G/k6+1NoH+Vtlad
         uQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773852747; x=1774457547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n8s0iyx5Up+axNLd5N4vYWUUxP+7s5+5idq+mXMf/gI=;
        b=pzgR7wMxjxO7KtXJuqVgR/YB26fdjQijNWj62nEHbzvZq/EY9+Lb5qK5h6LFHS+RPm
         0mPp4+40f7bgGeuBvguJC1Lxvuzig5dB7CBwc7d4M33tk2HZUr0wPaaVejA1hG0PqExD
         DnT/WDL0NmIFvzFHIUO+QgmXG0KKpHtKme+M1quV7YLcCH1v/eMAJpV7Bz2Xa25xYCXX
         PplSdu+THAiHldZPezGj9dNlDK3Ls3ylyvd4qhU12d+1QxuTdPj55oPuINFE9rak+wmf
         2I8jcBXS4/x/3xlOgpuqyHKORWd+1h1SKGz8vnZxtV6+qCFMDhsNj2t2teyL3n6CjzZB
         Gz/g==
X-Forwarded-Encrypted: i=1; AJvYcCXjxVolf4VPekk/L8RONf8I7IWMm7ix21gPih89SaU7WJnaLFcJFkuCyItjGnAkik668K+iLYC1DnMYAiBKAcYu@lists.infradead.org
X-Gm-Message-State: AOJu0YyaD0mRPLUPgJoClLHJEU3mXQ66c8xS5+d1O3eN4I/n8WaV1q1T
	624wCJPjvb987xf0X2fKyTPoCE1XJVne5SNb0nm9SFRg5Kn+p7i4ZAh+FctWU0uE/eN/CZBgUI6
	RCVrQJYGVppIYennuqH43qdRX4auLN52BikB5nN4cQg==
X-Gm-Gg: ATEYQzzJovJ2+l9LG+Y9UW+WVdEdGPkRin1x4YjtDyYr5ei+LpejZpM1sbzObLzBTv1
	5gDq1frMcIIktJ6fAzoHZ4qQ7HiiJAf3ApT1ok0PVrVeychxoc7NKjh+VRpo+xL8x+2UrXrc+Gb
	b/rzftfnHpnfo+Bu8deEZ+9OTHmVvmcyWsNhcKypJBEjBn5WCAf34HvYE4EqxqdTmJfmtOp2au3
	4A7PAQB0mdvRCCcnwp8b4FXuC1cx0dqLnhhyqCyD8YE0YI5pW5N4086sSusG0CJsYptW7BvaFuK
	w0y51/I=
X-Received: by 2002:a17:907:268c:b0:b87:7485:b4a8 with SMTP id
 a640c23a62f3a-b97f437c5e0mr269129266b.0.1773852747057; Wed, 18 Mar 2026
 09:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260318-sai-slot-width-v1-1-1f68186f71e3@flipper.net> <339ebaa9-9642-4716-bca7-6a32a135124a@sirena.org.uk>
In-Reply-To: <339ebaa9-9642-4716-bca7-6a32a135124a@sirena.org.uk>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 20:52:16 +0400
X-Gm-Features: AaiRm53s1de568Rl6WcWFL_NmD36Tc9G63SkTCGabmNWoWncrHCvYMTyZ7Db36c
Message-ID: <CAKTNdwF9JRW7PjqnZwmvp_X5UjjJ023tBzFY7yCSnCJH5W6q-w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: rockchip_sai: Set slot width for non-TDM mode
To: Mark Brown <broonie@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sugar Zhang <sugar.zhang@rock-chips.com>, linux-rockchip@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_095229_162045_07BE7461 
X-CRM114-Status: GOOD (  11.76  )
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

On Wed, Mar 18, 2026 at 8:17=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Mar 18, 2026 at 06:50:25PM +0400, Alexey Charkov wrote:
>
> >       regmap_update_bits(sai->regmap, reg, SAI_XCR_VDW_MASK | SAI_XCR_C=
SR_MASK, val);
> >
> > +     if (!sai->is_tdm)
> > +             regmap_update_bits(sai->regmap, reg, SAI_XCR_SBW_MASK,
> > +                                SAI_XCR_SBW(params_physical_width(para=
ms)));
> > +
>
> What happens if playback and capture have different widths?  I wonder if
> forcing a TDM configuration with the affected CODECs would be easier.

Playback and capture go to different "reg" each, and each has a slot
width field. The correct "reg" for the stream is selected 50 lines up
in the same function. So they shouldn't really get in each other's
way, from what I can tell.

Best regards,
Alexey

