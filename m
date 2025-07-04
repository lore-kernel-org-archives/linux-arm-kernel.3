Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49591C83F0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzKM1uvH98tOailuzjR5y0Fv7Qdo/RsLXHElN80NIZI=; b=Ps98dswjlXPUBgEA0ZRTKRHUvO
	Z1CzgVE3oiIuoUrolA4OwJPzVr2RRsfUjkjZzSKJUppFufjYhO8edLaYXWvGaQjr17KfGMHFAHGEg
	QTn2lG5/6P9iAayP9+4DE3FUQh18a+AwFtTFVad05/VsD4zacC9cx7UIAMaIaYTsvU0dN8Ev2lIvx
	lq+kqeOtfAjtkWWEq4+jqCl5Wq4F8FT5UVL7pba5M8W7Q5cwxOgLY1wHnY8B6Hr5t4Ba53CMnVkh2
	z6PlUld9M6FWFV5ZdkkaD58dk+GQcDCqRS/gJST6iwllNQ0TsczBm3X9SYxJ3/DvGu37fH/7PhVkQ
	/70L9deA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhzn-0000000El5s-2UHt;
	Fri, 04 Jul 2025 15:06:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgeM-0000000EXnK-3qgm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 13:40:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22BA9153B;
	Fri,  4 Jul 2025 06:40:08 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC95C3F6A8;
	Fri,  4 Jul 2025 06:40:19 -0700 (PDT)
Date: Fri, 4 Jul 2025 14:40:17 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, usamaarif642@gmail.com,
	rmikey@meta.com, andreyknvl@gmail.com, kasan-dev@googlegroups.com,
	linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: efi: Fix KASAN false positive for EFI runtime
 stack
Message-ID: <aGfZwTCNO_10Ceng@J2N7QTR9R3>
References: <20250624-arm_kasan-v1-1-21e80eab3d70@debian.org>
 <aGaxZHLnDQc_kSur@arm.com>
 <CAMj1kXFadibWLnhFv3cOk-7Ah2MmPz8RqDuQjGr-3gmq+hEnMg@mail.gmail.com>
 <aGfK2N6po39zyVIp@gmail.com>
 <aGfYL8eXjTA9puQr@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGfYL8eXjTA9puQr@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_064023_003011_47C57309 
X-CRM114-Status: GOOD (  11.70  )
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

On Fri, Jul 04, 2025 at 02:33:35PM +0100, Will Deacon wrote:
> I would actually like to select VMAP_STACK unconditionally for arm64.
> Historically, we were held back waiting for all the various KASAN modes
> to support vmalloc properly, but I _think_ that's fixed now...
> 
> The VMAP_STACK dependency is:
> 
> 	depends on !KASAN || KASAN_HW_TAGS || KASAN_VMALLOC
> 
> and in arm64 we have:
> 
> 	select KASAN_VMALLOC if KASAN
> 
> so it should be fine to select it afaict.
> 
> Any reason not to do that?

Not that I am aware of.

I'm also in favour of unconditionally selecting VMAP_STACK.

Mark.

