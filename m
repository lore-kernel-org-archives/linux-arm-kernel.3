Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1984EC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 19:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mNRV1XLqXF4FA7V0dC+d4pFd/k0iKqQgScUbDF9pVA=; b=JyX1ygYp2ksRq/oat23+rmmijM
	WpyOJd0+hxxHHGBqc7DrSYGqDYgthg45HVmXyCHB/eqAD5UTEZOamfohVfs0RCs6mOzv+ZFDhda9e
	EcIDjWzDLQAF/LJd4/QcpvusaIPFHDBXhDyAdDfD0X5UX3L7nNXFJEAN6xLwgTJlqgXSYWC/E/Th8
	O/208o+UYvEZEX+lTRt1tKByDspnmYIx0itCj+CFC+9g3hZBb7+m/EpJmnXxLOnObfC4ShAQvvpde
	Iqcz/ucX1DpQdSYriadBObrboJxUzN2R218ZRePQOmaxdAKO6VceAC3WWUHDk7QsAscIKXmkBuLaH
	rkXQbcwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvq1-00000004zYA-0Prv;
	Tue, 11 Feb 2025 19:22:29 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thvoa-00000004zIX-2snd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 19:21:02 +0000
Date: Tue, 11 Feb 2025 14:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739301658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8mNRV1XLqXF4FA7V0dC+d4pFd/k0iKqQgScUbDF9pVA=;
	b=NIg+s4yJTADX9Ou20CmtLuX/odZ6Ag8iohjaieOJUj6ZkCBp3PFYrg+T2VljxOmdMHRaY7
	6eEciAukGKMdz1PnOgkbW07M8pDAOUQjkihPCUqm8GO2/VLUgXCfv8wAg0RSBHMmH1kVDW
	ft4zRgQCEr5BI5npQfzpyFnJAmGKqUYoCH1C9UCAwGVd3+8xU8qVEPOKK2UGN10WKogzd7
	w5iuP37wgfaOr9FaRNcWUYblzMMiaLP8nfH5HyBktcwNa5HFjrRY26x6GjaxHD4B3Wz2gL
	gXtyBUw0LO6jqOppiMSlbm4/yeXYv2hzARkPnFRWag6uuwQtb1nqzLvmk6LOCg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] iommu/dart: Assert !locked when configuring
Message-ID: <Z6ujFKvD7hCYzymO@blossom>
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-5-5d97fe247f35@rosenzweig.io>
 <756ba6d7-b18e-4139-851b-496b1820117a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <756ba6d7-b18e-4139-851b-496b1820117a@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_112101_056857_1128D6D5 
X-CRM114-Status: GOOD (  13.40  )
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

> > Configuration is only possible and needed for non-locked DARTs and will
> > fail for locked DARTs. We cannot try -- assert that we do not.
> 
> Except now we absolutely will - if a locked DART and its client device are
> advertised to Linux, instead of gracefully refusing to touch it, we'll now
> attach the client to a DMA domain, firing a barrage of multiple WARNs in the
> process, and give it DMA ops which still cannot work. I'm not really
> convinced this series on its own leaves us in a better position than we're
> already in now... :/

Fair point, thanks for raising that. "Fortunately" the upstream DTs
don't describe any locked DARTs yet.

> How hideous is the rest of what's required to actually make this usable?

It isn't... pretty, and it's going to be ugly no matter how we slice it.
Unfortunately the display controller DARTs really are locked so our
hands are tied here.

When I originally wrote these patches I had some hideous hack in the
shared page table code. I'm thrilled to see that Janne rewrote that code
to be local to apple-dart.c, at least:
https://github.com/AsahiLinux/linux/commit/d90cc3590ea460e1c574b4b7c47fdafb2794af6a

I'll include that patch with v2, which makes the locked DARTs actually
usable, and restructure the series so we only probe after that commit is
there.

