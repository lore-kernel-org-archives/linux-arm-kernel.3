Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F666FEA814
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 07:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KMORzaHZIt/O0p0OreFRdLlztvWKjQgycAj/ZTHugc=; b=VM2J7iXWZgYRye1VcWlW3EaBC9
	1PVVMQugwQ9goY5n4ErZA9wRBXSzCBz8mMBIT+NQInQn36LpIr6AAXLvCv+Yo2TY/0hCkcQAU7eVn
	qoEr26l4+SZG15pzotXEhcwB7wsah+d1pz5XuNOGn2EDf8Hs9VnleTgFGiMjCeAD0L76TIWh/QGsB
	eVDSTJoZxHGd8GJ4TNleU51L3WNVtXPSagChAhsRSg+V3lZ0EmfLHt92colTbNucLp4rCc/9fdvXw
	IzEapca+mEo4R/LL9BY3kVys/nWb/YwQ8xGVOEx6vOr1eFAhhbPy4Pr3gZm8PUg4vGvceT8ns5DOB
	K3xMd4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ILZ-00000002pf1-0oCT;
	Wed, 25 Mar 2026 07:08:09 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ILU-00000002pdh-2t3j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 07:08:07 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-35a1d4a095bso422284a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 00:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774422483; x=1775027283; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KMORzaHZIt/O0p0OreFRdLlztvWKjQgycAj/ZTHugc=;
        b=cMA2+Q4RyHPMj7RahIotYUa50C6ctxnoEsS0pgNBrPxnsbCvvnOAl9aEu5KUIncv4a
         uCx5Tusg7SMKnL3c37CtY4PcW03XxOGADEMKEhERMlbDudHwhsoZ2j+44yyn6sqXTd8s
         Zr8vx2qRd7m/cCZBEGkzb8rU3SwHnUCnnq3iG4Fs0SScrnPpaqCfUcz8Fa1JIyOg99uH
         8X6HAoJYU3H31cWHYBdS/2iwIVluqUjCIcYobleAcTfGBj4sddhlhczT9td5cPm3/UtH
         k+3pouKHtQprwCTpYOsYrH5BHrb33JFtplRFV3h0vXUG5oMwnY/bOV1xDKJjFDyNrS06
         GUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774422483; x=1775027283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KMORzaHZIt/O0p0OreFRdLlztvWKjQgycAj/ZTHugc=;
        b=RGvHlhYo6OYJ5MULfB1oCP5MB/fqNYcT5qGJx806bBjh4oW/evujh/axKxmTvLM32S
         vtV8/H/WWocGUboWknueHPrUxX7mFRlJo1Veo108asSFv/5LlaNbWaqcrLXgJfBy8j0p
         zf1c6BAZqwboiyaEEE3XgxotJLqdrEk3hx57N+98TJScULUp4KtQwRnjT6Xy2Ngtg8UP
         y76pdc6sFBZJxOKgIystsaZJ5MbLb2PI31I+eC69CHmkNO4OMv4myrX+1UmJnCi2gK0F
         Uq2QOvVrz0gyx8gUjDr14SzXQyockMK06J3GUNmAo7Cox7ScBtz1WqGacDmfoBnZvb0K
         SrHA==
X-Forwarded-Encrypted: i=1; AJvYcCUii1Wrb9Nixwcf7Ruz9hV5FGKV2WhpvTiHH6HyL16S+gdK1WFxXrHG5i1kCzxAzl2euTacwVxo0SzGN4DsYrJ7@lists.infradead.org
X-Gm-Message-State: AOJu0YwnntWOxxyZM1sNRvulauQtKneRDLsHM8pJYak4wBzJ56rCDamK
	Y7vgm5T5APP02yV2GrLKYuhviJ62fYNYcaY7turB9ciKmKgui5SVEO9T3ORk27KZW1w=
X-Gm-Gg: ATEYQzyhFOOzay+jtu6YIMJX/tzSkmVvsHYI6S/wP8HzRstLpGF8SySbGLIvCLnwNLR
	lSQ+kK3G8V+QFl7RFadgJn1t1WiDLxyvRna6vZceNX3ROKZLazjyHYdtyb3bLdXMYw4dFIB6/hj
	wHwyXVTMOJANCsVg6RqVAOL30sISr76+HF1KRWfWTaQPOT7R7K0XmTkeIfdC5J/+yJt/XFGiqpA
	E8xLhZbT3gviPzcMF3+3Ir2U94FPNjDgoqUlpZ7+K+bgZPLV3lN9YO3JQ1YsREEdUUqOa2l0/r+
	00YUrgX00q8t253VyAI9oAv6EGyc8tkMoCrEwv5ZFUahGdeny1ZcWJ9Z6wts+C2kLzVmaq9Mbdq
	+F1X7DbdPwwjfXfonivMcrmBt91pxRRHkrKfbcruoRAJpmNtDdG/Dn44JaZJ/8wa0twhbcUwujd
	+CNGkM34kC+ECV+yIJHC93Khmn
X-Received: by 2002:a17:90b:1dcd:b0:35c:69c:2a12 with SMTP id 98e67ed59e1d1-35c0cffc5eemr2303037a91.0.1774422483131;
        Wed, 25 Mar 2026 00:08:03 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0ea4807dsm442644a91.10.2026.03.25.00.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:08:02 -0700 (PDT)
Date: Wed, 25 Mar 2026 12:37:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: vireshk@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spear: fix resource leak in clk_register_vco_pll()
Message-ID: <brk43cgzeibwism24x5ub2uz5f3uveuljibgnztl4zrtd6jke6@lb7nipf5dq6m>
References: <20260325062204.169648-1-lihaoxiang@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325062204.169648-1-lihaoxiang@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_000804_744985_CF9D9AF6 
X-CRM114-Status: GOOD (  16.21  )
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

On 25-03-26, 14:22, Haoxiang Li wrote:
> Add a goto label in clk_register_vco_pll(), unregister vco_clk
> if tpll_clk is failed to be registered.
> 
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
>  drivers/clk/spear/clk-vco-pll.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spear/clk-vco-pll.c b/drivers/clk/spear/clk-vco-pll.c
> index 723a6eb67754..ceb82723fa8c 100644
> --- a/drivers/clk/spear/clk-vco-pll.c
> +++ b/drivers/clk/spear/clk-vco-pll.c
> @@ -343,13 +343,15 @@ struct clk *clk_register_vco_pll(const char *vco_name, const char *pll_name,
>  
>  	tpll_clk = clk_register(NULL, &pll->hw);
>  	if (IS_ERR_OR_NULL(tpll_clk))
> -		goto free_pll;
> +		goto unregister_clk;
>  
>  	if (pll_clk)
>  		*pll_clk = tpll_clk;
>  
>  	return vco_clk;
>  
> +unregister_clk:
> +	clk_unregister(vco_clk);
>  free_pll:
>  	kfree(pll);
>  free_vco:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

