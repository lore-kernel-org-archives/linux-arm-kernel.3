Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6325BC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 06:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=br/KFQMisLWNAK11Jh+i4JA1Nu+Hjv1i9FwCDI747D4=; b=jvv8Nio9tdQaDfvXl1m+Px9UgK
	yTKm+fd2zrhvRd8IIgEm/HFyhFUt+gFj6Wx6E7+mHJG9mERMULsDJIRPJzRm1Xjq+sCDWVkNeKH0F
	B/6NMU5u2Wy7eZErU1ovNrz4uavH9htfJ5TsuaOhvYdNpoLas/d9NBQcbznT5ldswq/FNsJ8EdIJH
	1cFTZl9zkzjeqPv5izzmohx68i817pyE8GqRRNjgj3Bn2AfHLRBIRJ5rPObxXYzmDWQXgOwWJGoy5
	I5ojR/SfrD6Hl9Ju9W5xvdh9P1X112EMpA/HX3KkCavouJ8bhydRTTcGkRrtI58GqhDqvDQFzzu3I
	pM37Bmzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4YN-0000000Civl-2pgc;
	Wed, 13 Aug 2025 06:01:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4M0-0000000Cgpz-1jYw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 05:48:53 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-459eb4ae596so56145385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 22:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755064130; x=1755668930; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=br/KFQMisLWNAK11Jh+i4JA1Nu+Hjv1i9FwCDI747D4=;
        b=GLQzzuNfd+ISQKoKZvS9xL/3w/jQdnqrIQc5kE2dFF51vzZDAdEMlx2UjMMhlopAfm
         H8TpiS9vfuyBUBcpJqS+NdZRy5d7LUMutb9SDpwSukP8cQZ6ikXDBwmoTVwOh7o5Da8F
         7CgOUOkcJUgBeDvT+LtNus7RnTcoIAiWnQcFITDWyJCKzNcuHRERN5LmcrTJj0fUFHZ3
         3jYg05XSot/h2t8hGsxZ7hpm5X6fGpLJxsu+pxypzJDoyBphCnE7cgwlR7b9hqAsme4W
         x+CnEyXG5eQKgO+cud0xmxixRL4cRD9Z0I6wG/40x+ANJP6BjzrkKIoEsISAt3Nt2dUt
         Rgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755064130; x=1755668930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=br/KFQMisLWNAK11Jh+i4JA1Nu+Hjv1i9FwCDI747D4=;
        b=nZAFleuOFcQWkRw39w2X0d7ikiqOnwkOueqMKr4Oqa1lE8LiGcVSDNpBoyuNX2BV7T
         ItecGDZbTRkSH0jWC/nZeUoqL1UbBi9TAMkd189HxA2a3JQyYaW46q9wGWFM1RTMtXW+
         u7plI/0C48GZ+k7o2ArW2KQKJ/lXqEm+G1vQdivyGidOldlAUzIYiU115mpZr6ePVC4Q
         GamRB9sW/5LYODAEMgDIs3a9MUi5WHdinlEZfFwz0u9etlyfZJjJ5yElR14MhnECWKX5
         nZqG42oT5SHNnosJ7xMjZTXmavpoDDLaHG4y//t4D3F3jLh8jPzBwPkHv+xj0i/hTLPh
         bWrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoY/x6I1NY4AGulRLBaIWVBG6n9twDKt90/Dk/WtXpMtCgW07vREGip0fnPSnm4Tik9zUjAsVtsi5r0DzIYaTN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy/JICP1yc1GZ3ECmyJOn9yAao5tobabp7x4H6TIjzexkuVhqo
	XT/m3ORLd8KwypygGjXtGRtYFiUk3xCKKYONfnkcLLihWYhEkIJChgp7rbuEURPwAUg=
X-Gm-Gg: ASbGncspjS7ySXGwzJje0hN5OGRNPJAZ1OuerZU8I+/n/TVOQ198wAnK/bLo9d+8ukE
	tX+O/9VHl1oCMBJaESTG3R/k1ZukLKqNjbarA6Uri1AyimDWTaaztyGwOVyemqrvQGJaQ+uripN
	DrNoKshrpkLBoR3F6pJTWxMJs00Kl50Rgxu1I/Ui0lBdyjfWTkSi7InsL0FlgFt9NhGo58wfzvS
	onoSasnGhTkVl/hzT5QmvhfOwtOguw7qQvPhiiyJLyrnSOEZcTQr53atAwNXXFFFCzWeI4jOY5V
	txOGmzI0SdoCwigvANP+0QgGCXZhj3gCY/A/43U7Qnaz31MX/aL3i4Aq8wDZvzezezKwEhVMXVi
	+W4K30y5iHoKaBrAWr/TQK2zaXcpGNAlqXEynTg==
