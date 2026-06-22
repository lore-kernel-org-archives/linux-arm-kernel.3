Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4053CCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 19:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qOVFrG/Te+BEiiQDl3ih9whA6aExlG2UyJj9/8nk5R0=; b=F6kw/Hnc9vQfertm//zteWQd1J
	aX/hEZgtQ04covFVu3YN8qNLeEBKJKPBhIvZzFw5tQJinDBrzP4oIKMSpwr7gxVy2CGq6AvOEvshU
	hkZjeOQT3tD8E9zOye6a/+V6wFVRUeMLi5ew5zM2r10MdACLpMiyrCGXBKt5PiD4EHD/E6Vcqogpi
	A75iPfIHDfDUi/hmEnAeK/sP1Yn/9ECTR8zM8yPEjkJr+rcq5hJpYNTejN8K7BtQB7fdLtCyINvLJ
	n+mXmkWkeI/e4kQe+xvX0h21Xi3x31zAlWLfz+26iEwnt85b2dndqQEIOsKF/Kxg/5Qvij2FdXCmL
	bbMhvbyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjzD-00000005Kjb-3AVr;
	Mon, 22 Jun 2026 19:07:11 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjzA-00000005KiW-2djC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 19:07:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782155224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qOVFrG/Te+BEiiQDl3ih9whA6aExlG2UyJj9/8nk5R0=;
	b=RYniqaT6fK6bMzx3PMItfT0iElyVNpTiCHOLmEBQbYeohLMJKI0YyazkwTTuPCMclDKIS6
	mn3AaWuFRZ8Gp/1Bev/aKBUnUpOWql6bM+Efy4g9EMt1MgYl5SxjHPc5yxrAl30RBgS/rh
	dEJvHafxDiqUjncYWhOqNc7X5J7KsTg=
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
Subject: [PATCH 0/2] KVM: arm64: Fix and test MMIO sign-extending loads
Date: Mon, 22 Jun 2026 20:06:59 +0100
Message-Id: <20260622190701.2039766-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_120708_815365_8B9CD5F9 
X-CRM114-Status: UNSURE (   8.73  )
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

Hi folks,

A sign-extending load (LDRSB/LDRSH/LDRSW) from emulated MMIO returns a
zero-extended value rather than the sign-extended one the architecture
requires; vcpu_data_host_to_guest() strips the sign bits when it masks
the data to the access width.

If my git archeology is right, the masking dates to 2014 (b30070862edbd,
big-endian support) and has been wrong ever since, but sign-extending
loads from device memory are rare enough that nobody hit it. Patch 1
fixes it; patch 2 adds a selftest so it doesn't regress.

Cheers,
/fuad

Fuad Tabba (2):
  KVM: arm64: Fix sign-extension of MMIO loads
  KVM: arm64: selftests: Add MMIO sign-extending load test

 arch/arm64/kvm/mmio.c                         |   7 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/mmio_sign_ext.c       | 133 ++++++++++++++++++
 3 files changed, 138 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/mmio_sign_ext.c


base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
-- 
2.39.5


