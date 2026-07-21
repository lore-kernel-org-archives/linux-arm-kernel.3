Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AD5C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 22:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c477dkDn60xr5/vpHCybjFahEYi4w5V0EVtZg0tIWZ8=; b=bNuIMxVXFnfzTjqRAxORejTpST
	AbM9/mKdQBJ8spb98JVA2MrGHnrvwK9sUj8+qXhNr+H/bPZjC0MkSLtD5QYop/N3xfShwkRQ8hQHA
	V3eXXAPTws5rTZXpYQGhouPqN+Hf6r3iERhd8xaSnKh/nXiJ2E64Kla2wKDMoK+FIuWARzrzwQWrT
	2L11oZiPF7ptynoJhkva8WYpRhdlnejEzH1kgGce3xYH+NzrCfcYvb+dDltvFONnMQ6DqJther9uf
	2FyF1WuQhaVZGHSKhNFvcC6Tz+kcI4wg++jhniIUix46hPiNGCnAA6Mp7n4eKxin9b1sTzRoX2w2J
	AkHWYtiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIiq-0000000AV84-3rp8;
	Tue, 21 Jul 2026 22:13:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmIin-0000000AV7R-1FVr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 22:13:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784672030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c477dkDn60xr5/vpHCybjFahEYi4w5V0EVtZg0tIWZ8=;
	b=IASKWPkUfKGbmEcx9m9WqWhYiMkIMZEzBp0vJwF4l5up2BxeyR9LaIJvo8Z07MaU4Ze6lf
	jLzNeto7XDKVLjZvPHGXSDsX0xkwECFCfaRVlCHeQfjxahJsj/3MQP/2rf3Rp/CXBoFwqm
	dC5K6m42PPGeaNzG7v3KiUqdxZphr/Q=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-D90PlcKfOiCieCuLs-9Bvg-1; Tue, 21 Jul 2026 18:13:49 -0400
X-MC-Unique: D90PlcKfOiCieCuLs-9Bvg-1
X-Mimecast-MFC-AGG-ID: D90PlcKfOiCieCuLs-9Bvg_1784672028
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec3146553so457341585a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 15:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672028; x=1785276828;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c477dkDn60xr5/vpHCybjFahEYi4w5V0EVtZg0tIWZ8=;
        b=YR7gbVqbKs+PNrvnBeEhwoDzZHn3+ak66JOHrEcUp4Svqb4C951vTZ9I/wklWOc0iR
         yYwvIACyteH1jjrSxhG5poe2oNYMnXxJgSiDaPRsWUF3onogs8IpU6JOiwUNoRZfOI36
         Lj3YoSZHeIZ4+sTsArsORKrTVgSR672YtAeuRoUCbdjK+rqbUkuI9JdT5V3CpJu/adOv
         DI5N+sYL7qQPunplKxjW4xYM1H9Zdk4lFmGVbcWCH1N3clJmFqo00hRJtzgcbmRKfd/x
         jH9Rra2Z4qJmoeCHIj9YVM8JNBWC1aXaxSUCvh+Tklh6QhVzVWw4xs24qTepzl0xvZLa
         MTvw==
X-Forwarded-Encrypted: i=1; AHgh+RqAJ+RhX0EMUsIARwPhTBQCvtF6c1hTxStMsY5JlK2ArZd4z0QgKx4WiCWgHtOfpNGanAfTapwIAEPBEPMRQso+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs5nHDhchMWJmIkZQZB2pPTKgkiRqULRJ3zOncxAM1d9wY2VLe
	N2I9f+hPMZun1rdrpaCW0NDLtPjAlH+cvJQqH98E/tIDRPypg0JV1HfyghJaJjHo/2RJAT69UMH
	n1r+GWhvMVIA5fH1PICmoHS3JeykJ8z26NmCOdf14PB1v9HVhYLxewIQ96UAZoMCYm+HANUYMSW
	Ev
