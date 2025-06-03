Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43C3C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3POtsu2QTuk96rdXvOOIqoNxfTKcBzVJQIfjLygPY+0=; b=d5xbiGy8ozpMcnYdWzIU4ooYvF
	9SKIIAHQsG11RatJioo0m4ryPV6xyePk9onOvd5/VhRxmIA6nSwtgbnCMnhTpCrnwgyIRA/tdYhk6
	wM2Sis9K9rzLj51ef/4UeJLfmtSUMDloARxiEbd/Nc6AeUHeq7vVO28RwTqocPkktU8kWWvhC4CDz
	sta5Tw7xXqqhN2ubxDJreCbdgMDSwYjtxXoInEO4N4Dua/2NQyQ/v34sXlNZcyHIyfZkfjuUOSFEZ
	zK1sDB0w1hac9cjTtIWf3u+jRa0YQcsvRpYFEUUCUkJj9MvHQSRltekHr32Jb4H09ee8GjnHZ0ao6
	7uREO3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTMc-0000000BFmE-47Tn;
	Tue, 03 Jun 2025 15:15:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTKR-0000000BFSQ-1i4z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 15:13:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00B6DA50420;
	Tue,  3 Jun 2025 15:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0EEC4CEEE;
	Tue,  3 Jun 2025 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748963605;
	bh=SDrJA2heEfO3acGwN161/YSuu79b0rUMxQJRzB6X4nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ncskI327tBVw4nf0zXtQLAE+PNC/Cxo1lYA5S65uqpL+VrN30Lf9u/ZuBXksazvo+
	 BbI6p100RtCVDQCYfnNcNmpzc2ve589cY+xmAU9udFZK/SRPrBXlio5wGkGC3knXsI
	 gK0gY5vuyNibdidJ543zYMSjglBuhjRstEp1ZBGpwbrE3tFQNr2mLCSkLcT98zK5it
	 kkSyqD+8o8yBd/nuzN3LLPXev4KOOh2E2cbrGPP67im1mkGS7swpD0F+UY735yhJ6w
	 eb9UMXdizDZVnrB3g/HnLRvI8GYL0UHhMWRvlAzZac3hJxSf4LPWyP+G5nRsSDgQIH
	 1jlEh1p2aAaww==
Date: Tue, 3 Jun 2025 16:13:20 +0100
From: Will Deacon <will@kernel.org>
To: Dylan Hatch <dylanbhatch@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Song Liu <song@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Subject: Re: [PATCH v5] arm64/module: Use text-poke API for late relocations.
Message-ID: <20250603151319.GA2611@willie-the-truck>
References: <20250530000044.341911-1-dylanbhatch@google.com>
 <20250530141325.GA30733@willie-the-truck>
 <CADBMgpx==FnFj4okXs1n3NPngh7Os1YpnGrDDe8z_t2X7bzOOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADBMgpx==FnFj4okXs1n3NPngh7Os1YpnGrDDe8z_t2X7bzOOQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_081327_581103_82E7E27A 
X-CRM114-Status: GOOD (  24.84  )
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

Hey Dylan,

On Fri, May 30, 2025 at 05:11:00PM -0700, Dylan Hatch wrote:
> On Fri, May 30, 2025 at 7:13 AM Will Deacon <will@kernel.org> wrote:
> >
> > and this would be:
> >
> >         WRITE_PLACE(place, cpu_to_le32(insn), me);
> >
> 
> I'm seeing this part give a build error:
> 
> arch/arm64/kernel/module.c:158:2: error: cannot take the address of an
> rvalue of type '__le32' (aka 'unsigned int')
>   158 |         WRITE_PLACE(place, cpu_to_le32(insn), me);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/arm64/kernel/module.c:56:28: note: expanded from macro 'WRITE_PLACE'
>    56 |                 aarch64_insn_copy(place, &(val),
> sizeof(*place));       \
>       |                                          ^ ~~~
> 
> I can't think of a clean way to get around this and still keep a
> combined write helper. Setting an intermediate __le32 in the
> reloc_insn_* functions would work but we were trying to avoid that.
> Setting an intermediate value inside WRITE_PLACE would also work but
> then (I think) it won't work for the data relocations because we'd be
> converting a signed into unsigned value. Making WRITE_PLACE a function
> instead of a macro also fixes the rvalue problem but then the args
> 'place' and 'val' have to be of a fixed type so we can't do the
> typecasting on 'place' and 'val' has the same signed/unsigned value
> problem.
> 
> Do you have a suggestion here? In the meantime I can send a v6 that
> uses an intermediate __le32 for the instruction relocations.

Sorry for the slow reply -- I see you already sent a v6. I think we
could add a temporary in the macro. Diff below (on top of your v6). WDYT?

Will

--->8

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index 862f6d50ab00..40148d2725ce 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -50,10 +50,12 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, __le32 *place, u64 val)
 }
 
 #define WRITE_PLACE(place, val, mod) do {				\
+	__typeof__(val) __val = (val);					\
+									\
 	if (mod->state == MODULE_STATE_UNFORMED)			\
-		*(place) = val;						\
+		*(place) = __val;					\
 	else								\
-		aarch64_insn_copy(place, &(val), sizeof(*place));	\
+		aarch64_insn_copy(place, &(__val), sizeof(*place));	\
 } while (0)
 
 static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len,
@@ -128,7 +130,6 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
 	u64 imm;
 	s64 sval;
 	u32 insn = le32_to_cpu(*place);
-	__le32 le_insn;
 
 	sval = do_reloc(op, place, val);
 	imm = sval >> lsb;
@@ -156,8 +157,7 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction with the new encoding. */
 	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn, imm);
-	le_insn = cpu_to_le32(insn);
-	WRITE_PLACE(place, le_insn, me);
+	WRITE_PLACE(place, cpu_to_le32(insn), me);
 
 	if (imm > U16_MAX)
 		return -ERANGE;
@@ -172,7 +172,6 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
 	u64 imm, imm_mask;
 	s64 sval;
 	u32 insn = le32_to_cpu(*place);
-	__le32 le_insn;
 
 	/* Calculate the relocation value. */
 	sval = do_reloc(op, place, val);
@@ -184,8 +183,7 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, __le32 *place, u64 val,
 
 	/* Update the instruction's immediate field. */
 	insn = aarch64_insn_encode_immediate(imm_type, insn, imm);
-	le_insn = cpu_to_le32(insn);
-	WRITE_PLACE(place, le_insn, me);
+	WRITE_PLACE(place, cpu_to_le32(insn), me);
 
 	/*
 	 * Extract the upper value bits (including the sign bit) and
@@ -207,7 +205,6 @@ static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 			   __le32 *place, u64 val, struct module *me)
 {
 	u32 insn;
-	__le32 le_insn;
 
 	if (!is_forbidden_offset_for_adrp(place))
 		return reloc_insn_imm(RELOC_OP_PAGE, place, val, 12, 21,
@@ -227,8 +224,7 @@ static int reloc_insn_adrp(struct module *mod, Elf64_Shdr *sechdrs,
 						   AARCH64_INSN_BRANCH_NOLINK);
 	}
 
-	le_insn = cpu_to_le32(insn);
-	WRITE_PLACE(place, le_insn, me);
+	WRITE_PLACE(place, cpu_to_le32(insn), me);
 	return 0;
 }
 

