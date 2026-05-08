Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73786CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 21:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIq9ZcUws2t7WWIjJD6g+oZhRW8RJPBQCH68MpVs7Xs=; b=tkg4BUfYO+txAjTPy2xnb97XdR
	5Sj9xC6STmpPsi8RbKBVq1oyEtdJ1j9q5f9UkMMkpplgd5j7KH4dsE9TjP6iwpTDE/MVY+sXj07tj
	nWInjGDu7ad4SpkPYHW+gcOeCTSUvS7+jSUETgHA2NpEgrbySuGA5eOJXILR71wAR2/eN3KDrUbaP
	V0xFjLtq1EcjcLvlU5Nu0vEgki8KB6yOW5MdsghkXou7+7igdzu060T3hxRVpkneLjs0Xw8CQBn6i
	7TRBQet0LFFmRW4P2a5FHZxMcVJsAvXlN7fEwtkCftrEmE4yLW2eI9ZROkbXlul8bgmtvKletAH/J
	Yq2w75Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSfh-00000007Xyc-0ute;
	Fri, 08 May 2026 21:23:45 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLSfd-00000007Xxb-3JxG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 21:23:43 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-bcb5370bb0dso145345866b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 14:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778275420; cv=none;
        d=google.com; s=arc-20240605;
        b=O164NbS2tdebjWnvTb3m56maYgX6moBn7ABBTtJT245vmQvXrHDlVHPDwlxhwEWJ50
         ef1QZzOvNsVK1gU1RuvHr6jMhs4ggeUD4JCDQG+3IG3wrM/M4Wuz9KhB00TqVOKOIlE8
         Upup3JyBiP6g6/VUoMUzUc2OhPD50dJu4B41Pv4pnhlaJ6AF15flJQG1Wgf0btuBMqwx
         fwVp2ue5jfamdejGlv7XQfjbD+IZoGvNxctmvNuzY5PcIyrXGaWCJPTLMY4BXRbx9Nxz
         /Io9RjRs6o/RUvEZd5Fy3t0ehbRNtsVvlBnY8cV7eq2U3qehhsQ+2S7ZTUpFdP1Llzb+
         RNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zIq9ZcUws2t7WWIjJD6g+oZhRW8RJPBQCH68MpVs7Xs=;
        fh=+PoiVUl+lNhLezeIY9Z6PI9jyhjm9qxMhoWbAkNcT1Y=;
        b=JmxmxalSDtETKk4zPoVrWsligOp8hdSaK983C79Vf84NTwKmS3/4CoD8PDNirszZtO
         41TpKFLPAjQQFGHPxk9lK3+9JZOeitbwUBHHstyJJtxA8ZHY4RaAa548tBpV7uSYwlvt
         CTRxdWmhDBuSTlAAV38hwVai3n3QSGVAb/HUCykGqA8FZjxOp3J78e/uFA5oPn8TUK+s
         Jb4j7PHfSyTdlcvE3LJXc9PRQtSjTgjI/MYjWus3nlVb2Gqo44MkM0DqleeG2cApJqha
         xrKCAtZMcEPTAD2qCvthlPAndGeDZiXhsSjg6cxWy7ZQPB7fcYBYhcelyA9/tU+ceV6U
         rBhg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778275420; x=1778880220; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zIq9ZcUws2t7WWIjJD6g+oZhRW8RJPBQCH68MpVs7Xs=;
        b=vwFhTHYFFg4Ls1AFxAz0Rpp19fEB7pVGse+q+HZI9VtALpezxf2EqzgDtnu1NbAtn2
         JXR5amDC5Nk5HfCsx+emsU2oMA0xrOLIjAfqD1QrKmtC9FDmtforUNMEpwiU60aoeab+
         uqPnoW1RWWpfHGsGhCUgXbxiQWnh7GN8TjJ0ONTPrLYv313EmZ+crWGPanDaEPlE5lA8
         qwA9qCMA9JcUl1U4t/LHafg3osRW2TjHrXGk8UYCJMq/81oQFTcDLmVSdxyvMQBoxheU
         W1kTRVj76lVSulyn6LjNdJLfWaroYDUrMFImmn+8CqDeREuTkMZ/4KGfufp90/4O5d/o
         0O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275420; x=1778880220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIq9ZcUws2t7WWIjJD6g+oZhRW8RJPBQCH68MpVs7Xs=;
        b=GYFngyASy7TdUjUidAMXNOXVyPww+PyuGNHeNIb5w607ekcU8jpgUWYHbQK9ngR9V7
         jUNvg+nSsBl28HEGQHnvKs5aRiApiE94QB1ERu6YVTOoojSfKTmGnLov3lEJRA9tLPyo
         luZiroakY1Ir/LzLXZGj6udd2GhsJ04lz7GFIQbz24JCX+bqdXaVkyPVjsgQDSZtiWR4
         DtcyUeBNugQ2t4sBIL3/XzpwaVRzEjg13ujifZFfONyy61TFddvdWLv8z4LpVrdDZXTX
         uREgFuan+gkxfOOiIWk4HdRVMxIWQ7B8CkRX1ZmzKO6GFYIEM8a7KdKpicfhziDYY3nB
         nUpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9i3ib4OTiDip6cmZ2FtHD43vMb8HDfjJCbA4mdK2ip4bmMp/YJaIe2RnYb3+7DJMj4KlSl3ubm5EjyAhE7Kn/C@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1s3dlma8iCnjEUo+nxjt9rkdwL1U+g3U28hasOPfp6j0rrras
	Urqq8y1nrPS0K0qtP4MbH/xY3TTLaNPFJGXnTtKmCqGXMNEIT519zOUhfBtY/MFkd+01zNA6pU1
	AiUNSCRSC9Xp9umlYRXvbBOKG/4eXhoSja2bzhgDl/Q==
