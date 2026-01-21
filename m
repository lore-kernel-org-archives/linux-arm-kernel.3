Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED1EC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=; b=oLnqS0mtKVYVp9wGxYoewbYQMj
	oqNRhvW0DEX/DL8LvScXJr7aXQM2u6Ti5acPN/baU5X/eZDORCRHEjFvJmv5nSx2QI5cUH7b0Y2Jk
	VAsWRwZ80gbrxhnH6eCCe/cHZFE+sUD7sjQMmYEFqb0rWyG1/gaEMfFKJUMiNBdaQzjcnhl9Ain0s
	NA5jDdxkc3v/6vgf+yA9s8oPYzl1gPLMMlsPuip+/OujIeMLyDwJv+4sWohhskBqs3EEvjKtHG5iT
	b1fr4LgdxGeD7UBED8WR7V8EY56BV8R+J6nCYT12gweUXxj1wmzMUeX2NlIYDogrQhDvd3KFZA6ab
	peMWwSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viX0D-00000005OIZ-2Wa7;
	Wed, 21 Jan 2026 12:08:01 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viX0A-00000005OHT-1sZ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 12:07:59 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-59b67388c9cso7934502e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 04:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768997276; x=1769602076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=;
        b=h9mj4dtKqFTvx2FuCfmbco2PD0VyJaEjKkb9jYRv9lrOtqAAATTjvaIVZ+Ntf859Am
         A4ya45CucLjW2O1iY55Etq5ELNPvZ+FL8Lm1YwRT0JML0jU6JkxcRQBcewWTHStV2hg/
         2MP0QKEAdeKOYx2PqfWP4NJKeQluHJ8aNq+/nzjoaimSsDDVjU+Aug/tE+jLkM65TYbq
         pSG+PhE0jfFfh2R3JrEByRQS4uLH7mFv89RnVwrYBxqqTySSQWxyJ7Folv9rsZvwX+t8
         ctcXDSfEKw7lAT3UlG3wPIopnzSyeSpLNC2s43BYDCJ1Jp6jj06zK1mMY2LE5Oe6JMhn
         IqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768997276; x=1769602076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=;
        b=C2GB6Aug0qI710aXh4jLl8befKYXUjbo/mgms0BrIOgcpHQSFM0bVrNe77oIVgFtAv
         n0FQes2kgM+p6VhpiKKNlDwyG2499Wd4ZE3/berpKF7DTrT0cV7XBm20UyC1pmpZ6gQ8
         APTxxUGwkLZfafmXQ7R5JUYTZdzxIcX9PUrVmA6zMVlGal8EHq95s9ASM5eFc1KBOzfb
         O5lpTXsExQ1xMN2a7olF1zQzZI3Srb3JSN5X68T1cLRwofQSlTK6UfQbGMRUyQNLmVLq
         Z5VtjNNv7C/TK/aQifefHZsRaqglPoTgj5MZMsdt99hz5VoA54GmYqhORdFzfHmenRP8
         9cPw==
X-Forwarded-Encrypted: i=1; AJvYcCW8OP+S2WI7z0CsX0kTZkEoLSJDYo94vFv8uyqvPQ0dr81Z+UBg68AXnoNdqpXM3jXRP0/n6D4224D3UzOruHQs@lists.infradead.org
X-Gm-Message-State: AOJu0YwN79VbAWlhzh/4ln+lNhaWJ9DWTxQqQzzK4B6zsKFp8Wfx7cdG
	g5x1qTGcgmjbgGygW3p/efMr0FZbIqPdrCKMnyig+qxuw8Mt41SRa2cP
X-Gm-Gg: AZuq6aLoZZTZW7r3uasjQdp2cFk+kZOBTPjcM6ifudfKSHflNC296g6gzeT8J5BLK9/
	WidB5BE55KXVBuMM1g1nwAWWfckv1Olt6W2/ScxDSAcYxbC9fYjROsQvsEzKJgQmfeOpbI9j/lN
	iiC8HxVtbGonFy6Dqt8Sh9QJzD3Fw71sqt6qPD4OP0RZvFZ4SFo19zW0+JwubZ6vGfDyN9rP5uQ
	5VI1sLoQZrE8ahxbMK2ERCP1pvAxnypqKdNjGLMJ03UCXq+ZGocQjyI2ahKBkhZUBJ8IcG3p9WB
	zJH4bMHpOCW9FwlKm/fXAJg/aHlsVcK/U67oWCYM6YVB7L3IssozDJgIJ2PNu/q2BAiHSWw10R5
	Hzmxts64N+8Oo5GYMUuTfmuKarBjcMOc5ooUhroi6cJZHPcsZUZkQqzMHpUCaUjvlgOYq2jKSGh
	fv7IQpp2c6tHd4NCJdB61oox7q3KDDPg+nfGgTWMVwwXFKcJWIEizY
X-Received: by 2002:a05:600c:8b55:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-4801e2fbd61mr238692885e9.1.1768990819461;
        Wed, 21 Jan 2026 02:20:19 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d77besm306630785e9.14.2026.01.21.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:20:19 -0800 (PST)
Date: Wed, 21 Jan 2026 10:20:17 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260121102017.539b5531@pumpkin>
In-Reply-To: <202601210752.6Nsv9et9-lkp@intel.com>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
	<202601210752.6Nsv9et9-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_040758_503153_E06FC7F0 
X-CRM114-Status: GOOD (  18.97  )
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

On Wed, 21 Jan 2026 07:50:16 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Ryan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v6.19-rc6 next-20260119]
> [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
> patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
> config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
> >> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section  
> 

When CONFIG_DEBUG_PREEMPT or CONFIG_TRACE_PREEMP_TOGGLE is set
the preempt_count_[en|dis]able() calls inside [put|get]_cpu_var()
become real functions.

Maybe __preempt_count_[inc|dec]() can be called (with this_cpu_ptr()).

	David

