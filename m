Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C8BC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 17:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scdHE3f1gT3tI1szOZtkMdShahjFVVqLG8G2E2kb/84=; b=Q+9793i6sruewY6q2F0RLhL5+H
	1Q5JxuzrgjMT/rceG5WuBrqH/d6Oovwila5iNAgkKDEumrr9quAsy0Q+7/Mt9l3YLt4B3cIRQ6fvS
	/mrj0VjSQrN9Zx4blTH9vv2qbdDXYfmNp6UQVomWI47yHy85u9SGCtxOJPSii0lY3T7hIwGXl/UiO
	AOz5m26zV5DnsgRW8wQIhWSzg+trX6VfsrCKeyQFmRJ6+UmN3RyR3jbDo+57HuqC9a7i7bhMM/xv1
	L7ftc5N4AYcgcfg/cKV+ZYJl/izGQiL1USK7IGaTZBsY1ehIPZ/qAFGEZz+YRcL7WCIVdYWLsmtgk
	Tn6nHh+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTiI-0000000CVUv-0Ph1;
	Mon, 10 Aug 2026 17:23:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTiF-0000000CVUR-06eb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 17:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786382576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=scdHE3f1gT3tI1szOZtkMdShahjFVVqLG8G2E2kb/84=;
	b=E2n3Qe8wIJQhZS27N99nOIEwobd5OHY5DVhvFUZFSdC+VdkLquJYCeEvDGJ9WSjUvBTXof
	2avMiPJGX4igGevSorI/TB2Vfol3eNNW630mtxUdljvD6O3PXHbxW0cgttYoJCpcFYvslI
	vs1GIcwhVGymKX1ks40LlbJw66uOWO8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-3F11EZU8ML2FC6K6JhazNQ-1; Mon, 10 Aug 2026 13:22:54 -0400
X-MC-Unique: 3F11EZU8ML2FC6K6JhazNQ-1
X-Mimecast-MFC-AGG-ID: 3F11EZU8ML2FC6K6JhazNQ_1786382574
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81aea53d559so51762747b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 10:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382574; x=1786987374;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scdHE3f1gT3tI1szOZtkMdShahjFVVqLG8G2E2kb/84=;
        b=pXXdPHJ04qQTR3eKBtseM4qFOO6PQZ9pAvaoT7qd1dfbnbFvRGN/fWQdgVpHn9MdbL
         U2rm1RyufMveXxrTlx1w34limgSD/YbKM1LMFahF32lNQ0IqzPkcGE3hwkS+QMamZicd
         UpzrP/lzu/7/4GFH9KfKd2tFOtqtrNmjK1x4cdb3cbaUK3n62X3rthQpzjS2ZfgNBg/H
         l3/bS0qprbNWj1hPoaUbMgOFp1c/SUXsZOq4160kKxys0bIUBbFY4CxXqbGmFJThQUGy
         cq1n/Nam2cTTJUouwQHLCcr/ydd2F7DihWr2XOBdG8UOF+N4JSV3CkUD6JlwOblcInl1
         eZBw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7xL5tBETiNm5dWTOeKe7bpmAU9dzDENEF/2z+lXrAeVcPz6Q1xMzTAdrSxXJPy+5KDpYLbEPz4prHCgmR4VcU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo0dixghGAj74oY+LbaZp7Y9BNEhcN1PwSQbnOAqTHNx/+tk7Y
	BFUlbesTZIzms22dQ/I+4ki/UEtVCvyMiNsoaLkFbJ7VFwwHAHMh2/t8sa7+g4jDY8w6mdos2zv
	vfYJhj+MHKQU4qdJmMP+Lslid3X+6mLnKIiW6fBqJe8md3PW7CGksxfGkK6OKVQ5K0YvSSZnoeA
	ZB
X-Gm-Gg: AR+sD12qKD80YSiz9UEA9nC647fyma6Eo2Fl+qtERr5dUZoBt8lYRGmK4cjE9GBC5RT
	Wor4LsfUfvBdm1XyNf+Qjxscf4BExbo564DrfJg/j1UHj1nrizbBK4gIpAc48qnL1O4Mjb1/l1x
	ZLpi1yjQOeA5bU7EYQlcnaGUTt4XoIa8aZNSG5eHyVstOvDMvA6lI+rm/1fKuj6tZk+VW2b1UOc
	npQQXEnowyZFU7fpbPtWTS/Z7Poy4jczni9UUNlTo48poXsyqhdRtURzk/q23wTyUXN2jfprxM3
	r5ZZJ74RiZp3CwPjthtvKkmQxBoi10Hlzc7OH7d925n05uH1K7yiWhKZmLATTHwgfX6n4W82bAp
	BsJex1NBJx3EjIOYMAJKxyUdXelywk70XPy4=
X-Received: by 2002:a05:690c:f06:b0:80d:c2cc:f673 with SMTP id 00721157ae682-82d2a8c4531mr20804007b3.20.1786382573961;
        Mon, 10 Aug 2026 10:22:53 -0700 (PDT)
X-Received: by 2002:a05:690c:f06:b0:80d:c2cc:f673 with SMTP id 00721157ae682-82d2a8c4531mr20803727b3.20.1786382573576;
        Mon, 10 Aug 2026 10:22:53 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f577c580sm60710857b3.27.2026.08.10.10.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:22:52 -0700 (PDT)
Date: Mon, 10 Aug 2026 13:22:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8qxp-lpcg: fix runtime PM cleanup on error
 path
Message-ID: <anoI6eX9OzI0bsFy@redhat.com>
References: <20260808080215.2669452-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260808080215.2669452-1-lgs201920130244@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yKrbY_xtrubAGaJiGSmsmKXOJQhnb007kEubGoJ2IDg_1786382574
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_102259_132286_DD69842E 
X-CRM114-Status: GOOD (  21.60  )
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

On Sat, Aug 08, 2026 at 04:02:15PM +0800, Guangshuo Li wrote:
> imx_lpcg_parse_clks_from_dt() takes a runtime PM usage reference with
> pm_runtime_get_noresume() and enables autosuspend with
> pm_runtime_use_autosuspend(). The success path drops the usage
> reference with pm_runtime_put_autosuspend(), but the error path only
> disables runtime PM.
> 
> As a result, the reference taken by pm_runtime_get_noresume() remains
> unbalanced on registration failure. The autosuspend setting is also
> left enabled instead of being undone with
> pm_runtime_dont_use_autosuspend().
> 
> Add pm_runtime_dont_use_autosuspend() to undo the autosuspend setting
> and pm_runtime_put_noidle() to drop the usage reference on the error
> path.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 18cdbad40c6c ("clk: imx: clk-imx8qxp-lpcg: add runtime pm support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index 1dae3410ee99..262645bef62d 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -277,8 +277,9 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
>  		if (clk_hws[idx])
>  			imx_clk_lpcg_scu_unregister(clk_hws[idx]);
>  	}
> -

Don't remove the newline. With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
>  
>  	return ret;
>  }
> -- 
> 2.43.0
> 


