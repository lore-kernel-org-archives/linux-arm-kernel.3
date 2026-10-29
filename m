Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0138C606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dh82d0Gi;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BxJLcAZp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zpV8BOzWQIVCU32MdQbmtk3u7cepQKA+eLljtF6aqaE=; b=Dh82d0GiQnWYPe
	GNr3+e3li/GQfm+GT6uviRzTylmZy/4rgZVIG6GFvDb7mBS/EzH4Pb1anaUwT5BqNoa4VRo89dlm2
	yuCufe/h3HIgK86/ahRkIm3v6CcZ64WCQTy+9uvCxybeJkh3ajXARnbbAfbl6N1vknz/jjJB0vbiZ
	l0BH2uxIU4kM0YYnkv7w0Pxhlmbplk/Xn0QfgMUrOxrA/IEK4Us3AgBtO9qe72DHsncLwpufA7QPj
	5y3pk4zQqfnWzd5+JTsE1mLjem/KpMW36HxGxVvL725KpGBbOa+EVah7zPTs+/LRSKP1j3Wdlcw4M
	6P18h5+2CxfQfPspWcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNzD-000000092nK-1S2x;
	Thu, 29 Oct 2026 11:07:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNzA-000000092lX-3Bmo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 11:07:58 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48df54150dfso1116996f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793272074; x=1793876874; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zpV8BOzWQIVCU32MdQbmtk3u7cepQKA+eLljtF6aqaE=;
        b=BxJLcAZpg1LffD8uUoXWC1rCMaSoqlYqt9MYZwk8GC67hptULEyMe/dV6Hd7qzy0Fe
         w9Nsg5LNSH/1WucbjpDAWJDPim8COMp+bxqYZze50v8CL/2xGXNESN4LSDwpNt+ix6Xg
         vcaoySbNjOT/+m/mNRxzfqR/IpNuOGhc0zJ6C5zHdQKsq2L8yCbaH6T7zoVLG8KzUKv5
         PsYWhEgfekTbdsm4SKfGFme/3egfmAEO9Zx/rG75vo96KvpESvA0ZQLqsDV9G3NCPDDA
         Eqy11j2exhfAEwaC2/nzTTFUIw9vfAnHkayDnh/lqfb17Pq3F+0XXQkHtDNUm0x8Jvrz
         hWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272074; x=1793876874;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpV8BOzWQIVCU32MdQbmtk3u7cepQKA+eLljtF6aqaE=;
        b=I5QcJOWt4m4obT5GfQu5toS/E5dgKQoB2L1KfOYrqSM1ZfoKoK1FJ/v2mufd8c2/Or
         gy+kZc7d1WUykixT46Hb8crS9XB888gdXFotSyTDqF+ax1Na4Xa01d6orz4xJYvI/VCY
         sHbeKjhrIN/tRMKne1F55h0hp4C9BtT6NSAuYraXMFx7Y8STpNsUU357QtZd9IGc5Xyl
         XjXNkg8mRAawDub/k7e4pJwCJYnb0+bLVvaNKKhLtQV+tEuohW15ld77lyGkq9ep0tGy
         6/ppfY/q5g3syKrrsOzzuWYKYNsEMquorIalTQai1bxdW/900fTNpgUxiHd5w4tz4TXZ
         meQw==
X-Forwarded-Encrypted: i=1; AKwUvByo9BZBPvlhTEnydlGpiecUUcR5flSd7JUWhtjZSwuJ3J+VCdLCgpLb5OJFkfQOusSTA4Pq9q6k+2ehNyZOHDSS@lists.infradead.org
X-Gm-Message-State: AFq9FYJB5VUbbDzHyqHL1SaAMJI99fg/pvwHM9bdOHVMFYFUPjxNjYhV
	yrIDrs1K72unKpMpaOAXi4Sc8MWFTw4vuDt5j58HgqWQP3SpMIxMFstaU+Huu7rQffQ=
