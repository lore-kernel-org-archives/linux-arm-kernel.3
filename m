Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F51CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 23:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=335DhOmKigacyWrLMRbFPigANHuPSLtNVBCr6CAA1o8=; b=WtZxs7DdQtC0NSVGTnWI+DhO0k
	XMhT/3tYJa2igS/EiUG6ivcSNSKm2zo+BE05hjc3vFldbfYmtTDNHL3u5FFsPvt6yl4aGDPSglfEr
	WJN70/5R+MS5vL46PEzREywXG3HhgL7vQfLU9zJHTtAQqjQbLzNPgvX/ImESntXYRjcay4KUcxgOe
	joCCETRw65M81n4b2AZopZ+jMELbUV/or9m9wSaEcMlPBtT/T5a8nsPSg7LiOd1vUV46+5uKmUJBU
	w9h92AU5dRNB9xhFfd4RwdUp3Yud4Tx9IfX1wAmJRQum5clIpTR6u/lZNoo7WdtxJoIpoDmOzWO0H
	a8JcG9jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLqzg-00000009o1J-41FG;
	Sat, 09 May 2026 23:22:00 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLqze-00000009o0Z-1CPf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 23:21:59 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8b98482b253so43785466d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 16:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778368917; x=1778973717; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=335DhOmKigacyWrLMRbFPigANHuPSLtNVBCr6CAA1o8=;
        b=D0VfQq8GsTXFtF2hTVhk7KW1X+9jSczLBFVk1V7Ix/Qr/9E1/dccKMZ//jPTmasE4x
         dSoMZZnxIs9MduuWdri8EvzD/Uoz9XmrtU+PlqfCmuFVA9WPx0Hg6d1cQAbnTh9m2jjj
         NRH372Ja0ksfmUOXJtOu9VJl7ArSWN+ETT70zfhVu1+LZ6by9q7MCsqWXuvbXhHTfQmn
         QhBsDN6a1RryXG4MAqohmQFw+04PkW5rjZx7ik6u9KecCNs+Xkmm5SI7oVxaytwxBfia
         vQbjHb1jHEOgIODIiWEqtqph71J8ZJTMVSqRjOSphCr+ZEsPf7r16DP/C393r06Bmpc3
         bdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778368917; x=1778973717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=335DhOmKigacyWrLMRbFPigANHuPSLtNVBCr6CAA1o8=;
        b=nDec/dvlGo+rznNY3vZGEVH+52uU3OZ8Hqds+ws2NF6FDdYzHPiARoIpDEH5dEnw/p
         95K8dEwBEu+F1kyFoXfDAWzkT59mrsFY2v0HrQfKRuvLK4LnJlYzczjIBtjL34h6/CEq
         bhNwmp9s4JTRhy4QbgT3ZtWn9/kVhlP0j3zymxvbODMGHxlKHa9cYBKCDAUYJ7MP98Bp
         KhTZgIbU2Igd3iltO/WHYKmxwDQUF/TXG8Nd965L+FCoX8IsaAWQhujubeWdhnaTrYmA
         J+qHfC/F1lQs+ENMIRPNxUOGBPcUTJHt3nxvLdgUcjaqOabn/N/b+sgyglNJFH2sxM1c
         zf9A==
X-Gm-Message-State: AOJu0YwCrrc53LqO7jq15iE3bXntLerJSmIXjXSwuWR5scZpnrRJQ6Uh
	dCIZGbRaE1zXskkLAoFmJsF9TdQlxY3gWKdlHsLgMwSYhbYx9Nq60PydXaH43k5Z4GU=
X-Gm-Gg: Acq92OFys4G3CtnJPSWbefAHiUigfw5lAAd/zAZpjvdKH18+Wljl2+paC04D55hBT/z
	j0JzDrKGyOFfKIYJGmC7JULrTKykHY+1ohpEl9XL6ofV+SQmFzD1h4W6LUL5+ZRqz5a5RMKPlV8
	EVrj70y+ooe6QxqLeP08Zc7zvL4RWw+FdCirEMoNxvJmcdqYjx8/GNFonR0BUmlLuzdCg2qD6vM
	Op1kVj8180AP66+J4z9LYiECWlnnri3Yu/1NqzhT9tD3fHruIaDnlk0+o79zzAASmqLReb2BzsT
	BqNA7LlKHaU6dSOb+GIbuWs3tJWWzeNIQJHjR8J7fyWlIQgUtsVs+rpCZRrvYKspyIc+yPLrY08
	XbfbXvJFOhnxl2hWk4BxV7VwMh+ciAPGcmoUW4yvumkpJzTo98zeNbwQMBIlQqX6AHb4vFyN61d
	I8gmfk7I8cI0pyPIgdP4gI8LyjzMeeZ6XKnSlXnfDUlyviwq2HdWtwxmJGP4k108OX5gFYeOKnk
	BBWF1l7l3lWGp1u
X-Received: by 2002:a05:6214:258c:b0:8a4:c1ef:d727 with SMTP id 6a1803df08f44-8bc422a6815mr269722106d6.10.1778368916771;
        Sat, 09 May 2026 16:21:56 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0c84d4sm54348816d6.0.2026.05.09.16.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 16:21:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wLqzb-00000002N2n-20cg;
	Sat, 09 May 2026 20:21:55 -0300
Date: Sat, 9 May 2026 20:21:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 06/25] iommu/io-pgtable-arm: Rework to use the
 iommu-pages API
Message-ID: <20260509232155.GH9285@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-7-smostafa@google.com>
 <20260501122424.GA6912@ziepe.ca>
 <afiO2WL4ILGfmUui@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afiO2WL4ILGfmUui@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_162158_536536_2AE43BDB 
X-CRM114-Status: GOOD (  22.04  )
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

On Mon, May 04, 2026 at 12:19:37PM +0000, Mostafa Saleh wrote:
> > So.. I suggest you update it to use the iommu_pages API, #ifdef out
> > the allocator so the pkvm pkvm doesn't need to deal with it. Then
> > compile a special iommu-pages for the pkvm side presenting the same
> > API.
> 
> I see, we still need to leave the DMA-API calls for the custom config,
> as I am not sure if it can use pages not backed by the vmemmap, I
> pushed that into a separate function so it’s easily compiled out.

Yeah..

> Without this patch, now it looks like:

Seems reasonable, and then i'd probably just put something like
   #define dma_map(...)
   #define dma_umap(...)

To effectively take it out of the pkvm build

Then have a pkvm compile of iommu-pages to provide the functions in a
pkvm compatible way. I guess you can't actually fully do this, but
can do enough to support this file at least.

> > You should have a pkvm shim header that provides
> > kmalloc/kfree/virt_to_phys in the normal way and just #include that in
> > io-pgtable when doing a pkvm build instead of hacking up all the code.
> 
> Ok, I can do that in another change, but I believe it's better to
> change the usage in this file to arm_lpae_*(virt_to_phys...) so it's
> clear which parts are intended for that.

IDK, why? virt_to_phys() is part of the iommu-pages API, I'd just
leave it.. If you want to narrow it then #define it for pkvm when
compiling this file..

Jason

