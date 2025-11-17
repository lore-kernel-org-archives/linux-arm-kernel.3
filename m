Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8E5CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 14:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDTMAjFTHZZURat4atsXS5dyJJHx/gXD6vpgW9NtTRs=; b=zFxqjNq9bs0U8iXKm2ZAS5KqxP
	1VeIvmmq7wsHuqu1A9Jn5NoSvKsEnWTsyN2aVBn7EIKt91/dGJc/j+3h9evH3LDlDyuFDbtM9T175
	IGgmde7Vbe5nxL8NhNj+SBB47EPqdXXxrD+qETGkCCI2L5GWW9FjzPqCVYZtkuaR12QdSOLOAblIQ
	gnCZl1Dr5YPYzIJ8ph1RY6CywRUMw+3fYFFo2liGt3RmYjLudPV/4euKZJ2HtUJwuu7WNNtIo9iLP
	RWpMblRfYKlI+Sh398o9O2H5mYIKzG18KcmJCWivGzNlQXTq50rDpRFio1skGK3ds4n2k1ScgKHu1
	yugc8aGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0eX-0000000GHpW-0Wan;
	Mon, 17 Nov 2025 14:56:25 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL0eU-0000000GHov-2sx6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 14:56:24 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4edb7c8232aso64677191cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 06:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763391381; x=1763996181; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bDTMAjFTHZZURat4atsXS5dyJJHx/gXD6vpgW9NtTRs=;
        b=rhoAE9p011Zi22rvUMjOSB9g2ImpvO1cumoY/IY3BmeC+CgNjOlG8LwAgXPUUvrf7X
         r3KK5m4GaQmkB92snMCYOtRJ3G+W6BuWpinzSrPqrRjlnjq9N3kZ2IkNntQxK38BAxxP
         HFLFX2ciCgW+AzQcFXBlR1FEtVL8hCPjwHrtVPeG7sU7Xx2TdOHrzYn4dSEXiC7/xNbG
         doVcKDIV/ZdCV2IBoKDf+u8N8HmcBaGrkv2jAf071hU2JxXCt9aN7V8rw/RWO54yxuZN
         XbZvej4mumjlM12XrmZbC/+BMdP9fKpb9ooSes7/+4N/fCgV8+32Yc26AEig1MmAkWMe
         121g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391381; x=1763996181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDTMAjFTHZZURat4atsXS5dyJJHx/gXD6vpgW9NtTRs=;
        b=jMAQYfJ5axJy20/xxQbiZod8XjibsLq2jm3xzrWWQH6Gti8oe6gc8V0thgFt3/ly6A
         YnVWMkucnGY5ZlrggsAwlFBNJTXl03En1XXhiVNH7ZVj86q7V+b7lFTnaLs8/ifa/MF3
         S2BvyvkZ0ZUWDguPVPsyur84xqYnjyNhzQiQQznJ+ZvN6mdGi1sxuVuWGJEiD4JMkXDX
         VQV4YgksjVi5+ezmTULUMeUxe1yfjjDx333tQ2b+syWPkbEfuQcOvuBU/ZdXR4lXekNq
         moJCWnahe1VNIsVv3cp8sTp+e/vR34YutEHtN+HJ2lza7GErA+LLEGxgdTg1+wTge0IO
         8Mbw==
X-Forwarded-Encrypted: i=1; AJvYcCXVoFXuiYMjGgdTgGk3hnVtiephXWJ3JT+IzWLsqHhUL/qWSi1jeJM9K3P87AHZ8UhuRYQn4R7v3/xGIocWV5fe@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2IVqt6BfILHLfIUtLv+yopXa0zhWvodDAtNVfOXaatpyNxf7v
	xurKIadPkEWK0vusVMAjBUx9/7dklQHETReybdlOttRZQgtFU+8X3ooSDQ0Sv2vWyg==
