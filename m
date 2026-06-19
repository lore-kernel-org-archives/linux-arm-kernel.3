Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B26ECD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4qbPpfXKjwWf+Dt6pjhae0Fsogba7Qsk/94yaXvhXg=; b=Wc5l55h/1bB8/Dliqeywzfr/Pu
	+rbP1mattVwI7nvLnjn6z0BsvkwcyJOT7/o97UOx0xbZto9pypz+P3owkaAaz76MmjBDK8t+/qriH
	BzVHaY9vWDVj2aDtMiYC2M3dZIzvegVy+5aaL4cT6V3WS/pf3/3JjdzCh5T6gG3wD+t/Ps1grrTzT
	1bvwKzz8XxiHNAigXhl9JKdGC1Alq5iWJlXusNA2njRHFxCx1XswczX9ZbsSYUPw3v70r3flzoEXZ
	smpUEoPaEbEqnYpftKRgY8QNBmIAbYq/EKLjOxtmskTRfG3ZWvgXXUQRtxWUHSvDXd9UBtqCp5pql
	Mgz0JX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTpy-000000027K5-2Y7l;
	Fri, 19 Jun 2026 07:40:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTpr-000000027Ib-2dT0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:40:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so21703305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781854818; x=1782459618; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4qbPpfXKjwWf+Dt6pjhae0Fsogba7Qsk/94yaXvhXg=;
        b=g7+hK+DVpMabaZwo/NnHqq7PfeuMfpOhkcZ4M+Yqvswg3Mu/dHWmX3nDImd9+FkCLY
         /TdEdOsMb5od59fhzMypg2GvOLKNAjNQ5rlb9kSopd3U+vgzjK9y714vqgavM/dbvYpO
         SKrlz6gD6t07ABsjHsk5c8HkqRrKzqIx72RTo5/z72Bp3OKIoyYoGQ4jyCgnoGBvj0a9
         vE4clcFLMf7A5zKETmm56QsCOmtPa0JpTT2jbXl+jW4wiEfHXnkQw4/DLCY4u/ht76Y3
         sJMYG2NbvwkQbZpFmq8AXEL3gnUgKXl9E6a7vr+XakC3fzqER3Nggjtdv7AaRPEPHWjc
         L0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854818; x=1782459618;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q4qbPpfXKjwWf+Dt6pjhae0Fsogba7Qsk/94yaXvhXg=;
        b=BlH5OuwUIpf95y37nki2Dcl8WMSzQMVFy3sd5dnspTqKFXD2fhTM80yauzASH2JcKn
         2nfJqG8yeaDGStZaot1w/qQ9+K3US54Jhe2IN9wJ/gMfnk+2onEKT5PU+IT5DeriWz7C
         w5BFfyGJp7xjZbVIQS4+0eLZIQTmoFegPkDzh/0zT8+rvRmKvrPQn26WluqrNbTD12L0
         8NKTawSt4hE1/IJTu6l2WHGmPjDki1/qoSPHB+V3a2zBDudta8nRovCmmw7THEbboo/o
         8ocKD+Gl1ppcOrWu/L3oYkovKL4R67vorj/uHzDcStLjNQPjSSFXQKLGAYXhu5NkZ0IW
         V92w==
X-Forwarded-Encrypted: i=1; AFNElJ9pga+R9itCkpbWnT285pJ2jrk6ls4JNJ7Q98DAqTm5RUf6VT14VS0xv+zSMd8qAj5VsKj0hJ+6dPD2pA77YZHo@lists.infradead.org
X-Gm-Message-State: AOJu0YzViI/1HnFxUKUQBmy7XBA/hlxjYgbSBD1FoYjCRdJ0ZRsPIka+
	1k1dPGmsElKwsyWpyNSS1m30i04FhFruql4PMgMlPwIJ1cnjbIiOpf8JOe53DTtci/4=
