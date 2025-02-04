Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566ADC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 11:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bG66toiAjV+KR365bfBv98O5vqhnhp8yGKeYWV5vB8=; b=tCWZqh8KPmByS/zNjg+yUiuQ8o
	+mjQkyVyBmI2TnLKUxV8h65Dj9ttekBek8YJ4pIddR6MgiD0oedoMWXd3ULFZdIvbQYrZ3KhsY6o2
	piZzJyNuMUbU5HPxxJJkGDw71PdFX0UladoUjfjHiPED8bWbngF7FXR43Cdss8T/dznn+FXCpSLtR
	sa/7taGHd3At7gvBTXPfa6LCRgDDea+tgH+NWcCuLEZGb+j3EIU+Jz+zvPi0xGWqOpfw8NcVuMNds
	4vmbSWN3aO5vBpBCTpwrBM+VUyYMobm77JrkAchDJvn3+iWilpYTPv4E69yrXjyH1/toyOEeJ1+TL
	DT3KIlgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHBl-00000000HLP-22n8;
	Tue, 04 Feb 2025 11:33:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfH9F-00000000H2v-16Zg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 11:31:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFF055C5D99;
	Tue,  4 Feb 2025 11:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B93C4CEE2;
	Tue,  4 Feb 2025 11:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738668680;
	bh=7XmKudr6uck87icOCprn9YsjKpC5QJOurnBP8lQrfBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMx5ck2W0ACKRYwLdhJu9+dYZUUMWtxPa+Lc6KzbA+nRE7Sp/E/jaLUTxAsaUMoZI
	 bbNuj/TGBH1tuKbwA0bemLZMehOFe7BRJhEpPZfzZ59W4Aib65kB/R71j06yPXyYtt
	 EAc1NNEhoAdgxGbqsfu+dXm79ugwaLNeRixcZr3MaLEz5wPXaJkm9AmWpfNEaqxegc
	 p/BQ5RI5Zuem+Q7Rtlw+mVe4pIIPNi9EXJigTUgoOCHb1TLkXiUMN7JFUkYpPjCrYx
	 F4BJNjq+lB8XYz0JHM5kXqr78Ik2sBeGJpYHcz+HtYo3YaJJNx2wAsqeUpXoyfd7Te
	 ryS1gLGtcGklg==
Date: Tue, 4 Feb 2025 11:31:15 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: 1534428646@qq.com, catalin.marinas@arm.com, mark.rutland@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: kprobe: fix an error in single stepping support
Message-ID: <20250204113114.GC893@willie-the-truck>
References: <tencent_9DCAEBDF4D9BCDB4687B502DB6B608E4FB0A@qq.com>
 <Z4oNbOGSluJlwpvg@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4oNbOGSluJlwpvg@e129823.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_033121_350394_2E542A88 
X-CRM114-Status: GOOD (  30.66  )
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

On Fri, Jan 17, 2025 at 07:57:32AM +0000, Yeoreum Yun wrote:
> > It is obvious a conflict between the code and the comment.
> > The function aarch64_insn_is_steppable is used to check if a mrs
> > instruction can be safe in single-stepping environment, in the
> > comment it says only reading DAIF bits by mrs is safe in
> > single-stepping environment, and other mrs instructions are not. So
> > aarch64_insn_is_steppable should returen "TRUE" if the mrs instruction
> > being single stepped is reading DAIF bits.
> >
> > And have verified using a kprobe kernel module which reads the DAIF bits by
> > function arch_local_irq_save with offset setting to 0x4, confirmed that
> > without this modification, it encounters
> > "kprobe_init: register_kprobe failed, returned -22" error while inserting
> > the kprobe kernel module. and with this modification, it can read the DAIF
> > bits in single-stepping environment.
> >
> > Fixes: 2dd0e8d2d2a1 ("arm64: Kprobes with single stepping support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yiren Xie <1534428646@qq.com>
> > ---
> >  arch/arm64/kernel/probes/decode-insn.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kernel/probes/decode-insn.c b/arch/arm64/kernel/probes/decode-insn.c
> > index 6438bf62e753..22383eb1c22c 100644
> > --- a/arch/arm64/kernel/probes/decode-insn.c
> > +++ b/arch/arm64/kernel/probes/decode-insn.c
> > @@ -40,7 +40,7 @@ static bool __kprobes aarch64_insn_is_steppable(u32 insn)
> >  		 */
> >  		if (aarch64_insn_is_mrs(insn))
> >  			return aarch64_insn_extract_system_reg(insn)
> > -			     != AARCH64_INSN_SPCLREG_DAIF;
> > +			     == AARCH64_INSN_SPCLREG_DAIF;
> >
> >  		/*
> >  		 * The HINT instruction is steppable only if it is in whitelist
> > --
> > 2.34.1
> >
> 
> Thanks to correct me. yes the comments seem conflict.
> 
> However, I couldn't agree to this change.
> As I mention in last, when single-step runs, all DAIF bits set,
> so, the result of reading DAIF is different between before install kprobe and after.
> Also, I think reading some sys_reg in single-step seems ok (i.e. SYS_MIDR_EL1).
> 
> Therefore, allowing only install kprobe on DAIF reading doesn't seem
> correct.

Right, the code seems ok. I think we should just remove the comment
instead.

Will

