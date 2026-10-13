Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B640DCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 03:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJssChfaw/WlnaVysEqwe4Z1tfuZOFEKdXZG/EwVI3I=; b=SVneMWVkp55l68FFTbS2Vk8G92
	j8KHvWEISA7zTEYTNFFyxkF64uJ6UDO43wCVhhogViMn17aZL3/SodWAPcWmomo6mBiTETmtHeYA1
	EX+Hq5s+3ABhUq3323mRO+NI6zD3YWrMCpc7t09nxHaFwFy+SW8dlQaCjdE8HbZrVM66SVV65FvVW
	lIB3iCNRCGKAn6KsnVvyfO11D4cvBrVoeaPRtuMrBGcQlwnEWiH8Qw+EtQJuwfZgmnXwsLPUU7zOK
	PTgi91nIVI/KwM2wbwCHqhyXW6GpFUG4ZP9Ityv9P7MoA7WMtgpYsCGfsi66C+7iH7aKbB6AWBdrb
	k7nZ+8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGT8x-0000000Brzv-2f5R;
	Tue, 13 Oct 2026 03:25:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGT8w-0000000Brzg-2Y0G;
	Tue, 13 Oct 2026 03:25:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB138435B6;
	Tue, 13 Oct 2026 03:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167851F00893;
	Tue, 13 Oct 2026 03:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791861933;
	bh=pJssChfaw/WlnaVysEqwe4Z1tfuZOFEKdXZG/EwVI3I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NyRm1VrFt9ZFJC62cb/GZbpmwcM4V21aTV9sKGdVMrIs2z9WqCR99Zm3HyOqUlF7S
	 ENwjeRfGAaG1XErBHECIiyNgzJtP5yvlDy8GfISuPQkn8Wu67qs4UUCq0v+VtVgB5o
	 H0cAA5rwHjdJTzV8Yor6vR8GbpG7w74vqDpKdWrs=
Date: Mon, 12 Oct 2026 20:25:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, Muchun Song
 <songmuchun@bytedance.com>, David Hildenbrand <david@kernel.org>, Oscar
 Salvador <osalvador@suse.de>, Dave Hansen <dave.hansen@intel.com>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
Message-Id: <20261012202532.f059fd5ab947510a21d34cd1@linux-foundation.org>
In-Reply-To: <200A83B9-233C-44C7-B4AF-0900BA1E09DF@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
	<20261010112457.49485-2-songmuchun@bytedance.com>
	<asy-b7_C3SjnmSaS@gmail.com>
	<145CD5DC-6457-4E1E-8B9D-AE7D1EDB0AB8@linux.dev>
	<20261012193114.77147e0a43affa8ee1ae896c@linux-foundation.org>
	<200A83B9-233C-44C7-B4AF-0900BA1E09DF@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Tue, 13 Oct 2026 10:50:21 +0800 Muchun Song <muchun.song@linux.dev> wrote:

> >> The correct trailer is:
> >> 
> >> Cc: <stable@vger.kernel.org> # 6.16-6.18: bf9e4e30f353: x86/mm: use pagetable_free()
> >> 
> >> Andrew, would you be able to update the trailer in the patch when you
> >> pick it up? If there are further review comments that require code
> >> changes, I'll fix this trailer as part of the v3 respin. Thanks a lot!
> > 
> > I don't know if/how the -stable maintainers handle a comment like that.
> > I expect it's more reliable to do this via Fixes:.  Possible?
> > 
> 
> Thanks. I used this format because it is explicitly documented by the
> stable kernel rules.
> 
> The shell-style comment is the format documented in
> Documentation/process/stable-kernel-rules.rst for specifying additional
> patch prerequisites:
> 
>   Cc: <stable@vger.kernel.org> # 3.3.x: <commit>: <subject>
>   Cc: <stable@vger.kernel.org> # 3.3.x
> 
> See:
> 
>   https://docs.kernel.org/process/stable-kernel-rules.html#option-1

Oh.  Consider me educated.  Edited.

> A Fixes tag alone cannot express this dependency. It does not specify
> an additional commit that must be cherry-picked first. The documented
> Cc comment provides both the prerequisite and the required cherry-pick
> order.
> 
> Would this be sufficient for the stable team to pick up the prerequisite?

Hopefully.  I suggest you double-check when you get the emails as these
are applied to the various stable trees.

