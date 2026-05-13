Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B07CD4F3F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQtwNmxswhQih8gmC6FPDl+zfVKzr3i0rq4YmglfcBk=; b=ZRQ47uJ9UNTIt/UGi7Fdqru/yd
	T0MXEj12IrzJzyMtsvOP1NXk7shKW2OzzjRmLuDaqjd7I6S2p5IqTTNFfaXqaj/ZXzartmQp8fw1P
	Y/Egbf/54M8smrXB77vigL53CtfozbYvHuNq3Gn4dL6LM60CPUlWLXpLTSOAfcAlcF1cgb4gJUqJJ
	BRz9cJ5UrU/xbnXT4FLNJSHgGnOYqMYqdE5YF92dW8rNRk8A1QLbQEikCABeAD8/K67dYGCJ6oxKL
	EN4aY6VLkOfuaxxnldA2b5y8JV306G6ZQBVYTF/as7/ewa9MgIdvgrs2AfyGtZN5aWSx+boUiISdz
	t5NgS48Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDKK-00000003LZS-0xoj;
	Wed, 13 May 2026 17:24:56 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDKH-00000003LYt-3kby
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:24:55 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8cb40149037so653871285a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778693092; x=1779297892; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQtwNmxswhQih8gmC6FPDl+zfVKzr3i0rq4YmglfcBk=;
        b=WVZiaENQ2euiMfgLMy5ZDQcP/korV7rP3gZnllnJ5a8Oqpce9Zry3lH2IcFkeGoAVh
         iLNYN/4z5BPyS3xT7gU7ZsUtp7diVytc97z7LMLnmnoDw1rj/7AeGdW/RNn/dR8vwmYQ
         jf4APFZkT9XJ25t9FILKb8ybgQCsRgRENDHW4pXFVIUTb2XVxYYHZs8Jcp6ogKpqb+ZA
         CEC09GjomDl936e0AvoumReYVN2twcYZ5eLanRCqBqugRE2o+hMFAKb7xsPQnX2f82eN
         Z8xH+kWEtSkSI5n014VUU4MQU1eKH3mU/jFgdfmpkv51G/bVaeEmqfbCpr2FEhlGt57M
         HCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693092; x=1779297892;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fQtwNmxswhQih8gmC6FPDl+zfVKzr3i0rq4YmglfcBk=;
        b=f1hKYs+oBn+sQILT84493/IwDhRjwsyKq7lOeGsHBO37240Kd9ggPN9nZ493bDIoUl
         u7nLdYeeS8XXmRW9tfYvb8hezLo9Z1NfaqZSn30bx64Yh4XhoFqxn4A02VuzZWvnLaWa
         806atK1FZoU2txnFSVdIRjLieVo94/F6HITck3y+kQZ37H98tBysw+3jsrPFFMSEqPIy
         5r9NieD2pktrZ7tPzIqu/zWrlRQEf+PsTELzsfY2f4qIsvWs8HGrfoAWtpVHz0pIOCRe
         X3BudqqWgDYZfi5/NMTvyFqMNWU1b4T1HMvy+qSA6nKHrNrbL69RdX5TVhBrL00PXV6Q
         tqTQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qVmOnOPzDdOKRKb48re16Ko1+7TsU/8luWGfCDCNk+YlOQae+O/oBf/gCVXXRlPPj93HWbe5R7eYfJiEty+2C@lists.infradead.org
X-Gm-Message-State: AOJu0YwdOrpFb1E3ii5KfOAY4oloNbcy14aUyGiSRaYGCvNDJgIatNDP
	BOIvt/ZQpO4Cqvp3GXAwXBd6oONO3gD+7I+pOw/eirinV7XCfxL9zxRbgbltZjtmjP8=
