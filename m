Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A01C02193
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 00:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEGeIQ/RCr8VvVfV06i+b8+5DnmNJQ5h/zFNOrFOtFg=; b=xtrSqk2pLanS1fubaJ++4wL4Wp
	w1G2v2PAJcDUGxhFnj7iuMPcJ0SqWw4/VzBYqO48lT6HkCqWtBagZ4DYWU+HX1giURU9E0c3ych9/
	Z37fQI3JH4HV0pBIYHDfqMq3K8zMIa3gnrjC8gA1fXUD/QnHRiqxfdu526atveNAMRkkMbQ4BTbGX
	EP/SvhDjCRHVlomQ9hSven3id5uXXNQpoR2ELxwN1QBWwUTs1T5Z7FDzyrQDY29Ch5u9AlpPCsX6s
	nxDUqz9tJEEFmvjb8K+UXCTgZDf35qqLHKG2L1PfWAc7ixW9LZX3nLFxt8no5bete9vl2jU1A5oL/
	PHwSDyjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSrU-00000001sTK-40St;
	Wed, 05 Feb 2025 00:01:48 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSq9-00000001sHi-3b8u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 00:00:27 +0000
Date: Wed, 5 Feb 2025 00:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738713618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YEGeIQ/RCr8VvVfV06i+b8+5DnmNJQ5h/zFNOrFOtFg=;
	b=a9d73MErLZkqToq5s+8YSzdC0AyZo9DB+BMttxD0hdRmFHTbVhUWGiZHiceUQZ13C6JtEJ
	WmcuaNSUjlOBaeh875NRSsyTcFEhlKKscQ/r/IF8LDTvGikCumau/trvdxKsMMtYPFgMyN
	kqYiNeLaAHcxV6r1q2q+9yGGYwcruhc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 2/2] perf: arm_pmuv3: Uninvert dependency between
 {asm,perf}/arm_pmuv3.h
Message-ID: <Z6KqDR3S_AWXXLJK@linux.dev>
References: <20250204195708.1703531-1-coltonlewis@google.com>
 <20250204195708.1703531-2-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204195708.1703531-2-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_160026_036357_628043E2 
X-CRM114-Status: GOOD (  13.08  )
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

On Tue, Feb 04, 2025 at 07:57:08PM +0000, Colton Lewis wrote:
> perf/arm_pmuv3.h includes asm/arm_pmuv3.h at the bottom of the
> file. This counterintiutive decision was presumably made so
> asm/arm_pmuv3.h would be included everywhere perf/arm_pmuv3.h was even
> though the actual dependency relationship goes the other way because
> asm/arm_pmuv3.h depends on the PMEVN_SWITCH macro that was presumably
> put there to avoid duplicating it in the asm files for arm and arm64.
> 
> Extract the relevant macro to its own file to avoid this unusual
> structure so it may be included in the asm headers without worrying
> about ordering issues.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>

Is the intention of this change to allow asm/arm_pmuv3.h to be directly
included? If yes, what's the issue with using perf/arm_pmuv3.h?

We already use definitions from the non-arch header in KVM anyway...

-- 
Thanks,
Oliver

