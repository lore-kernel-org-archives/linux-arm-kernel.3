Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A80CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 14:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EGMmvy6ftzwFlTcHswppZl2sY7USu5gMaULF9M6YB6U=; b=ICfbYyLjBE85Blbug5IJGMcj+j
	7c2vcG6Vwto4F+5UB5zpPpoxD2L/YiiZZq5amFxU1Q5dOlOGEhLsrGJsvbb2Mk6YV46pLDmgslfp2
	iECMGmuoJquu2Cf+x9nuIyRK1UyRZ6gbG8Oe72g4mqCpvwF6/Wl/0j5b1KQ/HXoGobff7+raLpp0n
	Uq2xexVpmGZFi2S2v7Iq1dzTdb3t2QCE1uhf4v/Ma5lyUCWc0PMKbMeXyHu6Nb7wm7Tdxv/ATWPDg
	ErnZSPqfUCUNXrRdHln5XfVYgBGeI8vNa5le9pfSlQ3srIyaBuK61UOPP9QK5bCOh7YSnUxk6RBFB
	miL7hokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wclNN-00000009M2F-2mkJ;
	Thu, 25 Jun 2026 14:48:21 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wclNK-00000009M1B-1DA8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 14:48:20 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782398893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EGMmvy6ftzwFlTcHswppZl2sY7USu5gMaULF9M6YB6U=;
	b=jhMVHxVxPkeFP3VUyjIWb7QSDQ3VqU1gMzHLWFb3Th48bXl+vcZtTvBWYyxhcNdlyVLdou
	tvkrP+MO8FTbk1ygyjZgOO+98W064LMV9LAEL6o853vTlXdQNeoZpRSHJFpn6jGJUkjOMd
	AGT7OyMCawE4DXBtOn7g2vT83VPDCis=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Victor Kamensky <victor.kamensky@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: arm64: Fix and test MMIO sign-extending loads
Date: Thu, 25 Jun 2026 15:48:05 +0100
Message-Id: <20260625144807.2603272-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_074818_539391_D241E606 
X-CRM114-Status: GOOD (  11.77  )
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

Hi folks,

Changes since v1 [1]:
  - Patch 1: rewrote the commit msg in the Arm ARM's terms, with the Mem
    accessor performing the access keyed on the access size and SignExtend
    handling the register width. No code change. (Marc)
  - Patch 2: added a big-endian pass to the test. The big-endian loads run
    at EL0 with SCTLR_EL1.E0E set, so the access is big-endian while the
    stage-1 walk stays little-endian. (Marc)

Oliver's Reviewed-by is on patch 1 only: the code there is unchanged, while
the test in patch 2 gained the big-endian coverage above.

A sign-extending load (LDRSB/LDRSH/LDRSW) from emulated MMIO returns a
zero-extended value rather than the sign-extended one the architecture
requires; vcpu_data_host_to_guest() strips the sign bits when it masks
the data to the access width.

If my git archeology is right, the masking dates to 2014 (b30070862edbd,
big-endian support) and has been wrong ever since, but sign-extending
loads from device memory are rare enough that nobody hit it. Patch 1
fixes it; patch 2 adds a selftest so it doesn't regress.

Based on Linux 7.1 (8cd9520d35a6c).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260622190701.2039766-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: Fix sign-extension of MMIO loads
  KVM: arm64: selftests: Add MMIO sign-extending load test

 arch/arm64/kvm/mmio.c                         |   7 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/mmio_sign_ext.c       | 259 ++++++++++++++++++
 3 files changed, 264 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/mmio_sign_ext.c

-- 
2.39.5


