Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8615CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=; b=ILmT0HV6z5TFUJmYlCzGD8sPAY
	XmgVkIlZjoDE3Wg9kXEdeG77S136brf++O97pzyoq96JvLUKVFrc8KFVtjfrhoOAHDF40jLFezhMa
	hZ5/tuTL63SNuCn22wycJ8aG1dtTpxoEaK0C9vlI3Ebfhpiwcve44Vl19oYkEUZC+r/xqHAGXJqx2
	oXy6GjaFal8KClHhJvj2yHDfxZIEMX3rsZB5dBWvmgdDsIaNYlqaGBRCSfwK0xS/YzbLWkrQ8SveT
	rsorhJfiPZefN8vEqIZL1Ay3OyR1HeytVzz9RnsXB8IZApjUTs/ow0LclCRnRClJBpSUKenOlaleq
	0dq94b4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPpt-0000000AxZI-1JUw;
	Fri, 22 May 2026 13:22:45 +0000
Received: from mail-ed1-f42.google.com ([209.85.208.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPph-0000000AxWZ-3Wwr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:22:36 +0000
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67be41d5eeeso11741556a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456152; x=1780060952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=o3YlRcAEmlkawUU9R0MFlTiZ69RgnLPj7JB/UjPwVbDsFAIf1tkaU6XhhzzVKR5Tts
         CbxkLLMm3Jzb6gZeOm5tJbm6JF8iZ/lE+5UhuNr+OVKVhuyugi/3Buik90N/fGBt2jMQ
         c2DXp4tVyAeLeTpkghQ2wliRB2QwE0KyVE57Fu8jnUbANfYWIryJYYRWHcjBPEh658CV
         TvtZE9rRpt50KtcnrzdYKe81cT+nEBaUgWXEetmRw/9aBLzgsB8AxNoZIDx4MV01vx9j
         bonsW69/tWXhCYV6DjRaWBCzkyZTYj5ENNvg/4hKUPRvi14DSJWRfHpeDDlWLUh8cAt1
         zIGw==
X-Gm-Message-State: AOJu0YyyCR3ILr+kUGf1AWvu/FmjyyOYY/pvtOVHbTWT9F44lsvvHlo6
	QV/nunZZHQvKwJeUmVaUnvg9k3dwmIxRytbuIYQ1hoMaOuv2a4Kc29HSZmANVW1zNgU=
X-Gm-Gg: Acq92OG1PdQjJqFbcQ/gG3oJX6/7FCgJaZioV2I9ypzf8uwz+vf7LYBhtChbRoK1fvS
	auunjvWZqcWz+akVThOYmKNOuwzY6QA2+BxNDFPA3s18rwJ6Hqd5DDzp8FRsO5pwUazr8zKQ3Yc
	kg1Zc+M6U2/DcT7XUdbchDevcZ8PJ2Om9fw1gsBAQf2+NwChbWysyHw6OSBVYojDbXfmbXIabke
	aqIqt4pEP50JUlOA6cq9MqxSMqVPpRRppVE7knVqRtUra4nGeUwY48nG0Ak18gT1NP13NyDrmdJ
	9aXnkrt3b4RrYryH3IFsR3Wa4wxLLRi/UeVOp+7jgoSN6/t9kMrEw485DmVlN2Wc0p9MOKuQjT+
	zPFEl1JIaRzAkHgPnh/wV2ee36rbIZ+geR+unirlV8AnppE+itbOmSxF6DL3WEfj1hC4M6jsofC
	e7CDUnFMelFIk56k8hEtSVdS77+qaiAezWBVmQi3oF2edpxEi2DM4IbKe3ny4r
X-Received: by 2002:a05:6402:518d:b0:680:ccda:55bf with SMTP id 4fb4d7f45d1cf-6889cc37c86mr1914593a12.16.1779456151772;
        Fri, 22 May 2026 06:22:31 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm662771a12.0.2026.05.22.06.22.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:22:30 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso15498161a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:22:29 -0700 (PDT)
X-Received: by 2002:a05:6402:11d3:b0:679:223c:d191 with SMTP id
 4fb4d7f45d1cf-6889cc37577mr2016938a12.13.1779456148995; Fri, 22 May 2026
 06:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:22:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxyCZTP7xL_LM-Cv9-Sck1xzqZOHZ=N5kDX9hPudG3+A@mail.gmail.com>
X-Gm-Features: AVHnY4K2SM3Go6ojXmLuCDRf56eRUek3q7fWhfqLX5InhJaDiWPYyWgu3SlfzNg
Message-ID: <CAMuHMdUxyCZTP7xL_LM-Cv9-Sck1xzqZOHZ=N5kDX9hPudG3+A@mail.gmail.com>
Subject: Re: [PATCH 06/11] arm64: dts: renesas: v3hsk: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062235_127102_45EFB034 
X-CRM114-Status: GOOD (  19.73  )
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

