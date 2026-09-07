Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B89C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5xsM2PpkE3MzX+tsKcHsoYtIZRtT3xChs4/YMhT9N0=; b=yO7ProfWTKZ0UXQ0dyzZvOWnLx
	tNIEu20pt3VSK7c6yagLT9e0MClEOfD7lRNxsujyAYyrdjOdQGWL/JUlSn9i934mWL2VmSR5zIF5z
	YA8IhoAP6+7nBIJS19VL1/mhgQFnqBBeM7idkQgBGQSctjNTy31XukZJaEycQiXkRRE/4sjudx9bM
	gOdHePewxFgFG4SyIb1ALkANNwHNA6AO+cNOO6IMuSV3cBKnP8sp9LiKRyh7WGSNrpskLyhvfgv0k
	K18lVcJywROXAV2UaAq/egGCe6pDBqu35Iw9sjv3B64Tir2Hti6OSKK7o5JjuvCbUaD3h3v48SV/S
	oXoy8/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bBJ-0000000790S-1LSg;
	Mon, 07 Sep 2026 15:22:49 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bBG-000000078zF-1fQP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 15:22:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso31482765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 08:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788794564; x=1789399364; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X5xsM2PpkE3MzX+tsKcHsoYtIZRtT3xChs4/YMhT9N0=;
        b=obEfI4C6QYvUhpDyqZLlqpVTIYOdexF/mVHStlEkhpxJFEuPjWll++7R+EPlPB0CmP
         +ixikBgr19i8C8UFqXcgEkgfgy5v4wc3PpgDJlKMQ+Nbl83H3/GnYDvLIGJScl5U+sfI
         S17izoVz2jVBMDIcela/6BRmgmPQm+oT1CTrScuc4ENYHvV2bzh5AEzfBzA8nWJ0Ds3O
         1Ry+au2TdTeqVvDZ6tPRx4xWMJlvj6i5WTcm1WexVsa9Tu57FyNIHjZ1RJt77mBW+B0L
         bKahQVyB3By+mok20OSczrQjERU7ygAClwQ6OCWFN1CTJ3wVJb74D9ryob9TSI6B/Oa0
         quog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794564; x=1789399364;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5xsM2PpkE3MzX+tsKcHsoYtIZRtT3xChs4/YMhT9N0=;
        b=DpwrosAYA34sasuBhd0AehAZ9Ps4iQYsrPwP0W4/xzFtIC6jav+nMMfT+RPwNftVGP
         NXNbCH1JPPUVwF83LSG8tzk2wfQITUa9bDEr008jlCs9BFZzDdWRV/6s4tgrDDZEBlcB
         jy69sRT2Xt/09nH72d7bbVGSu6jt7AkYn7rKxk7n1U/B3iqzJ1V7XOG2w7A3Csa7qCM8
         dyX5tJTuLsHYKQUWJz6YVs7zB1/bcXkuYpxxRDLRyqXNx3g9puGxtzQS28KZkME3q8WB
         K2/gWTStj9W1+dKwciJ72u3Vt2IY/KE7DvNcAOsIfCZgLt0bHqeGTOpbQ8T9mABIU9LZ
         bpgA==
X-Forwarded-Encrypted: i=1; AKwUvBw5S8Vd6mZIY79gEW0VTE6f+bzz51UndvvDhrKHbND1R6f9eFqNO7sg2kRpwkMz/Ca7csa7W83KnRiNnqeUT6tJ@lists.infradead.org
X-Gm-Message-State: AFuF++m2MzW3qfmhcPfHmKKO8U3sxzpB00v50c1K2EWuNUkenzzCy7C1
	BkGNnnu+07//3/16lLSL3LKsxpFCmnxek2eT/6jZooRiSwhkcZD2Mi/jNRP3CfALcEE=
X-Gm-Gg: AYBFou3C1c5iW1GHZaU2xV3A0FYsn+UA4z1DLmu3FLe6IdtupKpRM1l4vyR8XeTRpvL
	HihJMzsaJoIjfNDR1nrr8s1VqaHS2O7294sf4642mW1ay7TuVhFg/+MaJH+LhDHLj5lk297RMSV
	1d7eKOp4rlm9zf9QwWL7U8OlGQtvATV3PWuj5l515ocm2QgfatjVVZs+KcAEH7gVhbl+YjfRw9m
	hI2AkIrjIEiuCiWIExDRXhw/QrnTgju8mwqox8JtcoWgyQSlHESEsYEI9JP0YC1WW/LYLrw08T8
	U08aITY2E0EcjDk9hbM2Cu4Zw1JuUKKKGLq658ZYaMSVvV0lyObdESOXJXW4x+E1r5RaKUUTQH5
	VmQSb84RuWJ1lTjvbfr5T0xlQrHjiES9WDnWI5f2AZl2CIenxXsdBC9q0DxgbfTuA5cp/xjvtw4
	DFW25TBKXe1qLveGMtmBB6NYhmacNYHPJeqSHm4FqyT8FmoYR8ChmuD8De2OHNHct+Xd3+Y8deI
	2ncpXTh3NAcrSYIbgIVQCq9GMSGc/6c
