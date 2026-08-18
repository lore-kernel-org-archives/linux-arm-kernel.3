Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528ABC5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 12:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrJlFSriS8B2b9nn703o+fJtCUBgBFvDtgFvMr5LkkY=; b=KjNL+kn0yETWUvLh5VsqQ5U3dI
	mEZoCNp2UTqzi1OgWah6hRHlsMF6PVYCtX0+sNjoZWxIcJdzxeoY1Vc4OzJ6NTTlHTfiwl3zxsRlW
	J3jvqWxDo3FR1DHDx31KdZXtFiPd2E6EtBKhDkeVWT/1I/wYz/K69PmeR5/+7Im+2ts3LiauLOAm6
	cNOrxdDZer7FPVe++n5U33PicFKH2auL/4F8q5kgPh6dqWvegxBwgoepnJLm+6kDiVC2eUJTzVS3F
	t8/YpdhJulUrp79IJGEoJTSzThN5i0iurDWb5euuHIXXXz2gGb0AVZhhENqPsNU+ut6R2wHzq1uKK
	fhYlSpvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJKD-00000007yzq-2rve;
	Tue, 18 Aug 2026 12:53:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJKB-00000007yyh-25Gd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 12:53:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-499840a2575so34677525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 05:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787057629; x=1787662429; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xrJlFSriS8B2b9nn703o+fJtCUBgBFvDtgFvMr5LkkY=;
        b=RMXo1s0OTQPvxus/+JFlPYeot2MGf6MJ9TE9Nc1vbhdd7+euPEqsi9zjnH2ejgFAKB
         WvGAnqmf6Hzi8iAXnwsb3Us5GpFsUztCfzB5GXmYDs04Hp5NdyFmqoWPviXgKaGDptRE
         GIAUPKTJTfwZOZwDd2X/SLKbDWVGnBpJYTB9jycRtPuTJDOpgZGw/ynty5PpWm+ngtXd
         DAJydqXo5vQ8B5V99iSAM0GhNLG56anVcYg/vI912GUqbc2UveFpEcg23cErdVbfqTBB
         DEeW5aKahfcYjUdQiuYkTjJ6/rq8AHKzfn53FzAKqEUU1y0FBn7F3lZ1zc3ZU5KVp9ac
         p1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787057629; x=1787662429;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrJlFSriS8B2b9nn703o+fJtCUBgBFvDtgFvMr5LkkY=;
        b=k2m3F3wFJpuB5dnHPpzLbpNs9sccYwTkv8Po2a4oDXNqy8SgnCorscfcYelIo/UPna
         H0y8aBfqmFIqO/rKpdRItg+ASJRICwBmdFXmEwoy7KQMcVAUXGHGNB7PKoQqRuxPhp4b
         D/2/LYm2Gv6+OzvzQM95u3LdGUM4JmiC0fzSTvmgI9s8afQNP06pzGC2GI3KXtSkoq/7
         zxjZlNg9FGcGVs6+MTRoSCJpZyh37I2KqBLmNbh9nrprPP3BGjp6PSqTa1iU2MsGebtM
         qzoFIxCWkURT0vXnUe9a195Nji+4+2rDojYKRI+EzfMmE/xBxzN/wEJw9/sgzjEJkDZZ
         wRXA==
X-Forwarded-Encrypted: i=1; AHgh+RrntYlHl2PhG6rA7F+3K4MgkACEIeTTZSfZQ4nHOffSKJlCQ6yCXGQeAqbOm+VX8lFjOjNlvjWo7pa9v+3yzU8m@lists.infradead.org
X-Gm-Message-State: AOJu0YwlIVk+LW9RqM+AaJpvAvQXssJBWtOsGmOxsMZGqIZ7YhLwB9Eb
	jA1pqC2qatGwMHvDz24rAuRGfWAm3j+XfN23bV1SxyadxQpMBT9mnICx3RTrn9AEqCKNpfQQTz7
	9GXJFDf6S9A==
