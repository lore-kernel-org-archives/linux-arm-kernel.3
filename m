Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E87CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gsO0Mv1FrcyGXkqaqLTVsEMXbut/odQDvF8E5ZP8zg=; b=2VCzfJ9cts2LnBA2EeEvJvQlFF
	6v21sPLHYElDgfxv2h0Bn04uf4ORICsrU1E1anZRCdQ2saqT/8/vK36w5hq+f5Y7Iv0qmiPJUF+Xd
	TxClNg4/V1bf6sp4YHgGZ26D0kyY+3zBE3azzTk/Mr6peiQmKElJsl65LlooJIlvXfQNEb9hJBVaL
	Wu43NeVxKVuTu67S2B7bzNSqVUCP3Oaqu50VTTd5Id+ULbFutA+fLUb4m0774QxJBgLwCYpA2ND1A
	9YylP7H+todhw0v4QE/z3ykJdQiC8+N7ZxeXinlvQaA8X6kWKgIAhcHGSu4E4WwZWGmheFP0u5Ku6
	vQM21tGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBO8-0000000Gx30-3MM8;
	Tue, 21 Oct 2025 12:22:52 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBO6-0000000Gx2d-35rg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:22:52 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-7814273415aso59889057b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761049370; x=1761654170; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0gsO0Mv1FrcyGXkqaqLTVsEMXbut/odQDvF8E5ZP8zg=;
        b=sT2B1MV1GY6lmxDObx7VXKiuSbUWD2GItjAtX9d+YW0Ajz7NGXWG51Ne4xbllsz11W
         Hog1anm6akG383zF3fXfDsePyzXl+FUmWCYAX7ptkWx+p2zVQ3tg+HQMrgNU7toxnahR
         wkZdXjgvgEEBHg9yUhDWR1Kw0+L1L3LW+6LFQ9OVvjJf7kYlq0cmMcx0Y+pJCCRpmyaW
         /S9VmaV5ub/ysmhC/e0ZzuawWgh827BNk90PwR0mWOzzSPxIYu79Yq64Rz4glGwOTU5e
         CjWuPqc87K5b8r2mvwabXJeYIUndtEZOb4PfMLC1g89D/bgLSCWJ+z6t5d2aN+iXv16L
         PM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049370; x=1761654170;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gsO0Mv1FrcyGXkqaqLTVsEMXbut/odQDvF8E5ZP8zg=;
        b=bGe6UJr/86l3NuBI21Zdz3xIBFg7wCOH6ZyERLgp8PDHUbWT/zOEGCO6jz2GKRVNgD
         psAG+v0lD7Jw5ixQVoowvtkAOYu1t+zXJiAexKTf10v4JAFqOqBuJo23DQkZ5RgpgE2L
         /3Fh24ChktImoK6Dr8yzvg/ohmR83lA+8KVpiNbPjNVtWPOljeG7TpGU6szU6CSDDfkd
         cX1dCe6e3vWbMBHTmPjcv+NbZINAHMnHIydXvJgwDfkATOHCBW7u75K0YG964Y3w1Plp
         ZQq//mAed14vR8HWQ2BebVIkP25Q43SVMPhrZ6tCJATof4xP4PesGaazgLM/W3sUrth3
         slMg==
X-Forwarded-Encrypted: i=1; AJvYcCX4V1j82ubCrvk6K6byAVmfnVYvrKTgkIHEZHrSCalje4d17ZLB7pOvnL3eWLUknA1mxoH2ewVX9oPvqvH4Vof3@lists.infradead.org
X-Gm-Message-State: AOJu0YwjZj4jYf7QzT7/oDM6yP783iVOuUZqwTg3VcefOiCGSJbK9TNK
	iPdY+F2nLKQsMv9Z4WsesECCbo6Alch09stHfyH0knl/BN7uxUv373fw3TbzQTQFkS1TDPlebk7
	m237DXbJU813A0oojvC8YpkzSNHxyui5xhVHCNNE50w==
X-Gm-Gg: ASbGncvFbg84Yec78GWRlmPmt/mJCtuYu1BpFX7JamzzczXDpdVjGDuvsClzGg8Ve4H
	ratQ0pO93DOfhw6FXb14PwhYQSaPL4Hpt2FZqhy2Og41cKU4LwAAEr8Vme3LrLkYOIW+vheciMa
	AKjC+r0fhwAYH1gAj6dw/1fkMDf8cKBnskyciKrvMdt+MpVoTFlmLYcnq+Ao17Zd9zwRNeipApk
	voeotlntQcn0NrsBuw+hVSLG08LziEXOLEQhbB4uD1vQi9ppqBSMWUhKQrKhiy7ZRqWaFsz
X-Google-Smtp-Source: AGHT+IEjsTRnovw4ePg20FTB4OUKNJwNiI+HcgpJ0npXrx4jgsZXBfmlUSYcGf7LNK6sqZ0vKa1Fghky5U1mlT7+5do=
X-Received: by 2002:a53:acd5:0:20b0:63e:102f:e00e with SMTP id
 956f58d0204a3-63e1625aee1mr12332024d50.53.1761049369570; Tue, 21 Oct 2025
 05:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-uart-daisy-chain-pmdomain-v2-1-6d0215f4af32@ti.com>
