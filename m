Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30071D6D241
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 21:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a32dwi3I+ct+r4Lez1UL06jDs58S4+Lh3Ccrl6GbYHQ=; b=zwVvOmHSeVlABIhQCCijymrOwf
	oNLqfzw7v7ZcZCZuLFrUCHAQ8ig7jjy0rMfnS50LLCzGXe8NuSBRfQl+vI1sNxkVZeJz5Pr43o3pE
	RIg6bQ8AJcNwr5Yi4V2kOfo6HmgPz/1ZUQid1L14vuSoacqZA2YQGqma3Yz+50kHU8iaoFrRKT0nh
	suKhXg800bCtV4Y5WffQ2+VWcXXxLL+fRoEZ6XOgPtZDmXL2HaSP5uoN3GeJ+QRFmap2uW8R89kBb
	FiZK6MtjbUJaueFyICuaZ8poq5WWD7NSKgKkiJjxHF9rA9T8RjAa/IniilTv97TWLzZ6aFs1/LJle
	lhjAJQ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGPlD-0000000E8dm-2ArK;
	Wed, 27 Nov 2024 21:39:47 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGPkF-0000000E8aA-0Lj8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 21:38:48 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53df1e0641fso151265e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 13:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732743524; x=1733348324; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a32dwi3I+ct+r4Lez1UL06jDs58S4+Lh3Ccrl6GbYHQ=;
        b=K5Sh1lF6iAspGn3qvaeIqvLYHhZJx4oGu6g3OukebiJMB/cKOtJzTwsBG0+V7Fq5pq
         dPnEZ60+VWTHFzB0U9I62eXl8EX46/kMM4CYJgtrJQIA1wWOVO2AEe+bOVbfs/h6hcPR
         rFxb0wHouoOFs7a49zAgrjHw8o5Rg6g4pborRjQ5loAKXPt/hfMNjem9keWBL84g2V6r
         xy/CDnUjiBQSAF8VSGUyzrKGEBeDlOoUhDETwEENbzFS24ZOOjEzEHQPS+IORPEGEu4T
         8vGY++Fb9AG/xEd+p1OF8a2faex4sHwQc8RRrj4IJsGbXlphW1AXyTL3r/48VUURHvhR
         moWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732743524; x=1733348324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a32dwi3I+ct+r4Lez1UL06jDs58S4+Lh3Ccrl6GbYHQ=;
        b=MFU9I9NwHIh3YmZCR134F6rUL9QOlnNFX28weIbtiWljy5wTgeZbBsVy6aZDUAFgOe
         zjXqez9yiihcV2KUSMaMBRGpru/aWQA04XX0J5yu7VCjVpGn+vSubWZqOl8+Txth0qk5
         vqFzk5ULqeMo65IMvDoWuqw3iW3/2GtPn3xh7PD9EWCk4bvnIalabOebgzFkyIm5x9l6
         AtpepQo86GvtArcYl9bhD6lI5ix+rd1R5kax1tA9Fi6DTgiM7tHlWmwHuJEvNIFRnwBf
         LM3eIYENE/fR2cKF3M9h7efLyuvB77s3EuK8DZliGvBzKICOzMnpZazZKQ2qn6KYO7z6
         k2Sw==
X-Forwarded-Encrypted: i=1; AJvYcCX1Y4jqDjH82uNfJHl+LfEVSNI/G4/0w4VHqsOYjPmEwrXV+z5yX/n04E1WQrASDvbj4z/RiuOyQbP1NC8qp/D3@lists.infradead.org
X-Gm-Message-State: AOJu0YyN4BBfe2+d+vAJJdfJZGJr/c+GuR3kvpnydOf7moaRe9D6DCtP
	ao0M7jnmgQoNxpK4UhzLVAynSWSsAF763K5//96SN5pAh05ANgI6vs7OYpnP9spe+DoDy1EStEn
	gG1Azd4LBYaAP7memHX5zvyz70ym6Ft7OQAiIDEPq/HFiYUlWlzk=
X-Gm-Gg: ASbGncvLMvgde/rnKPo5vpR7uXctZ6JkxFagzwnUE4BC0/BBYp//ZBl613+fDMLOBxr
	SDIiALRU/FTbfPJL3Hc8TZ44nNVEHzQ==
X-Google-Smtp-Source: AGHT+IHhrk7Oe1mo46bXXrnp90+4dmwR8w8R+FShHf5F+VcT9CvXBjjTqxBWxv0IEKj9iEI0oKllcWBS3HFl8fzSaHQ=
X-Received: by 2002:a05:6512:3a8f:b0:53d:d572:98da with SMTP id
 2adb3069b0e04-53df00dc973mr2789547e87.26.1732743524534; Wed, 27 Nov 2024
 13:38:44 -0800 (PST)
MIME-Version: 1.0
References: <20241127190605.1367157-1-festevam@gmail.com>
In-Reply-To: <20241127190605.1367157-1-festevam@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 27 Nov 2024 22:38:33 +0100
Message-ID: <CACRpkdZ5oQZY62QeEmygq5md3Si5ZpSG-mL39JCe2upaUyJcEQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, linux@armlinux.org.uk, s.hauer@pengutronix.de, 
	esben@geanix.com, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux@roeck-us.net, arnd@arndb.de, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_133847_141921_6BE9E9C4 
X-CRM114-Status: GOOD (  16.42  )
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

On Wed, Nov 27, 2024 at 8:06=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> From: Fabio Estevam <festevam@denx.de>
>
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
>
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.
>
> Fix it by selecting CONFIG_PINCTRL as before.
>
> This defeats the purpose of 7d210018914 ("ARM: imx: Allow user to disable
> pinctrl"), but it is the less invasive fix for the boot regressions.
>
> The attempt to build Layerscape without pinctrl can still be explored
> later as suggested by Arnd:
>
> "Overall, my best advice here is still to not change the way
> i.MX pinctrl works at all, but just fix Layerscape to not depend
> on i.MX. The reason for the 'select' here is clearly that the
> i.MX machines would fail to boot without pinctrl, and changing
> that because of Layerscape seems backwards."
>
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-=
8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

