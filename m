Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125C2107BCD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 19:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYq83uFtLLGZ1lI5GvwWr81tevFEw8ZC9cOkeQuGfWk=; b=p3lrlYm2PaUBeNYZ717DczSDaU
	GnxkGMULMEfNJK5p9LarA5oN1wFbcv1Dkny/KoP3NqXqtBwq79DIiZCcak/UIRXCQg8Oz79FQyD2M
	fACXGra5b7GWx4x9Z4QYJb77J5RkdzFL9oLtDKimqn/a/uMhb++JWMohx8Ae3+73nNhaxZH4QHCVQ
	idtbfUwfkp60hJ3W2AtHf+Q/qgNuvgmsXr0Juo5+87Rny0+yzE7AYn+1DrGXO5/aF08WX+At/LMJ6
	dZHdY8Zsx3w7eVcCb4NPuenr7ecWtkGGWxU1C15wwvVuGuqaojxZQ/3zxKQpQXzihx/qKaNVyjKDq
	tXRSKyBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18I3-000000014sB-1HlC;
	Fri, 13 Mar 2026 19:35:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18I1-000000014rY-0W63
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 19:35:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 177FD1758;
	Fri, 13 Mar 2026 12:35:07 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA6993F694;
	Fri, 13 Mar 2026 12:35:10 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:35:08 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v3 1/5] arm64: Provide dcache_by_myline_op_nosync helper
Message-ID: <abRm7DPWntjBB7Ji@arm.com>
References: <20260228221125.59863-1-21cnbao@gmail.com>
 <20260228221216.59886-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228221216.59886-1-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_123517_221940_24561D4F 
X-CRM114-Status: UNSURE (   7.75  )
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, robin.murphy@arm.com, Xueyuan Chen <xueyuan.chen21@gmail.com>, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Mar 01, 2026 at 06:12:16AM +0800, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> dcache_by_myline_op ensures completion of the data cache operations for a
> region, while dcache_by_myline_op_nosync only issues them without waiting.
> This enables deferred synchronization so completion for multiple regions
> can be handled together later.
> 
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Signed-off-by: Barry Song <baohua@kernel.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

