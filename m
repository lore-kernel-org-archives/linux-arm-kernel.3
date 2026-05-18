Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1410ECD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 21:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OANDM8Na3472eWZUNdpiSE+WZ0j53b9Df8FisM//ZFk=; b=IPAi9iGR6h7uyKuz4TEBS6aG/3
	I33MO5wE7URY2dgeELfBZtjbssYpVFeNT54+CCgn7U41gSeA1jnjV+spVPvcMoZ5h5CIHi/1RKNNF
	ekPFx04ayhtQeXhsTaRhqg2BfKkUTUeCumeXHgaS9ZVtJs+plI+4SjuWrvCjB9+x1CcgutHn4ty3C
	Prv1hez89+NvCl168oiKSIeA0hIcH8aoIl++eI/98HDNf4/Jls3YMJXrN9pf+Dp2nK0HB7cQJO7JK
	GD3U+NUbqzVnw6/O+QLD6vOVIbjJ0Iai5Ir8X4H2sZkIzmYatBm8+eJYnon+sScdgkMR/ro+7sJ8v
	Z5N8H2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5kL-0000000H1eD-0vau;
	Mon, 18 May 2026 21:43:33 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5kI-0000000H1dR-0vvi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 21:43:32 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-90d1f03238bso374304585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 14:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1779140607; x=1779745407; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OANDM8Na3472eWZUNdpiSE+WZ0j53b9Df8FisM//ZFk=;
        b=qjq5UwOyE3OJu/ycO7XmioTrH8AkU1eXUYCFptLR41mnVueY9g+fkuvzWHHYEPQGcy
         C7K9WA173BBIQ0GJNX7WJc5w/lvDnpQAVYWuvrmElueT+HXK1hhCTHKK2XeGMoQgNiZj
         903zwdMC5vsadZo0yGmT2Mt1vB9XiovAnLaoILKL5+2G1Ng71+4QB0mu0r1dk4ldNLHu
         ELiS+T/Yx+M6tQ6XEsRqNoz0l+8ZUSO1eNIZwH11gj1AEbh60ziuOYwjgEBMNmvYr71x
         LT8OS9z3JxoBQsmnWHc0jvGyf2bUTuKzXgFXJ3mzdFIMlwPYyADztEbmbqQPRPYRPS2n
         IXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779140607; x=1779745407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OANDM8Na3472eWZUNdpiSE+WZ0j53b9Df8FisM//ZFk=;
        b=GCRRB+a3UWypANnI/s64u6ctOyet1dpOCY+dcqa719Bqc0msk0N2GgtywswbRt8/Wv
         Es8PqZyKjQBROcTGGKnZlvTZ4erxlkf3BQBH21k85cDqA2SLctrg9Fxk+5dU7eMzyrDq
         gLY4Zj9X6jcfVK9Bs0uNxVAntsUuyAKBsKjPS1Y/MvpV1rxsPFlNGm5Kqjw2iUaw++Jv
         6FCBVCcLvffT+FKna3dpI2Jt2mjnqf6NVuDhQbCM66IAE6wggUvbIbi99VussmEXgAwK
         qaEa06Z819HCwYDj0EZyc3Sor/CBWbEQSaxpirIHdGTSpwrTdymc5Yq7dUeL8PzUZ4z/
         0adQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dzv+aGRwrCyydYk9LMd2vUer9qhkRwlkUKBcIZZXnJE+G62wgNAN+tgSRLnNI9vpzaTBFMIGSvupoDL7e9Syr@lists.infradead.org
X-Gm-Message-State: AOJu0YxfiNQx0BGvy9fd/+sNv6lEv+PatoanNzpZ0knjHLHSvn+BL4HH
	v/bsw8SyNjIPN5j29GXGMdSkEWBdGHX+bT8jUlt8wjgnJFJsjRIPi60hGqiqBfbChA==
