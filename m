Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91024CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcbfpvMeFZQQn0Wme2x0gtEmZjwzrQjTk83v9La0I3o=; b=c9QRYvZOPBOOEYJ8m0gTb3e1ta
	/SzGALUqyGgDVhNAnJWVe1AAfqXnua15UA9FY+CX59gAfEy6WzYkqZaZ9qwB0hgM4fzpegztnVKwl
	qnZsDQ2uYtLvjpEacdKv4XklXbrkBWBqHTmMzRUBpOb7JiWvgGyiaTl7M4GL1uyp9sW9P0+Gt27uv
	g3TVcFLXZn2l0I+WgvG+n82nqJ9ibSb0obuORJOi4//1T1w6Z0Y+ujD747xmVQ72NchJBxMTcHgGf
	QezWqsDKpogZ8L0U/tWf2Vc2GvXzh7n5xu/nOk+WqOVPD9iF5FFd/q2CI1vSh/AUaqsJNeP7KuyhR
	hl55PrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0uL-00000003R0n-0gvC;
	Fri, 15 Aug 2025 20:20:13 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umzbP-00000003IKV-3s6L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 18:56:37 +0000
Date: Fri, 15 Aug 2025 11:56:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755284192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lcbfpvMeFZQQn0Wme2x0gtEmZjwzrQjTk83v9La0I3o=;
	b=EUyntAwUGNP/CpsSxVdmHUhjkdjEdHDWrZWWYFZIDeeITLWtAbhB3hO+OwHpaSTwnIx21Q
	01GwZJmbrE0uNEcu0XDorAhiZVvHELUpOkSvwqt9MpAMSmjB+Jp6bewqgzu3Lz0ifQUmBh
	vALVpkSNpUgK73qZTRlhGWrPhb8WSK4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Fix vcpu_{read,write}_sys_reg() accessors
Message-ID: <aJ-C1-t34aVmHLjY@linux.dev>
References: <20250809144811.2314038-1-maz@kernel.org>
 <20250809144811.2314038-3-maz@kernel.org>
 <aJuixWlc87f2UlK0@linux.dev>
 <86ikipev46.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ikipev46.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_115636_096953_393DC2FE 
X-CRM114-Status: GOOD (  17.94  )
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

On Thu, Aug 14, 2025 at 05:16:57PM +0100, Marc Zyngier wrote:
> My current conclusion is that a macro hack is not really practical, if
> only because we end-up here from out-of-line C code, and that at this
> stage we've lost all symbolic information.
> 
> We *could* take the nuclear option of re-modelling the sysreg enum as
> a bunch of #define, similar to the way we deal with vcpu flags, and
> have accessors for the various bits of information, but that comes
> with two different problems:
> 
> - we don't have a good way to iterate over symbolic registers
> 
> - we need to repaint a large portion of the code base
> 
> Given that, I've taken another approach, which is to move all these
> things close together (no more inlining), and add enough WARN_ON()s
> that you really have to try and game the code to miss something and
> not get caught. In the process, I found a couple of extra stragglers
> that are always loaded when running a 32bit guest (the *32_EL2
> registers...).
> 
> I've pushed the current state on my kvm-arm64/at-fixes-6.17 branch,
> and I'll try to repost patches over the weekend.

Thanks! I've taken a glance at the branch and LGTM. Just wanted to make
sure we have sufficient idiotproofing for the next time I misuse this
stuff ;-)

Best,
Oliver