X-Gm-Gg: Acq92OFvYCUu3tq7hqU6D/EyqVRF6w6nPPC0QDkCydONt23oGjHRFP7fnckHowcxJ5Q
	Ah4qwzmbWojtoHQsb3QVyzbFyc1tf8nuVqLVfd+rk9uDgeS7JbXhMIxKhFIG+8pRxtpBVp+nwOE
	PjYgCqzluAWlwOZCsAToY1x4R1Yc8r80iKl+ZKvSazcqFg5EYSQnZM1uvXRtnerV8bp1CInAc+T
	DeTmPoUL3yB9rsLFR0LQy6xgkzl802Qo9JlKFczEMN9uuAgNQ3IAjHQXxtE5GFygr7Nzl5J4it9
	a/NZFSin2SPoqRZn8JSG57h1K7r7DDJ9YCEsE1k9BjHVMz1DYYF+v4xZ1n9iZwKv+v9qwkiksS5
	wG/Oj//d6C1zW2PQg78z/OY4tUD1kM6O2kKDNS3cO1CFrhHmb/VVf+OxrrWW7KDx8sJdbGkTAk6
	XNhx8nKmVisrdMANCO83S5xOlrIBMB3S16rehr2mUlIvyCCrkVQY4u+fh3xCMzb3IS23/Zdlc4X
	6N9SA==
X-Received: by 2002:a05:620a:19a3:b0:8ee:42cc:4d9c with SMTP id af79cd13be357-90f8ac08735mr658592985a.39.1778693092335;
        Wed, 13 May 2026 10:24:52 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bc83bbf5sm13598685a.28.2026.05.13.10.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:24:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wNDKE-00000003dZu-0jxL;
	Wed, 13 May 2026 14:24:50 -0300
Date: Wed, 13 May 2026 14:24:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <20260513172450.GR7702@ziepe.ca>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agSKQrSIhizCXKwx@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_102453_944121_F65209CA 
X-CRM114-Status: GOOD (  27.28  )
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

On Wed, May 13, 2026 at 02:27:14PM +0000, Mostafa Saleh wrote:

> > +		/*
> > +		 * if platform supports memory encryption,
> > +		 * restricted mem pool is decrypted by default
> > +		 */
> > +		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
> > +			mem->unencrypted = true;
> > +			set_memory_decrypted((unsigned long)phys_to_virt(rmem->base),
> > +					     rmem->size >> PAGE_SHIFT);
> > +		} else {
> > +			mem->unencrypted = false;
> > +		}
>
> This breaks pKVM as it doesn’t set CC_ATTR_MEM_ENCRYPT, so all virtio
> traffic now fails.

How will pKVM signal what kind of memory the DMA needs then?

Does it use set_memory_decrypted()? How can it use
set_memory_decrypted() without offering CC_ATTR_MEM_ENCRYPT ?

> Also, by design, some drivers are clueless about bouncing, so

Oh? What does this mean? We take quite a dim view of drivers mis-using
the DMA API..

> I believe that the pool should have a way to control it’s property
> (encrypted or decrypted) and that takes priority over whatever
> attributes comes from allocation.

We should get here because dma_capable() fails, and then swiotlb needs
to return something that makes dma_capable() succeed. Yes, it should
return details about the thing it decided, but it shouldn't have been
pre-created with some idea how to make dma_capable() work.

If dma_capable() can fail, then swiotlb should know exactly what to do
to fix it.

If pkvm wants to use the hacky scheme where you force a swiotlb pool
configuration during arch init with force swiotlb that's a somewhat
different flow and, sure the forced pool should force do whatever it
is forced to.

But lets try to keep them seperated in the discussion..

> And that brings us to the same point whether it’s better to return
> the memory along with it’s state or we pass the requested state.
> I think for other cases it’s fine for the device/DMA-API to dictate
> the attrs, but not in restricted-dma case, the firmware just knows better.

The memory type must be returned back at some level so downstream
things can do the right transformation of the phys_addr_t.

One of the aspirational CC things that should work is a T=1 device
tries to DMA from a decrypted page, finds the address is above the dma
limit of the device, so it bounces it with SWIOTLB to an encrypted low
address page and then the DMA API internal flow switiches from working
with decrypted to encrypted phys_addr_t.

If we can make that work then maybe the flows are designed correctly.

Jason

