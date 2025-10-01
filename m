Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28284CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 15:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRwvzGOYi7sl+c6cM0OJca65+ixXnZyAxlrpt8n1NAk=; b=R+4etR3IqynfbtEWKErXEf+EU7
	2IMMsaBiyqGPCJtPaQBQE1+yfNigdoLkpNuMua7E3IrJPrdz6KxJ/UN3skLnLr/y6fiqE4zaNNesT
	DnilutLqZqTqcATaRF1DkNcuGWiWQ5mMka7LyhAh/lWqqekN8qQxedvNyjGZ7fd+CLKDjkbPcDjz/
	G7I2J6Zj+Vw19T2fiZwBLIctQF3IepRyALa2F4Z6zLUemuQNdAmzUjz/gmZ83Gzc/SQ9ZLsu2Achm
	oDenP7fNaTnhrqR+QZGOfA4zpmaKhZOiRWR4ih/+mi/Zu9ArYvDixm+toX1ufPnW5y6U2oEEHlSjF
	Dsy5Nnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3zES-00000008T8J-0TUZ;
	Wed, 01 Oct 2025 15:59:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3zEP-00000008T7X-0VPg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 15:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B234240329;
	Wed,  1 Oct 2025 15:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22339C4CEF1;
	Wed,  1 Oct 2025 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759334343;
	bh=DeMKRKU3xRJZbYNpgvsllh63nE3v4HH/2QRTFBnT5SI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qgxhURllZTMoEVbbK3LTCkTiFV5NwTyc1jwXsS/dOVdTALTXX3qd2iERv5SIyKrK6
	 UYCIbTYw0Uj2dYUeSrorDWxtbW/To1aFOHA0wkOjMzcxmOyQ/3229rLAeaiX+9paxy
	 EQK48wlNX9eHftFQtjA/XFVMuzAxX8Egy/fKwLfZwZERDauaTCnbCqls8L2SYy7scN
	 VKsAZdy0lKsaprd9IunnFnrQT8LVSdguG+QBQ3Tx+s3l4I6TyC/0ipvFNkiaj6pLie
	 FXFMlo35UTDt9uf5+JtqjXbItsGmiJM1J7KncEX6kQotyml58ZGCJNQQGLwalbDs0r
	 +AAjeu/iwKDXw==
Date: Wed, 1 Oct 2025 16:58:58 +0100
From: Simon Horman <horms@kernel.org>
To: Nishanth Menon <nm@ti.com>
Cc: Jacob Keller <jacob.e.keller@intel.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH V2 3/3] net: ethernet: ti: Remove IS_ERR_OR_NULL checks
 for knav_dma_open_channel
Message-ID: <aN1Pwh3B8xhEoQmh@horms.kernel.org>
References: <20250930121609.158419-1-nm@ti.com>
 <20250930121609.158419-4-nm@ti.com>
 <0cae855b-e842-47a1-9aaf-b2a297ec32d6@intel.com>
 <20251001105416.frbebh5ws2rnxquu@quality>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001105416.frbebh5ws2rnxquu@quality>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_085905_176880_4045651D 
X-CRM114-Status: GOOD (  19.45  )
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

On Wed, Oct 01, 2025 at 05:54:16AM -0500, Nishanth Menon wrote:
> On 16:59-20250930, Jacob Keller wrote:
> > 
> > 
> > On 9/30/2025 5:16 AM, Nishanth Menon wrote:
> > > knav_dma_open_channel now only returns NULL on failure instead of error
> > > pointers. Replace IS_ERR_OR_NULL checks with simple NULL checks.
> > > 
> > > Suggested-by: Simon Horman <horms@kernel.org>
> > > Signed-off-by: Nishanth Menon <nm@ti.com>
> > > ---
> > > Changes in V2:
> > > * renewed version
> > > * Dropped the fixes since code refactoring was involved.
> > > 
> > 
> > Whats the justification for splitting this apart from patch 1 of 3?
> > 
> > It seems like we ought to just do all this in a single patch. I don't
> > see the value in splitting this apart into 3 patches, unless someone
> > else on the list thinks it is valuable.
> 
> The only reason I have done that is to ensure the patches are
> bisectable. at patch #1, we are still returning -EINVAL, the driver
> should still function when we switch the return over to NULL.

Maybe we can simplify things and squash all three patches into one.
They seem inter-related.

