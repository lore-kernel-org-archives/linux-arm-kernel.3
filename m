Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12332C43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 17:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mloHFD8lHRGWc9buHYqgCWKHRZzcSqlxB20ESS9JMes=; b=HWt8oBnlney/ORGXL1wc/PZsd+
	MwaYOf34WVhzn1QfyRM7FwxhgRTirPiyuRAcjNmsioYaufjkIrf6xbBWrlRfB4Tu/DYXl6Gdtfory
	HEZaR3Dyqgu18BYZ79Uo9cMdBOD0PM6nghP0HfXaRn4XFDa8Ljl0Bx8hCKXj/6rq7hWosmg4LdFqF
	+xTcgHggwYN0JAb+N5TH+Fk9IjD/E1yRdmiMZ+vmUgwlOp63jYY3i4Z0Olaw/pzFZhPktleLgyK/p
	OZNtUAypGMbyj1TlAegalArnrQZPbbjXMxUnRUSmYX4jbOzABaDWswQHW661LGpxTSphmvobWmCwO
	8oUYuxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFZS-0000000FHvY-17ax;
	Mon, 29 Jun 2026 17:14:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFZP-0000000FHud-1noo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 17:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782753293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mloHFD8lHRGWc9buHYqgCWKHRZzcSqlxB20ESS9JMes=;
	b=YutsecaVbGS/9sQyKUzUocnQaV4Syj349CEp3rzXiXQfvG0L/4bjgumyl9kYo/bKU0BwfS
	DOtsguJJu5rcLlC3fVOD0CL0SyNvoXswy7CrtDZTr0R4fpjX9H5D0K+fmi5Tv93w8kkf5K
	o/bMPMtkCGJTYELVSHpQCwi14dNlx4k=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-dJj4e9YnM9-zoxAFbfSEiQ-1; Mon, 29 Jun 2026 13:14:51 -0400
X-MC-Unique: dJj4e9YnM9-zoxAFbfSEiQ-1
X-Mimecast-MFC-AGG-ID: dJj4e9YnM9-zoxAFbfSEiQ_1782753291
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f08f19552aso11659856d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782753291; x=1783358091;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mloHFD8lHRGWc9buHYqgCWKHRZzcSqlxB20ESS9JMes=;
        b=VAy5mpFP8iui0sJiJC14WU11uf+Ppj9sxuidETlG6K5WPWbXVQzDU2yDevNBFe8FdT
         OBbzl56e8b/hPfFQDyWNezKbIJyOWKqB9A5lWLhY/aqDgwnmlgbw/zuwBFglB5cqZyNz
         msll7G4uC5NBPeWqt8E3iVKNSvFxzYEhxon53AIJnveoHuVe9bwqi4iJjgKbMLauUoSW
         SlzgraeA1FtefJuJh1XrDsaAuvkgtjLFsjExWJmuQCka8jEyuPtIboU8gnwfBwqZB0BH
         0Cjfq1eIG/SHxvTeYV5de52VccQldyxIC1wi5m8dGAnjphSw2OjN5vgR0XTtd3hOWf2t
         nHtA==
X-Forwarded-Encrypted: i=1; AHgh+RqqF09ehrhaVSbGaZYAmu6pHzNwyR0CBHgS92Xj8Ff8L32vapZAGxcsgSuwkTVO1lP9iMkHT781TyQwszt5l3EK@lists.infradead.org
X-Gm-Message-State: AOJu0YxApBZjSspEJte5G+lW9uAs+GsPWqe3BkQ+5N60CZmgBcGFf9zG
	cVcJI2k0mVQVL6pqmLeUJi/44gplRbr8/6nX4RpjJ8vNxS4eS/Phgp3L+XEh4WZEnauP7R1w6O5
	xVppGuZQ9OXXUnC6pxZMinA7q3/oalHzKQKE+38kYIcUqMbT5cf23WwhkqwmvkMUkNnSmLIwzyX
	S5pNEDfUOn
X-Gm-Gg: AfdE7cnGUaI24/C8TwBc4sMmr4cR9Bh9Lnf2z3FSsQBlHMLlZgoMOfsTkVa8s49ZdXa
	ljTRTZJlrUQ120Ub1zZmNHjLfJ6YF+93WyfBlspXB3nmB6gN3PRY71bXKgNDreSHdlJ/02FZeeH
	xcesKhAwlL0uHXnTkWv5KtqnPpFeSGExH4cbtWyGap8bByGasD27P+grWIVcbBT55v9eQdoNVse
	E4rIV9OuyWawkfub2Ecg4HDRSdWFg2Qe+9NLa3XDTpuDm7cYH17+/o6bFQOaq94rOpmus4pgXU3
	yvjNdvuKYJapV6d+mCwX+RioPFMdH3AVTm2hiX25zB/G9LASAbCmtEbn2f4DS5lyfBy9/YG2ECX
	gu6i0slowhL+/JJ/DJ0XLK+hf1H143QsXuKEARm9UMT4+kw==
