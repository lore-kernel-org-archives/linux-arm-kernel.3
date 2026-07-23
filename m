Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A4AC531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRGUmQHl/7b7JCzzCxB7rE09gTYSCj2H/Pm+6BbO0YU=; b=TBDyvXxYS+UYvCWM6XrRC+PPks
	JSntMFD2Vqqu14jeBm4qCnW1NvvC20HFMG6HOAbTmmrPam6/aZdyn7rKVG7qBGzDVPgdAyCI63rb6
	piTt4vqUJGVcKHU4sbthMvuI/t/aEoLRK0okX58uRx+xwHuMUsq6GnV5Su6YHtKVheoDvW1Q5zHQL
	6jC+Fzi6pneHDSTNcKFyQ16Wk9IEEBDLNGpbtDOwMyeOIu4UHOzUhRmhw/tECzRb8+s5+IGA5QwfB
	SZeXXPxkqlhZkYKIt8BuKGs9Z0wrLHNFl85UHe7R4roTNTMKmnzw8AoJTW4BaV+SUw0GTCT3lIMiY
	aEb4ddwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwVm-0000000Ejx0-2iQk;
	Thu, 23 Jul 2026 16:43:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwVi-0000000EjwY-3dE0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784824981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JRGUmQHl/7b7JCzzCxB7rE09gTYSCj2H/Pm+6BbO0YU=;
	b=h7nHr8p++PNMrtSWS70JJzVstgVR+1lzgcpkf5DH1Y36iGTBMjG+e93NbGabwaX8MA8Ncf
	Xa0ENWTs/GL4wqm0MXrdBo2ZGQ7MNXz37jINIDW5q93THLp/x5OJaU4Qg8YOThFnRGSdfh
	dg00wvrJE+YdIeUCM6C0WC/y+RQDYp0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-75tVX7dJOwuzvu-wExtZuA-1; Thu, 23 Jul 2026 12:42:57 -0400
X-MC-Unique: 75tVX7dJOwuzvu-wExtZuA-1
X-Mimecast-MFC-AGG-ID: 75tVX7dJOwuzvu-wExtZuA_1784824977
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f113592bf3so16825056d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 09:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784824977; x=1785429777;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRGUmQHl/7b7JCzzCxB7rE09gTYSCj2H/Pm+6BbO0YU=;
        b=ldUDguLPyRaXl0zx8m3jHthmzQQGtAr1mtcIoi/mZJSX5TGc6jCIu7AAV0FCUJjzXA
         ozwPKGVlm3ijwdUh+a+j9x3C3G66uteB3nWrhPhCj9txLimPqkA7dkLzs6Hc6Y96q6uZ
         Sdbwt5czzTgzizzp7uMrl9QIcrx5LkEvQQRTqZ5MSW0ojtuU8wmRwdmfAe8tegyqfPhW
         ZTNRrY6duUCKbELH9XIcaXC/BUpPi4gVW417RmN2gasYfNNYrS+oNt9a+x1EeQzisd4r
         +R6tllzLh0t7DWBvow5AKRPoE2YPdkTeioVeoVqiWAAcjAclSxgGzSCWC0pTd9sb+Obw
         OcsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rof3SMqGzgugfDfzzAHA9eM9c96TnaFa2xmK24VA+5eGLiBMunQs8p6Qf4uPcPOAqdb8ycIbkPNBQL1UcnB94Ez@lists.infradead.org
X-Gm-Message-State: AOJu0YzpTZ48AtPC+GeyDGkor6FpMmXb5whBvRKWyZqnmjOExIBWKn4k
	WxmYxHjTlka7UyttznPPUwZHfulsHDA/RI8b9DZaQwctXhsJ4/UOW+amZd+Wo1C4uIrDyTauHbD
	7ik9zbHh6iJ/GTDfJ8HEl1KoZZXlDN6L38Uki9t1m6qSA5DoYhBXGtK2Z4hz5/62uXKA2niuZLL
	GN
X-Gm-Gg: AR+sD10KHxRMhhQM5a05+fFy92SG/pEbZYynIgMKtxW4BIllk5eiyXHUi9A7eWK1w0f
	/wK04D0RppEvN13gWzhVR3+ice47SXOr/96SDfQtk+ADM13JiaIOuUoG6u+giRCSu4yH0PxXGed
	5vtJHS+Nz0n8c0AxQHfOXEiW0cotr7NiD/UIUeOmKnMhvhtW/bJmKkMeLYdoGWpG90lxpcUJAPi
	QfzBfp+9+wD2rcy9jAorVWKcG1BYnBZqoDD2sX17+TTKQ1mXlw+0j4sdkIdaHWpEjuQN4dl6kbg
	q6OHJJ//qkD1wUh0YESmx+fLrqbLPTpAq48MCMlhywf0ejKXE8u9G6PI5JD020w0l4ab2+RIGlf
	TxXm+hgrn8e7/IdBd9MJ9c6HMG5rcnS2iUCw=
X-Received: by 2002:a05:6214:3d99:b0:903:3469:98f0 with SMTP id 6a1803df08f44-907ca587d79mr47588836d6.26.1784824977034;
        Thu, 23 Jul 2026 09:42:57 -0700 (PDT)
X-Received: by 2002:a05:6214:3d99:b0:903:3469:98f0 with SMTP id 6a1803df08f44-907ca587d79mr47588416d6.26.1784824976552;
        Thu, 23 Jul 2026 09:42:56 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm48281876d6.46.2026.07.23.09.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:42:55 -0700 (PDT)
Date: Thu, 23 Jul 2026 12:42:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <amJEjofx348vF4Vd@redhat.com>
References: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
 <20260723090808.1727598-3-joakim.zhang@cixtech.com>
MIME-Version: 1.0
In-Reply-To: <20260723090808.1727598-3-joakim.zhang@cixtech.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YxN7oSliD9IxVK6jb_Wl7TVn-BuCTLOjUlYkCD8g2js_1784824977
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_094302_994175_3569BEB8 
X-CRM114-Status: GOOD (  16.29  )
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

Hi Joakim,

There's one question from Sashiko that I don't see where you answered
that seems to be legit.

On Thu, Jul 23, 2026 at 05:08:06PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps
> the CRU registers and registers mux, divider and gate clocks for
> DSP, SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.
> 
> Four SoC-level audio reference clocks are enabled as inputs to the
> internal clock tree. The driver releases the AUDSS NOC reset, enables
> runtime PM and instantiates the auxiliary reset device.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>

[snip]

> +static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *dev)
> +{
> +	struct sky1_audss_clks_priv *priv = dev_get_drvdata(dev);
> +	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
> +	unsigned long flags;
> +	int i, ret;
> +
> +	ret = sky1_audss_clks_enable(priv);

From Sashiko:

    [Severity: High]
    Could this result in a deadlock? When a consumer calls clk_prepare on an
    audss clock, CCF acquires the global prepare_lock mutex and may call
    pm_runtime_resume_and_get. This triggers sky1_audss_clk_runtime_resume,
    which calls sky1_audss_clks_enable. Since sky1_audss_clks_enable executes
    clk_prepare_enable, it will attempt to acquire the non-recursive prepare_lock
    again.

I found drivers/clk/samsung/clk-exynos-audss.c that is similar to your driver and
it calls clk_prepare_enable() in probe.

I'm not concerned about the other feedback from Sashiko.

Brian


