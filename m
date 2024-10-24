Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D79CE8E7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqTnsoEZYxtOvzGswQn/BUh9epLwmQzIa7/D6c1Al8Q=; b=azEKEZRu/ZLfZt/7LA+Pa0Jiwu
	1atTpRfUGdpcJuzIule1ptNIun4M7Quiuc+RVhYNQ6M5F+SpFeZLZAH4GQ3DxgTrmiXsS3O/dpt73
	Cosoyi68mBwhIFBvZ+iJF+c3MFP/0sbBLaGB1TRV605aZZ3XUVz/lUCkyrF4VdqBq/8lkhSMRPA84
	DbeEd0LudG+3llMF+XeuD1jjKTldK4sdfRHrz9jFJ6d0hFJXyLVvRO1J8A279+J0cDx8BNKXy9EgK
	WIC9qQY/OWiZcXXWfEyA+dLKDFRbCOzzefZ1CQjPkpYC7Hpnu+QP56A9n/fp6Qtu2Zd64rcbKdZ8/
	3IzX7XCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3yiS-00000000hFI-0mjz;
	Thu, 24 Oct 2024 14:21:32 +0000
Received: from mail-yb1-f174.google.com ([209.85.219.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ygd-00000000gsu-3m9t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 14:19:41 +0000
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e2e33f614e1so1131897276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779576; x=1730384376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqTnsoEZYxtOvzGswQn/BUh9epLwmQzIa7/D6c1Al8Q=;
        b=Z3Cj3jnScaa1/U8uWapeCKYcbcHwZ4zggOzqo+uQpBns/clPrwycnGbWsfeNuRzCfF
         3nfQzzirxI5EPSSltl1Wyh3jmKweCf2zmZsj9MyTPJwbtS9UUY1LSgnA4AgDlXDw6Lyi
         mi6YB/8wCEMBFhWajE11EVjz6Ht87Kbj0S27OxkaeE5Ji3dYRyEfVbUwBejYPB7DtKdj
         bc71nx7Y9DujB12Ow8RjJow9Hc1OeWZ4p8GnHSuOn9zDM1EkPy9Qtdq5dxnYC8+XJGht
         yhDyuWr2xT8yhy6Ay+aGkWRk7ORHstv+P63wpAEMp70pDkE1czzOwr1BYF+sinY4azNB
         lH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVhQ6cjJ1qGWvsl/cuhGKYfQvJvsNo+G9EI9s+7Qnjc8CrQpovoEF0y/2zuGtzBHLlmVCGvs67JiJXIYwFGMba@lists.infradead.org
X-Gm-Message-State: AOJu0YwIJA9+VS08mS5j7DZ6xgNO8FAA0CAu61gc5OmyG9HpxLqcuXoR
	mTy4747+f3OZq/h2EYgsS7+9Ew/qsw/dbDTyMOAAqvA/ivDPcPxy6P9ur/ry
X-Google-Smtp-Source: AGHT+IHgs/tnTA/o9UqOuX6K85qKJhsrvSuYWzVXglEYZmgtu4bjxAzoBoF23Kzy0NPMDbFesj7h0w==
X-Received: by 2002:a05:6902:160d:b0:e2b:d078:d9ab with SMTP id 3f1490d57ef6-e2f22f1ce02mr2365229276.9.1729779576243;
        Thu, 24 Oct 2024 07:19:36 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2bdcaebafdsm1985662276.44.2024.10.24.07.19.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:19:35 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6db20e22c85so8413897b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 07:19:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVo6i+q7VqvMwjP08JEfJb6RTOaG+wuW2rwIYlVXGKCodGbkJpGQMiIEZXmDcmWyswUqadsQwSkj/bxxTW7Mbdj@lists.infradead.org
X-Received: by 2002:a05:690c:d8f:b0:6e7:e009:183e with SMTP id
 00721157ae682-6e85814d515mr26107007b3.8.1729779575387; Thu, 24 Oct 2024
 07:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:19:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+7GJammviw9kOXRY8ijchDbDwWEF=gwVJ4nAxCEWAgQ@mail.gmail.com>
Message-ID: <CAMuHMdU+7GJammviw9kOXRY8ijchDbDwWEF=gwVJ4nAxCEWAgQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] dt-bindings: clock: r9a08g045-cpg: Add power
 domain ID for RTC
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
X-CRM114-CacheID: sfid-20241024_071939_965312_B890134F 
X-CRM114-Status: GOOD (  19.41  )
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
> The RTC and VBATTB don't share the MSTOP control bit (but only the bus
> clock and the reset signal). As the MSTOP control is modeled though power
> domains add power domain ID for the RTC device available on the
> Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - none; this patch is new; after discussions w/ HW team internally it
>   has established that the RTC and VBATTB shares different MSTOP
>   settings

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.13.

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

