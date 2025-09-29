Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE82CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weWdXbQxCnMJeHS7B7BXqXEXqPpjTdZBAI+JQlcZ3Pc=; b=K3sO/iUl3Np/kVPy7+MYrJrrH1
	e21DZUB6PlqdzF2JWHUEqkycWKusdyv0W84LajOxtn6WrRMvhn3lLsiZQN9a0XEy3SRcxha1O1WUU
	56NVhf6TlTybriAWhtqJ/tZkUhaMUETihhRCB25sA8MUsiJh5Bo+TaUycShyq80uo7ltyT/J3uoPn
	OSnZjsY/2fPZEHjGGrITBWRUyLsFhSDROcEdotEFTee4OxgmB3XrG7HKWcpIEZaDrnBnE669Kj3tw
	6qFnyTRrQCFQDne3Nbk6lgLfWsTPwTuiR6SelMcamN/t1MH2GZsUEfHkGSxRaUHHJtA7LjqOMIE9M
	DunhBOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CCV-00000002MDb-2zaa;
	Mon, 29 Sep 2025 11:37:51 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CCT-00000002MDE-0QOb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:37:50 +0000
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-90f6d66e96dso1096656241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145868; x=1759750668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weWdXbQxCnMJeHS7B7BXqXEXqPpjTdZBAI+JQlcZ3Pc=;
        b=vTUDvi1WOeQ8oap5dmLycy5WCE4ghYEDTKyZBuNKhUU4otWUIgorfrPZkW2FwNi937
         MurSboAlOnPFfFoLsqjj+YsAaI0XCtNGrF9+x0jUrRh5S3kW8uUgy7c0Fwge2SGheESI
         iwoj8+xM8vrcrYEtpQU99PaDvyfJyMNGnJGfK7B9UEOE8sJIY0nrLgBzhWUpici/Owce
         nHpdybSjPM3/947h/JUyiJtbCDJPvkjZLGmGSUP8yphIM2JlXDeg7ptUh8RvDqpmqQt1
         nqurNcZQ8ma1NaXvxbM/3azjUiVfiZYMftHbqydIm8PZ8HT5/WeIqVrsPz2oJNy6tZd1
         Llwg==
X-Forwarded-Encrypted: i=1; AJvYcCUouD8luqHQ4KM7BOWdfkhFO4H9QA8H6mrj4UjSE9qtk86uaBKDgDY1v132V8zo3O67OewdzeCvpD7V09m9cBD6@lists.infradead.org
X-Gm-Message-State: AOJu0YwtTd2ROvdXve2de87g6M89uFnFQ8DUO33GYmdBgkbBYt0Jq6IV
	/kRjc/v7DuvRaLS6IoFG0NWBa38xDQN/TanXwwnzWy7Ok3+tSIW1gD0CorP5vpb6
X-Gm-Gg: ASbGncu8m2YSZQRg8m+Glumt+wH8Imb0dgEcp3omiBkB5pbr7gZpQ0XMgP12hEbJFCR
	c5sYIUh7h23iq/xQNu065QiCVNL0utSKZyzuwwesC8Y0JzIa6URxk9QS1Y6V2CmcWGpcPPQ3A++
	X+8XHS3Kv+zAwVf4JMcxs9L+HCf81MbBh11NTVw+jE2/qfIi9ywICBaH3gwQd17r2Vi0leRkYHF
	IVDZCpcotYtnIDL8vTGrUKUiPEPr69CCxZZ4Da2zByevDAt/4taxWItgKKtjCBilY7ArsDpZSG4
	Bfkvs70i+rOACD3RqILX7Sd5O3+SeQ/BZdBd3gPK5Q7sKlwM0yDYFNSHhk8kAZVZW/zWW1TMGvV
	aOIFUV+vTSQZEffSr4f/rXhdA8b/lznoyvFVwNiECU7cy05dHlgq58P1ycdF/mYmN
X-Google-Smtp-Source: AGHT+IEu+nor83SWaU0qFS0vN2K0VasgohNQSw2fL/0UnIO9W0GXTEU3idZ1QR459UlG93VsUjFPxw==
X-Received: by 2002:a05:6102:4191:b0:58d:1ac7:a162 with SMTP id ada2fe7eead31-5acd008aab2mr6221346137.29.1759145867659;
        Mon, 29 Sep 2025 04:37:47 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d9bb7a60sm2253036241.17.2025.09.29.04.37.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:37:47 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54bc04b9d07so2000587e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:37:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUIM5k/O7Ey3zMPneYmPPsfHJoAyp/YoWcAolGS1gSV2TRmsRjdIP48YNfU1/17hgdLw7KFDmuQuSLD8qvXyXPQ@lists.infradead.org
X-Received: by 2002:a05:6122:7cf:b0:544:8d16:4541 with SMTP id
 71dfb90a1353d-54bea102e5fmr5636901e0c.7.1759145866822; Mon, 29 Sep 2025
 04:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com> <20250810122125.792966-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250810122125.792966-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 13:37:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5zSX5URg4vY3Mm8zo9ghE9cTBOMg8ozLZJ2QevF=7uQ@mail.gmail.com>
X-Gm-Features: AS18NWCeuTWOa-ri5Qlkxi0ZocAYLNnINdMinkM81tK5_mT4fKgbcdtjVA380a0
Message-ID: <CAMuHMdX5zSX5URg4vY3Mm8zo9ghE9cTBOMg8ozLZJ2QevF=7uQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: renesas: r9a08g045: Add TSU node
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	niklas.soderlund@ragnatech.se, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_043749_142942_01ED39A3 
X-CRM114-Status: GOOD (  18.79  )
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

On Sun, 10 Aug 2025 at 15:02, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.
> The temperature reported by the TSU can only be read through channel 8 of
> the ADC. Therefore, enable the ADC by default.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

