Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1D8C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hjqdH8235DHW8XqWtVqy5R1cfb3pIBNm2+rFDWDbtg=; b=JBq/RnSajDglazZlN7a6aPbXII
	KDpThNtn7LmTF8jAYrpf/2K8N/t5rw/YJq+fJG4L3cAQCL8oQyCJpQ57LJeT+EesCXXZlnN54hmWe
	RzcDRaZFwlPXZlpdsKnetBhYy0+jy/ZkS+6rgyPLIJ7VWuf5+HU/f8CVmC2cC1+Oo+zJTGGNRlBni
	SdFly3MzrC/hhM6yXDkKA2tRanbKhM4l916yyGKIyAyeWRq95LrAOfYK+NcbW5o8CHxx73QnJXkrQ
	2oQS3R1lB6nOOl3lX5NTxFacAFw2Oz4RXrN3IihwB5DYdazd73RuPFxYWMaQ6fm36dP5ufuhFFDUB
	mRDQbrdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCB8-0000000FJcp-0pba;
	Fri, 27 Jun 2025 16:43:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBGr-0000000F9XU-0mBQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:45:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE65A5C6ADF;
	Fri, 27 Jun 2025 15:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D088C4CEE3;
	Fri, 27 Jun 2025 15:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039144;
	bh=RVu/1lttzLvj99Q8zNLPW6xNHK5PYrJxzuGtsbgmMm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YmP4wqJ8P619LOKoEaeo8i5pnwugSuKJgk37R6LXlNPB+NeNorELs45vr5KM5TBsu
	 9/YaM9zUh1G8PDC5dA/C4zLSixuu0tPMSTWL5E9UCw7MAk8rAX/jLhGNqxNFi4zWZl
	 uoe8NpxU7EwIUNcgs0gCJ3V/Rz4rWIjkkH7XNxZM/3BiJf5Uh8WcY4O53iDVovnzNo
	 X5QHMJumR3cGriS77R0+KC/MdUG4KoqndYJ4co1LFMA1QQPQXCAGTGYUm1sYjg1iYl
	 OCH6b0Ybh49LRtPswGV2FKkLyPZzD4NxVIDzdGg21CFx6IYH97nkjxlxgVVp44oErB
	 5SJ2ggtMFE7LA==
Date: Fri, 27 Jun 2025 16:45:40 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v4 04/13] arm64: debug: call step handlers statically
Message-ID: <aF68pLuNf7vUWEpU@willie-the-truck>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
 <20250620211207.773980-5-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620211207.773980-5-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084545_269387_61B1AC91 
X-CRM114-Status: GOOD (  18.71  )
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

On Fri, Jun 20, 2025 at 10:11:58PM +0100, Ada Couprie Diaz wrote:
> Software stepping checks for the correct handler by iterating over a list
> of dynamically registered handlers and calling all of them until one
> handles the exception.
> 
> This is the only generic way to handle software stepping handlers in arm64
> as the exception does not provide an immediate that could be checked,
> contrary to software breakpoints.
> 
> However, the registration mechanism is not exported and has only
> two current users : the KGDB stepping handler, and the uprobe single step
> handler.
> Given that one comes from user mode and the other from kernel mode, call
> the appropriate one by checking the source EL of the exception.
> Add a stand-in that returns DBG_HOOK_ERROR when the configuration
> options are not enabled.
> 
> Remove `arch_init_uprobes()` as it is not useful anymore and is
> specific to arm64.
> 
> Unify the naming of the handler to XXX_single_step_handler(), making it
> clear they are related.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> ---
>  arch/arm64/include/asm/kgdb.h      |  9 +++++++++
>  arch/arm64/include/asm/uprobes.h   |  9 +++++++++
>  arch/arm64/kernel/debug-monitors.c | 25 ++++++-------------------
>  arch/arm64/kernel/kgdb.c           | 17 +++--------------
>  arch/arm64/kernel/probes/uprobes.c | 15 +--------------
>  5 files changed, 28 insertions(+), 47 deletions(-)

Reviewed-by: Will Deacon <will@kernel.org>

Will