X-Gm-Gg: AR+sD13RqYKMnGDG7QDDSdo1XBFH4Z+t9LW3gF9fBgNWlSRHYYOhnAd7WT0o8zjKvvX
	JbOFccby1/tZ8h9RvluFoGO1rjgjmj6jMTme8oERAXBcMdfnHVBdXPFABAy0D2rC3tL2Lr2URif
	k7O93rxhAzt/ddaJe4lIG0As84BK7DSOVWxFxGMyLcIIiXCJJMoot7VzSoY5DkOQbm21yUFDi10
	OJ/ROJgfLBBnQUvnXbzvdFPwDWSr2fd/a2Ca1kwLL7wfzsZcne/YN5u+3LklzKwV8LNSmzpYuqr
	VvpH9JcOLv6mnN+DfeJS/mu1BmFHz4gJ5g+jm1o1aTytwxqi4aKHx309KO7oEn0iBNEq5HxFhjr
	h59gqG/+1niVF41FEbrxlC02IK7IgiyuDm5Tp73UOIPNXMZmU5m6z5+HVRGn3NoYlOElX2aU9vG
	YcFcR9r5mc2lFymt0DLQ/m3WkTwPeqNgb9dUfi3/ST8bMQKuVurd8Jc5d+m7qFl4zc9FpC1AOCs
	e5UUOvdDwqcRRXRaPsPU+c=
X-Received: by 2002:a05:600c:4fcb:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-49987928d0cmr559638885e9.3.1787057628879;
        Tue, 18 Aug 2026 05:53:48 -0700 (PDT)
Received: from [192.168.5.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49996183b89sm299651425e9.12.2026.08.18.05.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 05:53:47 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/2] pwm: meson: Add support for Amlogic S7
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20260521-s6-s7-pwm-v3-2-57b073fbafef@amlogic.com>
References: <20260521-s6-s7-pwm-v3-0-57b073fbafef@amlogic.com>
 <20260521-s6-s7-pwm-v3-2-57b073fbafef@amlogic.com>
Date: Tue, 18 Aug 2026 14:53:50 +0200
Message-Id: <178705763029.1733024.16040030322013834677.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5071; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=EL3KK8jlLJGv/DFviAz1KFPEh1vXG+ZrypDU0NDk9Lg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqhFXiSMDykhwqFRJyduNIxl6nWCcthhpZK54QI
 uixLX9cm7CJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaoRV4gAKCRArRkmdfjHU
 RU6KD/929yysdZ0oy7pCYZQi5pEUo3qc1BezyULQNpqFYVX3DhBL2qRZwSH0duBSBHX6wcYgycX
 l99l9rgeS4epETHlQL/RupF7OQUg4EBRSwqK9OlmGCoeH1riPQn/a26u9eM1ASZv52rXAlnwuhE
 FVkGD1WwaHId+1+m981ZQt4CW1Lhpm7cuZBWa5MFz9CyJDPPFI8enNNgXAkKLMCg/wB1G+SE8fb
 HBNtU1bgs/4eYvrWZXR582cxanrPghjFrKwwW679F7SX5RcoOMyNNH9Joud9V/CGozSYZachWqo
 z7TiauCCUl3QKSWeRifkmXWzlzOub2rG3LWpFk5RrFsPaPOjBO+xzTla0cklgz+dBKl8grJIbzV
 lGhVYlrqrxWBdP4fVlpH7/oNOraWK1gSa9ZqEa5vtaV4n/XNb9m2wHbwsRCb7JKhW3jmHlAlZZq
 c5iNwGJrhfDM9X/oFTaff3iUBGK1Qp00l0BEPF/USBmP8xjLTQWAnXYeUpmifG5ZYyWmmyHdH0G
 01ulg6mfGWildgEWaIOIZ3qpwWFoGzR03uLn467Towkf8KgcIoWSCpMBf9TN96P4imyabxrbEWl
 5DfBXWJ2vu5Z0CPr3HF26gwp2tebeItZSU/x+CONYLwB5GO58NfzvYaL3eY3ZePY7IxNBpEeitM
 4o/65qEn7zxOG9Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_055351_605505_5FE5ADEF 
X-CRM114-Status: GOOD (  28.59  )
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

On Thu, 21 May 2026 08:26:59 +0000, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 8c6bf3d49753..66c41bf036de 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -503,6 +504,18 @@ static void meson_pwm_s4_put_clk(void *data)
>  	clk_put(clk);
>  }
>  
> +static int meson_pwm_init_channels_s7(struct pwm_chip *chip)
> +{
> +	struct device *dev = pwmchip_parent(chip);
> +	struct meson_pwm *meson = to_meson_pwm(chip);
> +
> +	meson->channels[0].clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(meson->channels[0].clk))
> +		return dev_err_probe(dev, PTR_ERR(meson->channels[0].clk),
> +				     "Failed to get clk\n");
> +	return 0;
> +}

