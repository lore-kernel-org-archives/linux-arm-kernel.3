Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6734E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 14:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tZ3oScaXADgh2YYICTmnLAOe1Prw/82LWnlm+aUpE8=; b=OqaCV/hSzE9+u/4P/MM3xe7MJU
	Lp7mYZBel8AGTGIVJ3wFxUT6To+k3jBbgVWX+TTAxUyK/LuCnyCeGvKzX3nLDRdKDYPKe7QfwrGkw
	LSmKLZ6yYjjz+M8UvJmxBquspjZFw6WUGieOmYswMx0P6NnLrfHTCmrflxmxlWmHCzteNzO3mIr/Y
	7PsZhSuXRUdcdxJwfa+vPGlwPQ0UAAFdj5a71rygr1I38yoNtl8MaWAtam2OgECLCWY8eYQjXSyyr
	h7kl0PNQ89IpVTDYGdCGYqmi+02b63MdM0aPf13do/oMHZ9xQUN4JHeeSaxjzq2iBcb1bE6tutbqH
	wc9n/f1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNx8-0000000FBTE-27DJ;
	Wed, 11 Dec 2024 14:44:38 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLNw4-0000000FBF5-2QJq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 14:43:33 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38634c35129so3302879f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 06:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733928210; x=1734533010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8tZ3oScaXADgh2YYICTmnLAOe1Prw/82LWnlm+aUpE8=;
        b=nGoXRoLI7CrTQJg7IkSDsLLCQ/jMopZn/wgW1ZZvwYUKvv24JpS9zc4PIkliNlLZRE
         5qLcWnKOkYWXUMojEzNgSUqZ4aS4QVLFKpwoGPbOnQQYeMf6NnbRtxws3Qh5ODAdtEK7
         tQkXXkAG027yx8ptutCDMgXsxQ7z+2vUYf+W1DEED0PMl32wTglw1SImes6f1508T+QT
         mHToqLjGrdZEKBJLElnct+D3BD5IB6Uk9MGFDpPcNREtHy3Rqr4zmiNfGVeLjAxK8dvB
         jfPnRmMBP1hPw/W5Gv0KAVduKXe6Ne4uV8LaiiCopLgNgU9z44xQ5aUcKoq3WYmx9wNl
         fJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733928210; x=1734533010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tZ3oScaXADgh2YYICTmnLAOe1Prw/82LWnlm+aUpE8=;
        b=NXEeiZQzvzZI9Fghy5sPTM50WtiQdwH1d8/0gLruf9iNv0DJ6aQeuy5Ky6Gw5JmBvx
         qNCj1rFF/NTwduvdUDX+DX2p/ZtbKylUopgbA+tYks25mKowSVkYX0pXtRvlG4q5Rxdm
         j+vaW8A0jYH7Owik1PMLkPR6QzPluSTtq0s+rErSCsh0NXpRFNxi4tJGc+8Vzr3Ef54O
         xgdYH5myfMZM26db/2XkHhNbXLlso0IOpUQDNgankZV8TpYjz5ri+H6CUhMu8hMZwJSf
         dUCJkr/OyArsuxq6OaHuOhyYv40OVib3y0ukjG/rvVod5Pgd5Cp26RWnbrCJuLhKCo0m
         pL/w==
X-Forwarded-Encrypted: i=1; AJvYcCUGjYiKLHZeUoDzYKhALoEvqtGcBXsqcQtuYItk05DYp6GA3LDzXP/qq661QIilTfE9V3upCj2stUpgXZprj6bM@lists.infradead.org
X-Gm-Message-State: AOJu0YyXQbvPsK3TtnEfXenFd+zWTvRv8Tgj7bgPHOYkw8YqJP6Heo11
	OAgXvZOu+mxsZbkI7GIuwmPRdes0dxDLs3koOLuMuFz1TQzkLFgNJAoVOuNvFM0=
X-Gm-Gg: ASbGncv3ufvCNugIpfbBQJMQvRMVjdl5e/4xEP5y2WodH+RyWf6FmOoVN7XCQuM9MBg
	birQzlMU4dWUcKdVr8eC7soQ+RS3xja2tHKySAbQ0ApH2PyP3mzB3HuZ6zj06El2+E8pBe3xuDY
	COsGcDrmzoGVA+4Vg2DmSxL1hmL0K0HR7soZ5auczSPohrNAuzWnjj10OZlj3ekONix40OYAqGZ
	WQj7OMsU9PYGQ5XBK5YtSM1shrvryCZEBLrYkrivb/5sryECPMegQkOCLY=
X-Google-Smtp-Source: AGHT+IGhBl9kYyiFJWrrIA36GwLyBYxcBdJzLqLa3LCOZD0jb1flkcZBqM18kbs7vv5xS6DGb2Iuqw==
X-Received: by 2002:a05:6000:2b0e:b0:386:8ff:d20b with SMTP id ffacd0b85a97d-3864ce9f344mr1998729f8f.27.1733928210457;
        Wed, 11 Dec 2024 06:43:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362039a474sm11589855e9.24.2024.12.11.06.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:43:29 -0800 (PST)
Date: Wed, 11 Dec 2024 17:43:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: vigneshr@ti.com, matthias.schiffer@ew.tq-group.com, robh@kernel.org,
	u.kleine-koenig@baylibre.com, javier.carrasco.cruz@gmail.com,
	diogo.ivo@siemens.com, horms@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com, Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net v4 2/2] net: ti: icssg-prueth: Fix clearing of
 IEP_CMP_CFG registers during iep_init
Message-ID: <3b0b84f9-d51b-4075-9d1a-5c2042ee6c4e@stanley.mountain>
References: <20241211135941.1800240-1-m-malladi@ti.com>
 <20241211135941.1800240-3-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211135941.1800240-3-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_064332_635784_5EEF4DC6 
X-CRM114-Status: GOOD (  15.98  )
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

On Wed, Dec 11, 2024 at 07:29:41PM +0530, Meghana Malladi wrote:
>  drivers/net/ethernet/ti/icssg/icss_iep.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
> index 5d6d1cf78e93..a96861debbe3 100644
> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
> @@ -215,6 +215,10 @@ static void icss_iep_enable_shadow_mode(struct icss_iep *iep)
>  	for (cmp = IEP_MIN_CMP; cmp < IEP_MAX_CMP; cmp++) {
>  		regmap_update_bits(iep->map, ICSS_IEP_CMP_STAT_REG,
>  				   IEP_CMP_STATUS(cmp), IEP_CMP_STATUS(cmp));
> +
> +		regmap_update_bits(iep->map, ICSS_IEP_CMP_CFG_REG,
> +				   IEP_CMP_CFG_CMP_EN(cmp), 0);
> +

Don't add this blank line.

You won't detect this by running checkpatch on the patch, but if you
apply the patch and re-run checkpatch on the file then it will complain
about this.

>  	}
>  
>  	/* enable reset counter on CMP0 event */
> @@ -780,6 +784,11 @@ int icss_iep_exit(struct icss_iep *iep)
>  	}
>  	icss_iep_disable(iep);
>  
> +	if (iep->pps_enabled)
> +		icss_iep_pps_enable(iep, false);
> +	else if (iep->perout_enabled)
> +		icss_iep_perout_enable(iep, NULL, false);


Do we need the else?  Could be written as:

	if (iep->pps_enabled)
		icss_iep_pps_enable(iep, false);
	if (iep->perout_enabled)
		icss_iep_perout_enable(iep, NULL, false);

regards,
dan carpenter



