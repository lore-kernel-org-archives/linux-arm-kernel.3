Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9279CC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 14:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EkuFujgfDTpIpPpk8NBBb6KhCuBm7WPjZnxZDwj2p/A=; b=0+jrK75ITW9T8OO/QcP9PP7J/w
	jShGIYN8pGGAbv0oR74nWtYRXwkqr9Eu1Or37XKyTO+1B/5AobCBKxgAtMBiF/jZ39wHFFfQCWkb0
	rEDQmgRKNiLAD7EO8jZQqsPzb1LUVZBQ+umhkFd0waQC1jL8F0fpkXioXILCkU+rtLh9Lkj5TmOTZ
	3qP3rbBfo7hP1Hh0g9dNP5+SLG/vfNmds0BepHp3V66SBSGGXwbYEtckm+BL0lGneGzINJi0uRyDR
	c/lTj0mlwwf8gSOcbBXnbFPkGjZ8z0HMKN8X6C8GKCBDRQCEU+C+G18FjprAjd7PLI1iRUcGNUuCK
	/gy3SPgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Lew-000000095Xe-1yFc;
	Thu, 03 Apr 2025 14:35:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LXG-000000094GQ-1Qge
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 14:27:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1FEC339;
	Thu,  3 Apr 2025 07:27:15 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 753FE3F59E;
	Thu,  3 Apr 2025 07:27:09 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com,
	huangxiaojia2@huawei.com,
	mark.rutland@arm.com,
	samuel.holland@sifive.com,
	palmer@rivosinc.com,
	charlie@rivosinc.com,
	thiago.bauermann@linaro.org,
	bgray@linux.ibm.com,
	tglx@linutronix.de,
	puranjay@kernel.org,
	david@redhat.com,
	yang@os.amperecomputing.com,
	mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 0/3] support FEAT_MTE_STORE_ONLY feature
Date: Thu,  3 Apr 2025 15:27:04 +0100
Message-Id: <20250403142707.26397-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_072714_421375_6D74FBB6 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
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

The FEAT_MTE_STORE_ONLY feature provides support for
tag check for store operation only. read operation is considered
as unchecked operation so it doesn't raise tag check fault.

NOTE:
  This patches based on https://lore.kernel.org/all/20250403141535.23496-1-yeoreum.yun@arm.com/

Yeoreum Yun (3):
  arm64/feature: add MTE_STORE_ONLY feature
  prtcl: introduce PR_MTE_STORE_ONLY
  arm64/kernel: support store-only mte tag check

 arch/arm64/include/asm/hwcap.h      |  1 +
 arch/arm64/include/asm/processor.h  |  2 ++
 arch/arm64/include/uapi/asm/hwcap.h |  1 +
 arch/arm64/kernel/cpufeature.c      |  9 +++++++++
 arch/arm64/kernel/cpuinfo.c         |  1 +
 arch/arm64/kernel/mte.c             | 11 ++++++++++-
 arch/arm64/kernel/process.c         |  6 +++++-
 arch/arm64/tools/cpucaps            |  1 +
 include/uapi/linux/prctl.h          |  2 ++
 9 files changed, 32 insertions(+), 2 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


