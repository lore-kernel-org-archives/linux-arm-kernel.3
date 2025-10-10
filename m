Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D12CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 01:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+s/WskmTv17rLtResFrutuMLn+Do/UoNghWJIECX3I=; b=W6AfkiCQP3JDFbINDKpq5smpez
	skOfbpm/5SNcMKbOaEBNGcWOTeSzeywlxjE/y9D7wC9OJ5xCVsOg7h6weWkLA3cOYwa9touEWx5V2
	qCUzX5TwWzmE9eToxLsRaeKHB0vObjEIeKFbU6zRhgJ7aUC53Iuw0F9V1giP1VEwb4wKb/fbIN9sq
	MqWqpXnVDf7Uc3NYWXdLgGLtPWjhkNpcV42sECbpULlcUQNrEtZ/xLQvn5UxJ/lfTeCWxX8WOiNYY
	M6CmbvnnwwwvZC9oSFJU/KkuBByQP/gv3ml11JB8FpnBgXuvUNsL5nCXkuUOaR/P1+iAUlecw866P
	b8m3jmwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v71zq-00000007RRu-2nPN;
	Fri, 10 Oct 2025 01:32:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v71zp-00000007RRj-0WhW;
	Fri, 10 Oct 2025 01:32:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 799E560145;
	Fri, 10 Oct 2025 01:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B54AC4CEE7;
	Fri, 10 Oct 2025 01:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760059956;
	bh=KPS3uZjL/nqDu+c8uW3Ba+heOFI7/b8h5gZFf0NzBoo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d5il7IH3Rn7Ej5PVeLqMJ3U50pUuHHxSkdMF0LTmPIzYEgo+ezeOsJnVT/yqURy26
	 DkG7jSHBW7WtPksGBe97EG+rgZ63H68sf0QE+ek0SEhF4YM7Zic0Tjp8G2lkSUe2TC
	 Si1bZVQx75CdDqJHIyjt3W4XQtxC5xx7vRvWle2Soqxgxokk5YIf5a2evqiQ7s6u6v
	 mHTkpiwqfr9ydQdjrm1y5Wiz/ptseDpJURvhFW83i2I/P6E3CoKE1DpFg6HjNLbGeH
	 XmTzGNS55Wf4YK8bkNEFwsUMdAoxSqMaD3540sKM/uoM56Y2M3jCpbtOts+nG0qucW
	 W5XtahZJZ1cCA==
Date: Thu, 9 Oct 2025 19:32:31 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
cc: Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    Himanshu Chauhan <hchauhan@ventanamicro.com>, 
    Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>, 
    Atish Patra <atishp@atishpatra.org>, 
    =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, 
    Yunhui Cui <cuiyunhui@bytedance.com>
Subject: Re: [PATCH v7 0/5] riscv: add support for SBI Supervisor Software
 Events
In-Reply-To: <20250908181717.1997461-1-cleger@rivosinc.com>
Message-ID: <86817f9a-c601-81e8-b95b-0f2396275f95@kernel.org>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1335458369-1760059956=:876438"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1335458369-1760059956=:876438
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

Hi Clément, 

On Mon, 8 Sep 2025, Clément Léger wrote:

> The SBI Supervisor Software Events (SSE) extensions provides a mechanism
> to inject software events from an SBI implementation to supervisor
> software such that it preempts all other supervisor level traps and
> interrupts. This extension is introduced by the SBI v3.0 specification[1].
> 
> Various events are defined and can be send asynchronously to supervisor
> software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
> as platform specific events. Events can be either local (per-hart) or
> global. Events can be nested on top of each other based on priority and
> can interrupt the kernel at any time.
> 
> First patch adds the SSE definitions. Second one adds support for SSE
> at arch level (entry code and stack allocations) and third one at driver
> level. Finally, the last patch add support for SSE events in the SBI PMU
> driver. Additional testing for that part is highly welcomed since there
> are a lot of possible path that needs to be exercised.
> 
> Amongst the specific points that needs to be handle is the interruption
> at any point of the kernel execution and more specifically at the
> beginning of exception handling. Due to the fact that the exception entry
> implementation uses the SCRATCH CSR as both the current task struct and
> as the temporary register to switch the stack and save register, it is
> difficult to reliably get the current task struct if we get interrupted
> at this specific moment (ie, it might contain 0, the task pointer or tp).
> A fixup-like mechanism is not possible due to the nested nature of SSE
> which makes it really hard to obtain the original interruption site. In
> order to retrieve the task in a reliable manner, add an additional
> __sse_entry_task per_cpu array which stores the current task. Ideally,
> we would need to modify the way we retrieve/store the current task in
> exception handling so that it does not depend on the place where it's
> interrupted.
> 
> Contrary to pseudo NMI [2], SSE does not modifies the way interrupts are
> handled and does not adds any overhead to existing code. Moreover, it
> provides "true" NMI-like interrupts which can interrupt the kernel at
> any time (even in exception handling). This is particularly crucial for
> RAS errors which needs to be handled as fast as possible to avoid any
> fault propagation.
> 
> A test suite is available as a separate kselftest module. In order to
> build it, you can use the following command:
> 
> $ KDIR=<build_dir> make O=build TARGETS="riscv/sse"-j $(($(nproc)-1)) -C tools/testing/selftests
> 
> Then load the module using:
> 
> $ sh run_sse_test.sh
> 
> A KVM SBI SSE extension implementation is available at [2].
> 
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf [1]
> Link: https://github.com/rivosinc/linux/tree/dev/cleger/sse_kvm [2]

I updated these to apply on Linus' current master, commit 5472d60c129f, 
cleaned up the checkpatch.pl --strict issues, applied Anup's pr_info() 
suggestion, and pushed them up here to make it convenient for folks to 
integrate and test:

  https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git/?h=riscv-experimental-for-v6.18

Am assuming you didn't have other changes that you wanted to make; let me 
know if that's not the case.

I noticed that you asked for folks to do additional testing, particularly 
of the SBI PMU driver integration, but didn't notice any additional 
Tested-by:s.  It would be great if other folks on the list could do some 
focused testing now, particularly since we're on v7 of this series, and 
I'm sure others care about this.


thanks,

- Paul


--8323329-1335458369-1760059956=:876438--

