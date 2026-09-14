Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB09C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Vv3grXKrlN9uootfABbT4j9YEBjwpdZilB0+LpoRf8=; b=EcnZEyB6JZbhensxH/7jHaSd46
	VpihfjMfZenj8peeEcmDOHB9AmjcLrwjb4SQEZXq1n93VgpAaAdyfmXsHiwd8l7zlG8m6Ce72VwbL
	Q8B7XVFyqQLeEFWr6I4OC4cTfqpCU1OAqKG7BTtKaGRwHS8/sDc7UbRUWHCMaN46VbU2DulK/VDB0
	m+IUB9WSZcLKG7/v3mAIcSLn/3VPsx68dhd9O7bUNXHi2MtzbNmQXkDXvdpYxs4hnqQHKR18XXXZZ
	rHICbTXJ782b4KiSwg0FiGt5uovR0oulis07NVV4oE6wQlbjjjPIZBoelOr9bfgrxBUm21n02TPi3
	bV1OhMTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63qp-000000037jI-1XFn;
	Mon, 14 Sep 2026 10:23:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pL-000000035zj-1scb
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 10:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2Vv3grXKrlN9uootfABbT4j9YEBjwpdZilB0+LpoRf8=; b=eg6NpfubBX7E6A6uBzoBe6XIFP
	6Q2iZLpvT1POpfg/F08fly0fZTnv6JmAmLlS2YFudlWqt5rsTjCmjNLKjAMGMDLHjRSLglyGPeLn8
	VMEEfNCWu9xR4kGx4fELv4zvXpvCYvYR6b97dJteILgFbwMYYkCjqL4Kdz+WpmUwgOgBqaGjaLhl/
	TW/vbIED5RmynFEfFKsmJ1fzjAWXDJFBgjnnUUHhuo3mb7CfbINeTlglbNPjWM1outFZtUE6Ck3/+
	eN6CYsmbxNHDRM3JiFBUJZdkrCkz9kgWGWm0jCZ8dlimAz/G17vCH6mhp/epgLe02FVdiNdNMIoY5
	/mByKOPw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x63pI-00000005U9U-0HHv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:22:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 191401576;
	Mon, 14 Sep 2026 03:22:10 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9955A3F7B4;
	Mon, 14 Sep 2026 03:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381333; bh=Ervu/laOEBpBJtR3IJPQRiUSV3XYxmCXdh7r7gexYwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eLNzFrQmB/NUrsvrMzi3mcp7cfYapWmS4Dor7TZbI3T3SqOhlpdSTIWGwZEM7+IE6
	 QrUu7YMPf9B1XiF9Xu/h6bL8hzZQ9OvO4/fDWkQAiuBWU+Dhxymcj0gejGnJdZpMrq
	 etjzcJSek9Qd//ydAaOXKSHq6TjLlW8JtR+8jqU8=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 32/38] arm64: nmi: Add Kconfig for NMI
Date: Mon, 14 Sep 2026 11:20:56 +0100
Message-Id: <20260914102102.68597-33-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_112216_412611_FDEE11D9 
X-CRM114-Status: UNSURE (   9.68  )
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

From: Mark Brown <broonie@kernel.org>

Since NMI handling is in some fairly hot paths we provide a Kconfig
option which allows support to be compiled out when not needed.

Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/Kconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 2738637ccb92..df5ff59715d1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2251,6 +2251,24 @@ endmenu # "ARMv8.7 architectural features"
 config AS_HAS_MOPS
 	def_bool $(as-instr,.arch_extension mops)
 
+menu "ARMv8.8 architectural features"
+
+config ARM64_NMI
+	bool "Enable support for Non-maskable Interrupts (NMI)"
+	default y
+	help
+	  Non-maskable interrupts are an architecture and GIC feature
+	  which allow the system to configure some interrupts to be
+	  configured to have superpriority, allowing them to be handled
+	  before other interrupts and masked for shorter periods of time.
+
+	  The feature is detected at runtime, and will remain disabled
+	  if the cpu does not implement the feature. It will also be
+	  disabled if pseudo NMIs are enabled at runtime.
+
+endmenu # "ARMv8.8 architectural features"
+
+
 menu "ARMv8.9 architectural features"
 
 config ARM64_POE
-- 
2.34.1


