Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C71FCD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 18:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQ/lKYyflvZSNBqlP/dvjAr1/tprgH6SH+5pfzheVMA=; b=lEgoGlUCTeBbMQgiEcq4DU/sdv
	5wMVq6lf7lJZSEGsCLFxray52AWAetQdh7P8m+/WQ2REv/6PIkk1oUqYqgavYbtetaI7C6QwUWeqT
	Hb2ceF0Madir5GPXYW90hCsEy9xOK0JjMR2stNXmLs6FFtgBpou33kZtn6WAXe1iZ3c8VHSqzY/lT
	rAEzMTQvpNF4rW8VAiWnWUlqOgPz8y0nasI7u6ps+i2H/Zx3+0TOrjVrhuKeHmEyo2sPNR/dXZGPm
	wmHoQ1iz3GM7M4i0cEWd7ZxiBYz+WCYxHIaWoapCNX9GCeRkHie6skq/epOQvSfsykUT32362eYLt
	SY3jZZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVdO-0000000EXGX-2YWV;
	Mon, 11 May 2026 18:45:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVdN-0000000EXGI-0BME
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 18:45:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F028600CB;
	Mon, 11 May 2026 18:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEFBEC2BCB0;
	Mon, 11 May 2026 18:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778525140;
	bh=TwOfOoVHvAk5+BCmHU/0l16HBggiVxIlTk/wO3uefzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gD5uFrrlE+wG2vwML+Aua/biLzAAyLJ+t6tbI+rhZSnVTjogUz6PrsXYzBDuv04SE
	 5UossI/jUrt1BWF56+0ts/0MbUWbyhisN9TyfCmJ1yDkACDU33yNP81cnVfETNey5h
	 0P68FO0RXg4OZxf2Pt+hfo0cdCjBMwJbrdOEd3Pdl3PRLkTmcYaqHGBxXGM1vY4PSS
	 2qvPgHjG3FGAWF/6ZLxS2SoQBF9+nqr4cWLDQUhYH6dRDjnMxv/hnqfMec5S8pNKfa
	 4cWUtMHZ2B4dAzEHpMKQC27h9YzXrLWXzskKQEkFDNph7Ozt4lOUU0MxDlojcCKrDp
	 FduI08HJYAMQg==
Date: Mon, 11 May 2026 11:45:39 -0700
From: Kees Cook <kees@kernel.org>
To: Jann Horn <jannh@google.com>
Cc: Ard Biesheuvel <ardb+git@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Liz Prucka <lizprucka@google.com>,
	Seth Jenkins <sethjenkins@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 02/15] mm: Make empty_zero_page __ro_after_init
Message-ID: <202605111144.349EF737E@keescook>
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-19-ardb+git@google.com>
 <CAG48ez1DJ88a0pBCE-Q0VXyDuJgng8zdunb38g4b4JPU88exww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez1DJ88a0pBCE-Q0VXyDuJgng8zdunb38g4b4JPU88exww@mail.gmail.com>
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

On Fri, May 08, 2026 at 07:02:51PM +0200, Jann Horn wrote:
> On Mon, Apr 27, 2026 at 5:44 PM Ard Biesheuvel <ardb+git@google.com> wrote:
> > The empty zero page is used to back any kernel or user space mapping
> > that is supposed to remain cleared, and so the page itself is never
> > supposed to be modified.
> >
> > So make it __ro_after_init rather than __page_aligned_bss: on most
> > architectures, this ensures that both the kernel's mapping of it and any
> > aliases that are accessible via the kernel direct (linear) map are
> > mapped read-only, and cannot be used (inadvertently or maliciously) to
> > corrupt the contents of the zero page.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> 
> Reviewed-by: Jann Horn <jannh@google.com>
> 
> Sorry, I should have looked at this properly earlier instead of ending
> up duplicating this patch with
> <https://lore.kernel.org/all/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/>.

As you mention in your testing of the patch, could we add an LKDTM test
that does the same to catch any regressions?

-- 
Kees Cook