X-Gm-Gg: Acq92OHN0nK0cpVpIQMfTO/ubRGsvk0iHF1jS6AEUylH386IO1PIWLX7QI4XhSgFtr6
	PmAmPnePOFQ/lVNUbkPyOzFj5+i2e7C6Fjlv8Ah9iDuh312FqsBNdzfUS5pexU9qQU0Y2OlcBfQ
	UfYQikeH6pE7oRoTCY2LOEl5R1fZfIPP76v/qDWqG4+nV5v7DENtvoahEekN6sJM8QtAsecB5C1
	QXf5A1M2JqUd4j/M8e8lwncw/34R2g0guU80KXnqXwjNSxO614KqdB0S0YaRbuhYN0Jev450nsn
	pEaOWMydf0drg1yeHqBl5FUy3P7KdcNxt8JGI7u3SA==
X-Received: by 2002:a17:907:c06:b0:ba9:2611:31e6 with SMTP id
 a640c23a62f3a-bc56be3f762mr934940566b.6.1778275419723; Fri, 08 May 2026
 14:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org> <20260506-acpm-tmu-helpers-v1-3-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-3-a9cd5daf8355@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 22:23:27 +0100
X-Gm-Features: AVHnY4LLKqUnG42bw1kGuZ5A8Ore_i8f_07LxVicEeYBN4fNYRTwN4DHlu-DLSI
Message-ID: <CADrjBPqzKpcd9vuCmNUptCUPyPpPbHcc19-7kN-1c0RpW1e5DQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] firmware: samsung: acpm: Drop redundant _ops suffix
 in acpm_ops members
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	jyescas@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_142341_918890_EA4B757A 
X-CRM114-Status: GOOD (  21.68  )
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

On Wed, 6 May 2026 at 12:39, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> Rename the `dvfs_ops` and `pmic_ops` members of `struct acpm_ops` to
> `dvfs` and `pmic` respectively.
>
> Since these members are housed within the `acpm_ops` structure and
> utilize the `acpm_*_ops` types, the `_ops` suffix on the variable names
> creates unnecessary redundancy (e.g., `handle.ops.dvfs_ops`).
>
> This cleanup removes the stuttering, leading to cleaner consumer code.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-acpm.c                        | 8 ++++----
>  drivers/firmware/samsung/exynos-acpm.c                | 4 ++--
>  drivers/mfd/sec-acpm.c                                | 6 +++---
>  include/linux/firmware/samsung/exynos-acpm-protocol.h | 4 ++--
>  4 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
> index d8944160793a..93667777094c 100644
> --- a/drivers/clk/samsung/clk-acpm.c
> +++ b/drivers/clk/samsung/clk-acpm.c
> @@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
>  {
>         struct acpm_clk *clk = to_acpm_clk(hw);
>
> -       return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
> -                                       clk->mbox_chan_id, clk->id);
> +       return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
> +                                             clk->id);
>  }
>
>  static int acpm_clk_determine_rate(struct clk_hw *hw,
> @@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  {
>         struct acpm_clk *clk = to_acpm_clk(hw);
>
> -       return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
> -                                       clk->mbox_chan_id, clk->id, rate);
> +       return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
> +                                             clk->id, rate);
>  }
>
>  static const struct clk_ops acpm_clk_ops = {
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index fac88c427d2a..da960d3e1145 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -676,8 +676,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
>   */
>  static void acpm_setup_ops(struct acpm_info *acpm)
>  {
> -       struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs_ops;
> -       struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic_ops;
> +       struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
> +       struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
>
>         dvfs_ops->set_rate = acpm_dvfs_set_rate;
>         dvfs_ops->get_rate = acpm_dvfs_get_rate;
> diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
> index 0e23b9d9f7ee..9e15b260b8df 100644
> --- a/drivers/mfd/sec-acpm.c
> +++ b/drivers/mfd/sec-acpm.c
> @@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
>         size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
>         const u8 *d = data;
>         const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
> @@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
>         const u8 *r = reg_buf;
>         u8 reg;
>
> @@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
>  {
>         struct sec_pmic_acpm_bus_context *ctx = context;
>         struct acpm_handle *acpm = ctx->shared->acpm;
> -       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
> +       const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
>
>         return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
>                                     ctx->shared->speedy_channel, val, mask);
> diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> index d4db2796a6fb..b206efa62be6 100644
> --- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
> +++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
> @@ -36,8 +36,8 @@ struct acpm_pmic_ops {
>  };
>
>  struct acpm_ops {
> -       struct acpm_dvfs_ops dvfs_ops;
> -       struct acpm_pmic_ops pmic_ops;
> +       struct acpm_dvfs_ops dvfs;
> +       struct acpm_pmic_ops pmic;
>  };
>
>  /**
>
> --
> 2.54.0.545.g6539524ca2-goog
>

