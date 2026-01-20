Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5FCD2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 13:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFD8dduxHdXARbhmuw3nGz+HS5/qU93piZU3w6MAoZk=; b=MKnXwXXCh5bjTsOqiJs6BsRxgi
	OX6HNBw8E+taj7lF43qM8ZV4QyJVBFKasRjY4mzwkjxu7QkKKf7xLOlsnFHiHv8hfuFt+D9SxJIzt
	RhP0yEGl8KpuR3t3TxghuW6cFOQ/9vK27ls1SP7+vLt87KX/i4QTS86Ek6H3XsGRTVhgX6h6G1fFa
	13ALi9bNZF+tRckC8dK1AWJ39flUmTZkIrQmqXMbQj3n4Cv6w4+iGeIX6v6faTNe9if+pRzRKybcj
	LJHvxQHGfamVzCy6SmISynKnI8vwogRjkdhbwFwA+zBIJtzzN2TYsgcrDUHcwBDfmcd76HDAkPH51
	txYJE/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBWW-00000003tP2-2uF1;
	Tue, 20 Jan 2026 13:11:56 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBWU-00000003tOU-03Tg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 13:11:55 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-88a3bba9fd4so56352836d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 05:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768914712; x=1769519512; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AFD8dduxHdXARbhmuw3nGz+HS5/qU93piZU3w6MAoZk=;
        b=jGbzIthMZXr8ljn4G8eKJnhCZgJbgObR1u7YcAo77aM3LXTeHkwX0aQIlcMEXZitiM
         tMDj/6MGXBgjoUdDozux2xiVEW5TtR31en4jpG6Bgadh+W4Tutuq3cbppOWPjCiMW7v2
         UG4vvvX+wy5LaAestWEVWleFxXyR++8H4ZFFHBweX5/RVcq0WBVYoHWHY0+B6xHZvgMS
         VyYq1V7pBjW18iSZrjsiuZNTvH0CTYFMdsSJXmJq5q70b33nCxHNl4fVZSIModZ9ZILR
         W0E87G6QjH2iqRo5aTS5HcEFZqCC4rjg++C87ONJ5/rPnrp5Pr9X/DksyAUHBdN5v+vw
         49HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768914712; x=1769519512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFD8dduxHdXARbhmuw3nGz+HS5/qU93piZU3w6MAoZk=;
        b=j1uvrtol/iAdBeCrQ0jRqbRucHn+r1KEARVvGef+r9lwFLhHjdbevbT/6Ywgx48nHQ
         AzsfWuY1phK8So2B/+ZVGc7TT6e+tC9SIyIjTCzSeY4f5aIXSeGNTMEGH4yADTGHJQ9c
         kFYLjcCKFDm+8Qeg+e7VpjbrUWtDOk0AZrpjnACn04lSEDWBg7OeVDyP7foiCNihVZCc
         pqxb6xvJQIEADdH8Yz5usigf6ivp4ulnS4/CCbjh0BEp8qByqK2CR83KxLukXxg6Y7R2
         Bee8gF2zWdCPC8Z6gm3mwH5+8BVDpEW4sBh2oVRHy29NYWaxZR5uS7CaLkyt2563Tvc4
         vQXg==
X-Forwarded-Encrypted: i=1; AJvYcCWI5yCwl6U71kYGq+BStGjojACMncf4zT9WbWRTKFT+VRjyhLpB1KTDq4TeIT61thP9QDSJEEUXYrBx2z/23lhr@lists.infradead.org
X-Gm-Message-State: AOJu0YwGqm/2cAzIiVcPpeE8OV0jxHCTGDGohYj05ya+qgJydn51boLf
	f92Sz6inwXwyf1l5EBvSpGPv3DJ2XPu87foKzM91UrOQHF+drzlBicIz7NSpWQi52aMBVEVehrT
	wvb0B
