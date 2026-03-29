Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F09BF3D5EB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 06:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXwThl6bLgR8AssUJtM9SdV2ALZ3jG8j34ynu0lU7WA=; b=KQmgIhv1s445iwSFgpuFTwXxh+
	JHEhncQSyDZuydaZBrrL4jszEIuzkSsK5Em0h7VK1TQPmdEz1sMG8I+mlkMeshd72iW7HVs8oiHui
	4n9YNFBBFESFu+MYQphnfHCnd6V6b0GMSq6M2SdG0Cpq+MRWY6Nvs6dvGPVysM9HWGg7uDOmBNWYm
	DSXOnrBpsIDmO4a1bwEJj87WD+yBs9RSdPvExhu8qM1BvMTxdjRNRoB1ZEn+y9gayutkDr2Q6fQSD
	zy3YRAwrALJJ9Zsg+MR5c7lvkZyGYxlxNGBpAg75lVyW5pbhmxQ7ApOmOe97L147f7LpVrHyjNobj
	KNao398w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jiS-00000009eS9-1pcX;
	Sun, 29 Mar 2026 06:33:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jiQ-00000009eRy-2efy;
	Sun, 29 Mar 2026 06:33:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B409660054;
	Sun, 29 Mar 2026 06:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C7EC116C6;
	Sun, 29 Mar 2026 06:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774766021;
	bh=/FPsWdmFoji+nVVSnDdSBj4l0mzT+hOaV4l0n8eYlgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xTaLnEuYNnZqSlJuksdPBlXwRhrrQK76LfuvstYqhAqAHwqytkFCj2yNYxAO3z4Fn
	 8FTLrwKXQmd4LiJiZMfgPLnQqpxLa1ZgXhLVFTcRkgZD7blEehRF+DiUmx+x/j/71Z
	 s1KTz1on5SOQfK7YJeshRz0tT7/WYcUYgl4+yMcY=
Date: Sun, 29 Mar 2026 08:33:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH 1/2] staging: vc04_services: vc-sm-cma: fix integer
 overflow in vc_sm_cma_clean_invalid2()
Message-ID: <2026032956-railroad-renewable-3328@gregkh>
References: <20260329062004.492812-1-sebasjosue84@gmail.com>
 <20260329062004.492812-2-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260329062004.492812-2-sebasjosue84@gmail.com>
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

On Sun, Mar 29, 2026 at 12:18:45AM -0600, Sebastian Josue Alba Vives wrote:
> From: Sebastián Alba Vives <sebasjosue84@gmail.com>
> 
> vc_sm_cma_clean_invalid2() uses 'ioparam.op_count * sizeof(*block)' to
> compute the allocation size passed to kmalloc(). Since ioparam.op_count
> is a __u32 supplied directly by userspace via ioctl, an attacker can
> choose a value that causes the multiplication to overflow on 32-bit
> platforms, resulting in a small allocation followed by a large
> copy_from_user() and out-of-bounds heap reads in the subsequent loop.
> 
> Replace kmalloc() with kmalloc_array(), which returns NULL on overflow.
> Also add an early return for op_count == 0 to avoid a zero-size
> allocation, and return -ENOMEM (not -EFAULT) on allocation failure to
> correctly indicate out of memory.

Why not use kmalloc_array() instead?

> 
> The /dev/vc-sm-cma device is world-accessible (mode 0666), so this is
> reachable by any unprivileged local user.
> 
> Fixes: dfdc7a773374 ("staging: vc04_services: Add new vc-sm-cma driver")

I do not see that git id anywhere, what tree is it in?

thanks,

greg k-h

