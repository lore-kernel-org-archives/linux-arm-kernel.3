Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9139BCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1WKz+CUCVTpXCW4x1MmW4FRgp0BslUwCgj8AnFSebyM=; b=wCOkbiR1NwpA7ptL1he9uLHxDv
	NcPDepgxmlAb/Mo8pBLm/2gk9UeOZjhbY/TOMzoPkJB59izUT383ZlSxnVanegspFCNcXTI5TfDfy
	ft7ufpPBbO/T5/Nj7JB5Voag3fKRC9btnDE6w28g0dwePptDK17fdCR9B+40FXhxgmjrTenOfDKM6
	eZubGKYh59cdkv2jFlRTYOk/mMNrrLXQKUMjzImyVtUF9c9MPqCyWY7uAkNw8XRFtur3d0xs56q3m
	HwcvxGGYDM1Vxz0qS9AoV2nGpd87vwFIzuODJ830bltIQafpAXEf+T6YDPYc8Gvv/OxTWk40gQlTn
	RVwwLQgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuaWN-00000003ZOX-0pqu;
	Fri, 05 Sep 2025 17:46:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWjc-0000000246K-1Vgy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Sep 2025 13:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1WKz+CUCVTpXCW4x1MmW4FRgp0BslUwCgj8AnFSebyM=; b=TLqoNqLRMQ/rFC1uxV/EPhacWn
	ysO0xj0Sc/1iHqPKULu1SojBXgNBQNSCXdxLBXQEzsUKJlW/VeTCEzaHh2SIjp4oKWZDj7cwGFCR1
	0VarXi5eP/sS7vaCJmEcTpkZJKiwSKNp3HTzmP+Rcgy7ZF7MCmEWt/XzfEWez3uy4dDOSTWrngBlS
	IVuafdZGVOmK4D5V35MZR8k/WaHBbffMV30fFfSeTE1wFUDJY3T5/8EoZ4W8j00+IK1cgBULjBvyP
	/Hqbz2gp8QeP9rbk5hT/KaKf9x9PjbupII1TpogirvXbWMLM9c7d9H8wv6Dg2jkRd7IQYuwh+Z3Pp
	G47XZQTw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWja-00000004b29-2bpx;
	Fri, 05 Sep 2025 13:44:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1FCAD3001D4; Fri, 05 Sep 2025 15:44:09 +0200 (CEST)
Date: Fri, 5 Sep 2025 15:44:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 5/7] arm64/efi: Use a semaphore to protect the EFI
 stack and FP/SIMD state
Message-ID: <20250905134409.GD4067720@noisy.programming.kicks-ass.net>
References: <20250905133035.275517-9-ardb+git@google.com>
 <20250905133035.275517-14-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905133035.275517-14-ardb+git@google.com>
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

On Fri, Sep 05, 2025 at 03:30:41PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Replace the spinlock in the arm64 glue code with a semaphore, so that
> the CPU can preempted while running the EFI runtime service.

Gotta ask, why a semaphore and not a mutex?

