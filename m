Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38422D59F53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 16:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gxN4chngxIOdDonPMYeE4ui/gLP/3h89s3+mj4mpyJI=; b=CoWvbnYNzuVkMNGZH8ScapE6Ks
	Al0suuu1Vah5FOhwlOatudHsOBiZ2QZP86IyLN850yVLk7MSUDsddA645CogROWZDfO3xkDgKlE/i
	LIaUd3mSKl0gNjeh4pnWAxm23iRxmVUxn5BWTpU/C5euG//ZSU5SAviDjXRF4U+5/syZjXc2TYRsa
	NKaOoXMlcmOwOMnJnYKbj8MNIUCCSWfuyJSZPZpNRVJ3WOH+U9moti+0g7tSMq8/IHVBURoFTKvmo
	bw9vsaq0pZaeAIwjgJvji4c3PWWF+urixUcgNbYZQe5NeHIkf9nIvFAvyzpEn70hxvbUl3gPahtvB
	8g9bV+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ilq-000000040bv-3hTK;
	Wed, 06 Nov 2024 16:20:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ik6-000000040IP-1IET
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:18:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 091255C51B8;
	Wed,  6 Nov 2024 16:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683E1C4CECC;
	Wed,  6 Nov 2024 16:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730909929;
	bh=k9tWT/FSzffihY/db8sVNhdySykmh+eiRYELPcAcGv0=;
	h=From:To:Cc:Subject:Date:From;
	b=Pps9zq+WRch8jkV0Z7gLVcexSVBgAgisGb5VAGMjBVPR9d4XIzTYwn0XXZThthFJD
	 ZTPmjf++A7zkiS74tE0BmAhNSZdTKi9TtfUg3G1s0n1s1HgMS8hbupXxMdWrn3D77v
	 wE1wlicpwm5nOsVlnGD/incgvgWUQ5m8bmM+bmJokxARm4ByogbAPX6GerkfoPkvin
	 VfuQcxUCywxD7H/ZquHOFrNuiECSFFfitNiQKepow96+FgAkV2pKGtIboWGx2Y0tgH
	 umYstO4Dgv39fBaQh1t63/8VyPM4xjh/UDSTaa1vvHlZhBa+Oggj48JtlQLSCYQO2/
	 PlsnKQQFRbJbw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
Cc: linux-kbuild@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: fix .data.rel.ro size assertion when CONFIG_LTO_CLANG
Date: Thu,  7 Nov 2024 01:18:42 +0900
Message-ID: <20241106161843.189927-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_081850_411864_86B22047 
X-CRM114-Status: GOOD (  10.35  )
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

Commit be2881824ae9 ("arm64/build: Assert for unwanted sections")
introduced an assertion to ensure that the .data.rel.ro section does
not exist.

However, this check does not work when CONFIG_LTO_CLANG is enabled,
because .data.rel.ro matches the .data.[0-9a-zA-Z_]* pattern in the
DATA_MAIN macro.

Move the ASSERT() above the RW_DATA() line.

Fixes: be2881824ae9 ("arm64/build: Assert for unwanted sections")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arm64/kernel/vmlinux.lds.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 58d89d997d05..f84c71f04d9e 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -287,6 +287,9 @@ SECTIONS
 	__initdata_end = .;
 	__init_end = .;
 
+	.data.rel.ro : { *(.data.rel.ro) }
+	ASSERT(SIZEOF(.data.rel.ro) == 0, "Unexpected RELRO detected!")
+
 	_data = .;
 	_sdata = .;
 	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_ALIGN)
@@ -343,9 +346,6 @@ SECTIONS
 		*(.plt) *(.plt.*) *(.iplt) *(.igot .igot.plt)
 	}
 	ASSERT(SIZEOF(.plt) == 0, "Unexpected run-time procedure linkages detected!")
-
-	.data.rel.ro : { *(.data.rel.ro) }
-	ASSERT(SIZEOF(.data.rel.ro) == 0, "Unexpected RELRO detected!")
 }
 
 #include "image-vars.h"
-- 
2.43.0


