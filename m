Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954AFCAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9jacP4P/Duq9l5cwxFOaVSNnVqCS6dI3Ee05XvEk+w=; b=X3LqUO1bEsHXTiXkRgu4nE8rvk
	5AqnGlH3yu5iosSNBpfjz4Fyr4OMT8lTdlWeAhIpvhV85soVOBk+YDUnIGuBHuQmai5yV4ClQ1kuM
	gNodfhB85dYQYiIAyVSr/NwJFOGf6qLUzfAMKJCKzxGwVQZLCTOQ5wKjgqIc1bpHKL6mHYfZhA241
	XP3YVXq/SR7YKJctlaxVN4goY1JMIuwq1PkoxQUbmAxRNix7dQD5ii3a6tsxNZ0xrI++Y381d84nn
	VA8Plb7KKYoF8alzA4VEai6J50lhmEFnimb4Ot5Dxv1qCKVSZtwY6t6NS96NAeac6JsrW6nDdofpR
	hec+qoVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgdY-00000001ZMl-2pa7;
	Mon, 08 Sep 2025 18:30:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvdZh-00000000LWE-1IQ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 15:14:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 390BB60054;
	Mon,  8 Sep 2025 15:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A432EC4CEF1;
	Mon,  8 Sep 2025 15:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757344471;
	bh=IzhdzQ/XwzF74jZ9kNMkQ6PFCLa7d0zl6A132VmFmLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kW16PQqPNLyeSsik9rz7Lz5XylRtF9Pasf6tMiW4lT/OoVb+cnP9hpWJUrr8k9gEd
	 Mk0ycQhVq4Srph58ehHMQzi3fj72zo7CBZQG0D5OV/Yi9972uIcSAzky1ObAc7MCn5
	 tj9bfr8r8EoMnzaAnKY4Rc4vNXequurLx+h5uqzrpSIpOnfddYY2y5Ty49RhMDmsl3
	 nPnjzh6fWpEHE1mZLAsjSZiQlMB0gj8PkzUduYRuip4A2F1bhwmDRDia1udpviRXqD
	 O5qjFHdN7VQwLZ0sC4V2p3L2cIhU5Vek9tRpnn4YZqzOURQgrBisvbtJVNc/dkQAVe
	 s5vLSgIvt+UDQ==
Date: Mon, 8 Sep 2025 16:14:27 +0100
From: Will Deacon <will@kernel.org>
To: Bill Tsui <b10902118@ntu.edu.tw>
Cc: oleg@redhat.com, linux@armlinux.org.uk, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: ptrace: fix hw_break_set() by setting addr
 and ctrl together
Message-ID: <aL7y00ggniiCTpZS@willie-the-truck>
References: <20250824124317.390795-1-b10902118@ntu.edu.tw>
 <20250827014113.5852-1-b10902118@ntu.edu.tw>
 <20250827014113.5852-2-b10902118@ntu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827014113.5852-2-b10902118@ntu.edu.tw>
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

On Wed, Aug 27, 2025 at 09:41:11AM +0800, Bill Tsui wrote:
> PTRACE_SETREGSET fails when setting a hardware breakpoint on a
> non-4-byte aligned address with a valid length to a 32-bit tracee. The
> length should be valid as long as the range started from the address
> is within one aligned 4 bytes.
> 
> The cause is that hw_break_set() modifies a breakpoint's addr
> first and then ctrl. This calls modify_user_hw_breakpoint() twice,
> although once registering both suffices. The first modification causes
> errors because new addr and old ctrl can be an invalid combination at
> hw_breakpoint_arch_parse(). For example, when a user sets a hardware
> breakpoint with addr=0x2 and ctrl.len=1, hw_breakpoint_arch_parse()
> will first see addr=0x2 and ctrl.len=4 (the default) and return
> -EINVAL. On the other hand, if a user sets the same value to
> a breakpoint whose ctrl.len has previously been set to 1 or 2,
> it succeeds.
> 
> The fix is to set addr and ctrl in one modify_user_hw_breakpoint(),
> effectively eliminating the discrepancy in validation.
> 
> Signed-off-by: Bill Tsui <b10902118@ntu.edu.tw>
> ---
>  arch/arm64/kernel/ptrace.c | 34 +++++++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)

Given that:

  (a) This is a pretty niche interface (primarily/exclusively (?) used
      by GDB)
  (b) It's been like this for a long time
  (c) Userspace can work around the problem

I'm not sure I see the benefit of trying to handle this differently
in the kernel.

If somebody _does_ have the time and energy for significant surgery
on this code, then the best thing to do would be to remove the
indirection through 'perf_events' altogether. I did make a start on
that once but it's a thankless job and I got preempted by other stuff.

Will

