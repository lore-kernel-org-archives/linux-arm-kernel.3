Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF64C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 22:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gHIIODrhhdGVls2rVmx9Uyz58la+lWfKW4V8WRh8gI=; b=v9tnIX8OyZUP4NIFIoFDneuxAj
	KF6FA3NZ3AHR/5JSSJwe4aIziIYzdESubjPnugWrh4MYpUN4M0egFeMKjKIK4puMdk/vh6wp80YC2
	bBOZUPb85x+xdjJ0TaTiqdMaxQpYNqWpKLrxAsGxJne3pM+8hR6kMy62Nw68yI8HWYCLwYQO/T+RJ
	fhXUITHiFzqkuZzIDw+Rm/LI/6CEmbt+InGzeLQxTBZOk7FTdgyexbo5Hr51i0z+fc9vqjQ5PzeZK
	7oWGsSt4j9Ul2gXH5ILt52XKrmj5AMTp/sQzP+Q70c7a7/elF1Zo7aS6VX1Aq4iKOupMOoqV24aC9
	dMgphK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGmY-00000006njI-0AY7;
	Tue, 08 Jul 2025 22:27:22 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGkA-00000006nEL-2iFe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 22:24:56 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752013489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0gHIIODrhhdGVls2rVmx9Uyz58la+lWfKW4V8WRh8gI=;
	b=ObErs2xwKsqnb0SvubU2oaDqfFoLy9/r7regRmN+aeuOP0dEicWqzO8kBD+NoJw/5Pax+t
	GSuifAGT1pEeHmnDpPUnYR76R8ZHopXgM/d2EST9N+JVHjP91gAXpLer/RgeRV+HVO7K5P
	UMP10J9uQjXq/GbJH3MUl2Ewn4DUrvc=
From: Oliver Upton <oliver.upton@linux.dev>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	nd <nd@arm.com>,
	maz@kernel.org,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	yuzenghui@huawei.com,
	will@kernel.org,
	tglx@linutronix.de,
	lpieralisi@kernel.org,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH v2 0/5] KVM: arm64: Enable GICv3 guests on GICv5 hosts using FEAT_GCIE_LEGACY
Date: Tue,  8 Jul 2025 15:24:38 -0700
Message-Id: <175201339872.1946470.9170349330766710670.b4-ty@linux.dev>
In-Reply-To: <20250627100847.1022515-1-sascha.bischoff@arm.com>
References: <20250627100847.1022515-1-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_152455_439113_2C71630C 
X-CRM114-Status: GOOD (  10.56  )
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

On Fri, 27 Jun 2025 10:09:01 +0000, Sascha Bischoff wrote:
> This series introduces support for running GICv3 guests on GICv5 hosts
> by leveraging the GICv5 legacy compatibility feature
> (FEAT_GCIE_LEGACY). The main motivation is to enable existing GICv3
> VMs on GICv5 system without VM or VMM modifications - things should
> work out of the box.
> 
> The changes are focused on two main areas:
> 
> [...]

I've picked this up now that the GICv5 driver is baking in -next. No
promises that these patches actually land in 6.17 (if the host side
doesn't land) but I'm quite happy with the KVM bits.

Applied to next, thanks!

[1/5] irqchip/gic-v5: Skip deactivate for forwarded PPI interrupts
      https://git.kernel.org/kvmarm/kvmarm/c/244e9a89ca76
[2/5] irqchip/gic-v5: Populate struct gic_kvm_info
      https://git.kernel.org/kvmarm/kvmarm/c/1ec38ce3d024
[3/5] arm64/sysreg: Add ICH_VCTLR_EL2
      https://git.kernel.org/kvmarm/kvmarm/c/b62f4b5dec91
[4/5] KVM: arm64: gic-v5: Support GICv3 compat
      https://git.kernel.org/kvmarm/kvmarm/c/c017e49ed138
[5/5] KVM: arm64: gic-v5: Probe for GICv5
      https://git.kernel.org/kvmarm/kvmarm/c/ff2aa6495d4b

--
Best,
Oliver

