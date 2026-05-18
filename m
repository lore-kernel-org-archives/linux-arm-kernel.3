Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2B2CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDIhMV1nHjwLsCIXlCezYHSNmQyf4UWuYbLZvlWovDk=; b=q+xkrq2XEdHs7s5qfTyaIdNA06
	uwca2nuTmza4N0qcQ2NaJ4bvs3JLVKBB9nTiRWVpBNTTT0k79380kUNpolEj8EOxTBdcsukmQMb/0
	7MlnpHKfCzlusyu004YQyIVzPnhR67O07zGMs8QlbSmkeNdA81VCHS+stnV+OOnagqDgUsGg69LgN
	h1szj1VkxjjT97k2CaXOHr7dgmv6bWkvzzsqlvS96ev0R6Jv8KuNgRSCvJy2wWRUzyBvz7qKf3i7Y
	lLnTx1m8kJNL6Luf+/9t4eIwEeOaDUIgVD8VevlH4hteBP9+80vh49qXmRN+vYr1HXJy015WEJGrk
	EUyuGbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtGm-0000000Em14-1n6F;
	Mon, 18 May 2026 08:24:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtGk-0000000ElzK-0fdD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 08:24:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B6E5441B5;
	Mon, 18 May 2026 08:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1D1C2BCB7;
	Mon, 18 May 2026 08:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779092649;
	bh=nDIhMV1nHjwLsCIXlCezYHSNmQyf4UWuYbLZvlWovDk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NWifYtBE4iioUAj3misRX6WwJ0qFse49SAbzHE90dFtNp8FN6knm3Yiph8G/VuQHI
	 mk5mZdPQEKJC66muMH1yh9b6HwWB0JlBDq+5eBGodIOS/8D1pPmfLOHdZOjeKWK88i
	 N/8w1A1QCWLgXVg9FtWIO/NYcHS1lK/vrQsa5fOdwGgM9OSoaJW4SZC9Hjn7WPYBcw
	 GeKO0qiVF65IovoAz/Xum8DtfjdWmTxiZ2CqAnKB3ZuqDWK9CLQYjpJrhBZDofIX5j
	 V9HjO3QpHnZq4b337FQLstpxcEkP7IBe0Bd8u8pcKxo9RJ8TS2P+8sg+7Whz3yPWao
	 yp6TgriAHH+hg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jiri Pirko <jiri@resnulli.us>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
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
Subject: Re: [PATCH v4 00/13] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
In-Reply-To: <agldl4XQLKAtyLty@FV6GYCPJ69>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <agldl4XQLKAtyLty@FV6GYCPJ69>
Date: Mon, 18 May 2026 13:53:58 +0530
Message-ID: <yq5amrxxxh0h.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_012410_225746_FF12C891 
X-CRM114-Status: UNSURE (   8.93  )
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

Jiri Pirko <jiri@resnulli.us> writes:

> Tue, May 12, 2026 at 11:03:55AM +0200, aneesh.kumar@kernel.org wrote:
>>This series propagates DMA_ATTR_CC_SHARED through the dma-direct,
>>dma-pool, and swiotlb paths so that encrypted and decrypted DMA buffers
>>are handled consistently.
>>
>>Today, the direct DMA path mostly relies on force_dma_unencrypted() for
>>shared/decrypted buffer handling. This series consolidates the
>>force_dma_unencrypted() checks in the top-level functions and ensures
>>that the remaining DMA interfaces use DMA attributes to make the correct
>>decisions.
>
> FWIW, the patchset in general looks good to me. I tested this with my
> system_cc_shared dmabuf flow, works flawlessly.
>
> Thanks!
>
Thanks, Can I add

Tested-by: Jiri Pirko <jiri@resnulli.us>

-aneesh