X-Gm-Gg: Acq92OHAui5pLKLSoo8ag8swf4WFcdf/ySCN51c+dRDrxGbAhP8oUfZBjFV+PNdhskY
	jfX4NEuV+A/+3gDmIzMWbMryfLUmyoisAVphmUQAEs6BOXYlgKeQEgiFh/8WbAAuSf8U0shs1v2
	THFbp98ES8n/vE5vFjZO3kS/FqAW5XyECeoDnhAws6qSlrrcwOwX4fQebEHsjszFHWL4sL2OnOx
	Efa7Ykq2q+U7QRrn/CGOVRHyn6lCnEgDdogG1lxC2pvEAq5fcSXrM7iyE7Lc5MQ9UFaavsWx0JS
	ETyTQqD4TXoVeJ113PHC6AIVZOqxpXMti8lmXVJccy/ANzIZIPshyUd0wzGjax7ZMOREEc3tvlv
	Ockv+8e53HlSDdjigF099Q7qQXw6H8uVvD+1VZT73ghjveweqRmxyZdUGe1XXeBuQc7kQdQwoJ0
	WRNFSWYJ1G26xFXQ1UzR2Fz2zYssekWM0B31uvdc83UWA=
X-Received: by 2002:a05:620a:2587:b0:8f1:9e59:21fa with SMTP id af79cd13be357-911cd858a7amr2197388885a.5.1779140607206;
        Mon, 18 May 2026 14:43:27 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba182535sm1622387185a.8.2026.05.18.14.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 14:43:26 -0700 (PDT)
Date: Mon, 18 May 2026 17:43:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: aspeed_udc: avoid past-the-end iterator in
 dequeue
Message-ID: <d659cf09-8136-4383-b61f-045b92d495db@rowland.harvard.edu>
References: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_144330_722792_EEDE9E74 
X-CRM114-Status: GOOD (  23.61  )
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

On Mon, May 18, 2026 at 03:34:03PM +0800, Maoyi Xie wrote:
> From: Maoyi Xie <maoyixie.tju@gmail.com>
> 
> ast_udc_ep_dequeue() declares the loop cursor `req` outside the
> list_for_each_entry(). After the loop it tests `&req->req != _req`
> to decide whether the request was found. If the queue holds no
> match, `req` is past-the-end. It then aliases
> container_of(&ep->queue, struct ast_udc_request, queue) via offset
> cancellation. Whether that synthetic address equals `_req` depends
> on heap layout. The function can return 0 without dequeueing
> anything.
> 
> Use the cursor-vs-result idiom from the sibling aspeed-vhub driver,
> ast_vhub_epn_dequeue() in drivers/usb/gadget/udc/aspeed-vhub/epn.c.
> A separate `iter` walks the list. `req` is set only when a request
> matches. After the loop, `req` is NULL if nothing matched.
> 
> The same idiom is used by the other UDC drivers in
> drivers/usb/gadget/udc/ (at91_udc, atmel_usba_udc, dummy_hcd,
> fsl_qe_udc, fsl_udc_core, goku_udc, gr_udc, lpc32xx_udc,
> max3420_udc, net2280, omap_udc, pxa25x_udc, pxa27x_udc, udc-xilinx,
> bcm63xx_udc).
> 
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
>  drivers/usb/gadget/udc/aspeed_udc.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -692,26 +692,30 @@
>  {
>  	struct ast_udc_ep *ep = to_ast_ep(_ep);
>  	struct ast_udc_dev *udc = ep->udc;
> -	struct ast_udc_request *req;
> +	struct ast_udc_request *req = NULL, *iter;
>  	unsigned long flags;
>  	int rc = 0;
>  
>  	spin_lock_irqsave(&udc->lock, flags);
>  
>  	/* make sure it's actually queued on this endpoint */
> -	list_for_each_entry(req, &ep->queue, queue) {
> -		if (&req->req == _req) {
> -			list_del_init(&req->queue);
> -			ast_udc_done(ep, req, -ESHUTDOWN);
> -			_req->status = -ECONNRESET;
> -			break;
> -		}
> +	list_for_each_entry(iter, &ep->queue, queue) {
> +		if (&iter->req != _req)
> +			continue;
> +		req = iter;
> +		break;
>  	}

There's nothing wrong with doing it this way, and this is how the other 
drivers do it.  Still, organizing the loop in this way does look a 
little strange.  Consider this instead:

	list_for_each_entry(iter, &ep->queue, queue) {
		if (&iter->req == _req) {
			req = iter;
			break;
		}
	}

Alan Stern

