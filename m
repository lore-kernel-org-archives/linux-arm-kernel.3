Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FFCE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPuaRyfRp0NhC5PL1Ek/HmVaxJ1EQxa15gsQ55V8yV0=; b=TckjguyMuPn7p/PEeDm1SbdH0Q
	w/5g2PnUMzAGZ9zDYcwg58IzoK999sW2Erx5YKPZs6kmCat032YDy4EFSF7Zw21TgpJwsHbO607fF
	xNmDaxpyrYgEDFIIJzfiri1DwEMkjgDJT97IiGyb58y8jMAXQ4hf4EZAPL/Ij7wFFCPOIFLwqYQUF
	W9gmXuV0dgNf8PpgFqrvanNfN3XN4IZMRX2dIy+erhhIdRMRs3Fm5jgmmgjiqY5qoOLi98huGw0IA
	4rIo0XSnegaexkBVJnZei7o1yWEz+2Y/Q3QurT42GyfsI+Nf73dyRjrHLOjmmNcytv2/hl/XETn0Y
	g8ymIdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQTUB-0000000E0nU-3FX9;
	Wed, 25 Dec 2024 15:39:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQTOi-0000000E09U-3awt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 15:34:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA0785C4807;
	Wed, 25 Dec 2024 15:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DA4C4CECD;
	Wed, 25 Dec 2024 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735140848;
	bh=6D1C6rbrgHU2WXBYnJ9sFqrh5OpIdxLiPim9FKxrsqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kp4P3hOyy1QXDBZnl1mJGkshMH3iDj3JiupgXH/cAeFVohwdiXgbSx+9EYT+cIsKd
	 Ab6yHzu3CBDnsj23QNXaQQpuRvH8s8natc7YeAT23NU5Ik0UVAxNe83RkxIwybLkzj
	 a4nk5FUWoOlvB/vaS/vaaKm8gX2S9lbgDmckYcdFJ6wKkqoaG6wubDZfjDOCbW/IWN
	 YmWxBw4c9yqoFZ9vQQAURFOl4iVCJAdKGOeU3K9KZfCi1GcpJOS5H6wm2+xUMyWKIl
	 di+v3ElMCxEHzQ4+zimkqdOLr5yH9gy5lYIYDhVgQ1BpdN5fIO5wLofJse+cC7Gsht
	 abIexsaF2KTMA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Paulo Pisati <paolo.pisati@canonical.com>,
	Matthias Klose <doko@debian.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 3/3] modpost: work around unaligned data access error
Date: Thu, 26 Dec 2024 00:33:37 +0900
Message-ID: <20241225153343.134590-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241225153343.134590-1-masahiroy@kernel.org>
References: <20241225153343.134590-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_073408_983993_EBFDEA79 
X-CRM114-Status: GOOD (  18.78  )
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

With the latest binutils, modpost fails with a bus error on some
architectures such as ARM and sparc64.

