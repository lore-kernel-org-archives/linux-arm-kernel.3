Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193A4C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 08:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9rImqOZYxW/Y7p2XqfqdbkCpnJ/cVRl8HaY9TTxejo=; b=njM9NTJyKNmKk/JsctjKYy7jcn
	zCjcsMuUhhqRP76syiYyeemMER8lTnw//wJYxK4szgt9uPI3O1lt55YiKB5kaVhx9dpOO0szj825B
	hGd8axGLCD1dX+7YVJ3kgYfYp5NryKGDYL5L0KEA2GOYf3qGlHLOxK99RfjtaymhRhORZ3+F79YK/
	LvaAUgOoFvqEInbuF9Y0pRwsT0BIHA7DkvvBivd/dPoZ5CtJxCdHKwSAYwM68wKCyt84prPWJcs7a
	JM+BPpw60paYZyQjTe6tXb5ibrZpr0QbvSSy0yteJduGp5yFdYSGZnuwp8XoGk5Z2KBSTib04Evvs
	R4vDT0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqNI-00000002qDx-1tra;
	Fri, 16 May 2025 08:25:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqK9-00000002olU-0Pbc;
	Fri, 16 May 2025 08:21:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7B185C4A4F;
	Fri, 16 May 2025 08:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA9CC4CEE4;
	Fri, 16 May 2025 08:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747383703;
	bh=rSp1lfbQL3HqFGs8Qxo+9gIOoVGubU2xru7Z0ayuSa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khjJJ4Y9oh6fHJXx5oXsnkK/z+Bp0SEf0wsA33MAPawNxml0laU5uzOmMoWVpY7Ln
	 Gj3Tl2iBJJVkNddWg5xRz73uzR1vSwWG4F7zjN7TVXXx0U88dj3I//4vJV2Keeya8b
	 NnCjnxILnaIikCCPvaUJYjQNYE3RUNtG1yf3W4yTeMhbcnVe8u4qKQ+5VFCxZvNGmy
	 l1hPm/Vgtim5RdnJXDS+rgS3ZWBbEDJ6i1l7pLe6Ie0t1y4iKtG6B4B14Ir3AUViOH
	 F5LQeF7RNHt/8g7ZAb5Xe5cHwO+8ba2zzrlDsweh632bqVboRtrgeDnyy/lRrplA02
	 vObKzuweIWSsg==
Date: Fri, 16 May 2025 10:21:36 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	john.ogness@linutronix.de, Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 00/22] RV: Linear temporal logic monitors for RT
 application
Message-ID: <aCb1kBEkiriPbMo4@gmail.com>
References: <cover.1747046848.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1747046848.git.namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_012145_179979_83C6970F 
X-CRM114-Status: UNSURE (   6.08  )
X-CRM114-Notice: Please train this message.
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


* Nam Cao <namcao@linutronix.de> wrote:

> Nam Cao (22):
>   x86/tracing: Remove redundant trace_pagefault_key
>   x86/tracing: Move page fault trace points to generic

Does the renaming of the tracepoint class from 'x86_exceptions' to 
'exceptions' have any negative effects on tooling?

Thanks,

	Ingo

