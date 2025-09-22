Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C64CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 20:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RRIhpj7f8q+yNaZeKXWv/+VsPneAeHreNiCp7cYSMW0=; b=OUXBjhvJ2ZZfph3Q7IFwzV+Ma0
	jc2AyCao2xyn4XfQzWkylPYDgBgY8vlMswz5GukfV0yM3rUE9/Z6+o5nsN5T4HiRepINWxrGyaVZ9
	puvG6/83EGcodJSVD6HjU6rtWK5HBBaQyXYura+CWMaJaF8zyizedSqWCCe6/iVFBzsKTI6/qg09l
	KG31/0ICanQfD/7zoNRBCB5xTarr9eRkV/bfMM54YguQz+MNiNn/9if2xH1qa3UPNTyVJHVQtrhBe
	MxLExOHTmJ7DBHOnN73kTmfbXVLLCQywzkE5X/kDdkjYNJ7SWxqwb6RHTK3DYbqBgi19D+QYXQHrn
	tYEn4PDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0n5k-0000000BRMv-03sY;
	Mon, 22 Sep 2025 20:24:56 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0n5i-0000000BRMH-0goN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 20:24:55 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1AF62C0000DE;
	Mon, 22 Sep 2025 13:24:51 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1AF62C0000DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1758572691;
	bh=5fmrmxyXo8+QGRwZYQZhtwwyA8SDyVYpuRqt3H8E9PU=;
	h=From:To:Cc:Subject:Date:From;
	b=R+Rxe33AVgjsV428MnlL8JMDJK6KEDR7DixzOdl6hjiQLiJ/g7ZGxdxe8teWmOpYT
	 YZET+696rFDHHxTwTgm3GH2Yet/C6CfH5X65YVS88ZTsbzHgAPADYf29psP2UBM5Xn
	 oIXu+dOSG0lF6oXfnK89UQMSOBS7MWQM99JXomRs=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 03B8F18000530;
	Mon, 22 Sep 2025 13:24:50 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: song@kernel.org,
	linus.walleij@linaro.org,
	florian.fainelli@broadcom.com,
	ardb@kernel.org,
	anand.gore@broadcom.com,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	kursad.oney@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v2] ARM: module: fix unwind section relocation out of range error
Date: Mon, 22 Sep 2025 13:23:22 -0700
Message-ID: <20250922202438.496433-1-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_132454_214594_ABEB59FE 
X-CRM114-Status: GOOD (  14.55  )
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

In an armv7 system that uses non-3G/1G split and with more than 512MB
physical memory, driver load may fail with following error:
   section 29 reloc 0 sym '': relocation 42 out of range (0xc2ab9be8 ->
0x7fad5998)

This happens when relocation R_ARM_PREL31 from the unwind section
.ARM.extab and .ARM.exidx are allocated from the VMALLOC space while
.text section is from MODULES_VADDR space. It exceeds the +/-1GB
relocation requirement of R_ARM_PREL31 hence triggers the error.

The fix is to mark .ARM.extab and .ARM.exidx sections as executable so
they can be allocated along with .text section and always meet range
requirement.

Fixes: ac3b43283923 ("module: replace module_layout with module_memory")

Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: William Zhang <william.zhang@broadcom.com>

---

Changes in v2:
- Fix the comment in code and commit message regarding the unwind
section location
- Add fix tag for more visibility

 arch/arm/kernel/module-plts.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/kernel/module-plts.c b/arch/arm/kernel/module-plts.c
index 354ce16d83cb..b5338fe59706 100644
--- a/arch/arm/kernel/module-plts.c
+++ b/arch/arm/kernel/module-plts.c
@@ -225,6 +225,18 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			mod->arch.init.plt = s;
 		else if (s->sh_type == SHT_SYMTAB)
 			syms = (Elf32_Sym *)s->sh_addr;
+#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
+		else if (s->sh_type == ELF_SECTION_UNWIND ||
+			 (strncmp(".ARM.extab", secstrings + s->sh_name, 10) == 0)) {
+			/*
+			 * To avoid the possible relocation out of range issue for
+			 * R_ARM_PREL31, mark unwind section .ARM.extab and .ARM.exidx as
+			 * executable so they will be allocated along with .text section to
+			 * meet +/-1GB range requirement of the R_ARM_PREL31 relocation
+			 */
+			s->sh_flags |= SHF_EXECINSTR;
+		}
+#endif
 	}
 
 	if (!mod->arch.core.plt || !mod->arch.init.plt) {
-- 
2.43.7


