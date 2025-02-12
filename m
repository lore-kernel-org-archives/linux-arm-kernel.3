Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E73C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFeMQxy6PYVXHCwRXmk0qpZO9ieonU2lLfeZXGIE6KA=; b=PdN6A7SxSUtsVl28ih/vyHzpeK
	vl6ztkfKWOxebaxhDcbh87dU/XVa+CHMu4ih4JY45fqlW4uDg0rwXmlSDLUH4CJuurSRXFE8VIaxF
	kz9TcGAUPVXurTEfwfOZd8RNS+GfKSFAijH5rMxVMQ1n0h3Qm/Vdp84+KQtz4AeYar4cpgZmIWtBr
	g9HmP0X7dP0bbKjPNBU1u7VcGB1ZMs1XUAiL+cCd4AtkHVQFhZFyXWNShauglgOFC2oENYG6Q5xuI
	ztbGUrePNqY1xCLJqev9wJK52xVPncqH1oRx9cTJyzRMPK56bvFpu1XBevYZZcGQAzX74BXV0ZyrK
	NQcOdixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHcK-00000008V8d-0SCl;
	Wed, 12 Feb 2025 18:37:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHas-00000008Uu2-2CoD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 18:36:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 799AD5C601A;
	Wed, 12 Feb 2025 18:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01928C4CEDF;
	Wed, 12 Feb 2025 18:36:15 +0000 (UTC)
Date: Wed, 12 Feb 2025 18:36:13 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Will Deacon <will@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v2] arm64: scripts/sorttable: Implement sorting
 mcount_loc at boot for arm64
Message-ID: <Z6zqHY0a5CPEaTCN@arm.com>
References: <20250211141139.03d2997e@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211141139.03d2997e@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_103618_604013_6D6518CC 
X-CRM114-Status: GOOD (  15.28  )
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

On Tue, Feb 11, 2025 at 02:11:39PM -0500, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> The mcount_loc section holds the addresses of the functions that get
> patched by ftrace when enabling function callbacks. It can contain tens of
> thousands of entries. These addresses must be sorted. If they are not
> sorted at compile time, they are sorted at boot. Sorting at boot does take
> some time and does have a small impact on boot performance.
> 
> x86 and arm32 have the addresses in the mcount_loc section of the ELF
> file. But for arm64, the section just contains zeros. The .rela.dyn
> Elf_Rela section holds the addresses and they get patched at boot during
> the relocation phase.
> 
> In order to sort these addresses, the Elf_Rela needs to be updated instead
> of the location in the binary that holds the mcount_loc section. Have the
> sorttable code, allocate an array to hold the functions, load the
> addresses from the Elf_Rela entries, sort them, then put them back in
> order into the Elf_rela entries so that they will be sorted at boot up
> without having to sort them during boot up.
> 
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

(unless you want this to go in via the arm64 tree)