X-Gm-Gg: AZuq6aL/b8+Yjo/a582MVwqG1lZ0DIm1wF55yCgCe7qwwEKY7fWq9uEiXf+ptqRdpnE
	tKn9Hkvv2DHs93DZ8nX4mjSzlrsNlnbY5sLBjNfWmSp6T0pXQpOQBS1FMji2oso3cxs8/BZN+gj
	F6diliJwiz2L/6by3SdPaiWIEQdfOtcMynAn2YKKgGFJurXTrclD8Zmc3wbcIPtlOMQeWDXWO2r
	ZNkoKXjWW++vCGAdRbL4uJFlRa49UMbZG621vW++RY0KlHax8ZX5EevWQQ+nL0HJknFjAZXwIbn
	PHmMVifK+g8Fui38sM/cA8TXiNvPYfZctuYGNG7Mc3L4etBSqv1zdomYorOWhBKmx+Oz/Vsk2Y6
	tKkgi7+AmivbUUmj6MRl0Cgqtcrhgz6CN5e08BzNUwnnCEAVVWzI3iBQAud3t1zQuN7mSE18wUd
	yszo4NGuCXi+JYssxhNi1wJg321ZWLHui8w3MCUEhiensvcz8bthMfxY7ZhLCQa3rDtj4=
X-Received: by 2002:a05:6214:21e2:b0:78d:be82:fffa with SMTP id 6a1803df08f44-89463e12ecbmr22544176d6.33.1768914711953;
        Tue, 20 Jan 2026 05:11:51 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e5e5307sm104190186d6.9.2026.01.20.05.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:11:51 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1viBWQ-00000005W5W-3jR2;
	Tue, 20 Jan 2026 09:11:50 -0400
Date: Tue, 20 Jan 2026 09:11:50 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Dawei Li <dawei.li@linux.dev>,
	joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	set_pte_at@outlook.com, stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Maintain valid access attributes for
 non-coherent SMMU
Message-ID: <20260120131150.GM961572@ziepe.ca>
References: <20251229002354.162872-1-dawei.li@linux.dev>
 <c25309d1-0424-495e-82af-d025b3e6d8c8@arm.com>
 <20260105145321.GD125261@ziepe.ca>
 <f253d6aa-1dc2-4b1a-85df-f43b06719c04@arm.com>
 <20260105185423.GI125261@ziepe.ca>
 <aW9xs1ko3nWq5VbS@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9xs1ko3nWq5VbS@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_051154_164615_FE1987BB 
X-CRM114-Status: GOOD (  23.79  )
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

On Tue, Jan 20, 2026 at 12:14:43PM +0000, Will Deacon wrote:
> I'm not against being more careful about the memory attributes used by
> the non-coherent walker, but we shouldn't fool ourselves into thinking
> that Linux can treat coherent devices as non-coherent and expect things
> to work generally. 

Probably not generally, but we will need much more flexible
coherent/non-coherent choices for some upcoming HW that cannot support
cachable access for certain isochronous DMA flows.

The device driver will know this, and it will know the underlying HW
works properly, so it can safely opt in without worrying about
"generally".

PCIe defined no-snoop TLPs a long time ago for these isochronous cases
and we haven't done a great job supporting this feature in Linux so far.

> The use of non-cacheable mappings in
> dma_alloc_coherent() and cache invalidation in the streaming API when
> transferring buffer ownership back to the CPU can both lead to DMA
> corruption if the device can snoop the CPU caches.

That's a bit different situation, here we are talking about the SMMU
itself and things like the page table walker are fine if the HW does
cachable or non-cachable because we can flush the caches and the HW
never writes. The same argument works for the stream table and CD
tables, but they'd have to switch away from dma_alloc_coherent().

Certainly the end device driver doing DMA can't get off so easy, but
it is also not so unreasonable to think that the driver should know
that the SOC block it is driving has an appropriate HW implementation
for no-snoop.

> I think we're all agreed on that, but just wanted to make sure as this
> is something that has come up before when talking to hardware folks
> who seem to think that the "dma-coherent" property is a hint.

What I've been pushing for is that the SMMU architected cache
properties have to be followed. If the architecture says the
transaction must be cachable then the HW must actually cache snoop it.

However, this goes the other way too and if the architecture says the
transaction should be uncached the HW can bypass the cache.

Hence my interest in this series because HW that follows the
architected cache properties is going to be sad if Linux doesn't set
them right.

If the HW actually implements the cache properties then the SW needs
to select cached/non-cached on a (sub)stream basis to support
isochronous flows. If the SW doesn't do this and just selects the
deafult cachable then the DMAs will work and transfer the right data,
but the realtime guarantees will fail and other parts of the system
will have errors.

Jason

