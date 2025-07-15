Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAD0C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 15:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uou+fIcwU1PzEJVsXA6Ci3JWaoJkst6WSweOQ4OvZ2I=; b=xs5v0SyfW0RGSelk2oLoZHOu1x
	OUaAyJ6eLg1QYnWQERtldFxNW08UCh+K7+Y2KpOEzCoKHLKAGZS7jdos5k3ZiYaEk7m3R3lNO1DmH
	1D18FMi3SK3yLSQVSFxY/f1zNVMh2M/puJYWfETabyJyONmvk6PM+lJIoWJCym2VQQUhtShhcVEGE
	paEBaDzgWKouXDOUSxY9j0U4pylhn739WmDxJe9aYhRfeICkCUYUDsOKMKBNALi2BB6mP448cCuN0
	j7o0DIMkzT2ZPkIKMVPC5vKpq8S+H3IKiRS3T8Tx/cPI8/uS1VJtYJ8mJyJL2NHNhLfRSdpjOYzYi
	gyLsBWdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhiw-00000005cUi-3Mtb;
	Tue, 15 Jul 2025 15:37:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgEd-00000005In1-0xMk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88DF961456;
	Tue, 15 Jul 2025 14:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC23C4CEE3;
	Tue, 15 Jul 2025 14:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752588138;
	bh=d5BQBqrR42o5J743Ypk7CrVCgGVYQ58Kfjd6IBpO1Yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FVEgVSM5N26819X4lipZMDyMe34jGjFfmoBrXpftgAESk6apUITUs7awcXwXdVesY
	 MxvVDf0+0JH/bLMNI7vd1EBVTbImSlolEmzozleH423ApiR8OKHuLMz2TMF+hoPyc/
	 MDDAH6zKqXMImFGCdmA7p7e3C4rg/du2I5Dp6vb06npSYQ+YJq1PbrMe8CVJvxATsV
	 ODBo8ScygHfIFquS69M/XxBuF04M7RMkeGI2A2xzRvmXoOR2RLyFOg/sy5XGvxFeoW
	 9uQq6JqRz1h1E54NAbQUYzX8+iBoYQk1LU1cx2NKAbgH/h9rBjAOx/8TeN8ekAq20p
	 sn8FjH3qFsuFA==
Date: Tue, 15 Jul 2025 15:02:13 +0100
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, osandov@fb.com, leo.yan@arm.com,
	rmikey@meta.com
Subject: Re: [PATCH] arm64: traps: Mark kernel as tainted on SError panic
Message-ID: <aHZfZbxLGyFjJpNo@willie-the-truck>
References: <20250710-arm_serror-v1-1-2a3def3740d7@debian.org>
 <aHQ3Lu27_mLfR8Ke@willie-the-truck>
 <t3v2xvjal67bl5dwyatwgf46tnr2ikxnq62iqmda544llcd7oh@ws3nnrfp7r5p>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t3v2xvjal67bl5dwyatwgf46tnr2ikxnq62iqmda544llcd7oh@ws3nnrfp7r5p>
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

On Mon, Jul 14, 2025 at 05:26:43AM -0700, Breno Leitao wrote:
> On Sun, Jul 13, 2025 at 11:46:06PM +0100, Will Deacon wrote:
> > On Thu, Jul 10, 2025 at 03:46:35AM -0700, Breno Leitao wrote:
> 
> > > --- a/arch/arm64/kernel/traps.c
> > > +++ b/arch/arm64/kernel/traps.c
> > > @@ -931,6 +931,7 @@ void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigne
> > >  
> > >  void __noreturn arm64_serror_panic(struct pt_regs *regs, unsigned long esr)
> > >  {
> > > +	add_taint(TAINT_MACHINE_CHECK, LOCKDEP_STILL_OK);
> > >  	console_verbose();
> > >  
> > >  	pr_crit("SError Interrupt on CPU%d, code 0x%016lx -- %s\n",
> > 
> > If we're going to taint for SError, shouldn't we also taint for an
> > unclaimed SEA?
> 
> Yes. I was not very familiar with SEA errors, given I haven't seen on in
> production yet, but, reading about it, that is another seems to crash
> the system due to hardware errors, thus, we want to taint MACHINE_CHECK.
> 
> What about this?
> 
> 	Author: Breno Leitao <leitao@debian.org>
> 	Date:   Mon Jul 14 05:16:55 2025 -0700
> 
> 	arm64: Taint kernel on fatal hardware error in do_sea()
> 
> 	This patch updates the do_sea() handler to taint the kernel with
> 	TAINT_MACHINE_CHECK when a fatal hardware error is detected and
> 	reported through Synchronous External Abort (SEA). By marking
> 	the kernel as tainted at the point of error, we improve
> 	post-mortem diagnostics and make it clear that a machine check
> 	or unrecoverable hardware fault has occurred.
> 
> 	Suggested-by: Will Deacon <will@kernel.org>
> 	Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> 	diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> 	index 11eb8d1adc84..f590dc71ce99 100644
> 	--- a/arch/arm64/mm/fault.c
> 	+++ b/arch/arm64/mm/fault.c
> 	@@ -838,6 +838,7 @@ static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
> 			*/
> 			siaddr  = untagged_addr(far);
> 		}
> 	+	add_taint(TAINT_MACHINE_CHECK, LOCKDEP_STILL_OK);
> 		arm64_notify_die(inf->name, regs, inf->sig, inf->code, siaddr, esr);
> 
> 		return 0;

Yeah, I reckon so. Probably just fold these into a single patch, though.

Cheers,

Will