Since binutils commit 1f1b5e506bf0 ("bfd/ELF: restrict file alignment
for object files"), the byte offset to each section (sh_offset) in
relocatable ELF is no longer guaranteed to be aligned.

modpost parses MODULE_DEVICE_TABLE() data structures, which are usually
located in the .rodata section. If it is not properly aligned, unaligned
access errors may occur.

To address the issue, this commit imports the get_unaligned() helper
from include/linux/unaligned.h.

The get_unaligned_native() helper caters to the endianness in addition
to handling the unaligned access.

I slightly refactored do_pcmcia_entry() and do_input() to avoid writing
back to an unaligned address. (We would need the put_unaligned() helper
to do that.)

The addend_*_rel() functions need similar adjustments because the .text
sections are not aligned either.

It seems that the .symtab, .rel.* and .rela.* sections are still aligned.
Keep normal pointer access for these sections to avoid unnecessary
performance costs.

Reported-by: Paulo Pisati <paolo.pisati@canonical.com>
Reported-by: Matthias Klose <doko@debian.org>
Closes: https://sourceware.org/bugzilla/show_bug.cgi?id=32435
Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Closes: https://sourceware.org/bugzilla/show_bug.cgi?id=32493
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 26 +++++++++++++-------------
 scripts/mod/modpost.c    | 24 ++++++++++++------------
 scripts/mod/modpost.h    | 14 ++++++++++++++
 3 files changed, 39 insertions(+), 25 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 2c7b76d4e8ec..19ec72a69e90 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -132,7 +132,8 @@ struct devtable {
  * based at address m.
  */
 #define DEF_FIELD(m, devid, f) \
-	typeof(((struct devid *)0)->f) f = TO_NATIVE(*(typeof(f) *)((m) + OFF_##devid##_##f))
+	typeof(((struct devid *)0)->f) f = \
+		get_unaligned_native((typeof(f) *)((m) + OFF_##devid##_##f))
 
 /* Define a variable f that holds the address of field f of struct devid
  * based at address m.  Due to the way typeof works, for a field of type
@@ -600,7 +601,7 @@ static void do_pnp_card_entry(struct module *mod, void *symval)
 static void do_pcmcia_entry(struct module *mod, void *symval)
 {
 	char alias[256] = {};
-	unsigned int i;
+
 	DEF_FIELD(symval, pcmcia_device_id, match_flags);
 	DEF_FIELD(symval, pcmcia_device_id, manf_id);
 	DEF_FIELD(symval, pcmcia_device_id, card_id);
@@ -609,10 +610,6 @@ static void do_pcmcia_entry(struct module *mod, void *symval)
 	DEF_FIELD(symval, pcmcia_device_id, device_no);
 	DEF_FIELD_ADDR(symval, pcmcia_device_id, prod_id_hash);
 
-	for (i=0; i<4; i++) {
-		(*prod_id_hash)[i] = TO_NATIVE((*prod_id_hash)[i]);
-	}
-
 	ADD(alias, "m", match_flags & PCMCIA_DEV_ID_MATCH_MANF_ID,
 	    manf_id);
 	ADD(alias, "c", match_flags & PCMCIA_DEV_ID_MATCH_CARD_ID,
@@ -623,10 +620,14 @@ static void do_pcmcia_entry(struct module *mod, void *symval)
 	    function);
 	ADD(alias, "pfn", match_flags & PCMCIA_DEV_ID_MATCH_DEVICE_NO,
 	    device_no);
-	ADD(alias, "pa", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID1, (*prod_id_hash)[0]);
-	ADD(alias, "pb", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID2, (*prod_id_hash)[1]);
-	ADD(alias, "pc", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID3, (*prod_id_hash)[2]);
-	ADD(alias, "pd", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID4, (*prod_id_hash)[3]);
+	ADD(alias, "pa", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID1,
+	    get_unaligned_native(*prod_id_hash + 0));
+	ADD(alias, "pb", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID2,
+	    get_unaligned_native(*prod_id_hash + 1));
+	ADD(alias, "pc", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID3,
+	    get_unaligned_native(*prod_id_hash + 2));
+	ADD(alias, "pd", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID4,
+	    get_unaligned_native(*prod_id_hash + 3));
 
 	module_alias_printf(mod, true, "pcmcia:%s", alias);
 }
@@ -654,10 +655,9 @@ static void do_input(char *alias,
 {
 	unsigned int i;
 
-	for (i = min / BITS_PER_LONG; i < max / BITS_PER_LONG + 1; i++)
-		arr[i] = TO_NATIVE(arr[i]);
 	for (i = min; i <= max; i++)
-		if (arr[i / BITS_PER_LONG] & (1ULL << (i%BITS_PER_LONG)))
+		if (get_unaligned_native(arr + i / BITS_PER_LONG) &
+		    (1ULL << (i % BITS_PER_LONG)))
 			sprintf(alias + strlen(alias), "%X,*", i);
 }
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 94ee49207a45..7ea59dc4926b 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1138,9 +1138,9 @@ static Elf_Addr addend_386_rel(uint32_t *location, unsigned int r_type)
 {
 	switch (r_type) {
 	case R_386_32:
-		return TO_NATIVE(*location);
+		return get_unaligned_native(location);
 	case R_386_PC32:
-		return TO_NATIVE(*location) + 4;
+		return get_unaligned_native(location) + 4;
 	}
 
 	return (Elf_Addr)(-1);
@@ -1161,24 +1161,24 @@ static Elf_Addr addend_arm_rel(void *loc, Elf_Sym *sym, unsigned int r_type)
 	switch (r_type) {
 	case R_ARM_ABS32:
 	case R_ARM_REL32:
-		inst = TO_NATIVE(*(uint32_t *)loc);
+		inst = get_unaligned_native((uint32_t *)loc);
 		return inst + sym->st_value;
 	case R_ARM_MOVW_ABS_NC:
 	case R_ARM_MOVT_ABS:
-		inst = TO_NATIVE(*(uint32_t *)loc);
+		inst = get_unaligned_native((uint32_t *)loc);
 		offset = sign_extend32(((inst & 0xf0000) >> 4) | (inst & 0xfff),
 				       15);
 		return offset + sym->st_value;
 	case R_ARM_PC24:
 	case R_ARM_CALL:
 	case R_ARM_JUMP24:
-		inst = TO_NATIVE(*(uint32_t *)loc);
+		inst = get_unaligned_native((uint32_t *)loc);
 		offset = sign_extend32((inst & 0x00ffffff) << 2, 25);
 		return offset + sym->st_value + 8;
 	case R_ARM_THM_MOVW_ABS_NC:
 	case R_ARM_THM_MOVT_ABS:
-		upper = TO_NATIVE(*(uint16_t *)loc);
-		lower = TO_NATIVE(*((uint16_t *)loc + 1));
+		upper = get_unaligned_native((uint16_t *)loc);
+		lower = get_unaligned_native((uint16_t *)loc + 1);
 		offset = sign_extend32(((upper & 0x000f) << 12) |
 				       ((upper & 0x0400) << 1) |
 				       ((lower & 0x7000) >> 4) |
@@ -1195,8 +1195,8 @@ static Elf_Addr addend_arm_rel(void *loc, Elf_Sym *sym, unsigned int r_type)
 		 * imm11 = lower[10:0]
 		 * imm32 = SignExtend(S:J2:J1:imm6:imm11:'0')
 		 */
-		upper = TO_NATIVE(*(uint16_t *)loc);
-		lower = TO_NATIVE(*((uint16_t *)loc + 1));
+		upper = get_unaligned_native((uint16_t *)loc);
+		lower = get_unaligned_native((uint16_t *)loc + 1);
 
 		sign = (upper >> 10) & 1;
 		j1 = (lower >> 13) & 1;
@@ -1219,8 +1219,8 @@ static Elf_Addr addend_arm_rel(void *loc, Elf_Sym *sym, unsigned int r_type)
 		 * I2    = NOT(J2 XOR S)
 		 * imm32 = SignExtend(S:I1:I2:imm10:imm11:'0')
 		 */
-		upper = TO_NATIVE(*(uint16_t *)loc);
-		lower = TO_NATIVE(*((uint16_t *)loc + 1));
+		upper = get_unaligned_native((uint16_t *)loc);
+		lower = get_unaligned_native((uint16_t *)loc + 1);
 
 		sign = (upper >> 10) & 1;
 		j1 = (lower >> 13) & 1;
@@ -1241,7 +1241,7 @@ static Elf_Addr addend_mips_rel(uint32_t *location, unsigned int r_type)
 {
 	uint32_t inst;
 
-	inst = TO_NATIVE(*location);
+	inst = get_unaligned_native(location);
 	switch (r_type) {
 	case R_MIPS_LO16:
 		return inst & 0xffff;
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 8b72c227ebf4..ffd0a52a606e 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -65,6 +65,20 @@
 #define TO_NATIVE(x)	\
 	(target_is_big_endian == host_is_big_endian ? x : bswap(x))
 
+#define __get_unaligned_t(type, ptr) ({					\
+	const struct { type x; } __attribute__((__packed__)) *__pptr =	\
+						(typeof(__pptr))(ptr);	\
+	__pptr->x;							\
+})
+
+#define get_unaligned(ptr)	__get_unaligned_t(typeof(*(ptr)), (ptr))
+
+#define get_unaligned_native(ptr) \
+({ \
+	typeof(*(ptr)) _val = get_unaligned(ptr); \
+	TO_NATIVE(_val); \
+})
+
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 
 #define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
-- 
2.43.0


