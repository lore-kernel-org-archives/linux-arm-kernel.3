Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6AAEF9008
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 16:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIAH0HlFvYRhK3NFdoszDvTJ/4GsWMWcuMlXBzXmUX0=; b=VWINREKeESFuHimFATYw2ZiGCs
	7Seopjb+Sa+aKTf0bqI/D5ZOojVkjVveOIqj0FbfaFTXl2Ih4UIuH1FKrN3mWWSwuAEFMBZyDU0yV
	LMXJ6PTwXoWiFAJ+1OVCqYmyLWofPc2xYUZ5UPTAbCONOTf/qu6Aj9b4XuDPLY+g8oPDsZlaqAa6H
	v+lL+1WejwbfWAISTWNn0IqiPlUcNVmRh5/+5aoP03j29wVNw4J1Moyhb6raC72oKNm3IFBn4HzmJ
	YE6cbFv2gcmHPavcjZygB+dKL7ph1qm0u7ZkXjOA6S+VF6+Kli6ytNcKKOGirbhQQJhqD9WkPtAWz
	ptYWZCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpZ6-000000006wT-3gOc;
	Wed, 04 Mar 2026 16:59:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpZ4-000000006va-2vkm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 16:59:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BCAB439D1;
	Wed,  4 Mar 2026 16:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA49C19425;
	Wed,  4 Mar 2026 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772643554;
	bh=xZa2Y+msYQnIXAIQ2pzwajkWrgpYxz5g3PV3bg0xq2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XBVDK4eSoTCLgjbGPqEMFROw/SayvAbpJZWETDEZ+z0P/MQ8igMpS+e8ASUuv+TfR
	 L8WmWS18NXj2d3wCRp77CPqJ4jsg4zIyC39MStuMY5X4ksMMmnYiA++Wf8W7l79kEL
	 0et01IwP1BJLesUgai1uTRNGo9ttRptGOmg5fRErbyFYtig6rAUfJ6emp3T7RREhbP
	 q+yoQFRzR3tOHB5mt9qLoc02N/v2aL4HUPTYn0hex7Qc1wgFdLpqIbTh+KYKOKG9Qq
	 LCwx8+JOAyQe3I0K7+qrv+mdCKJgt+efE/wLLeIQTQoLhwNfBhXDuqYWBStbo2kl9D
	 +dgSfZmF8yzTQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] arm64: Silence sparse warnings caused by the type casting in (cmp)xchg
Date: Wed,  4 Mar 2026 16:59:03 +0000
Message-ID: <177263468826.2651997.11372661656355895341.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227155142.1332743-1-catalin.marinas@arm.com>
References: <20260227155142.1332743-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_085914_772226_2F2FDB20 
X-CRM114-Status: GOOD (  10.14  )
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

On Fri, 27 Feb 2026 15:51:42 +0000, Catalin Marinas wrote:
> The arm64 xchg/cmpxchg() wrappers cast the arguments to (unsigned long)
> prior to invoking the static inline functions implementing the
> operation. Some restrictive type annotations (e.g. __bitwise) lead to
> sparse warnings like below:
> 
> sparse warnings: (new ones prefixed by >>)
>    fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted blk_status_t
> >> fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted blk_status_t
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Silence sparse warnings caused by the type casting in (cmp)xchg
      https://git.kernel.org/arm64/c/212dd8477653

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

