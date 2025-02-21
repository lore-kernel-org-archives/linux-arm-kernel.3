Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BBBC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DXWUYYhpDF9cbvi+OP+J5thVCYC8+IMsDBUcsoZlY8E=; b=IS+0E8DtYTcuGQkIFBjh9gn+Z7
	gDBGOJfZA+A1fM6TpqSig68FFf5gpoT5s8KaOIv+F6/Jrp36mSJaLtVB0oCfJCBx245J1KLP4kBC8
	melCKdSY6Es40kFQpHjuhRBAptbkNF6r3IGVn36pr0WaK+cHX9YxboOnxu37mHcGhRITdJL0RAjWf
	jM0WWYtpSPfZnUXRq1Ficc6DfLP93DrUpBQCyV8Y3HoAUk75OsU60Ux1wmdyyWHCmbzKQvqdz+RE/
	LhbUR70nvocg5Fothg2r7Hz0DsYfIQZuotDWIJtsAoMtp43FW6W8eTtiH2NzeLxkEWypaBDQSob6N
	Z8MJm1WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZA7-00000006htY-0Z2b;
	Fri, 21 Feb 2025 19:58:15 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZ8d-00000006hcf-36Bw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:56:44 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id B6B57204E5BC;
	Fri, 21 Feb 2025 11:56:42 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B6B57204E5BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740167802;
	bh=DXWUYYhpDF9cbvi+OP+J5thVCYC8+IMsDBUcsoZlY8E=;
	h=From:To:Cc:Subject:Date:From;
	b=LlJcvvQOgZJVX/Q2UUmFgjRVcib/5LYeSbCdU4Zbdhu4HAApNkZgNkHXz9Jrx1nZ6
	 MryWgCW5svmFC9BEHwNZRdQGNVrTMSnT0pNorXrYQvcVL52PRKF8rWic1hWlsT8hP/
	 b6O/RTJ2oaU7gllhyjwO7VBYtZBjNVSNyrI+fOKM=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	iommu@lists.linux.dev,
	mhklinux@outlook.com,
	eahariha@linux.microsoft.com,
	mukeshrathor@microsoft.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	daniel.lezcano@linaro.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com
Subject: [PATCH v2 0/3] Introduce CONFIG_MSHV_ROOT for root partition code
Date: Fri, 21 Feb 2025 11:56:32 -0800
Message-Id: <1740167795-13296-1-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_115643_821438_C4E84104 
X-CRM114-Status: GOOD (  14.25  )
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

Running in the root partition is a unique and specialized case that
requires additional code. CONFIG_MSHV_ROOT allows Hyper-V guest kernels
to exclude this code, which is important since significant additional code
specific to the root partition is expected to be added over time.

To do this, change hv_root_partition to be a function which is stubbed out
to return false if CONFIG_MSHV_ROOT=n, and don't compile hv_proc.c at all,
stubbing out those functions with inline versions.

Store the partition type (guest or root) in an enum hv_curr_partition_type,
which can be extended beyond just guest and root partition.

While at it, introduce hv_result_to_errno() to convert Hyper-V status codes
to regular linux errors. This is useful because the caller of a hypercall
helper function (such as those in hv_proc.c) usually can't and doesn't
interpret the Hyper-V status, so it is better to convert it to an error code
and reduce the possibility of misinterpreting it. This also alows the stubbed
versions of the hv_proc.c functions to just return a linux error code.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
Changes in v3:
* Fix a typo [Easwar Hariharan]
* Fix ret being initialized to HV_STATUS_SUCCESS in some hypercall helpers
  [Michael Kelley]
* Fix CONFIG_MSHV_ROOT being used in patch 2, before it is defined [Michael
  Kelley]
* Shorten hv_current_partition_type to hv_curr_partition_type [Mukesh Rathor]

Changes in v2:
* Add patch to convert hypercall statuses to linux error codes [Easwar
  Hariharan]
* While at it, split the original patch into two logical pieces, one to change
  hv_root_partition into a function, and one to introduce MSHV_CONFIG_ROOT
* Improve the clarity of and add an error message to
  hv_identify_partition_type() [Easwar Hariharan] [Michael Kelley]
* Better explain *why* the patches are useful, in the commit messages [Michael
  Kelley]
* Add a Kconfig comment explaining why PAGE_SIZE_4KB is needed [Michael Kelley]
* Minor style and typo fixes

Nuno Das Neves (3):
  hyperv: Convert hypercall statuses to linux error codes
  hyperv: Change hv_root_partition into a function
  hyperv: Add CONFIG_MSHV_ROOT to gate root partition support

 arch/arm64/hyperv/mshyperv.c       |  2 +
 arch/x86/hyperv/hv_init.c          | 10 ++---
 arch/x86/kernel/cpu/mshyperv.c     | 24 +----------
 drivers/clocksource/hyperv_timer.c |  4 +-
 drivers/hv/Kconfig                 | 16 +++++++
 drivers/hv/Makefile                |  3 +-
 drivers/hv/hv.c                    | 10 ++---
 drivers/hv/hv_common.c             | 69 +++++++++++++++++++++++++++---
 drivers/hv/hv_proc.c               | 10 ++---
 drivers/hv/vmbus_drv.c             |  2 +-
 drivers/iommu/hyperv-iommu.c       |  4 +-
 include/asm-generic/mshyperv.h     | 40 ++++++++++++++---
 12 files changed, 139 insertions(+), 55 deletions(-)

-- 
2.34.1


