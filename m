Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D0B1062894
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sNes7wBp8mvc8RA4hwVlZB+4etqIjKcKo78OyNGFYM=; b=yVdVjEG8FrXm6iD3A3bTE7/1OO
	beQGVtaH54x17b04Mkp2yz/dHOFLD+oQXrNgsAp8UF8xxvijZ9TqCj98jMCTKkzwp/P4YDAdL32uV
	xll/Hm827UJ2J6luXCKSw0i6svV1Ob91B3buw2RbJRn/N8oS8pRugn5RhtlFD/zHRtPSTwEioR5oy
	opYVGuKS8vvJWWoV5y3GuSmqm9lBv6PQGASj+LA7g70aGECrYEkh7r1GOqcS292jwJ4DXflDRcsAg
	JfrqpLfVr85m9eYw1nxuK6UrQswDKvPRVPlaK39JZQjknBJNSTRrF0IryeBvUaacB0NglLZWwRRUq
	QW/zEBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J0s-0000000Bacf-0Kb7;
	Wed, 11 Mar 2026 12:50:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0J0n-0000000Baak-0QOO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 12:50:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BBBD4055D;
	Wed, 11 Mar 2026 12:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D723C4CEF7;
	Wed, 11 Mar 2026 12:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773233402;
	bh=kxPCuvdNEnkzNAjp8+TtDPAZ9af/uDvRdoOgg4nyBVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=neMmdF8qjeMinBQ21v1cemNCfQtIYDbqLeQm8gF35825nJsHpIFdqqRLGtgQp1ITn
	 YlSAkM280PzSQheRArdq6013NjzH6N0fDBaxXn144mHlkQzVwYbnozRorqQFNnoCfA
	 UaiS9TVIw3C8SoJT8eybhbFHSw6Hnb0dj4NttPw4=
Date: Wed, 11 Mar 2026 13:49:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhaoyang Yu <2426767509@qq.com>
Cc: sergei.shtylyov@gmail.com, daniel@zonque.org, haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: pxa27x_udc: check return value of clk_enable
Message-ID: <2026031128-gumminess-reach-c45d@gregkh>
References: <tencent_358DF7F3BD49A6407C17B7B26307A3B0AC0A@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_358DF7F3BD49A6407C17B7B26307A3B0AC0A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_055005_157217_53830F57 
X-CRM114-Status: GOOD (  18.28  )
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

On Sun, Mar 01, 2026 at 04:55:53PM +0000, Zhaoyang Yu wrote:
> clk_enable() may fail according to the API contract.
> Previously, udc_enable() ignored its return value.
> This patch checks the return value and logs an error
> without continuing initialization if clk_enable fails.
> 
> Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
> ---
>  drivers/usb/gadget/udc/pxa27x_udc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
> index 897f53601b5b..006d6d0a5f9a 100644
> --- a/drivers/usb/gadget/udc/pxa27x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa27x_udc.c
> @@ -1693,10 +1693,16 @@ static void udc_init_data(struct pxa_udc *dev)
>   */
>  static void udc_enable(struct pxa_udc *udc)
>  {
> +	int ret;
> +
>  	if (udc->enabled)
>  		return;
>  
> -	clk_enable(udc->clk);
> +	ret = clk_enable(udc->clk);
> +	if (ret) {
> +		dev_err(udc->dev, "clk_enable failed: %d\n", ret);
> +		return;
> +	}

If this can fail, it should return an error to the caller and it should
be handled properly there.

Also, this is a v2 patch, but you did not label it as such :(

thanks,

greg k-h

