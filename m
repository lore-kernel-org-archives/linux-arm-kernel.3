Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597B7CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+e0o98qVL1gIRJVGKjGKEsd++NeUGJF1ENv9igFZV0w=; b=FyuLj0d9M3entCLBVxDj/k25d5
	DUHlyjVgBvVmO5o+322F5SAvN8VRhELG2Hui301473rWnyoLPVZiObxhjY1R4mXV6PmWDntZY8Qdf
	mhWBDkIxjZQJRsQk5HXVsFFJtL5Pp/1IPjpx0nxPJai2US8O5sJFJGS9eS1tr0Ka2NQQh/SlEqA+0
	H+N2Rv9ls93Sm6zwKCOM9/691D6+jqWV+al/Q8Yfl9pEsx/wRhGOgcHxcHYcTJt/sXn9TkQiAA1hH
	0loOxPITx/6hmxyAQeisqsRrTPGK4M4WDKDUC1vSSPcQeXjq2NVxMF3WVczpJtvvL1FTQ+g74+X9i
	jbgA/yoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzF7M-000000000a2-3hM2;
	Thu, 18 Sep 2025 13:56:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzF7L-000000000ZB-0b68
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 13:56:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7719A60211;
	Thu, 18 Sep 2025 13:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D32C4CEEB;
	Thu, 18 Sep 2025 13:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758203770;
	bh=n/4EokD9hrq6wOwGpjCNBcaGHdWSqutIjrYBe9DGy5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unr1a0dI1XkUERZibvwh6MxKlgZtzWd455FU9er7iRjsh3Z0Vnz0IQ5ajQ7JTUg9b
	 vpLK8rQBv461QBDHifL1zyqv1a3dn7+/2S5BqYsdCqMISdsQnL+rTkDHyty5zt2Hj9
	 3ZwzqlKLMVxd69EUCyg9hy+TT1fvsrTPHbRKp4uSgReEsEbk05XOwR39/YF8GM4HBY
	 U0SW7EK8yXupqzla7pHSxG5TmeIhuB+krj7klezhj5f/rgBnLE3Exk8yIzO4AKxRIa
	 TTVZFl2spd43W15AHyvct+8CdBQhTtPYRalR0oyiv9DbpPJMEyvLTM1y9cSQ4ap/wo
	 NxVy/FfopCT8A==
Date: Thu, 18 Sep 2025 14:56:03 +0100
From: Will Deacon <will@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	broonie@kernel.org, yury.khrustalev@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/7] arm64: probes: Add GCS support to bl/blr/ret
Message-ID: <aMwPc8AK3J_IJgPG@willie-the-truck>
References: <20250825033421.463669-1-jeremy.linton@arm.com>
 <20250825033421.463669-5-jeremy.linton@arm.com>
 <90c78c6d-2e73-44a6-b933-779477d15745@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90c78c6d-2e73-44a6-b933-779477d15745@arm.com>
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

On Thu, Sep 18, 2025 at 07:54:12AM -0500, Jeremy Linton wrote:
> On 8/24/25 10:34 PM, Jeremy Linton wrote:
> > The arm64 probe simulation doesn't currently have logic in place
> > to deal with GCS and this results in core dumps if probes are inserted
> > at control flow locations. Fix-up bl, blr and ret to manipulate the
> > shadow stack as needed.
> > 
> > While we manipulate and validate the shadow stack correctly, the
> > hardware provides additional security by only allowing GCS operations
> > against pages which are marked to support GCS. For writing there is
> > gcssttr() which enforces this, but there isn't an equivalent for
> > reading. This means that uprobe users should be aware that probing on
> > control flow instructions which require reading the shadow stack (ex:
> > ret) offers lower security guarantees than what is achieved without
> > the uprobe active.
> > 
> > Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > ---
> >   arch/arm64/kernel/probes/simulate-insn.c | 44 +++++++++++++++++++-----
> >   1 file changed, 35 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/probes/simulate-insn.c b/arch/arm64/kernel/probes/simulate-insn.c
> > index 09a0b36122d0..97ed4db75417 100644
> > --- a/arch/arm64/kernel/probes/simulate-insn.c
> > +++ b/arch/arm64/kernel/probes/simulate-insn.c
> > @@ -13,6 +13,7 @@
> >   #include <asm/traps.h>
> >   #include "simulate-insn.h"
> > +#include "asm/gcs.h"
> >   #define bbl_displacement(insn)		\
> >   	sign_extend32(((insn) & 0x3ffffff) << 2, 27)
> > @@ -49,6 +50,21 @@ static inline u32 get_w_reg(struct pt_regs *regs, int reg)
> >   	return lower_32_bits(pt_regs_read_reg(regs, reg));
> >   }
> > +static inline int update_lr(struct pt_regs *regs, long addr)
> > +{
> > +	int err = 0;
> > +
> > +	if (user_mode(regs) && task_gcs_el0_enabled(current)) {
> > +		push_user_gcs(addr, &err);
> > +		if (err) {
> > +			force_sig(SIGSEGV);
> > +			return err;
> > +		}
> > +	}
> > +	procedure_link_pointer_set(regs, addr);
> > +	return err;
> > +}
> > +
> >   static bool __kprobes check_cbz(u32 opcode, struct pt_regs *regs)
> >   {
> >   	int xn = opcode & 0x1f;
> > @@ -107,9 +123,9 @@ simulate_b_bl(u32 opcode, long addr, struct pt_regs *regs)
> >   {
> >   	int disp = bbl_displacement(opcode);
> > -	/* Link register is x30 */
> >   	if (opcode & (1 << 31))
> > -		set_x_reg(regs, 30, addr + 4);
> > +		if (update_lr(regs, addr + 4))
> > +			return;
> >   	instruction_pointer_set(regs, addr + disp);
> >   }
> > @@ -129,21 +145,31 @@ void __kprobes
> >   simulate_br_blr(u32 opcode, long addr, struct pt_regs *regs)
> >   {
> >   	int xn = (opcode >> 5) & 0x1f;
> > +	int b_target = get_x_reg(regs, xn);
> 
> Ugh, I was staring at this set and realized that this type is wrong, it
> should be 'long'. I will send a patch once I sanity check it on something
> that isn't a model.

Thanks. I'm happy to add fixes on top of what I've already queued, so
please fire away.

Will

