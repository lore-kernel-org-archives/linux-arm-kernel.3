Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6891C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84YZdg7FAriOi+vJngJDZAW/orO0R0EGlaMcXWvv0DE=; b=JrqCInptneOJkzwlT9/5kQVuOo
	lG/U38rvMyp6GK9mTpizg+0mFOJAkKERhRWKuduASzWIwwlK9h3LP/qs+sUs8KOjQNf408+8V8nmN
	JUoDTz6w8fdn1vX6N3XTK+4v7W8bCmku7i+oqXuzkpspffwAWDXxiIJi9ZxbFY4k1kqVmcVuG28jT
	G52SlEhNjxHpWkVp97ZqrIyQVPrqgEim3evCxS8d6J0iQil2SqeL9Ia65TC/EC7+fOQR7nhBAoiVk
	jLrhW9cI7VXnfJ9feoKnpzmQnY1TCq7FoO3X39h0p8JMS+s+BqtWxEFN3g5gMWD6qyO37gxxNKLg7
	rXKqLopg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xb-0000000050O-0sB4;
	Thu, 03 Sep 2026 16:06:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xY-000000004z5-37Xy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:06:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E51B71D34;
	Thu,  3 Sep 2026 09:06:35 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB4D93F673;
	Thu,  3 Sep 2026 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451599; bh=+u9LjHH89m68GUjK/C5Dy4Vs+z0e4soWaEubuApexkE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nm/0Ky3qNosRJu7gBZpoyWEukBwzxHMiGJHn5pJP2eqAyjVFxu5ILMDviTw3FoolE
	 lCoU1ezDcQKqtQADujKiaTeS/mJ5uUVMae4g9HFmqa+X2riRaBs8G+WV5K0LU3RjmN
	 PTjcnTrhHELxjochl68G8RwrGFVkGKLGWCk+RM5A=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: [RFC PATCH v7 02/28] arm64/sysreg: Define MDCR_EL2.E2PB values
Date: Thu,  3 Sep 2026 17:05:57 +0100
Message-ID: <20260903160623.315525-3-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090640_820340_03CDAD87 
X-CRM114-Status: UNSURE (   7.82  )
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

KVM will make use of the different values for MDCR_EL2.E2PB, document them.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/tools/sysreg | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index a11a968eb707..4485736a4f49 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4045,7 +4045,12 @@ Field	17	HPMD
 Res0	16
 Field	15	EnSPM
 Field	14	TPMS
-Field	13:12	E2PB
+UnsignedEnum	13:12 E2PB
+	0b00	EL2
+	0b01	RESERVED
+	0b10	EL1_TRAP
+	0b11	EL1
+EndEnum
 Field	11	TDRA
 Field	10	TDOSA
 Field	9	TDA
-- 
2.43.0


