Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C97CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcL62a5hHqNXI6ber/2x37lX4UAGBk2bkZQAgf4AoSc=; b=YFXAYDwZNXtwJsiX5TWU2aoPR3
	evooeKnUZoeM5kMNqTWGLGCbMZbk5FG+GnKNgMjaLsKWrtyreOmfcu9U1+51CkJh0e/jGlWfSLhPc
	Y46juftxgcdRkPAWZd0lvoDHa3leQnYWf6q+OcEWw4qMYU1YjXBHfUgSIvdGHVIPXjc5/sXqq4mdY
	buYswRd6klWD0YCTFlNh0WNHSyjvUBwQYXthfSGzNRFAaxbXNmA1m1licNJEd/+Z3bnmBk2BDyuNH
	642ORXxfJs6UmATObC68/O9N3ks0xM8+Do5OGgwjGuA0ylleCRbik2CKcSQtCXnUFUlen4qKT3bDQ
	HLavp7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOB2-00000003lg1-18ry;
	Thu, 30 Oct 2025 08:38:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOAy-00000003lf7-3vt5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 08:38:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47721293fd3so4660535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 01:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761813511; x=1762418311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcL62a5hHqNXI6ber/2x37lX4UAGBk2bkZQAgf4AoSc=;
        b=aLn7g1yfA+X717gjZPZzChJVZ23/wcDXE/ABUswAgtzZ/WH0CgXoTsusigJB8CL8Oj
         /DjrMSBdldIF5TpRGQn884OX52OxDwDenj5jqPPhhw5Ue6KmKEvnZ9wj9Y2aXO72OunK
         qeQVk6mmZUs9URxptMmqrO4jqBbcezp6ySHGZhekIhRbaCYEiv2kymFT78nW5uHlnEtV
         UxswP6eAiErgOP1f3BwBwLTrhyzToX93s3AagRh0J5D9Qof38I76gspq5xKZVbm2AUDh
         GNrz+Dx+Gq9gr/xSdUNZgsrXKunFMJdJADWDIzKAK7v1Ju29KsP5z+oO+MsArRWehbn4
         a4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761813511; x=1762418311;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XcL62a5hHqNXI6ber/2x37lX4UAGBk2bkZQAgf4AoSc=;
        b=l+kO0vXneEyz0s1V6y9veySp5spSAbGSy/5Y+szmIzVd1ptVqyYJ6nu2YqrMJaA8NX
         IJabx6vSBTo6v1ro60yuE+IcIX2yENcRRY103UrEIa5Ekg+vPAfn5J9MdJY33RYJycrp
         OKwrgkLoblU5wTMTshgg8+n7MmtH54usDIKxMNNV/F264gGzTERkHwkyyJI8+s/LNfDc
         KItnYEezW/pNIcI06EAt16vuAnH/nnerPflSaXEgKGpYqoTiiMgUbD5fA3KtMJokZstQ
         3ujQOtCy3weKXCH5+CotTYmGs3BbOdwc72rVNYJ+YO8dpsO/+scfcFdNwZN8CCcV96UR
         MMNA==
X-Forwarded-Encrypted: i=1; AJvYcCXvilzZq3+DI3+mtZ1Dj37KtyfIzx88a4k5cwVESCafBSh/YiH64cuoyDbroYCVJDOqU9xc542L+lfhkJ9atjgk@lists.infradead.org
X-Gm-Message-State: AOJu0YwVPjxu1IYXPuT+cSbFnefMiHg88IPsbEG7J72HTw/h9KU0fDTT
	peTqt6TOiP0r8riWlOM3O7u/27T4q0+oxecVN8ZhctlscrhL22MSYlQcfvTkQgb4IPo=
X-Gm-Gg: ASbGncsRysXa4pIKsfIjIrS9BFXPD3WXFMj4QH0+IBgXdBYaeDbv7sNrBZhuvBj8uVN
	dsZztP6hePVAmd172/MHpBOPHg7YTMDJsjnqgwqqz1EcKVVl4QQajBZS9qv7lXl4t1KD5WemIbY
	vwEjDfcmhLSg05L1i8x9Pe4aUkwPfT9MfTsW9gLZS7F1wuxz//krUyG8s6RQlmAagxS/nSzqZ7t
	XnljRhN09w9GkJF/o3f9xnSakQykCuHOYzOE290eocC7EBjlDRIJxYahb52Mm3/ewSphFowlRyE
	+1g799AjiUNrBctivyht0PorRt8EZS9i/u64ZSlNYOP51qNyGzqN7BMYE/KlxUg7miPqLBShVxb
	tbKsyNN1zbYn/3SVL1aZD5tSm9Zv2ibGgG/g5QnJXZAy5KdksCtYqHO66TEVgW1zoUu1Jyww49Q
	zQQSz7SRBW
