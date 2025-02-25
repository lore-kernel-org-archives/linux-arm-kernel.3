Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0544C19778
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 19:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AkQ0PsS6aJD8LrYlatrod8Rv/cZV8YksHO9IjYOj5Q=; b=aq6SONwXHN6OhbDSYwip+VqAQc
	qNc+9/1TVKNe2WdMTNvyz15jZvaU1LPrF+p0pGpeay3TvON2RX8g61d4tRwspSzH7l95CnYzqEhGs
	4c7zK+qhvcqBDh/5Dq91FZNVk+QeVLb5kHkZnFDGkI+AMO+hkPIZ1CO18xq++OnvncVm/D9Hd1feT
	ucx3TqqYiAICxiGnr53j9lC0UkslllBkvWEYYtSU/nPY2l0uLuX7bjUmRBRmhTTWZe1bGlbqPTU9/
	7E2A3S8/fE/085MBJMEzpnZkU1+X3d8c+ODc0cH+/Vqi72GeEyx8wKR6VH9TsFibzel3dNuO8gCpZ
	ne2QJ8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn0eX-000000019Bq-3tCQ;
	Tue, 25 Feb 2025 19:31:37 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzR0-00000000rt7-0df2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 18:13:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EFBA612DE;
	Tue, 25 Feb 2025 18:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8443C4CEDD;
	Tue, 25 Feb 2025 18:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740507213;
	bh=ZzFdYCh6xQa9i+CIHhfThsw+bZbyS1sHK2XFoBGleJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kX0gXOLu16KMgEi+jJS/ZVk5T0TCTc6Rug7i7SXZVL9p8e+RKbd7io01p3UTanoup
	 6gTMvwfuX9icu/76GogUCV7BOm0Cad6toxuwKbXKKJyEyf7bgaatYBaSNrkzi699lA
	 BIibaMDx6gu5dDqvJw108cajGjlnetzHcjZoPXm+fhMW9xTk+dlk4raOIFUAn31NWf
	 DrP5BBBXe3EZmV6s9qrup391M4BkXwAoaagKgI1QSqbfubmwI1xs68wQnpb95+cXdB
	 zGoWCCifjG3VSw6O6rfQV/6lFv9z4nsdEV5TvGWESj/v4rTyujw1sY6X9zH0dGdpNS
	 e91IDQMjN/vhg==
Date: Tue, 25 Feb 2025 10:13:31 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Weinan Liu <wnliu@google.com>
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org,
	mark.rutland@arm.com, peterz@infradead.org, puranjay@kernel.org,
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <20250225181331.frmfumf4b5ctfbsm@jpoimboe>
References: <20250210083017.280937-1-wnliu@google.com>
 <20250225010228.223482-1-wnliu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250225010228.223482-1-wnliu@google.com>
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

On Tue, Feb 25, 2025 at 01:02:24AM +0000, Weinan Liu wrote:
> On Mon, Feb 10, 2025 at 12:30 AM Weinan Liu <wnliu@google.com> wrote:
> > I already have a WIP patch to add sframe support to the kernel module.
> > However, it is not yet working. I had trouble unwinding frames for the
> > kernel module using the current algorithm.
> >
> > Indu has likely identified the issue and will be addressing it from the
> > toolchain side.
> >
> > https://sourceware.org/bugzilla/show_bug.cgi?id=32666
> 
> 
> I have a working in progress patch that adds sframe support for kernel
> module.
> https://github.com/heuza/linux/tree/sframe_unwinder.rfc
> 
> According to the sframe table values I got during runtime testing, looks
> like the offsets are not correct .
> 
> When unwind symbols init_module(0xffff80007b155048) from the kernel 
> module(livepatch-sample.ko), the start_address of the FDE entries in the
> sframe table of the kernel modules appear incorrect.
> For instance, the first FDE's start_addr is reported as -20564. Adding
> this offset to the module's sframe section address (0xffff80007b15a040)
> yields 0xffff80007b154fec, which is not within the livepatch-sample.ko
> memory region(It should be larger than 0xffff80007b155000).

I assume kpatch create-diff-object needs to copy over a subset of the
.sframe section.  Similar to what kpatch_regenerate_orc_sections() does.

-- 
Josh

