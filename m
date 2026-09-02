Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A097C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3/1naZ1RhLgUWY856SAbE6LeQ8PQwzS4dxBvl1l3nM=; b=jwmzi2SW4NY0r4XnJJypnxng47
	hHq9sdEXmqKLskL+26l1S3fVjhFBqWJQKS3CKWZN8phcuqohpQZQHhtLUeMdYlaM/o2Y+Lv8a5HnW
	OSevtR25ae6rHkLBTGLjhveHe+kLd+vqu+quWZQbrGrYrwIUIPr9LXUtvQmwuiFEgZR0Fe/n6OPn/
	yuUSo2OH791GHMyD+JyfHmpfNAFXJn6k70MSJ6sp3PaXrTnK7S/yIoqTFL39wgVSnpEKK2zvPcxDk
	jCD5X0y3lO0Vg6b6TS/2DgcTmhL0BrQk+6LRhKiISBI5VDVe3ZLs+xUJQlATTrv13H88QFlfprFuy
	DkCdDrOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ohS-0000000FQbw-25KD;
	Wed, 02 Sep 2026 17:24:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ohR-0000000FQbc-2EbE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 17:24:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BF7E40273;
	Wed,  2 Sep 2026 17:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1164D1F000E9;
	Wed,  2 Sep 2026 17:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788369877;
	bh=l3/1naZ1RhLgUWY856SAbE6LeQ8PQwzS4dxBvl1l3nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DXiOsd0IOwaWcqNMcESpWf4hFCXAp8Wnr0mmhtnowdnpJUppd8Az9ulZWwyJ2Uu4R
	 wkSOKrsgXyrCbsZ4Ej8dCHAUO3I/4HPgFL476eGN0P/8NbBkNtGVWoaVvzxq629JSE
	 MNyjdmuBfdWD9tp2ye9BdSsE7IZfLQ6ow1ntz6mprCCXuVX0AkCxGb50BYmQW7oBbd
	 MPaDcJNFaSVqAkwRbQfma7hfoYES0jZcC+6XyiyrsPbnOzs3CpqliBh6dejcYwxVGB
	 pQAl1sebDUlr62/dzSyXwzrWVKPVJmhKguUHvxr/r+W7Qs+BOd/D226mZ36jtpIbUb
	 BuzrSWHmpSLjQ==
Date: Wed, 2 Sep 2026 12:24:36 -0500
From: Rob Herring <robh@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
Message-ID: <20260902172436.GB1440252-robh@kernel.org>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-3-vdonnefort@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902104712.2399797-3-vdonnefort@google.com>
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

On Wed, Sep 02, 2026 at 11:47:04AM +0100, Vincent Donnefort wrote:
> Keeping last-level mappings is interesting on some architectures as it
> allows mapping/unmapping pages from the kernel direct map without the
> risk of splitting blocks which, under the break-before-make rule, may
> trigger page-faults the kernel can't handle.
> 
> Add an "ll-map" property for reserved-memory regions. When set, it
> splits the underlying memblock and sets the MEMBLOCK_LLMAP flag.

Where is this documented? Any DT property must have a schema.

Though I'm not thrilled about more flag properties. Handling all the 
combinations of properties has proven to be painful. Can this be implied 
from the compatible string instead?

Rob

