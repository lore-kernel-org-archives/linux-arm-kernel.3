Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFA1C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IF+8Y5XDtCDzaYIkXfRn+LH/SIQenJqpfbsdfUWufDI=; b=v7uD5tOjU22fIYcGYK6SnhG+hg
	/pFjSA/GKri/8Pd+d/c2cIJsBMP0h4lBWQNNWUnMwwAjoifBZzUItVS9+SprjD5WvhqwGDPKGZQwR
	m3ekt6Zvq5Ns7lNElNJC9sj4Er0hmgUR5elSwsmtjaWgPMhCJOru7MoNj0s1bcGwMG1ph8w3XnLo4
	DWbUEgL0KuCK1qq9WYPD4Yc26eQYFp54chJlt1PYK7NNd5WnInHQBui1wDVIzbG0cncmjwKNQR5kQ
	e5rsE/KyLXJfP92aj2rImTLbANjLsEsiAFqw4G3arI290nXdVQz/+JIV9x9SsvssMCLViP3dMB2yu
	9kaJxZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3fp-00000009rwv-27wj;
	Mon, 19 May 2025 16:49:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH32e-00000009k8E-2WI2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 16:08:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 54AB75C4B2B;
	Mon, 19 May 2025 16:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93023C4CEE9;
	Mon, 19 May 2025 16:08:38 +0000 (UTC)
Date: Mon, 19 May 2025 12:08:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Will Deacon <will@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>, Gabriele Monaco <gmonaco@redhat.com>,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 17/22] arm64: mm: Add page fault trace points
Message-ID: <20250519120837.794f6738@batman.local.home>
In-Reply-To: <20250519151238.GB17177@willie-the-truck>
References: <cover.1745999587.git.namcao@linutronix.de>
	<554038c996662282df8a9d0482ef06f8d44fccc5.1745999587.git.namcao@linutronix.de>
	<20250516140449.GB13612@willie-the-truck>
	<3E29A42D-8A6A-4342-8C60-2BEF1EDCD640@goodmis.org>
	<20250519151238.GB17177@willie-the-truck>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_090840_693602_DDA67038 
X-CRM114-Status: GOOD (  17.16  )
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

On Mon, 19 May 2025 16:12:39 +0100
Will Deacon <will@kernel.org> wrote:

> > Perf events work for perf only. My question is why isn't this a tracepoint
> > that perf could hook into?  
> 
> Well, the perf event came first in this case, so we're stuck with it :/

I wonder what effort it will take to convert perf events to tracepoints ;-)

Note, I'm talking about tracepoints and not trace events, where the
latter is exposed to tracefs and the former is not.

> 
> I was hoping we could settle for a generic helper that could emit both
> the trace event and the perf event (so that the ordering of the two is
> portable across architectures) but, judging by Nam's reply, the trace
> event is needed before kprobes gets a look in.

Perhaps we could add a helper function that does both (perf and
tracepoint) and hide the implementation from the code that calls it?

But I'm currently still on PTO so I haven't looked at the details yet.

-- Steve

