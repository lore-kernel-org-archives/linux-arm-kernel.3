Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30DACD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=; b=m8lEi9pR7ijg92It1kPcUQJvuJ
	w8XSwpR2oRdT83M/kodP6T/p6dEOHx792aSxkjrp8KxGEk6awY1aQyNT9lG2Dl80i+2cUYBWWDEhG
	grK1YBAR92TJeJ74JIfYxbBWiToqGqEev+xpmD1I/+3cjYDFVuMOMf5YL/Mc+3skd2Orq+L1UzpLA
	HbeW8hNN86GgIWePJNxodH04ZKFfLvRlFHFVE1uTYNEdRl0bLOGteLRaMfg04cWfFBT09/vKCTyV8
	safyC5hy2F1isB6+VBXuU4ULTzNmwE4dbBPPPj2BK7X01/KHav9AjQg/ugf+/EvHR0SLnSIzdIdgT
	1OOrA1Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPoK-0000000AwbW-2rco;
	Fri, 22 May 2026 13:21:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPo9-0000000AwS1-1vX8
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 May 2026 13:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=; b=Ku25Nw3CmL7TmsgPQ6MTQr4uLo
	qXX7hd9eIEykLwvUeIkL/bkE+re8F+7RqrIcWdUd5w43SA4PSs0lrDOADk+hZ6Hi4fK/xHx+D7Wyt
	s55d8LHLmi0DiJFaHzwyJdbFoC/EdjDfypG4v2AolwqUMrBKF3pjx6vzfn3LVs+hwO9ZewCemYeV+
	GMrwH2mMHXLurvCNZYiuic8+RBn56Eh5XR58CNA/h45HdTPnzfmFvCB3Ha46hXO21XP6pSqvMOV3a
	K4oMdS56/Iv8wKICSi44AEL/duqSB6o5NCVstsTDs0g1b3WO3eXZT88gOEBGL/GH7cbI5fZziyLok
	1MG3Hm7w==;
Received: from mail-ed1-f51.google.com ([209.85.208.51])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPo4-00000004QIo-0wbW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:20:56 +0000
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso15494930a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456050; x=1780060850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=WFOWy1jsutzhHpmdN8DX8gioJt3vHaNXS30O+mXfP3tx4a6EwKaMM1Hy5qHZDoEZbV
         apb1vswafS48Xzmcx3N2e6mUtQroJQz1hAVyXBO+tx4FmTwdKcb6qmsmhKvCvoGmBdOe
         gjOnfFI1uE2w+PGI9saU7k8BbV1IG4J/SSZY6KtSb0QQBEszzPQwvIyoo8mSogcRi8DN
         cO2zcwjBbRjuoIVAHpLjxdcHjeDg/wauMEQcQbvPAc+K5xXuOF2nkwo3/tqjkKrfXEJR
         UegXrqe7vvrcrQamxMLGdCjbRe0hAkw7dlDY4SBs2WCD4YxbtXNX/WUA14tgtj/MJZLA
         YfaQ==
X-Gm-Message-State: AOJu0YzSFeIxuuOmwFktTcfr6gzdIH2fkv3S3xsDPXkUSH6VpF6QuaXY
	TR4tyxuuvGPBMFLeGNhuLEh9/2uh0so6N3ElW4xwr2/KesVy7ikqE91ZJhiHNVXKZKU=
X-Gm-Gg: Acq92OEUmlkkvaHoOHHMhDVz7Ae9vkJiScW0vl8rJIKJ8b6eM5jtPjwZ5RZYboboKew
	0hLwsH/ToyMJIZqAmwUDBFOe1gB0TCewRPRtS9zMOADFWh7kMkjJRcWIrMm8XmMhYT0wTETsoSj
	G37BiL3RpTk3gulzUFuFmFDXVWr8KIQEY8wUjRixp1pLbbTzRP/p9laUB4TKBTFva9/RkXkVF2u
	dz9MO1GYEIfBtlHkBPUrCbleuneZrtGZ7X039iW3GtX2mfAb1SxEV+DiUyQ295YDdsrsG0aOlJD
	I8OTbSGaJmjBmf0Ts8U9rx90UOTk47a6Cka2YlY075ZELHVMUZU1Is/T8f8vKSeI352JdqLpcwl
	7SFUPbFzL16wJ51R5A/yuM/vM4/FsBSPqESNEHEPYldiPGu8Sr6th3e/sjSv4HllsXgXVgUymND
	wc+L7bSgH5kIJD4RgkMiyplCIyxhHtHI2OP/NL/RgsW+31t6IqvXdvquRkesFq93dm7vcYU0w=
X-Received: by 2002:a05:6402:5241:b0:687:cfde:ddb2 with SMTP id 4fb4d7f45d1cf-6889c45726fmr1923826a12.11.1779456049771;
        Fri, 22 May 2026 06:20:49 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f5056fsm665647a12.9.2026.05.22.06.20.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:20:49 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68707d88626so6999412a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:48 -0700 (PDT)
X-Received: by 2002:a05:6402:2111:b0:683:93a2:dfb9 with SMTP id
 4fb4d7f45d1cf-6889c437481mr1999990a12.1.1779456047876; Fri, 22 May 2026
 06:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:20:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXM9+4Zhz1-jOu14rwNLvfY5zvoO5Tz2AN0VaCzNMqTdg@mail.gmail.com>
X-Gm-Features: AVHnY4L_KbB8gzS9scFyMNemawa__tn8rl0sAqed-jsnkmOH1xrDTQxnThDhUyo
Message-ID: <CAMuHMdXM9+4Zhz1-jOu14rwNLvfY5zvoO5Tz2AN0VaCzNMqTdg@mail.gmail.com>
Subject: Re: [PATCH 02/11] arm64: dts: renesas: ulcb: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_142052_654736_32AAF354 
X-CRM114-Status: GOOD (  19.68  )
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

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

