Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB34C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 20:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBmxobDW/MHje2f4xBTmx9aIBxPjJtJsCEI+DZFs4H4=; b=NQx+KlZ8UygSUC+teTYJ6E1hgO
	EMpRguwLtpjbts3nWOrp5a1IV1OhCwwNpER2EYU0C/QYKNyrFREKsXkBMuqz9qnG3ZI0nrHRAZYQz
	7tuF+9sBBLebtqBy97FqQy4hMEYhwowKSDzQ5jQtd/I2BzdUTxsRwBT6hkaLN+796RgKjRvlMbrmr
	OabTfOSUoU9dM9/PmOL9cimWqCf3BoopRtzYLIKr2vGT8MnCk7D4jyDJhzLdLhczbdlQ8m8cJ0XIm
	HJS0AoJghIjLN79XZDQmJFDYbbWSCnpxYNUzamq6zrFK3/HB2/9c4oMK3k/MxUFCHjGKrEFo6dkLo
	CJE6lfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpVb-0000000DWiF-4BLP;
	Mon, 06 Jul 2026 20:01:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpVY-0000000DWhW-43lk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 20:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783368095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JBmxobDW/MHje2f4xBTmx9aIBxPjJtJsCEI+DZFs4H4=;
	b=csDsfXS8I1UfzI/MbvtARWHu9vsvttxlqvLr1wY0YAYAv7l+XAiAuYHmMIJGYeDA/lxmSQ
	CbVaomcWFLLXjArsOi8i0tpDKz260Co9//AkqtAa+ePgTsBRUf3iuVl9s27YAIXqyHobi9
	xrWMoSB6Gpf5Eje+B5PIQ5nKQg0XatQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-Lvzuw82_Pou4fgtpg6giEA-1; Mon, 06 Jul 2026 16:01:34 -0400
X-MC-Unique: Lvzuw82_Pou4fgtpg6giEA-1
X-Mimecast-MFC-AGG-ID: Lvzuw82_Pou4fgtpg6giEA_1783368093
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5939so345413585a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 13:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783368093; x=1783972893;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JBmxobDW/MHje2f4xBTmx9aIBxPjJtJsCEI+DZFs4H4=;
        b=IviMOLTGWB8turXbSgT3qOPyyznsCNDIm2QzGMMfWBEujWQOeuIvxPq0b7EW+w5ubD
         fRcIJE8OgXjRLlD5P+TOOD87AQJBOuAxPwj8xN6GTfQIz0bbLx+8kzT3nLclljA6VzRf
         UbzJQt0Q+BiOsL5aa2d9H7Mu1Dn6YXDGDWe2dreq/sAWAlIWWZ61x7gSpG+WHXvTo6DS
         HCKwmXf+NynG6vcDBMf/2Eo5Lc876afWld+glBADykAWMSA8VSBlQpky+/K3zBApSkKx
         g9PQ+M/NGJL8AWfiAR3Hx9RNLjrPNJi8FKrpdWJigl6mnLedxqMn3wSpw2bPZ77rZsk4
         LcsA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+jLvOwQGBzL9uYwDxVFF0AWzLqfCON9OSQkKmQiKowZNYmLWiGN7H1TpMquOPe4Dd0d/xEF3kQOE0kryOnQIf@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ0nvGkGLybgxQxVdNZgWyhRHdoi06k7ADRi/W0+ltkEZ3bIBu
	dMc1yp2yCGTrnUp7a92TrieOVOS9cKyWq+sZ/TvypmoBLkHX0ussYB3mmryfrKLeF1Y9cuw78QN
	yXjaZaBoXuGEvJ7OwNovDLnBTn5cZDhwZmI/lmG2RTw1fMgDMRKRGI6BTC/jXMqiJHmwNkD/7le
	RN
