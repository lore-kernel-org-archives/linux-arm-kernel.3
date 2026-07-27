Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DD6C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bwzh8l9wvGRzuZwCIOPoH3Qu5rGTVYxguQpIrFLJvk=; b=34vfHaNd0JwRUxrX/wjhtF85PJ
	fBJ81BuiLHhON4PWxswOwp4vpbvXr2w+th3N7oY7djDm+sPKX5f3yr+LnECDI0DNaTJEDpPPdQQ/v
	7U2HmMwRAp+s5G8sHiSnoP1dZneE6VGLuDaeioMCXJif5FzH49XMhHH6WgT3a+BybWdT8wdMueIs4
	EmmPBeH4NFGoDgpCkGv0//v/Rb46+TwdOwozb0JHg/iR7rnZLwGOdY6W4vTOnPLmwZUrpFhQDEX2A
	npD7e4Nhi39zCfKFiiAtd9QiDATMCuDj2RUji73jHARhTGwDa8He8GSdAThYiDwu/kqQxEmm3vzKa
	6G4qbPVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKr-00000003ORG-1ywb;
	Mon, 27 Jul 2026 16:37:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJG-00000003NLS-3cbM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:36:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE6F11758;
	Mon, 27 Jul 2026 09:36:05 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 148FD3F86F;
	Mon, 27 Jul 2026 09:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170170; bh=/ChyatiOMgSc+kdMzimUyel/D0HpPqZXLPZvlHgsiFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C8syr4lWAkQ2khS26jg21/gjNRTLeiz3teX0JVBA5PlFjgpR1uvnFnQDLmxc807/M
	 2Ns/EGwZsUigmrtrdSwj4WueK6kuiuHtqhuzxoWuvfHW7LeZJ+FsDgxD4PEe3nGC6I
	 NufNYDW7jiVfxxVUVsIcd1mJ4UGh3VQoZev65pNk=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 40/45] arm64: nmi: Add Kconfig for NMI
Date: Mon, 27 Jul 2026 17:34:48 +0100
Message-Id: <20260727163453.7969-41-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093611_165921_DF3A1ADF 
X-CRM114-Status: GOOD (  10.00  )
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
index e36dc4831200..968a9d97549a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2195,6 +2195,24 @@ endmenu # "ARMv8.7 architectural features"
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


