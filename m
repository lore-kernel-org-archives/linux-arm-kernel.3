Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D64E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ah+1J5fysuvs0h4L27yS8NPBtXSkLtzi6zVw7H+0pPc=; b=WqSRPfVzlGboEvXD49oATnd83/
	aOLcPrFf6skVRcwX+8+zUQbQtPC2s+zMTf50pjbALOkM8ER9SVLh/lxrVLSF+UgILNE0OrORAd9a8
	BlyMDhQZJsvlmQ3sa2epkRHOYWvimDLYku1DL0htjwi3GSo+X4vh7/dd/lvcRGtNn+2kzX1s8NRj/
	fYrLofiZzd6fMzgHNG4hRW7gEavaUEdM5zSwWRwj7ErP8a3Ux651adWQs8gsxqt1oKcVAMNnX/YcL
	JzN4hnJURetvi9JaaBdkZTyjuPwHGrwze3WDVtrXVobYMf2htd6zUCZtpPHdrMR+Y6u+Z1sE+b/9d
	IfYfDJiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBkr-00000003dQN-3850;
	Mon, 29 Dec 2025 11:49:41 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBkp-00000003dPx-3sp5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 11:49:41 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-598eaafa587so10187896e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 03:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767008978; x=1767613778; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ah+1J5fysuvs0h4L27yS8NPBtXSkLtzi6zVw7H+0pPc=;
        b=jM1QVukL84OdLkcD42v9DgyeShQYdiUFlWqetYCx0wtmrNOTxfMAe0P4oeGWhz0sgx
         pgGU+3WwHadVGnheFhOfyJdlMLvClUItg5XOwi8NqxWtpOcEKtnzJ4nIDkAMLbh77QI4
         d0MCFXUbjoUOEVdHn7gt+WAkN9suKYYfHqHaggED1z9PUGU/GQWG2wwLET2s1+0DmMJs
         8zMwhs81U6gFnlMLu1FE0zmzOKROmepOWsHQLDV36O7K8vBdeZQHSeldxmDBGHrwTuPm
         qFNhp/s4uZQJ8V4fuT5pZp3maxqS7oR+vz+RNub3w2IBZEyOu1Xnqvh/fwQV0xD2yZ8I
         fSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767008978; x=1767613778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ah+1J5fysuvs0h4L27yS8NPBtXSkLtzi6zVw7H+0pPc=;
        b=Fp8gktXiDJUQ80vQmOwoGTfmrXwY+eEPns4PQQuaVVQUlDuE+XJT5rlZNEdCXWhpDn
         xgRhDy/G4zJb8/jptgKb7iF2wgT4t6ABaLdVRnbSKpVGgwzNUqB1HgTC6OP6yEqBpnxd
         NQ0v3hRzq86XXRsvKHVjtodhfCXkJInVwhX+RMdebMbWM1qLhi8C4tau2TzHac0INDzJ
         8a1r8kaZw1z8xeRQLEEwjAFB8EJQ01yEQeelnB9gffQC7VzE5nU7558BR3jXrrcUednW
         P6IkWF9DWrqdtldDFzxuMp/uAhUB0qNh10nbyBmtWZF6tnYFIBiy1ufZnl/CN4RaEr3Z
         WY5w==
X-Forwarded-Encrypted: i=1; AJvYcCW2YrP4srWKKmUzjDiQ0nM1qwZZWqApIYfSRVZBTfrJLOLwQJXmk1typQNevTyrEWOpWcmFuEF6vy0ZLjgqVxXO@lists.infradead.org
X-Gm-Message-State: AOJu0YzGnobK0W/jxmy5C1zb52KwLz4spaIRt+/Og0zbvJDwTB4jXecL
	9byv6c5qNgZPD2GS6P4DHMvDi9LJwp6AZfSPuWOYIOcVNYclaWlLP7NJVMc3pneu6hXPcCH4rrS
	Wa5NBIMmTEph7dMql2LPqjRd1eRqgctj6IIBQPPFItQ==
X-Gm-Gg: AY/fxX5wqsy4zjSuRhk1L0pRtA2b0HpJ8cLSpsxvHmGC2aNrp5yz+vVJmkPUyUdgKKc
	B+xhw4ByQPEUsu2nz0dUEXjGAoraGNBiBJXnPd3APF3w6vqKlPyavEsMp3Asjev0atV1hqWSF0i
	P265QtBn7WnIu4VT8t3Ynfud6WsUW2SbCYmWkRg8tHpHn8gZ40+JkPBt7Y1yC8OFANgoL8OtkD0
	Q8VisT5rnswJQNfQ9K7k/5Y+Y0KPxJAmjc8eJcDTBlJJwlaNhBObknGAMbrr2gFGofe3IOJ
X-Google-Smtp-Source: AGHT+IFd7uULZsU6HqhtyBuw4OeaEHVzFMIlWbNNIkG6PE0mDPVdhJ8EzFPp7O0VhFMojnvcMZr8G9gMv1f1D/mxiUw=
X-Received: by 2002:a05:6512:23a7:b0:59a:107a:45a9 with SMTP id
 2adb3069b0e04-59a17df40a5mr10605277e87.52.1767008977494; Mon, 29 Dec 2025
 03:49:37 -0800 (PST)
MIME-Version: 1.0
References: <20251213084843.7491-1-balejk@matfyz.cz> <20251213084843.7491-2-balejk@matfyz.cz>
In-Reply-To: <20251213084843.7491-2-balejk@matfyz.cz>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Dec 2025 12:49:01 +0100
X-Gm-Features: AQt7F2qxwPUA9qoW_RwC445aI_amGPo8zYmXnkjw9vaaoTtrHO_3M12iwbGDMxg
Message-ID: <CAPDyKFrX45baw9ezWebF=sNHpaNtJYfvdTkghZYRWi2RfdGN_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pmdomain: add audio power island for Marvell
 PXA1908 SoC
