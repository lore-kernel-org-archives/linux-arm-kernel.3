Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC96CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 15:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMG+MYf2mIEZOo4k7BKQu+vHso1LCBH/45mKDm5C2Qg=; b=o/IxQ7TGGBdgQF2Wz/VP8pPbHp
	RPvIzmElHmftg/ZVhk1MFWot60RbNo0KIFxi+BMwOa9XJ6u5Bw/OYi6QIeN1QYEWdWUGMvLJ1D37V
	43bvF6U+1VM4c/r/EzgSQKJ1V6mDXSYe8LCB69536qiST3tSd7MthkMf601IudKpb0wubG5i/eN8E
	KIWrvdbJ91OvQGSeotY6b33XOwTIDXnPB5I8EaoPaeEiBH7HjBmqPmaHxGPnBypEtVtJsx0LNXMEV
	7Wo8mT9M7ZKFq7f2qqvCF6fAWQnTBj6hceBbJ4HkbPYV7omBACBN0HNtFrh7mvNYS7KCV7V7wzr3v
	fVHDZp9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXkX-00000005rsA-2t8T;
	Thu, 14 May 2026 15:13:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXkT-00000005rqq-3nPj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 15:13:19 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48fde648a71so5359585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 08:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778771596; x=1779376396; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMG+MYf2mIEZOo4k7BKQu+vHso1LCBH/45mKDm5C2Qg=;
        b=f67SFhDppc/yHyBbYHgVjAK4WqgtpFnWajtMShyZnonKedFTuQSrRDroSt5IcTAOf8
         un3cLyr87S6Kgtgxyvj/6XbQ8uAacIJ1wb9pr2wt0PcOQFd8D/R4HtLdznZhiyZH6Kmy
         W7geZjAI+0Jcw81QBAy6HEtvAp62CCrL4hRTGoHhWNg11KAkgU94kpV3sfwG8FEFt6kF
         tccLtr6bcnL5HohJFgsnoEScEjcojOqVvwH/Hian7C92jCJ13RhkCjLTwqUSi46F0MzX
         75+DAcaW3mnL9ZYEf5R55qv9YRGBGAute3UeYlU3li3mqzK+EXSY9b9kj37nKD2rJyja
         gp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771596; x=1779376396;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GMG+MYf2mIEZOo4k7BKQu+vHso1LCBH/45mKDm5C2Qg=;
        b=E6WfPE6jEAvNZ6B4zAqBPdqMRNOoFsgaH5hf7FnhAr1qcBkIJJX6TAGyaUeo4JiOEB
         KOgoQeBTo1VWpk79wyY7qKkN4qF3KMtblCv7n8rY7vVeT1Rj7X3lQbLq0n5gN+JO5YO4
         mx/d9MVAPCaIKZ8ovO0kQU4iVH/ecg1daQrbNdcSvbIB0SngIg6vonVqgzU4xFxqvQFB
         XFeKRaFtJETVJiaC/r6K8E0kZF6S4n5qFW+Y1JVGAH490ohWD3jDYrJNiQbN4YWVw4d1
         o2ye54XmvXlyq9E9FNNhPFKcFHrSV/PG1YQIro4Ya1cd9mq9wH9csXqR5gl4AuUxRLVC
         mvMw==
X-Forwarded-Encrypted: i=1; AFNElJ/r85JR5/mK5M+tUQAX9P69Fgl167qIZNTAhyluc2rFsYxuA4WvS6mpUHMYYM+fOG6XQ6LMX6ZwNZYUD43K5EFG@lists.infradead.org
X-Gm-Message-State: AOJu0YzGbicsJiK+RRDST8+o99lIWYFbXd7/ug6qrT2VEk0YBuLBLPBS
	VeuVhiOJwKGgUA67HKSAoB+FSuKTUodneE5tyrHPWtcKcwp/wA31Jph73LT7oiZpkck=
X-Gm-Gg: Acq92OG1D0DSxce/wC3r1XU4xjP/VniTKcnqH1zm905kro6VTDlb6LUEjK5JIADEe/K
	1L7y+H10roHznoVrNfcaPNwmgywpihjMXa67R7JYSSS/li/xfDpKlyk1EY3wWHWfYUQe/BYnrjK
	daVRs5hD6OV+48iQuc4KZmzFF4WoqcTZFbbbXnMZKsQyp8MbeuENG1/S7GyuBnnn583hYiP/WQB
	7Pij+4+GSK2oDJ2sxklzdXgppGlFmQKWrrLKYfbYAMgJy3g/rQdSs0F/KVVWSY+0T19Lx8aIWFi
	ntxqyoOHJ9MlIl/BHyPILj9BkeJyWOheZSPHyB0ii+ExjvO3WyjquqZ30aKYmeHGOHXjMU8L9rY
	ryJHG6FFdlsuJ8TrkTK5+G/4KA8eVXvpCcULz/6XDfcdnKuqlQ6DUtnSEf5b+MaUfsc2j+t8knt
	16ypkM9gkCrtUwHQkJ1kA=
X-Received: by 2002:a05:600c:8906:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-48fe486cca4mr514625e9.0.1778771595855;
        Thu, 14 May 2026 08:13:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8f63:bf1e:b5:28d8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe46f4647sm3184745e9.14.2026.05.14.08.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:13:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
In-Reply-To: <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com> (Jian Hu via's
	message of "Mon, 11 May 2026 20:47:27 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 14 May 2026 17:13:13 +0200
Message-ID: <1jse7u6n3q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_081317_960793_86CE514C 
X-CRM114-Status: GOOD (  17.94  )
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

On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> From: Jian Hu <jian.hu@amlogic.com>
>
> l_detect controls the enable/disable of the PLL lock-detect module.
>
> For A9, the l_detect signal is active-high:
> 0 -> Disable lock-detect module;
> 1 -> Enable lock-detect module.
>
> Here, a flag CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH is added to handle cases
> like A9, where the signal is active-high.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 9 +++++++--
>  drivers/clk/meson/clk-pll.h | 2 ++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 1ea6579a760f..5a0bd75f85a9 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -388,8 +388,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	}
>  
>  	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
> -		meson_parm_write(clk->map, &pll->l_detect, 1);
> -		meson_parm_write(clk->map, &pll->l_detect, 0);
> +		if (pll->flags & CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH) {
> +			meson_parm_write(clk->map, &pll->l_detect, 0);
> +			meson_parm_write(clk->map, &pll->l_detect, 1);
> +		} else {
> +			meson_parm_write(clk->map, &pll->l_detect, 1);
> +			meson_parm_write(clk->map, &pll->l_detect, 0);
> +		}

I'm not a fan of this code duplication.
Use the introduced CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH to compute the
first value, then flip the bit.

>  	}
>  
>  	if (meson_clk_pll_wait_lock(hw))
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 949157fb7bf5..97b7c70376a3 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -29,6 +29,8 @@ struct pll_mult_range {
>  
>  #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
>  #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
> +/* l_detect signal is active-high */
> +#define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;

-- 
Jerome

