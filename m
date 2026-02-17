Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A894E909A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBDtLdoS1TjfOYTWIopGDoRfaILTfRvr6pc82f0aQog=; b=dTR7UEbBgD/z+k8SscZrdn4SHu
	M3/YfykZZLeIvQZ537y+6bjIJMuzeG3tE+PZv7j7kVrCsAHmUsI2E4hVB1D0cQpkcqEg5sgBmUl6B
	zNJztPLdnWULIA/3KXjwbP+U0gPvP9vAvHIS9eizppr/k2okc6vDbMM3mneDYDI20YZaY52sGO+yX
	AjgMSMpq6FM9JHkIrLlxhOQ6nJ8sbkHH5Gs0AHGD16xgEBIGajHGSxXPyua42KlZfT3F9PqAXTFub
	mWDKAzCxsoHhcJ4C8c/+dDJwR8jKaWImwkgm+2yAS72Avdp/C9QBDzPvrcrd48Ln4nb18qeLqvxvs
	dpvItjVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLT3-00000008MHa-3ZeW;
	Tue, 17 Feb 2026 13:50:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLT2-00000008MHT-08dn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:50:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B13E160128;
	Tue, 17 Feb 2026 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EBAC4CEF7;
	Tue, 17 Feb 2026 13:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771336218;
	bh=Dfw9+j/itSiNkJGSOrHPlfOkShQBymFxhpeObmUl/NM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+AXkeY4FDzLfPe2bzC+HQQ17VtrouZtJ2AlK11HcCRFPJWWJJHvbTYuE/Zj2ZV3D
	 RdtU7VtOVwtTJ+5/4LlIsFHn7kAUUXM0g/VQhHxSj3Z5PYVw8QQfJ7BshwPB/S/che
	 6wP73p6R4iQ7L1S7hBw2gCRPJWYac+9eKMmnzREw=
Date: Tue, 17 Feb 2026 14:50:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jack Aboutboul <jaboutboul@microsoft.com>,
	Sharath George John <sgeorgejohn@microsoft.com>,
	Noah Meyerhans <nmeyerhans@microsoft.com>,
	Jim Perrin <Jim.Perrin@microsoft.com>
Subject: Re: [PATCH 6.6 0/3] arm64: Speed up boot with faster linear map
 creation
Message-ID: <2026021700-chafe-jurist-cb24@gregkh>
References: <20260217133411.2881311-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217133411.2881311-1-ryan.roberts@arm.com>
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

On Tue, Feb 17, 2026 at 01:34:05PM +0000, Ryan Roberts wrote:
> Hi All,
> 
> This series is a backport that applies to stable kernel 6.6 (base v6.6.126), for
> some speed ups to enable significantly faster booting on systems with a lot of
> memory. The patches were originally posted at:
> 
>   https://lore.kernel.org/linux-arm-kernel/20240412131908.433043-1-ryan.roberts@arm.com/
> 
> ... and were originally merged upstream in v6.10-rc1.
> 
> I'm requesting this be merged to stable on behalf of a partner who wants to get
> the benefit of this series in Debian 12.

Why can't they just use a newer kernel version (i.e. 6.12)?  Surely they
would be able to justify moving to a newer kernel for performance
reasons, why enable them to stay on an older one, just delaying the
inevitable upgrade they will have to do anyway in a year or so?

thanks,

greg k-h

