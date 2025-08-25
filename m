Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F357C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 19:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6KxvMDzVSOwTyVOOifum1zHj+Q1NMnnZSanrfOQhBQ=; b=ilNB44VeQtyWvQm3ULB7Va07q3
	/VycVV5nQCIFS3gMjoWadr0BhfMJrmjV1VsFtZTyhXRRoHSBJtCoF+hld8fGKfNKGMNkemlCfxbFe
	aH4LkLhuDvZ1gJ22t2kLBLAs4lj88tyglaE9iTseIfZcJBL17QOUOeYohSJMHgjPst+O8vd/s/ij+
	oB4YKHdvWNUkKIZpHkL+aAKgHp4xKqi3228sxOIzqaIwrB9B1C0mFUxtEGfi5HJEHnemYn4cL765K
	oysx39KZaivYiatZYBuJj88atl33Hnhtefb74bLHI16V8g5HsL8KPYSBTLvJX+hd3xXnvl0gFsbhe
	xx7KiG8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcYI-00000009AwE-14ao;
	Mon, 25 Aug 2025 19:08:22 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqadT-00000008mf2-1ofg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 17:05:36 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-70bb007a821so60140186d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1756141534; x=1756746334; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z6KxvMDzVSOwTyVOOifum1zHj+Q1NMnnZSanrfOQhBQ=;
        b=NmVlTBflaICm62z8NJu8Oh5uYxvKJ5DWcVdGc4TNElgBbprmIRc6cHb/L0cjFnDyJJ
         FkcSdKxpJ1L8afrrTu+MGitiDYK2IE9b4ZT4/2Syb+nsXgTr/XTrKu8d/i3bgfI5yysf
         KhdjMz1+pZYB5OUq5rRGIMdY4AP3drEEMpC6cs7lcaM5TSGh3bjoHsG/7PDQqD0hOk2y
         3BFbk6jaGJU5phx34rtME4MTdKUBlZ+2gG8Kbo6GhodLXncHHY1pE/7cMqQEZvlV8r+J
         2w+oDIq94ZxX/jENyPfWjCEz4lpci266TMXbOP1bTHNjjZHD6uyTnZY9WEdtlKSENLVa
         hGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756141534; x=1756746334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6KxvMDzVSOwTyVOOifum1zHj+Q1NMnnZSanrfOQhBQ=;
        b=o8PKGuvS23ntgGKqfi4umeXLSqggo4jjmBY4ZYP6CuGVqRaX4N3vNejHXOpj2epOuy
         RDF44aIZaYP8qfjNie8Hid87pEuVvQpzn/ozccainAIFp92E8lvBaXCH3HHi4GPndiY+
         vFgo7d+VM3+b3M7PSp1NLeW5A7L3KkQZIrXwAliDGStGj+PZ7141kTBHUvWDksdbEs88
         8Ca61O5o6ikAj/C88zW6GS1BK63dhVIOTWaDYog6yHyiN62jELnykZPMEh9XrDepzFG3
         nhYV+V2QlQBoHGvyMR7HaHJmAfD1Or2VhThPK7mmGSamrDqGTMdWfypIE6hjSdVxop84
         eGVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVPrUXICFkL21mp1wKiFpJVWZdlf61w0tfDaHbKOXI94tEJxPPJuIqWMUyrsgUHF2L3P13/Yg24NQ7FIX2T7RB@lists.infradead.org
X-Gm-Message-State: AOJu0YyciIGvqIbMI5G/tvz++9FVTA9WZlfAbYNqbVY8UAivpquop1F0
	25IyJxo5W6hOsMhxVuD8wrJeCI0/bxdn2NAmaFFp5EOWy4VU062QMe4MeaWDxsKmVB4=
X-Gm-Gg: ASbGncseqeGgmxMiKkdMJrUTYf1F35GURKi8TKI8Vh+87VFC1Ba+ctVEh9O7obONDB2
	i6ms91BoeVH0a5vG6okOEceNZZTLpqrOKcmF87lkltFaSkGaVYRW4g0CEbtx3HSHpRZYXeVUZ/o
	ScftvqBb8rM9GeGI1ZwsuncGLZKb1Q4JEn+Jy+VLAnagN0ISal5TkwjtKhKT/ewZy+6t0dYj4ci
	mDz2YCp4t8K7uzI0sZ6zjnO47CB1Hxz32EESnrTkADng16XKAwcJDtb2jA8qqtBsTK/BRN3rDqi
	phQSmoRbsXc3BYmsPzvWANjHXB+cTChsorpkfkP2YbcF904D4pFU+UzTMu2uMnXWiKTVyv7fJz2
	OU/bYWjFkRFwhIOQ9poJwTS5ZZJr2dkEV0DAAdvsxYlBP8Ql4I1M37XJu6P7hB4Dv7fa9
X-Google-Smtp-Source: AGHT+IH8RaHjAylVQJBbbz2fVViy55MQyOlXslCXu2TNEUhwTy4uudrftYMxMziT/A2NjRI6tuUcow==
X-Received: by 2002:a05:6214:2a83:b0:70d:be38:8ee8 with SMTP id 6a1803df08f44-70dbe3890e3mr56021826d6.63.1756141533729;
        Mon, 25 Aug 2025 10:05:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da714727csm48193006d6.13.2025.08.25.10.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:05:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uqadP-00000008iJN-3bFh;
	Mon, 25 Aug 2025 14:05:31 -0300
Date: Mon, 25 Aug 2025 14:05:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 4/6] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
Message-ID: <20250825170531.GA1899851@ziepe.ca>
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
 <20250825153450.150071-5-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825153450.150071-5-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_100535_602185_E9A6392B 
X-CRM114-Status: GOOD (  16.19  )
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

On Mon, Aug 25, 2025 at 05:34:43PM +0200, Benjamin Gaignard wrote:
> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
> index 81328c63b796..a28a181013b9 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -12,6 +12,9 @@
>  #ifndef HANTRO_H_
>  #define HANTRO_H_
>  
> +#include <linux/dma-map-ops.h>
> +#include <linux/iommu.h>
> +#include <linux/iommu-dma.h>

This is an internal header it should not be included in drivers.

> +static void rockchip_vpu981_av1_restore_iommu(struct hantro_ctx *ctx)
> +{
> +	if (ctx->iommu_domain) {
> +		iommu_attach_device(ctx->iommu_domain, ctx->dev->v4l2_dev.dev);
> +		iommu_detach_device(ctx->iommu_domain, ctx->dev->v4l2_dev.dev);
> +	}
> +}

What is this supposed to do? Put it back to the default domain? Who
changed it away from the default domain?

Did some other driver change the attached domain (if so that's wild
and wrong)? The commit message hints at that but it should be
explained alot more.

This just seems wrong and goofy. Driver shouldn't be changing their
iommu domains if they are using the default domain at all. We now have
APIs to allow you to allocate wide chunks of IOVA space and manage
them directly. Maybe these 'multiple stream's should be doing that
instead of mucking with iommu domains?

Jason

