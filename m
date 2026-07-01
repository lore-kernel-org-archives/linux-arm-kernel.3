Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9EAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9l0tMZx1oyWFbUbJfx+ICGrvgd3GF0PzrIO0TTe9URo=; b=BpbQy1nm9XemL8JCFvJMefAEPx
	b/4wggiqzRwZLps1sIicioEAHEJ9VNKLtYh0tKnG1J0ZdnNNPRbqoSDY2aTLg1Lp+gvonf7A/Et5z
	/sZgtm19jt196rZCrJRCX0+73HzSWiOuntE2jkngD4lZc6zQicpNa43dgJ+0gPad2DbcLKJN7YSnD
	WMdO9H4lmeOWchLa2N7/BuU6n/yPZL87Od0Lje5w+KS9Q62wK6pGWmdZRiUYTn2xtJ2j5D47gmjZb
	owAulEOqFZ/3zbawIbBq88n9IP5vEW9zrGBKZ6fvExcrtlM39dAt9MzQYCmECC1RkESNdP4oTXHJp
	xYf7OIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werSl-00000001DKq-3GL6;
	Wed, 01 Jul 2026 09:42:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werSk-00000001DJa-3SAs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 09:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9l0tMZx1oyWFbUbJfx+ICGrvgd3GF0PzrIO0TTe9URo=; b=QvkJRea+62GGR164507xaBpybz
	KUnUkF1BE2xoKEhGq3ia1JDto7JEjrC34YMUrts7pibdgfVKtY9lFf/5Y/kI7t43Spao1KFkM79j8
	F0WVPBrsfx2b5Pf+kfCRn3FIKbVER7KvZvL6UkpYoUrSKkCoPq3hkuU5Ga/ZtzY0uDOH+cvzJg6k1
	IqiKMQOuqxoVIJYiTIc6xQXZIT+7HVXQWs2434PzuDvIlh/TaJKnw+4rKJNHpTgIlcA3UmtlH/kDx
	3V5HlPFs6PcD72Lov33GnYoBOQvVrLlslsXuSzCWacjMJopOmcYgEgcpUXWLUqkWqbQU6/yrq/0d3
	yxQs1vRw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1werSh-00000002Zrg-3uoA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 09:42:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5850022FC;
	Wed,  1 Jul 2026 02:42:26 -0700 (PDT)
Received: from a079125.blr.arm.com (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 55C3F3F905;
	Wed,  1 Jul 2026 02:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782898950; bh=kKJ08oum40okyDRmCcsnFq7zWexfO5vGKH5pIFu69kg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J+yt/6gv5KeAGOBP9JIL1j0DUoHVBb2+p7uhd/n8EOSq9MfYsIlyf+sR1+Qaz3WbQ
	 mPWhDLh3Gz5DiARgNM8N2u1BPkaWCxfk+2C5i0xmlR2FV3mdfsuCSoNNpTburlgv8u
	 E8chq98QN+ofcpngYS3mx+N22pDhe+aItp1ExfRU=
From: Linu Cherian <linu.cherian@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linu Cherian <linu.cherian@arm.com>
Subject: [PATCH 5/5] arm64: cpufeature: Extend bbml3 support list
Date: Wed,  1 Jul 2026 15:11:31 +0530
Message-ID: <20260701094131.677636-6-linu.cherian@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701094131.677636-1-linu.cherian@arm.com>
References: <20260701094131.677636-1-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_104232_179858_F7C88E97 
X-CRM114-Status: UNSURE (   7.45  )
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

Add below cpus to the midr list, which supports
BBML3 but don't advertise through MMFR2 ID.

Cortex A520(AE)
Cortex A715
Cortex A720(AE)
Cortex A725
Neoverse N3
C1-Nano
C1-Pro
C1-Ultra
C1-Premium

Signed-off-by: Linu Cherian <linu.cherian@arm.com>
---
 arch/arm64/kernel/cpufeature.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index d754b1b7da77..9b806c1c60aa 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2142,6 +2142,15 @@ bool cpu_supports_bbml3(void)
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
+		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
+		MIDR_ALL_VERSIONS(MIDR_C1_NANO),
+		MIDR_ALL_VERSIONS(MIDR_C1_PRO),
+		MIDR_REV_RANGE(MIDR_C1_ULTRA, 1, 1, 0xf),
+		MIDR_REV_RANGE(MIDR_C1_PREMIUM, 1, 1, 0xf),
 		{}
 	};
 
-- 
2.43.0


