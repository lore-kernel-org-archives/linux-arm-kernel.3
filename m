Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B20CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 09:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XO1+IS9STBCj34Lw+wOXXrOpWS+ZkYDToI4PIiLJ9vs=; b=0RUOB4LWEfesLEAMvlJF1U4qzG
	b/WvhPuA9wEOIofInsB8Bx9hvqzVCTWiMwkMtYfwoVnkJhqxbszE48S8vIypCBDn0PBZlHVwNq4IO
	Bt6/67TGI/YSYQyANEBw/iM4TSKRSTp53vcqhG9eXHfTDxe3ZK6bBsvxaXFQHHCMj9PcWUFrWRVje
	iZq61H+/jBIy3/uMXzU8oFuX61fyhAWaLfWn6ee2wgP4dHqgwuuOXjivI1Fu5R3dxTJoEJyqCqKRu
	9aghVoqSMYckkcT/4UneVB9G5cJz5vJTE9pnfWgZJkCw2GqVSkcWNqxjkAmzIFtTX3B5vl0cNmlEj
	PaR6Qe2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqT9t-00000007RPq-0l6d;
	Mon, 25 Aug 2025 09:06:33 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSgm-00000007KvX-0YH4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 08:36:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso20468285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 01:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756110986; x=1756715786; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XO1+IS9STBCj34Lw+wOXXrOpWS+ZkYDToI4PIiLJ9vs=;
        b=27QAgJVdcNVUAUk2ncH8A+hdeQ06ehFuAOKzeG3t1Sij6hzMXEQizhOTFJnwlbGcnr
         kK+HWOykLm/Y40qfkrM0LKjn+zGL62VGJ5nR6pcde9he5jWwh1tyGBWW4No+x3abfPyY
         EB3TzZnIab73NNr1ARkzzT4QpIkCcFxYF/TsMZNd5/xndqht70F5ktuwTWimbrkaSrt3
         D3kY/sv609IIFirzvxkT8IJZFf+cXIH+kGITMeUCW//BS3eCUVG0WnWM10ETeH67zLGI
         uJTZoLGGT/bne51EChW/9WLucay3kYb5RFedTKiWKMIgNjIGRBmDyl0j/XhVdcUvnK6P
         zEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756110986; x=1756715786;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XO1+IS9STBCj34Lw+wOXXrOpWS+ZkYDToI4PIiLJ9vs=;
        b=Nb284CMAQ+X7PjMump81dor7japA2P8qFc/lbb1rGKDPgOqgwxZz0l48OiDFEk4TC9
         6JlBB/V3axSfgpWD5uOSApLJ/2jAfCVpWlPIdOtEnq8DXgVbTT7pDffUKNxq0Ga5pGar
         rjLWKQh7fLSNWAmgOTlaJn6fBxH7Tcg1sAckijTHVMqbIXgS8PtmH75jd6YhBedhNfVF
         neaDd7ROXB0jxvctKbqzlFAVnN8w1w9PZuBZNMtyTT4OKfVZ8/BNEsWC0L12UtUJ27v3
         vY3NqtmaVoMz3oTzlRyUlTGl/YwUMzqbZr3nYqY7uOYgxeBHfPmhv6UMdKC2LEX7+dwy
         J2aw==
X-Forwarded-Encrypted: i=1; AJvYcCVfMEOTuIDJtRpTcPCeTnT8X09BMmAKki99IAMGhrD0uTrbiNGe77QOvxBHo4m6FzGiHkRGudY3dpvJ9U1NXPyG@lists.infradead.org
X-Gm-Message-State: AOJu0Yytiogx5TsVQa9ih90kLce6N8/RSZ0s3BauzmnomkOP9Vkb72XQ
	T82molw4e9YyI2+Kh3PBEWlS7NkfKSjFzwvsIUjbAfwCwoJ8yfKYj1hujX8GLcuSviQ=
X-Gm-Gg: ASbGncttL0ukFUJEke8EqTbjYRufKxTz1wcQeQx9sCULc9taP/h3KDlUKl6fBHWWPkt
	gqJS5EBSoC3Yj+IL2U9JJgted9n498Ek/w2dEAXzFkTFE6EN8KVXvidiSC+tQgitFy/w4UiivUA
	/sCVhWXwpcS16PtfxL57OM6X+JCkOomYXgJE8apl1UJjcD9mGpKtVSzAjCem1wgOo7WrPdeycKE
	rqAgQpBiVzsxvzJtxnZ/eRyvf4KJstqkFnGzKK/i7N0ARDcMCvdiP9R59tQH2sHVpYYvc7i98DU
	lw2tm9GO/jZ/JW5oa/zwh51frjvfEZSeOnk1+c0Vu7RAI+RTPwqWNmDruanqPaWuT9+j986ho0N
	++gZGJgXF8ydA5158phk7iw==