X-Google-Smtp-Source: AGHT+IGaIha2nuoz8jrt+cE5pgI+VJzm+ijZNjpXMyU/F0fQvHyvDhStIYNXWfm/PBDpohWawi3FOQ==
X-Received: by 2002:a05:600c:44c9:b0:477:11a0:b746 with SMTP id 5b1f17b1804b1-47726239d25mr15315075e9.6.1761813510964;
        Thu, 30 Oct 2025 01:38:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:64bd:9043:d05:7012])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477289a57fdsm26741525e9.7.2025.10.30.01.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:38:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  da@libre.computer
Subject: Re: [PATCH v2 4/5] clk: amlogic: Optimize PLL enable timing
In-Reply-To: <20251030-optimize_pll_driver-v2-4-37273f5b25ab@amlogic.com>
	(Chuan Liu via's message of "Thu, 30 Oct 2025 13:24:14 +0800")
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
	<20251030-optimize_pll_driver-v2-4-37273f5b25ab@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 30 Oct 2025 09:38:29 +0100
Message-ID: <1ja518zsvu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_013832_993385_BD262CB7 
X-CRM114-Status: GOOD (  24.49  )
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

On Thu 30 Oct 2025 at 13:24, Chuan Liu via B4 Relay <devnull+chuan.liu.amlo=
gic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> l_detect controls the enablement of the PLL lock detection module.
> It should remain disabled while the internal PLL circuits are
> reaching a steady state; otherwise, the lock signal may be falsely
> triggered high.
>
> Before enabling the internal power supply of the PLL, l_detect should
> be disabled. After the PLL=E2=80=99s internal circuits have stabilized,
> l_detect should be enabled to prevent false lock signal triggers.

You to reformat this description. It feel that both paragraph are saying
the same thing.

>
> Currently, only A1 supports both l_detect and current_en, so this
> patch will only affect A1.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 6c794adb8ccd..c6eebde1f516 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -383,36 +383,38 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	if (MESON_PARM_APPLICABLE(&pll->rst))
>  		meson_parm_write(clk->map, &pll->rst, 1);
>=20=20
> +	/* Disable the PLL lock-detect module */
> +	if (MESON_PARM_APPLICABLE(&pll->l_detect))
> +		meson_parm_write(clk->map, &pll->l_detect, 1);
> +
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);
>  	/* Wait for Bandgap and LDO to power up and stabilize */
>  	udelay(20);
>=20=20
> -	/* Take the pll out reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 0);

Why is the reset moving around ? nothing is said in the description about
that

> -
> -	/* Wait for PLL loop stabilization */
> -	udelay(20);
> -
>  	/*
>  	 * Compared with the previous SoCs, self-adaption current module
>  	 * is newly added for A1, keep the new power-on sequence to enable the
>  	 * PLL. The sequence is:
> -	 * 1. enable the pll, delay for 10us
> +	 * 1. enable the pll, delay for 20us
>  	 * 2. enable the pll self-adaption current module, delay for 40us
>  	 * 3. enable the lock detect module
>  	 */
>  	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
> -		udelay(10);
>  		meson_parm_write(clk->map, &pll->current_en, 1);
> -		udelay(40);
> +		udelay(20);
>  	}
>=20=20
> -	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
> -		meson_parm_write(clk->map, &pll->l_detect, 1);
> +	/* Take the pll out reset */
> +	if (MESON_PARM_APPLICABLE(&pll->rst))
> +		meson_parm_write(clk->map, &pll->rst, 0);
> +
> +	/* Wait for PLL loop stabilization */
> +	udelay(20);
> +
> +	/* Enable the lock-detect module */
> +	if (MESON_PARM_APPLICABLE(&pll->l_detect))
>  		meson_parm_write(clk->map, &pll->l_detect, 0);
> -	}
>=20=20
>  	if (meson_clk_pll_wait_lock(hw)) {
>  		/* disable PLL when PLL lock failed. */

--=20
Jerome

