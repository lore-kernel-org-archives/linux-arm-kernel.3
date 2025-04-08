Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E80BC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epFMM6E3b5n0AAjQqhCMwFutqLu+axl/bDlyBr62jpM=; b=AXBk5n624I0XWnYVHCFBF1meFj
	2zW3V0YKvcZOcJnOZbjD9DMrYgDPEVJruwdyan3t67dntjEe6617X+3CUWfaL6wt5QlVyYujpm6mP
	13YE4+wFbXlMrC9kkne/hLycEo/ekrJD7yNDTnB7WCjjeOprbvSIOdDMGFoFt7a+aWSff3ChIeWgR
	bHGtggxxncnUM7QZp1gHB+CcRJSjn4pH3QZnOd9nKmDbtnl7zkjmxvEjoJYtgooGMtkS4kfyKEqda
	4zslcHk8iWQgsc6WvtO2cQz2H2lr9IrxQkl1k6KQlQEfTkGVshTGoTLmzpmBSEGdO+aZ+g2m0Ewpr
	0S3gvV6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25bj-00000003Vmo-1Rep;
	Tue, 08 Apr 2025 09:51:03 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Mn-00000003T5R-3Wdu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 09:35:39 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7B98F1F9BC;
	Tue,  8 Apr 2025 11:35:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744104935;
	bh=epFMM6E3b5n0AAjQqhCMwFutqLu+axl/bDlyBr62jpM=;
	h=Received:From:To:Subject;
	b=kRPeka47FL9mUb/LiDd/KpngGvLjxHugS25K7j24KcMayZUKVJPhJdJic4fXTaRVi
	 fPOKGwxQ9qqLyl/6RhA+Mkw+mSUUotd/VLHTPRETb8/UwuMohmuRXW2/8U1bs6f4VH
	 Oi86j2bfeCOn5i5AOeFvnjiAxLLKcY1NZFy8sbaYmOVOVxEuQogIE6orN3NX/x1J8h
	 YqBnKXKQ9DHpF+MV9LJeyRylGN9US8ePAGtJBC4+Ph1R1G+T1m6qPROnW/SZtOPqNl
	 HOkkaWNeoZ7K7vLm7xW/IvqQLofWQOA+ODX83FJvJAcIHsqOYm8yU5rO7K+M2NBmFz
	 tJS0d65nIZHLw==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 328987F8D5; Tue,  8 Apr 2025 11:35:35 +0200 (CEST)
Date: Tue, 8 Apr 2025 11:35:35 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	Neeraj Kale <neeraj.sanjaykale@nxp.com>, Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Kernel WARNING (RCU) with btnxpuart on TI AM62 platform
Message-ID: <Z_Tt58Ar9TAUy4gB@gaggiata.pivistrello.it>
References: <20250408083512.GA26035@francesco-nb>
 <a8e7171b-d859-4611-9681-e4c614f29d64@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8e7171b-d859-4611-9681-e4c614f29d64@molgen.mpg.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_023538_035064_F0572CB5 
X-CRM114-Status: GOOD (  15.89  )
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

Hello,

On Tue, Apr 08, 2025 at 11:26:47AM +0200, Paul Menzel wrote:
> [Cc: +regressions@]
> 
> #regzbot introduced: v6.14..v6.15-rc1
> 
> 
> Thank you for your report.
> 
> Am 08.04.25 um 10:35 schrieb Francesco Dolcini:
> 
> > I do have the following kernel warning with 6.15-rc1, on a TI AM62
> > platform (arm64), single CPU core, using btnxpuart driver, any idea?
> > PREEMPT_RT is enabled, if it matters.
> > 
> > Either the issue is not systematic, or multi cores SoCs are not affected
> > (no error on the exact same image on a dual nor on quad core TI AM62).
> > 
> > 
> > [   23.139080] Voluntary context switch within RCU read-side critical section!
> > [   23.139119] WARNING: CPU: 0 PID: 61 at /kernel/rcu/tree_plugin.h:332 rcu_note_context_switch+0x3c4/0x430

...

> As I understood, that it’s a regression, and you can reproduce it, would it
> be possible, that you bisected the issue?

I am not sure if this is a regression. It's possible that the issue is not new,
and it is just non systematic. For sure it was reproduced by our CI on v6.15-rc1.

Francesco


