Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935CECD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGPf2M3vKWJJvTEOjgI7sO3PUfdpRBgFDGeky9IGVdc=; b=1A8O9Y2LAfEnl1RI38LT7H2+sR
	pb3FXaFdFxxx57zQu5dtDaeIyGG2UPyRuNuduEP5BjbljmXfb5hRJELcgZSYHCmRE0+ULmensxyX2
	IrOgrWjFfibhmS4mtzh2jLYoRoAk2OnqzMoBJBGm6cJKwEmx2eKb2K3+KbAEzSRdEa82bKqkVQRCl
	RgX5RVSWH8urdHDwUVeLwfYDxswIwzTJcviPff0uyy+aicVjRuu1w6d1HBiaR5flTnO4HbJUxH4c/
	cVU18AL9py/dtBcAAMU5pqf1qpJzPPZqLiZhFBgOjCgmX/EN0TsfogNu2pe6y1Tm3uHMtx+TMw33D
	zJyf3BWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYQl-00000005cfg-1lY7;
	Thu, 28 May 2026 10:57:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYQj-00000005cf6-33uA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 10:57:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CF1AD60126;
	Thu, 28 May 2026 10:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9041F000E9;
	Thu, 28 May 2026 10:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779965856;
	bh=kGPf2M3vKWJJvTEOjgI7sO3PUfdpRBgFDGeky9IGVdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lWhGw4cz3l6efjD2+vZ+kwl/8VpPHfeZ9XrOsIo2LtmMepiU2HsD8vW6MQLWpxKgO
	 +Wq0/curoqJR69djSFeCsUu+mBXsDXmsCF2K8ZBziZB2/3im/GPSc/cGwgr7O26/cQ
	 wooOMI0B8/aWFoHdE0WrDpJWLrKWou5HOZcBwhC3vAYpnmE+cyACjgtzyb2Vgj/h/5
	 5lKJcxVMPGrGIQjt/7RihfA1CIZO3BAfYWBEm0+hxUACnkK1skvU31gBhjWAiXCYQg
	 euxAW9z0oE20ZLuJ0N35dFcCl4iywc1cYzPdWpiyNy55XcgG7V3x8mNxQenp6kVzmf
	 fjCNaED3oeRzQ==
Date: Thu, 28 May 2026 11:57:31 +0100
From: Will Deacon <will@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/6] arm64: hw_breakpoint: Add
 lockdep_assert_irqs_disabled() on install/uninstall
Message-ID: <ahgfmyZtPL5YPRCZ@willie-the-truck>
References: <20260407-arm-debug-8-9-v4-0-a4864e69b0ea@kernel.org>
 <20260407-arm-debug-8-9-v4-3-a4864e69b0ea@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-arm-debug-8-9-v4-3-a4864e69b0ea@kernel.org>
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

On Tue, Apr 07, 2026 at 09:29:45AM -0500, Rob Herring (Arm) wrote:
> The breakpoint install/uninstall/restore code depends on interrupts
> being disabled. Make this requirement explicit with a
> lockdep_assert_irqs_disabled() assertion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/kernel/hw_breakpoint.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
> index bb39bc759810..a9266dc710b4 100644
> --- a/arch/arm64/kernel/hw_breakpoint.c
> +++ b/arch/arm64/kernel/hw_breakpoint.c
> @@ -231,6 +231,8 @@ static int hw_breakpoint_control(struct perf_event *bp,
>  	enum dbg_active_el dbg_el = debug_exception_level(info->ctrl.privilege);
>  	u32 ctrl;
>  
> +	lockdep_assert_irqs_disabled();

This function (hw_breakpoint_control()) is static and only has three
callers:

  1. Via the cpu hotplug CPUHP_AP_PERF_ARM_HW_BREAKPOINT_STARTING notifier
  2. From arch_install_hw_breakpoint()
  3. From arch_uninstall_hw_breakpoint()

So if we're called with irqs enabled, the core code has gone very wrong
and I don't think we should necessarily be checking that in the arch
backend. We also already have a WARN_ON(preemptible()) in
{enable,disable}_debug_monitors() so if you really want to add this then
please can you spell out why you're specifically concerned about the
preemption-disabled but irq-enabled case in the commit message?

Will

