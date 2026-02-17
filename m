Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6C3E909A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 14:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GV1QxuLaE1MQ2nPJWIdJ/PL2ev8fC46UWGvX81h8MSs=; b=N0pHf8DTk1kjnhdAtmpnw21CWf
	clkeuahOCiHJXsxTtP3X0QfFOXqi4FlDE4HjU58NMJ2a6kKKTTb1KqMijUkJ9rKasz5eAr/X1DaOk
	+v9Pe5elvqBkTJV+vi+ERQJRMCqBRMgu2gxi4MZZSFmHARY9mP/4BUp/LOEyIh0WBAjFqnYHiFzCa
	6Ynt6J1OYm4LTMUd1otAwiKWxeWWmcTo6qAPxSuUflekmnF84BNyDgw8VygRCh2rbHOOupZfSoma1
	Hz2GS0K1pMO1oE/fBzuP4Y7wtPC/SPlteXxg7KzBixcupN8S8pIPmtjJbd/GOBdLKElGLVFpmnINd
	C9F57+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLmQ-00000008P15-3Mxw;
	Tue, 17 Feb 2026 14:10:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLmN-00000008P05-1VMe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 14:10:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1921F409A7;
	Tue, 17 Feb 2026 14:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E285C4CEF7;
	Tue, 17 Feb 2026 14:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771337418;
	bh=vn1t/wW3tD+nyVk4FWbkz8/fkTB6j0/+tsYguCyWDPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bUhUPeWfcoazn+gG7u/46Cx60IQd8Ndc8wZOE7vyOEXNFQlyt9HmKEPCBP4zGic83
	 gDekwlaVWrc/a51rLZ9/dEEpt+A5vumbLBVydwJNp6wL8z+YjViqM1BNn79/D/W6Yd
	 BVlhl8pBskar4Bm3icvXcz8UoR9jERVaw+0WuZS4=
Date: Tue, 17 Feb 2026 15:10:14 +0100
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
Message-ID: <2026021718-citrus-parakeet-dc60@gregkh>
References: <20260217133411.2881311-1-ryan.roberts@arm.com>
 <2026021700-chafe-jurist-cb24@gregkh>
 <17c9efaf-6c33-4485-bde2-345cc15ac000@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17c9efaf-6c33-4485-bde2-345cc15ac000@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_061019_418704_B25EC595 
X-CRM114-Status: GOOD (  20.74  )
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

On Tue, Feb 17, 2026 at 01:58:36PM +0000, Ryan Roberts wrote:
> On 17/02/2026 13:50, Greg KH wrote:
> > On Tue, Feb 17, 2026 at 01:34:05PM +0000, Ryan Roberts wrote:
> >> Hi All,
> >>
> >> This series is a backport that applies to stable kernel 6.6 (base v6.6.126), for
> >> some speed ups to enable significantly faster booting on systems with a lot of
> >> memory. The patches were originally posted at:
> >>
> >>   https://lore.kernel.org/linux-arm-kernel/20240412131908.433043-1-ryan.roberts@arm.com/
> >>
> >> ... and were originally merged upstream in v6.10-rc1.
> >>
> >> I'm requesting this be merged to stable on behalf of a partner who wants to get
> >> the benefit of this series in Debian 12.
> > 
> > Why can't they just use a newer kernel version (i.e. 6.12)?  Surely they
> > would be able to justify moving to a newer kernel for performance
> > reasons, why enable them to stay on an older one, just delaying the
> > inevitable upgrade they will have to do anyway in a year or so?
> 
> I can't answer this presicely, but I did ask and push for that approach. As I
> understand it, they are stuck with Debian 12, which is stuck with kernel 6.1.
> The Debian maintainer apparently requested that these go through stable in order
> to get them into Debian 12.

I understand the position of Debian not wanting to take patches for new
features that are not already upstream, but really, Debian offers a
newer kernel for hardware that wants to use it for things like this,
right?  Why not just use that instead?

thanks,

greg k-h

