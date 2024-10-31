Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B3BE68948
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 02:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4SWEots0xlx10lLgo/CdaPxF6EJK3d8uGUzYbN09y4=; b=iUNBI3uHgXuvCofOP9mHvi0XoA
	fOvBjymhKqQnzNYZUIvMYrVrSp/Mt+PQKCK9tX94zPQqQpFy3Tu+2dBNvaw66Lh3TTsIT+qUPplEX
	mPk1szk09i+Hl98vPO8uVFHCskX4YTc/aGk1UPf4MGV6zWtDjhk9ll8FV0d8cKRzmO1/tGCcoG693
	EEbyH+YKWRvlGkyLCQK4UO7S+Go+ak1O7fNoKBUY7BSegxVlBTlCY1y334et9ie5aMH9pTJdoQB6x
	nDaL7X8RCyDFxh7kcF6HplBl6pIvDmDFQW4YseHWLroHWuBdFnpcmwY/bFZyZ3vUaTkxmgaB9SahU
	ERXVU7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6L74-00000002Mva-1O6f;
	Thu, 31 Oct 2024 02:40:42 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6L4s-00000002MhE-2OpF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 02:38:28 +0000
Date: Wed, 30 Oct 2024 19:38:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730342303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g4SWEots0xlx10lLgo/CdaPxF6EJK3d8uGUzYbN09y4=;
	b=dkeeX5TZ0DEv7nA3oF5JKE5ZflsOWunTNrvPxKunpVHbLQ/3ZSrBvoOdZ6g3jNSDSPug/u
	vTh8Gqf9d2bRw1IJaoXznhDIrgWOfZIAhj/ru0Kyj9/yO7qBFI6aWbiq631c0QPDhYQ0w8
	l0s7Q5eNV5bUoZFDJ/HIFP8ePAPmzjA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	anshuman.khandual@arm.com, gshan@redhat.com, james.morse@arm.com,
	shameerali.kolothum.thodi@huawei.com, Marc Zyngier <maz@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jing Zhang <jingzhangos@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 0/7] KVM: arm64: Hide unsupported MPAM from the guest
Message-ID: <ZyLtl6lLSEczqHjF@linux.dev>
References: <20241030160317.2528209-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030160317.2528209-1-joey.gouly@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_193827_120850_EA06E551 
X-CRM114-Status: GOOD (  21.82  )
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

Hi,

Thanks for respinning this Joey.

On Wed, Oct 30, 2024 at 04:03:10PM +0000, Joey Gouly wrote:
> Hi,
> 
> changes since v5 [1]:
> 	- Removed Kconfig option, the KVM traps shouldn't rely on host kernel support
> 	- Renamed cpus_support_* to system_supports_* since that matches other functions
> 	- Replace static branch arm64_mpam_has_hcr with a normal cpufeature capability
> 	- Add MPAM*_EL2 regs to KVM (undef_access)
> 	- Use constants in the test, instead of hardcoded values
> 	- Added R-b and T-b tags
> 	- Rebased on v6.12-rc5
>
> James wrote:
> 	This series fixes up a long standing bug where MPAM was accidentally exposed
> 	to a guest, but the feature was not otherwise trapped or context switched.
> 	This could result in KVM warning about unexpected traps, and injecting an
> 	undef into the guest contradicting the ID registers.
> 	This would prevent an MPAM aware kernel from booting - fortunately, there
> 	aren't any of those.
> 
> 	Ideally, we'd take the MPAM feature away from the ID registers, but that
> 	would leave existing guests unable to migrate to a newer kernel. Instead,
> 	just ignore that field when it matches the hardware. KVM wasn't going to
> 	expose MPAM anyway. The guest will not see MPAM in the id registers.
> 
> 	This series includes the head.S and KVM changes to enable/disable traps. If
> 	MPAM is neither enabled nor emulated by EL3 firmware, these system register
> 	accesses will trap to EL3.
> 	If your kernel doesn't boot, and the problem bisects here - please update
> 	your firmware. MPAM has been supported by trusted firmware since v1.6 in
> 	2018. (also noted on patch 3).

This is looking pretty good to me, and I'd really like to have it in for
6.13.

Will/Catalin, first 3 patches look OK to you?

-- 
Thanks,
Oliver

