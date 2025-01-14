Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0092BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 14:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXNCITc/2j3lkLyV4uSVN75NUjZp0MEhs3qyR6BVyq8=; b=darXEHOyqa/08TtmfQZd3/rZ7K
	idrVoudyalspDr+lKc40t4XEMDJCpGTGhwn1Ke/wBbpzm++E4Q5/B9iEIOHQFCkYMMSMqJXDsjBW2
	id6Qz8iKnzLHmltfx40zflDJhM8/tVeCFDZBGoqV5dSfUi8mKZAqWpwW10muSqXHxE4jUPN1kIn7X
	v8oaiXgQKoCiCodsOfW8jrs4D8XrCgt+yMl8xTfQnQ5oGuiyQ53V4Ps/sH14t2bTWrTbAuLAO3IML
	zWL5iJJPkakDXW7FUY3KnwvMY8jIgnk83RJkg0dCKUEzC91lJb1B1xQAPftL7t0F/IaaxEFhoyFTD
	h65Ov9rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhkp-00000008eHP-2RVv;
	Tue, 14 Jan 2025 14:18:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhgq-00000008dHG-23gV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 14:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D73835C582F;
	Tue, 14 Jan 2025 14:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA3DC4CEDD;
	Tue, 14 Jan 2025 14:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736864083;
	bh=lVsjLtMr3iTOzVYmXmNqm0j3L/lDg64orY2BEiVHyGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnPGRp3ZUaL518G+5mTsSKqMKXuPIvk2Pzod+WD3/vJMHgUcF/t66PSt+CJPgK1G6
	 uUcQyMBgull816sX8XdcMjMEU/GG+6JvPoUu+ChEMjlAoGpssQMe8XChUc63CzmSzh
	 qyxiNXLt1/AHuXo27LqFcLzB+1lnFYWeYkpvSy1jVg32GUvhl2d+nhdOMmzuoU8sa/
	 hF21g/epss+fqa7iUbYjsqY6Vnyk11ghG9zNAvdYVMueC/GVyPlguvwi1ytCnI1Z4c
	 oDpeSxNrWKePmdIW7w4O3UaY6zDf0EBDUL32q6R1i/V170Ay6nG87iLy/Irvz6yazl
	 8ZpYBw8TDPWhw==
Date: Tue, 14 Jan 2025 14:14:39 +0000
From: Simon Horman <horms@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Shannon Nelson <shannon.nelson@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 5/6] net: xilinx: axienet: Get coalesce
 parameters from driver state
Message-ID: <20250114141439.GH5497@kernel.org>
References: <20250110192616.2075055-1-sean.anderson@linux.dev>
 <20250110192616.2075055-6-sean.anderson@linux.dev>
 <20250113173910.GF5497@kernel.org>
 <14d13d7e-ef1d-4dcc-bd18-7a6709616678@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14d13d7e-ef1d-4dcc-bd18-7a6709616678@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_061444_567682_A2CD3F6F 
X-CRM114-Status: GOOD (  20.36  )
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

On Mon, Jan 13, 2025 at 12:45:24PM -0500, Sean Anderson wrote:
> Hi Simon,
> 
> On 1/13/25 12:39, Simon Horman wrote:
> > On Fri, Jan 10, 2025 at 02:26:15PM -0500, Sean Anderson wrote:
> >> The cr variables now contain the same values as the control registers
> >> themselves. Extract/calculate the values from the variables instead of
> >> saving the user-specified values. This allows us to remove some
> >> bookeeping, and also lets the user know what the actual coalesce
> >> settings are.
> >> 
> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> >> Reviewed by: Shannon Nelson <shannon.nelson@amd.com>
> > 
> > Hi Sean,
> > 
> > Unfortunately this series does not appear to apply cleanly to net-next.
> > Which is our CI is currently unable to cope with :(
> > 
> > Please consider rebasing and reposting.
> 
> As noted in the cover letter, this series depends on [1] (now [2]). It
> will apply cleanly without rebasing once that patch is applied. So maybe
> you can re-run the CI at that time.

Thanks Sean,

Sorry that I did miss the dependencies.

Unfortunately we don't have a way to re-run the CI at this time,
so it would probably be best to repost once the dependencies
are present in net-next.

> 
> --Sean
> 
> [1] https://lore.kernel.org/netdev/20250110190726.2057790-1-sean.anderson@linux.dev/
> [2] https://lore.kernel.org/netdev/20250113163001.2335235-1-sean.anderson@linux.dev

...

