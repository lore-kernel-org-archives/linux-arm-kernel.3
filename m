Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB31E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dD4b4z/Jd0cJwEroNQht2WXJrVjBKd8Fp2Jn+KB4SXE=; b=tTaoYPOk/oK4Li6KTcXuFq10W2
	dZOaiJlIH6IvyB8tsvY/dw0kuW5CzuG/1k0RUsv0+XTblhZKKDaERt17+k1BhK+Ia235EAdmvEWxe
	zP0dhP84I5m86CjrNf8ETCsMo9kNleCEwg9KVQtxcxvG3kL8IThVQkjdmbU9v/ZGym6sYxp/BnQon
	GcKRW16S86eua1gTOCesPuuMbS5gmUa4NMYULjr2J6L3yx0ACKFgBIKUj0GHKrDflkWyDDMKrvmCx
	EpClHYmLXCf6lWzOY+45mZg66H6iCkfQKa9XzPQM1fczTjfNMlke618GuvWILyS2SPSnyP7Fy/kXD
	tOFBNcfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9Ci-00000004t2j-3mdi;
	Tue, 07 Jan 2025 13:01:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV99W-00000004s3g-1Hm4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 12:57:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AC415A412B6;
	Tue,  7 Jan 2025 12:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69313C4CED6;
	Tue,  7 Jan 2025 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736254665;
	bh=zvplV8B3BpnXVADmocgfgHIqHLcNMsgpQiKMncNel+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SlxkHKkZx8Ab4eWY7YLwa6PjymcKGOZYfiYIn/PJPSbJbGuekhDAHf7qAdldVBokC
	 QYc9asuyrlvFmfi8edcliRf1RcW0x5B2s3iIUYYZ6mxVyL6FsQykZb3jfbQ5v1SnVV
	 a/iSJzEr2VJIoaY6rKY0TTUUwM6Kk6Tf8l0Fo0tMlnTc9CPYb8wOs5QXzA9ndOKxi+
	 xl3ii2AFiLPBTs9xXjqnlRhrdqGteh74iLiE7NWemiZoqb1uRrM04thDe7RRnugqXx
	 VQaSnVxwl6Ypuy0ZWfq3Ym8CktsGfBVgWZJm9G8KMnROBmZJ5vQthEqFTe9rwIqIhA
	 5Uj/wBxgKkWMw==
Date: Tue, 7 Jan 2025 12:57:39 +0000
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Message-ID: <20250107125738.GA6991@willie-the-truck>
References: <20250102183232.115279-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102183232.115279-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_045746_410200_971F4F75 
X-CRM114-Status: GOOD (  13.94  )
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

On Thu, Jan 02, 2025 at 10:32:31AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> On mmu-500, stall-on-fault seems to stall all context banks, causing the
> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> 
> This fixes an issue with an older mesa bug taking outo the system
> because of GMU going off into the weeds.
> 
> What we _think_ is happening is that, if the GPU generates 1000's of
> faults at ~once (which is something that GPUs can be good at), it can
> result in a sufficient number of stalled translations preventing other
> transactions from entering the same TBU.

MMU-500 is an implementation of the SMMUv2 architecture, so this feels
upside-down to me. That is, it should always be valid to probe with
the less specific "SMMUv2" compatible string (modulo hardware errata)
and be limited to the architectural behaviour.

So what is about MMU-500 that means stalling doesn't work when compared
to any other SMMUv2 implementation?

Will

