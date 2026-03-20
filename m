Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1191091914
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PvZpuVVxetN8fW8SGMMv2oOoisnXVtBvFyOxNcmFsb4=; b=zNTpj4N9/CR7Q4SC+VTWU7HP9f
	flSbbaahdEaN3v0yAEMn8unoLzWKoKl3bLtjpxH3B8h/Yvx+o38V4rIAtB+Fd6Tsr8B+or2fQyszG
	zNnUERA5wUz+Y1vmR+PE0aJuxYSFb0t62qs4/lLtF//Z9P8hyS8EFtO8on+7O8gQufNcia1jq0fu4
	hiKfkQ2ChOzB3WvH2LBNEsuTrnvXbKdlv8g+R5cFf9NsSClG8nfDdlnSlw4KOVJgzmq7DjoRfbzGm
	0+AOA3LhivchdEGCF99BM9ZURvdms4qhX9C8cNS9s6xomPs3XXJNjdLymuRrDgEqp7Kdh4tLXLgVc
	x8iRDLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WBM-0000000CTmt-2cv6;
	Fri, 20 Mar 2026 09:30:16 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WBK-0000000CTmR-2GLf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:30:15 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56ba039eecbso527493e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773999013; x=1774603813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvZpuVVxetN8fW8SGMMv2oOoisnXVtBvFyOxNcmFsb4=;
        b=YacbRNaBbJvdEVK/VlRp1qri7sxBURZ/WoXs2WQXzlh07dFnN9Nf3gooWd/ithiWe7
         w1CFlL9fMpMZC/cxblAG5XwVAkq20rNzJHYsqcEtLg9Tdj2zxfkW01d8hn6iYRhpT0Yb
         e1FicjwC4rDrytypYDforAQUaREBR1zB//NJtUTY+9kdgSau0jUmBdzkugF8gNTY2LnO
         Xnkm/mK6SvYdZXWcldHF9nxDZC8O5QCAdSFNRJPj4/u1uk6Va1zOFMcWs/mXEEIl0JnX
         o19sFvqfx8r88NK4tJMb8X6BLAazx5cpnMxAkot99P0nUA37yPfi9JAWcTRAO2aHUGsz
         15LQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2G/R3UpgRFAjCGbBenmm34mlDi/CPIygnAKCDM1KNO+Wkq5qsONdlR780JyKPDHX5VrUJ730XYt/M8I7rNC3w@lists.infradead.org
X-Gm-Message-State: AOJu0YxisqY2cqeojSKKTns8WiWdsOxUQF2XZCP6JUG5cEgqOqYk3KUc
	E16616v+SadYCphYQravuC58WNh86TrM69OXaKwxfOQWKwvUO9vFfc9L/9rnO42xiaU=
X-Gm-Gg: ATEYQzzJmBnfSZvJe4cqrskaRHxgrLUJ2YvGBB9i2Jd1DAs8jdPelpm90P93febjUA0
	EB4kMIYsvyRw0nuLQjEGuWt5JQZjRMlIU5Gvxs69nxz1MnDspri3lUKwqPsMSlg2YRuKdIYG+lH
	NfO9ITZBfX8xJSo+JmNvAHgEPocA9ngyZ0BevRpU/BbCZ9m/cGEJZxpmbWo6pGlKruEiNe3GvFn
	n5KLlzZddbZ277e1usSMv9U5HblRld8ds+cSHSFmn1qT0PUzqHStAPxkHSCejE7iy8kwpE5OGMh
	f3PvzsjJGVptSZa7mWp3eYQPN7559RJTOxAumMnIsFQtc9Qi6MA4yYZ/fIpFY+fudz22fYePNZY
	aJoDKq7iUKBQC4Gdwnxo7ZYbU+RxaUny2wNop5+A3kYXU/CYRAdLg/JAMHw091GZWNUYcrrCtqg
	rxrFLJCGB9zDwnE9669Erh1S71imlMx/yh3TaAMyV2IlC8MIQ0n3jAhdgN6hzD
X-Received: by 2002:a05:6122:e153:b0:56c:dacc:9c3a with SMTP id 71dfb90a1353d-56cde467e30mr1108927e0c.16.1773999013293;
        Fri, 20 Mar 2026 02:30:13 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ce54d6b6asm117872e0c.4.2026.03.20.02.30.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 02:30:12 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-950b8021c5eso445928241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:30:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJnb3GmrYrc3LIN6l7t7e+849dmMSGV54mY6QWXe2tJTHZEwpUFPnfs+6tLMDUSi2wkW7XvxS3/Fw0pzF1UKzg@lists.infradead.org
X-Received: by 2002:a05:6102:32c2:b0:602:9b21:eee7 with SMTP id
 ada2fe7eead31-602aeda064cmr1023651137.35.1773999012540; Fri, 20 Mar 2026
 02:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260303132305.438657-1-ulf.hansson@linaro.org> <20260303132305.438657-4-ulf.hansson@linaro.org>
In-Reply-To: <20260303132305.438657-4-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Mar 2026 10:30:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_JRyi6c0gSqUQx15O4P=Jwgk+KF5_+-6Vgmi9Qhb7bQ@mail.gmail.com>
X-Gm-Features: AaiRm51lImfBHRAJToTl5QmKb5jcgwY_5cx4HzzxJL5S7cMijXzTjCMGdCoxrjo
Message-ID: <CAMuHMdV_JRyi6c0gSqUQx15O4P=Jwgk+KF5_+-6Vgmi9Qhb7bQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] pmdomain: core: Move genpd_get_from_provider()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_023014_583595_1F5D50DA 
X-CRM114-Status: GOOD (  16.98  )
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

On Tue, 3 Mar 2026 at 14:23, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> To prepare for subsequent changes and to avoid an unnecessary function
> declaration, let's move genpd_get_from_provider() a bit earlier in the
> code.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

