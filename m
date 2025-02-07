Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AFDC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHEDzZ0hS5LrvQO5baumOg+GLTrYDHEAWxeEwvXbDhM=; b=OnzPAaOcnHGaCY6DDhsnsmNuCc
	kEn9P2U++bt7cPnQGV/zASGCFCq/XHzNbqNHCYF9OXTd1W9yD4gZBtpCa8vhgpKPCscvPgkD4XvTg
	DIeXcaVJYD4mONt6AIvFVj+flV5Y5cRGa3I2cJCNPDjlNvXpCUJn8uweS66SnQ/6BvJ5W2d9HfDvC
	L3PezXbVfIDD5ziwWVEnSo6TFkrlzQqY+tqn04zeGjlPBIDx4/ddFaovyPUdgnQzcPLMRwjXXcxLm
	DswSKLMAyw6wIlKxOXS8B7qkpIQzaJ1AnnlPq1ENZZxSHc4clsJyuC9OmZUN55ySnF3kmijeo++HP
	JVN7pOqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSmS-0000000Ackp-1fpB;
	Fri, 07 Feb 2025 18:08:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSg2-0000000AbWu-1t2a
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Feb 2025 18:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AHEDzZ0hS5LrvQO5baumOg+GLTrYDHEAWxeEwvXbDhM=; b=DNrW19+uKk3w/+Y8t9EeOif0Ln
	0WdnF9qmy5ix3iLoMudLaXzq7sXwhhewdD+R4f7K9I/UWfXkkke3uliyZHvYRdVXrT9xKd/4HLw69
	TZsMtKv4Ev/EthMu3i9HYf7mS4Y3YfQ5bu4++pitwOir/qSILqmXbWv6tk6c5xvmiq8Omamg9nxjJ
	tTjBVL+EgH32Ztf9Z5NLr/n+rUQnAQx1Uh7lv+OVsDxNimJWjJXoFXZYAzbznkqZFQfNqtuapAnE5
	4M/JHbOTirGuvWWjtMM8Q9SZBfdbUDkYkoGXD6CpZbkFevtnqFqQ2PMNakLo94s2B1MReKUBzcY3A
	AvtQzjOw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSfz-0000000HHHX-0xm1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 18:02:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C0215C5633;
	Fri,  7 Feb 2025 18:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC02C4CED1;
	Fri,  7 Feb 2025 18:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738951319;
	bh=1d6FcR1MsuxyT9npMdDyYCQ3GcBkzXyhynsiiKzrzHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kx89Hbxu1wvihiHngrVL82NWGks1Q2DmwfZkp3jYn+QASb7FUTDYY9SsZ8Fb+7OS+
	 e47rHTq+CtVZ8O21OgTcVbBfj7w0+KozrlvPuSoSwNDdBqcZQLZbYZUzUqHKqDnlgT
	 KmPV+X46eTRwDHoop96D16YmrNuKMcDv+OHGTO63qnkUXj5QaQ4okBrp1E04XFtkPc
	 0bfwNWO7ZrpO1XVR/4o8qawoA0JhTTk8DHDZmGKZrVv182eUYmlUTvQiB43QfbHFZH
	 fdVzmJw5aa5j46yRqJt+GLCUpQ8qndx4bt2hq1AbBQLdakgADpbgESKtd7NqigE8et
	 KJOXxSgcuPe4w==
Date: Fri, 7 Feb 2025 10:01:57 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Indu Bhagat <indu.bhagat@oracle.com>
Cc: Weinan Liu <wnliu@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org, joe.lawrence@redhat.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] unwind: build kernel with sframe info
Message-ID: <20250207180157.j25afocbe2kkkbv3@jpoimboe>
References: <20250127213310.2496133-1-wnliu@google.com>
 <20250127213310.2496133-2-wnliu@google.com>
 <303e0c91-2351-4ccd-8948-b400ac5d2b7f@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <303e0c91-2351-4ccd-8948-b400ac5d2b7f@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_180203_553029_AEB2EA60 
X-CRM114-Status: GOOD (  13.57  )
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

On Tue, Feb 04, 2025 at 04:22:27PM -0800, Indu Bhagat wrote:
> > +++ b/arch/Kconfig
> > @@ -1736,4 +1736,12 @@ config ARCH_WANTS_PRE_LINK_VMLINUX
> >   	  An architecture can select this if it provides arch/<arch>/tools/Makefile
> >   	  with .arch.vmlinux.o target to be linked into vmlinux.
> > +config AS_HAS_SFRAME_SUPPORT
> > +	# Detect availability of the AS option -Wa,--gsframe for generating
> > +	# sframe unwind table.
> > +	def_bool $(cc-option,-Wa$(comma)--gsframe)
> > +
> 
> Since the version of an admissible SFrame section needs to be atleast
> SFRAME_VERSION_2, it will make sense to include SFrame version check when
> detecting compatible toolchain.

Also, Jens pointed out that checking for '-Wa,--gsframe' isn't
sufficient, as it still succeeds for architectures that aren't yet
supported:

  https://lore.kernel.org/b89bcb68-d010-4041-aacf-15b934675705@linux.ibm.com

so in my patches I have:

config AS_SFRAME
	def_bool $(as-instr,.cfi_sections .sframe\n.cfi_startproc\n.cfi_endproc)

Though I'm not sure how you would add an SFrame version check to that.

-- 
Josh

