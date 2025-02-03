Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247E0C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkmJBE2xe1rD7fvTP6vWNu0WpILKMHVEtvlvMXZaL4Q=; b=bELm1/8Z+dgV063QwAFATFaFPm
	wJCl5wK//TFPQMZFJdWgdk3WyWMP2QTjZKPktGFXR2BG5949z0No9/RE8eLV631FANOOAP28Of/0f
	1NmnP34PHICveUHYIljibhwe7fYUYGrU0Vfmy9mcjgQXgFr/l9lw7pjfKm2AJIDMNq15TszsNUXMW
	a5VspOHFiqJIm8Pf4RScJBiHNCmyUxFahcoN9xHUvscL4gC10DETWjOYWUnxjf/q+o4RbufTB7xvM
	kFDRB0FhmGxk9wshJpZe04iFz9ly+PppNJHXs0wv5jXYR01FrXhGDjJqRXD13MZja21C/EOpQM6QX
	/ZDhdGjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teutg-0000000FGoz-2lKO;
	Mon, 03 Feb 2025 11:45:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetgx-0000000F7PJ-06Oh
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:28:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vkmJBE2xe1rD7fvTP6vWNu0WpILKMHVEtvlvMXZaL4Q=; b=alxfeKXxJ7aSdmRuqBDuL2s3gs
	Kust79Ay2ovL48tin0cjA6JRnWwuvUUL6v+aM0+o9vH8KPjJVxjWwTOjnkbpVXs79zcx/kPqkUVCw
	AKEYR0laNn1iHQr8bVNYyMVcfVuzLkHZEQOSB7ar3GK6YBoVxN0B3+cNN8ZhzEmsV0NKqS6yrMXxz
	Nl9wcxGIHhSw9ZAyCIdpstNfRizSncvm1Y3Jb/DS99psMUwmks3iLPm54aYTKOUeoc3cB/J+DUbAg
	LW5jDXyVTaitBGf+Zad0Dej3xUsvo3sxiGlZaNZU8Ux55yF8LbrO+Tm7QmhumR2PBGWR8DM1EUkga
	AL/7qAKw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetgt-0000000G3pM-3zQh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:28:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA49E1476;
	Mon,  3 Feb 2025 02:28:55 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B5A13F63F;
	Mon,  3 Feb 2025 02:28:27 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH 1/8] arm64: kpkeys: Avoid unnecessary writes to POR_EL1
Date: Mon,  3 Feb 2025 10:28:02 +0000
Message-ID: <20250203102809.1223255-2-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250203102809.1223255-1-kevin.brodsky@arm.com>
References: <20250203102809.1223255-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102832_390265_748D37F4 
X-CRM114-Status: GOOD (  12.70  )
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

Nested uses of kpkeys guards are about to be introduced, which means
that kpkeys_set_level() may not actually need to change the value of
POR_EL1. Since updating POR_EL1 requires an expensive ISB, let's
skip the write if the value is unchanged, by returning
KPKEYS_PKEY_REG_INVAL. This will cause the matching
kpkeys_restore_pkey_reg() call to bail out without calling
arch_kpkeys_restore_pkey_reg().

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/kpkeys.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kpkeys.h b/arch/arm64/include/asm/kpkeys.h
index 4854e1f3babd..3f16584d495a 100644
--- a/arch/arm64/include/asm/kpkeys.h
+++ b/arch/arm64/include/asm/kpkeys.h
@@ -27,8 +27,12 @@ static inline u64 por_set_kpkeys_level(u64 por, int level)
 static inline int arch_kpkeys_set_level(int level)
 {
 	u64 prev_por = read_sysreg_s(SYS_POR_EL1);
+	u64 new_por = por_set_kpkeys_level(prev_por, level);
 
-	write_sysreg_s(por_set_kpkeys_level(prev_por, level), SYS_POR_EL1);
+	if (new_por == prev_por)
+		return KPKEYS_PKEY_REG_INVAL;
+
+	write_sysreg_s(new_por, SYS_POR_EL1);
 	isb();
 
 	return prev_por;
-- 
2.47.0


