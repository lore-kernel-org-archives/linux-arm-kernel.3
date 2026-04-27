Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F09FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyOXD16AVEn2+jNkjmx/QXBNgk/cFeIkblrhM1nz1a0=; b=MgmDjLltlEYungIaE0qI+1ND3k
	ObXxj93jjGHpUv3Lsu5KYs0yCaTqUIhyueDYg54uynXuYD6KlI4JrG+Mm24LNt1V4ChJy9p917O1e
	1X8ASLjgCia5NfuLyC0OMPfDYAy/30Yj7xEmTDTkep6F6HIdGdATiHncqhQnFKOiypTMxdLou4rIr
	lfmGNPWKzuEA5bVchstiseDU09o6+RtK+2qZmvAaw+F/ux+bQDwql0D9vIsY5t1KL91+u3UY9yIjd
	O+xSKGDpxyXg7FVQBrs0J7gCq9FvrWraI1B08OVRe5z3DiRUHu+nJS9TdDbuSzyaB25+d0AgTzGR/
	6PejlLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLI7-0000000GvjC-2ILL;
	Mon, 27 Apr 2026 12:42:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLI4-0000000GviN-2Jm0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 12:42:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAAE3419F1;
	Mon, 27 Apr 2026 12:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F69C19425;
	Mon, 27 Apr 2026 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777293739;
	bh=E4JN3tpqXjLm9rCgx2y53pOGJUFLoml2hig5xRKFWyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f0mNuntOXUvsvZTC6O2mHfHb7CLmA9EtKNC1EppXeQZZh3QMv/bkTKOAog9WDGQck
	 hpzWFXRnx0/D8wCQBokY+KEs3HlZkrjtb6HSD42W3PKSndSeH58g9eQuvGvA0A6pRI
	 GkT2sV6Q8owz1BIobe1uV5w9Ze1e2+BffxobzMk6S26WEaaMvsbz6AS/jVb/Nca5Iw
	 NJyKA3qj3KsX9TQTVGNXvgDHCoLIcCbh9f6N1MzL/JGbPc+4gIHQir1mZVqwiTy3mu
	 FUYUaksyYCMBAXdbiwXM193X7X34JM97mJEpAemjLdGUps4tLjeC+jjHPT/PW2txSF
	 bqiMLTQCK9M5g==
Date: Mon, 27 Apr 2026 13:42:16 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [PATCH 3/8] firmware: arm_ffa: Align RxTx buffer size before
 mapping
Message-ID: <20260427-witty-light-hyrax-ea65d1@sudeepholla>
References: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
 <20260423-ffa_fixes-v1-3-61189661affe@kernel.org>
 <ae8sqehR7yQFheuj@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae8sqehR7yQFheuj@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_054220_611184_5671A11F 
X-CRM114-Status: GOOD (  14.68  )
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

On Mon, Apr 27, 2026 at 09:30:17AM +0000, Sebastian Ene wrote:
> On Thu, Apr 23, 2026 at 06:22:53PM +0100, Sudeep Holla wrote:
> > Commit 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during
> > RXTX_MAP") advertises PAGE_ALIGN(rxtx_bufsz) to firmware when mapping the
> > buffers but the driver continues to stores the minimum FF-A buffer size
> > in drv_info->rxtx_bufsz which is used elsewhere in the driver.
> 
> Hello Sudeep,
> 
> > 
> > Align the size before storing it so that the allocation, validation and
> > FFA_RXTX_MAP all use the same buffer size.
> > 
> 
> Thanks for fixing this,

It was my fault, I wasn't expecting sashiko was covering most of the lists
now, so didn't check for it in time.

> Reviewed-by: Sebastian Ene <sebastianene@google.com>.
> 

Thanks!

-- 
Regards,
Sudeep

