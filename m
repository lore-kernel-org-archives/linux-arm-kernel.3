Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A109C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aUhrzJlTBy3sWK4uKb4ZsjibWQEe12+QrvuuiLN5UY=; b=PHl6UGh3+xbxHha2tzm76ye3ka
	+KTOCVbjhWFpdwgne3gnBjeLc0FRtqingYWCJvZSbEMOFdusS6iEvp28Sg4OtRLDm7eCJZyfcrn6s
	5YpgFX1Bh7dpmVuOPOSV0hxJ6RJB8JkYPV+Ho7PBjZTjx/zHlg5gI1etQoq6KMNevi3VI9X3wZplC
	AOU1oQQ/qdU5OJJWo1DSlreHjXTkFeRHs0H99OnPNfImf8XjnQsUZcYafbXhYHyREa0aG1bzJhr+q
	OTddsV0KddXQ9UshvfxQ8Dz0HvZEPvIf+5Z10ppsaaNNPOJFsBDKY0G7foPheYVM5vXp7NlLnUAL2
	1ecoPtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpre-00000003rhP-3jAk;
	Tue, 11 Feb 2025 12:59:47 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thpCP-00000003k1N-2nsn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 12:17:11 +0000
Date: Tue, 11 Feb 2025 07:17:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739276226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6aUhrzJlTBy3sWK4uKb4ZsjibWQEe12+QrvuuiLN5UY=;
	b=d/TGtefHLpW6ZjTac2OFk42U5TbMYSEGR2nBO4lgoKgazhrXof5x39MQ7j1ph76yUNjqSp
	wRI1Agy8c5q0nXK+6T4vTXWdlNAj+Q0y/OlcBjb4LjXb/o9zmPeFg1EFnIXfUVdsHzvc3/
	O/Fzm+Y4QLmJdwh9O6j8Z7hBvDEiNxqDC2IMFr35lSvKJ5ygr8VfWk18LrZ5Vh9g9Sp8Va
	/+IyeB6SoZIXl+qxOCHBgVj7h28znjHgyuWIimTLOhNHHYwfSOyob4KaDX0yCSZ2t0rPQo
	2iFxYmafjdXT/TZz2WlN5wsg36AyKUVNvfmN/VztiNAzPRFPMa95B4GmolOSAA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] iommu/dart: Reject identity domain for locked DARTs
Message-ID: <Z6s_vXUrZjyhECC2@blossom>
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-4-5d97fe247f35@rosenzweig.io>
 <5d82d549-663f-4438-922a-6831e57e80b5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d82d549-663f-4438-922a-6831e57e80b5@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_041710_172554_EB0380E3 
X-CRM114-Status: UNSURE (   6.13  )
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

> > Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > Signed-off-by: Janne Grunau <j@jannau.net>
> The submitter's sign-off must be the last sign-off. It appears that you are the author
> of this patch, so drop Janne's sign-off.

Thanks, fixed in v2.

