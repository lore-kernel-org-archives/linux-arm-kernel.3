Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601B8CE8E7E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIClXhU0TI8fTpRc6FjEoGvpVZnc0ncz4HYCuUXs2hs=; b=hDIS7uiA7eNX4RZTCLcYuzHtwL
	9tMeUjxthWw2DiehtTV6S2IXA33d6BG6K1VCS0kUgc/uJVJd8GCOtxeVi9dDxOr1ZWhA/eRqxmmbl
	+fOQgG1ftkfPNH6qBLJc/sDE4IKJ4HWjS1ksM2g2OVwCNkXYttVFnddm8kU8gCTlbjMkca3cK+XnX
	pu4dfpDVPtxtaj3Ds/RCvvNLdKxynJa9AKwK7m6sd/uiBiC5t2TWwv3zU88/B3yO59tk45FjXISdJ
	i7Ke/Bw8ADJDYFPno6lOeeUd906LLzoV25EpFum+o0blPmDgvYhyO+Tev7dFkBE42P1c4vMxFnv7s
	9mD5J9jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ynA-00000000im5-167P;
	Thu, 24 Oct 2024 14:26:24 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yiu-00000000hNq-0us1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:22:01 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e3cdbc25a0so12410187b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779719; x=1730384519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIClXhU0TI8fTpRc6FjEoGvpVZnc0ncz4HYCuUXs2hs=;
        b=RZT2brKMVwkUmihIF893OSILQHeKKYR17uS/bqa8cBq4lIN2Z573ROlxboRcBiIG/k
         idF7xPr4p+WFO10UxsJnv73MdXKG2KXl+ydWStxeiW4Q8Icd5T/aPYVl/fLs8YAicjz9
         fGBxNLOy8XIqvs+5bmgy96C0nenE0La6aD8U1T3lDxenMmn57c0JYvNIleNnLNQwf3Bm
         N7bCf1W1n5xbQNG+D13cezs6BRVyeT9k27BA/bvb52/zsuHLRyQxoVU+35ojk3jLuJ29
         cxfb38mLzRpYpyl8Nfl98eVh5E+8UxOetaBVEIjmYbUUTpAMnHpsjhWmahxFS8DiFtOZ
         uNpg==
X-Forwarded-Encrypted: i=1; AJvYcCUOqHN/qIVbElDjaXTMOBvfUeVjG0n1ujejLsfebdjEsadVJQlHg7vM5iQrcziNZetPYvwaiXYyzXuhrE9dyywQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzrxpFc8k4gPK+ENPjSE8P1dKfEeyAKqMlrURGVHlg/iGcU3KQg
	aTaVNI7uF7bdA4suV2wJPw4bVFkCuPxqhcoXL+JDM0nOZbR5lQS11/3Fp8oH
X-Google-Smtp-Source: AGHT+IF7bq/48fJKHpNF3PALFSkQGBSnmk77IeLOOwV4Ut8dVWzcHP+iprjTg2Y8yzErvtM2k8Dr1A==
X-Received: by 2002:a05:690c:6281:b0:6dd:c6e1:7570 with SMTP id 00721157ae682-6e7f0fa6d89mr75423777b3.34.1729779718725;
        Thu, 24 Oct 2024 07:21:58 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5a6199esm19910817b3.46.2024.10.24.07.21.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:21:57 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e3cdbc25a0so12409677b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:21:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3yRYUFjfMLUBD4CKd4tQIRo811Mtr3b3nrrNpR/y8ucmD64w7sMK98JMezo4HyU0nGKX746tQcmXvZszuReCu@lists.infradead.org
X-Received: by 2002:a05:690c:8a46:b0:6e3:2608:d5af with SMTP id
 00721157ae682-6e7f0e8bc99mr47613857b3.26.1729779716691; Thu, 24 Oct 2024
 07:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:21:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZeZQN4T1=wT=K4BCR_Wk02ZBaKVSC7WukC0UGseM12A@mail.gmail.com>
Message-ID: <CAMuHMdXZeZQN4T1=wT=K4BCR_Wk02ZBaKVSC7WukC0UGseM12A@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_072200_279103_D2765CCD 
X-CRM114-Status: GOOD (  29.00  )
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

On Sat, Oct 19, 2024 at 10:47=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
> the tamper detector and a small general usage memory of 128B.
>
> The VBATTB controller controls the clock for the RTC on the Renesas
> RZ/G3S. The HW block diagram for the clock logic is as follows:
>
>            +----------+ XC   `\
> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>            | 32K clock|      |  |----->|gate|----------->
>            | osc      | XBYP |  |      +----+
> RTXOUT --->|          |----->| /
>            +----------+      ,/
>
> One could connect as input to this HW block either a crystal or
> an external clock device.
>
> After discussions w/ Stephen Boyd the clock tree associated with this
> hardware block was exported in Linux as:
>
> input-xtal
>   xbyp
>   xc
>      mux
>         vbattclk
>
> where:
> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
> - xc, xbyp are mux inputs
> - mux is the internal mux
> - vbattclk is the gate clock that feeds in the end the RTC
>
> to allow selecting the input of the MUX though assigned-clock DT
> properties, using the already existing clock drivers and avoid adding
> other DT properties.
>
> This allows select the input of the mux based on the type of the
> connected input clock:
> - if the 32768 crystal is connected as input for the VBATTB,
>   the input of the mux should be xc
> - if an external clock device is connected as input for the VBATTB the
>   input of the mux should be xbyp
>
> Add bindings for the VBATTB controller.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - squashed with patch "Add clock IDs for the VBATTB controller" from v3
> - removed "oscillator" word from commit description
> - added assigned-clocks, assigned-clock-parents to the documentation exam=
ple
> - used clock-controller for the node name
> - used "quartz-load-femtofarads" property for the load capacitance
> - renamed include/dt-bindings/clock/r9a08g045-vbattb.h to
>   include/dt-bindings/clock/renesas,r9a08g045-vbattb.h

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

