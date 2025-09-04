Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE09CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rHD7plJVEZkv8PkFJEx5BeBVBt5QFBtzvV5bLJfU1s=; b=Z4Vh1UNADi8a8zRk4XH9qHvxFe
	PxPdja1W9O8nJHiSDS3wjdOsw8NFsFr2uj+f1fC74J1/K9/wjkswIcG7uZjTpvAEW4X4iWdSPJp/V
	buzHyaa9e8LomHwPJZ2LdCVo6paJcW1Qi/Obgq3xma8V/2EisvPyleJ3L654Ay8OH+YwDxgA8pWtd
	CSka6uwuStt4+lQe7Xe0HdXY4o11MZVQM4e7VOYgRzGbLsyF4sx6K/WGsECcoMSv/K1ez0vvrdgC9
	lIJ65QGIY6ncrOBqr4U5eoIUc6E7M/6LmttUaw5Od+J7iu6ncBIKcPyd0qM9c4LFrMYKMKr4ooYfU
	9YedUIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM4K-0000000G3dg-260p;
	Fri, 05 Sep 2025 02:20:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuHfC-0000000EcFL-0gLQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757021915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9rHD7plJVEZkv8PkFJEx5BeBVBt5QFBtzvV5bLJfU1s=;
	b=e9AbxpzukcoKaOXSeXcp2w3w7k2MS+2IyhSpbfnhUREQ0UIZ7BCE9qj1yqrtxOdSrvzjTC
	YPGkhDyA76fdqF+amJQ3SE2d/QTdtu/tmsliab5J2tRhxI89SVzLzsByv5Ijve04EkS0du
	meZvvHlh2Zv+1cNBUPG2Y5DjPFA8Y5c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-UWDo-ZuPNfWnZQQDlkQdsA-1; Thu, 04 Sep 2025 17:38:34 -0400
X-MC-Unique: UWDo-ZuPNfWnZQQDlkQdsA-1
X-Mimecast-MFC-AGG-ID: UWDo-ZuPNfWnZQQDlkQdsA_1757021913
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45cb5dbda9cso9151285e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 14:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757021913; x=1757626713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rHD7plJVEZkv8PkFJEx5BeBVBt5QFBtzvV5bLJfU1s=;
        b=mnZEk5SXlouDaxlOVy0GTVOhGaBgys7HPwWvEoDVD/HaNyQj72WTuMZjf5IQv8Q+OF
         HfLny6EkOuGfl7w+76jnxgwYN5HTGPxMqcO58rcYPRB2gglPplVyUBZqmLRjj5lAeXTh
         d3jefEHL8ABjHCjDLh+nif8Y8i3ApIYruuOhu1wZZiR+yvRTqfOjFhhsm7CFH+KHul0x
         eDrVLWqoMGzNPxJnCyXYudHYw/TVKADLe3B+zQtboluQwlDd2DCtRjhG5DoKmbMemr8T
         jcHELX/ai/eaoSby6Lhvu5FV9BdatrTMO+0eHZ9QFVBototvfnqenQQRpsA7xSHAsJ+e
         G+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWGnjOX1zm961UwozvRrrOvu/iSSOKUml/TiXHy5bzo1vsPu4z33ve5bdccsRVc+HtJteTXfd5DSG/XZu6eCtm4@lists.infradead.org
X-Gm-Message-State: AOJu0YxqRR0vjs6XfDhizMSnm+c7a/OXKSjxj1TtMINjGyQOut9uXJRE
	gILObtLryeEcvLdFm8VzB8GpJGmxKAXxTtiUBXzTqOctdgczPJ9IOCd3u5PmxCwL3Can9xPIycU
	IEGz2gqz4fGL89I0oEv4Mh8G+qKWbcALMwa/wxj2M6/JqhB3uFD5eUyGwYlbmqGIU9Yg9294ASZ
	Pa
X-Gm-Gg: ASbGncsyLwxOfrDFPparD7RpndXElcFmgcS40zAbQmZPsZvlgcendAohOrdNduH/PfB
	bJxCpEJcJUefwUShe+NyEd/5VCo+vJzZEe1i5wuWQtl3pbz0J98PB94y/rmIG5vqncjv/lfXmTn
	+JfzY33HTSnfEZGBIT3oO3h1CFaMzYq0fLQy7H/l8G5HnZ9DAAZGFyapulxe8uKrgjCW7jg/Fct
	/5sC3wVJVqkR3TYxy2N5RkeYF25/+pc1HY0aWDA3/gRACQcBCGi92P+jCK/dCu6C5tMTf0yDsCM
	hM/wCdv1+9q9CF4/5XUfcS1QwTom5/mVWcnwbFIzQaCWKkIp1Cz+vy0ANSeLq9eZpQ==
X-Received: by 2002:a05:600c:1d10:b0:45b:891f:afcf with SMTP id 5b1f17b1804b1-45b891fb24dmr144597885e9.27.1757021913369;
        Thu, 04 Sep 2025 14:38:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWbBDlkpyRRxeIt/+qH4VagktWDBCJazVbSXDHRMhx/diXSZUFSBaQ6M24PtRDNYL0yu7m/g==
X-Received: by 2002:a05:600c:1d10:b0:45b:891f:afcf with SMTP id 5b1f17b1804b1-45b891fb24dmr144597725e9.27.1757021912965;
        Thu, 04 Sep 2025 14:38:32 -0700 (PDT)
Received: from redhat.com (93-51-222-138.ip268.fastwebnet.it. [93.51.222.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf3458a67fsm1872200f8f.62.2025.09.04.14.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 14:38:32 -0700 (PDT)
Date: Thu, 4 Sep 2025 17:38:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 7/7] virtio_balloon: Stop calling page_address() in
 free_pages()
Message-ID: <20250904173824-mutt-send-email-mst@kernel.org>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
 <20250903185921.1785167-8-vishal.moola@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250903185921.1785167-8-vishal.moola@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 09XznkA4i9PA8BY2FwPdAKSDFwZRHcNCYP561_vZDIc_1757021913
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_143838_269600_90890D32 
X-CRM114-Status: GOOD (  19.21  )
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

On Wed, Sep 03, 2025 at 11:59:21AM -0700, Vishal Moola (Oracle) wrote:
> free_pages() should be used when we only have a virtual address. We
> should call __free_pages() directly on our page instead.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/virtio/virtio_balloon.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index eae65136cdfb..7f3fd72678eb 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -488,8 +488,7 @@ static unsigned long return_free_pages_to_mm(struct virtio_balloon *vb,
>  		page = balloon_page_pop(&vb->free_page_list);
>  		if (!page)
>  			break;
> -		free_pages((unsigned long)page_address(page),
> -			   VIRTIO_BALLOON_HINT_BLOCK_ORDER);
> +		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
>  	}
>  	vb->num_free_page_blocks -= num_returned;
>  	spin_unlock_irq(&vb->free_page_list_lock);
> @@ -719,8 +718,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
>  	if (vq->num_free > 1) {
>  		err = virtqueue_add_inbuf(vq, &sg, 1, p, GFP_KERNEL);
>  		if (unlikely(err)) {
> -			free_pages((unsigned long)p,
> -				   VIRTIO_BALLOON_HINT_BLOCK_ORDER);
> +			__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
>  			return err;
>  		}
>  		virtqueue_kick(vq);
> @@ -733,7 +731,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
>  		 * The vq has no available entry to add this page block, so
>  		 * just free it.
>  		 */
> -		free_pages((unsigned long)p, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
> +		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
>  	}
>  
>  	return 0;
> -- 
> 2.51.0


