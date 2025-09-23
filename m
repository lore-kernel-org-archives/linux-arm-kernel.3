Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA24CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tUpBb6qulXCWAadHVOQRFgdDFu6TKGouRDpRCguBiA=; b=N0nfwKpWqAVeRRCBND4fUFG9yR
	LMNBeFq4dxiL/Vkr5I2KLj2CsNpK4eEVM7NhNm+z7X4/DUdLgkr5q7Bh1GK9fHnrzmnqj/uAPKD8P
	EF8V6s8ifW1mEwpW09s+OaFEy4ZA1xvEDxmG83VSV0mE5QSdhdPg4a0cuWxuHJXkuJRL/fD/4Y6nZ
	cMo0VM8ndKQEsyeDRJqU+K8pAP7VdMNYwJLHT/fJnugBsNJXc/h6q+7G1NH9mZVx3xVX+H0BIQKpo
	Nf5YV5Jystd/RkdFSHLewKkVwO/Iav0kQni7JBUZ3UVIXzsZs7RfTQ9c+VJ7FLQh7hNjyBH4RofCH
	ocw7fg7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13wr-0000000DjgO-2Ysj;
	Tue, 23 Sep 2025 14:24:53 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v13wo-0000000Djdi-3f8D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:24:52 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-ea5c8833b15so4491325276.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 07:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758637489; x=1759242289; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1tUpBb6qulXCWAadHVOQRFgdDFu6TKGouRDpRCguBiA=;
        b=xVgdYjsbclkfagEiwOJrpITOAWaTjkoV4Dfqi2ofR0XoikOAS/cDm6WIXiiUXKW6IA
         EGoJXW99dzkW5i9CqosJqg8hj6L9zswb4U9lKZ+AFjVCrODjoyzTdjnjpgK8HEApYOdd
         U4qQ0yjm2XV6hXMuAKSNt4f5i/MOvBQM0hyXcMPEdTlg6lspb8vmF5aNfTUL2pseYgtl
         qUfY8Sg9XzyB2xKazF/quG8F/Qm7AsN9ncSjLYFOerYfHUfbGx4PNBAHwtBH3XemDblQ
         Vpts8dy8sksQK5ufwJ3XHOY3AE7IV3FBoZseAUemF0aCz6phTXUnExu+gQQqRAXwaVe1
         iSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637489; x=1759242289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tUpBb6qulXCWAadHVOQRFgdDFu6TKGouRDpRCguBiA=;
        b=rJFm1n+Xx+QBDBcEzVP9r3ES+1QrO2eucLioOBxgLjXrxAvRHNTgIpwviop2EdHltf
         eGyiVndp8jtvf5+lxBI3gmUq6U2Zkus1A2mC3FxUMidfSmiz5Oi/NFgrJf+rhjRqTD1p
         P3lNQ/BS27mN/BUNCKWbv4sUqtsPuAhVPB2URxxgrh3esSh0qO5HKER6xmft//Xi92B/
         7siOZ3EkHiQqvA94j/WdrrQLG9rsRXVxJNnbOr6x4+WNswneUSkOWAtBKUa0n/TbXs8B
         zx0wilYrbKG0V+HWwGXSbNr+6Q395+GY72GF7PSmRHLCLgiJ1fecmzVQfIXLuzP/ao97
         Q28g==
X-Forwarded-Encrypted: i=1; AJvYcCXXHft0I6Uah1JK+FhIpreY50IUzImsVFEC6wONnTnBiOGO4lIoxwYAwfmqsG+PJjseEQipPOlfshC2kJbVGiiO@lists.infradead.org
X-Gm-Message-State: AOJu0YxpiAt5pwkZQOAiJH4B1r+W8QCaAA9Ik+36yCf7WwjrmAoaaJCb
	4vPpuRR5Ukh4YAHyEZaJTveIzdrCCcsYFvgpgwZuLJdLxmE4dY0f9t/Vuiujlroo+0fh82hJ/hJ
	uYuoBENXJH1Lj//H1zj+ha/IMmHahlb03nyREtkvqgQ==
X-Gm-Gg: ASbGnctL+s9+fuXxr4JYktdQuuXz08cHCERPXv53dStKTplxlXkH1j7K1BvR1cnAv7r
	iQqIHMSpMqSGkcpl26pF+UQ8JFAqYTyxgg4RggEhjHwIf9xwWYOg7I1sNs3BmlCWCfDFyJL5ujK
	ZV6kXXE5JSUjx9EaVViyTDscoFGXo8DhHS4pfqTIH/O9C5u1MixUnY1o2b1TCie3LPnsDrQO7tj
	/x9i8hJyT4sO4LaSHs=
