Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E51D3ABF4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 09:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXTq3iDyjDADwZsgIQdjk8BZPcjCgD8fVY/36P+IKEw=; b=OTExRVlKMoxEBCLVFvVloFyyFm
	m8K+9wzt+dK/MDxPDZ9rTyZjBKyJSpiSEek0uEaMCC4XhU4LqF32wZKInsb0aDxl10TMwqW49hXd4
	qdtUrhlgTd9NdYV2wnwpL0Pneu1X9ASzb7N5J0RnxXyztx2+uIZTgdLyGi4gD7/Dvv2bNwAg5MkBN
	hMgiQ2jYrqvRy6Fy1cS3BTU1grGMD9rPAXJfsoNpprMaV3kTECATmhP+ZV+3nDXUfwFb7neexZOHT
	6UCnVA/IjA375MXyCewEoptC5N/rmazxgyVlkKy3xz9d2WsC+STg1BbAfBFN1HZXs5iKpTnhaAm3m
	VLZNXbaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRogs-0000000Amca-23S1;
	Sat, 06 Dec 2025 09:34:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRogo-0000000Amc5-0oXJ;
	Sat, 06 Dec 2025 09:34:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0BE2434A6;
	Sat,  6 Dec 2025 09:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3542CC4CEF5;
	Sat,  6 Dec 2025 09:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765013676;
	bh=LVpVlpi6OB57YEEuOdpQyyiZg0u6TcCf1CGA1h9vpBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bx700QVJbLTGUIeKm0O22TtLPhUtMrkFcl7fdbcJZVOwdiqeLbjF5hrQeiOdJCXdC
	 krutnylAbtSh9mi3fVU7U3Zf94ROz3cOezsxTnOp72rIOV1wxreOzIlSI3LBBeD3LU
	 PO4RKzI66ic6zAclhP+WlgH+vrzyXwxUkL21B+JxTy1WI87F8DejeP0TQie8riE1A1
	 G16crdFM3HpnnxUV/C4lSxpuDXimp0B9gJ+5vmkqIsU2HJGuob8KsyEnqSiWRlzeyZ
	 OdncME6viW0HhYT7EVURDb4SvohUqn4RP4h0A9yO8gWT3ZsGeoDPZNjQ2cBW8dTAYb
	 TYbJ2kwZIcq4g==
From: William Breathitt Gray <wbg@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Lee Jones <lee@kernel.org>,
	kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	linux-rockchip@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH v3 4/5] counter: Add rockchip-pwm-capture driver
Date: Sat,  6 Dec 2025 18:34:17 +0900
Message-ID: <20251206093419.40067-1-wbg@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251027-rk3576-pwm-v3-4-654a5cb1e3f8@collabora.com>
References: <20251027-rk3576-pwm-v3-4-654a5cb1e3f8@collabora.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5608; i=wbg@kernel.org; h=from:subject; bh=LVpVlpi6OB57YEEuOdpQyyiZg0u6TcCf1CGA1h9vpBg=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDJnGPyYceT6/uuOowkeJzKMXdru+8oyTXW/9KnZb0Npb5 7YnyTsHdJSyMIhxMciKKbL0mp+9++CSqsaPF/O3wcxhZQIZwsDFKQATKctj+B/fezxbrcnBZa22 wAYGEZnP65yLGeM210wtSArdtY9jiTYjwy/3uODLKTURuz+fPbGii+Pa+yd/Tl7sa/pnEH5pndn eClYA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_013454_305617_0F82141E 
X-CRM114-Status: GOOD (  26.15  )
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

> +struct rockchip_pwm_capture {
> +	struct rockchip_mfpwm_func *pwmf;
> +	struct counter_device *counter;

Is this structure member used at all? If not, you should just remove it.

> +	bool is_enabled;

Does this device offer some way to probe whether PWM capture mode is
enabled? I suspect so, because I see PWM_ENABLE.pwm_en enables the
channel and PWM_CTRL.pwm_mode selects capture mode, so perhaps we're
able to read the current state of those registers. If you're able to
read those registers to determine the enable state, I'd suggest wrapping
that into a helper function and calling it when you need to determine
whether the capture mode is currently enabled.

If we're not able to probe the enable state, is it safe to assume we're
in a disabled state when the module loads, or should we ensure it by
unconditionally disabling PWM capture mode during
rockchip_pwm_capture_probe()?

> +	spinlock_t enable_lock;
> +};
> +
> +/*
> + * Channel 0 receives a state changed notification whenever the LPC interrupt
> + * fires.
> + *
> + * Channel 1 receives a state changed notification whenever the HPC interrupt
> + * fires.
> + */
> +static struct counter_signal rkpwmc_signals[] = {
> +	{
> +		.id = 0,
> +		.name = "Channel 0"
> +	},
> +	{
> +		.id = 1,
> +		.name = "Channel 1"
> +	},
> +};

