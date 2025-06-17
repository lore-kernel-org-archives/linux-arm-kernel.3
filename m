Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA66C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 18:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NF+eg2SpFF6VG3Tl8uqz1bhtjWMlFVoG9IUTn7DvGYE=; b=DfY6qDb90GwWal7KRJqiTfMHC1
	GR8287nhE6YC8g75yvg230XBasg9LYvY9Dw9FPZSxsK6rsiS03oasOPSgaAxVcC9iRZ47m5nnQo2o
	b3I8ENK8jTXCFQ+gkhwQWMMhPcw4IZ7EbGUE8oQo917VuX4gOKu6riOaymlsOJd+8vliXL0C62EiP
	CPBlwDF+aMTMwAzwIFCqqsLNkg30NKQ82g3zWOhhIekHaVQ+hkstEqxg9OnPgt3SopQxMfp6TLMTN
	hTu77Ou2C4xp4ceuBBmmUXjs1UCj3G2nlh0PiJGMPcPz1Ch8SH+GEshPQKqzUHFYLKDaW8QZetjMc
	5deqOTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRbLk-00000008BBR-2zzy;
	Tue, 17 Jun 2025 18:48:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRbAt-000000089eR-3zgz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 18:36:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 294DA1BB0;
	Tue, 17 Jun 2025 11:36:24 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 37E5C3F58B;
	Tue, 17 Jun 2025 11:36:43 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	ardb@kernel.org,
	frederic@kernel.org,
	james.morse@arm.com,
	joey.gouly@arm.com,
	scott@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v3 3/7] arm64/Kconfig: add LSUI Kconfig
Date: Tue, 17 Jun 2025 19:36:31 +0100
Message-Id: <20250617183635.1266015-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617183635.1266015-1-yeoreum.yun@arm.com>
References: <20250617183635.1266015-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_113648_030913_12FF51EC 
X-CRM114-Status: UNSURE (   8.00  )
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

Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
previleged level to access to access user memory without clearing
PSTATE.PAN bit.
It's enough to add CONFIG_AS_HAS_LSUI only because the code for LUSI uses
indiviual `.arch_extension` entries.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 55fc331af337..769fbb507996 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2237,6 +2237,15 @@ config ARM64_GCS
 
 endmenu # "v9.4 architectural features"
 
+config AS_HAS_LSUI
+	def_bool $(as-instr,.arch_extension lsui)
+	help
+	 Unprivileged Load Store is an extension to introduce unprivileged
+	 variants of load and store instructions so that clearing PSTATE.PAN
+	 is never required in privileged mode.
+	 This feature is available with clang version 20 and later and not yet
+	 supported by gcc.
+
 config ARM64_SVE
 	bool "ARM Scalable Vector Extension support"
 	default y
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


