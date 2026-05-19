Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53F7CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrmbyndpK9nGCZ/GyDIT140wuqKj2glshGplDtAamKU=; b=0C8FL6/xK/DQk+IePg5tk9W0TK
	fUHPUrB83iV02DIPI0povwbYAQnWPHE/TGbnNfjY1b1AH2WjUj/eSf8R5VWcwu1CiLVHTvMlv5nNb
	Zd5B8WhbDQhgoqVb3D5zBGiJ6FOqdMDwlDc24hlF+fW8HsjniljBQvAfU08JpmU9jqd4mwlDXzSFb
	rt7JmmCM9czswI97F0nSzxhvmSAbks+2DDzjcjI1eofcSI3qYmVy5png2z1P8DonKWQJCegtyuvVp
	AqWtVcrx3YQA3QTiGgjcNwTLlekzVRBb1ALk3/Sw+M+VuKcBHnbLrgL6WmLan0gaj9ySiPqi8nY1r
	Y5JYFU9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLFs-00000001nC7-1mIy;
	Tue, 19 May 2026 14:17:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLFp-00000001nBU-42j7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779200224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WrmbyndpK9nGCZ/GyDIT140wuqKj2glshGplDtAamKU=;
	b=itIgTz/+wv8tRREe2ADoqvkwLffglWOzvL2yh0o/9WQMx74qAfzNUJsnAURDQ4kyT6EkAc
	cihJ2k7oVIhBuI1SHaam8GFAsevxJqsr5c5wIPLGJhey2epRxDbA9tkWY1BeGZUr/Pgdlv
	jptw8tNrO6ctcncQXcYvd2Om9Aqkov4=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-ocTJV9BQObuS7WiZuOgWEw-1; Tue, 19 May 2026 10:16:58 -0400
X-MC-Unique: ocTJV9BQObuS7WiZuOgWEw-1
X-Mimecast-MFC-AGG-ID: ocTJV9BQObuS7WiZuOgWEw_1779200217
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-69b8c3e1516so7674561eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200217; x=1779805017;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WrmbyndpK9nGCZ/GyDIT140wuqKj2glshGplDtAamKU=;
        b=PMqtrcFVdrlkrDyqKJflAoOFt12G/N3J5p6jbiCLj6B283tGAvtCyOqT5eKXlabg5y
         hI72ti/us0cUKNbtGkSzccL7A+vQbWWoQ2CVSULr1bGTaxiJ9e8o6/DrsTg8gcXFYhyY
         IHNyPvqhkKoE/q5yamjVnfK+x19ZFWrosKKtM/X/RYvzhhaWxxvNTvP1Uu4abXTCI9PM
         higR028pcsNtbFMOaETLroJf+Ak0pT8DU0QTjKo4hmroIaldi3lHPtezaDUPjIRValZg
         0omozUpeNajXSsAx9mE6WiQU41bK70NbU1jSigPqDOmTAuImq7jKtBqVQvfDm8/Vs6sh
         Pj3w==
X-Forwarded-Encrypted: i=1; AFNElJ9Ps0tY6P6xOoBlw0SHSS8dovvdWvhIuWVK5uNS80lfy3SaFLRz6lUUzEGRTHe+B8koAugn/PvZ6xNvWWWzq2PP@lists.infradead.org
X-Gm-Message-State: AOJu0YxOYFweQmXU8xrweQBYtSF0olRqwECddZzw3avwTWICmRf0dGIE
	ucKIR3y7h09j1cPAsJ8bDtTuryTJheXrqqWlJQXon+QUHJcyKNful1S9Fs0MHynYnRKMWdROlrX
	BPE9GrCdz8EfPH3Sd01F90hyZmCjCIRzcMH2s/EGOZVspoc4CxJMajPpqJ/VTL2bkTY37xJfXk8
	7J
X-Gm-Gg: Acq92OGzC1OykviaNTByHuZa1m9VSdrOgIWqkwa68kWEBa6sHwwYsLLWHiv1tCFHoJ1
	ynvjrKalxn0pq7zLHTgvTQj044TKIbyFSYOuRTYHcUh3or7/3IdtVw+rLVlkBcGTS3f8HUsKumF
	5qyLzel2thmjWDogZiOSiEfb8ym+ZzA+ffk9QH3OUjWlEdkJKvBFdrRFi/dfjqCdhBoHtSVhRhg
	PGUWxN2OtkV2MidpWbT2Qt6Ec6n3Po0jv6zOTtJrLMOHc/UyVc4+NW5bTxnpmiHJYGVlyT1KH+P
	msOm2RrNgmkS8eJ1kQGpSEfsy5+YdGkdaY6l0UtaXLkExicYYTeREWP81mV08/vq535Ns1gglVJ
	Jf/99ZR7jdF9afQINIqwKZ6kyY3cn1qZg7XBviEnwd60EzOM2ucTG0WNB
X-Received: by 2002:a05:6830:4704:b0:7dc:e090:68a with SMTP id 46e09a7af769-7e4de651649mr13481229a34.0.1779200217232;
        Tue, 19 May 2026 07:16:57 -0700 (PDT)
X-Received: by 2002:a05:6830:4704:b0:7dc:e090:68a with SMTP id 46e09a7af769-7e4de651649mr13481185a34.0.1779200216870;
        Tue, 19 May 2026 07:16:56 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51645856d4esm163498791cf.27.2026.05.19.07.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:16:56 -0700 (PDT)
Date: Tue, 19 May 2026 10:16:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: Use of_device_get_match_data()
Message-ID: <agxw1glcXB2fpA-s@redhat.com>
References: <20260519003950.626727-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260519003950.626727-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xImYcxESw3ejRFvA6idcUsG-RlOsIXLKmqQDwGb0kls_1779200217
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_071706_118615_971E5AE5 
X-CRM114-Status: GOOD (  21.30  )
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

Hi Rosen,

On Mon, May 18, 2026 at 05:39:50PM -0700, Rosen Penev wrote:
> Use of_device_get_match_data() to fetch the RTC CCU match data directly
> instead of open-coding an of_match_device() lookup.
> 
> This also lets the driver drop the of_device.h include.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> index f6bfeba009e8..a3cf0dde05be 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> @@ -9,7 +9,6 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
> 
>  #include <linux/clk/sunxi-ng.h>
> 
> @@ -353,14 +352,12 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
>  {
>  	const struct sun6i_rtc_match_data *data;
>  	struct clk *ext_osc32k_clk = NULL;
> -	const struct of_device_id *match;
> 
>  	/* This driver is only used for newer variants of the hardware. */
> -	match = of_match_device(sun6i_rtc_ccu_match, dev);
> -	if (!match)
> +	data = of_device_get_match_data(dev);

sun6i_rtc_ccu_match becomes unused after this change. It'll use the
table associated the dev from drivers/rtc/rtc-sun6i.c.

Brian


> +	if (!data)
>  		return 0;
> 
> -	data = match->data;
>  	have_iosc_calibration = data->have_iosc_calibration;
> 
>  	if (data->have_ext_osc32k) {
> --
> 2.54.0
> 


