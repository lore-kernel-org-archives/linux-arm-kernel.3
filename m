Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D55ACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKtyNwTMP9J0TkBkc6bERFF21TZVg5XRFFjChO7I9cA=; b=gn8euq9UaYlSSsCpq5D86NZv4i
	MP/j16dZ73Cjd6STWHVqq3bBLE5iBWDOG5E9280lbAp9aUkHciiiNbbzRCOarSl6nu/qfkOazcfkh
	6g9gDUmUqD3CVN5Qi+znFBLZHrzNYZHa5RNrSqlPS3zQtoahE1Pu0XKqMnMtaSVUR8WBPo8l3Z3wZ
	5oD98MNNxgmiV9FsOjquG7mPJUXHkt4aQ3Vkjamdm+ZMs1fvoxIAOeLWycqQw8+WJARXZplAgcdaQ
	bddE/OJ7CSTW29SlFnF++SyotmqwHFavVxCrLxQ8W1fjj9ER66Rqe4x+naVczIOknWstEi2aFZD3v
	bnujznSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWih-00000007zJa-3p3y;
	Mon, 25 Aug 2025 12:54:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVOy-00000007li1-1kut
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 11:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D07A54494E;
	Mon, 25 Aug 2025 11:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BE4C4CEED;
	Mon, 25 Aug 2025 11:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756121414;
	bh=3IHQNx2wrG20tcpiuH47GBZaxIUHfLatzNtTwPWBAJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cu8R6Ml8hgPAFNXJ3urcJe2DA/DwaerKI9hS5K95Dj/iVuMKIl+WvKpmc91YAr/f3
	 KbQGqfuYwSNxbexZG+GBmsNpU0PH/FM3sGwHe2gSkv8f5AHuaLi4//ol7rxFIWKCI4
	 2Re4C593+G9oUPJXS8yJdwPUak+xt+Z4KiUyNiTnahE5YuZ1dPge//kDUUwmdn2vRp
	 sqF3Ku8TdWpiuczfb5gH68oLe3hiBjzRYKJoiwuqOzQMGyBAERvUrpfTMEgqatrwLp
	 zxG+rn5TVs2DbsBLwV1dXAtkxQMFasnKZxBDBGxFQ76FAdZpgS1N5esrE/uHXAjQTk
	 Htd3lrHS+/+fA==
Date: Mon, 25 Aug 2025 13:30:08 +0200
From: Vinod Koul <vkoul@kernel.org>
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"Katakam, Harini" <harini.katakam@amd.com>
Subject: Re: [PATCH V2 1/4] dmaengine: Add support to configure and read IRQ
 coalescing parameters
Message-ID: <aKxJQLx6yprNdU03@vaman>
References: <20250710101229.804183-1-suraj.gupta2@amd.com>
 <20250710101229.804183-2-suraj.gupta2@amd.com>
 <aICPiS1_ITwELrxq@vaman>
 <BL3PR12MB65713879CB569E3B330C1E76C95FA@BL3PR12MB6571.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR12MB65713879CB569E3B330C1E76C95FA@BL3PR12MB6571.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_043016_479273_E9F77514 
X-CRM114-Status: GOOD (  15.43  )
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

On 23-07-25, 11:49, Gupta, Suraj wrote:
> > >  struct dma_slave_caps {
> > >       u32 src_addr_widths;
> > > @@ -520,6 +528,8 @@ struct dma_slave_caps {
> > >       bool cmd_terminate;
> > >       enum dma_residue_granularity residue_granularity;
> > >       bool descriptor_reuse;
> > > +     u32 coalesce_cnt;
> > > +     u32 coalesce_usecs;
> >
> > Why not selectively set interrupts for the descriptor. The dma descriptors are in order,
> > so one a descriptor is notified and complete, you can also complete the descriptors
> > before that. I would suggest to use that rather than define a new interface for this
> >
> 
> The reason I used struct dma_slave_config to pass coalesce and delay information to DMA driver is that the coalesce count is configured per channel in AXI DMA channel control register[1].
> AXI DMA IP doesn't have provision to set interrupt per descriptor[2].
> I can explore other ways to pass this information via struct dma_async_tx_descriptor or metadata, or any other way.
> Please let me know your thoughts.

dma_async_tx_descriptor has dma_ctrl_flags and one of them is
DMA_PREP_INTERRUPT which you can set for a descriptor and control when
you get the interrupt

I am not a fan of adding custom interfaces.

-- 
~Vinod

