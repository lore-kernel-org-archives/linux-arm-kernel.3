Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CDCC55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERI1gHu1ms36w+mxgUEFv8xH+Yv4k3d6pfZyWzwl/B0=; b=1+9fvTWLkKTKYGV+p5VcWvylSD
	OR11iiBTZW4QUh6vfee6P1o1BWkbwpTMeMvWaXpXk1/C9+UYC4UDKXwUFtsWvSdAv4jUiIyvvIksQ
	Qj0TUokUHkYEuxeTF9d2whaKOVpXYlFtYyQbw9HdM8nt+jZXJEMehj4knx0uBY65OxfD2T2YVT2qq
	ZctSO0/GeKWqBepW3idFwSjuOn1oOyyq6KP1Iqrwqjt/mJT2XkbwX71DZvxY8lU0CtoTeAvIcP4ZU
	RrfDpeKIHXgCS+AJnVbidc/IVY4IbxjV9cFe/NulQ87k+mkK+Wu6G/o1llE1KoGgKrs4p7xlBTtGF
	mRA8cfNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3n-0000000FbbZ-3rQw;
	Sun, 02 Aug 2026 12:12:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3m-0000000Fbam-3Arg;
	Sun, 02 Aug 2026 12:12:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD75760A79;
	Sun,  2 Aug 2026 12:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB231F00A3A;
	Sun,  2 Aug 2026 12:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672773;
	bh=ERI1gHu1ms36w+mxgUEFv8xH+Yv4k3d6pfZyWzwl/B0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=moL1kbL1EjVC+4aV1tYljS+vat4yBxBOLPZWMHIOGvwb9X11ezTHTNry1462MjzMX
	 u1qtB+oB1TRXkLQ3jJnRh21xZ2GsmM5Qjah2jG5qVhXCUsm3ZcRVRAYBed4xdbTyIq
	 Wz5ejFLh5ONo0jaacrWEQE/NZIrbqAsavRlAg4i1aP5s9bsVRb0f6Fs3icy5d8hsUK
	 9J5/GmSKTgvwNClS4lbdUS7fMcKgYEVr/n0KeXgTKKQ9aGGH/kFn6hDCT0ZATplh7o
	 pB4RtQhvE9sA/7jOsKnHiBO17ic/xEt6WzVvsPoOxeK2OTIMtl+oEqbMwXYUXi6pH9
	 qxQm5QwThfQxQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>,
	Kiryl Shutsemau <kirill@shutemov.name>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Usama Arif <usama.arif@linux.dev>,
	Breno Leitao <leitao@debian.org>,
	Julien Thierry <julien.thierry.kdev@gmail.com>,
	Lecopzer Chen <lecopzer@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	kernel-team@meta.com,
	kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>
Subject: Re: [PATCH v5 0/4] arm64: cross-CPU NMI via SDEI
Date: Sun,  2 Aug 2026 13:12:23 +0100
Message-ID: <178566246667.4129492.14709532740498428415.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782744912.git.kas@kernel.org>
References: <cover.1782744912.git.kas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 29 Jun 2026 16:07:14 +0100, Kiryl Shutsemau wrote:
> A class of debug/observability features needs to interrupt a CPU that has
> its interrupts locally masked: the all-CPU backtrace behind sysrq-l /
> RCU-stall / hung-task / hard-lockup dumps, and crash_smp_send_stop()
> capturing a stuck CPU's state into the vmcore. On arm64 these need a
> mechanism that reaches a CPU spinning with DAIF masked, which a normal IPI
> cannot.
> 
> [...]

Applied to arm64 (for-next/sdei), thanks!

[1/4] firmware: arm_sdei: add sdei_is_present()
      https://git.kernel.org/arm64/c/5686f2bed02d
[2/4] firmware: arm_sdei: add SDEI_EVENT_SIGNAL support
      https://git.kernel.org/arm64/c/9141eda9eec7
[3/4] drivers/firmware: add SDEI cross-CPU NMI service for arm64
      https://git.kernel.org/arm64/c/0c2c56598cc1
[4/4] arm64: escalate smp_send_stop() to an SDEI NMI as a last resort
      https://git.kernel.org/arm64/c/d639f7626292

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

