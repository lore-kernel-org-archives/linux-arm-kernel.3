Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F25CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GErQLmtJrjUdcCTE/nvIg6Ar7HZiUFZBB3t68HP9ib0=; b=GCp3VhaBofYB6j
	1Qs9kCLarPKduonwPuZyOtVjomcCpXuT3ROqIoKjJUgVIpcS+L3mNJt0TsifbTbQ4ISXr0endoJt9
	Uo7BJDoWSHs0OScR25OumDBGuC6cGJzDZj1kmkWW8ytNYP6/HMRkClblYdZ5YFBpWaadFiDAZSBh4
	rF7eMLZzpRifr1DSYy7Ril3egxxQ+7Io3cZ+LI38CwLx/2hqwwyd825vpkCJph7sMX7tAwkg9/wWW
	MtcI5aYehB6N8WGGgBLFyM3WYJ55BGlip3UH7ZxkABWt9ocenlbyeMv3wt0iOWhUPot9S3Z4Rvxb+
	QP1imFEHyN7F5Z5BQC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v178x-0000000ERUy-06d8;
	Tue, 23 Sep 2025 17:49:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v178j-0000000ERJa-2Ulb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:49:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBD86FEC;
	Tue, 23 Sep 2025 10:49:11 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.30.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1734B3F5A1;
	Tue, 23 Sep 2025 10:49:15 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 01/16] kasan: mark kasan_(hw_)tags_enabled() __always_inline
Date: Tue, 23 Sep 2025 18:48:48 +0100
Message-ID: <20250923174903.76283-2-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923174903.76283-1-ada.coupriediaz@arm.com>
References: <20250923174903.76283-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_104921_671626_2C8497FB 
X-CRM114-Status: UNSURE (   9.34  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kasan-dev@googlegroups.com, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

`kasan_hw_tags_enabled()` and `kasan_tags_enabled()` are marked inline,
except `kasan_enabled()` with `CONFIG_KASAN_HW_TAGS`,
which is marked `__always_inline`.

Those functions are called in the arm64 alternative callback
`kasan_hw_tags_enable()`, which requires them to be inlined to avoid
being instrumented and safe for patching.

For consistency between the four declarations and to make the arm64
alternative callback safe, mark them `__always_inline`.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 include/linux/kasan-enabled.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
index 6f612d69ea0c..d3d5a2327e11 100644
--- a/include/linux/kasan-enabled.h
+++ b/include/linux/kasan-enabled.h
@@ -13,19 +13,19 @@ static __always_inline bool kasan_enabled(void)
 	return static_branch_likely(&kasan_flag_enabled);
 }
 
-static inline bool kasan_hw_tags_enabled(void)
+static __always_inline bool kasan_hw_tags_enabled(void)
 {
 	return kasan_enabled();
 }
 
 #else /* CONFIG_KASAN_HW_TAGS */
 
-static inline bool kasan_enabled(void)
+static __always_inline bool kasan_enabled(void)
 {
 	return IS_ENABLED(CONFIG_KASAN);
 }
 
-static inline bool kasan_hw_tags_enabled(void)
+static __always_inline bool kasan_hw_tags_enabled(void)
 {
 	return false;
 }
-- 
2.43.0


