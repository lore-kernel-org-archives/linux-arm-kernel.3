Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C587D5C0C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 00:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrHNT0ZwzeHqirYSDva6eOqkz8F2/giVsByWb392zck=; b=AENL00KQ8/xfKAAhlHcwZbT9mD
	uxK1/Pj6dk02MV3I8hnGLg5o+EkNm4KZ58siamzBiroSMlyfa5bws3gUOxcitBvd4GCsYYpWgqlN1
	e5uzspEMxcrgIFQ3Jc9+W/xRQhvW7dP8XzXUmcjisXVCAd+ziN7dtFX18tdjcVqM5WQDKAilROEGj
	e+Ks+sBb+YwSsvxHehciAKnENYTKoz64RdNzmC2+bEjRA3XC9r2UCWK3ZIc6Dz7rLOf/HjHGWqrds
	USVdMGnClL5lxkZl1RtbxCl+KAtREyWkp/CcS5Zi3cMBI4JegFQuSYZmwNtdYTw3Iqmk3gClf42O2
	Jml39XXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJOi-00000004TFB-1VTM;
	Tue, 16 Dec 2025 00:58:40 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJOf-00000004TEm-36w3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 00:58:38 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8b23b6d9f11so443555485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 16:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1765846716; x=1766451516; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DrHNT0ZwzeHqirYSDva6eOqkz8F2/giVsByWb392zck=;
        b=WW1dz1UK0chIkc2FjRIN5kPkIdw/nmf3bMKNYNFkpDtr0rSJFjPwvnreynRY/AZmnN
         /ND3nUWqT/3BX5MQvUTGjev3c3htdXj0t8CfzWpc2f0dfnK8LHBhHQrbEUSejFqM7xVj
         Uua8olyyVWFkJvEwB+0rON0t5rk9lTqCSdJfBws+lbfBqFAbMWXaAn5Tof3FbrpMx+3P
         bQ8hxmlFC/ArkKylYl22nCZeXlJKRSE3Hdlqn2GrQ27YW8Vq++J0aHc0xS9WsxUIv0jN
         up1AR9dNF1QLJjTpwAVXJ9vQc9Dhp2AHIvAn8YZdTp8BW+fYrFS7OwQH7T7RbGGzzrq5
         MUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765846716; x=1766451516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrHNT0ZwzeHqirYSDva6eOqkz8F2/giVsByWb392zck=;
        b=prfZaXWaLNQHaG6WhzUasK+Ks339aYYoxDitcW8iJJpRduwOA0OXghcFa1BAIBZ33y
         32bmNLhONCFG5BsYIgVj1gjCRkjj0GOPl+y5WW4HTF4AuOJk6cbHiIdRjYpizwrqMhVu
         0/bxzuO3+WtJ9qyLuA/nUe0WiLGxagap7rXUl4srRVDqAIKWR1u2/VJ1Lz7Jl+qB/2uv
         idQX15H4w5g2qpq2si0Nov199HSK/uJwVji+IV1tp6g5ZIL/28p4v28R6/JuMocdv5ft
         tNdfunG4MmLPWjFn2lWXQeQ42DY4A269Lj3HqfCkamTPdeML/cZ8IGe32C7WZdw0H7lt
         joVg==
X-Gm-Message-State: AOJu0YxY2zudmrOMfs9qBNBCACx3VhiyUjXjTZgP7TsZMwuhFWMtznwx
	x3Y0auBEjLdt2x8oxwXWfGMMH0dC+oNaU54Cz1d368p4bwGLcR6PIbsMo1KzacYiLlA=
X-Gm-Gg: AY/fxX7az68Yv5YR7h98JROlwxMFTWRWCiR+E/t3Ox232qwAVfKEhi6bkhCUw+DmSw+
	dvcmLEWzDKAG/FEJCm0NClSYgwU9DRj1z/XiaWbe2H66IWHxY5LCgNiooG9AEHSJguYm6vRuAsH
	pFDsshFAszucrPEW3GubbtIIO4b6ELpwJ/KuGQg/Rb6BAokASeC+DagtIzO0JS4qCfXIOXj61Jx
	aHewBTHF6YreUHcIWXDcnE+vt/OXpS7NK7q64RLmbjXIrBySaUf6sa5a7xDuRJ4zsLZpyq4NEVt
	69XmBUVFChm7amhlRmmdkpvSLap6naMVfc9g93Mqc8yitaz7YW3wGOrd/U8sVeUAB0keM66yMjF
	1Y/Q9+ohoB4qVkDCu3dBFgNi1b0hD98HUMPN/DSCe3DNNBK/x2IO4wJXRhVYrktP9ekTpLuKNho
	fPXCBfdVWhjHhaICngc174Tz7VHGkX/De+hzlbKbyFZ/+uPCEnv5DOWDjZ
X-Google-Smtp-Source: AGHT+IHK7ERi0e8OdQxsP0t8K4Zuz+cR8Z/0Up6pTGFh+jCgiiMooXvue23D3Qf/UTTuC5ib3dsdcw==
X-Received: by 2002:a05:620a:4002:b0:89e:67a9:fced with SMTP id af79cd13be357-8bb3b359498mr1796140685a.66.1765846715921;
        Mon, 15 Dec 2025 16:58:35 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be31b55a32sm72625785a.28.2025.12.15.16.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 16:58:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vVJOc-000000008ML-3OBX;
	Mon, 15 Dec 2025 20:58:34 -0400
Date: Mon, 15 Dec 2025 20:58:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 04/27] iommu/io-pgtable-arm: Factor kernel specific
 code out
Message-ID: <20251216005834.GC31492@ziepe.ca>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-5-smostafa@google.com>
 <20251128164541.GA812105@ziepe.ca>
 <aTw2x1UlldJGVA4Y@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTw2x1UlldJGVA4Y@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_165837_787153_34C19FDF 
X-CRM114-Status: GOOD (  16.93  )
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

On Fri, Dec 12, 2025 at 03:37:43PM +0000, Mostafa Saleh wrote:
> On Fri, Nov 28, 2025 at 12:45:41PM -0400, Jason Gunthorpe wrote:
> > On Mon, Nov 17, 2025 at 06:47:51PM +0000, Mostafa Saleh wrote:
> > > Some of the used APIs are only part of the kernel and are not
> > > available in the hypervisor, factor those out:
> > > - alloc/free memory
> > 
> > Why not provide the iommu-pages API for the hypervisor environment?
> > 
> > Same for virt_to_phys, that could be moved into an iommu-pages wrapper
> > too..
> 
> I guess that's possible, but then we would have to stub dma_map/unmap,
> which might a bit ugly. I will look more into it.

I am hoping to drop the dma_map/unmap and replace it with an arch
cache flush call directly since the code is no longer modular and
relying on the DMA API will have some problems with a future patch
series I'm expecting..

Jason

