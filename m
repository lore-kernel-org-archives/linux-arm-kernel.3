Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3033BC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EE5PAnd1Wf6p3SmBC2optXiNbJWsLePJtC5K69fq2H0=; b=qrfZ702IrfyPsjh790lFsLhXYz
	Sog8BtXFNTMk9xg/eJP1waYTOFVyus/Z4a/6OlgGbWOuXjLFuGzvMasISpjLYUYptF37Zb0p2FaRe
	ZjS2CF5zefWmKe7YSkSOSOD9xK9cV5bEGG/ba3lrEXWVR1dRmTGZAUXXWtB0IC5J4M6Y0v7P5J5B2
	iPhTFBs2c6/HW/S3tn9X5L4741tLFQmH4tbh8n1Kf72IEqpSJzPY53SMU6OqfZ7nmPMaqF69LEETf
	Gy9ZT10Pq0qOvc20Yx3qCMTVngWBDrnGnoq78OB9IxTpG09YtqU3RKAKi1GtUZzWQmBWyeEyGs7NK
	Fn4N5b+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Omg-00000008hVW-1GCh;
	Wed, 23 Sep 2026 15:21:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Omd-00000008hUW-2RgM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:21:21 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49ccf12bed0so51485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790176876; x=1790781676; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EE5PAnd1Wf6p3SmBC2optXiNbJWsLePJtC5K69fq2H0=;
        b=FH1NWiUB0AOUC6xYX8SPDMi//1G78TkSzu/b1B2Al3m001Z+YwccQnBNriNF05PEFA
         qHv5wg+bhl7lfdGLKsEH4HWKt0+0PslReR6qpJ9aHU/PJhYI5/fOm4FZw16LpunPzHf1
         QgkxTsPo2K6hwEU5wsEAa0Oud27rZmy2lw05JxTrJ6Ep0sXo3gjNg+UsOoo0PjRLrcW4
         XnYqni0MFmzX6R/VgMS5aGlZOFIOjcqPQE1GphBogEe9blkqi4aUjo5ZEXGmWCBbegRY
         HaeGuDRUvpkBVwDFMDpZShNx6notWYnpA1InSonLsPte7JBWSX+wqkcc8pEGfQbOZ/lT
         zkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176876; x=1790781676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EE5PAnd1Wf6p3SmBC2optXiNbJWsLePJtC5K69fq2H0=;
        b=W4AHOVUk1/9ha+Fd/ACZNuH/IMdc617U5hMvA2yKio69p9C7vfz40KF6hSmwCM0mIX
         UXQPmBvyTaEq/Dfn3NvwaXcSlCbZBQjZqqL9A616FeZ2JwxJukb4EprY9vgOdBgdz17Z
         5696zYRjukSW6ILeXt1zatfqyQk3F87YwFT8vZ9bLm/rLjxDUgvkUhR8mFjXlasX5MIr
         AnMbfollZT5y92pLiXu8dGtyROFhQ0KVyuKLZT2TptfCmQcUzLn+uXvkKLlgD5AFK4SK
         2RQge7p/R25FcGGXpFpd0WF1NE3XT6KDUC1YWhn6MZFJGc7Dq5ni2joLTgM0Bv1pYpfi
         lOqQ==
X-Forwarded-Encrypted: i=1; AKwUvBz89UnS33YErOuXnsIfpa1ZjkKLVMT5ZKrYA2eq/LCg1CI+sMELfT8C0qEcmr98CHVO2O2gNs0QyGg33VIu29MT@lists.infradead.org
X-Gm-Message-State: AFuF++l81CjsXrRmjSER8fM7fdO11Y2oUSAUWWYu5jtBTfSbE/wZlq0U
	uHJayclRnurPsB6ew+Sx/fXne0RyNSg0o0J+JiEDYEeUiqjiYdnx27br3qoIoNn8xg==
