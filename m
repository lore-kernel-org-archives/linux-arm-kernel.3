Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B88CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYpKAqWBddZNFYdvjfGx2qHtXBFJg7fbXWnk9+t0U8A=; b=rR0aBsM5mmHtJ+5iPMo6llQCiX
	S8Equx64GmXSTeqjBMDZ5cyM8DvT0QY4RFDQIsAEQQKknkOzdJsAZ9xMMD2ahz9QCL91KMDepdjPN
	dwvGAy6UEe3EYRwB8eke1lBEdSLljZu89IUBvs4gPZzvVC8CjVsLeMrkovWJdSkoOQezsV4ua5IE2
	/rerULUBPPA4YO2RDd8njvD6DKQwVjUxa0biKWae27Lc+F2c/WRwlPAFrKrytiMniEQVVspN8s+Zd
	VnY6yhUCoDO5EBa5en2DRcxZFqLJarSQUWqJN7LTDNMDfUJyFjBF2qAGQ4hZhtoSpJqRfOjgNYIqo
	UAWqXsfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSSM-0000000E2YS-2qo2;
	Mon, 11 May 2026 15:22:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSSK-0000000E2Xk-2uVP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778512923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XYpKAqWBddZNFYdvjfGx2qHtXBFJg7fbXWnk9+t0U8A=;
	b=CUjzcEIwHZ/nBrm5b7DRW4WejqWJ+0B9YBWnciNivVLqiIf2+k9US6aZzgpn5QFZ+88mqF
	8FkixJaQhDP6MoU3xhC1MrKLXmXHZky+XJtm9n8kX/cM+kx9n15q3mkLaEFKWEMLveWj+K
	WxlgbjCKtsoWweH7M91wsWhSeIy3G40=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-VPyhIdLKMx-Tb8Jufw8cRw-1; Mon, 11 May 2026 11:22:00 -0400
X-MC-Unique: VPyhIdLKMx-Tb8Jufw8cRw-1
X-Mimecast-MFC-AGG-ID: VPyhIdLKMx-Tb8Jufw8cRw_1778512920
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51494d74d4bso48918231cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512920; x=1779117720;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XYpKAqWBddZNFYdvjfGx2qHtXBFJg7fbXWnk9+t0U8A=;
        b=dYqphZAs0yDxGMZgScBN/0mPpEzB/CH/KVqEqU2l/EDH59zGlVa25U0vwa1teYUkmf
         Igslg75yr8Qfba+UXVXDBSkFlHvn4hQ8dZhIWcjroI1pMOmjDQ3+CRcVHD1TEuHFmO5k
         r3+8R245+E2liuH9VUDCPLrxAOLRVbxbJN15ZMLlekKTOlxPyGV1ykkytt61LnzH28mE
         bUr0K2K38RCfcLPbaUZMIjJIsZEVDnBvjO3K08Lulx38GEBUEVi3znWcKlTB+Nrl2/Bl
         q9ZknASmWCkZcvEsddqUTmL9uxdm4TQ+P0vVzib8u5+e8K/IEx97+KIjkcDQzqVc7C9b
         ZPVA==
X-Forwarded-Encrypted: i=1; AFNElJ/zpfU+mpeUYLFvzmgTJZEfJIY/DE17WQobVd88wX4bC3EXmSTZY6lh1C9FpLzBky+R8rj8EmsFY4Uea+cy8l/w@lists.infradead.org
X-Gm-Message-State: AOJu0YyC4AhteERd7zn275MJ9iG2bzRa4EOS/YzP/P4QrE1UjCl+00Yi
	sDeIxckzsa2bK3jtxhP8Ahs+LVeJ6hrS2W+u7s+YG/bZlL5lE4vLRsBUjzWmV0DiiEiSuWo31st
	d6ihqinmaoIjLkPidkCVwKLvFs3gYGPyfIOojsl0UExIzUCzPstknezKBz9qYuffY6NfuOIx6qz
	7A
