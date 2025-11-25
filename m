Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FFCCFD37A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cnl1XQNCb8EMuj5EmURjRK9DgGZBIF+7CiYEmDtxiks=; b=DpXjg+jjilFgU+DgjP08g5RG6H
	c/8yu+QlkJQnf61r5GJ2ZnveNOGJU92wZ+x1ok5oCrSuQAH3HmNvGdO1L3+KJoQW9ccxK96sZmrci
	ujJbR2B/nuf5jOWNemnQFPiFg7jNgFyR3PrOopqz2heDdV7k7t6zk3K9vCyK/OZjZx1vHh3Bqq/xH
	7m7w3l3xJj+/+zC4skZNVH3d93c51DESqIgsmKxTwdG+m5iZUq0TCQeeNkGYJYUuqobLBKQpmHWul
	ZhhXDpFfgXtoiwq7JNTlsqp5+PMeb7d59imYeIPp6nCZzCVUzqPZpvWR6iWK+Gd/fNmf/Qj2QuPnZ
	Am9wkXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNq24-0000000D6Ui-1EfA;
	Tue, 25 Nov 2025 10:12:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNq21-0000000D6U0-0c08
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 10:12:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1A641477;
	Tue, 25 Nov 2025 02:12:10 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B35C13F86F;
	Tue, 25 Nov 2025 02:12:16 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	shuah@kernel.org
Cc: Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v2 0/2] set_id_regs cleanup
Date: Tue, 25 Nov 2025 10:12:05 +0000
Message-ID: <20251125101207.1492580-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_021221_245060_6482346A 
X-CRM114-Status: UNSURE (   9.10  )
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

For this v2 I've dropped the ksft_test accounting fix. Mark Brown has
more extensive changes [1] and looks to be a user of the set_id_regs
test rather than someone just doing some cleanup. The other change in
this series is to remove ARM64_FEATURE_FIELD_BITS from the tools
sysreg.h header rather than the kernel version. I'll send a separate
patch to remove the kernel version.

Tidies up a few small things in set_id_regs. The removal of
ARM64_FEATURE_FIELD_BITS touches other code only so much as it removes
the define but set_id_regs.c is the only place its used.

Based on v6.18-rc4

Link to v1: https://lore.kernel.org/kvmarm/20251114-kvm-arm64-set-id-regs-aarch64-v2-0-672f214f41bf@kernel.org/

[1] https://lore.kernel.org/kvmarm/20251114-kvm-arm64-set-id-regs-aarch64-v2-0-672f214f41bf@kernel.org/

Ben Horgan (2):
  KVM: arm64: selftests: Remove ARM64_FEATURE_FIELD_BITS and its last
    user
  KVM: arm64: selftests: Consider all 7 possible levels of cache

 tools/arch/arm64/include/asm/sysreg.h           |  2 --
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 10 +++++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.43.0


