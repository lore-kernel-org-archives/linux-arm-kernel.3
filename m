Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F27FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GMapFeIrw8O7qpl8eGc5tSrV6C6GAhPEkmx+0zTXxY=; b=YuNtR+tcrX+eOo5Qy3jnZ+fis+
	WRRwBVvHMU4eTbN+q/VOUxHRysmtt7oHMcKXnyDGfZc2+r57hHr/NFoRYB29VD+ZTTx+lMCb3PsUd
	1vOXf7/E2M6Ct6dbNVPFE+0CrWWCYAQ/qEA/IyS8NELkFjE3cfZjCXVAQfF5HHmwBdw2bILuZ9+Yj
	JMfrPwa+y0+pzyo5XdS3yZ6HjjECzi2gAx+Vgjl8t/Bj/TuGXRUTZX6r28oW/QUNoV3NgfB4FOezi
	VZtIqVQBQ194qUREOPXG+zrMsinRDvCx0AJvWJeJiEpJP/KUu3P2X1OTVvcOxEiBTNk5Bs4ttLvgl
	pu0SsINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfla-00000003KGl-2euj;
	Mon, 10 Mar 2025 16:14:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfIA-00000003Ejy-1PbP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 15:43:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D7185C67F5;
	Mon, 10 Mar 2025 15:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD41C4CEEB;
	Mon, 10 Mar 2025 15:43:43 +0000 (UTC)
Date: Mon, 10 Mar 2025 15:43:41 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 2/3] arm64: mm: Handle PAN faults on uaccess CPY*
 instructions
Message-ID: <Z88IrRhWsQyEtO-S@arm.com>
References: <20250228170006.390100-1-kristina.martsenko@arm.com>
 <20250228170006.390100-3-kristina.martsenko@arm.com>
 <Z8s-4OPE2DNSogwB@arm.com>
 <4c621070-688a-4a75-9134-ea19b6d20f04@arm.com>
 <Z8tnARR2jSJEruLw@arm.com>
 <1210b66a-ed75-4bc1-bbaa-d3277c290267@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1210b66a-ed75-4bc1-bbaa-d3277c290267@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_084346_420866_6B93BAA4 
X-CRM114-Status: GOOD (  17.97  )
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

On Mon, Mar 10, 2025 at 02:15:53PM +0000, Kristina Martsenko wrote:
> On 07/03/2025 21:37, Catalin Marinas wrote:
> > On Fri, Mar 07, 2025 at 06:53:37PM +0000, Robin Murphy wrote:
> >> On 2025-03-07 6:45 pm, Catalin Marinas wrote:
> >>> On Fri, Feb 28, 2025 at 05:00:05PM +0000, Kristina Martsenko wrote:
> >>>> +bool extable_insn_may_access_user(const struct exception_table_entry *ex,
> >>>> +				  unsigned long esr)
> >>>> +{
> >>>> +	switch (ex->type) {
> >>>> +	case EX_TYPE_UACCESS_CPY:
> >>>> +		return cpy_faulted_on_uaccess(ex, esr);
> >>>> +	default:
> >>>> +		return true;
> >>>> +	}
> >>>> +}
> >>>
> >>> Not a problem with this patch but I wonder whether we should return
> >>> false for EX_TYPE_LOAD_UNALIGNED_ZEROPAD for completeness
> >>
> >> Or maybe rather, true for EX_TYPE_UACCESS_ERR_ZERO and then false in the
> >> default case?
> > 
> > Yes.
> 
> I thought you said in an earlier (off-list) discussion that 
> EX_TYPE_KACCESS_ERR_ZERO shouldn't return false here because 
> __get_kernel_nofault() may get called with untrusted addresses? Or did I
> misunderstand?

TBH, I don't remember. Thinking about it, if we have a bug and someone
exploits __get_kernel_nofault() by giving it a user address, the above
function should indeed return false in principle. Not a big problem
since the actual user access won't happen but we may get into an
infinite loop.

I think something like this should do:

diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
index 6e0528831cd3..ab6775747601 100644
--- a/arch/arm64/mm/extable.c
+++ b/arch/arm64/mm/extable.c
@@ -28,10 +28,12 @@ bool insn_may_access_user(unsigned long addr, unsigned long esr)
 		return false;
 
 	switch (ex->type) {
+	case EX_TYPE_UACCESS_ERR_ZERO:
+		return true;
 	case EX_TYPE_UACCESS_CPY:
 		return cpy_faulted_on_uaccess(ex, esr);
 	default:
-		return true;
+		return false;
 	}
 }
 

-- 
Catalin

