Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13391D44D58
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPHd5Ml+4dhfKf7+W9PSlfsoxE25t0TD5o+m/lVsDyw=; b=Jjwtc4aFN+yFHGZmNgfaTxPHXS
	K291+hTlSGmM/MZ07kQ2ngU9MJLv6TGFG9sjPIGKaZit8pjWhRh4VHaXd0colHRTZltIgRkCtjBUf
	vKHHqABnK9N3zCdLSxOZ/lwVrI7i594D//8nS9mdotqAwYHP8kdl5nlxiwBxBJPcAC2AXaRAJTl+p
	1dXO2ixnyfN6pctlxSizLAfsj8EUUygnFOEfSfacxTCCtt872kOYOEMVZz11JzwSh6s+CK4In4Czd
	+YHW3ecpszaGucD1cSDjAoUworPhLe9YizazfD+t/oXfz3RqmV89VO6vI9MWN4LX23DOOIFSJHmDW
	e+nBys+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8g1u-00000003PUp-3Lnn;
	Wed, 06 Nov 2024 13:25:02 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fVu-00000003Jcm-0OXA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 12:51:59 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e34339d41bso56965737b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 04:51:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730897515; x=1731502315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPHd5Ml+4dhfKf7+W9PSlfsoxE25t0TD5o+m/lVsDyw=;
        b=kP1DaCb9nUcU4WIAbJt8AzldRnOcQgP6IltbjBliAr7nFFbx7/iB44KWNsFj22OPWT
         gqF+GzaJJeEXfppXU1V4S6A2VfHqddzHMNerOMhM1ykZ62p32Zz2mYXh0PZ3J9LBBZDf
         w519ZFlBNoI2XE5sfVoyimCDUIJnfjOi73/mEZdsMDhClF43517TMzcjKtkC12TkPHuU
         d+Ha++RhxD0udz9XLZ+aQ5OWrmA2AakHWywJ3cVVfDlKnC6etSFMNLkxWkm/S+EI0cqJ
         apVKBpvQeNHtGBQN8pul7HLV+AadBWAKW3Z/oJWLfeHdtq67HQgAk/k2jm/4AoymSEa5
         Yhpw==
X-Forwarded-Encrypted: i=1; AJvYcCXfgDbS1xJNlFYAZ0WqOD4IUEtJq13n3G+1h77e+Uj5IONZ55ESEsyt798uBgnGAdhP0ZIQ80FFIGgcglW8bcIu@lists.infradead.org
X-Gm-Message-State: AOJu0Yycf0IjH/HY6KaZEEQfqARfoIe2VRQT1hDsGE9Dh9okkmRtHVhs
	7648WkdEEEzs5Xpgj0U414zcXbPlyYsAyLayJWj+RWQJJ7qUfsopaTb7IfTl
X-Google-Smtp-Source: AGHT+IFh5F7CJBy47zaXswLURuGDzMWIKwUoTNktNV1rS9hUq8R9mc8HOETzZNYnWZratGBI0z5CNQ==
X-Received: by 2002:a05:690c:87:b0:6e3:410e:bb84 with SMTP id 00721157ae682-6e9d89950d4mr354758667b3.20.1730897515401;
        Wed, 06 Nov 2024 04:51:55 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea92528c6fsm14975987b3.131.2024.11.06.04.51.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 04:51:53 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ea8419a57eso43355317b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 04:51:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWcTDcVurStciipzXj6z0y3JUiF7MunE68tpmrSN8bCMgCu7e7BkZqbOR1Ehg5qCHbJm7S4JdM3b/0WfOdXk1Yx@lists.infradead.org
X-Received: by 2002:a05:690c:6607:b0:6ea:9bca:9fcd with SMTP id
 00721157ae682-6ea9bcaa376mr108385977b3.2.1730897513684; Wed, 06 Nov 2024
 04:51:53 -0800 (PST)
MIME-Version: 1.0
References: <9e56c0d03509d79736961ded7a1b90a361fd2e06.1730895069.git.geert+renesas@glider.be>
In-Reply-To: <9e56c0d03509d79736961ded7a1b90a361fd2e06.1730895069.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2024 13:51:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkMezR+opdwY=8QQuKRsniMhP3D6EiHVycn69PRUuPeg@mail.gmail.com>
Message-ID: <CAMuHMdVkMezR+opdwY=8QQuKRsniMhP3D6EiHVycn69PRUuPeg@mail.gmail.com>
Subject: Re: [PATCH] pcmcia: omap_cf: : Mark driver struct with __refdata to
 prevent section mismatch
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_045158_155034_A2BD1F37 
X-CRM114-Status: GOOD (  20.10  )
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

On Wed, Nov 6, 2024 at 1:14=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via platform_driver_probe().  Make this explicit
> to prevent the following section mismatch warning
>
>     WARNING: modpost: drivers/pcmcia/omap_cf: section mismatch in referen=
ce: omap_cf_driver+0x4 (section: .data) -> omap_cf_remove (section: .exit.t=
ext)
>
> that triggers on an omap1_defconfig + CONFIG_OMAP_CF=3Dm build.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

There is one more in the DaVinci cpufreq driver, but that one never
triggers a warning, as it cannot be a module.

So either davinci_cpufreq_remove() should be removed (it is never
emitted), or the __exit and __exit_p() should be dropped (then it can
be unbound manually, but never rebound).

https://elixir.bootlin.com/linux/v6.11.6/source/drivers/cpufreq/davinci-cpu=
freq.c#L134

Thoughts?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

