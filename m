Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C61CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 07:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwegSCgcGZ3RdGfyE/hNWVStszGfYWZu1R2deALHTjE=; b=U0E8CYU1IHOriWIuxoH4WLF6tv
	l4tieYwbjU3viFOS80Qh2L+ZAR97M+xEtLwiCjWUbKmhySkS0NEcCy1ujQ/EVrcUPnHODOxLVvkpz
	ap2Y0BueAXy9ukdTKnNaKbt/4aqdspK93sC6qo/NbEbbrb7cUSyi+9331cW3poRWsS/sTJsTGimfk
	oiwmV8dfQ3p6i+5S2GbLkji4o2VIOMfbi+8dAlnM+fjBEk9zBG9ffC/OUpyH04kt6ACK+PEjU0dOw
	9HYMLuZxy3Atf6j516VLQ+BMg0K2nNPzVDhh7+JpDIrzIcRhcGWkF4uI6CMq70U5WypakgyawzWGP
	NFuRN88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4I4-00000001cpM-3Cl7;
	Wed, 13 May 2026 07:46:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4I2-00000001cos-0Py8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 07:45:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 341E143DB5;
	Wed, 13 May 2026 07:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E23C2BCB7;
	Wed, 13 May 2026 07:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778658357;
	bh=4LEL2I02ZNcYBvdRSq6ZKXzxViElK+3D8okdJW4tWaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JcmzwXJoOLz0s9/QXfUAL87bTvpMBs+SpVCsKRsXEsJPMUgjJ+74KkiMp315a4v4u
	 N8HSvEa/jlN8MMNHG4YgW4hGjEC2CZykvVEBTh7PSfzwLybzsJYdPrBbit2g2e3j1Q
	 Q1Y4a8+8LZKppLGWhI6TAf/e3SPIhpFcY7ZxdhsBv3tcSPVKb6orlxt8Gn83IuftPd
	 XJIXUnazS71GUEOT0jtvA+IpCEG5zwk8AIqSxYjla909ZkQ3RJRhFTSah/HHutKGfy
	 Fr/OPxJvx76L5Lic6jk1UoSQThATSTwac24yXFynsEF2/00LZyrw5sg8b/9t13lIec
	 URFGDSi9SzN4A==
Date: Wed, 13 May 2026 00:45:55 -0700
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 08/20] KVM: arm64: Add Partitioned PMU register trap
 handlers
Message-ID: <agQsM7XFsbxbFRLO@kernel.org>
References: <20260504211813.1804997-1-coltonlewis@google.com>
 <20260504211813.1804997-9-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504211813.1804997-9-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_004558_157515_C27E5007 
X-CRM114-Status: GOOD (  13.31  )
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

On Mon, May 04, 2026 at 09:18:01PM +0000, Colton Lewis wrote:
> We may want a partitioned PMU but not have FEAT_FGT to untrap the
> specific registers that would normally be untrapped. Add handling for
> those trapped register accesses that does the right thing if the PMU
> is partitioned.
> 
> For registers that shouldn't be written to hardware because they
> require special handling (PMEVTYPER and PMOVS), write to the virtual
> register. A later patch will ensure these are handled correctly at
> vcpu_load time.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>

I'd prefer an approach that provides a single accessor helper that takes
a vcpu_sysreg enum as an argument and internally handles the dispatch
between partitioned and emulated PMUs. That goes for all of the PMU
sysregs.

This will help you reuse some of the PMU emuation code that you'll still
need for things like nested...

Thanks,
Oliver