X-Gm-Gg: AYBFou1xPmE5vjXJ20DgFR79ZtnvuyBOR9M3KF2cfv5C/eyAd4FFUr9jC1CqCaYnasg
	aMj6bJujMDpQPUw9fFmv5s7zY3XBOGjoCEdkjVHjlaXDtFoEUmrHLQxCeOmG0EQcDFCZ7RKtV4O
	2iiFlUcv0onvzJsalkxHX8XRrlfR4/3s4XB7v+81/mvQv+HRsHJPs0yih2wTO6TrDLkE80oSBta
	co+o/0DgmKi2u7RWnISgB49Ab5c/W0jUYltW9nLd4RIAInpNmi99OHuinq8n8VH02ETrlqSIxy9
	J7BY4vvPuY0pSLZmvPI7AzFzzhQhZwUaYyxP8p3wJ0IgaabBzcaI9fpqqyoGOR9RuWXesJ8Zb3q
	kERz5DW66JwzpZzqLUIam6h7o5aztDE4Ptsd039sQOOn6OPZB8ZBvWhf9jIdjo3GYrksuZMHlcT
	6dekzB6I3YUvkaHsJrQGmgmE9rjha0PNHpq8yptU1M3El0MHTCgU1AHHeo1ydC0NXVdmjZ6lzQd
	HAZI91qT6dPEguvD496kyYmhqzcuPJSThRI18J2L82T4f4D2N+R1waqiowC+YK2Ac0r7Hj3iaUB
	UOsjr3YH6c2x1Qn1GF+EUsJRKVlQUlB2igMIht+XB7e9E4XX
X-Received: by 2002:a05:6000:4308:b0:48e:6f:a9c1 with SMTP id ffacd0b85a97d-48e5d5d2236mr12412698f8f.54.1793272073992;
        Thu, 29 Oct 2026 04:07:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm33268688f8f.42.2026.10.29.04.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:07:53 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] clk: meson: add the missing HDMI divider /4 alias
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261026-upstream-clk-regmap-ro-divider-v1-1-c8216b0fb93a@baylibre.com>
References: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
 <20261026-upstream-clk-regmap-ro-divider-v1-1-c8216b0fb93a@baylibre.com>
Date: Thu, 29 Oct 2026 12:07:46 +0100
Message-Id: <179327206664.1865333.17830809789470255011.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4F+x0mrkRCPBzUwfIYOdv4hLerpsS1UqxVbKSxM7h1U=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmPNTnULtr1sD2x1TcLbJ/GWLeN7YqGAJtxb777L4/Ov
 vuGuW87SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMBHnD4wMXbJWG3ZvXC29x8C+
 7mFf0TlH34MzVNe8Fv616pd6ZZj2RkaGh8sWl4hsXrPjhRvHxGi+1Kgzid8VAmrqlSMl/v0r433
 NAQA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_040756_808796_D4518FEE 
X-CRM114-Status: GOOD (  19.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> On GXL and G12A, HDMI PLL divider values 2 and 3 both select /4, but
> only value 2 is listed in the tables. Reading value 3 therefore gives
> an unknown divisor and an incorrect clock rate.
> 
> Add value 3 to both tables. This also avoids a division by zero when
> the read-only rate-rounding helper uses the value read from hardware.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 3 ++-
>  drivers/clk/meson/gxbb.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index d0d4c7b6dc82..b23b9514fa91 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -779,12 +779,13 @@ static struct clk_regmap g12a_hdmi_pll_dco = {
>  
>  /*
>   * G12/SM1 hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
> - * A divider value of 3 should map to /8 but instead map /4 so ignore it.
> + * Divider values 2 and 3 both select /4.
>   */
>  static const struct clk_div_table g12a_hdmi_pll_od_div_table[] = {
>  	{ .val = 0, .div = 1 },
>  	{ .val = 1, .div = 2 },
>  	{ .val = 2, .div = 4 },
> +	{ .val = 3, .div = 4 },
>  	{ /* sentinel */ }
>  };
>  
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 7a7b104182ff..8cb6404c0efd 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -350,12 +350,13 @@ static struct clk_regmap gxbb_hdmi_pll = {
>  
>  /*
>   * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
> - * A divider value of 3 should map to /8 but instead map /4 so ignore it.
> + * Divider values 2 and 3 both select /4.
>   */
>  static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
>  	{ .val = 0, .div = 1 },
>  	{ .val = 1, .div = 2 },
>  	{ .val = 2, .div = 4 },
> +	{ .val = 3, .div = 4 },
>  	{ /* sentinel */ }
>  };
>  

Could you split the 2 changes so you can add an approriate fixes tag
on them ?

A part from this

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


