Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C48C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaFiCRG6TDd5hbIwyaOKkhGT65gZ81YsG2fbaxJfaHI=; b=Vxco/PObGyf6XJo80wCDllHz9A
	alPjX7aLfGHl385yEVnwnOPi4fl7eLmLY0fdfyUuKQYJhsbkIpFmLveCNWqcZzw/NHNQKZahWMvHT
	J3P/kDH8qzpVtgLjgEXT9RO5B35+C3XWztOf0U5kkie3TJtpSamUZWSS79+dWJ4jieKtL00ZAeaz2
	f/pM8iDomvGG4YlMUlLKboer9SlP2CbFpzAvmIn669tbBkiOByZY8uBBhfznU6izZMKqKzoE0Mt32
	a++9fn8AHfmT5eRE37H9tMzPVOwBq7Js+3GNwqDyNgDYL6/xX8QbKU32KxSGcEayXDot3YDGkBgTS
	Rj0rFC5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMX2-0000000AJAO-0566;
	Mon, 13 Jul 2026 19:41:36 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMWz-0000000AJ9t-42ol
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:41:35 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51bf2479349so26437081cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783971693; x=1784576493; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RaFiCRG6TDd5hbIwyaOKkhGT65gZ81YsG2fbaxJfaHI=;
        b=aqgqBJADLK1l/gmt/KIMy4qut6M3S4fBN1R+OMW7sa3ItPpgUkCOLc4GLwreQnIONi
         gueYCiqjYAP0W1EG94Y4WOlaSrygavylIhR7oUuhpjq8HCeRaeuWGsHlNvsqcCm0IkAg
         p0FnODv3RjyYT2pIjOxTMNzuyiH6rCRSglumxXUBqhwPsexrIfzTZS/5WOeTQOOhwEaa
         K8leCbqA0FA36Ecn/apE/c7p1NqtaDhnvfihXro22StItIcyWS6WNwSzQy/DLra6t6mP
         9L84Oze8+DZfxeCz+7hQfRPXJVXHy/wZIyup6Ov6uxUdglbWpPzmZuIURmE9Ueeq625K
         K/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971693; x=1784576493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaFiCRG6TDd5hbIwyaOKkhGT65gZ81YsG2fbaxJfaHI=;
        b=lV6CWGbo2J+ot02Smieq/ylEn+FECmVyNf2edobsDOsyGYFFKknYF7LpmrVdwckWdh
         fVE4Apbrpftc8l62tbLUIDE3F3Ppo63DHye5HPY0gTadOzaKJrzG0A8nN5QPzWv+zwtX
         TqAAJ73W+5hmn331Yx9PTSxaEX5aCb5DORD9yQ/oLTfWoNhK7XEvxmBXVYj4hA7IL21Z
         GRUTtcLPnuq+T5nZLYQCzYuLNq3gUhlW8eQ2bc1DBLncu50J6aUxaSsIcHSLi5sZ5vbg
         9waoiC1uzv3tr6pWd8HAXiUscPIMgN4KZYvIqOj7g6Dq9hGhDqCsX/HxyCjqsgu6uMzK
         ctJA==
X-Forwarded-Encrypted: i=1; AHgh+RoV1UaFQPPsk3RuHkkVHeR2MEgbvtumuMpOWHISKvk7ZfbYUH1kh4zLZIpYK1hjoZdqE+vB+etxJraYtKi39D8J@lists.infradead.org
X-Gm-Message-State: AOJu0YzI1QtwNEHGtCVYAh/vW/yoACrKFdvU9gI7fVkQFr7CnpwswlNb
	XWfWhtOv52nEUH3hsUqoRsgP3YwP8Kj5Grp+DiGXXSJJlOfBzHUjWfk2VwymribeXEA=
X-Gm-Gg: AfdE7clqmwCFlJpIFZLYxHZZwcvoaUZU9mUKzIzjmvrPzQf4D8gPVn6Pn/0qhwV23Jm
	t57BxeeDy4R3gwVhLkewOSc+7bbt44ZG8zi+vSIjrlboVhfWJbEy9R6uy3/1aMPDSDlJl8s1Lgg
	d+Ye6RXx0mpklGlfLDC5ACWZ+1BgQw8NCHuE8OCCbjPF2fg0u+j97rPaoEE6S+H3lSwpnaNLYmx
	gVsK0N2Nq6zR4Yoyisxi9nNTYeT/pijqEMZ+WZqwbm36B4GEO027RGLECfpIJgx0ATtvKyTGeje
	hqqlok3DxbQ5kXg1tH1RpVB+H4DOPeuEEyz0p+dGxCCkzGp84WSjYSS/XUGeAL+3y/T7UWql8SA
	XEoESkFH9FLGRIAj9RxptZe1rneryLUgrHJJdQOt2YBZ/vEx2Sg4aO70QC7xv
X-Received: by 2002:ac8:5fcf:0:b0:517:8711:d46c with SMTP id d75a77b69052e-51cbf0f3fa9mr100726891cf.31.1783971692761;
        Mon, 13 Jul 2026 12:41:32 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caafd8b44sm90213801cf.30.2026.07.13.12.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:41:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMWx-0000000E6nC-2kaU;
	Mon, 13 Jul 2026 16:41:31 -0300
Date: Mon, 13 Jul 2026 16:41:31 -0300
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
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 20/22] dma: swiotlb: free dynamic pools from process
 context
Message-ID: <20260713194131.GZ3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-21-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-21-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_124134_013846_641EC376 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 01, 2026 at 11:19:24AM +0530, Aneesh Kumar K.V (Arm) wrote:

> @@ -840,7 +843,7 @@ static void swiotlb_del_pool(struct device *dev, struct io_tlb_pool *pool)
>  	list_del_rcu(&pool->node);
>  	spin_unlock_irqrestore(&dev->dma_io_tlb_lock, flags);
>  
> -	call_rcu(&pool->rcu, swiotlb_dyn_free);
> +	swiotlb_schedule_dyn_free(pool);

This knows if the pool has cc_shared memory in it since there is now a
flag tracking that? So should the work queue version be conditional on
that flag?

Jason