This adds a fourth channels_init callback, and after the series
pwm_s7_data ends up differing from pwm_s4_data only by .npwm and by this
function. Would it make sense to share a single init between the two
instead?

What blocks reusing meson_pwm_init_channels_s4() as it stands is that it
needs an indexed clock lookup, and there is no devm variant of clk_get()
taking an index, hence the of_clk_get() + devm_add_action_or_reset()
dance. devm_clk_bulk_get_all() (include/linux/clk.h) is however both
devm-managed and index-based, and of_clk_bulk_get_all() is implemented as
clks[i].clk = of_clk_get(np, i) (drivers/clk/clk-bulk.c), so it performs
exactly the lookup the S4 path already does, only with automatic cleanup.
Something along these lines:

 static int meson_pwm_init_channels_per_channel_clk(struct pwm_chip *chip)
 {
      struct device *dev = pwmchip_parent(chip);
      struct meson_pwm *meson = to_meson_pwm(chip);
      struct clk_bulk_data *clks;
      unsigned int i;
      int num;

      num = devm_clk_bulk_get_all(dev, &clks);
      if (num < 0)
              return dev_err_probe(dev, num, "Failed to get clocks\n");

      if (num != chip->npwm)
              return dev_err_probe(dev, -EINVAL,
                                   "expected %u clocks, got %d\n",
                                   chip->npwm, num);

      for (i = 0; i < chip->npwm; i++)
              meson->channels[i].clk = clks[i].clk;

      return 0;
 }

chip->npwm is usable here because devm_pwmchip_alloc() fills it in probe
before channels_init() runs, so one function covers npwm = 2 and npwm = 1
with no variant-specific code, and meson_pwm_s4_put_clk() goes away with
it. A future variant would then only need its .npwm value.

The count check is worth keeping: of_clk_get(np, i) currently fails probe
with a clear message when the DT node has fewer clocks than expected,
while devm_clk_bulk_get_all() would simply return fewer clocks and leave
channels[i].clk NULL. As clk_prepare_enable(NULL) succeeds and
clk_round_rate(NULL, ...) returns 0, the problem would only surface later
in .apply() as a confusing "invalid source clock frequency". The check
just preserves the diagnostic you have today.

There is a similar use of this API, count check included, in
drivers/pmdomain/amlogic/meson-ee-pwrc.c, in case it is useful as a
reference.

Since this touches the existing S4 path, it would probably be easier to
review split up, roughly:

   1. dt-bindings (unchanged, keeps its Reviewed-by tags)
   2. pwm: meson: make the PWM count driver data -- add .npwm, fill the
      existing entries, use it in probe, and switch the loop in
      meson_pwm_init_clocks_meson8b() to chip->npwm. No functional change.
   3. pwm: meson: get per-channel clocks with devm_clk_bulk_get_all() --
      convert and rename meson_pwm_init_channels_s4(), drop
      meson_pwm_s4_put_clk(). No functional change.
   4. pwm: meson: Add support for Amlogic S7 -- reduced to pwm_s7_data
      with .npwm = 1 and the of_device_id entry.

That is clearly more work than what you have, so please do push back if
you think it is not worth it for this series. And if you are keeping a
separate function on purpose because devm_clk_get() is where you would
like the driver to head, that is a perfectly good answer too -- I may
well be missing context here.

> @@ -530,6 +543,7 @@ static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
>  static const struct meson_pwm_data pwm_meson8b_data = {
>  	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
>  	.channels_init = meson_pwm_init_channels_meson8b_legacy,
> +	.npwm = MESON_NUM_PWMS,

I suggest use "2" instead of "MESON_NUM_PWMS"

> @@ -642,7 +672,11 @@ static const struct of_device_id meson_pwm_matches[] = {
>  		.compatible = "amlogic,meson-s4-pwm",
>  		.data = &pwm_s4_data
>  	},
> -	{},
> +	{
> +		.compatible = "amlogic,s7-pwm",
> +		.data = &pwm_s7_data
> +	},
> +	{ }

Small nit: changing the sentinel from "{}," to "{ }" is unrelated to
adding S7 support. Patches tend to be easier to review when they carry only
the functional change, so would you mind dropping it, or splitting it into
its own trivial cleanup?

-- 
Alexandre Mergnat <amergnat@baylibre.com>

