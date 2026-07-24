Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946A8C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Viv4laXGsPAQoliMSE2ofB8brslnCyeCGRVHQ1c5ZY=; b=wcm4ZjiVOrKYKYEdp29PTxcx7J
	nfB31oRp65Spnyla5+efcv9pxIJgvDTHfEVL9dxGXNTrxbEFrc3MbYEIqV11XJI0avzY8NgDdyY85
	JQPo+jtqTIXF5aUtNgxkapwuIvaQx3mlc9U/waczfrflr4d3IGQOe8x9GqB7hoBe8fg/+mCvFIs4K
	ipN5GBum/e4WguQ3EpQL6JKuXTmt4Po3XdWnCJppIF6GXUKvXgWiz7MP0n2fbx52WKQP7SDM4FkDT
	RpIpXNZ42JrKmosT78TxdrGpShQetSyPcxm0ByNBkfLJPLQmDcblCFEV/XNQCxZrLQknGee+COe31
	aHldvuIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBUN-0000000FqAn-1Pv6;
	Fri, 24 Jul 2026 08:42:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBUI-0000000Fq9d-3ETy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:42:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E057600AA;
	Fri, 24 Jul 2026 08:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BB11F000E9;
	Fri, 24 Jul 2026 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784882553;
	bh=1Viv4laXGsPAQoliMSE2ofB8brslnCyeCGRVHQ1c5ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CSJqlN/lL9qh7fxX1PunNsNfpsBiwIkQyd4cr9nuIYrbqRVMM5LHUgQfB+Cav03lk
	 gfkcv5S7ZSyagwUGEWO8rLVXEvzXjHTW+X4e72LMZouVd58S34GrShgcjeEHnYrcEx
	 6sGElKzXdIE5NY/FwrDQF9WzNbTENPh7xOA6AXH4=
Date: Fri, 24 Jul 2026 10:41:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH] crypto: qce - Remove driver
Message-ID: <2026072412-decrease-sandbag-70a1@gregkh>
References: <20260724050645.223799-1-ebiggers@kernel.org>
 <2026072410-drained-acts-3502@gregkh>
 <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdJTFokXLEbJMQW3V4FAMQid50Vx3fDB+CaNGUrzX-Pwg@mail.gmail.com>
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

On Fri, Jul 24, 2026 at 12:36:24AM -0700, Bartosz Golaszewski wrote:
> I'm against removing this driver but I have a kernel driver policy question
> before I start arguing the case: If I say that I do use this driver and that
> I volunteer to maintain it and had already started sending out fixes, can
> Eric still force its removal? Because in this case I can name a whole lot of
> drivers that I deem useless that we still keep around.

But you aren't using it if it is marked as BROKEN.  If that's not the
case, and it is not broken, well why is it marked that way?

> The alg priority of this driver has been decreased below that of ARM CE and
> since CRYPTO_ALG_KERN_DRIVER_ONLY it can no longer be used accidentally by
> user-space either.

If it can't be used, then again, who is using it?  We can't have ONLY
out of tree users for code that is in the kernel.  We HAVE to have
in-kernel users for it to stick around.

> Even if in practice the driver is used for testing purposes - does this warrant
> its removal?

testing purposes of what exactly if there is no in-kernel code that
calls this thing?

thanks,

greg k-h

