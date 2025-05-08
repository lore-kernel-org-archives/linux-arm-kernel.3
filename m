Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748F7C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSvSLrCAEssZ/uT7sdMRZjShs4Zahuwya6ZebO2Ag2s=; b=kq/DdFnggQ7rKCAAMecBbr1TX7
	YVqtvRqKYAdRfiVoesoDtHp3B8BURFkr4EBgNH/mrEC3ZlqwO2K/NiULx3SjaC3N0wtBEGSiKWYJU
	73CQ1QRBVJ/v6yiMWKVz8CLB9+tPHpP5l5pmQBUy05/YxvP24hCif23wDS/HezQOjsso4p9XbjA3n
	B8R0cNR/2rUTuji1apwjlIunVCB7QnQRTBEjPkR49DLx/p/XkwL2Bz1G8uVcXn0JR+Av4LJo1v1PN
	CBox0CSZhmf8I+FBgfaP3t8fgG/r0/wKNf8bMmuGGxknbBisi4Ps5QYxWL1BCF0khMimaxlmmDp+c
	7RVsd0iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyZQ-00000000OAx-0NwM;
	Thu, 08 May 2025 10:33:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyXS-00000000Nx9-46rg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:31:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 15504629EA;
	Thu,  8 May 2025 10:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E54DC4CEE7;
	Thu,  8 May 2025 10:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746700297;
	bh=TOs0+EfuIbUb4A/7gCHeLPblZVir21KABVeEtpvmoGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7CMJ7Q9s0rWvTCTM+a0VjX8k6OAZjVa70NJZA11e+BKtk0iYXtIMkCS601RWXOWM
	 uUHVje/3pATPwDD7Bp35/IdT3rWSI3DHBz+3D9qYxAQljEQrkBs2oXjHh/h2ckaWhM
	 C/tv0pD8QAcHQcqmnAg9V9H0ClQED35KHxERHG4tQ8BUjRX/xCj005mA0JLxhvKRsK
	 kRUAybSQ6FZZyTOIdysBgJ+Ej8+oNR6BNG65W8zDUg83W/Io3LigFJBPWbwQ0yu8Lg
	 zMPYRKmJ/s36N/+1PewNms29BN+cs4A4hXpxXIcVxpWux46+b476nU9C0qiYSOo8De
	 3iiQGbnZ45vHA==
Date: Thu, 8 May 2025 11:31:32 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, daniel.kiss@arm.com,
	david.spickett@arm.com, luis.machado@arm.com, maz@kernel.org,
	richard.sandiford@arm.com, sander.desmalen@arm.com,
	tabba@google.com, tamas.petz@arm.com, tkjos@google.com,
	yury.khrustalev@arm.com
Subject: Re: [PATCH 15/20] arm64/fpsimd: ptrace/prctl: Ensure VL changes
 leave task in a valid state
Message-ID: <20250508103131.GA3353@willie-the-truck>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
 <20250506152523.1107431-16-mark.rutland@arm.com>
 <20250507161246.GB2580@willie-the-truck>
 <aBuT7yS1CYsqOJNM@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBuT7yS1CYsqOJNM@J2N7QTR9R3>
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

On Wed, May 07, 2025 at 06:10:07PM +0100, Mark Rutland wrote:
> On Wed, May 07, 2025 at 05:12:47PM +0100, Will Deacon wrote:
> > On Tue, May 06, 2025 at 04:25:18PM +0100, Mark Rutland wrote:
> > > +	/*
> > > +	 * Always preserve PSTATE.SM and the effective FPSIMD state, zeroing
> > > +	 * other SVE state.
> > > +	 */
> > > +	fpsimd_sync_from_effective_state(task);
> > > +	task_set_vl(task, type, vl);
> > > +	kfree(task->thread.sve_state);
> > > +	task->thread.sve_state = sve_state;
> > > +	fpsimd_sync_to_effective_state_zeropad(task);
> > > +
> > > +	if (type == ARM64_VEC_SME) {
> > > +		task->thread.svcr &= ~SVCR_ZA_MASK;
> > > +		kfree(task->thread.sme_state);
> > > +		task->thread.sme_state = sme_state;
> > > +	}
> > 
> > I'm probably just missing something here, but how does this address
> > problem three from the commit message where exiting streaming mode
> > should zero the bottom bits of the vector registers?
> 
> The idea is that we no longer exit streaming mode, so we don't need to zero the
> bottom bits.

Argh, I mis-read the svcr manipulation above as clearing SM rather than
ZA. Now that makes a lot more sense, thanks!

> Instead, when either the SVE or SME vector length changes, we
> consitently truncate the (streaming or non-streaming) SVE registers to
> 128-bits, but preserve the existing value of PSTATE.SM and the saved
> fp_type.
> 
> That all happens in:
> 
> 	fpsimd_sync_from_effective_state(task);
> 	task_set_vl(task, type, vl);
> 	kfree(task->thread.sve_state);
> 	task->thread.sve_state = sve_state;
> 	fpsimd_sync_to_effective_state_zeropad(task);
> 
> ... where:
> 
> * If the task's state was initially stored in FPSIMD format, the
>   fpsimd_sync_from_effective_state() and
>   fpsimd_sync_to_effective_state_zeropad() functions do not touch the
>   saved FPSIMD state, leaving the low 128 bits intact.
> 
> * If the task's state was initially stored in SVE format, whether
>   streaming or non-streaming, the fpsimd_sync_from_effective_state() and
>   fpsimd_sync_to_effective_state_zeropad() functions copy the low 128
>   bits into the FPSIMD storage, then copy that back into the new zeroed
>   SVE storage.
> 
> That's what I was trying to describe in the commit message where I said:
> 
> | To fix the second issue, we either need to clear PSTATE.SM or not change
> | the saved fp_type. Given we're going to eagerly allocate sve_state and
> | sme_state, the simplest option is to preserve PSTATE.SM and the saves
> | fp_type, and consistently truncate the SVE state. This ensures that the
> | task always stays in a valid state.
> 
> ... but I appreciate that mentioned the second issue and not the third.
> 
> I can add a note there, if it'd help?

Nah, I just need to learn to read properly.

Will

