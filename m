Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49995CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rD94PrCYm4fuzTjVHIMD/f5TviFKIklj3Ap+ktQsV4c=; b=ULsigOv+mFICF+vwk20HsTgqZ7
	ft33un7Z4rmvlzt1GmS9tD/KDCbD5RFORa5ExQMDA//pshjsMKWPVnPAkmZfjCPSxyBBRexqFoGgb
	Nam/FaGnlRNTp7d4yd7WeqqIo+MLbbujliS6DhsTYUvSDge9+RNPDEKRwbb17lgIbcoJvLVF1xAKJ
	f9wAXj65lfqlX/XgEB1Vog7AQzLSFVBdV9LB13Fq/djFjUdXRb9kJS1ImTmQcC5A19huLv+X9VNrq
	mM6Cmzx634gilRuwVhtqpy6xBJ2oiI/Xa0qbST2HnuA1PsXcxKX0tQVEt+UtlYeDENn/Ev1kS7B9S
	HP5HXz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbOr-00000003nt8-29m6;
	Wed, 20 May 2026 07:31:29 +0000
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbOm-00000003nrq-2W72
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779262284; x=1810798284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3E0wRnExgvvSMI/XFpx5dzXw0vlKkYMdNcB4WowrgL8=;
  b=lLZaSOc1JqFfubS304CYh/F/MsAnKEcZOGjVBsx7ssYioOzYwpyEcg77
   Mey73MGGxIsGbHrjXjpJhdES+cH/v6PQo2haComYo4/4gFImDHoEj3qCm
   Mb05MjDCvPIFw2h6AgNkiaSDcztbh9AQG5f+HJ522So/8I6mX9vteQtfq
   DGj8fGZngaeCuRAo9Ve/eQsm+Q6jmU1ZHU3p//YgPdVvpm+0OZsX+QV62
   VJ32+tt5JcUUE7dnzqcoLUdSugHWvxJmjFE+qArm3OGYqmMQcUuZ36loB
   sNX+VygqX9PqOUlUC3uq2sUOf/4NkYWUi02ZXIeA5r4ur2Rq8HkPYjeo+
   Q==;
X-CSE-ConnectionGUID: zzQ38WsDTWOHQclsnw2wwg==
X-CSE-MsgGUID: Rlvc3nVrRSSCf0BunBe5/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="229179463"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="229179463"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 16:31:20 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 88161FC82
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 07:31:20 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3F44C1024A90
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 07:31:20 +0000 (UTC)
Received: from sm-arm-grace07 (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id B953340D518;
	Wed, 20 May 2026 07:31:15 +0000 (UTC)
Date: Wed, 20 May 2026 16:31:12 +0900
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
Message-ID: <ag1jQB3dRX0RSqbR@sm-arm-grace07>
References: <20260510145338.322962-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510145338.322962-1-weilin.chang@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_003124_932214_774D091E 
X-CRM114-Status: GOOD (  17.77  )
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

Hi Wei Lin,

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

With this series applied on the recent kvmarm/fixes (minor local modification), 
your v3 hello_nested runs fine on all three page granules; without this 16KB 
kernel can't handle stage 2 unmapping paths. I tested using the latest QEMU only 
so wonder how you're testing.  

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

