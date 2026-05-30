Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944D4CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxYmQxwwBxgWs6asR9XSCI+irQfqn2faBEqKE1hn53E=; b=fqeYhXBaomFukpjcjR27IZQwcz
	8rJeJetoYWy7CnAkR5wHLO2cDVEY9GvG7r1bth9MOs1obnEQdzg08dcAr97sry+zLUuaZ6CvIeodw
	F5Nj21lmAxKXwOScLlXnWdBQusauwj0fSWTGXueObDERvr9KfBgGSzwgIscukuXzauuzHghrr0XgQ
	UcXGCj/5fTKz4KIPzhZHd8bVb1+ej4HpPrCOFioqF1VWQlG8VYVI0FeHFGcsI9uG45Jz2uz9knDrh
	pbPOtlZPdgq2Qx4IiJaKUfxpBu8mXnpKFWIEEXDcCerHpvn6lCngpvNwZc+2pc/lK0h9sOD/28u/P
	FCvcvyXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMPf-00000008v8T-1UYX;
	Sat, 30 May 2026 16:19:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTMPd-00000008v8N-0ESE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 16:19:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 18ACC600BB;
	Sat, 30 May 2026 16:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD33E1F00893;
	Sat, 30 May 2026 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780157987;
	bh=WxYmQxwwBxgWs6asR9XSCI+irQfqn2faBEqKE1hn53E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WZl0+4I9eq0OPPyxyDBdqCGRR+y0CoJpx7P9J1ZNHafWZGZX1fuK9HT7HOCSp1FVU
	 9ddWJ9lDITFjq9eKGfZ8XgcPI1Gceue8QxkZpOu0JwKjN75XEWJg4tA2a8UNAkWZvu
	 d2ASsHkW3EY1IZ3rOpPzq31XPfEMQM756K5+/fSW612wkX78yv2eAZ66ejeZV4LlfY
	 gAu+RNJYW42KKsssq+PHsl1z2ZSd/eOK+QZCgtAc5FgOD8sjUj3miMaJcP2gtaD17q
	 8U+HAlTtH77+9KCSbzDnS36KQEJCJesVoZVR5wfQkL3btqSLgCjvtjIMAmDS1I+rUb
	 wf48OWQ3Lcqyg==
Date: Sat, 30 May 2026 19:19:36 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Liz Prucka <lizprucka@google.com>,
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v7 12/15] sh: Drop cache flush of the zero page at boot
Message-ID: <ahsOGMc7ys3H_oAt@kernel.org>
References: <20260529150150.1670604-17-ardb+git@google.com>
 <20260529150150.1670604-29-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529150150.1670604-29-ardb+git@google.com>
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

On Fri, May 29, 2026 at 05:02:03PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> SuperH performs cache maintenance on the zero page during boot,
> presumably because before commit
> 
>   6215d9f4470f ("arch, mm: consolidate empty_zero_page")
> 
> the zero page did double duty as a boot params region, and was cleared
> separately, as it was not part of BSS. The memset() in question was
> dropped by that commit, but the __flush_wback_region() call remained.
> 
> As empty_zero_page[] has been moved to BSS, it can be treated as any
> other BSS memory, and so the cache flush can be dropped.
> 
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/sh/mm/init.c | 3 ---
>  1 file changed, 3 deletions(-)

-- 
Sincerely yours,
Mike.

