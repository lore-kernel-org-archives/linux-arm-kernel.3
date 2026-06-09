Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81493CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVABLuHAzbvMd8rLAYuqriN8lpaGXdnOhBwKXzGn2mk=; b=Bxy1TGZ6xTht1r+Xyj+yevNzDW
	ygUGCNRsrO3WFMKU/BRxuzLHH+5nR1jPEkoxoQ8Q0aLjAPHm8VfFmbuUoWz9ZVtjSbDH0Elwc/68E
	6gdDkVoVAfKwXSys6kp+8f4ALkCpcQsDvvMGU65zWUBfr2Wk+Nc8m9a5U25goZfrT1sn4284nnL8x
	hgQ5GOaYEHfOfOLAHFtObnVs/oezuyFDkPlwszcfGZpOpMb8I0nCtYdQR96x2c1iQMAJByXRl5B/y
	P6I9TRHiefWfiHJglPeyRBZh+Hst2CezHwqBDoqSxL0oxPhRiO7MNRU4eqVipk87OVI/xuYfYQsgi
	qRSWpAlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxk7-00000005ot2-48O8;
	Tue, 09 Jun 2026 14:47:51 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxk4-00000005osU-3r09
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:47:50 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-9159951f05aso657460785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781016467; x=1781621267; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jVABLuHAzbvMd8rLAYuqriN8lpaGXdnOhBwKXzGn2mk=;
        b=ihaFgCiovc9P7uGbaV6wZE9+xIB2/Sgx6qQZjQ+55lN2b7LP04nP7fD1mgKPzKhssb
         EwUmKB77k+Yi728K4wLl9dE37tiMDN0Jm7eO3RnthZqa9+TZ/ugV7WVMkX844fEiXJEc
         lAawy0CbpGqrLDOPtC5nL7E4zoH8ZgdCoqno/W6P7tIlNdRbXjzVACkovzuY0GujZZWe
         R7k7BcIopOdpvPUh01sXKHOnQWBWAoeIET1m8dbLCGq+A5i3sFE4xDY5g6yl7zPGIV2N
         xMqZwA5bVtb+bs4qlrVp17f2pwEph6mbwRAwHumVyYyutaPV9DUXZEqQl5ZiNulcPKyW
         3KbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016467; x=1781621267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVABLuHAzbvMd8rLAYuqriN8lpaGXdnOhBwKXzGn2mk=;
        b=UwIoIpL9YeHZAKCE6MoachQ6hGPx5ntisQK4N3pdEm3xce98/rCIf9wx/GOuQduwTf
         /U6d2PbNDQ0cZwlJnexilxNCyT+UW08ei/h5LPeDVoARkp2qJjoeEABQDpc7xTVUtfzK
         MCv5bIUb2c5fDzoFp632u+xN3YMddXinwuvdmNZY+XcOu+YhjqLbZI3YRhHnkkuJCI47
         QgFIbqn5znSdaCKJ72Z0zyu6bpoxuJSFHRMZZC+L1ydoU/CUzHew1H6fTIY0kZGA9Bp0
         QGSwAqIOSpT1fqLdxd366NknIqZI4fqEAga0R48XlTRVC2+0YZDfzzWsOrQ5c+Xn6eOc
         jyBw==
X-Forwarded-Encrypted: i=1; AFNElJ+htq3trKHDgZHIDbYIxpB9ZjLimQn1UmYmy+aropViNq+tAqF4EWmsGdS6t4e+BFES0fmmUo76EIVjoTQUpkAT@lists.infradead.org
X-Gm-Message-State: AOJu0Yys0QEu6Z3Pd3hS/DiJnfP8poJsOKGH4w0Fs6U63MRNsLSqwq1o
	d7LDQfXHrZ3QvM7ZVWjCGtRVZFSmIXDO6UtQRT71Hml3lQyXgug6+NBKg2bHFfXVhUI=
