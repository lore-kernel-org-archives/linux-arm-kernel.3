Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1DBC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqTbYJY9+NAlvBdXCKhzoIXYXCDLF5vLpIgNt01yPi8=; b=24SjOrlmridDDf03ovTi43JBuH
	96mE3oI6gdrbC8RaKeiLJWUutMsU2JEP+sJVDq/Yd6YUSw7zKWGvMpL4IyA8g9SQe5Q4Vrt0GZbJH
	5Bw6ycprjLqabcJZYR+t8I8rZWp6zql3v2AZrfPmYrJghJMRrWtKHZglBfROh1ciEXf48tp9lyZ0o
	TYMsCcISM/48b2YdCTRZBDzqZAfSycyfVfZkpTN8A6YP/lvq6VLUZewsJVw+Ma8a+CzCnQ3r2ivxa
	lP0B8V5cLpY3h7bokltAPhAC3z334JucdAwLWFEgtxCWt+2dzxos5JxAlESssVFyc+1Llorc979vT
	CpDyDrmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuFD-0000000AMwJ-3XSR;
	Mon, 04 Aug 2025 12:24:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiu8E-0000000ALlT-29Oz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 12:17:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED2D51E32;
	Mon,  4 Aug 2025 05:17:25 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E33A3F738;
	Mon,  4 Aug 2025 05:17:30 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	anshuman.khandual@arm.com,
	robh@kernel.org,
	james.morse@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	ry111@xry111.site,
	Dave.Martin@arm.com,
	ahmed.genidi@arm.com,
	kevin.brodsky@arm.com,
	scott@os.amperecomputing.com,
	mbenes@suse.cz,
	james.clark@linaro.org,
	frederic@kernel.org,
	rafael@kernel.org,
	pavel@kernel.org,
	ryan.roberts@arm.com,
	suzuki.poulose@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 01/11] arm64/sysreg: add system registers SCTLR2_EL2
Date: Mon,  4 Aug 2025 13:17:14 +0100
Message-Id: <20250804121724.3681531-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804121724.3681531-1-yeoreum.yun@arm.com>
References: <20250804121724.3681531-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_051734_595142_6F9E04BD 
X-CRM114-Status: UNSURE (   6.19  )
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

Add definitions of SCTLR2_EL2.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/tools/sysreg | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8a8cf6874298..ae655672a944 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2469,6 +2469,23 @@ Sysreg	SCTLR2ALIAS_EL1 3	0	1	4	7
 Mapping	SCTLR2_EL1
 EndSysreg

+Sysreg SCTLR2_EL2       3	4	1	0	3
+Res0    63:13
+Field   12      CPTM0
+Field   11      CPTM
+Field   10      CPTA0
+Field   9       CPTA
+Field   8       EnPACM0
+Field   7       EnPACM
+Field   6       EnIDCP128
+Field   5       EASE
+Field   4       EnANERR
+Field   3       EnADERR
+Field   2       NMEA
+Field   1       EMEC
+Res0    0
+EndSysreg
+
 Sysreg	SCTLR2MASK_EL1	3	0	1	4	3
 Res0	63:13
 Field	12	CPTM0
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