X-Gm-Gg: AfdE7cnl52XDCKgPadxb/HJA4kdYm91ml5qWNaqLpuzqAsuFmDJHbPyjL5jLjOozBvR
	2vC2WD83XdzHE+rPBHEq9yWiYkwcxN3URxXMnhtAl0GzvJ8qVv3UKv46IsxJKXgqSwr8iooOv1h
	X64O09VWuXEbuSNm5JO7aItPIv6wbRLfzslw6EvBvRB6zi1JqYPAT6tyor5ieneOwEZPYNOyXTw
	OsV0YtT7kNGzVXYHWLqIbGli6Fvav15H0Zp3nr4lYS9W8E5A4NjCV112pQLgz7z7mCgkVbnVnRQ
	Ummsmo5hdfU3uTQCIGJQkJe88jf3MGMAcUSAFmAdBgEDKSR3TJpBwp3mH1rCWFFEBshPisfW1q+
	Yvpz80v4ouWTUcikH6qznEEihqduWBYcE//8E34quIeoOAw==
X-Received: by 2002:a05:620a:170c:b0:92e:9cb3:3f71 with SMTP id af79cd13be357-92ebb56bfa3mr271399685a.36.1783368093391;
        Mon, 06 Jul 2026 13:01:33 -0700 (PDT)
X-Received: by 2002:a05:620a:170c:b0:92e:9cb3:3f71 with SMTP id af79cd13be357-92ebb56bfa3mr271386185a.36.1783368091707;
        Mon, 06 Jul 2026 13:01:31 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b81342sm1006981285a.7.2026.07.06.13.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:01:30 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:01:28 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] clk: mediatek: fix memory leak on module removal
Message-ID: <akwJmKqZJS1sJzFk@redhat.com>
References: <20260629142348.273766-1-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260629142348.273766-1-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k4HEtZl3P2jYOgn0-VybDIGJp1uUT16akK1mIazyZLA_1783368093
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_130137_080208_8E4A3DBF 
X-CRM114-Status: GOOD (  21.31  )
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

Hi Akari,

On Mon, Jun 29, 2026 at 11:23:40PM +0900, Akari Tsuyukusa wrote:
> Some MediaTek clock drivers do not call platform_set_drvdata() during
> probe(), but their remove() callback calls platform_get_drvdata(). This
> results in platform_get_drvdata() returning NULL, which leads to calling
> mtk_free_clk_data(NULL) -> kfree(NULL).
> Therefore, the actual clk_data is never released, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
> Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
> Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
> Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
> Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
> Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt6795-infracfg.c   | 1 +
>  drivers/clk/mediatek/clk-mt6795-pericfg.c    | 1 +
>  drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt7622-infracfg.c   | 1 +
>  drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt8173-infracfg.c   | 1 +
>  drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 1 +
>  10 files changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> index 54b18e9f83f8..24522fc24019 100644
> --- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> @@ -129,6 +129,7 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
>  		goto unregister_plls;
>  	}
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;

Please add a newline before the return.

Also, please split each fix out into their own patch to make backporting
to downstream kernels easier.

Brian


>  
>  unregister_plls:
> diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> index 123d5d7fea85..b607592a7c37 100644
> --- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> @@ -175,6 +175,7 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
>  	dev_dbg(dev, "Performing initial setup for MD1\n");
>  	clk_mt6795_apmixed_setup_md1(base);
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_ref2usb:
> diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
> index e4559569f5b0..12146bb3b726 100644
> --- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
> @@ -116,6 +116,7 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_cpumuxes;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_cpumuxes:
> diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
> index d48240eb2a67..28faeb2e657a 100644
> --- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
> +++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
> @@ -125,6 +125,7 @@ static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_composites;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_composites:
> diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
> index 8a29eaab0cfc..a9fc2e5536b3 100644
> --- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
> @@ -109,6 +109,7 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_gates;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_gates:
> diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
> index cfdf3b07c3e0..b44baf521d2f 100644
> --- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
> @@ -90,6 +90,7 @@ static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_cpumuxes;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_cpumuxes:
> diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
> index 19e4ee489ec3..41e5cfbcbb76 100644
> --- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
> @@ -66,6 +66,7 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_plls;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_plls:
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> index d7d416172ab3..fe36d2eac3da 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -179,6 +179,7 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_ref2usb;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_ref2usb:
> diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> index fa2d1d557e04..b923b73c64f6 100644
> --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> @@ -128,6 +128,7 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_clk_hw;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_clk_hw:
> diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> index b0563a285bd6..446c55b77777 100644
> --- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> @@ -176,6 +176,7 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_gates;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return r;
>  
>  unregister_gates:
> -- 
> 2.54.0
> 


