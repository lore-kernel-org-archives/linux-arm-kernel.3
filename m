Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68798F3D5F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 07:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rw1UMQjAuiocGfRpmoO9s5GZaPjHkIbBVbQCWe5wp5M=; b=0rB0vCT5Ab0AsXLby8IoJ4rZ2v
	j935Z+Xe6/zy7a6cbg5MFTq9gCQfmMNih3udQG5CWNa66uXwn5IxK74fDCproYvwSyOz3DjK+eTFs
	X9EzkgoVuB88auwf/ZTb3rKcogi312cvqS5nQTMNVxM0ezayXX2mmt3xYiKIQ+PFwEV3BBJYCebTK
	5+dA+NG0X5dbrfxGYzwy7WKerbp4CIkjqJ/KyPFyisbdfZN6uMKuhb9Xse3UpEW1T7oFysEQldILZ
	hMIKITfFcRRTG6Gv/wVuTJdb07ZeiD2OV5HjUEEKMBLmSw4TlHOuk2NbNJx95PiUKJourhhWHB1//
	fTywpTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kcd-00000009hoa-0Lnr;
	Sun, 29 Mar 2026 07:31:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kca-00000009ho7-3ULE;
	Sun, 29 Mar 2026 07:31:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 516A743DF2;
	Sun, 29 Mar 2026 07:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3624C116C6;
	Sun, 29 Mar 2026 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774769503;
	bh=UiV/buO8vCNeyTvNwe8eA3IvOUI1WBRLsEeSA1p47tA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ae7XGLLYnPFwd4iMlYFvEHm2Rnon/85QpCt25XpgVzfQv4RnpGsuK/kmGnA5UCqiR
	 +w0OeBUyZwXPTxeBpwsyBJBakEN8Cw35U3bwnxzdbw4jppgQZk7qWKwEwNjEka4WKC
	 PSxXaaSY25tITHRdtgjxd6Cq2KbuGgGCr9gwfkpg=
Date: Sun, 29 Mar 2026 09:31:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Sebasti=E1n?= Alba <sebasjosue84@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH 1/2] staging: vc04_services: vc-sm-cma: fix integer
 overflow in vc_sm_cma_clean_invalid2()
Message-ID: <2026032923-judiciary-mayflower-4452@gregkh>
References: <20260329062004.492812-1-sebasjosue84@gmail.com>
 <20260329062004.492812-2-sebasjosue84@gmail.com>
 <2026032956-railroad-renewable-3328@gregkh>
 <CAJD=UNdEqLW_CGpq0=p+DwJraiHTus+t-bPRW9wi2wh8B8C-rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJD=UNdEqLW_CGpq0=p+DwJraiHTus+t-bPRW9wi2wh8B8C-rw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_003145_193072_AF6C5C17 
X-CRM114-Status: GOOD (  18.51  )
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

On Sun, Mar 29, 2026 at 01:04:54AM -0600, Sebastián Alba wrote:
> Hi Greg, Thanks for the quick review.
> 
> Regarding kmalloc_array(): the patch does replace kmalloc() with
> kmalloc_array() - perhaps the question is about the remaining
> ioparam.op_count * sizeof(*block) in the copy_from_user() call below?
> That multiplication is now safe because kmalloc_array() already
> verified that op_count * sizeof(*block) does not overflow(if it did,
> kmalloc_array would have returned NULL and we'd have exited). Happy to
> add a comment clarifying this if you prefer.


Sorry, my fault, I meant alloc_objs(), coffee hadn't kicked in yet.

And please do not top-post:

	A: http://en.wikipedia.org/wiki/Top_post
	Q: Were do I find info about this thing called top-posting?
	A: Because it messes up the order in which people normally read text.
	Q: Why is top-posting such a bad thing?
	A: Top-posting.
	Q: What is the most annoying thing in e-mail?

	A: No.
	Q: Should I include quotations after my reply?

	http://daringfireball.net/2007/07/on_top

> Regarding the Fixes tag: the commit dfdc7a773374 is from the
> raspberrypi/linux tree (branch rpi-6.6.y). This driver (vc-sm-cma)
> appears to only exist in the Raspberry Pi kernel fork and has not been
> merged into mainline staging.

Then we can't do anything with it here :(

> I apologize for sending this to the wrong tree. Should these patches
> go directly to the Raspberry Pi kernel maintainers
> (kernel-list@raspberrypi.com) instead?

No idea how that out-of-tree driver is managed, sorry.

good luck,

greg k-h

