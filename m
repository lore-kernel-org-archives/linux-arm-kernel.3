Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315B6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 07:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwMlEka4cJNY6w6I3TpYez2izlEFdQeUh6PWXpxUFGI=; b=cps9NFMRpq5ClEquYp8gRBmd+k
	gyMW4d/JeX8WOSjCSQb5zyz9u7s2cKPAhGjRmCk0wzNUmdbG24AZ4ONyjW4RQk9+PelDWisn3ts+p
	I0H0IcI/jl8a5Pr9rqMVetOYt7EqFFsSaPQXDVxU44npfhIWgD7U1OTl9F2ccAPGtTdF/YrIKm9Y9
	wgeutOcbXtD27pe6jyCom3JIqklyjaAwV/nMFLYW3QRSlVM6fGjvlbz312aV+NGdvJca30rdIV+K9
	pLR6KQgoMs6wm2T8WohsnaYItkVseucEcxLRELbnnyTsBjlcWxd2anBPb/VRBBhIIuBLKLAxID/Bw
	/4i1JKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uepxz-00000006eop-0pGr;
	Thu, 24 Jul 2025 07:02:11 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uepoJ-00000006di8-3Dac
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 06:52:13 +0000
Date: Wed, 23 Jul 2025 23:51:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753339928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rwMlEka4cJNY6w6I3TpYez2izlEFdQeUh6PWXpxUFGI=;
	b=vy35sepI5H0lMN6QsQEkxtboil6uVq6YnQn17xMIc8eo9SlFtOiCmmhUf2hsYJ9vCeVWaa
	7qRfgfdeD0P6J+2KUfWFaT8Wid5wV4/DmPorgt15Fr3xzKH8KjUcZ81D3PXdQDaI541r2u
	P0xxs9D9Skx6O6c5fUHtw0wnOwVP5Kc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 0/5] KVM: arm64: Config driven dependencies for
 TCR2/SCTLR/MDCR
Message-ID: <aIHYAeMb11eh2wih@linux.dev>
References: <20250714115503.3334242-1-maz@kernel.org>
 <175268446558.2457435.12236491763380805714.b4-ty@linux.dev>
 <276a28fa-c0a2-4ab7-8391-2c20831469e1@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <276a28fa-c0a2-4ab7-8391-2c20831469e1@suse.cz>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_235211_950727_BBA2B98C 
X-CRM114-Status: GOOD (  14.49  )
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

On Wed, Jul 23, 2025 at 05:53:20PM +0200, Vlastimil Babka wrote:
> On 7/16/25 18:47, Oliver Upton wrote:
> > On Mon, 14 Jul 2025 12:54:58 +0100, Marc Zyngier wrote:
> >> Here's a very short (and hopefully not too controversial) series
> >> converting a few more registers to the config-driven sanitisation
> >> framework (this is mostly a leftover from the corresponding 6.16
> >> monster series).
> >> 
> >> Patches on top of -rc3.
> >> 
> >> [...]
> > 
> > Applied to next, thanks!
> 
> The following merge commit creates a ./diff file. Found out because I had
> some local leftover one which prevented git checkout of current next.
> 
> commit 811ec70dcf9cc411e4fdf36db608dc9bcffb7a06
> Merge: 5ba04149822c 3096d238ec49
> Author: Oliver Upton <oliver.upton@linux.dev>
> Date:   Tue Jul 15 20:40:59 2025 -0700
> 
>     Merge branch 'kvm-arm64/config-masks' into kvmarm/next
> 
>     Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> 

Thanks for reporting this, I've added a fix on top of next and will
correct the merge when I rebuild the merge history to send the pull
request.

Thanks,
Oliver