X-Gm-Gg: AR+sD13UWJXODUHLAsZ2baZGqWCq7yUEtASaPVZvB4wJHygrmg1tsBiyPWY5vaFn+42
	H9j4qsO7HFyotJGLjeFa9IPzMEMQDjgLWsU9Ps0ZJv28H5mtv9opiztb460zsBBjeAD4/gUlf2X
	4uZXbXdcX402+AOONb8m/VWOjaLgPSd58Vd37NrQP65JwaToEbF6SELVb7dzR7dvZf3/9C+iO9x
	jHbKKBWUzbxpegybpkn1NdPcs6Uo/0LZWOnVGW8xfacI5RpiLVxvfAvcKji34ZUkYrYXN3cRIjK
	3F2myEpE/p4biVpZs0sHEmWUIBsBwNWO9oAMH4WP/C4NvdITCASJ/lScyW/fsHJJ4rsjhMWjqZ1
	w8TbHKZJsEWopj5+wr9f3deUz2xbKQvN5jKk=
X-Received: by 2002:a05:620a:29c6:b0:92e:c117:9ead with SMTP id af79cd13be357-930b4396822mr2022260685a.91.1784672028330;
        Tue, 21 Jul 2026 15:13:48 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:92e:c117:9ead with SMTP id af79cd13be357-930b4396822mr2022256385a.91.1784672027775;
        Tue, 21 Jul 2026 15:13:47 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68d323asm3643085a.19.2026.07.21.15.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:13:47 -0700 (PDT)
Date: Tue, 21 Jul 2026 18:13:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <al_vGXIW2bP8uGJ5@redhat.com>
References: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
 <20260720051505.1252774-3-joakim.zhang@cixtech.com>
MIME-Version: 1.0
In-Reply-To: <20260720051505.1252774-3-joakim.zhang@cixtech.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1YdUWAKZ2jRlHVa8iIYYfqhzQVw2v3BqDgbhDG8mo0g_1784672028
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_151353_526169_7A384675 
X-CRM114-Status: GOOD (  32.00  )
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

Hi Joakim,

A few questions / issues mostly related to pm runtime usage.

On Mon, Jul 20, 2026 at 01:15:03PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps
> the CRU registers and registers mux, divider and gate clocks for
> DSP, SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.
> 
> Four SoC-level audio reference clocks are enabled as inputs to the
> internal clock tree. The driver releases the AUDSS NOC reset, enables
> runtime PM and instantiates the auxiliary reset device.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  drivers/clk/Kconfig              |    1 +
>  drivers/clk/Makefile             |    1 +
>  drivers/clk/cix/Kconfig          |   16 +
>  drivers/clk/cix/Makefile         |    3 +
>  drivers/clk/cix/clk-sky1-audss.c | 1211 ++++++++++++++++++++++++++++++
>  5 files changed, 1232 insertions(+)
>  create mode 100644 drivers/clk/cix/Kconfig
>  create mode 100644 drivers/clk/cix/Makefile
>  create mode 100644 drivers/clk/cix/clk-sky1-audss.c
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 1717ce75a907..cfcaab39068a 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -509,6 +509,7 @@ source "drivers/clk/actions/Kconfig"
>  source "drivers/clk/analogbits/Kconfig"
>  source "drivers/clk/aspeed/Kconfig"
>  source "drivers/clk/bcm/Kconfig"
> +source "drivers/clk/cix/Kconfig"
>  source "drivers/clk/eswin/Kconfig"
>  source "drivers/clk/hisilicon/Kconfig"
>  source "drivers/clk/imgtec/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index cc108a75a900..87c992f0df54 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -119,6 +119,7 @@ obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
>  obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
>  obj-y					+= bcm/
>  obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
> +obj-y					+= cix/
>  obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
>  obj-$(CONFIG_COMMON_CLK_ESWIN)		+= eswin/
>  obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
> diff --git a/drivers/clk/cix/Kconfig b/drivers/clk/cix/Kconfig
> new file mode 100644
> index 000000000000..c92a9a873893
> --- /dev/null
> +++ b/drivers/clk/cix/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Audio subsystem clock support for Cixtech SoC family
> +menu "Clock support for Cixtech audss"

s/audss/AUDSS/

Or how about spelling out Audio Subsystem Clock Driver

[snip]