X-Gm-Gg: AYBFou0kZNyDDCCbwL/NV6t/tIPegYy24El0ORPtGwUcYBVsJyRbR6OVtS6QkqoBlvQ
	ZSyfB4KEtYFxXOhMnDS/Vs4yK6cZUzvpEcvf6vz02Zy6uL23NTrkyE63yFluBeQK8/6AywOz8d9
	uuKgJZCa1y6NJXyRTnHqOVaDEgm1o74GXKv/nVlGpZbvfIGNEELGLDnGH7UDVMQg9grPJ16j6Xa
	WIxd8HJ/0UHadIBghYkRMMDCHlg//DhTOyrsxJAtgnMhTWuT1gyvX94YGqlemdMouGEejghIOqc
	ctDyTUCiGE04Vmd1PLFNeLztsmaZOY5MTiVj/OPre9ikZw0ZrzGhD+Oy0tt66t+ccBXtTgTjJ3V
	3T60vOxEeDRPTnMCpZqMT6j8A5W+zhEvz6fdUHfCycQ0KRICALgDcPiEWW74OQnWkFr16N1a/k0
	yABvmTaw5CacTFEq519FdClqyx+K24FyAVs2bQoVZtQw+SLRKmMOzmffNQlhLtQIRjFOGDlw0zk
	4AMOcXEhUazevxXIbe8OdZNOIG2XDQ7Xof0imJ2
X-Received: by 2002:a05:600c:4e8f:b0:49f:e1d3:fe03 with SMTP id 5b1f17b1804b1-49fe586ff32mr27765e9.3.1790176875531;
        Wed, 23 Sep 2026 08:21:15 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3ed96sm1697075e9.2.2026.09.23.08.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:21:13 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:20:43 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	christian.koenig@amd.com, Joerg Roedel <joro@8bytes.org>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <arPuS9FXrkYJhbiA@google.com>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
 <20260923130031.GE1540250@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923130031.GE1540250@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_082119_671944_2DDE4A5D 
X-CRM114-Status: GOOD (  24.37  )
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

On Wed, Sep 23, 2026 at 10:00:31AM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 23, 2026 at 10:42:39AM +0100, Catalin Marinas wrote:
> 
> > On pKVM, we want set_memory_decrypted() to zero the buffer
> > before the host can access it (I guess currently relying on __GFP_ZERO
> > allocations). Since no cryptographic encryption takes place, there's not
> > much point in memset'ing again after the operation as the content was
> > already zeroed.
> 
> It sounds like this a pkvm unique thing, since RMM always makes the
> memory hidden, pkvm flow should do it too. Either inside its guest
> set_memory_decrypted() or inside the hypervisor like RMM.
> 

pKVM doesn't clear memory on sharing (see __pkvm_guest_share_host()),
and that is not a documented behaviour for ARM_SMCCC_KVM_FUNC_MEM_SHARE
(see Documentation/virt/kvm/arm/hypercalls.rst) which implements
set_memory_decrypted().

The guest is definitely the one knowing what is inside the pages and
whether it can be shared or not.
For example, a while ago I was experimenting with inline decryption
to avoid bouncing, and I imagine it might be used to build on in the
future.
Also as these hypercalls are ABI, I'd argue we shouldn't change their
semantics.


> Hypervisor doing it is the right place, hypervisor always needs to
> ensure guest memory is cleansed whenever the guest gives it up. Either
> via a private to shared, unmap or just exiting.
> 

"gives it up" is different than sharing, for example:
- When the guest dies pKVM will zero the memory before returning it
  back to the host.
- At the moment the guest can not relinquish memory (ballooning) but
  that is supported in Android which can zero the page.

Thanks,
Mostafa

> > I don't think cc_make_shared() has the right information on how to
> > safely and efficiently do the zeroing. That's only known to the
> > set_memory_* backend. So you'd have to propagate the flag down.
> 
> +1
> 
> Jason
> 

