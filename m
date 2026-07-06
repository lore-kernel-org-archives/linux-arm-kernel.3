Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E643CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 11:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0KqFlUzI+r7fz8PgRhgJxiSLsepZs7soxZuF0t57/Ms=; b=mmhkVrLCzpWbzoLwywDrm0SsgP
	UfUKvUIbzsNj2Bvmf+JiK76FOOQsV3B381h3yoryzQAh1/zX43hkyVPpwlH0QVwXUF63KlAyyMVxX
	dWwwWwFNgseP4d5WhWgg26y7GD8c3pS5nEnrH3SUWdSaGZ/KRyM2yhJ7AvBRe8osiNSXSJNHd1Za5
	CDxfHYiDP8ElLqK80yCg3V0WdoMpWnVgUcRvshwqmHTBVRPrw5DDu64iOm81opO0OFqcrNAYcG1+B
	kVvh0sYnJimlBjGQvBx9zwFaRoOQ0WmKYWBFKwl4xMVruhWe/b7m5wffkMaZYjJJG8q1iZVaBpZGW
	bRK39Mlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghvN-0000000CQE9-473H;
	Mon, 06 Jul 2026 11:55:45 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghvJ-0000000CQC9-055m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 11:55:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783338937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0KqFlUzI+r7fz8PgRhgJxiSLsepZs7soxZuF0t57/Ms=;
	b=RPo4BBm4aFVqEWQ9X2uWnhT6L/zSSk1BSwIwOxf83fMSxGrVOPE+oS9itsN1gpgRxm7QbX
	AuA4dTuQ1xdyN6LMfnQXrz+A9Czsvc324ya/QDBEI2wiZLd3WpphMQLzoHP3LjLi+waey2
	Im7j7sakINsdCXsiP9ctbbZKB7y8XKA=
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
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] KVM: arm64: Fix and test MMIO sign-extending loads
Date: Mon,  6 Jul 2026 12:55:20 +0100
Message-Id: <20260706115522.954913-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_045543_304673_63AB9B8E 
X-CRM114-Status: GOOD (  10.31  )
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

Changes since v2 [1]:
  - Patch 2: dropped the second make_el0_accessible() call and the
    el0_be_loads_end symbol; the EL0 code page does not need its
    user-access bit set because it is fetched, not loaded. (sashiko)

Oliver's Reviewed-by is on patch 1 only: the code there is unchanged
since v1.

A sign-extending load (LDRSB/LDRSH/LDRSW) from emulated MMIO returns a
zero-extended value rather than the sign-extended one the architecture
requires; vcpu_data_host_to_guest() strips the sign bits when it masks
the data to the access width.

If my git archeology is right, the masking dates to 2014 (b30070862edbd,
big-endian support) and has been wrong ever since, but sign-extending
loads from device memory are rare enough that nobody hit it. Patch 1
fixes it; patch 2 adds a selftest so it doesn't regress.

Both passes run under QEMU, which reports mixed-endian support.

Based on Linux 7.2-rc2 (8cdeaa50eae8d).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260625144807.2603272-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: Fix sign-extension of MMIO loads
  KVM: arm64: selftests: Add MMIO sign-extending load test

 arch/arm64/kvm/mmio.c                         |   7 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/mmio_sign_ext.c       | 255 ++++++++++++++++++
 3 files changed, 260 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/mmio_sign_ext.c

-- 
2.39.5


