Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F22CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 20:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1P79r8EPY6QOOutvqCLk1HTvnVsg9hrJyQeTZ0MuLqo=; b=eyQpH9/TtBJb4E85vkdrhI3ObK
	2XYETyxfJ4rUzDeqIo7LqwruFnntKycUHLqYOHXW5uS882qXZpku4/fwO/OQH7iXQx9MkuT41W+/Z
	Gk3SV1q5UXR6SeA0OqW2vJ5sK98C/HYmp0/OFFrLYsDqVkj7H1U8iDsxTXIxWz5WlPogcnTCjjFiv
	N/0xXW677Jnyfr9W3Znp12jhJlfPaB4ZtaDSXy/ew7e4u4wzh5V72ibFEmpPsP7dfJ1ZvQbqrK3W4
	NWNTCIsR30T35dP484x4sedCtRoLAQJx1DdCtvds1iIbwvxovPB/8W/JCVJwIoI/eRz5xWQtU+i8z
	JhGkLuug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFx0-00000005cXV-0tGD;
	Mon, 15 Sep 2025 20:37:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyFwy-00000005cX6-3GQI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 20:37:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2854F43F1F;
	Mon, 15 Sep 2025 20:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DECC4CEF1;
	Mon, 15 Sep 2025 20:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757968644;
	bh=EZeBJvxuLKJ6o0huTr1hGLlMz25RgDl+itYYX5CuQyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4vNRxSBfLX0vyLgaLf/3j9mJiqey8PykJkILYvLEoqn0LZbbxXwGFLLKAlhfGKfH
	 viNEaSwB8afu1N/ESddNalwYBT2715MBF7An4urp8GWogV5Ymx9JiEs7tC9yfReVpr
	 GJS/4SNShNH4IsNDet+7S9hEkPBbJ/BB87UWhGhNiMxxQnl+Bf0I1C5eJXEsx7IDB2
	 wKFFB+u/eUa9nSkm34wKRDgOZIAHT45Z+SzZyFfQ7qO94myjMtLG0Qzgc/dzeE4ikc
	 tolEkkaVBrMMhGeJBiHx6eN9TeGal7RL7SPvwL5ToJwLFAUgaX/1s53c9HwTLGg1so
	 XmaexXo/kkwqQ==
Date: Mon, 15 Sep 2025 21:37:17 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 0/6] support FEAT_LSUI and apply it on futex
 atomic ops
Message-ID: <aMh4_XzQqG2gZU_y@willie-the-truck>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <aMLmNnehYX6gqEIf@willie-the-truck>
 <aML3Ps1xeTCVCdTn@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aML3Ps1xeTCVCdTn@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_133724_835737_C2A8AEDE 
X-CRM114-Status: GOOD (  17.57  )
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

On Thu, Sep 11, 2025 at 05:22:22PM +0100, Catalin Marinas wrote:
> On Thu, Sep 11, 2025 at 04:09:42PM +0100, Will Deacon wrote:
> > On Sat, Aug 16, 2025 at 04:19:23PM +0100, Yeoreum Yun wrote:
> > > Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
> > > previleged level to access to access user memory without clearing
> > > PSTATE.PAN bit.
> > > 
> > > This patchset support FEAT_LSUI and applies in futex atomic operation
> > > where can replace from ldxr/stlxr pair implmentation with clearing
> > > PSTATE.PAN bit to correspondant load/store unprevileged atomic operation
> > > without clearing PSTATE.PAN bit.
> > > 
> > > (Sorry, I've sent wrongly for patch version 7 and resend it.
> > >  Again, sorry for mail-boom).
> > 
> > I tried to review this but I can't find any details about FEAT_LSUI in
> > the latest Arm ARM. Where should I be looking for the architecture spec?
> 
> Unfortunately, it's just in the public xml at the moment. Hopefully
> we'll get a release of the Arm ARM by the end of the year. Otherwise, in
> the private 2024 arch spec. Not ideal though.

Ah, thanks, the xml is a *lot* better than nothing.

> If you'd rather wait until in turns up in the public spec, fine by me.

As long as you're happy to continue helping with the review, I think
it's fine.

Cheers,

Will

