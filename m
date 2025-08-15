Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1900DCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqyNw+Jm7HoH5Z0KlAgJAQwfjE1pdVnkoWxhIxI0/t0=; b=IJ/I6iaWJxCEoscuc+9xSfFXSI
	//2wLc4VOSzCB0smCCYxqhBBSFGiDgUHJBYYkt9DunwIK7gtMfbd7T4BAGDlWkEw4ALPXPo9FX1OJ
	ztktl+cOcPBvLK0qvBofWZzuWg6sLrPzYrbTtZZUjBtiImm9mNxRggqxrmyawc53uEXaqdkjBzsSe
	a2jgntblEMy4W5lptEPgIeAZ+brMHWXlk1A9VxFuHYc+PGOFkqQyxVgzy9iXl9d3rRUEnxkgYEMTp
	8JGhNjbN6aKOC9AiibF1pcpAlBsnjxE48jx9QfVdV7pnzYrUjnBuGv7NMj2CJBPHNDIOmTnHpIPyv
	+yN2Fw/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umv9k-00000002gS6-2zka;
	Fri, 15 Aug 2025 14:11:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsTE-00000002Jxi-2Tfc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:19:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C5FB6116F;
	Fri, 15 Aug 2025 11:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CE9C4CEF0;
	Fri, 15 Aug 2025 11:19:34 +0000 (UTC)
Date: Fri, 15 Aug 2025 12:19:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, glider@google.com,
	Marco Elver <elver@google.com>, ryabinin.a.a@gmail.com,
	dvyukov@google.com, vincenzo.frascino@arm.com, corbet@lwn.net,
	will@kernel.org, akpm@linux-foundation.org,
	scott@os.amperecomputing.com, jhubbard@nvidia.com,
	pankaj.gupta@amd.com, leitao@debian.org, kaleshsingh@google.com,
	maz@kernel.org, broonie@kernel.org, oliver.upton@linux.dev,
	james.morse@arm.com, ardb@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, david@redhat.com,
	yang@os.amperecomputing.com, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 1/2] kasan/hw-tags: introduce kasan.store_only option
Message-ID: <aJ8XxLGiaVmWUCk6@arm.com>
References: <20250813175335.3980268-1-yeoreum.yun@arm.com>
 <20250813175335.3980268-2-yeoreum.yun@arm.com>
 <CA+fCnZd=EQ+5b=rBQ66LkJ3Bz2GrKHvnYk0DQLbs=o9=k0C69g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZd=EQ+5b=rBQ66LkJ3Bz2GrKHvnYk0DQLbs=o9=k0C69g@mail.gmail.com>
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

On Thu, Aug 14, 2025 at 07:03:35AM +0200, Andrey Konovalov wrote:
> On Wed, Aug 13, 2025 at 7:53 PM Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > Since Armv8.9, FEATURE_MTE_STORE_ONLY feature is introduced to restrict
> > raise of tag check fault on store operation only.
> > Introcude KASAN store only mode based on this feature.
> >
> > KASAN store only mode restricts KASAN checks operation for store only and
> > omits the checks for fetch/read operation when accessing memory.
> > So it might be used not only debugging enviroment but also normal
> > enviroment to check memory safty.
> >
> > This features can be controlled with "kasan.store_only" arguments.
> > When "kasan.store_only=on", KASAN checks store only mode otherwise
> > KASAN checks all operations.
> 
> I'm thinking if we should name this "kasan.write_only" instead of
> "kasan.store_only". This would align the terms with the
> "kasan.fault=panic_on_write" parameter we already have. But then it
> would be different from "FEATURE_MTE_STORE_ONLY", which is what Arm
> documentation uses (right?).

"write_only" works for me, kasan is meant to be generic even though it
currently closely follows the arm nomenclature.

-- 
Catalin

