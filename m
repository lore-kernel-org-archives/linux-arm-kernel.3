Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA22C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=deCSOMZNDvfkAwClOVsdPolLd7YS+n6X4S+BzWgwI6M=; b=N6zKwnHpoOIUp2FGHxICYCAK9z
	4rCixAzwYOcpccLKkDxrLYk6LaZFC1Lr/u4HpK69fPyuv/N1D5H3W+vY0x2Uo6V50OhlgVQGrLL95
	IK87cNSuPAYeTAhaz0siYCWoT//mS4krNnDI/2e7zEjyJU7CTqj507erHqGPjtHfrQMy0hcSmxTwr
	3RGj0q6+KXJCZSroYsGouQFtaySj+D666fzmZQ7GxZn+8iFTjbFjurH1kixLmY0iWfWDkc6Vdc96p
	mSUepdfA5KUq9IWHS0EmDSy4wpy6soJUG0OMyVbGvWvaHSj8UsJVumU7927cNVAcJ00UZGBnRNnpc
	fOU9/jiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3c6y-00000007Hk4-1xsH;
	Mon, 07 Sep 2026 16:22:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3c6w-00000007HjK-18Yb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:22:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 052A81476;
	Mon,  7 Sep 2026 09:22:17 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C1D8A3F528;
	Mon,  7 Sep 2026 09:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788798140; bh=3GAp9LEi+XPdnIRjwFTLkTSW+RwPiGUICRV2vRHrRfE=;
	h=From:To:Cc:Subject:Date:From;
	b=AmhXzFQHN8/N0R9P39kcMiEmRyxaaj/BOobegu+Ut6gA8IAdyt8av0drmBwLaNpE1
	 cZrCz8yTVUTstCj/wyUysRHvh0ym3eecTweI2FLomH/rxtDbIe3MgZxrCEYxfGGklx
	 +fH889sIFgW6qFKGMNDq4eJ648Qs0gCoJ69oW0EI=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	pavan.kondeti@oss.qualcomm.com,
	tabba@google.com,
	aneesh.kumar@kernel.org,
	mark.rutland@arm.com,
	sdonthineni@nvidia.com,
	steven.price@arm.com,
	gshan@redhat.com,
	yuzenghui@huawei.com,
	kvmarm@lists.linux.dev,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v17 0/1] arm64: mm: Handle Granule Protection Faults (GPFs)
Date: Mon,  7 Sep 2026 17:22:03 +0100
Message-ID: <20260907162204.1479401-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_092222_349431_FF885F9A 
X-CRM114-Status: UNSURE (   8.37  )
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

This single patch teaches the arm64 fault handling code about Granule
Protection Faults, introduced by FEAT_RME. This was posted with KVM CCA
support series, but split from that, to allow for other users of GPF.

The immediate user is KVM CCA, where the host may fault if it accesses
granules that have been delegated for use by a Realm. However, the fault
handling itself is architectural and not KVM-specific. It should also be useful
for other FEAT_RME users where an access to secure memory or root memory can
result in a GPF.

GPFs during a page table walk are treated as kernel bugs, while non-page-walk
faults can be reported to userspace with SIGBUS. The patch also allows existing
exception-table fixups to handle known in-kernel accesses such as
load_unaligned_zeropad() while private memory remains mapped in the linear map.

The KVM CCA v17 integration branch is available here:

[0] https://gitlab.arm.com/linux-arm/linux-cca.git cca/cca-host/kvm-integration/v17


Steven Price (1):
  arm64: mm: Handle Granule Protection Faults (GPFs)

 arch/arm64/mm/fault.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

-- 
2.43.0