X-Google-Smtp-Source: AGHT+IF1FCtcjMSOAGh57xMvLkahzg1nEGPiVoAht6L/S8rmvuZxjp7LQD0zrTATTe5JO0aUrJTq9dOrEPI1k3shK8c=
X-Received: by 2002:a05:690c:5511:20b0:720:5fbc:20c2 with SMTP id
 00721157ae682-758a5393f77mr18808297b3.36.1758637489554; Tue, 23 Sep 2025
 07:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com> <20250923-mt8196-gpufreq-v4-8-6cd63ade73d6@collabora.com>
In-Reply-To: <20250923-mt8196-gpufreq-v4-8-6cd63ade73d6@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 23 Sep 2025 16:24:13 +0200
X-Gm-Features: AS18NWC-sVzrTkGqH5gpcO5QSqPC0ul4k36msuT8kehXNT5ngXXnGDzn6xEf6ew
Message-ID: <CAPDyKFpLNJRRxWPm2Eye+Fs8go-LNwWGzPUPPKmNVJkyK5N3Dw@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] pmdomain: mediatek: Add support for MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_072451_080465_2E96F0D6 
X-CRM114-Status: GOOD (  27.22  )
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

On Tue, 23 Sept 2025 at 13:41, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Various MediaTek SoCs use GPU integration silicon named "MFlexGraphics"
> by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
> integration silicon is required to power on the GPU.
>
> This glue silicon is in the form of an embedded microcontroller running
> special-purpose firmware, which autonomously adjusts clocks and
> regulators.
>
> Implement a driver, modelled as a pmdomain driver with a
> set_performance_state operation, to support these SoCs.
>
> The driver also exposes the actual achieved clock rate, as read back
> from the MCU, as common clock framework clocks, by acting as a clock
> provider as well.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/pmdomain/mediatek/Kconfig            |  16 +
>  drivers/pmdomain/mediatek/Makefile           |   1 +
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 928 +++++++++++++++++++++++++++
>  3 files changed, 945 insertions(+)

[...]

> +
> +static int mtk_mfg_set_performance(struct generic_pm_domain *pd,
> +                                  unsigned int state)
> +{
> +       struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
> +
> +       /*
> +        * Occasionally, we're asked to set OPPs when we're off. This will fail,
> +        * so don't do it at all. We do foo != GENPD_STATE_ON instead of !foo
> +        * as to not depend on the actual value of the enum.
> +        */
> +       if (mfg->pd.status != GENPD_STATE_ON)
> +               return 0;

Returning 0 here, means that we may end up never restoring the
performance state for a device and its genpd, when the device is
getting runtime resumed. In genpd_runtime_resume() we are calling
genpd_restore_performance_state() before calling genpd_power_on().
This is deliberate, see commit ae8ac19655e0.

That said, I think we need to manage the restore in the ->power_on()
callback. In principle, it means we should call
mtk_mfg_set_oppidx(mfg, genpd->performance_state) from there.

> +
> +       return mtk_mfg_set_oppidx(mfg, state);
> +}
> +
> +static int mtk_mfg_power_on(struct generic_pm_domain *pd)
> +{
> +       struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
> +       int ret;
> +
> +       ret = regulator_bulk_enable(mfg->variant->num_regulators,
> +                                   mfg->gpu_regs);
> +       if (ret)
> +               return ret;
> +
> +       ret = clk_prepare_enable(mfg->clk_eb);
> +       if (ret)
> +               goto err_disable_regulators;
> +
> +       ret = clk_bulk_prepare_enable(mfg->variant->num_clks, mfg->gpu_clks);
> +       if (ret)
> +               goto err_disable_eb_clk;
> +
> +       ret = mtk_mfg_eb_on(mfg);
> +       if (ret)
> +               goto err_disable_clks;
> +
> +       ret = mtk_mfg_power_control(mfg, true);
> +       if (ret)
> +               goto err_eb_off;
> +
> +       return 0;
> +
> +err_eb_off:
> +       mtk_mfg_eb_off(mfg);
> +err_disable_clks:
> +       clk_bulk_disable_unprepare(mfg->variant->num_clks, mfg->gpu_clks);
> +err_disable_eb_clk:
> +       clk_disable_unprepare(mfg->clk_eb);
> +err_disable_regulators:
> +       regulator_bulk_disable(mfg->variant->num_regulators, mfg->gpu_regs);
> +
> +       return ret;
> +}

[...]

Note, I intend to have a bit closer look at this soon, but I just
observed the issue I pointed out above from my first quick look.

Kind regards
Uffe