From "31.3.1 Capture Mode" of the Rockchip RK3506 Technical Reference
Manual[^1], it looks like "clk_pwm" is the only signal that is counted
for PWM_HPC AND PWM_LPC. So instead of two Signals, you would have just
one Signal named "PWM Clock" which sources your two Synapses defined below.

Technically, "pwm_in" is also a signal evaluated (its polarity is used
to determine whether we're counting for PWM_HPC or PWM_LPC) but the
respective Synapse would be COUNTER_SYNAPSE_ACTION_NONE because this
signal not actually triggering the change in the count value. You're
welcome to add the "pwm_in" signal here if you like, but I'd say it's
optional if you actually want to expose it here.

> +static const enum counter_synapse_action rkpwmc_hpc_lpc_actions[] = {
> +	COUNTER_SYNAPSE_ACTION_BOTH_EDGES,
> +
> +};

Add COUNTER_SYNAPSE_ACTION_NONE to this array. When the polarity is
high, the Synapse for PWM_HPC will be active with
COUNTER_SYNAPSE_ACTION_BOTH_EDGES, while the Synapse for PWM_LPC will be
inactive with COUNTER_SYNAPSE_ACTION_NONE; the inverse occurs when the
polarity switches to low.

> +static struct counter_synapse rkpwmc_pwm_synapses[] = {
> +	{
> +		.actions_list = rkpwmc_hpc_lpc_actions,
> +		.num_actions = ARRAY_SIZE(rkpwmc_hpc_lpc_actions),
> +		.signal = &rkpwmc_signals[0]
> +	},
> +	{
> +		.actions_list = rkpwmc_hpc_lpc_actions,
> +		.num_actions = ARRAY_SIZE(rkpwmc_hpc_lpc_actions),
> +		.signal = &rkpwmc_signals[1]
> +	},
> +};

Both Synapses are sourced by the same single Signal ("PWM Clock") so set
both "signal" members to &rkpwmc_signals[0].

> +enum rkpwmc_count_id {
> +	COUNT_LPC = 0,
> +	COUNT_HPC = 1,
> +};
> +
> +static struct counter_count rkpwmc_counts[] = {
> +	{
> +		.id = COUNT_LPC,
> +		.name = "PWM core clock cycles during which the signal was low",
> +		.functions_list = rkpwmc_functions,
> +		.num_functions = ARRAY_SIZE(rkpwmc_functions),
> +		.synapses = rkpwmc_pwm_synapses,
> +		.num_synapses = ARRAY_SIZE(rkpwmc_pwm_synapses),
> +		.ext = rkpwmc_ext,
> +		.num_ext = ARRAY_SIZE(rkpwmc_ext),
> +	},
> +	{
> +		.id = COUNT_HPC,
> +		.name = "PWM core clock cycles during which the signal was high",
> +		.functions_list = rkpwmc_functions,
> +		.num_functions = ARRAY_SIZE(rkpwmc_functions),
> +		.synapses = rkpwmc_pwm_synapses,
> +		.num_synapses = ARRAY_SIZE(rkpwmc_pwm_synapses),
> +		.ext = rkpwmc_ext,
> +		.num_ext = ARRAY_SIZE(rkpwmc_ext),
> +	},
> +};

Count names should be short and descriptive. I think the RK3506 manual
section "31.4.2 Registers Summary" description for the PWM_HPC and
PWM_LPC register do a pretty good job of that:

* Low Polarity Capture
* High Polarity Capture

How about changing the two Count names to those respectively?

> +static int rkpwmc_count_read(struct counter_device *counter,
> +			     struct counter_count *count, u64 *value)
> +{
> +	struct rockchip_pwm_capture *pc = counter_priv(counter);
> +
> +	guard(spinlock)(&pc->enable_lock);
> +
> +	if (!pc->is_enabled) {
> +		*value = 0;
> +		return 0;
> +	}

I don't think there's a need to check whether capture mode is disabled.
The user should be aware of the enable state of the Count by checking
the respective "enable" attribute; and if they ignore that, a value of
"0" doesn't inherently tell them that the Count is disabled which makes
it moot to do so. I'd suggest just removing this check entirely and
returning the register values unconditionally.

> +
> +	switch (count->id) {
> +	case COUNT_LPC:
> +		*value = mfpwm_reg_read(pc->pwmf->base, PWMV4_REG_LPC);
> +		return 0;
> +	case COUNT_HPC:
> +		*value = mfpwm_reg_read(pc->pwmf->base, PWMV4_REG_HPC);
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct counter_ops rkpwmc_ops = {
> +	.count_read = rkpwmc_count_read,
> +};

You should implement a signal_read() callback if its possible to probe
the current state of PWM Clock. You should implement action_read() if
its possible to probe the current polarity of "pwm_in" in order to set
which Synapse is currently active.

William Breathitt Gray

[^1] https://opensource.rock-chips.com/images/3/36/Rockchip_RK3506_TRM_Part_1_V1.2-20250811.pdf