X-Gm-Gg: AfdE7cm5gP047RqHf4fwYy/2N+JoQ49qtVB86oDCd0A/6n9axYf8M3MZIAgHa+XaR05
	0QIYu2OPzH80TPx+sVwBsQquS++eKrU25Ip0J0URe1OBp7g3wSBMhOQuRtSkGBsaxiNkpcUtTPq
	zfA4yCQhvzkKXPqaTkm4ZC3SWJF+6r7bPtSNsldMiWH6UQWOcn5V63OpheST94tSZg6OvS9jCj9
	+Uc89SYfRBzu+bfUEm4O0JI7WJ6kOE/r4mfLtxiibfoTnJN7Wl8xG4iz9i2nVTPK/pDD+WLdYtx
	LaprL1g7KSl6Nf6QTYx/Ki63UqeuUC8EHQcW1KPJhIcnCGLcUDEy3VbtjS4U9rILaw7HWySBJFG
	iHjxTRfEx84gCkqN7uUCgk0itT+QkJRq9LlEP0rMGdL3FzELoesHP1H94sYUnoj6I39m0eM11k2
	ID2T3KOx8XpfcMKBveelU6tA==
X-Received: by 2002:a05:600d:4448:20b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-49240a09f71mr22313395e9.6.1781854817768;
        Fri, 19 Jun 2026 00:40:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:95ed:eac1:5731:4e21])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4650bc422c0sm5324812f8f.26.2026.06.19.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:40:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  Conor Dooley
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] clk: amlogic: Add A9 AO clock controller
In-Reply-To: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com> (Jian Hu via's
	message of "Thu, 18 Jun 2026 17:49:10 +0800")
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Jun 2026 09:40:15 +0200
Message-ID: <1jwlvvasgw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_004019_687323_5A85F5EC 
X-CRM114-Status: GOOD (  14.63  )
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

On jeu. 18 juin 2026 at 17:49, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> This series adds Amlogic A9 AO clock support, including dt-binding and AO clock driver.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

A part from the 2 minor problems found by sashiko, This looks good.

> ---
> Changes in v4:
> - Drop CLK_IS_CRITICAL for ao_xtal_in clock.
> - Drop CLK_HW_INIT* and revert to explicit clock declarations.
> - Link to v3: https://lore.kernel.org/r/20260610-a9_aoclk-v3-0-b7592d6c31e2@amlogic.com
>
> Changes in v3:
> - Move COMPILE_TEST after 'depends on ARM64' reported by sashiko-bot.
> - Rename i2c3 to i3c reported by sashiko-bot.
> - Reword the comment describing ao_xtal_in's flags.
> - Use struct clk_init_data to describe ao_xtal_in's hw.init.
> - Link to v2: https://lore.kernel.org/r/20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com
>
> Changes in v2:
> - Split the A9 clock driver and send the AO clock separately.
> - Rename aobus to soc.
> - Use CLK_HW_INIT_FW_NAME to describe clk_init_data.
> - Use CLK_HW_INIT_PARENTS_DATA to describe clk_init_data.
> - Use a9_ao prefix for MESON_COMP_SEL.
> - Correct duandiv name.
> - Fix pwm b reg.
> - Link to v1: https://lore.kernel.org/all/20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com/
>
> ---
> Jian Hu (2):
>       dt-bindings: clock: Add Amlogic A9 AO clock controller
>       clk: amlogic: Add A9 AO clock controller driver
>
>  .../bindings/clock/amlogic,a9-aoclkc.yaml          |  76 ++++
>  drivers/clk/meson/Kconfig                          |  13 +
>  drivers/clk/meson/Makefile                         |   1 +
>  drivers/clk/meson/a9-aoclk.c                       | 488 +++++++++++++++++++++
>  include/dt-bindings/clock/amlogic,a9-aoclkc.h      |  76 ++++
>  5 files changed, 654 insertions(+)
> ---
> base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
> change-id: 20260603-a9_aoclk-bbf531badc63
>
> Best regards,

-- 
Jerome

