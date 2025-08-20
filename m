Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070FACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 23:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1CQxA7NTMpHYXWDwB/GYYkioNL06ElZqxeWZtrZ6v0=; b=UZ+mIpGWSK+KvzcSzIn4gRHpnM
	0xALIUhxC5wuOxpRWlKIpQvQk2cAf2kZcJqvKY603jKSci32JM1B4oODTBPFrx9QGO1M+uMvBuwgs
	XKdBPvRHFEfzBv902vAEoFrYYzcE317+6cP+rsVk0h9dSHwBLrsd1kaAGr53+O3KqyITS1OlgSY2M
	hdBWSBrhALznoPYoUcRMOLabg0QQ7+RmBYUcxTpZ1P1tf3ZBGvfccGaaE72qPQPENlaX0F+AgWpbi
	1QzZwHHVpQ6+lOOWSNFqDZf6b+I5/sP6yjCmWXvRWMWGUelFERRiXrCjTRSC71R4cYwL8DQXIHsGB
	GMjAeo0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosZ3-0000000FF06-1sg9;
	Wed, 20 Aug 2025 23:49:57 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uom6r-0000000ESZy-26bc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 16:56:26 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-55ce520caf9so22616e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 09:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755708984; x=1756313784; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1CQxA7NTMpHYXWDwB/GYYkioNL06ElZqxeWZtrZ6v0=;
        b=CyHGJj0scGy4T8/MJFbNqHaS33EFZKghl0mbOtw9RLSOUr/7zH0eTVVVxbS7xhGUGP
         W3bkR9b5jMY2pgP6ol7W70NYRgSR7u5J5FbdmJ3sF7juV7N+hHtUIz0rNdM/XNloatwW
         d2wXw5xPTkHCS0u1zlICipBruWdQ5tQzgxjQ9etyN+IB7pxDdHEqutq8hjHUOI+fr232
         p1mlesPUvUYkRIzACUa9IKBlxzPDL/dk+rrFO4Y3Ur/nqd1dhq63UF0V3K/n0WB1B6tp
         gBRrIBV+GDZM07wrsvJfcMr3Za7NE/PRWj/DpNkst6mJsmHLa5FmLKKX7nEBsTaFRFKu
         olbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755708984; x=1756313784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1CQxA7NTMpHYXWDwB/GYYkioNL06ElZqxeWZtrZ6v0=;
        b=hR6jxf1wCr7sI8LQhnO4ClHqGFwaOh03o2ROQcoSMWqKW/GY1wXfrGXhA7rQJhAvo6
         ZVph8szr9I3VpicW4iBRu1JucWt3dfPLDlmYCyN1M2dnwZeDm8DjyzLAGO+smQcDzciT
         9XnJVeMd1aaubvOU0UCNWO966pu0GNDfjf8XcSCSMX9uCOnn2O1yGZ2Q+m3kSE6XeEwC
         MJ3IdfPP0k+eMxtoW6Kw5L4CAUlVQtFWsDgcTe9Gt/y1dKT7huLIQv1FXMWu7PGSQ3SM
         MICqO8MAdmRx+5I1stPNjNs8tFhlL3xXn3cVwSdAPCm6/3pUG6pwyP0ZzyqnDcpA5Vyu
         RlNw==
X-Forwarded-Encrypted: i=1; AJvYcCVIlIkxocpdKJc+E2jyOiHckUFgL3tuDoTpXEpCBc44bmUM57dzA9ejcjufJRGf5ONKQWrICA9Y4gIg50LpOdQB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8P4yWcFMK669OEW9HLxRdeC6PF2GUN/iEsxpUD44PQfbv/DDl
	cPy8gVv6V0Od+2Z4/U7BUwC+uXH3MkzF1zLBW4dXaZndrfYeEASGe+2Q3r+ICGcyefX4CQ4hJb3
	1qUV1HqvnAXPRz9ol1yjH6okLboTHLkw=
X-Gm-Gg: ASbGncvoopDtGY9vBLJUZ2+U2p3dGsSAi0msumK59eFH53IJTQ/D/VnwH1tD6FLpeHy
	Lo4uIfQe2Xkd5fWPEriSP8TcHCU6DQDYR9t2Pi0mwnkRfjY25o/3lo4UFS2IKmoRCFzZv6l2T1l
	WaXABzO91GzOxzuUvRJFJu+TCxNIwWpYD4waxz5R1lt93AZyx9r3UFdYC0lHajwJ1dSaylhbBvW
	zQjLFizbg==
X-Google-Smtp-Source: AGHT+IGmodnm1wYq74YzPglOPvXyQr5up/V5mEGaKVDAkvR7Dg+TlJZu10zwCOJcEV+C0cZezLHnm5mS90/y0lwenNw=
X-Received: by 2002:a2e:be26:0:b0:335:2d39:efe8 with SMTP id
 38308e7fff4ca-3353be8faf5mr10467741fa.44.1755708983407; Wed, 20 Aug 2025
 09:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-12-jszhang@kernel.org>
In-Reply-To: <20250820154037.22228-12-jszhang@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Aug 2025 19:55:46 +0300
X-Gm-Features: Ac12FXx-9y_y3mx4aPn80hP5vp-84DxStz6Oim2QEFPCpy3GlveGPVdRNscDeQA
Message-ID: <CAHp75Vee0OCvLTnHFWvf8SfAgKjF9GRwzcp_G==ha5S=OJ+Ocw@mail.gmail.com>
Subject: Re: [PATCH 11/16] gpio: pch: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_095625_540218_0CE7488E 
X-CRM114-Status: GOOD (  10.20  )
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

On Wed, Aug 20, 2025 at 6:59=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Acked-by: Andy Shevchenko <andy@kernel.org>
in case Bart wants to take it inside the whole series.
Otherwise I can take it via my tree.

--=20
With Best Regards,
Andy Shevchenko

