Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB42FE77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlgFLZ47hG/y4Rhe4mnhOq6ghFkX9AQ6jE3MadmcnSg=; b=iCso4ErEmSe9Lw6FqEHRagjtyJ
	fvUZyNag2bQ35EF5Zx0LBnwdCHQvsuG/mOmtxiDLEYPi6qdhAsJDHvEBVjYvgT2+6KOCA+2N849tm
	5VLeJ2P2G0lN9Ks+CSZSEFjQaOLaMS2/k1GUHxEPaKP7Qdo0tqnR60gOM/r8XbvwtGuiTZxnXVY9D
	+SyBcuaCTfil2n4L6ULqJvfC0oQw1r52aDBGWAgmiBDpS1I9rL8F0SRMTLz5oCKkwiGp50yISob/D
	bi7KiyNrTLoArvtcdET2aQHy9MhHpY0Ej09Bkrk03Xm76yfeKadqIbjD/CGQfmrir9gAtFCVXp5Sv
	FbUGRSYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOi-0000000GWs5-0Rso;
	Wed, 11 Dec 2024 23:45:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGQ-0000000GKv9-3Pyy;
	Wed, 11 Dec 2024 22:33:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B4C0CA41B16;
	Wed, 11 Dec 2024 22:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92BFC4CED2;
	Wed, 11 Dec 2024 22:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956381;
	bh=22J+gOpjU9cUBjJTCfbYoXOQOQ02vFL/kmDAmitv0Oc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nWKDnM8zbcIF2djxC8fiOIOI3aUWr7TPAJCWU7ymE3mh5w2HYnJyAIXKcD5Z/72Ik
	 RXR4O9F/aU40PoBXvJ7XQXthLV2s4bsqOgfr50SDKFPRdnN9Us4sRkg4wVPA1v1sWs
	 kmuwkRDqP/9t5kMphxqk619d2ax7wRCqOpRNHKzjgvwJVCBNZYsBwGByJZh6bRNViD
	 yrqc1wHdhtHkBz1Bsd0sAtAVRFHXuN3A8nyxlLFqzm4TGzLspNaCqc2nuGjGhk5Ngr
	 pRCorRCtj+x28DI2Z1vxcZ2g3p4dEWd2sTvDRfb/s5xPU/4+C8mw0GfDgU2OE3HHnZ
	 3Ww2yKRibpabg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACB2380A965;
	Wed, 11 Dec 2024 22:33:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] ftrace: Make ftrace_regs abstract and consolidate code
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395639774.1729195.5975449690225774291.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:17 +0000
References: <20241008230527.674939311@goodmis.org>
In-Reply-To: <20241008230527.674939311@goodmis.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, x86@kernel.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com, mark.rutland@arm.com,
 catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@linutronix.de,
 mingo@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143302_918044_0BD22DF1 
X-CRM114-Status: GOOD (  12.65  )
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Steven Rostedt (Google) <rostedt@goodmis.org>:

On Tue, 08 Oct 2024 19:05:27 -0400 you wrote:
> This is based on:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/
>      ftrace/for-next
> 
> ftrace_regs was created to hold registers that store information to save
> function parameters, return value and stack. Since it is a subset of
> pt_regs, it should only be used by its accessor functions. But because
> pt_regs can easily be taken from ftrace_regs (on most archs), it is
> tempting to use it directly. But when running on other architectures, it
> may fail to build or worse, build but crash the kernel!
> 
> [...]

Here is the summary with links:
  - [v2,1/2] ftrace: Make ftrace_regs abstract from direct use
    https://git.kernel.org/riscv/c/7888af4166d4
  - [v2,2/2] ftrace: Consolidate ftrace_regs accessor functions for archs using pt_regs
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



