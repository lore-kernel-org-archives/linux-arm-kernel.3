Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C216EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 10:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AISXCkdyfWizizwGG/lMEnAGITAartWfZjVCOPp8Btc=; b=O3a/az23OVYYFra04SmJJGBL6Y
	grR5KO0tnjG56d0myJnlzGaTxTGEepW8tGq5AfALplNS+EX0gJD/7gyW3ZOEj82rwIx4EGOsmSgGK
	HZwcoO3lFgK4PxyS1yfzyPS0OHBDpLYfJyPBdZ0OzxDPQzrCQfdb7x0dR3wQQVZzD8/hDerQRiZ94
	zmtxilLwFs/bMg9H4HOgi9JE/VmKumdilp4zbjIm+MAjkOXTeNMt0lFujPZf5SKt3wcKWA/uCniBs
	a9LdnKJgGLr8YXaFjyY2AUREGN0lArn5/XaVZujfpnbf6ayrM6xfCbfxI/z3yHmVs7X2l7tPbwCd+
	XynqLwxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3bl-00000001Bgd-44kj;
	Wed, 30 Jul 2025 10:00:25 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3Y1-00000001B7g-0eVO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 09:56:34 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-532f9127978so2066549e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 02:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869392; x=1754474192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AISXCkdyfWizizwGG/lMEnAGITAartWfZjVCOPp8Btc=;
        b=HNGStkKtVhw5PHUdSFAfJVtOtYLqROiAqXSXLpIFgFVwA8Tw21deyA+wECfcVorTaL
         vjyzr+xRj8sVy23cZddfRMHe2JWPmFoq4AVyBOZZotKC7btnbuEw/pkg754FayKP93AZ
         Qt8gfeAA5/BoRCl5ClX4zQtlg8vy88Lg89NWOr0EeDM31DXb8yq+H7z3At0V87rEmfeK
         PJWDaVZCyexTQlF1gjDkkokTe9Bg+wTvw0T6l6NxB0+w1n5KqinkjZYx10eZ3yre2fiv
         qFeRREdFmjxB+hkFKx8431Yuu89IKFzBfJgZpFny6R+ZZQZHLs3upDVjnj8K97tI5QiL
         QCqA==
X-Forwarded-Encrypted: i=1; AJvYcCWRD2OrZLF5n6fV3FD8gBs98MhK5T9Hocwydn/K7TaI4qA9DYHouFN9D7CwqNDDKrx5ztRVLaQTgLsezqw4tLZt@lists.infradead.org
X-Gm-Message-State: AOJu0YzaH7YIg2li3XP/BTMsxXw5oZ5jBsGN151aV+/5DHSWh8FgWALD
	qbVqSGSMvIKLjfjjMpQj8QtU+7XMZgedNhWHR7RAofLHgqaFl67g2DcvRIGt9CSz
X-Gm-Gg: ASbGncvuACLuPfnI2HOHDLz0tm/APR1AgbK0HGe9owTqvXSp7/CmJCwIiBuNQtzedAM
	RlwH2Rw09eQxdxFBCH70C/vGMeJnuY1sL0d1z+82epmJrBzD9VgtqOgzkou0K/5+hJIYffhkI3J
	vDc3QO5Td6wv5bETkF7/Y6mD/EBhjWSB7PlLddS4GEgvs8tmwiRkbCn4uD2PwZR2mCk7GsDUNAy
	Psloa/ig+7X0mSye9P9F8Xt5STjU5Ld7yJj6Cidi+3ibj8AydH1OC3ZDVMF7yZ21KWYKPtjGqnP
	xFPnX39sZ6MyzRAPrVz+qxjNr3WqFzwZpUVW4ipqvcUVxU8co2uNjggIbVoS/EivXH2ydKsp8ZP
	O9HG6jf+F2Y8lqp/MDuNbTqvIzU4bOTTKghVb033sa+gyieLOspDd+z2u8/WR
X-Google-Smtp-Source: AGHT+IF2T8d4jUb5771UjmruMrP9mBeTc5QvBHjxcR+pzPfNdx1rons3OcjmSb6z0PqOPeBmBjW8Cw==
X-Received: by 2002:a05:6122:458d:b0:539:1154:d149 with SMTP id 71dfb90a1353d-5391cffb624mr1530950e0c.9.1753869391525;
        Wed, 30 Jul 2025 02:56:31 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-538e3410a88sm2598813e0c.16.2025.07.30.02.56.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 02:56:30 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e8135adfccso2143254137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 02:56:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjjqDrkn8vQ5fHz797VYHra9/TYYRGMHVs0SiwR9Jy1m8YAChjNoYKOsn68Q3CJhLA99l2T4TS02uVtD4hbqyg@lists.infradead.org
X-Received: by 2002:a05:6102:6488:10b0:4fb:f31a:98ce with SMTP id
 ada2fe7eead31-4fbf31a9e23mr303837137.6.1753869389838; Wed, 30 Jul 2025
 02:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
In-Reply-To: <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 11:56:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
X-Gm-Features: Ac12FXyBxoyf0eZjZq4tsf22xBIlBFOx02dopJh05JbQN3Bvqm8lfaYDOjqls6g
Message-ID: <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_025633_196577_7D18CB3C 
X-CRM114-Status: GOOD (  30.59  )
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

Hi Ulf,

On Wed, 9 Jul 2025 at 13:31, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Tue, 1 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > Changes in v3:
> >         - Added a couple of patches to adress problems on some Renesas
> >         platforms. Thanks Geert and Tomi for helping out!
> >         - Adressed a few comments from Saravanna and Konrad.
> >         - Added some tested-by tags.
>
> I decided it was time to give this a try, so I have queued this up for
> v6.17 via the next branch at my pmdomain tree.
>
> If you encounter any issues, please let me know so I can help to fix them.

Thanks for your series!  Due to holidays, I only managed to test
this very recently.

Unfortunately I have an issue with unused PM Domains no longer being
disabled on R-Car:
  - On R-Car Gen1/2/3, using rcar-sysc.c, unused PM Domains are never
    disabled.
  - On R-Car Gen4, using rcar-gen4-sysc.c, unused PM Domains are
    sometimes not disabled.
    At first, I noticed the IOMMU driver was not enabled in my config,
    and enabling it did fix the issue.  However, after that I still
    encountered the issue in a different config that does have the
    IOMMU driver enabled...

FTR, unused PM Domains are still disabled correctly on R/SH-Mobile
(using rmobile-sysc.c) and on BeagleBone Black. Note that these use
of_genpd_add_provider_simple(), while all R-Car drivers use
of_genpd_add_provider_onecell().  Perhaps there is an issue with
the latter?  If you don't have a clue, I plan to do some more
investigation later...

BTW, the "pending due to"-messages look weird to me.
On R-Car M2-W (r8a7791.dtsi) I see e.g.:

    genpd_provider ca15-cpu0: sync_state() pending due to e6020000.watchdog
    renesas-cpg-mssr e6150000.clock-controller: sync_state() pending
due to e6020000.watchdog

ca15-cpu0 is the PM Domain holding the first CPU core, while
the watchdog resides in the always-on Clock Domain, and uses the
clock-controller for PM_CLK handling.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

