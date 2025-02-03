Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC294C02195
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 06:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBpu38zoJhnbBuVt7xq5HkK4w7WkM2eVS3E6Ag+EQIY=; b=IZREeP/DOtKMH5KVmIqoBQpKln
	ZO6f03TjTfdNR0Wzf2EB0T8VhRyunPUWCkBGCyAJR++f3EyndLrWsA/CKLTtFwdX/sBeZ81vjoQoY
	4ngR+/bZn5oilkPf5FLP3evHH5lI7JgZeBIZ9/UMCcgsu4OaxNxUwVejyJ0vkyHCLpK4b+qwLnPMk
	sCSoa6W90qgsF5fVrfBuBcsNixpNv/lBM+9aAxoMW50ZST4ZvgTRpvn/2XjV9duSa+HI6IgiwZ/GC
	r9cV4EubyiNrj9CJs2AtmRqYWknC1Gd1tFZ6OgkQeeYFHVZnvKG6n98rhWGN+SN5NaC5PB44BYwqb
	88esI8UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teqQ0-0000000Efzw-3QcC;
	Mon, 03 Feb 2025 06:58:52 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teqOg-0000000Efw9-0meJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 06:57:31 +0000
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=fksuOLyU;
	dkim-atps=neutral
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 980A94CA
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Feb 2025 15:57:28 +0900 (JST)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso7838080a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 22:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738565847; x=1739170647; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KBpu38zoJhnbBuVt7xq5HkK4w7WkM2eVS3E6Ag+EQIY=;
        b=fksuOLyU8JQ+afejSL2vN+MMVDZ+gBy0CR0qvnKqJVhO1CCi31Y9Zdve/eD7nnFmrg
         GnfV76AA43+Z1YNwKgR/vJTxaI+GhHJu829i+Itd8KaOAmxso5ceov3P7rbbNJTCr9a9
         RIcznXwQ2cdXDu6N6fV0ydlCxRSqH0Hp19R5xurX5dM4O87HTcEig82vMyv4VLCTAe2L
         KMKZCwERf3cZE3tygj39BKmjRSP/22FgKFM+rg36BfYPXFVXbJtcJGvAlQcrleL9SiT9
         DYActHTqlbpKCk1nWOgbOaIlwtjhJkyVxsMVfkXXR0mFscAJSIGrugzPsBwHJFRUY49t
         9aFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738565847; x=1739170647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBpu38zoJhnbBuVt7xq5HkK4w7WkM2eVS3E6Ag+EQIY=;
        b=gcZ6MWHIjJ+E98TaY8WgZZgwrxZMTpREgY7r44jner3u5cD4WFwYAzzcptmq+EyaDj
         RBkxLIbP3XtYIcU27hkfsZMr+zjaH8GZqH/20LG+bLTz0WoG3hXN341r/JJBUs4/DQRr
         siL5W/wCXFh/OTIpzET9hpduk8ptSfSN2SJ0lo3/UUoVXij74uWiRn5oI0qEJJ/1Cme4
         kBwOS7nnQ8Ta9ADJnyRX661ub+aukF5kvtxI0Jq/pkwv0TunnZXGPSwf9Hdt1EK+sY6T
         geG3X5lbBo+aSs7PvTHHtr+SQrvmVS7jor75+BRPO1g0n0rvUQ0sMIJtiT9LlCvKZnM7
         kctg==
X-Forwarded-Encrypted: i=1; AJvYcCXnpD20qaUMTvmSroJgsQ2Fnyx8JOeb/n0Oj44QCZWzE6EqmBJB7l8hvuwrkDozEKQQAfttPrdwfAP6Hmi+fQhv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2TVRu17VDuycp0+Jfytwo7ejVyB6RGhmpelGINIU9l+TbF+yp
	BlbgoUWy/bkeEDFqWrgyA5uhnPkkJ75fWUTWuL/CoqKocyFokHUzz1bAZWX8Vhsmqhrj6qa12hV
	pHuLcaSOQuL6aZfLI7g5BnBWZDnKde4Rwlo/FbjwNg+4JTH1Nc3uUnd9RDD6pff3BrAoDkO7tyg
	==
X-Gm-Gg: ASbGncs+gBBwVf3aP17HtFmR5LanI7SVIxqVxgVuDlafWiXR1/CwGXZMDInFUAsIb5i
	kATF1eBG7SOlp5bDNelxFwR3Koq90qof0ylkAmB/xTRRbAG8UXMhBxxmZvqud2eAIAAHadW0SFv
	GdShWaOkb+IPLzB1CtLs+sz0dXmeT2JTVrCyzBZwF8JWXnkNKjlIlQbcgJowefFXEKn2L4D9P2g
	sFuGZm4qYGoImfGcVF6yny8Sf8dMsoV+7ReCBlzKIYEviIS9Q8qW0sbuYrZ2MtuKX0JxinGyNyz
	wrGqfCJjDTL2xzbk1RMI8AeO0Q8sc/jM/xYOXQF0yR01zbTm2LKkRNBPXE/xBAFm
X-Received: by 2002:a17:90b:2c84:b0:2ee:b2e6:4275 with SMTP id 98e67ed59e1d1-2f83ac65958mr26047455a91.26.1738565847621;
        Sun, 02 Feb 2025 22:57:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeQG0nwmZr51/0vcXCzKKQK+KfHdJ43jCCy1lp4o7bkMpfm/h39HEEtpxsyBUKAvfYNo9pgA==
X-Received: by 2002:a17:90b:2c84:b0:2ee:b2e6:4275 with SMTP id 98e67ed59e1d1-2f83ac65958mr26047432a91.26.1738565847216;
        Sun, 02 Feb 2025 22:57:27 -0800 (PST)
Received: from localhost (162.198.187.35.bc.googleusercontent.com. [35.187.198.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31efbcbsm68878385ad.30.2025.02.02.22.57.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:57:26 -0800 (PST)
Date: Mon, 3 Feb 2025 15:57:15 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: phy: mxs: silence EPROBE_DEFER error on boot
Message-ID: <Z6BoyybpbaLet6jf@atmark-techno.com>
References: <20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_225730_343391_1ECE68F8 
X-CRM114-Status: GOOD (  24.78  )
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

Dominique Martinet wrote on Mon, Feb 03, 2025 at 03:32:05PM +0900:
> Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
> [    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517
> 
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> ---
> Changes in v2:
> - removed redundant error message and now useless braces, thank you for
>   the quick feedback!
> - adjusted message alignment (that was also bugging me...)
> - Link to v1: https://lore.kernel.org/r/20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..39b75199d11c6f9ec21174c20d0465cb79c133fb 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -769,11 +769,9 @@ static int mxs_phy_probe(struct platform_device *pdev)
>  		return PTR_ERR(base);
>  
>  	clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(clk)) {
> -		dev_err(&pdev->dev,
> -			"can't get the clock, err=%ld", PTR_ERR(clk));
> -		return PTR_ERR(clk);
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
> +				     "can't get the clock");

Looking at the usb251xb patch also made me notice this is missing a
trailing newline, but I'm surprised because it "worked fine" (I don't
see garbage at the end of the line in my dmesg with the old 517 error)

There's no other missing \n in this file though so I guess I'll just
send a v3 in doubt, but I'm now curious if it really is needed and
couldn't find anything about that.

Anyway, sorry for the spam, and thanks for the quick review earlier!
-- 
Dominique

