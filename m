Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C824CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HfvgkKViBDBmpYljJpo0E9vtsQUhTJ9vwqBCEaAPZ4=; b=l+bjyWsVQJBrMlGIZtsGLY//f0
	B8h49YV1hFzM6cF0xie0CSzCd15Hz6OS3FPin+ZcEf5mC3aas85JDc3st+Lme9QFp+aCAHErk6nxg
	z5pmBWumDCs9dAvUhKlOy6SV2wRn+YWeubKb06E2R210Rr6MaPgTTuZz2zMpvkTaibkRpk2rCZw0V
	7832z9PlXULKfADmZdWPLIx7pEH7Oh97RNXM73NJE7ktbF4klQBdgR1r7vOaWmWxC4NcmOBqvGoTv
	Dx7h7zXk+OxGDnRH7WsHIm+oM/YwArAJbRURaV1JtkoLe0YA27k1IJLCrFwseWY+waGt7GM0nvYbH
	LUOuPMOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Uj-0000000HRtg-0sQc;
	Thu, 21 Aug 2025 15:46:29 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3q5-0000000GoWA-32F3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:52:18 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55ce5287a47so794376e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 04:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755777136; x=1756381936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HfvgkKViBDBmpYljJpo0E9vtsQUhTJ9vwqBCEaAPZ4=;
        b=TgtVV/RwxFtVM4lhqijKwvx2U/TM+3KgHt7HmdcVK9nXZsi5+PVmRG/3pe4YNQAY9e
         8c+OQ13SuXeHjoH4mKPd9UCD8Yc0rnKZD4xDqX51I8AQT94u61VQlP3pRkdqsD8YSeUT
         Gw/rphluXlTINoTuh25KqnU0CaLXnv7tTcOHx2C6e3h1sFnop8j8OIs1U5EMpN7DK43Q
         g/9mbYY5m9efTmrGr01zD0yeIO934I0adf+kp7yKPGSJWjzOG8dPhJfzCjyOOZQl0E3l
         9GROTagWnDuexrSbPcMq8sLdjCt+B9pjM32APQYbyndTqIm7ffHbI5CUDm5lx2Bz9RGB
         9GWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777136; x=1756381936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HfvgkKViBDBmpYljJpo0E9vtsQUhTJ9vwqBCEaAPZ4=;
        b=k8NnyPF8qAt75BYplBtKShFiUmOqueUcVCEaNvyCdLJyZdQp2WkLNRGsGRdq0sc71P
         P4HZRjRWPclyGNH1uiQBJ5LKXuLhZgM8+cTceWCY+kpRK1k+7ydbOKrDGewjkC/LNBLx
         JT/CC85l6oqXbuJ1PcWsK3dKXr865sYJU7TPPT0vCILB4/emcdzxmo0lV6ABFeqY8Vea
         02y/YHNyxYOEuTG+YCafjWu7PWRWIYUxhlM1sAclVD4y4Dq/gLbtwpaZmLZnEHM25O7I
         R6OoJGXKMqnt9pUTRF6va5yUtgDWLXclkyZASqyyU8h1r2s1qUO2R+lYNe4wXpRItvmV
         phvw==
X-Forwarded-Encrypted: i=1; AJvYcCWeg3sniNcQh3WO2UnoRLePQqdop+Z6gr87NVYnOzfMsgBqvkQKLY0gdk7H1jCfEisRKU+oxXKqx906r/259GOk@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf4gJIIxwVf2EprtbExmcF1kQxSMQNCjmoP5gscXTkGgZnsATG
	nUyTW7kvao3+qZjj7+8XOR9CUVoSvDNKZnt+hbGJrL6oSIHQadr9qCacbi2vhr7jaWNttl9zHV4
	PMivVfuTvkiNBDFfaC0FAbyBFsKQ4/IgaioG6x4I/eQ==
X-Gm-Gg: ASbGnctfZnllUURCTuxkxmRHL3KwontKZnCEHotY/su5MDiv1V77KT5OJFLXq1zfjd7
	861XcGwbgcKXb6YI1fMOAU9Zt0/gN36cVe1S3HHuqrZw1JxBuZcfV97iEGtv9JYrh/p5otg9x8E
	BXIxJYRkYBWl/Bgscvp0YST1UPiI2e6daTOp5avcwwpvAIULJH/n+1A8n1hOJFjmwmKzR3sfz+t
	1lUxWw=
X-Google-Smtp-Source: AGHT+IE7DsV+WQk14KSKY0ALtymqoUNW021ikvEa1U5yioRxACQmRRzQMDDiUa3zI76UT8Ua7qd03ScrDSQ9aaYIYQI=
X-Received: by 2002:a05:651c:235a:10b0:32c:bc69:e926 with SMTP id
 38308e7fff4ca-33549e3a7e2mr4759881fa.7.1755777135941; Thu, 21 Aug 2025
 04:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-6-jszhang@kernel.org>
In-Reply-To: <20250820154037.22228-6-jszhang@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:52:05 +0200
X-Gm-Features: Ac12FXyaf06rfmzUvXDVHS6gsoqtOPyc_OHXCIqFKQWuBvT2rlmZGUdGjdqba8o
Message-ID: <CACRpkdYQLqDxh=zqrZ+wK_Ky2wD5AUoVLmCV_JDfmaqJC4Yzqg@mail.gmail.com>
Subject: Re: [PATCH 05/16] gpio: pl061: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_045217_775905_5186BB41 
X-CRM114-Status: GOOD (  13.28  )
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

On Wed, Aug 20, 2025 at 5:58=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:

> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> The pl061_context_save_regs structure is always embedded into struct
> pl061 to simplify code, so this brings a tiny 8 bytes memory overhead
> for !CONFIG_PM_SLEP.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Hm true, 8 bytes is not a big deal.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

