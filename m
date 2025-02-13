Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC508C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 05:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hg+0ovnbSnDJZTuZ98LHTcj7nTMSLyKl8yiqTcFehjM=; b=HmO2dHzM8oypul1zoPviADje0v
	WREagZdpdQYW2JzU6CP/os5dUZXF9Q6+Z72r2I0E7cp2jMOQKZKHVLkbhWSpTNKc4l9aAbm/PBVDu
	bvSR8DsNLQn1laRNAeGorNmxtLRpaKDc7K/85ZL6csr+foK+CSfwDPzsUhwxLkGFZ3pt6ND6teLb9
	L2LJhUwEaCUWTVhgT0LIB3otxtQrlf5lUJs/FVjmP5CUpmoZ5KKaa0JFSDotQWCSkkyEh8Y2zpNRr
	x5iJ7kaaAvnmVe8/Uxn16Cwc4P/Smh1ZtfLii1o4nC/JwKZQIlhnVprnLaZC8WRoKuqOeVoU+evgw
	pp+2KZ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiRNR-00000009m1E-34CV;
	Thu, 13 Feb 2025 05:03:05 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiRKQ-00000009lhh-40Ry
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 05:00:00 +0000
Date: Wed, 12 Feb 2025 20:59:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739422795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hg+0ovnbSnDJZTuZ98LHTcj7nTMSLyKl8yiqTcFehjM=;
	b=BpBvj3oRPNxSC4NdwdyyVbzORG6QzyE0/tiBnryhTUU8/eqQ49e9bamKsN1h89wCm/Nmx4
	pFc/jBZ2rpS9lYkQCuwThacavCkTvCkthS9PlH8E46qsJjpkNOXfcffGD6Ce+UxaiCagk7
	P3vm/bG5qbQLMXfSJGWADeMzkyIwZH8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Alexander Potapenko <glider@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: Assorted vgic fixes for 6.14
Message-ID: <Z618Rd__s7g8xWNP@linux.dev>
References: <20250212182558.2865232-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212182558.2865232-1-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_205959_225938_06E8F687 
X-CRM114-Status: GOOD (  15.37  )
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

On Wed, Feb 12, 2025 at 06:25:56PM +0000, Marc Zyngier wrote:
> Alexander, while fuzzing KVM/arm64, found an annoying set of problems,
> all stemming from the fact that the vgic can be initialised or
> destroyed in parallel with the rest of the guest still being live.
> 
> Yes, this is annoying.
> 
> This second version takes a different approach at the problem,
> plugging the glaring hole we have between vgic creation and private
> interrupt allocation.
> 
> Although this is more invasive, I'm more confident about this one than
> the initial version I posted a week ago.

Much better place now! Here's to the next pile of syzkaller bugs :)

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

> Alex, I'd very much appreciate your testing on this.

I too would like to see the tires kicked before we pick this up, if it
isn't too much trouble Alex.

> Marc Zyngier (2):
>   KVM: arm64: timer: Drop warning on failed interrupt signalling
>   KVM: arm64: vgic: Hoist SGI/PPI alloc from vgic_init() to
>     kvm_create_vgic()
> 
>  arch/arm64/kvm/arch_timer.c     | 16 ++++---
>  arch/arm64/kvm/vgic/vgic-init.c | 74 ++++++++++++++++-----------------
>  2 files changed, 44 insertions(+), 46 deletions(-)
> 
> -- 
> 2.39.2
> 