X-Google-Smtp-Source: AGHT+IFcMDTK7Qu4ZC7nlXttWooxXbJSLLV2zHBxtvmzb4Q3sahk0UhmGPH7DhFAOinlsQYal8xNDw==
X-Received: by 2002:a05:600c:1649:b0:456:1560:7c63 with SMTP id 5b1f17b1804b1-45a1787a29emr3451565e9.3.1755064130316;
        Tue, 12 Aug 2025 22:48:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3bf93dsm46609898f8f.27.2025.08.12.22.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 22:48:49 -0700 (PDT)
Date: Wed, 13 Aug 2025 08:48:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: conf: Support assigned-clock-sscs
Message-ID: <aJwnH2mlRdqp1K1u@stanley.mountain>
References: <20250812-clk-ssc-version1-v1-0-cef60f20d770@nxp.com>
 <20250812-clk-ssc-version1-v1-2-cef60f20d770@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812-clk-ssc-version1-v1-2-cef60f20d770@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_224852_455399_DA74B660 
X-CRM114-Status: GOOD (  27.58  )
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

On Tue, Aug 12, 2025 at 08:17:06PM +0800, Peng Fan wrote:
> Parse the Spread Spectrum Configuration(SSC) from device tree and configure
> them before using the clock.
> 
> Each SSC is three u32 elements which means '<modfreq spreaddepth
> modmethod>', so assigned-clock-sscs is an array of multiple three u32
> elements.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/clk-conf.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
> index 303a0bb26e54a95655ce094a35b989c97ebc6fd8..81a2c1f8ca4c44df2c54c1e51f800f533c9453b3 100644
> --- a/drivers/clk/clk-conf.c
> +++ b/drivers/clk/clk-conf.c
> @@ -155,6 +155,72 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
>  	return 0;
>  }
>  
> +static int __set_clk_spread_spectrum(struct device_node *node, bool clk_supplier)
> +{
> +	u32 *sscs __free(kfree) = NULL;
> +	u32 elem_size = sizeof(u32) * 3;
> +	struct of_phandle_args clkspec;
> +	int rc, count, index;
> +	struct clk *clk;
> +
> +	/* modfreq, spreadPercent, modmethod */
> +	count = of_property_count_elems_of_size(node, "assigned-clock-sscs", elem_size);
> +	if (count > 0) {
> +		sscs = kcalloc(count, elem_size, GFP_KERNEL);
> +		if (!sscs)
> +			return -ENOMEM;
> +		rc = of_property_read_u32_array(node,
> +						"assigned-clock-sscs",
> +						sscs, count * 3);
> +	} else {
> +		return 0;
> +	}
> +
> +	if (rc)
> +		return rc;

Nit pick: Please, flip these conditions around.

	count = of_property_count_elems_of_size(node, "assigned-clock-sscs", elem_size);
	if (count <= 0)
		return 0;

	sscs = kcalloc(count, elem_size, GFP_KERNEL);
	if (!sscs)
		return -ENOMEM;

	rc = of_property_read_u32_array(node, "assigned-clock-sscs", sscs,
					count * 3);
	if (rc)
		return rc;

> +
> +	for (index = 0; index < count; index++) {
> +		u32 modfreq_hz = sscs[index * 3], spread_bp = sscs[index * 3 + 1];
> +		u32 method = sscs[index * 3 + 2];

This math would be nicer if you created a struct:

struct spread_config {
	u32 modfreq_hz;
	u32 spread_depth;
	u32 method;
};

Then you could use that instead of sscs.

	for (i = 0; i < count; i++) {
		struct spread_config *conf = &configs[i];
		struct clk_hw *hw;

		if (!conf->modfreq_hz && !conf->spread_depth && !conf->method)
			continue;

> +		struct clk_hw *hw;
> +
> +		if (modfreq_hz || spread_bp || method) {
> +			rc = of_parse_phandle_with_args(node, "assigned-clocks",
> +					"#clock-cells",	index, &clkspec);
> +			if (rc < 0) {
> +				/* skip empty (null) phandles */
> +				if (rc == -ENOENT)
> +					continue;
> +				else
> +					return rc;
> +			}
> +
> +			if (clkspec.np == node && !clk_supplier) {

Could you add a comment for this condition?  It's strange to me that we
don't iterate through the whole array.

regards,
dan carpenter

> +				of_node_put(clkspec.np);
> +				return 0;
> +			}
> +
> +			clk = of_clk_get_from_provider(&clkspec);
> +			of_node_put(clkspec.np);
> +			if (IS_ERR(clk)) {
> +				if (PTR_ERR(clk) != -EPROBE_DEFER)
> +					pr_warn("clk: couldn't get clock %d for %pOF\n",
> +						index, node);
> +				return PTR_ERR(clk);
> +			}
> +
> +			hw = __clk_get_hw(clk);
> +			rc = clk_hw_set_spread_spectrum(hw, modfreq_hz, spread_bp, method);
> +			if (rc < 0)
> +				pr_err("clk: couldn't set %s clk spread spectrum %u %u %u: %d\n",
> +				       __clk_get_name(clk), modfreq_hz, spread_bp, method, rc);
> +			clk_put(clk);
> +		}
> +	}
> +
> +	return 0;
> +}


