Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3263C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxeVgWBPIaIHKr/VoNwwOt9Stv37rE17JkSSDvEu9I8=; b=vofpu/XK+tLjGZEZDJElyBCqUg
	jyFQWdN44CCeR5baEOmW2ZIHabSh1SXiZHkseTR+F76U1XhD3le7ApRBSEGtKCV+160pSnO5UL2D+
	aqHFO/On+Dv6swAIUraMLE1F9vhKr2s/EuekumoYGTgmXpADdYKg0Od+1uRKoWdcrZHal86BR0ahb
	66OLueYHy1WyqoUQPveV6wWMnQZ6tpNs6W4BG0bLowYHzMyTR0C4kgiUzLDVj1Nzqh69u+aun10fE
	vTbMdQm8AZFE7gfa8tzZYVCpFE/9I4VRbGlG65NapnTn/Z3EtTVdU8HSfhqYq+s+4i3bNc3LzgkbX
	6VJHwo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWbm-0000000E9b9-1LWS;
	Fri, 07 Mar 2025 12:15:18 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWa7-0000000E9FM-2PMo;
	Fri, 07 Mar 2025 12:13:37 +0000
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-866e8ca2e07so748394241.2;
        Fri, 07 Mar 2025 04:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741349612; x=1741954412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxeVgWBPIaIHKr/VoNwwOt9Stv37rE17JkSSDvEu9I8=;
        b=rc+VIP04cB3d8cSLgit/oZjvebqF48OGTRF0/qUXE9yFSZRDxwRfUVyn8VwFpA1O8c
         U6BVIGwMbdPdPyxWOXHT4BgvnTAagi+P/6c+3qtvRaTlhGJIuoifqGynSOzzBk8YWPaw
         Fl7mONEWGZOmVWKSrnqD6vbpuAkP8efcTAKiEEJmHxZaYRm7cOFCsVKlm0ZFn8QSnXwV
         CeFVCZsixU8Rmr76s+gxq/2pPKUmf02yNJ0elHy4X2kBpCrSnlvtNqE7gBlNt1kAsguA
         79rS0btWxmnGt1/CrLh26uuJXVo1tbnRNxfDD9pI6vyCXoIV5kDW7UbVbX3fl+xjmtyL
         y/vw==
X-Forwarded-Encrypted: i=1; AJvYcCUdUNPUpdrZbqRxzfpA2HhJOsGayxKVTSJXU3sUkhP6EbRgyyixq6f2HO3GTBXVlC7C9Ss3al3EEgsh+7+vcxwK@lists.infradead.org, AJvYcCWoXoVOExd4kLYKiAhEPrh9GCiGoNkseBR+MGxPRK/90qmQqLd5j3mLv6hTdQ1Bj8AS9vgDbmWpkr8+zermnSWDTA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc1GZ/QwlUkVCyUQTsMil8Z0r2Xl5IiUm1RBFI9ottMxAS0Wix
	AfK30Z9H15TscVtD8xbZL8rrd8Nbk38Fas5R07Ul7zjkmizHtpuSphiem/mXjfw=
X-Gm-Gg: ASbGnct/GOBQGNGny0g6h1n0cxgKy9CWFXHpD/vpUNt6q8SUDSRoUGgXMXy0JlHQVKD
	296Q0oY9kty/U/Gu7xOWaDH4f3NHQNjXleGirS5OjpYNajujWRnig8QQCzVc6K3bB9UVWvSlz9Y
	Ft6p2gtFlSch+MdY7bLyufUFxjFqS/SqhMFKkAtZ3glX+d9wvyBuiNHJiaQISjIW51l3tjp7K8O
	RAwG0JDFc8kdo5Bs0VVS6/xU1azt3Rr0oeVS+Sklj/FFGsBMfTOiWnGcmWcbriLXd8526c9QW4m
	mIafsEW7foimE+MXr8fvsfHO5zcOnXqBv96r5VE7eUAPPh5Pc2hNMw39jm2JueMqiRh+egKU34b
	S6xBJ7co=
X-Google-Smtp-Source: AGHT+IH7XqHqlHu5oVj0yZLasFANE6rHd+mNIkFWpbVRGkgP69MVcFb/XvBgEgy7fd4WXLTWhbq/GA==
X-Received: by 2002:a05:6102:809c:b0:4af:deaf:f891 with SMTP id ada2fe7eead31-4c30a5016dfmr1643602137.4.1741349612409;
        Fri, 07 Mar 2025 04:13:32 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d33ca5bedsm649911241.26.2025.03.07.04.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 04:13:32 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86cce5dac90so757331241.0;
        Fri, 07 Mar 2025 04:13:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgUjbigdo0O5g3D8wddX2aDgVlEWQOh/x61AZvbWWZ2iQHbPsWpui3SbeechORg1vLorCSKZlfAlnnC3ik25W1Jw==@lists.infradead.org, AJvYcCXNos+yj45SPp1Ifgpg6mK6z9Nudzrj4FcmC0P/ruLZ5pIWTcvBJQze11vbXIclaqbrdOLktT3GsA1sTmEre4Ew@lists.infradead.org
X-Received: by 2002:a05:6102:8001:b0:4bb:e8c5:b149 with SMTP id
 ada2fe7eead31-4c30a5ab186mr1795545137.7.1741349611548; Fri, 07 Mar 2025
 04:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com>
In-Reply-To: <20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Mar 2025 13:13:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeThsk5tSaMnT-6BqO6XSMTTDo1Q9kRgJ_d5iC7MTdcw@mail.gmail.com>
X-Gm-Features: AQ5f1JphTlGlfeyx26A9RukmW_sJoWB7kM5qnNPVm2RVhmEmPwlzPLJvmsJkOb8
Message-ID: <CAMuHMdUeThsk5tSaMnT-6BqO6XSMTTDo1Q9kRgJ_d5iC7MTdcw@mail.gmail.com>
Subject: Re: [PATCH 0/2] vsprintf: remove redundant %pCn format specifier
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_041335_614420_6001AD84 
X-CRM114-Status: GOOD (  19.34  )
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

Hi Luca,

On Fri, 7 Mar 2025 at 12:19, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> There are two printk format specifiers for clocks: %pC and %pCn, and they
> print exactly the same string. The reason for having two is not totally
> clear (see discussion in patch 2), but there seem to be no advantage in
> having two instead of one.
>
> Definitely having two without properly documenting they do the same creates
> misunderstandings [0].
>
> Since %pCn is used in a single place, replace it with %pC and remove %pCn
> to simplify such format specifiers implementation and avoid
> misunderstandings.
>
> [0] https://lore.kernel.org/dri-devel/71c44221-b18b-4928-8faf-00893ec4a109@nxp.com/

The link looks unrelated?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

