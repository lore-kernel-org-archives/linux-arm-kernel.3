Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28E7C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXpD8fhMfpcH4/rK/CINTt82CSW0JYY906XwzS8WpVY=; b=qdJtBeyJ0MjNmFdjB8sphmRXPG
	kLrDA03zWBxoVr9Tn2gsrylsAh5yiztLjzilxXT/kRCvYqfYUZrEie6szzYHFZqkl4mflYNfnp2yl
	ZiWTt2X8kkJ7pvvN72lXCWaVzQjgfXNOQFrcD4Inae56XyxgTkL351XV4/9O3LER/JSuNzLvXxMx1
	cV9T4sb4U2YGOxH4SH1mSRoilF5UnuUE9FHwaxGplzDagLu/BguhFk3ZBSB5QipTg/5zasAuV3j/u
	g1MgPDmKKKzPljO+jlIu5B+AEaELqrjRjLm7ccpDINciNobpXsW85H0sUWkhjRIbs+MrUDqj+qT7B
	zTP6A9Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryV3-00000005wKs-1rlH;
	Thu, 06 Aug 2026 13:51:09 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryUx-00000005wJv-3JEe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:51:07 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-93108a3c326so61854985a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786024262; x=1786629062; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kXpD8fhMfpcH4/rK/CINTt82CSW0JYY906XwzS8WpVY=;
        b=Qvs7wv+JLOlFAr7QkbQedaghqDXYGSji9f5VIn6pAV1XktX8yKmD7XJEgvzVLMImxh
         CPUAR0wnppBlPcQqHt3WQBKzKKRVkynOXbUpd/RGcmfgyAg/tqt3jUFCNvDSwltwN9cQ
         Pj7B0LyPw95wKkhvq9QQSQHUeH6sRi5TKEuVI+1h4IanmnrtBPTW8rZIBbgyldsRg5kM
         cytxVVK0UF/onE9TiexF+Pj+LkwGz3XXuCdBvdhMYRXA6qJzXZ/+Kj833ixDxH8VRo97
         iqnYn6Rjvf7rqiLHdLNJ5I/gOskhn7/OxeEjY2/tPPEexGuoiTHmWtuJVvdqACTMGEwo
         tspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786024262; x=1786629062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXpD8fhMfpcH4/rK/CINTt82CSW0JYY906XwzS8WpVY=;
        b=WrU0aRsnO+6HxMOs5wYZuz15ZsqU6ZNhFI/vnn6y9dgF67ETBzuyuQcH9hQ0NZrzsB
         msaJuq10WDxSTUkI/m+nCUhOCSAe6U4Yk1LTVtcdBCteti4KW/GX29obyeUtTJVF9HQ5
         V/WL5qVJGR/8NMGoni3cAoTgZSVqBETI65Sdz4ijchjd2NBulB3lAf/uVKUvUj/pQo6b
         rhLrCfpMsPFih5GrMcJe1iPqAgW799KR8dSvyuwDmY1O7WnLaKebIPsWsdU7pNFlt6Sd
         kYyO1AcKTXv2nuOlZX9eLMvtb6cHIeh/c+Lk/OV1T1bG6CfObUkT4QcBWawlNY8r45k7
         89pw==
X-Forwarded-Encrypted: i=1; AHgh+Rrc1IOhqF/6di9y1pnQju9IEqltMhHHSdvFUdj9qTd/tMi4JFu7Jtm7nSEgkgTK8wTbzN/6ma0l/FStmwxxwv4p@lists.infradead.org
X-Gm-Message-State: AOJu0YwAHy4dHdRBkweW8silnionSDqMST/hWhFsrYdbh62qC3W/yrQN
	ONhM5zDNwhFs72Im96D+Es4pXeH13wfh3ft/p2pRpkklTRCcc9v55GFu8qi2UN9oOg==
X-Gm-Gg: AR+sD129OTRxprefHWb+Jju39UPwEMdEy6AmiHPDM3Z6Et0JikDrgctUC4/Pl+mFSAQ
	ANfvLJUO+SUZITjST9oQfWKEs92G77MN5ZOzU7ygqfC+C/a2iadT8qR6NLzgT8OZHyFxuJprFpE
	O1KHuXkZkBG1d6QNAMZRuNti4SU+TTe+WtBvgg05ow1KI52nBH74eTII0Lt5jYq5ga72FgvoaJ0
	996XKtvbkhHpVMHh2cmPiVF75EEaWyAbuXMk81iE7Qz2mlflRrvyBKGmOpx4FGc61nvkSIXIoGW
	K4CH6YI3XjZKsX2QerEb14XjymZoPR5XKAKgBcfn/QgTkFbV4SZJ7KBpg9T5+qIaKRZs/dtlWKS
	lBOrt5HmFXeE9/nvsh8BvKr0pRYQq6Ve9EsdmO8YSN7VaEIqnXXAjlTcdC0tWSnPl/1n0N5+u14
	wA8Xc9iemhgt0SH0aQmlfvAmTDskSgdvHESWXPoeKzWMY8IUqpRjq4XmKU3r9kOor8eZOGOmv0q
	gSMIYM=
X-Received: by 2002:a05:620a:371f:b0:92e:7075:941 with SMTP id af79cd13be357-9365959e5femr648645685a.13.1786024261713;
        Thu, 06 Aug 2026 06:51:01 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936582da028sm257577185a.26.2026.08.06.06.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:51:01 -0700 (PDT)
Date: Thu, 6 Aug 2026 09:50:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] usb: host: ehci-atmel: stop clocks before releasing HCD
Message-ID: <b7f212cf-2577-4c77-ba71-edda2124868e@rowland.harvard.edu>
References: <20260806060557.1747-1-getshell@seu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806060557.1747-1-getshell@seu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_065104_649573_61971F71 
X-CRM114-Status: GOOD (  18.74  )
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

On Thu, Aug 06, 2026 at 02:05:57PM +0800, Hongyan Xu wrote:
> usb_put_hcd() drops the driver's HCD reference and can free the HCD and its
> private data. The remove callback then calls atmel_stop_ehci(), which
> obtains that HCD from platform data and dereferences its private data to
> disable the clocks.
> 
> Stop the controller clocks before dropping the HCD reference so that
> atmel_stop_ehci() cannot access an already freed HCD.
> 
> Fixes: 501c9c0802d9 ("USB: at91: Add USB EHCI driver for at91sam9g45 series")
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-atmel.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
> index 65747270fd88..bcd56f888ec9 100644
> --- a/drivers/usb/host/ehci-atmel.c
> +++ b/drivers/usb/host/ehci-atmel.c
> @@ -177,9 +177,8 @@ static void ehci_atmel_drv_remove(struct platform_device *pdev)
>  	struct usb_hcd *hcd = platform_get_drvdata(pdev);
>  
>  	usb_remove_hcd(hcd);
> -	usb_put_hcd(hcd);
> -
>  	atmel_stop_ehci(pdev);
> +	usb_put_hcd(hcd);
>  }
>  
>  static int __maybe_unused ehci_atmel_drv_suspend(struct device *dev)
> -- 
> 2.50.1.windows.1
> 
> 

