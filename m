Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796ABCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 11:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWMyLJjFwfDhUGhjD3NSb7U3rCUdr5sjqOjLOhtLe2M=; b=rTG4eXoXfN24jlzIYBazlVP/B9
	b584D+Ttze4Oc8v2kUevUMMkdrrOXZRgZcbmGx9+txhmRKhefltCapgzVk821ONNWRV3hTffVcAPw
	7rpRrvNBmUm8VhEQ2NoZ0I29wDyP4L+wK4+Kr6XNlm2vepzNI4nCBtA1aUJoOVrBQxuUMP/5CfstR
	ixS0V9m1HBHf5tnVIq3fbB7wVi8I/FjDym2GfUYxawgaYFZ6aaKG7nDmIqyWTsn7r+itIeXzJYx1o
	2UGwndKXRalImtcpC3upLDn4cjSdskgGDxBtf4eOwCTMRCYaFHARFLf5ecttTmBDxB3cuZRzHFjxK
	dRDUD6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsKS-00000002IZE-17bH;
	Fri, 15 Aug 2025 11:10:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqIL-00000001xlx-1Gnb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:00:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C51341E5E;
	Fri, 15 Aug 2025 02:00:08 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EE173F63F;
	Fri, 15 Aug 2025 02:00:12 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH v2 2/8] mm: kpkeys: Introduce unrestricted level
Date: Fri, 15 Aug 2025 09:59:54 +0100
Message-ID: <20250815090000.2182450-3-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250815090000.2182450-1-kevin.brodsky@arm.com>
References: <20250815090000.2182450-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020017_378662_C6C80F72 
X-CRM114-Status: GOOD (  12.39  )
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

Highly privileged components, such as allocators, may require write
access to arbitrary data. To that end, introduce a kpkeys level that
grants write access to all kpkeys.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/kpkeys.h | 4 +++-
 include/linux/kpkeys.h          | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kpkeys.h b/arch/arm64/include/asm/kpkeys.h
index 70e21df84252..ded5d6e988dc 100644
--- a/arch/arm64/include/asm/kpkeys.h
+++ b/arch/arm64/include/asm/kpkeys.h
@@ -28,7 +28,9 @@ static inline u64 por_set_kpkeys_level(u64 por, int level)
 {
 	por = por_elx_set_pkey_perms(por, KPKEYS_PKEY_DEFAULT, POE_RWX);
 	por = por_elx_set_pkey_perms(por, KPKEYS_PKEY_PGTABLES,
-				     level == KPKEYS_LVL_PGTABLES ? POE_RW : POE_R);
+				     level == KPKEYS_LVL_PGTABLES ||
+				     level == KPKEYS_LVL_UNRESTRICTED
+				     ? POE_RW : POE_R);
 
 	return por;
 }
diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
index 5f4b096374ba..48f240bea8e1 100644
--- a/include/linux/kpkeys.h
+++ b/include/linux/kpkeys.h
@@ -10,9 +10,10 @@ struct folio;
 
 #define KPKEYS_LVL_DEFAULT	0
 #define KPKEYS_LVL_PGTABLES	1
+#define KPKEYS_LVL_UNRESTRICTED	2
 
 #define KPKEYS_LVL_MIN		KPKEYS_LVL_DEFAULT
-#define KPKEYS_LVL_MAX		KPKEYS_LVL_PGTABLES
+#define KPKEYS_LVL_MAX		KPKEYS_LVL_UNRESTRICTED
 
 #define __KPKEYS_GUARD(name, set_level, restore_pkey_reg, set_arg, ...)	\
 	__DEFINE_CLASS_IS_CONDITIONAL(name, false);			\
-- 
2.47.0


