Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5782C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 23:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RN+hPZR9q9CM4KcSZQT3oVQYqkBddBrnlEEouwx+34=; b=jI5Wr8Jy9gCT/BH7ttGz3gK/sx
	yRU36CjK5gutMFIa0SwN8rwANKyuEgMMKa7rusLr3h3iUyThzAhQHrYGtUNQTkaq7I2F3UHMiISVp
	8c9k8Tnl0oNkpJgKrJZ/kWTXyPohjytgr4LPPN7daxH35EIDB2I7FzFr8gU2s0aZjqVehqE6Bc/qp
	Wp3M4pUzooByH985TXHoyHrrLoIFclxfQKqaxQNa0HOFi7Gs3RZg3wmgA3nz5+NtcagLBcbCN3l/T
	Ejy9Mjv7/ptP+7E+tQ6QYACR7AA0+SN3FaLj02fcgE1f63Pmcs0IUCQB7Is3jmrD9otYwrgdqzuKM
	KLQnczSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjPnn-0000000AXEj-0GeF;
	Mon, 13 Jul 2026 23:11:07 +0000
Received: from esa1.hc1455-7.c3s2.iphmx.com ([207.54.90.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjPng-0000000AXEJ-1KAI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 23:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783984262; x=1815520262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X/x4D83R5gsU8E1CkKaiYFFPJM0xUUgh7oB69MucA88=;
  b=ldUV+tgw6Q+jwbbAHqljSRh/RsdXJnamEFpX93HNLD9o/OmHzZISTFHL
   0wzfOgcVJDxh43U0nS2SlWj6n2Ftt7xrlSDTzab2PWYP2gBR2d4klvOcw
   8OnN3svAC3PyRZPiE+MXeEqrzGi2VAjHtBy/Q7trJyFw4EcoQ5edqvsKo
   cWKG1xR/JF3sn21hCh4D5hDvMHJ+p7BQTqWVeD3uAE51q3sDLy/vcQzQf
   wjn2M6jw5WDYVGgEFXsIm4KonJ+ukR4g/uG0XEOyzjSc3nmqcr8gUbLZG
   RuifTk6eVRJ3v6u6rMh/EHciHNclnq9r0admcPH2TRrVL7Vaho+5Hr1Uf
   w==;
X-CSE-ConnectionGUID: 1+7SiH2wQSqKUzC20cxWZA==
X-CSE-MsgGUID: 5YNyLaOYSnKlBIoDyyG1mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="247273135"
X-IronPort-AV: E=Sophos;i="6.25,154,1779116400"; 
   d="scan'208";a="247273135"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 08:10:58 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id EFA368204FD
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:10:55 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id A54FFC07162
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:10:55 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id B88A718004EA;
	Mon, 13 Jul 2026 23:10:51 +0000 (UTC)
Date: Tue, 14 Jul 2026 08:10:48 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 0/5] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <alVweBtKt_4jH1q3@sm-arm-grace07>
References: <20260510145338.322962-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510145338.322962-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_161101_029799_D0EFD3E9 
X-CRM114-Status: GOOD (  18.25  )
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

On Sun, May 10, 2026 at 03:53:33PM +0100, Wei-Lin Chang wrote:
> Hi,
> 
> This is v3 of optimizing the shadow s2 mmu unmapping during MMU
> notifiers.
> 
> Two new preparatory patches are added, one reduces a hole in kvm_s2_mmu
> and another refactors the code a bit during s2 faults. Other changes are
> listed below.
> 
> * Changes from v2 [1]:
> 
>   - Removed "polluted" teminology.
> 
>   - Use xa_{mk, to}_value() when storing and retriving values from maple
>     trees.
> 
>   - Avoid using the 63rd bit in maple tree values so that xa_{mk, to}_value()
>     does not lose us a bit.
> 
>   - Added reverse map removal during TLBI handling.
> 
>   - Other suggested refactorings.
> 
> Thanks!

Hi Wei-Lin
As this series is no longer cleanly applied on top of the recent kvmarm/fixes,
I wonder if you could update the series; I can wait if you're in the
works of preparing v4. I am planning to test this series on HW with your
proposed nested virtualization KVM selftests.

Thanks,
Itaru.

> 
> [1]: https://lore.kernel.org/kvmarm/20260411125024.3735989-1-weilin.chang@arm.com/
> 
> Wei-Lin Chang (5):
>   KVM: arm64: Use a variable for the canonical GPA in kvm_s2_fault_map()
>   KVM: arm64: Move shadow_pt_debugfs_dentry to reduce holes in
>     kvm_s2_mmu
>   KVM: arm64: nv: Avoid full shadow s2 unmap
>   KVM: arm64: nv: Remove reverse map entries during TLBI handling
>   KVM: arm64: nv: Create nested IPA direct map to speed up reverse map
>     removal
> 
>  arch/arm64/include/asm/kvm_host.h   |  17 +-
>  arch/arm64/include/asm/kvm_nested.h |   6 +
>  arch/arm64/kvm/mmu.c                |  43 +++--
>  arch/arm64/kvm/nested.c             | 238 +++++++++++++++++++++++++++-
>  arch/arm64/kvm/sys_regs.c           |   3 +
>  5 files changed, 290 insertions(+), 17 deletions(-)
> 
> -- 
> 2.43.0
> 

