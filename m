Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C485DC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 19:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+6pubNA3z8OlwJ0JeraUTqnIErpSVkv3K1mBT3spn0=; b=lfCWuofd/A3LnOl1W37uWUch/8
	paKTAH18oj0tCjZsyCsMKRN7245UsVnPR+VIcpDWqhje+Lhao/kDSNzv4/loYVl8AgG3ZJUVWOSiX
	fur3ZW2vCFdc89ym0erYbryz0C+U6i7vlMP7AIfDXvnCZFqkisu2kbGkpQl/I1ZpBus7e2dXZUyXA
	T3DVNmpcGPh5XcYDVp3gD5DtwWLMNeMyjW2eg4sZC5/k45WJINPaow1oCt7zWqZVVGU0keMnu/NWG
	enkDZRp1O15VLE7SXrKmQ3satlfUYdKAVocgaGFRJQm93fmDFmA9lpNl91xX95bv2WQ5rEW5y5krt
	6MOyMdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uACyb-0000000DnAS-1MCv;
	Wed, 30 Apr 2025 19:20:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uACwg-0000000Dn0Y-0Xhn;
	Wed, 30 Apr 2025 19:18:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 365A768496;
	Wed, 30 Apr 2025 19:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59515C4CEE7;
	Wed, 30 Apr 2025 19:18:10 +0000 (UTC)
Date: Wed, 30 Apr 2025 15:18:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Nam Cao <namcao@linutronix.de>, john.ogness@linutronix.de, Petr Mladek	
 <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Ingo
 Molnar	 <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav
 Petkov	 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin"	 <hpa@zytor.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra	 <peterz@infradead.org>, Catalin Marinas
 <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/22] RV: Linear temporal logic monitors for RT
 application
Message-ID: <20250430151813.0ec8f762@gandalf.local.home>
In-Reply-To: <cbcefdb80d5e10b8fed80de17bb97bf61df81386.camel@redhat.com>
References: <cover.1745999587.git.namcao@linutronix.de>
	<cbcefdb80d5e10b8fed80de17bb97bf61df81386.camel@redhat.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 30 Apr 2025 14:17:30 +0200
Gabriele Monaco <gmonaco@redhat.com> wrote:

> Steve,
> 
> >From my point of view this series is ready for inclusion, what do you  
> think?

I haven't had a chance to look at it yet. I'm finishing up some deferred
unwinding work, and then hopefully I can take a deeper look.

> 
> We may still need Acks from the x86 and arm64 maintainers regarding the
> tracepoints changes, though.

Yeah, probably want to start pinging them.

-- Steve

