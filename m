Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D606CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TEt5FVs7bAByY4KAampM0rCdgggPH1dRWAiWsS8XiU=; b=2VDkk9C82CL7rG
	AJsrjCaD2T4P4x2dPhKsS3nMDtOgU3RlgovRDDRYwzoxJu0IQdGfReBWMVRhRPft8v6rmMSROXo9C
	K6KQLPrU+LCScGRPN/JeVrmz/5h7WrT1UbAzrounQGlsly7XdHkcWD/Nzl8/YcF/QRUWAMQXLk018
	SGEXtltqJSvMp1IN0dymgaIB80lP461JoZESLqWpu5NwGGVK4aCBpKxdDi9IevAYiZqAWJpDREtxc
	5H7dkACVuWiQCB2BPfWVoMsnbCCf5bTGzaJmqoG64LZzTkpLFl5NwDi7vd3IqxEmtW09OrrD+7k/U
	8PhuA+MoqYxVYKH8Tfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179O-0000000ERwU-1r6F;
	Tue, 23 Sep 2025 17:50:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1796-0000000ERfp-2DGI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:49:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B63E425E0;
	Tue, 23 Sep 2025 10:49:35 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.30.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E078E3F5A1;
	Tue, 23 Sep 2025 10:49:39 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 07/16] arm64/proton-pack: make alternative callbacks safe
Date: Tue, 23 Sep 2025 18:48:54 +0100
Message-ID: <20250923174903.76283-8-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923174903.76283-1-ada.coupriediaz@arm.com>
References: <20250923174903.76283-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_104944_726082_410B36E8 
X-CRM114-Status: GOOD (  15.92  )
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

Alternative callback functions are regular functions, which means they
or any function they call could get patched or instrumented
by alternatives or other parts of the kernel.
Given that applying alternatives does not guarantee a consistent state
while patching, only once done, and handles cache maintenance manually,
it could lead to nasty corruptions and execution of bogus code.

Make the Spectre mitigations alternative callbacks safe by marking them
`noinstr` when they are not.
This is possible thanks to previous commits making `aarch64_insn_...`
functions used in the callbacks safe to inline.

`spectre_bhb_patch_clearbhb()` is already marked as `__init`,
which has its own text section conflicting with the `noinstr` one.
Instead, use `__no_instr_section(".noinstr.text")` to add
all the function attributes added by `noinstr`, without the section
conflict.
This can be an issue, as kprobes seems to only block the text sections,
not based on function attributes.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
This is missing `spectre_bhb_patch_wa3()` and
`spectre_v4_patch_fw_mitigation_enable()` callbacks, which would need
some more work :
- `spectre_bhb_patch_wa3()` uses `WARN` which is instrumented, and
  I am not sure if it is safe to remove. It feels like something else
  should be done there ?
- `spectre_v4_patch_fw_mitigation_enable()` calls into
  `spectre_v4_mitigations_off()` which calls `pr_info_once()` to notice
  the disabling of the mitigations on the command line, which is
  instrumentable but feels important to keep. I am not sure if there
  would be a better place to generate that message ?
  Interestingly, this was brought up recently[0].
  It also calls `cpu_mitigations_off()` which checks a static variable
  against a static enum, in a common code C file, and is instrumentable.
  This one feels like it could be `__always_inline`'d, but given it is
  common code and the static nature of operands in the check, maybe
  marking it `noinstr` would be acceptable ?

[0]: https://lore.kernel.org/all/aNF0gb1iZndz0-be@J2N7QTR9R3/
---
 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index edf1783ffc81..4ba8d24bf7ef 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -1174,6 +1174,7 @@ void noinstr spectre_bhb_patch_wa3(struct alt_instr *alt,
 }
 
 /* Patched to NOP when not supported */
+__noinstr_section(".init.text")
 void __init spectre_bhb_patch_clearbhb(struct alt_instr *alt,
 				   __le32 *origptr, __le32 *updptr, int nr_inst)
 {
-- 
2.43.0


