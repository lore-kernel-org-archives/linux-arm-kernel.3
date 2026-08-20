Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D991DC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 17:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Qb+xhTlKPVWizIMjofw7uE96fNZ4Wj01WNhyEBGKc4=; b=IxK45MHYEp0tyxcnAERoPs63QT
	epXn6TAhLpAKMa/SyacFxTOo+0FAOhJOm0WLh7uU40cHJ9O58tBbR8n3D6d6uy4OaVX/REy8yY6RB
	drF7Sf9YYfB3ZBK6ifkbp3sNH7yOLddCBaDtm9tIGyEqkxZja6z2cxpD+zUnGOn0UzUirgmTYBCVl
	NgEulKgC8leUhEGLGHTMQazEKW7++MBB+OG808dtrf/rfyuo6LshujW/ElM4Z2wDEEgWw0y5P1k3w
	D7a0vD5Qb2hWz+piuliU0JwHCiXdOtZmjD2L0PW5XGMw8H3GIunRzT8GX9h3mDP6hXWkTzK4BwZVG
	Ot33jsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6fO-0000000ByNg-0zn2;
	Thu, 20 Aug 2026 17:35:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6fN-0000000ByNT-44Dn
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Aug 2026 17:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3Qb+xhTlKPVWizIMjofw7uE96fNZ4Wj01WNhyEBGKc4=; b=QURsD0QAAgj+sxjErRkaFS6oOh
	uO/mKfp27fO66r1EHKLQIKgzeV77uyPCMcPdSwkGVkJsBorGdcD7YwmnLfRcuNhjh8I4hEluuHpc6
	4YzWfCFpP3TgDmtgjptJA4rHsZEsviw4etr6xfAVTzHlWe4opL0BgxaFeOB8Wrg3y4Xx1qIQ0ed2D
	/ZaZGNIRV4WOrGHCj7CadcIrCWQDUHlQwpzfE+YBUCk6GZg9O7SxYfl8M27hoH0cQodLlkeR1nLfv
	hiSykTmriluN2/N86FTMWP3kTeURoD395Wj+9wDewWQA9jckko16x4bps+aNY4LOwvBKCCWMvP3Br
	D9ju+ghw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wx6fI-00000003FZk-1FgZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 17:34:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B8F0153B;
	Thu, 20 Aug 2026 10:34:20 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 572343F763;
	Thu, 20 Aug 2026 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787247263; bh=6d6trshcrhxKprGt8zElAF+25dO3pSF+3PnYMjOG1Yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxFv9IFTYkN8Xo1ymDdk2vtFJhiuGmQoQ157j2zvBhiI90N/E4mEHbkJRLpQWAsAK
	 dS4Lm1AjLN/91wNStVmRGf6h0/geeaqGVlhxsrmWC0yj1v+h+5Ms/F4Rc6Roeoy24e
	 lid5+NmZ0RNTNXX6NoYhH1Iow72w5iIdD3alcqk0=
Date: Thu, 20 Aug 2026 18:34:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Steven Price <steven.price@arm.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH 0/2] Clear shared pages after private-to-shared conversion
Message-ID: <aoc6mkzdqtqigv3n@arm.com>
References: <20260820105026.53208-1-steven.price@arm.com>
 <20260820122048.GB18100@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820122048.GB18100@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_183456_602639_7A505F0C 
X-CRM114-Status: GOOD (  16.47  )
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

On Thu, Aug 20, 2026 at 09:20:48AM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 20, 2026 at 11:50:23AM +0100, Steven Price wrote:
> > Arm CCA includes "Memory Encryption Contexts" (MEC) which allows the
> > private and shared data accessible to a guest to have different memory
> > encryption keys. Consequently when converting memory to shared, the
> > memory encryption key used to access the physical page will change.
> > 
> > Both the GICv3 ITS driver and the system_cc_shared dma-buf heap
> > currently allocate memory with __GFP_ZERO and then decrypt it. With MEC
> > the zeroing is done with the wrong encryption key and the data visible
> > after decryption may be ciphertext. The RMM is required to scrub the
> > data, but may perform this scrub with a different encryption key to the
> > eventual key that will be used for shared access.
> > 
> > Fix these two sites by avoiding the __GFP_ZERO during the allocation and
> > performing a clear_pages() call after the decryption.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> This whole set_memory_decrypted() API is awful. It really should be improved.
> 
> alloc_pages_decrypted() ?

At some point I suggested GFP_DECRYPTED but if we don't want to
interfere with the slab allocator, an alloc_pages_decrypted() would do:

https://lore.kernel.org/all/ZmNJdSxSz-sYpVgI@arm.com/

And we had a vmalloc_decrypted() proposal as well that paves the way for
decrupted pages. I forgot what we concluded:

https://lore.kernel.org/all/20260521205834.1012925-1-kameroncarr@linux.microsoft.com/

Actually, this last series had a lot back and forth around __GFP_ZERO
that's relevant to this series.

I'll comment on v2, I see it posted already.

-- 
Catalin

