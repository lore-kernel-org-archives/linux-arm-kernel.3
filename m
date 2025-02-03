Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5CAC02194
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHzh0GIvxYZInKVNXjFtmOiyhq3s9+3Bn3ETwjH4vJU=; b=hkE5EwFtmzDP0ez47TpEwrKAfO
	/OZ5ljTk8nzfsxdq7jyhqbcOWVQxCAjfL2JhAYhu+03k5HSyJsogPl0LukLEGdmkF8yENKrhUWncH
	q+9Jcfq2wCaTZVk59LHVKABQCSK43kGtazjWEKtXrgXOKs1nDLAijKrDI3f3hH1nXWntoYo1fPckO
	VDkUS/XVwMSRqlDM4Br7k0XsUxcB8NMCu1NT3/azmtQ33kIMAWnOSSbgBbCnQb2jOJqNEI27m3gp2
	uqmXjsg1cMC0u2+cEFM7EKO5ITUpnufw6r+gBzys/+DWIspGtkErmVRaHVorweVakSAupVg98Pyhn
	ChJtn7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tev8C-0000000FJBt-3Ufx;
	Mon, 03 Feb 2025 12:00:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teth1-0000000F7Qh-0Chv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oHzh0GIvxYZInKVNXjFtmOiyhq3s9+3Bn3ETwjH4vJU=; b=WIbzXna9IrYRkOjIiL7Tx2eSF3
	HbPBFlugTLTDo1+k1JJxPDOqp0H5P88fB3pwgJyIH0uHYUeXwxUxfaw2raNNCcmBmlY8mjMHrauD/
	PCwpHn59BizXeVH6p96lUc7irGmh/aBF1CHSLsl5Zm++5RJGDzJbWy/LhkeMDiqkEcoaBEpCK9q2F
	9iBRvgw5kiZDBmNq8wk+kgZMfB1N/8+NVWl1QgCVxzkDHgAedDjEf6rZOqpHHBMUTWWSnuhdt/Aun
	OGPwDe6u7+yvGv2nNEv7BxEwVDcokso4vV8sFbqSaEtMke5Ui6cGstT77uFuj/Jw94/0o6yD1CMTR
	ZMmTm7vg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetgy-0000000G3r0-06Ep
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:28:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBF761682;
	Mon,  3 Feb 2025 02:28:59 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CF223F63F;
	Mon,  3 Feb 2025 02:28:31 -0800 (PST)
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
Subject: [RFC PATCH 2/8] mm: kpkeys: Introduce unrestricted level
Date: Mon,  3 Feb 2025 10:28:03 +0000
Message-ID: <20250203102809.1223255-3-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250203102809.1223255-1-kevin.brodsky@arm.com>
References: <20250203102809.1223255-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102836_379308_D29E68C8 
X-CRM114-Status: GOOD (  11.69  )
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
index 3f16584d495a..ab2305ca24b7 100644
--- a/arch/arm64/include/asm/kpkeys.h
+++ b/arch/arm64/include/asm/kpkeys.h
@@ -19,7 +19,9 @@ static inline u64 por_set_kpkeys_level(u64 por, int level)
 {
 	por = por_set_pkey_perms(por, KPKEYS_PKEY_DEFAULT, POE_RXW);
 	por = por_set_pkey_perms(por, KPKEYS_PKEY_PGTABLES,
-				 level == KPKEYS_LVL_PGTABLES ? POE_RW : POE_R);
+				 level == KPKEYS_LVL_PGTABLES ||
+				 level == KPKEYS_LVL_UNRESTRICTED
+				 ? POE_RW : POE_R);
 
 	return por;
 }
diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
index 645eaf00096c..9d9feec83ccf 100644
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


