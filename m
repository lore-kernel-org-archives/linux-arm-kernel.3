Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2D7CD98FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F6QgwDgccq7D+lG9A5PyN5p2BY2kVFyXcVZ3jBg/ylI=; b=3OCuRGBcImfGygsHVZnMJUt3PC
	8J9m7qlhr7xqPY1HK4Y4QcTiqTYyc0owF2WkSUCqTliLivdUiHNaaBmfE4Wj1tQlXFSFMN/zIL8fl
	CmnGfYkktHgoaFsoOsHI99h0YrXWATUaQUUtslC5z1XaPVVs7diVBOxezcZ7wPDsKGhBiOWh+lJBP
	+tyztYRCQNx/O/VwYA2AJf1t8o5v3PeISHmuUPRnq01ZKApGusMnUPCWxYFfCInKILYLU/VFaTN19
	WkR73agTQOnlLxFZNhW6WmGOXvhRoWR+JK7UZtKEGdIw+2Lk0/3jySjaJoKacwymdi2kz0NoE4n3i
	KSkbhjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgIR-0000000BDj6-0rXn;
	Thu, 13 Nov 2025 23:00:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgIO-0000000BDij-24Dc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C477A43A11;
	Thu, 13 Nov 2025 23:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78662C4CEF8;
	Thu, 13 Nov 2025 23:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763074803;
	bh=vwc/0+YWdp+aaq0bFVlBWiGoaUEzA36I8CJQqteolBw=;
	h=From:To:Cc:Subject:Date:From;
	b=seB0Y1qTbhsSdSQg/7JJLg8NkE/Jr9qfvcNL1StiwQTncDsg5D7jtsapnfbkv9S/r
	 Mta/CBiK4A8kN1z7yaDMgSX0EPwscXDqmTZQX6wn+9FqsMp3t/bJF6vPq6m7ETxoPK
	 syQO23Kl9aRHHIVg9PTWbqObXHK5n6RAr0Q0tXEDdMnbt2yofc2WqTzPpfh/3hF48Q
	 7ZLOaot+ghcA5zuaj4UNHjUwYjs7bB3nVA8qcrJLkTcdoUhPpWv4pqpuLV2BjPkya8
	 +YY3f4PtR6hhOqEttR829apXZ3Kzxq5VViV3EASaS6FZWhhJhYwSa6W8lD4gsiQIhP
	 sqZglZHTgmatQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH] kbuild: Support directory targets for building DTBs
Date: Thu, 13 Nov 2025 16:59:51 -0600
Message-ID: <20251113225952.867138-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_150004_588314_1B3B5783 
X-CRM114-Status: GOOD (  13.19  )
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

It is useful to be able to build all the DTBs for a vendor. One can list
all the .dts files in a directory and convert those to %.dtb targets,
but that doesn't work for base+overlay DTB targets.

Adding the dts subdirectory is straight-forward, but building the
DTBs should only happen for certain targets (dtbs, dtbs_check, %.dtb,
%.dtbo, and the directory target(s)).

The 'scripts_dtc' rule doesn't really depend on 'dt_binding_schemas',
but the directory target only depends on 'scripts' which depends on
'scripts_dtc'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
RFC because only arm64 converted ATM.

I don't really like looking at MAKECMDGOALS, but that's the only way I
could come up with that works. Maybe someone knows a better way.
---
 Makefile              | 2 +-
 arch/arm64/Kbuild     | 2 ++
 scripts/Makefile.dtbs | 3 +++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 17cfa11ca716..85018d461575 100644
--- a/Makefile
+++ b/Makefile
@@ -1494,7 +1494,7 @@ export CHECK_DTBS=y
 endif
 
 ifneq ($(CHECK_DTBS),)
-dtbs_prepare: dt_binding_schemas
+scripts_dtc: dt_binding_schemas
 endif
 
 dtbs_check: dtbs
diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
index 5bfbf7d79c99..9e9820af48c9 100644
--- a/arch/arm64/Kbuild
+++ b/arch/arm64/Kbuild
@@ -5,5 +5,7 @@ obj-$(CONFIG_XEN)	+= xen/
 obj-$(subst m,y,$(CONFIG_HYPERV))	+= hyperv/
 obj-$(CONFIG_CRYPTO)	+= crypto/
 
+subdir-y += boot/dts
+
 # for cleaning
 subdir- += boot
diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index 2d321b813600..4d0d164df275 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -14,7 +14,10 @@ dtb-y           := $(addprefix $(obj)/, $(dtb-y))
 multi-dtb-y     := $(addprefix $(obj)/, $(multi-dtb-y))
 real-dtb-y      := $(addprefix $(obj)/, $(real-dtb-y))
 
+ifneq ($(findstring /dts/,$(MAKECMDGOALS))$(findstring dtb,$(MAKECMDGOALS)),)
 always-y        += $(dtb-y)
+endif
+
 targets         += $(real-dtb-y)
 
 # dtbs-list
-- 
2.51.0