X-Received: by 2002:ad4:5ceb:0:b0:8e9:f62b:8f9c with SMTP id 6a1803df08f44-8f1be38d9e3mr1780716d6.49.1782753289829;
        Mon, 29 Jun 2026 10:14:49 -0700 (PDT)
X-Received: by 2002:ad4:5ceb:0:b0:8e9:f62b:8f9c with SMTP id 6a1803df08f44-8f1be38d9e3mr1780026d6.49.1782753289258;
        Mon, 29 Jun 2026 10:14:49 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a736d5fcsm2694296d6.39.2026.06.29.10.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 10:14:48 -0700 (PDT)
Date: Mon, 29 Jun 2026 13:14:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: mvebu: ap-cpu: fix missing clk_put() in
 ap_cpu_clock_probe()
Message-ID: <akKoB3CV6AtEQBVu@redhat.com>
References: <20260617014126.1716291-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260617014126.1716291-1-vulab@iscas.ac.cn>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C2raND9hTpqblG5BQumHVfzsuUx8iZUWV6oCydibQsg_1782753291
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_101455_543410_9B2E8466 
X-CRM114-Status: GOOD (  28.33  )
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

Hi Wentao,

On Wed, Jun 17, 2026 at 01:41:26AM +0000, Wentao Liang wrote:
> The function ap_cpu_clock_probe() calls of_clk_get() to obtain a
> reference to the parent clock for each CPU cluster, but it never
> releases it with clk_put().  The returned clk is used only to read
> the parent's name via __clk_get_name(), and the reference is leaked
> on every successful cluster initialization as well as on the error
> path when devm_clk_hw_register() fails.
> 
> Rather than adding clk_put() calls, replace the of_clk_get() +
> __clk_get_name() pattern with of_clk_get_parent_name(), which is
> the intended API for this use case and handles the reference
> counting internally.  This matches the pattern already used by the
> sibling drivers clk-cpu.c and clk-corediv.c.
> 
> Fixes: f756e362d9384 ("clk: mvebu: add CPU clock driver for Armada 7K/8K")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> v3: Replace incorrect Fixes tag.
> v2: Replace of_clk_get() + __clk_get_name() with of_clk_get_parent_name()
>     as suggested by Brian Masney, instead of adding clk_put() calls.
>     Also correct the Fixes: tag to point to the original commit that
>     introduced the leak.
> ---
>  drivers/clk/mvebu/ap-cpu-clk.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/mvebu/ap-cpu-clk.c b/drivers/clk/mvebu/ap-cpu-clk.c
> index a8175908e353..1cf63c7a0bc3 100644
> --- a/drivers/clk/mvebu/ap-cpu-clk.c
> +++ b/drivers/clk/mvebu/ap-cpu-clk.c
> @@ -288,7 +288,6 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
>  		char *clk_name = "cpu-cluster-0";
>  		struct clk_init_data init;
>  		const char *parent_name;
> -		struct clk *parent;
>  		u64 cpu;
>  
>  		cpu = of_get_cpu_hwid(dn, 0);
> @@ -304,13 +303,12 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
>  		if (ap_cpu_data->hws[cluster_index])
>  			continue;
>  
> -		parent = of_clk_get(np, cluster_index);
> -		if (IS_ERR(parent)) {
> -			dev_err(dev, "Could not get the clock parent\n");
> +		parent_name = of_clk_get_parent_name(np, cluster_index);
> +		if (!parent_name) {
> +			dev_err(dev, "Could not get the clock parent name\n");
>  			of_node_put(dn);
>  			return -EINVAL;
>  		}
> -		parent_name =  __clk_get_name(parent);
>  		clk_name[12] += cluster_index;
>  		ap_cpu_clk[cluster_index].clk_name =
>  			ap_cp_unique_name(dev, np->parent, clk_name);
> @@ -328,11 +326,9 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
>  		ret = devm_clk_hw_register(dev, &ap_cpu_clk[cluster_index].hw);
>  		if (ret) {
>  			of_node_put(dn);
> -			clk_put(parent);
>  			return ret;
>  		}
>  		ap_cpu_data->hws[cluster_index] = &ap_cpu_clk[cluster_index].hw;
> -		clk_put(parent);
>  	}

This doesn't apply against Linus's latest tree. It looks like it's just
this last chunk that's the issue. What version of the kernel did you develop
this against? The last change to this driver upstream was from me in August
2025.

Please submit a new version that applies cleanly upstream.

Brian


