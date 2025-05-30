Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9807C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REnHOf+PX0b+SIw7aR9OrznGZERUG42luAqJAZhu06c=; b=aT9E5EgNy1wk2ajVG20APMrHmQ
	P+JoD9lhwUX9bDme4aPsKuWx2GLdfoPobgz9xdCWkMLHLdVBTE6yjtUhN3kTtNBiPaIECb7auPoiT
	CaQhRLVxjoF75YAtqqeu0GPNZDCdtABdBbuLTYnsAk5nhJNntfdYHStVQ83JUO6wtaBBMKkagY206
	lqUvpYiPXVoNmdvainiCHfRHSe5hKwC9RIVCwbwe26RrXcRBXJds/gSY0rbObMLn50U+wI2G86omH
	2Sa7x5HmYjVMrXh+JYiN2ffYCv9t8xG3FfP8HyKrlx/ZFPVe0Fg4vBClM4a6vfTsww049TnoWkwsl
	mwGSUkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0f7-00000000tVx-26Qq;
	Fri, 30 May 2025 14:24:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0UG-00000000sEM-2gFZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 14:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF8F3629C7;
	Fri, 30 May 2025 14:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CB4C4CEE9;
	Fri, 30 May 2025 14:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748614411;
	bh=Qk7ig8E6I5Fxfl4skodUi2kTp6IQZk1gvaG1KNM3ZfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wwsr9PAxR/YDkP7EaIplRVL2lhkBpBWOFj0LejS6IIupm9wfjShQ/WZy4UOClD/Bk
	 a/tFH0/o8Xotgq1VptjG07swHKIklNhULj7z7VqUmfOWdud2PUoeooGEh9ry9dieJ7
	 wptIUm/daEIzUjaGKjkKABGjJXilTXsUjKM7nUl+EEm7wwS80HLKp6I4bqLIpVolOr
	 0ysrQnBDAdJfc7FFUjwupPDlbcTK+M2iIcOrnBVUheZ8rkntinFFuaDzevc0JrGe3p
	 yBqV8gQ5IZXVbwPD7Tqlx+eenXzEGIg9X5oJmM5TcMpuB28Inuc31K5RC9I9DgMYiZ
	 0rN9XtgkiK9dw==
Date: Fri, 30 May 2025 15:13:26 +0100
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
Message-ID: <20250530141325.GA30733@willie-the-truck>
References: <20250530000044.341911-1-dylanbhatch@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530000044.341911-1-dylanbhatch@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Fri, May 30, 2025 at 12:00:44AM +0000, Dylan Hatch wrote:
> To enable late module patching, livepatch modules need to be able to
> apply some of their relocations well after being loaded. In this
> scenario however, the livepatch module text and data is already RX-only,
> so special treatment is needed to make the late relocations possible. To
> do this, use the text-poking API for these late relocations.
> 
> This patch is partially based off commit 88fc078a7a8f6 ("x86/module: Use
> text_poke() for late relocations").
> 
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> Acked-by: Song Liu <song@kernel.org>
> ---
>  arch/arm64/kernel/module.c | 110 ++++++++++++++++++++++---------------
>  1 file changed, 66 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 06bb680bfe975..93e6d63074afe 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -23,6 +23,7 @@
>  #include <asm/insn.h>
>  #include <asm/scs.h>
>  #include <asm/sections.h>
> +#include <asm/text-patching.h>
>  
>  enum aarch64_reloc_op {
>  	RELOC_OP_NONE,
> @@ -48,7 +49,26 @@ static u64 do_reloc(enum aarch64_reloc_op reloc_op, __le32 *place, u64 val)
>  	return 0;
>  }
>  
> -static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
> +static void write_data(void *place, s64 *sval, size_t len, struct module *me)
> +{
> +	if (me->state == MODULE_STATE_UNFORMED)
> +		memcpy(place, sval, len);
> +	else
> +		aarch64_insn_copy(place, sval, len);
> +}
> +
> +static void write_insn(__le32 *place, u32 insn, struct module *me)
> +{
> +	__le32 le = cpu_to_le32(insn);
> +
> +	if (me->state == MODULE_STATE_UNFORMED)
> +		*place = le;
> +	else
> +		aarch64_insn_copy(place, &le, sizeof(le));
> +}

Maybe combine these into a single macro such as below?

#define WRITE_PLACE(place, val, mod) do {				\
	if (mod->state == MODULE_STATE_UNFORMED)			\
		*(place) = val;						\
	else								\
		aarch64_insn_copy(place, &(val), sizeof(*place));	\
while (0)

> +static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len,
> +		      struct module *me)
>  {
>  	s64 sval = do_reloc(op, place, val);
>  
> @@ -66,7 +86,7 @@ static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, int len)
>  
>  	switch (len) {
>  	case 16:
> -		*(s16 *)place = sval;
> +		write_data(place, &sval, sizeof(s16), me);

Then this would be:

	WRITE_PLACE((s16 *)place, sval, me);

> @@ -145,7 +166,7 @@ static int reloc_insn_movw(enum aarch64_reloc_op op, __le32 *place, u64 val,
>  
>  	/* Update the instruction with the new encoding. */
>  	insn = aarch64_insn_encode_immediate(AARCH64_INSN_IMM_16, insn, imm);
> -	*place = cpu_to_le32(insn);
> +	write_insn(place, insn, me);

and this would be:

	WRITE_PLACE(place, cpu_to_le32(insn), me);

Will