X-Received: by 2002:a05:600c:3b99:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49cf81fb72amr250088355e9.1.1788794564491;
        Mon, 07 Sep 2026 08:22:44 -0700 (PDT)
Received: from [192.168.7.218] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm288319375e9.11.2026.09.07.08.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:22:44 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/4] pwm: meson: use bulk API for per-channel clocks
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
In-Reply-To: <20260827-s6-s7-pwm-v4-3-d28a2015177d@amlogic.com>
References: <20260827-s6-s7-pwm-v4-0-d28a2015177d@amlogic.com>
 <20260827-s6-s7-pwm-v4-3-d28a2015177d@amlogic.com>
Date: Mon, 07 Sep 2026 17:22:44 +0200
Message-Id: <178879456435.2256446.2005394820666057840.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2432; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=jmfCKOrsEAkeGu4GxNdLlIPtSWNSStX+SxoQ8W3mBP0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqntbFBsgbKyAhkkOJh84p2SvPyoyzSRQxstw9D
 3A9Z/x836eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCap7WxQAKCRArRkmdfjHU
 RemCD/9wGgVpKIFJRn8V0zICx86yvsAf6Pfmw2+t+HFAw/vPmcYJU+bEl+gXhNs+6LadQTaWZgP
 Vf5un+G+NE2CloSjsUmEkSlIUP2vxAhKXYup9NC3Lq399aqtzRnP5BqTrJp2rQQ/JeX5s0fDCna
 4EdhFl0ZMgzvr32vurCm44ZywSUGEWiKuGh6t5/0ApKOt0hubBGyc5h8jB5cxAumR9ovgGQ8xUy
 a0dKoglN5NWtk5FQNyrkDOKGIGoPTv7FBx7/ejivTWfRVvmA3EszeGZZ0SGykbdPVj0a9B5vnQE
 agxxO7E1xb7Uxlc9y7Dfgspf3eNU+8j8vIitR0BGPubc+0g1M/X1nwiBLcGCdnqcG83PZgnTuhg
 lxf9rLZcSQTDlxb7016YbagASF6TYHqdoRpHvg5olFqs+3+Xi4Qzd6Y768geLSEsb0J15Xg6+9o
 ytO7ADXO155fq9rdpIZBvIDekDlvfTGW91Naur8Qb3jAAq7NHTVvAkRkUeMRPgz7R6egwCGaGoS
 NX0uBEDW1vmlya4cdM5iMGhR1Jq5javGzdX5N1mF5gxmCiFjpkCMYLG6h6KedB0wg9SRRtm+p03
 VKjXhlKgR9SKCbnjfFZFUUOlugy5dbqSGld55eFhblnv4GNTPndXjvQ49fK9A64ZuhFLSAsdBVt
 9XRe2nETnLlSo1Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_082246_467433_580ECC62 
X-CRM114-Status: GOOD (  22.19  )
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

> The S4 PWM driver currently gets each channel clock individually with
> of_clk_get() and uses a custom cleanup action to release the clocks.
> 
> Use devm_clk_bulk_get_all() instead to retrieve all per-channel clocks
> at once. Verify that the number of clocks matches the number of PWM
> channels and assign each clock to its corresponding channel.
> 
> This also allows the per-channel clock initialization code to be shared
> by Meson PWM variants using one clock per channel.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 22cefc6d5dd0..6f151464d7cc 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -497,33 +497,25 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
>  	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
>  }
>  
> -static void meson_pwm_s4_put_clk(void *data)
> -{
> -	struct clk *clk = data;
> -
> -	clk_put(clk);
> -}
> -
> -static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
> +static int meson_pwm_init_channels_per_channel_clk(struct pwm_chip *chip)
>  {
>  	struct device *dev = pwmchip_parent(chip);
> -	struct device_node *np = dev->of_node;
>  	struct meson_pwm *meson = to_meson_pwm(chip);
> -	int i, ret;
> +	struct clk_bulk_data *clks;
> +	unsigned int i;
> +	int num;
>  
> -	for (i = 0; i < chip->npwm; i++) {
> -		meson->channels[i].clk = of_clk_get(np, i);
> -		if (IS_ERR(meson->channels[i].clk))
> -			return dev_err_probe(dev,
> -					     PTR_ERR(meson->channels[i].clk),
> -					     "Failed to get clk\n");
> -
> -		ret = devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
> -					       meson->channels[i].clk);
> -		if (ret)
> -			return dev_err_probe(dev, ret,
> -					     "Failed to add clk_put action\n");
> -	}
> +	num = devm_clk_bulk_get_all(dev, &clks);
> +	if (num < 0)
> +		return dev_err_probe(dev, num, "Failed to get clocks\n");
> +
> +	if (num != chip->npwm)
> +		return dev_err_probe(dev, -EINVAL,
> +				"expected %u clocks, got %d\n",

Small style nit: the continuation arguments are not aligned with the open
parenthesis, whereas the dev_err_probe() just above and the rest of the driver
do align them. Can you fix it please ?

After that,
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