To: Karel Balej <balejk@matfyz.cz>
Cc: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_034940_022415_01C39341 
X-CRM114-Status: GOOD (  24.28  )
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

On Sat, 13 Dec 2025 at 09:49, Karel Balej <balejk@matfyz.cz> wrote:
>
> Define power domain which needs to be enabled in order for audio to work
> on the PXA1908-based samsung,coreprimevelte smartphone. In the
> downstream code, this power-on method is marked as specific to the ULCx
> series which is allegedly a codename of sorts with ULC1 corresponding to
> the PXA1908.
>
> No other audio components needed for sound to work on this phone are
> currently available mainline but some successful testing was performed
> with the vendor variants of the respective drivers and with the domain
> forced always-on.
>
> Signed-off-by: Karel Balej <balejk@matfyz.cz>

Both patches applied for next, thanks!

Kind regards
Uffe


> ---
>
> Notes:
>     v2:
>     - APMU_AUD_CLK -> APMU_AUDIO_CLK and group it with other register
>       definitions. (Duje)
>     - Move default function exit path inside the switch. (Duje)
>     - Modify the commit message with information provided by Duje (thanks!).
>
>  .../marvell/pxa1908-power-controller.c        | 39 +++++++++++++++++--
>  1 file changed, 35 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/marvell/pxa1908-power-controller.c b/drivers/pmdomain/marvell/pxa1908-power-controller.c
> index ff5e6e82d3f8..543e8d33ac0c 100644
> --- a/drivers/pmdomain/marvell/pxa1908-power-controller.c
> +++ b/drivers/pmdomain/marvell/pxa1908-power-controller.c
> @@ -24,12 +24,15 @@
>  #define APMU_DEBUG             0x88
>  #define DSI_PHY_DVM_MASK       BIT(31)
>
> +#define APMU_AUDIO_CLK         0x80
> +#define AUDIO_ULCX_ENABLE      0x0d
> +
>  #define POWER_ON_LATENCY_US    300
>  #define POWER_OFF_LATENCY_US   20
>  #define POWER_POLL_TIMEOUT_US  (25 * USEC_PER_MSEC)
>  #define POWER_POLL_SLEEP_US    6
>
> -#define NR_DOMAINS     5
> +#define NR_DOMAINS     6
>
>  #define to_pxa1908_pd(_genpd) container_of(_genpd, struct pxa1908_pd, genpd)
>
> @@ -59,9 +62,14 @@ static inline bool pxa1908_pd_is_on(struct pxa1908_pd *pd)
>  {
>         struct pxa1908_pd_ctrl *ctrl = pd->ctrl;
>
> -       return pd->data.id != PXA1908_POWER_DOMAIN_DSI
> -               ? regmap_test_bits(ctrl->base, APMU_PWR_STATUS_REG, pd->data.pwr_state)
> -               : regmap_test_bits(ctrl->base, APMU_DEBUG, DSI_PHY_DVM_MASK);
> +       switch (pd->data.id) {
> +       case PXA1908_POWER_DOMAIN_AUDIO:
> +               return regmap_test_bits(ctrl->base, APMU_AUDIO_CLK, AUDIO_ULCX_ENABLE);
> +       case PXA1908_POWER_DOMAIN_DSI:
> +               return regmap_test_bits(ctrl->base, APMU_DEBUG, DSI_PHY_DVM_MASK);
> +       default:
> +               return regmap_test_bits(ctrl->base, APMU_PWR_STATUS_REG, pd->data.pwr_state);
> +       }
>  }
>
>  static int pxa1908_pd_power_on(struct generic_pm_domain *genpd)
> @@ -123,6 +131,22 @@ static inline int pxa1908_dsi_power_off(struct generic_pm_domain *genpd)
>         return regmap_clear_bits(ctrl->base, APMU_DEBUG, DSI_PHY_DVM_MASK);
>  }
>
> +static inline int pxa1908_audio_power_on(struct generic_pm_domain *genpd)
> +{
> +       struct pxa1908_pd *pd = to_pxa1908_pd(genpd);
> +       struct pxa1908_pd_ctrl *ctrl = pd->ctrl;
> +
> +       return regmap_set_bits(ctrl->base, APMU_AUDIO_CLK, AUDIO_ULCX_ENABLE);
> +}
> +
> +static inline int pxa1908_audio_power_off(struct generic_pm_domain *genpd)
> +{
> +       struct pxa1908_pd *pd = to_pxa1908_pd(genpd);
> +       struct pxa1908_pd_ctrl *ctrl = pd->ctrl;
> +
> +       return regmap_clear_bits(ctrl->base, APMU_AUDIO_CLK, AUDIO_ULCX_ENABLE);
> +}
> +
>  #define DOMAIN(_id, _name, ctrl, mode, state) \
>         [_id] = { \
>                 .data = { \
> @@ -159,6 +183,13 @@ static struct pxa1908_pd domains[NR_DOMAINS] = {
>                         .keep_on = true,
>                 },
>         },
> +       [PXA1908_POWER_DOMAIN_AUDIO] = {
> +               .genpd = {
> +                       .name = "audio",
> +                       .power_on = pxa1908_audio_power_on,
> +                       .power_off = pxa1908_audio_power_off,
> +               },
> +       },
>  };
>
>  static void pxa1908_pd_remove(struct auxiliary_device *auxdev)
> --
> 2.51.2
>

