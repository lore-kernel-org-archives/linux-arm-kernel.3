Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A20CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 20:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiH0Y5jC8eOxkFxYpW9x/bKQZLcnNc1eDIAfCTxCBuQ=; b=f2N8SI+p9/iKgFlQJSB1pGDRe2
	Yf2AhP5FfZRR5cQ0hwpTuxmTVZqnSOFe6eKBRF7xeQ/y+UhEPBgpEhXigZmILCMzGNgyuAOJ3mnfi
	nqWOxUm4u4NfL9IdEnTlJcXOf03i//UxgeSX3ha+vo69hDYu36InNpyytdKygv8p419KWWjU4hao5
	SWzyP2Si46XJeGwhEXH2oGF1EBS1cuIpjvZeGl3rvx+Hzf9okrguM+X2Brdr/5b6hWfCkeBhoidv1
	NE3wB6xd6bSXnnlbzgxiOOWmC2Pl2l9hAmxkqR6OpW/7uQFnDA/O2V3tOxMIL7vF3WO6ukUd43jay
	3sKH+JPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0R3z-00000008BbB-1b9A;
	Sun, 21 Sep 2025 20:53:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0R3x-00000008Bal-2Yv2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 20:53:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE2B9601D8;
	Sun, 21 Sep 2025 20:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760B0C4CEE7;
	Sun, 21 Sep 2025 20:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758488016;
	bh=J1ZFtX4yvxKI22ZawNgw40HCJY1KhiYNmPZ1GeiDW/4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jRVDTveEzhJOLghwziVd7Tm+Ldcwbt82QotkmsuvKUdp7Jvz0BAws0jDBUZPKU4MQ
	 9LPG5u+RcZlEGes07BgeCvTInni3yuLi8L+vdb98PcOveEDuFM4GOhbSCF/5Txz1tv
	 ynPSOzP3Y2YCsjFLb9LzX+sRoh/2B9FlNIXlZzyyhITerup96M96/68ZxQH6icvrDm
	 do5NyYEbZgOaals9q5hWcbSOvpBtBwzNa8nfe3qzBpiWY07A7/oH8p+pJSSeJvsDfc
	 Zhw9MO976iGvHj1G1evMMoAWGQ10aV5k7hIWzSloGDQovXY0rq7mv3UuJEl0pD258F
	 U4mIQSUgWETeA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915-clk-ssc-version1-v4-2-5a2cee2f0351@nxp.com>
References: <20250915-clk-ssc-version1-v4-0-5a2cee2f0351@nxp.com> <20250915-clk-ssc-version1-v4-2-5a2cee2f0351@nxp.com>
Subject: Re: [PATCH v4 2/5] clk: Introduce clk_hw_set_spread_spectrum
From: Stephen Boyd <sboyd@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
To: Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
Date: Sun, 21 Sep 2025 13:53:34 -0700
Message-ID: <175848801471.4354.13819701022920596111@lazor>
User-Agent: alot/0.11
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

Quoting Peng Fan (2025-09-15 01:29:36)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b821b2cdb155331c85fafbd2fac8ab3703a08e4d..06db8918a1b35e3280e565272=
bc4603a88295a92 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2802,6 +2802,32 @@ int clk_set_max_rate(struct clk *clk, unsigned lon=
g rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> =20
> +int clk_hw_set_spread_spectrum(struct clk_hw *hw, struct clk_spread_spec=
trum *conf)
> +{
> +       struct clk_core *core;
> +       int ret;
> +
> +       if (!hw)
> +               return 0;
> +
> +       core =3D hw->core;
> +
> +       clk_prepare_lock();
> +
> +       ret =3D clk_pm_runtime_get(core);
> +       if (ret)
> +               goto fail;
> +
> +       if (core->ops->set_spread_spectrum)
> +               ret =3D core->ops->set_spread_spectrum(hw, conf);
> +
> +       clk_pm_runtime_put(core);
> +
> +fail:
> +       clk_prepare_unlock();
> +       return ret;
> +}

Does it need to be exported?=20

> +
>  /**
>   * clk_get_parent - return the parent of a clk
>   * @clk: the clk whose parent gets returned
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 630705a47129453c241f1b1755f2c2f2a7ed8f77..4f48a4df95a1c54638a0e91e0=
a449fcc8aa40b80 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -84,6 +84,19 @@ struct clk_duty {
>         unsigned int den;
>  };
> =20
> +/**
> + * struct clk_spread_spectrum - Structure encoding spread spectrum of a =
clock
> + *
> + * @modfreq_hz:                Modulation frequency
> + * @spread_bp:         Modulation percent in permyriad
> + * @method:            Modulation method
> + */
> +struct clk_spread_spectrum {
> +       u32 modfreq_hz;
> +       u32 spread_bp;
> +       u32 method;

What are the possible values of 'method'? I'm guessing it's the defines
in the dt-bindings header? Please connect these two somehow, maybe
through an enum. Also, why are these u32? Shouldn't these be more common
types like unsigned long or unsigned long long instead being exactly 32
bits?

> +};
> +
>  /**
>   * struct clk_ops -  Callback operations for hardware clocks; these are =
to
>   * be provided by the clock implementation, and will be called by drivers
> @@ -178,6 +191,12 @@ struct clk_duty {
>   *             separately via calls to .set_parent and .set_rate.
>   *             Returns 0 on success, -EERROR otherwise.
>   *
> + * @set_spread_spectrum: Optional callback used to configure the spread
> + *             spectrum modulation frequency, percentage, and method
> + *             to reduce EMI by spreading the clock frequency over a
> + *             wider range.
> + *             Returns 0 on success, -EERROR otherwise.
> + *
>   * @recalc_accuracy: Recalculate the accuracy of this clock. The clock a=
ccuracy
>   *             is expressed in ppb (parts per billion). The parent accur=
acy is
>   *             an input parameter.
> @@ -255,6 +274,8 @@ struct clk_ops {
>         int             (*set_rate_and_parent)(struct clk_hw *hw,
>                                     unsigned long rate,
>                                     unsigned long parent_rate, u8 index);
> +       int             (*set_spread_spectrum)(struct clk_hw *hw,
> +                                              struct clk_spread_spectrum=
 *clk_ss);

const clk_ss pointer? And is it actually 'conf' or 'ss_conf'?

>         unsigned long   (*recalc_accuracy)(struct clk_hw *hw,
>                                            unsigned long parent_accuracy);
>         int             (*get_phase)(struct clk_hw *hw);
> @@ -1430,6 +1451,7 @@ void clk_hw_get_rate_range(struct clk_hw *hw, unsig=
ned long *min_rate,
>                            unsigned long *max_rate);
>  void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
>                            unsigned long max_rate);
> +int clk_hw_set_spread_spectrum(struct clk_hw *hw, struct clk_spread_spec=
trum *conf);

const conf? And 'ss_conf' again?