X-Gm-Gg: ASbGncsO/FCu475mFr1pbyosjCtWgAqYO8k8dmDbsgDGgw2C29mv5IRl9YBpln+KPzl
	oZYTOAEQ1wZTpDmRP7qp4ev8PRXoAj/2dOneM+j3lD+Js11IEjoF8rY0fDwc012mWUJ4J17tUMh
	4SB8NKOkBNdtCRq0HLeM32HOC4JlKfW+4aWVqFK75diUCwbYaaDqDwrlnOMlHiXkKVc/peTEh82
	uR7q58paXPhoAn/UJNN3Egfq9FaFBlnSGfvHzRP40ZL9iIibv01s54BQfUOOVmKaQjFuROPRGJI
	s7ARZoMtGrpOaeuJhY3CSwgjCJfYi1e0KwOolQOYZ7eGD5wmddYkDZqql3N1mkrJ91KsEhU3K09
	Aq+PJHZ2r9twoHSjJKu9p98cCQPbYImLYuHRQAQpQraolAbEuiflbsgFEPvQAqWNkSnSWHC4JOG
	d8X/utCLbmhTQcZfMZNLivvi8BDfUuBQ==
X-Google-Smtp-Source: AGHT+IEA4s9TEMA/DC/kZYt/NdkfOC8lgCBVVGJx2NH4cSc3zU3y7yNtT3OeFcpvLBqvdCfUiBKB3w==
X-Received: by 2002:ac8:5805:0:b0:4ee:1e82:e3f4 with SMTP id d75a77b69052e-4ee1e82e6a9mr56880141cf.64.1763391381300;
        Mon, 17 Nov 2025 06:56:21 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ede88799bbsm84283071cf.34.2025.11.17.06.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 06:56:20 -0800 (PST)
Date: Mon, 17 Nov 2025 09:56:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ma Ke <make24@iscas.ac.cn>, Vladimir Zapolskiy <vz@mleia.com>,
	piotr.wojtaszczyk@timesys.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stigge@antcom.de,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] USB: ohci-nxp: Fix error handling in ohci-hcd-nxp
 driver
Message-ID: <9834be77-29e0-4a65-93f6-b61bf724f922@rowland.harvard.edu>
References: <20251117013428.21840-1-make24@iscas.ac.cn>
 <4fe5b63e-072c-419c-a1b9-bc21aec7e083@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fe5b63e-072c-419c-a1b9-bc21aec7e083@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_065622_948855_F342E5E3 
X-CRM114-Status: GOOD (  31.07  )
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

On Mon, Nov 17, 2025 at 09:53:21AM +0100, Arnd Bergmann wrote:
> On Mon, Nov 17, 2025, at 02:34, Ma Ke wrote:
> > When obtaining the ISP1301 I2C client through the device tree, the
> > driver does not release the device reference in the probe failure path
> > or in the remove function. This could cause a reference count leak,
> > which may prevent the device from being properly unbound or freed,
> > leading to resource leakage.
> >
> > Fix this by storing whether the client was obtained via device tree
> > and only releasing the reference in that case.
> >
> > Found by code review.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 73108aa90cbf ("USB: ohci-nxp: Use isp1301 driver")
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> 
> The patch looks fine in principle, however I don't see any way
> this driver would be probed without devicetree, and I think
> it would be better to remove all the traces of the pre-DT
> logic in it.
> 
> The lpc32xx platform was converted to DT back in 2012, so
> any reference to the old variant is dead code. Something like
> the patch below should work here.
> 
> Other thoughts on this driver, though I I'm not sure anyone
> is going to have the energy to implement these:
> 
>  - the reference to isp1301_i2c_client should be kept in
>    the hcd private data, after allocating a structure, by
>    setting driver->hcd_priv_size.
>  - instead of looking for the i2c device, I would suppose
>    it should look for a usb_phy instead, as there is no
>    guarantee on the initialization being ordered at the
>    moment.
>  - instead of a usb_phy, the driver should probably use
>    a generic phy (a much larger rework).

Considering what the comments at the start of the file say:

 * Currently supported OHCI host devices:
 * - NXP LPC32xx

 * NOTE: This driver does not have suspend/resume functionality
 * This driver is intended for engineering development purposes only

I wonder whether any existing systems actually use this driver.

Alan Stern