X-Google-Smtp-Source: AGHT+IGiamtdsGY2kDX6w9f/mzPofYs3vSisqz5ZM4c90dOvsj+B0bgxdt8+7FzKKa6/ub2RebLE1A==
X-Received: by 2002:a05:600c:b8d:b0:459:e35e:a90d with SMTP id 5b1f17b1804b1-45b517c2eebmr91517135e9.27.1756110986280;
        Mon, 25 Aug 2025 01:36:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:af88:b6ba:23b9:97e3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b5753adf7sm99733285e9.7.2025.08.25.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 01:36:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jian Hu <jian.hu@amlogic.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: meson-g12a: fix bit range for fixed sys and
 hifi pll
In-Reply-To: <20250822002203.1979235-1-da@libre.computer> (Da Xue's message of
	"Thu, 21 Aug 2025 20:22:02 -0400")
References: <20250822002203.1979235-1-da@libre.computer>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 25 Aug 2025 10:36:25 +0200
Message-ID: <1jcy8j6bna.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_013628_258416_016482CE 
X-CRM114-Status: GOOD (  17.65  )
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

On Thu 21 Aug 2025 at 20:22, Da Xue <da@libre.computer> wrote:

> The bit range 17:0 does not match the datasheet for A311D / S905D3.
> Change the bit range to 18:0 for FIX and HIFI PLLs to match datasheet.
>
> The frac field is missing for sys pll so add that as well.
>
> Patched:
>
> + sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
> /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
> 996999
> 500000
> + sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>  hifi_pll                      0    +/-1562Hz
>  sys_pll_div16                 0    +/-1562Hz
>  sys_pll_cpub_div16            0    +/-1562Hz
> + sudo cat /sys/kernel/debug/clk/clk_summary
> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>     hifi_pll_dco                     0       0        0        0
>        hifi_pll                      0       0        0        0
>     sys_pll_dco                      1       1        0        3999999985
>        sys_pll                       0       0        0        499999999
>           sys_pll_div16_en           0       0        0        499999999
>              sys_pll_div16           0       0        0        31249999
>     fixed_pll_dco                    1       1        1        3987999985
>        fixed_pll                     3       3        1        1993999993
>
> Unpatch:
>
> + sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
> /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
> 1000000
> 500000
> + sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>  hifi_pll                      0    +/-1562Hz
>  sys_pll_div16                 0    +/-1562Hz
>  sys_pll_cpub_div16            0    +/-1562Hz
> + sudo cat /sys/kernel/debug/clk/clk_summary
> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>     hifi_pll_dco                     0       0        0        0
>        hifi_pll                      0       0        0        0
>     sys_pll_dco                      1       1        0        4800000000
>        sys_pll                       0       0        0        1200000000
>           sys_pll_div16_en           0       0        0        1200000000
>              sys_pll_div16           0       0        0        75000000
>     fixed_pll_dco                    1       1        1        3999999939
>        fixed_pll                     3       3        1        1999999970
>
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>  drivers/clk/meson/g12a.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 66f0e817e416..f78cca619ca5 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -157,7 +157,7 @@ static struct clk_regmap g12a_fixed_pll_dco = {
>  		.frac = {
>  			.reg_off = HHI_FIX_PLL_CNTL1,
>  			.shift   = 0,
> -			.width   = 17,
> +			.width   = 19,
>  		},
>  		.l = {
>  			.reg_off = HHI_FIX_PLL_CNTL0,
> @@ -223,6 +223,11 @@ static struct clk_regmap g12a_sys_pll_dco = {
>  			.shift   = 10,
>  			.width   = 5,
>  		},
> +		.frac = {
> +			.reg_off = HHI_SYS_PLL_CNTL1,
> +			.shift   = 0,
> +			.width   = 19,
> +		},
>  		.l = {
>  			.reg_off = HHI_SYS_PLL_CNTL0,
>  			.shift   = 31,
> @@ -1901,7 +1906,7 @@ static struct clk_regmap g12a_hifi_pll_dco = {
>  		.frac = {
>  			.reg_off = HHI_HIFI_PLL_CNTL1,
>  			.shift   = 0,
> -			.width   = 17,
> +			.width   = 19,
>  		},
>  		.l = {
>  			.reg_off = HHI_HIFI_PLL_CNTL0,

Thanks for this.

While this is indeed the same topic, this is doing 2 things at once.
Could you please split this, fixup in one change, adding the missing
frac in another ?

It is much easier to handle in case something needs to be reverted.

-- 
Jerome

