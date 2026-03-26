Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBD910A62DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RQXU1d7G5JQ/kya7sf5dGLhD7hU5QQ3JDWTSlEnIg9M=; b=EpFBBjGwRZ0IwXcRWNDCaa7oXP
	4nHcFbTcKxSFILiyHoCN+q5h+6N4YZrhaS3l9pOp+VSCagj96akOHj4duY5yDvmJo4G0mcPH3ANyO
	CBUhJyYiTMKXI3rbPmy0Yi7gwvXkwzdoL1fjgdjfRsbMmSAO0CPJk+7rGsAMTlqVRwDmtfLeq4RLi
	AB+FZXHj913T13XXlc75rC0isrYJn43P/LVtlt97pL0DCt6mFYA+Htnb4b16F0PBB5vAUPyXvsCfN
	kGrxn0CefvVY0hn5jnRBbGkT0NxLrJM1IMomRJDFZ1DikLwjXqqq7GyjRVKPiwRJOIZ05fAjD2w+n
	UcZAgsAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lRg-00000005cBX-0S45;
	Thu, 26 Mar 2026 14:12:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lRe-00000005cAy-3SPQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:12:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DDE58600AD;
	Thu, 26 Mar 2026 14:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33508C19423;
	Thu, 26 Mar 2026 14:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774534341;
	bh=VtAN8m1onSTBcLOzCI47xsDgjal03lRFmBJx3s07OL0=;
	h=From:To:Cc:Subject:Date:From;
	b=hbRbaVHnroVnSPV1vbTumNRF3iFriuolYE6pFkmoLlSGEFNZLF9HQfvJTBCtEiav7
	 T8jzVbh+pCw17TZ0YWec7/CE0qiJViV2TXIv9R9XdpZ/6baORUpwxQoLZoniwuBu30
	 cP7OCwijTJJYhV78gtnOWbSZxTSWeclwe0o6oflSko03G9zXBX5GtI2fZ9svYr995H
	 mOfpaQuNZMotV+WKE2bC5fuJVIYCHXfBrRSjhs39sWQeSsL5twzbmHWKGwAxHg1lxb
	 y1lsn0hXMi8jjXk8W/xXoIB6IMhBWVPzt0aq/cnaieZAzmsUgz3IsBgm3vscHT20Ec
	 B32lvMrlL6B1g==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Yabin Cui <yabinc@google.com>
Subject: [PATCH v3 0/3] KVM: arm64: Fix SPE and TRBE nVHE world switch
Date: Thu, 26 Mar 2026 14:12:10 +0000
Message-ID: <20260326141214.18990-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi all,

Here is version three of the SPE/TRBE fixes I previously posted here:

  v1: https://lore.kernel.org/r/20260216130959.19317-1-will@kernel.org
  v2: https://lore.kernel.org/r/20260227212136.7660-1-will@kernel.org

Changes since v2 include:

  * Simplified the TRBE drain check logic
  * Added R-b / T-b tags
  * Rebased onto -rc4

Cheers,

Will

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: James Clark <james.clark@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Yabin Cui <yabinc@google.com>

--->8

Will Deacon (3):
  KVM: arm64: Disable TRBE Trace Buffer Unit when running in guest
    context
  KVM: arm64: Disable SPE Profiling Buffer when running in guest context
  KVM: arm64: Don't pass host_debug_state to BRBE world-switch routines

 arch/arm64/include/asm/kvm_host.h  |   2 +
 arch/arm64/kvm/hyp/nvhe/debug-sr.c | 116 ++++++++++++++++++++++-------
 arch/arm64/kvm/hyp/nvhe/switch.c   |   2 +-
 3 files changed, 94 insertions(+), 26 deletions(-)

-- 
2.53.0.1018.g2bb0e51243-goog