X-Gm-Gg: Acq92OEtIqHnrWxo43dtdFid46VpOyXnPqPZ2y0YeB2Fb5Xs7c5H/7bN4XchvC8VNXv
	rG2N7bbVuXizkfv1bUHyRZS1SkMAXJ96s73RHUQ949znf/JznuBlSUp9Fe4oEO3ky+O/lG/G6Dh
	TQRtmnnoonOmOgrfGCOSrsHzE6ASo0z9GWBwVNp0IcHUSjvy9lzNIwgUiaz4GV9Im2XEH7CFZIl
	7tPyUr2ysQA9EExavCLo51hf76FhZ2PhJC8y0CIX6jRAb9cC9+QjdyedlL4bl2ililFdSC4yHzu
	m6eCxpk/jOXjc6dpWo1Xn8CavoR8XceJvc2Lcw9TsaWSOG/7T6hslf+QHVtYgROWVprd4osw6P9
	FxDHTrS2wdcvq6uyMMLq0oH7W5InJAAtEicMo6kDJKBdlA6Z00NUTrXvRiQiPOsLqAKd8SVJoWk
	q5WcSGRi9tzFFxtfo1xralAgAOsyPvfm2J6E8RB3PSYE5n6vcERM5CJX4ZsmEwDuPFP7WJ/DoCH
	y9Z/eDGCBdq3XWt
X-Received: by 2002:a05:620a:4886:b0:915:9efe:6dd8 with SMTP id af79cd13be357-915a9db8256mr3196001885a.42.1781016467473;
        Tue, 09 Jun 2026 07:47:47 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a411333sm2254245885a.46.2026.06.09.07.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:47:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wWxk2-000000025BT-2DH0;
	Tue, 09 Jun 2026 11:47:46 -0300
Date: Tue, 9 Jun 2026 11:47:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
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
Subject: Re: [PATCH v6 00/20] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
Message-ID: <20260609144746.GL2764304@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <aigYbK12D8uKQvJF@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aigYbK12D8uKQvJF@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_074749_046485_5419D38F 
X-CRM114-Status: GOOD (  22.12  )
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

On Tue, Jun 09, 2026 at 02:43:08PM +0100, Catalin Marinas wrote:
> On Thu, Jun 04, 2026 at 02:09:39PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > This series propagates DMA_ATTR_CC_SHARED through the dma-direct,
> > dma-pool, and swiotlb paths so that encrypted and decrypted DMA buffers
> > are handled consistently.
> > 
> > Today, the direct DMA path mostly relies on force_dma_unencrypted() for
> > shared/decrypted buffer handling. This series consolidates the
> > force_dma_unencrypted() checks in the top-level functions and ensures
> > that the remaining DMA interfaces use DMA attributes to make the correct
> > decisions.
> 
> Please check Sashiko's reports, it has some good points:
> 
> https://sashiko.dev/#/patchset/20260604083959.1265923-1-aneesh.kumar@kernel.org
> 
> I think the main one is the swiotlb_tbl_map_single() changes which break
> AMD SME host support. There cc_platform_has(CC_ATTR_MEM_ENCRYPT) is true
> but force_dma_unencrypted() is false. Normally you'd not end up on this
> path but you can have swiotlb=force.

IMHO that's an AMD issue, not with the design of this series..

The series is right, a device that is !force_dma_decrypted() must be
considerd to be a trusted device and we must never place any DMA
mappings for a trusted device into shared memory.

That AMD has done somethine insane:

bool force_dma_unencrypted(struct device *dev)
{
	/*
	 * For SEV, all DMA must be to unencrypted addresses.
	 */
	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
		return true;

	/*
	 * For SME, all DMA must be to unencrypted addresses if the
	 * device does not support DMA to addresses that include the
	 * encryption mask.
	 */
	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT)) {
		u64 dma_enc_mask = DMA_BIT_MASK(__ffs64(sme_me_mask));
		u64 dma_dev_mask = min_not_zero(dev->coherent_dma_mask,
						dev->bus_dma_limit);

		if (dma_dev_mask <= dma_enc_mask)
			return true;
	}

Is an AMD issue. We already have an address mask limit system built
into the DMA API, arch code should not be co-opting the CC mechanism
to create a special pool for address limited devices.

The correct thing is to ensure the DMA API is checking any address
limits on the actual true dma_addr_t, not on an intermediate like a
phys_addr before it is adjusted with any C bit. Then it is a normal
low address swiotlb bounce like any other.

I think we can ignore this Sashiko remark, in real systems the use of
swiotlb for 64 bit devices is very rare. Though it would be good to
remove this code from AMD...

Jason

