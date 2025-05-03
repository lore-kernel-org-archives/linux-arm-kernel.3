Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C6CC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 10:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/p4B1ruUoEakEJncUszRQrQYQJjhiiaNfRr7PCdVKc=; b=i82WFozlYCKpWj8wxO9K7Sf81w
	IFIoQIAAcmcpBFAEQzfzQlv5kYQxIktbOIFtAGyjXVCQa4CR3DmNRg1aa5Ua3bLJBkwJAgKnqiuS+
	/3XRmyXXjuiu7+OLizWd/oHtDYx+O2S2KW2mhihgagEPIMKktn4q+w9ScF3ruP0mL5MsAL+du1PTc
	NioeZCWgbYlE/Od5NnfMS9TR8O85SyynitN0vOuK5UlBlK6NF8DOzw8foIOXvb04F1PoL/izqAiER
	AXVT3gAg0y2lkJ0W5bxZrK9Wg/L/w3d3+g6YhBSwiH/lGG8H4sOLim0qjaOH5feMAA4Vd45MG9hhz
	b9O18+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB9n0-00000003j4l-0dy3;
	Sat, 03 May 2025 10:08:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB9l4-00000003isy-0t7m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 10:06:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3311434F4;
	Sat,  3 May 2025 10:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046B7C4CEE3;
	Sat,  3 May 2025 10:06:05 +0000 (UTC)
Date: Sat, 3 May 2025 11:06:03 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, will@kernel.org, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org, joey.gouly@arm.com,
	james.morse@arm.com, hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, ryan.roberts@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] arm64/cpufeature: annotate arm64_use_ng_mappings with
 ro_after_init to prevent wrong idmap generation
Message-ID: <aBXqi4XpCsN3otHe@arm.com>
References: <20250502145755.3751405-1-yeoreum.yun@arm.com>
 <CAMj1kXEoYcS6YPU0mBdvijDRK6ZVB7mPYZsCVpz7sYotabrxtQ@mail.gmail.com>
 <aBUHlGvZuI2O0bbs@arm.com>
 <aBULdGn+klwp8CEu@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBULdGn+klwp8CEu@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_030610_268124_C438D579 
X-CRM114-Status: GOOD (  16.24  )
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

On Fri, May 02, 2025 at 07:14:12PM +0100, Yeoreum Yun wrote:
> > On Fri, May 02, 2025 at 06:41:33PM +0200, Ard Biesheuvel wrote:
> > > Making arm64_use_ng_mappings __ro_after_init seems like a useful
> > > change by itself, so I am not objecting to that. But we don't solve it
> > > more fundamentally, please at least add a big fat comment why it is
> > > important that the variable remains there.
> >
> > Maybe something like the section reference checker we use for __init -
> > verify that the early C code does not refer anything in the BSS section.
> 
> Maybe but it would be better to be checked at compile time (I don't
> know it's possible) otherwise, early C code writer should check
> mandatroy by calling is_kernel_bss_data() (not exist) for data it refers.

This would be compile time (or rather final link time). See
scripts/mod/modpost.c (the sectioncheck[] array) on how we check if, for
example, a .text section references a .init one. We could move the whole
pi code to its own section (e.g. .init.nommu.*) and add modpost checks
for references to the bss or other sections.

-- 
Catalin