X-Gm-Gg: Acq92OEFTWysKyWuSjK7kgdV4JcCfvOVyAUEWwnfub6ipyk73kp71SYTKk/qJQ4jRet
	OCcgrLF3ahL/imwcyOZxfJ9VtcmyN5HVD33Ql0jRhraxG8gCFoMiK2TvviWMn3/jy31nb60z+Ak
	WYOC9XBHLTmik31iv5VFBxtOm2bOb82XQ8SdMeKgtP02TWSx+lVKWcmFWo4SAjDxOT+IVKHTMd5
	5Jt+lyfOhPowZzKQmy4SysP2UnvG/xgYmrZippdgZ4yb820vhvA9DqZ738sIx1C06aE+cTGBXq8
	SutbPpSmcboHDFyCYHNk2cZQLkmnvSmulBhoTDk7FcFxwZIsAU5B6WV3ZAa4Sy/U0U7y5MEgNC5
	2WoBAoBVN7C5NSR4QjA2poz3AcUZC9QtojZxJg7YSzVUigNY9/OrD4yVNdBoA8I2+Xwc=
X-Received: by 2002:a05:622a:19a2:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-51475b74192mr224792231cf.16.1778512919557;
        Mon, 11 May 2026 08:21:59 -0700 (PDT)
X-Received: by 2002:a05:622a:19a2:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-51475b74192mr224791581cf.16.1778512919063;
        Mon, 11 May 2026 08:21:59 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a906e25sm96450396d6.14.2026.05.11.08.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:21:58 -0700 (PDT)
Date: Mon, 11 May 2026 11:21:56 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] clk: amlogic: PLL reset signal supports active-low
 configuration
Message-ID: <agH0FMzku3QRlB50@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RQYJ6K3WpeUgPPak2eO6a2oDxylX0OlUmxBK5PKqW7k_1778512920
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_082204_800118_CE9E1F32 
X-CRM114-Status: GOOD (  24.90  )
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

On Mon, May 11, 2026 at 08:47:28PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> In the A9 design, the PLL reset signal is configured as active-low.
> 
> Add the flag 'CLK_MESON_PLL_RST_N' to indicate that the PLL reset signal
> is active-low.

This flag isn't in the patch. I assume that you mean
CLK_MESON_PLL_RST_ACTIVE_LOW?

Brian

> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 42 +++++++++++++++++++++++++++++++-----------
>  drivers/clk/meson/clk-pll.h |  2 ++
>  2 files changed, 33 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 5a0bd75f85a9..8568ad6ba7b6 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -295,10 +295,14 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> +	unsigned int rst;
>  
> -	if (MESON_PARM_APPLICABLE(&pll->rst) &&
> -	    meson_parm_read(clk->map, &pll->rst))
> -		return 0;
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		rst = meson_parm_read(clk->map, &pll->rst);
> +		if ((rst && !(pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)) ||
> +		    (!rst && (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)))
> +			return 0;
> +	}
>  
>  	if (!meson_parm_read(clk->map, &pll->en) ||
>  	    !meson_parm_read(clk->map, &pll->l))
> @@ -326,14 +330,22 @@ static int meson_clk_pll_init(struct clk_hw *hw)
>  		return 0;
>  
>  	if (pll->init_count) {
> -		if (MESON_PARM_APPLICABLE(&pll->rst))
> -			meson_parm_write(clk->map, &pll->rst, 1);
> +		if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +			if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +				meson_parm_write(clk->map, &pll->rst, 0);
> +			else
> +				meson_parm_write(clk->map, &pll->rst, 1);
> +		}
>  
>  		regmap_multi_reg_write(clk->map, pll->init_regs,
>  				       pll->init_count);
>  
> -		if (MESON_PARM_APPLICABLE(&pll->rst))
> -			meson_parm_write(clk->map, &pll->rst, 0);
> +		if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +			if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +				meson_parm_write(clk->map, &pll->rst, 1);
> +			else
> +				meson_parm_write(clk->map, &pll->rst, 0);
> +		}
>  	}
>  
>  	return 0;
> @@ -363,15 +375,23 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  		return 0;
>  
>  	/* Make sure the pll is in reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 1);
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +			meson_parm_write(clk->map, &pll->rst, 0);
> +		else
> +			meson_parm_write(clk->map, &pll->rst, 1);
> +	}
>  
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);
>  
>  	/* Take the pll out reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 0);
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +			meson_parm_write(clk->map, &pll->rst, 1);
> +		else
> +			meson_parm_write(clk->map, &pll->rst, 0);
> +	}
>  
>  	/*
>  	 * Compared with the previous SoCs, self-adaption current module
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 97b7c70376a3..1be7e6e77631 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -31,6 +31,8 @@ struct pll_mult_range {
>  #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
>  /* l_detect signal is active-high */
>  #define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
> +/* rst signal is active-low (Power-on reset) */
> +#define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(3)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;
> 
> -- 
> 2.47.1
> 
> 


