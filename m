Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16323E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgMzzPONzvXMDffdEbLrbj7uxW0Hra0oNVW7bnaTYSQ=; b=YOQoc1q9lgtch7v/S8bu63tcph
	rQJ/JIXNSPq7AoPFb/AIZqUbxhQIGqF6lYCNLXuA/FWi1pM0CGBq+6kbTIQ5b/St5pJ0JdI6gfW4Z
	NSTURtbwDPiabK/22B5O+ff0rKWL/7qwDJfYiJGWIgNGhAXb72zB/9/KS6odBYWLWlvedbPTExk90
	d+FS9UXF6VYA6CdlTa9k1+RG7A6gPDyACpKekAp7ITCHu06KTR+MFOunq1ANR4Ax8aH482i8JGfEK
	fGf3ZmA8hup/zQ1VWFWu9Dzlf5HdeBJf10fSzTaB8m+uIdGtnXFUayu1mXj4omqlvajgWBZ9UHdH/
	zKDzC28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqEB-0000000CoNZ-0kSP;
	Wed, 04 Dec 2024 14:19:43 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqDA-0000000CoAy-31Yz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:18:41 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-6efa5bf5202so32270367b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 06:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733321919; x=1733926719; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgMzzPONzvXMDffdEbLrbj7uxW0Hra0oNVW7bnaTYSQ=;
        b=GuwIZnN/So3/8Io8wCl2Xgk2XN8aOJfbvXq3sUK5ruci5WXyTlTmthAELQTUR9HqPf
         m2FsR+IpImZe2kbqknvrISH+rH0tdAlWn4EX3agGi3/Mlq8XOqLuPuAnzVOe5qCWmU1i
         1JfcW3m0F6MdhuugG22875q9OsxGsy12n7P2prjiI2T7tNsMm3mmvb6dLP5kq1aZmjER
         4Ad9g+UxElbgJeM8LocVbsQdZFrmBfHaXQ02AChDOFsZIdQDqf3sN0NzXcgtvPJCP8++
         VeAujShUrt0I1R1png1RIcJgTt+wBnXUiMcmub2A+0FRXSO/Si0yIG+YszprXCotjLp2
         bIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733321919; x=1733926719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgMzzPONzvXMDffdEbLrbj7uxW0Hra0oNVW7bnaTYSQ=;
        b=g8jgzAy75YXk3nCU9QiEPIx/soOn1qSy4ovVA0EDyGijsrFj4dCdbyqe3aMcnaT/MZ
         GqiJxOfWXMooTI2vEPIlkOCok1FCaErY4WkjdOR//kSvZ1M3u9GBZCWs7hok8kqFuCvr
         9SAJ2Mp9MnFKT8PoQHKK+g/gKpUk+zMve9CbxwNVhBSOgzKmF0JVTkN+ZV+A4IkWIsYW
         pOf1D8Y0N0NuBgB1Cce1faE2LpSFo0DPgG7yeQcDxZgF05S/LWy8CxksxtPGoE4oT5Yu
         aJlwrKr37e7mDJ//rvrvFv4e0TdcOVKm8czw9OQ7ULwFqlcCvI3KrON/FT+FpAsoy0zs
         dKdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoezrxBqyKLWM74VWHZfCYWsRyJJ0ERwKwyXNqAirNVcI3r2mXVzETCvKObJ7HzNYhOjZNNFUwkZ1gddnylpya@lists.infradead.org
X-Gm-Message-State: AOJu0YzA4OY4SCuBtvnnPp0aZm9SHqEc6IkYH7FeaU4cdQJmCoU8yMfh
	82OTQe7msfaXngDkC4AxZmGisows7WFpLkNiOOfVPkWrCLQfbMU+LPogGN4rK0rvN5J4uoE+2DS
	nl+fJGYXR8F6MqBGOxPBXzZCE5bzGxHNRQfs+4w==
X-Gm-Gg: ASbGncsN7pev2YpHbzvB9E1fd/n0dXKSM+adGSh8mFbVDECxtbm7EeFsJzFAAWAFoBO
	PuBfF2SjY8EQJPZV1Qi2FEr79HCW66Q==
X-Google-Smtp-Source: AGHT+IHEBiMzARXCmqv420GKkYL/RmMowf+ypMis1l/b3gAkWJs2OLgwlqwdaIBmHS5oWLjT+lsU/IYaahq4W2xwfOs=
X-Received: by 2002:a05:6902:18d5:b0:e30:6dea:3ab4 with SMTP id
 3f1490d57ef6-e39d3e1c824mr7567913276.23.1733321919294; Wed, 04 Dec 2024
 06:18:39 -0800 (PST)
MIME-Version: 1.0
References: <20241204102904.1863796-1-arnd@kernel.org> <20241204102904.1863796-14-arnd@kernel.org>
In-Reply-To: <20241204102904.1863796-14-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Dec 2024 15:18:27 +0100
Message-ID: <CACRpkdYQUiN8VNTgK7-9bnr40TiACT3MSScb5QF3mz4MawzXHQ@mail.gmail.com>
Subject: Re: [PATCH 13/15] ARM: mark mach-sa1100 as deprecated
To: Arnd Bergmann <arnd@kernel.org>, Kristoffer Ericson <kristoffer.ericson@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Ralph Siemsen <ralph.siemsen@linaro.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_061840_758300_EB9041F8 
X-CRM114-Status: GOOD (  19.45  )
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

On Wed, Dec 4, 2024 at 11:30=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Most of the old StrongARM1100 machines were removed two years ago as part
> of a wider cleanup, the remaining four were left either because someone
> showed interest in converting them to devicetree, or because they were
> still supported by qemu and therefore useful to keep the platform alive.
>
> None of the devicetree conversion actually happened, and qemu has
> marked the platform as deprecated, so do the same in the kernel now.
>
> If anyone is still running one of these four machines and planning
> to keep updating their kernels, please speak up now so we can adapt
> the plans as needed.
>
> If nobody is found using StrongARM1100 any more, it can be removing
> during 2025, leaving 6.12-LTS as the last longterm support kernel
> for it.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I do have an HP Compaq iPAQ still running.

BUT. I know very well that me and anyone else who actually want
to keep running that platform better get our act together and convert
it to device tree if we want to continue using it. If others are up
for testing I can surely help out.

Kristoffer Ericson is still listed as MAINTAINER for the Journada
so including him in the mail thread.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

