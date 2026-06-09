Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F13CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/t/KVtkqwokTt2oNchcdf4xUUArUEApR4RsM4t4GGaI=; b=qJ0KjJ1G2C7uFuQivqN1GqhbER
	gVEII35QwlFtmC/Tn7zdOCcIX8yUXEG8x/lQp/zibJ8WYAkrXx3GJnTEN4LSZ5kp2Kdbdp8V3GTdN
	cf1SYcj7Z55BwWPugQNySjj6sRkMVIwG+r5XB/Rjs6aSZxFJwyZRqGoE/ceJzTjXcTJRGxeGXNs9E
	GEbMyk3v/d5p/xgSfsZ2dZCZnO8O6Ia64pWivxUKp5MLhz2sMv6AIoWNgc0ouSM+heqjXKBz70RKV
	TYXMCjXtDaBv5QuJ/M9iyKsBjyBw7ujBPTqemrktwb+ikUXavJMQhmR6CxJPp8lMHmGSq8QlC8Fgy
	qKYgRmug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxFH-00000005kWs-2zKn;
	Tue, 09 Jun 2026 14:15:59 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxFB-00000005kWS-2qzL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:15:57 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8ccf18ef922so78968896d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 07:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781014552; x=1781619352; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/t/KVtkqwokTt2oNchcdf4xUUArUEApR4RsM4t4GGaI=;
        b=Hh3cVAu83XKQfw23M35in0LmV/tSmk1HOT0f2FQgzUK2vwYAwoqjUAGDW142ACWcip
         VuecX3ZVcNwoQfJ30iXAONi2EhLQlGvFFpvvx/a7p5vICC2ab7wauWqIdWwWenC9NykM
         njoR3zWn6kSn4yt6w4gW6oZzihA0Sz9Q+NRi2xA2TdM5NJSJlUXYr8zslscwuPpSiIWo
         nTfa2oamWnEG0w3q2/d9lslqURRB3erTGpmK5A9vaDZhv/ThdCNoYpY9bnGwFe8+3z8P
         4k820CyISactfybhZ2bBMcdtdpztjMlWWsA17Km89rqYbDk33E9By3LixSBnaOt36PMD
         3UpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014552; x=1781619352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/t/KVtkqwokTt2oNchcdf4xUUArUEApR4RsM4t4GGaI=;
        b=sTxX22q11XhT+Kj7Dbt91J9oW5j3BMLx73OBGe7PAbW7TGP5yGtQRzA3rMCOxaMqpU
         u/EY5bl8RGMtJnyeqC14DEEk1AUSiWr+zhFLUeJzsQUTlSsMDQh7c8f1hoxE/knwUCy9
         BC18xxlK5AuZR36fPtfAmgKBLd4dKPzWAFforR52iOdhRgAfdJ1cR1MXL7a9vZI218jk
         MuwOclAzaLJzVtXpRu2hUZ6nMAlkiXLYL9beTPUd4a1a9lekD8XkjOP+IMeu4Z9QNbFd
         FSPt2WJR2WusN/cGwivDChx3Q8PLvOI7ZPeoZMtVG+4IafuoojEpL/5gAZKsRH4Fyymt
         4Tlg==
X-Forwarded-Encrypted: i=1; AFNElJ88hEHDvMJLipNlLYEm3v6yOvVLotOOqnJMUEi9tha/8x+CfracSlpHWghtiIwBNZwXhIrRDRcswMx/rQrnzb0I@lists.infradead.org
X-Gm-Message-State: AOJu0YzjYdGFBTls4iJH4sv3Bec99OZG2d6FMKL9hUFDyY5ZIhk0dTu9
	l9NXuK0QQRRMfl3m4ARPE0Hyz+7HXYU7NAdQn3Pg1QBub3zMr9Tz+ieGj/yN0JDu6zI=
X-Gm-Gg: Acq92OGa0eJQTe4JSSckRPbqL18XmBec3Hknm3rcTig4kT/CDQX+4BTPX9YhgJ8xabv
	zCL/gR5sgIQiV7sFBQE4FQw+xHvujdc5raS8LIrm1JnmqckYUhdv9egzo6nyTKAJBHylT6GAX8c
	qZ+TgR1vvyjdPPOv6/Wo4S6Sm8eDyvcUQnXkHaB1us4/GFlu+z2UMvgY4PM/RFhH8852umq+X6G
	WKL+PGiwRDZBZ9LJHxQTkW4aowh3R/e2H8h4+ieNfEazIcsE/L7QiyQkT/dU/i4dWoxQm+fenlp
	WXJbU4LwrQvfQA33KX5xcZBBF46M+lU+Vb34hvau4ya/pGN55vib6wxY0dUry6m3TzhQkGHdmgR
	SQqs1iB/SSthe8PiElBp8yODxbPNacdTaiqp/d0QbhrAKacKP5irlUUlescr0cuWJlS87HlyUQI
	8ClQe86py//mNYGh/6ga8NsRdg2cRgJCYpmAI/n90RpfTbt3xXoGd8LqZ9RUigHZGQ3ZkdiTntF
	+oT5/O6B5xwfh3N
X-Received: by 2002:a05:6214:626:b0:8ce:ba04:7bc2 with SMTP id 6a1803df08f44-8cee626f0eamr293032506d6.38.1781014535341;
        Tue, 09 Jun 2026 07:15:35 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd077be8sm204702746d6.40.2026.06.09.07.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wWxEs-000000021xL-0mOX;
	Tue, 09 Jun 2026 11:15:34 -0300
Date: Tue, 9 Jun 2026 11:15:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	stable@vger.kernel.org, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v6 14/20] dma-direct: return struct page from
 dma_direct_alloc_from_pool()
Message-ID: <20260609141534.GJ2764304@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-15-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604083959.1265923-15-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_071553_726315_337F1E04 
X-CRM114-Status: GOOD (  11.61  )
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

On Thu, Jun 04, 2026 at 02:09:53PM +0530, Aneesh Kumar K.V (Arm) wrote:
> @@ -270,9 +270,12 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	 * the atomic pools instead if we aren't allowed block.
>  	 */
>  	if ((remap || (attrs & DMA_ATTR_CC_SHARED)) &&
> -	    dma_direct_use_pool(dev, gfp))
> -		return dma_direct_alloc_from_pool(dev, size, dma_handle,
> -						  gfp, attrs);
> +	    dma_direct_use_pool(dev, gfp)) {
> +		page = dma_direct_alloc_from_pool(dev, size,
> +					dma_handle, &cpu_addr,
> +					gfp, attrs);
> +		return page ? cpu_addr : NULL;
> +	}

You should probably put this at the start of the series so it can be
backported

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

To Petr's question I think this just shows nobody is really stressing
the PCI dma paths on CC VMs today.

	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);

For instance the places even calling dma_alloc_pages() don't look like
things people would use in a CC VM.

Jason