> +static const struct clk_ops sky1_audss_clk_mux_ops = {
> +	.get_parent = sky1_audss_clk_mux_get_parent,
> +	.set_parent = sky1_audss_clk_mux_set_parent,
> +	.determine_rate = sky1_audss_clk_mux_determine_rate,

Does this need an enable/disable for the pm_runtime get/put?

> +};
> +
> +static inline struct sky1_clk_divider *to_sky1_clk_divider(struct clk_divider *div)
> +{
> +	return container_of(div, struct sky1_clk_divider, div);
> +}
> +
> +static unsigned long sky1_audss_clk_divider_recalc_rate(struct clk_hw *hw,
> +							unsigned long parent_rate)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +	struct sky1_clk_divider *sky1_div = to_sky1_clk_divider(divider);
> +	unsigned int val;
> +
> +	regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> +	val = val >> divider->shift;
> +	val &= clk_div_mask(divider->width);
> +
> +	return divider_recalc_rate(hw, parent_rate, val, divider->table,
> +				   divider->flags, divider->width);
> +}
> +
> +static int sky1_audss_clk_divider_determine_rate(struct clk_hw *hw,
> +						 struct clk_rate_request *req)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +	struct sky1_clk_divider *sky1_div = to_sky1_clk_divider(divider);
> +
> +	/* if read only, just return current value */
> +	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
> +		u32 val;
> +
> +		regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> +		val = val >> divider->shift;
> +		val &= clk_div_mask(divider->width);
> +
> +		return divider_ro_determine_rate(hw, req, divider->table,
> +						 divider->width,
> +						 divider->flags, val);
> +	}
> +
> +	return divider_determine_rate(hw, req, divider->table, divider->width,
> +				      divider->flags);
> +}
> +
> +static int sky1_audss_clk_divider_set_rate(struct clk_hw *hw,
> +					   unsigned long rate,
> +					   unsigned long parent_rate)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +	struct sky1_clk_divider *sky1_div = to_sky1_clk_divider(divider);
> +	int value;
> +	unsigned long flags = 0;
> +	u32 val;
> +
> +	value = divider_get_val(rate, parent_rate, divider->table,
> +				divider->width, divider->flags);
> +	if (value < 0)
> +		return value;
> +
> +	if (divider->lock)
> +		spin_lock_irqsave(divider->lock, flags);
> +	else
> +		__acquire(divider->lock);
> +
> +	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
> +		val = clk_div_mask(divider->width) << (divider->shift + 16);
> +	} else {
> +		regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> +		val &= ~(clk_div_mask(divider->width) << divider->shift);
> +	}
> +	val |= (u32)value << divider->shift;
> +	regmap_write(sky1_div->regmap, sky1_div->offset, val);
> +
> +	if (divider->lock)
> +		spin_unlock_irqrestore(divider->lock, flags);
> +	else
> +		__release(divider->lock);
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops sky1_audss_clk_divider_ops = {
> +	.recalc_rate = sky1_audss_clk_divider_recalc_rate,
> +	.determine_rate = sky1_audss_clk_divider_determine_rate,
> +	.set_rate = sky1_audss_clk_divider_set_rate,

Does this need an enable/disable for the pm_runtime get/put?

> +};
> +
> +static inline struct sky1_clk_gate *to_sky1_clk_gate(struct clk_gate *gate)
> +{
> +	return container_of(gate, struct sky1_clk_gate, gate);
> +}
> +
> +static void sky1_audss_clk_gate_endisable(struct clk_hw *hw, int enable)
> +{
> +	struct clk_gate *gate = to_clk_gate(hw);
> +	struct sky1_clk_gate *sky1_gate = to_sky1_clk_gate(gate);
> +	int set = gate->flags & CLK_GATE_SET_TO_DISABLE ? 1 : 0;
> +	unsigned long flags = 0;
> +	u32 reg;
> +
> +	set ^= enable;
> +
> +	if (gate->lock)
> +		spin_lock_irqsave(gate->lock, flags);
> +	else
> +		__acquire(gate->lock);
> +
> +	if (gate->flags & CLK_GATE_HIWORD_MASK) {
> +		reg = BIT(gate->bit_idx + 16);
> +		if (set)
> +			reg |= BIT(gate->bit_idx);
> +	} else {
> +		regmap_read(sky1_gate->regmap, sky1_gate->offset, &reg);
> +
> +		if (set)
> +			reg |= BIT(gate->bit_idx);
> +		else
> +			reg &= ~BIT(gate->bit_idx);
> +	}
> +
> +	regmap_write(sky1_gate->regmap, sky1_gate->offset, reg);
> +
> +	if (gate->lock)
> +		spin_unlock_irqrestore(gate->lock, flags);
> +	else
> +		__release(gate->lock);
> +}
> +
> +static int sky1_audss_clk_gate_enable(struct clk_hw *hw)
> +{
> +	sky1_audss_clk_gate_endisable(hw, 1);

pm_runtime_get ?

> +
> +	return 0;
> +}
> +
> +static void sky1_audss_clk_gate_disable(struct clk_hw *hw)
> +{
> +	sky1_audss_clk_gate_endisable(hw, 0);

pm_runtime_put ?

> +}
> +
> +static int sky1_audss_clk_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_gate *gate = to_clk_gate(hw);
> +	struct sky1_clk_gate *sky1_gate = to_sky1_clk_gate(gate);
> +	u32 reg;
> +
> +	regmap_read(sky1_gate->regmap, sky1_gate->offset, &reg);
> +
> +	/* if a set bit disables this clk, flip it before masking */
> +	if (gate->flags & CLK_GATE_SET_TO_DISABLE)
> +		reg ^= BIT(gate->bit_idx);
> +
> +	reg &= BIT(gate->bit_idx);
> +
> +	return !!reg;
> +}
> +
> +static const struct clk_ops sky1_audss_clk_gate_ops = {
> +	.enable = sky1_audss_clk_gate_enable,
> +	.disable = sky1_audss_clk_gate_disable,
> +	.is_enabled = sky1_audss_clk_gate_is_enabled,
> +};
> +
> +static struct clk_hw *sky1_audss_clk_register(struct device *dev,
> +					      const char *name,
> +					      const char * const *parent_names,
> +					      int num_parents,
> +					      struct regmap *regmap,
> +					      const u32 *mux_table,
> +					      struct muxdiv_cfg *mux_cfg,
> +					      struct muxdiv_cfg *div_cfg,
> +					      struct gate_cfg *gate_cfg,
> +					      unsigned long flags,
> +					      spinlock_t *lock)
> +{
> +	const struct clk_ops *sky1_gate_ops = NULL;
> +	const struct clk_ops *sky1_mux_ops = NULL;
> +	const struct clk_ops *sky1_div_ops = NULL;
> +	struct sky1_clk_divider *sky1_div = NULL;
> +	struct sky1_clk_gate *sky1_gate = NULL;
> +	struct sky1_clk_mux *sky1_mux = NULL;
> +	struct clk_hw *hw = ERR_PTR(-ENOMEM);
> +	struct clk_parent_data *parent_data;
> +	int i;
> +
> +	parent_data = devm_kcalloc(dev, num_parents, sizeof(*parent_data), GFP_KERNEL);
> +	if (!parent_data)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < num_parents; i++)
> +		parent_data[i].name = parent_names[i];
> +
> +	if (mux_cfg->offset >= 0) {
> +		sky1_mux = devm_kzalloc(dev, sizeof(*sky1_mux), GFP_KERNEL);
> +		if (!sky1_mux)
> +			return ERR_PTR(-ENOMEM);
> +
> +		sky1_mux->mux.reg = NULL;
> +		sky1_mux->mux.shift = mux_cfg->shift;
> +		sky1_mux->mux.mask = BIT(mux_cfg->width) - 1;
> +		sky1_mux->mux.flags = mux_cfg->flags;
> +		sky1_mux->mux.table = mux_table;
> +		sky1_mux->mux.lock = lock;
> +		sky1_mux_ops = &sky1_audss_clk_mux_ops;
> +		sky1_mux->regmap = regmap;
> +		sky1_mux->offset = mux_cfg->offset;
> +	}
> +
> +	if (div_cfg->offset >= 0) {
> +		sky1_div = devm_kzalloc(dev, sizeof(*sky1_div), GFP_KERNEL);
> +		if (!sky1_div)
> +			return ERR_PTR(-ENOMEM);
> +
> +		sky1_div->div.reg = NULL;
> +		sky1_div->div.shift = div_cfg->shift;
> +		sky1_div->div.width = div_cfg->width;
> +		sky1_div->div.flags = div_cfg->flags | CLK_DIVIDER_POWER_OF_TWO;
> +		sky1_div->div.lock = lock;
> +		sky1_div_ops = &sky1_audss_clk_divider_ops;
> +		sky1_div->regmap = regmap;
> +		sky1_div->offset = div_cfg->offset;
> +	}
> +
> +	if (gate_cfg->offset >= 0) {
> +		sky1_gate = devm_kzalloc(dev, sizeof(*sky1_gate), GFP_KERNEL);
> +		if (!sky1_gate)
> +			return ERR_PTR(-ENOMEM);
> +
> +		sky1_gate->gate.reg = NULL;
> +		sky1_gate->gate.bit_idx = gate_cfg->shift;
> +		sky1_gate->gate.flags = gate_cfg->flags;
> +		sky1_gate->gate.lock = lock;
> +		sky1_gate_ops = &sky1_audss_clk_gate_ops;
> +		sky1_gate->regmap = regmap;
> +		sky1_gate->offset = gate_cfg->offset;
> +	}
> +
> +	hw = devm_clk_hw_register_composite_pdata(dev, name, parent_data, num_parents,
> +						sky1_mux ? &sky1_mux->mux.hw : NULL, sky1_mux_ops,
> +						sky1_div ? &sky1_div->div.hw : NULL, sky1_div_ops,
> +						sky1_gate ? &sky1_gate->gate.hw : NULL, sky1_gate_ops,
> +						flags);
> +	if (IS_ERR(hw)) {
> +		dev_err(dev, "register %s clock failed with err = %ld\n",
> +			name, PTR_ERR(hw));
> +		return hw;
> +	}
> +
> +	return hw;
> +}
> +
> +static int sky1_audss_clks_get(struct sky1_audss_clks_priv *priv)
> +{
> +	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
> +	int i;
> +
> +	for (i = 0; i < devtype_data->clk_num; i++) {
> +		priv->clks[i] = devm_clk_get(priv->dev, devtype_data->clk_names[i]);
> +		if (IS_ERR(priv->clks[i]))
> +			return dev_err_probe(priv->dev, PTR_ERR(priv->clks[i]),
> +					     "failed to get clock %s", devtype_data->clk_names[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int sky1_audss_clks_enable(struct sky1_audss_clks_priv *priv)
> +{
> +	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
> +	int i, err;
> +
> +	for (i = 0; i < devtype_data->clk_num; i++) {
> +		err = clk_prepare_enable(priv->clks[i]);
> +		if (err) {
> +			dev_err(priv->dev, "failed to enable clock %s\n",
> +				devtype_data->clk_names[i]);
> +			goto err_clks;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_clks:
> +	while (--i >= 0)
> +		clk_disable_unprepare(priv->clks[i]);
> +
> +	return err;
> +}
> +
> +static void sky1_audss_clks_disable(struct sky1_audss_clks_priv *priv)
> +{
> +	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
> +	int i;
> +
> +	for (i = 0; i < devtype_data->clk_num; i++)
> +		clk_disable_unprepare(priv->clks[i]);
> +}
> +
> +static int sky1_audss_clks_set_rate(struct sky1_audss_clks_priv *priv)
> +{
> +	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
> +	int i, err;
> +
> +	for (i = 0; i < devtype_data->clk_num; i++) {
> +		err = clk_set_rate(priv->clks[i], devtype_data->clk_rate_default[i]);
> +		if (err) {
> +			dev_err(priv->dev, "failed to set clock rate %s\n",
> +				devtype_data->clk_names[i]);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void sky1_audss_clk_rpm_cleanup(void *data)
> +{
> +	struct device *dev = data;
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		pm_runtime_force_suspend(dev);
> +
> +	pm_runtime_disable(dev);

Take a look at pm_runtime_force_suspend() in
drivers/base/power/runtime.c. It already calls pm_runtime_disable(), so
if it's not suspended then there is a double disable here.

Brian


