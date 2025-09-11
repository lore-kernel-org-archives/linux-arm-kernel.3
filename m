Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F129CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aEqSU2P1b2CIto9Lv4/l3FD+TkgDRrCyIli94hbcAg=; b=u0VZG8ob4tCdpu50UDjuWJFXbb
	XIKBRDzS5TmoEjxVF0Jl1ACSndz52kv3fG8z1qAZ+GwunU7qRzKDvUaXq3bxrQZBUiuEAszXn6YAx
	B8/tEVlBPogSUwYXm+x4y0N0KAcJCB6E6cqYIQhOAUamli0HL7e8PpXnwbD4EVM4nJLzlaHe7tHVP
	Rfc/aWYFwd/4UfMba4t7pqSCYwigmLsXa7GO/OqNn75+ncS+E7xG+iJ8rzDF7GdtaKJwsRvn0+yWL
	cM0ClYUtvb1jeMVmmgzivT7Lc4Di4ej9O2w2sUA6d8MxWWwAg1xm0FjK+OdAtmXtBjmfEdUDU4xx5
	FJWthtiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcBj-00000001eop-2eD2;
	Thu, 11 Sep 2025 07:57:51 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcBg-00000001emi-38vq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:57:50 +0000
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-529858dc690so155857137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577467; x=1758182267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aEqSU2P1b2CIto9Lv4/l3FD+TkgDRrCyIli94hbcAg=;
        b=KrWZn/S7sPjglTGT10YkMyt2YlysyO8SoR75lB+nu75yce27z/H2L5iPR71yHwA/Nw
         LxA71GXgMolhMz8o4THSOuOB9doAZQzqiKoCbftAvrbnpH33AwbMLm4o/Y75FNWxPMVc
         wPBPiiSql1Hhf3lQaqL3MpInm8lxNsviBq84fSQL6wdeoyRrIgmJZ9kHpBibPG6bHrEw
         6yHtoeIXUtsBaCH3w3cpnvpShtOtbWzD/aew9Fk5Plw6qfD22HzmqX2Ho9FTCVBMaz/g
         LxKV+pWBjZUK5xtdmwGlt2F4RcHmg7/QI3PEyzsXTS78v76fMTKNjah0Zc1AsKiKEqDW
         /jZw==
X-Forwarded-Encrypted: i=1; AJvYcCXjEAryl4NMfuhadfZHMvvUyZnH3LqydS7Xc5i6yegYj+F2P6nrCjtdjWTV7h2CFPhKtkHP54t50zPvvGOM8B9J@lists.infradead.org
X-Gm-Message-State: AOJu0Ywup/MW0KrZiEjQb19YPKNt70I5wWov2aGlmXwIjvpFhQtU+2Xj
	HG5aY2G6H5pQ/pIvaGuE8ngPjHmbn4VSAMOMIj8fAu+p8CiLHGKBzAemh0vehplP
X-Gm-Gg: ASbGncvZiAxDPbfoQZ60Ti5HLqK3Zxy1PYtELFlbed257jXlXON8zFdSbmcz9l0r/AG
	nQlOsK0ty5fCj5I9qK6lDXlIIZ7zYjnnDfJMEcfA0WEjEH550DAgvqZvPqzH2k9OBrSOr2eB2V6
	mPnuYNFkJoqo+460G9024ovveEF99biCicExY5OJG/BiiEz/KrkZgCrVI7eq9cQuKLNkDQTo+rz
	Fuf4ZCwFrHXbGQD7hj9WOCu4+DfGjDXdYdlfyqk41+lNrquQ8pPhL5Rc29rh1YxOz18uegnLlOn
	BbJ7Q3XMOuVXKtHsIeMDciQis5128XUJo8t3WZAOZ/fPHFidTrw+8Chi/wVcN4EOagp7nNW9Hyj
	GXe6786PaYNZHlpnLt/7J9QzYA3vyAfFyjqh22MjIvTk7NTMpFbERcMScFEPD
X-Google-Smtp-Source: AGHT+IEpOUHCvEU7HR2VlkmYMD+nNCW09eMeaAEbMCyfZ7M6bbm6NSRnQvfViLvEKmebOqEFl6X/ow==
X-Received: by 2002:a05:6102:291f:b0:505:ff14:8e0 with SMTP id ada2fe7eead31-53d0dbe86a9mr6053734137.11.1757577467060;
        Thu, 11 Sep 2025 00:57:47 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccca9847aesm138156241.8.2025.09.11.00.57.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 00:57:45 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-89ea3532bfbso123162241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:57:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDmuB2KgxZ/iRZELiSS8edQz19Bs2k3HWyD/70pWUIKOjxxwGY/UrWoo8QOf6HLvi6axwylr8R5T+JqwZ54Kt0@lists.infradead.org
X-Received: by 2002:a05:6102:f0f:b0:4f9:d929:8558 with SMTP id
 ada2fe7eead31-53d0dbe8691mr5573431137.10.1757577465161; Thu, 11 Sep 2025
 00:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250909111130.132976-1-ulf.hansson@linaro.org> <20250909111130.132976-5-ulf.hansson@linaro.org>
In-Reply-To: <20250909111130.132976-5-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 09:57:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5JoLtWXMyKuAUCZJ9eHNmwq+9tgxoZp_tra5EsR0MNw@mail.gmail.com>
X-Gm-Features: AS18NWAlFWRiIXmkD3SV5tWbWJm99eVB1ztGinHkPJ8EYIv22Z3s-pOOeozKf5M
Message-ID: <CAMuHMdV5JoLtWXMyKuAUCZJ9eHNmwq+9tgxoZp_tra5EsR0MNw@mail.gmail.com>
Subject: Re: [PATCH 4/5] pmdomain: renesas: rcar-gen4-sysc: Don't keep unused
 PM domains powered-on
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org, 
	Stephen Boyd <sboyd@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis <sebin.francis@ti.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_005748_803701_58A4D577 
X-CRM114-Status: GOOD (  22.79  )
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

On Tue, 9 Sept 2025 at 13:11, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> The recent changes to genpd makes a genpd OF provider that is powered-on at
> initialization to stay powered-on, until the ->sync_state() callback is
> invoked for it.
>
> This may not happen at all, if we wait for a consumer device to be probed,
> leading to wasting energy. There are ways to enforce the ->sync_state()
> callback to be invoked, through sysfs or via the probe-defer-timeout, but
> none of them in its current form are a good fit for rcar-gen4-sysc PM
> domains.
>
> Let's therefore opt-out from this behaviour of genpd for now, by using the
> GENPD_FLAG_NO_STAY_ON.
>
> Link: https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
on R-Car V4M (gray hawk single).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

