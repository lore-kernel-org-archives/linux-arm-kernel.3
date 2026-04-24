Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669F8FED3EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=baVqOWXW0W679wCWJSOseh6T7DFu4rt5dV7U28qjPJU=; b=mDjN86ywlrL5aE4NpbiuPQJDu2
	84p4OowkgD3OAFpV4BDIedPmQtAmkQbY1DRifiBrPIPtB8Zhoo31Cti/qNS25e2XRf57dWGVHP0j3
	1UpB94htjehVBJ0g4Ty8POUwnBarxBZMuDjdKlVZPSrpzXpKrnVOxLaUm79iox7jHffWe1AOwSEcc
	iTXSQbK/LYOrwJOAOI7TjY1mibMa0jRZGlyLZxjjcMOQgzu/URp+BLnL46suUMf9asDd9TCs5u+Vu
	BZ6QYR+eKo8D/JsTpUxGrYV6S5LQOzIb1t0013oZg4Ijin/g680qf4XoLG1PurbRDKANQ0XN5Y1mT
	E5u41l/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJYs-0000000DSYo-08Lv;
	Fri, 24 Apr 2026 16:39:26 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJYp-0000000DSXk-2Xa5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:39:24 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-50faeb8317bso42884641cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 09:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777048762; x=1777653562; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=baVqOWXW0W679wCWJSOseh6T7DFu4rt5dV7U28qjPJU=;
        b=FHKnMG8KFpfOTdh90xDdwAvDsaWz3pssBg3MynC8MaapRE86TJu6JufngGhnaPn4LB
         30wJc1QBhbQJ4ah5sy9VMaAhHPA6CXrDuJx0TIBGhfx5ETeQGLOhcjlJXlLfGltM/h2C
         wmnmUIDqLQ9HYJMxXi1G3j/l2clMitKEX36hIgvo46/hDZTo+cpWNTjMTGGdF45sDQkm
         ipJMphzx3t2envdc1iNJTEBjVRkiOiEFDj7R7eVJoNvG40vvyHUxr4uZ2pSbcom6BFcP
         Dextrx+GMrzcUuKvVG5AyXUI33+qGJW8XZhpVwr7yGA+aALNZTr30ycnlviyOCtQL3q3
         +JpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777048762; x=1777653562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baVqOWXW0W679wCWJSOseh6T7DFu4rt5dV7U28qjPJU=;
        b=kr4qtJctCXBDzI6/xYjrCoeqWDbnO3HLOmY5oxnYHJDke3THLjPMBbROtvqKGhIf6Z
         x0x7hbOfxVmSFrNjqp2DL+0SFvLqeHr+sWQiVyZ8h/6cs2wrE737AoDyeK5H+auwdbVO
         0mGm4N8nUhcbpwX6JXSSeN4F63bD/K+qmnp+pEqVQ+Z6snN7v82cKAwQRxwlVdX7hLZP
         X+LSX3KmR2KRw6KNBqoGElLOck2kGpiVOcVmbKMux6jjcHGTFytiLPioVEFVA4tvWf+g
         PaVCSFTewbYcJjpNVflRYrXbM2f5kuwlNmTDq3+Oy2UsrPX4Lnn+XYQ8AknucxkhbpRh
         GtbA==
X-Forwarded-Encrypted: i=1; AFNElJ+pALLjpr7cqElWn+5KFAu2vz3Kxxn8quT5JxdyGBrtYCcjWtoWMZhLQKjIKilUuTLeWev0fYZCEXuae9+8p5Rk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8PnLHuw+uH9f9yz300EMUbkzlXS+axenDeH5CEXeExK58rJFu
	aDJAWeicc6Ja3jfAGA7laqlY6kEozn8owjn65lwM5BsF36TaWQFd5zv6gxc9KScIdwo=
X-Gm-Gg: AeBDievXVsZnZV2JzUFln44RcCidSBqECPHMDhuUtVD2o1Sh8f7LPwS2tjQ+QRBSI1n
	vwAL6R9Om3X4SCvC9r2gr7TXAANVa+/sBBMy6lA/vUKQfRa8psuOCemRIwFQVZvy+UgHU420VSg
	qOshcu8Q96QuAE2j/bZ58EZXJu54mcOvglwVo1Gi6h5u/qSOMLbJ8hHVlQgARGJbt7RI9B1WjZr
	RJM26oyoREzsRnn8ub7uBFu/d5JcgyCTJZm5uufoGe6GeTyyTcJ+LJwzrIXqG/W4+58BXl2/idm
	WnwnL8Bjfjn2sIWgVFIjeJq6vrITz51A9mlvc3SbfuLTU73Pb3UO3D34YqmVfKvU/tNNOzWJYfv
	+GIXYrPjD32szAio03/oI0gNE52zAZZIdxRX33svvbsS6t0J6pqEOrVsYVOJ1sKq4dgbheW0Udi
	Om3nPJIJnum8QQRPRKiEe6hA6S73srAwJS4IWcuc4kIFYx1+Pd7MgZnyp6H8wCSUFdkrzs3j4py
	thFHUN0zlqBjDhJ6PAhIl65/xI=
