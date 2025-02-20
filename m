Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D15FC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 18:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f+ig3Q6VESYArDvAdBr8s45cHmi1z9IqT8I/IrDLwWo=; b=18rUZAJ3K/rsFE+N8DhNb7Dxyt
	+JpfcLuBZvhYhsQM10AGoYtj4Y1aiMAew6ctHwkB1D8ltMDaKE1ZuHlAqZVV/+0mV4gq3Rj4xvrX4
	1+uQn7gdXqAlfjM7/FAxzbzBd77Nzf2eN/cbSI+1IgM3Z4ljORcuHIRVlcJw8TbWF9HHs4TjBPyMc
	ljUA8q8PXyx+I1Yi+tl1G3adcy6U9wP7UIXj1Qc7swYyLUFDG0Xd06ncpF/RU+zR1hntkq0kKXZgi
	pD+7I6FTlmkEym1SxIHM+qElUkpejYxfUEGocA90xf2MRIi9CsFC2AJZPy4wX5D5pY9WTP9BmzEAq
	fj5C3EBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBQS-00000002PoV-29Uz;
	Thu, 20 Feb 2025 18:37:32 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBMg-00000002OP5-327d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 18:33:40 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id C2CE72059190;
	Thu, 20 Feb 2025 10:33:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C2CE72059190
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740076417;
	bh=f+ig3Q6VESYArDvAdBr8s45cHmi1z9IqT8I/IrDLwWo=;
	h=From:To:Cc:Subject:Date:From;
	b=eREcWoQDX0aF/mtm+qMUFXwVTYYhadnAuREcLTeteFsSHPZiqup5cmrOo89zcKYGm
	 9rBebnUAfAqYA854eWWb4zIGWhwOEEkz5onLG2aJv82kdhW6Lebi0chP7mqOyw9hhM
	 /W+T9/0l/Ybbqhfq/f4ltH0nPNHV9HMnWVpuPk7o=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	iommu@lists.linux.dev,
	mhklinux@outlook.com,
	eahariha@linux.microsoft.com
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
	skinsburskii@linux.microsoft.com,
	mukeshrathor@microsoft.com
Subject: [PATCH v2 0/3] Introduce CONFIG_MSHV_ROOT for root partition code
Date: Thu, 20 Feb 2025 10:33:13 -0800
Message-Id: <1740076396-15086-1-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_103338_816281_8BD7DDF1 
X-CRM114-Status: GOOD (  13.81  )
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

Store the partition type (guest or root) in an enum hv_current_partition_type,
which can be extended beyond just guest and root partition.

While at it, introduce hv_result_to_errno() to convert Hyper-V status codes
to regular linux errors. This is useful because the caller of a hypercall
helper function (such as those in hv_proc.c) usually can't and doesn't
interpret the Hyper-V status, so it is better to convert it to an error code
and reduce the possibility of misinterpreting it. This also alows the stubbed
versions of the hv_proc.c functions to just return a linux error code.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
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
 drivers/hv/hv_proc.c               |  6 +--
 drivers/hv/vmbus_drv.c             |  2 +-
 drivers/iommu/hyperv-iommu.c       |  4 +-
 include/asm-generic/mshyperv.h     | 40 ++++++++++++++---
 12 files changed, 137 insertions(+), 53 deletions(-)

-- 
2.34.1


