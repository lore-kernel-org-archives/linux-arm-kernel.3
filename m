Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B02CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7nWRXkwzkNu0lYsznyGEbSzR8Qg1Sj9llSzTwfH6ok=; b=CJFmnPwtgMYZgv87wJgczCCkHj
	3Lewb3Gsi65PQMyRCnphxV6tFh/qBOMrikq+YYtuz7puEhHR61d8ptEPdyRAsROrrpHLXif9b9vzt
	dw9MBbpRErXVijaGxRXIre25S3hqeaLrmHdIDHzdy0pC1cwqwgIKRuKDYAuWHMQwLMmityeK/+j/u
	LlPSRtp1JqXrSKK/tAz+cEnVBLSNUP7qFAv1QNzn7JRP8dHWnp+snnTrGNNc1V+Ta3uBlqB8EiE6h
	89FsQHiu9h4o/s87ylYQyDEo69AnyZ/nfLDAv1i7pRAJ7qGkk3faWQBnd+GcANi5ZfjKjMRokbjMG
	O214i/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwljG-00000004dsw-0qnS;
	Thu, 11 Sep 2025 18:09:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwljA-00000004dqt-0918
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:09:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so7682525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 11:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757614138; x=1758218938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7nWRXkwzkNu0lYsznyGEbSzR8Qg1Sj9llSzTwfH6ok=;
        b=ZX5oIT2qOPX7XAJC/UCZO1M3GjMNy7YA8x+hpFGH6KbihISJxqxUjeA572jdLrW9U0
         y2n7IN2iQOpikKJkxu5eKZa5tXwgDEHjK48iI/Qhvw21NRzsCHbpJ2ZQiKYcLcEhrY6c
         KrXpOoIoErOHq0Jc814vxqcM6d+d17e/hFpYJ1o6+QHg6GdE7VeUP38rAJFI/OQK7/HC
         qnqSoI6r9WJIfBupnqFmbUV+/G5Iljsz3FvNpvowWDl2ngbXht7cvLeH7VID1qIR9IWH
         zzJlN0K7vk+5mM7LhNdiTdOQbysc3sYxTRykh+SXTAZomSxn6Ct1T8iR2BnoMucY+wnz
         Nxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757614138; x=1758218938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7nWRXkwzkNu0lYsznyGEbSzR8Qg1Sj9llSzTwfH6ok=;
        b=J+iFAOpASJNGbe18vCvtvHub66zW/0UvEDOnCaC4P26CF88oNuPJKfvfzCMzpL1ZBA
         CKpc+tSaFOIeW9ZPSt61NrwzN6YfL4d4Lh81KVOxlGCgymDgVonr5W0fp3jB1QGNqHvr
         JFmHU2Ka7sM1E5CzOOpk6NrjMIcluBfuBI76ZXr04AO1VYV28vcBe0qS2iFzIV+DnOn0
         TepETTEO/gkIVxG0pGkbgRcLSPW5bdXtYpdYp1gfd3pTmOO7EsWWdujLIbjslcg13bnf
         VmXSkwBP3bXPvF18QuwVXqptWBs6PLSwHWofTfh5N1dWaaKJyczlKS0LzgsgQLjnDjfe
         1Lyg==
X-Forwarded-Encrypted: i=1; AJvYcCUR/NdfPUCYkPDrmKmwN7jE6qgfuKqarz6EtceOncAVwqJC4Ljsz+UYmcVqgnKw62OWoWsm/OXCbJ99jXBRAB4E@lists.infradead.org
X-Gm-Message-State: AOJu0YyfPY+9ERJMU7YlFkBYqfyIXkshvMnrGWDBkF2nYjMKFDv64rR8
	zMx3Xvn0a5SHEOeD2P8g6K+VuNHGIkBgDN0rtkHl15Y8d1qaY/NziQIm
X-Gm-Gg: ASbGncuUJL/LcRyonu5aSQHTm9eT5EY+WHTz7lJCGE+GCPn7RLA90uaYx0ub5zNJNV/
	anG9auJXVUkk42VFJO+cPvrvDbhAooYokMmhHWDQ7AzQum+26rHGj8A5/2hwvNoCIElR0RF9o6f
	tvdpVWDJWaY2AmThXvugk9v4Ah7ANZgjyAtbMIlPcKvdXwkdiZSx1+jDa/WM8mX4pHcFY+XjBUd
	5paEvjihNiGCx6mMv03B4FkhTCu7xgx6XVtnz4SB/Es0u1nFS560fs5Oa0wNpqSNZ5hsB7ogczg
	Y49p/OFFerDUeSazJFJ0vXnc8on80wd+Kv9R7xzPXnREWV4IujI3kcQzigB4n7+qOSgwUUGOGwa
	Ht/OKGEdwnzDlSEo5iBBin42w/Gd3VLxmOwA2uF8BMZui5dpuzTagJxHAiaq+FGl//ngJCYpwwh
	teiI71atT39w==
X-Google-Smtp-Source: AGHT+IG/tgONKkALdGCBSwVsuGobkxpNF6yi/bsIuUbq0WXKY1dVZ7jjm+lB6jrMTTAtwUaxRQ2WoQ==
X-Received: by 2002:a05:600c:58c1:b0:45d:e0d8:a0bb with SMTP id 5b1f17b1804b1-45f21214d99mr2291715e9.23.1757614138011;
        Thu, 11 Sep 2025 11:08:58 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e016b5a2esm35156765e9.13.2025.09.11.11.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:08:57 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] clk: sunxi-ng: div: support power-of-two dividers
Date: Thu, 11 Sep 2025 20:08:56 +0200
Message-ID: <5919523.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250911174710.3149589-5-wens@kernel.org>
References: <20250911174710.3149589-1-wens@kernel.org>
 <20250911174710.3149589-5-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_110900_088356_7CCB64A0 
X-CRM114-Status: GOOD (  16.35  )
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

Dne =C4=8Detrtek, 11. september 2025 ob 19:47:07 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> Some clocks (for timers) on the A523 are mux-divider-gate types
> with the divider being values of power-of-two.
>=20
> Add a macro for these types of clocks so that we can use the divider
> types instead of the M-P types without an M divider.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_div.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_di=
v.h
> index 90d49ee8e0cc..be00b3277e97 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.h
> +++ b/drivers/clk/sunxi-ng/ccu_div.h
> @@ -274,6 +274,24 @@ struct ccu_div {
>  	SUNXI_CCU_M_HWS_WITH_GATE(_struct, _name, _parent, _reg,	\
>  				  _mshift, _mwidth, 0, _flags)
> =20
> +#define SUNXI_CCU_P_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
> +				       _mshift, _mwidth,		\
> +				       _muxshift, _muxwidth,		\
> +				       _gate, _flags)			\
> +	struct ccu_div _struct =3D {					\
> +		.enable	=3D _gate,					\
> +		.div	=3D _SUNXI_CCU_DIV_FLAGS(_mshift, _mwidth,	\
> +					       CLK_DIVIDER_POWER_OF_TWO), \
> +		.mux	=3D _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
> +		.common	=3D {						\
> +			.reg		=3D _reg,				\
> +			.hw.init	=3D CLK_HW_INIT_PARENTS_DATA(_name, \
> +								   _parents, \
> +								   &ccu_div_ops, \
> +								   _flags), \
> +		},							\
> +	}
> +
>  static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
>  {
>  	struct ccu_common *common =3D hw_to_ccu_common(hw);
>=20