In-Reply-To: <20250910-uart-daisy-chain-pmdomain-v2-1-6d0215f4af32@ti.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Oct 2025 14:22:13 +0200
X-Gm-Features: AS18NWBw6aYnNOt7sX3hV723CfvlVkoslKqfPhuE6iOIYmHabXQ8nFw-lI3bkVE
Message-ID: <CAPDyKFrOjFeZDOs84egaCAmRwtnXcj5bZLniOb1gkDkDH0214g@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: ti_sci: Handle wakeup constraint if device
 has pinctrl wakeup state
To: Kendall Willis <k-willis@ti.com>, khilman@baylibre.com
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, d-gole@ti.com, 
	vishalm@ti.com, sebin.francis@ti.com, msp@baylibre.com, a-kaur@ti.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_052250_818612_1D0100E4 
X-CRM114-Status: GOOD (  31.39  )
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

On Wed, 10 Sept 2025 at 23:16, Kendall Willis <k-willis@ti.com> wrote:
>
> For TI K3 SoCs with IO daisy-chaining using pinctrl wakeup state, avoid
> sending wakeup constraints to the PM co-processor. This allows the SoC to
> enter deeper low power states while still maintaining wakeup capability
> for peripherals using IO daisy-chain wakeup via pinctrl wakeup state,
> similar to the existing wake IRQ mechanism added in commit b06bc47279919
> ("pmdomain: ti_sci: handle wake IRQs for IO daisy chain wakeups").
>
> Detect the pinctrl wakeup state in the suspend path, and if it exists,
> skip sending the constraint.
>
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
> Implementation
> --------------
> This patch is intended to be implemented along with the following
> series. This patch has no dependencies on any of the other series:
>
> 1. "pmdomain: ti_sci: Handle wakeup constraint if device has pinctrl
>    wakeup state": (this patch) skips setting constraints for wakeup
>    sources that use pinctrl state 'wakeup'.
>
> 2. "serial: 8250: omap: Add wakeup support": Implements wakeup from
>    the UARTs for TI K3 SoCs
>    https://github.com/kwillis01/linux/tree/b4/uart-daisy-chain-8250-omap
>
> 3. "arm64: dts: ti: k3-am62: Support Main UART wakeup": Implements the
>    functionality to wakeup the system from the Main UART
>    https://github.com/kwillis01/linux/tree/b4/uart-daisy-chain-dts
>
> Testing
> -------
> Tested on a AM62P SK EVM board with all series and dependencies
> implemented. Suspend/resume verified with the Main UART wakeup source
> by entering a keypress on the console.
>
> This github branch has all the necessary patches to test the series
> using linux-next:
> https://github.com/kwillis01/linux/tree/uart-daisy-chain
>
> Version History
> ---------------
> Changes from v1 to v2:
>  - Reworded commit message to be concise and to reference commit
>    b06bc47279919
>
> v1: https://lore.kernel.org/all/20250904211607.3725897-1-k-willis@ti.com/
> ---
>  drivers/pmdomain/ti/ti_sci_pm_domains.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> index 82df7e44250bb64f9c4a2108b5e97bd782a5976d..884905fd0686c1b94aba68c03da038e577428adf 100644
> --- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
> +++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> @@ -10,6 +10,7 @@
>  #include <linux/err.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_qos.h>
> @@ -84,9 +85,24 @@ static inline void ti_sci_pd_set_wkup_constraint(struct device *dev)
>         struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
>         struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
>         const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
> +       struct pinctrl *pinctrl = devm_pinctrl_get(dev);
> +       struct pinctrl_state *pinctrl_state_wakeup;
>         int ret;
>
>         if (device_may_wakeup(dev)) {
> +               /*
> +                * If device can wakeup using pinctrl wakeup state,
> +                * we do not want to set a constraint
> +                */
> +               if (!IS_ERR_OR_NULL(pinctrl)) {
> +                       pinctrl_state_wakeup = pinctrl_lookup_state(pinctrl, "wakeup");
> +                       if (!IS_ERR_OR_NULL(pinctrl_state_wakeup)) {
> +                               dev_dbg(dev, "%s: has wake pinctrl wakeup state, not setting " \
> +                                               "constraints\n", __func__);
> +                               return;
> +                       }
> +               }

Relying on the above condition and the wakeirq check that was added in
b06bc47279919, seems fragile and doesn't really seem like the best
approach to me.

I would rather think that we should rely on the driver for the
consumer device to successfully have completed its parts, by enabling
the out-band system-wakeup IRQ. In other words, make the consumer
driver to call device_set_out_band_wakeup() and then use
device_out_band_wakeup() instead of the pinctrl+wakeirq check above,
to understand if QoS constraints shall be sent to the FW or not.

> +
>                 /*
>                  * If device can wakeup using IO daisy chain wakeups,
>                  * we do not want to set a constraint.
>
> ---
> base-commit: 5f540c4aade9f1d58fb7b9490b4b7d5214ec9746
> change-id: 20250910-uart-daisy-chain-pmdomain-b83b2db2c3cc
>
> Best regards,
> --
> Kendall Willis <k-willis@ti.com>
>

Kind regards
Uffe