X-Received: by 2002:a05:622a:4187:b0:50b:37a1:a012 with SMTP id d75a77b69052e-50e36c419bcmr479897421cf.41.1777048762005;
        Fri, 24 Apr 2026 09:39:22 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae7fef0sm182965026d6.38.2026.04.24.09.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 09:39:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wGJYn-00000003KVv-09ty;
	Fri, 24 Apr 2026 13:39:21 -0300
Date: Fri, 24 Apr 2026 13:39:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Evangelos Petrongonas <epetron@amazon.de>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com,
	Zeev Zilberman <zeev@amazon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow disabling Stage 1 translation
Message-ID: <20260424163921.GG3611611@ziepe.ca>
References: <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
 <20260422162351.GK3611611@ziepe.ca>
 <aenp6FHzx9rtUQkZ@willie-the-truck>
 <aenqxasLJ8yKYqbT@willie-the-truck>
 <20260423142326.GP3611611@ziepe.ca>
 <aepRy7Gp7Ng85Zr7@willie-the-truck>
 <20260423223716.GS3611611@ziepe.ca>
 <aeuJQW8bGLY-O_vv@willie-the-truck>
 <20260424154256.GF3611611@ziepe.ca>
 <aeuT1-TB6dOT5ZQ2@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeuT1-TB6dOT5ZQ2@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_093923_682152_FD9ECECD 
X-CRM114-Status: GOOD (  38.43  )
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

On Fri, Apr 24, 2026 at 05:01:27PM +0100, Will Deacon wrote:
> On Fri, Apr 24, 2026 at 12:42:56PM -0300, Jason Gunthorpe wrote:
> > On Fri, Apr 24, 2026 at 04:16:17PM +0100, Will Deacon wrote:
> > > > > > STE/CD is pretty simple now, there is only one place to put the CMO
> > > > > > and the ordering is all handled with that shared code. We no longer
> > > > > > care about ordering beyond all the writes must be visible to HW before
> > > > > > issuing the CMDQ invalidation command - which is the same environment
> > > > > > as the pagetable.
> > > > > 
> > > > > You presumably rely on 64-bit single-copy atomicity for hitless updates,
> > > > > no?
> > > > 
> > > > Yes, just like the page table does..
> > > > 
> > > > I hope that's not a problem or we have a issue with the PTW :)
> > > 
> > > You trimmed the part from my reply where I think we _do_ have an issue
> > > with the PTW. Here it is again:
> > > 
> > >   The non-coherent case looks more fragile, because I don't _think_ the
> > >   architecture provides any ordering or atomicity guarantees about cache
> > >   cleaning to the PoC. Presumably, the correct sequence would be to write
> > >   the PTE with the valid bit clear, do the CMO (with completion barrier),
> > >   *then* write the bottom byte with the valid bit set and do another CMO.
> > 
> > I wasn't sure if you are being serious.
> > 
> > CMO + barriers must provide an ordering guarentee about cache cleaning
> > to POC otherwise the entire Linux DMA API is broken. dma_sync must
> > order with following device DMA. IMHO that's not negotiable for Linux.
> 
> The problem is with concurrent DMA (from the page-table walker) and I
> don't see anything that guarantees that in the CPU architecture. I don't
> think the streaming DMA API pretends to handle that case, does it? It
> relies on a pretty rigid ownership concept from what I understand.

I think you pointed out two things, ordering and tearing.

Ordering is OK. If I write a PTE, dma_sync, then command a device to
use that IOVA the PTW must observe the new PTE value. Otherwise
dma_sync isn't doing what Linux requires.

Tearing is a different issue, if the device uses the IOVA and races
with the PTE write changing it then you say maybe it can mis-read it
with tearing.

However, this race only happens if the PTE is currently non-valid or
being changed to non-valid. Meaning randomly you will be getting an
invalid IOVA event.

In non-coherent mode we don't allow SVA and we don't allow VFIO. Only
the DMA API and drivers open coding things.

For VFIO and SVA, yes, we need the HW to work and properly, userspcae
can trigger invalid IOVA, we can't tolerate a corrupted PTE.

In embedded I suppose you could make an argument you don't care about
it since invalid IOVA would have to be caused by a buggy kernel
driver, it should never happen, and thus this is really a debug
feature. If the race will never be hit in a working system maybe it is
fine to leave it as is.

Would be good to document this detail :)

> Of course I'd rather that the architecture said that our current code
> is fine, but if it doesn't then I don't have much choice, really. At the
> very least, we should minimise the number of places where we rely on
> non-architected behaviour and so keeping the CDs and STEs non-cacheable
> remains my preference.

So, I am convinced, PTW has that escape above that doesn't apply to
STE/CD. Those can be accessed truely at any time and we can't ever
leave a 64 bit value in a strange state.

Jason

