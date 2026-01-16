Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B66D47CA4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 00:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dZ9oxt9FWn/F9+lO/IJZ9dkf3WC43EemNdOt09jeRI=; b=ODsbwCxQ1HN4ryeICWOtUbIzqO
	yRUnTb1gE2FRfVYKW73nc1PEFsupbI6zxJU01Ew7YN+2gaY6y03jDeMbUJ/fEdWRt2sTA/0w8Haxj
	NVU8ANl1J/iP3GLi5rWHqdj2Q3SHoDXPI2xITrkz7juE6344/3eYtWn0Dduo3PM+g/eOeIwVCLMHo
	q33MuDFH9rmpkaRcez3QXP5dXkoxyFAP9GXqb0goINw4LuLPbgfeyLoVBt6nyyB2lj1ZO42qe2uYf
	AvXwpbqDO8gjSLHYufFcKPy/SZp4OLdD+kkOyMETPLTPcInnFY6oIopcBnxkvzmPqwFMesbIednKs
	vjwN8bGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgXYM-0000000DMHE-27WA;
	Fri, 16 Jan 2026 00:19:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgXYK-0000000DMGi-2EVp;
	Fri, 16 Jan 2026 00:19:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FD3D60160;
	Fri, 16 Jan 2026 00:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBC0C116D0;
	Fri, 16 Jan 2026 00:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768522739;
	bh=xmezwQxgXFBOE+WsEI8kzMdBQ/Vtj0ziay1CjIV7d/0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oTyrgtvfzdS6SXwpo1a618aiclgOz0Sosdc70f8yw78SvJDgJcbGQ4l+n163A+84S
	 GtOC/DHsdsuWPAUiEYgrvES4udeex059kh0yHGa7HIOVi7c0lI6djZDMrpXSzDE6TI
	 6esn++KQCSZ991FCXwGinH0epC8qjUoqV4yZ1PiQ=
Date: Thu, 15 Jan 2026 16:18:57 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@nvidia.com>,
 Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org, Nicholas Miehlbradt
 <nicholas@linux.ibm.com>, Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
 Andrew Donnellan <andrew+kernel@donnellan.id.au>, Srish Srinivasan
 <ssrish@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
Message-Id: <20260115161857.ad9952cf1ebd1b37839aa652@linux-foundation.org>
In-Reply-To: <cc97397d3c75d796ee71081cc842c867a62ce39a.camel@linux.ibm.com>
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
	<CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
	<bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com>
	<b6c39059-faed-41a8-80b2-addaa229c143@kernel.org>
	<cc97397d3c75d796ee71081cc842c867a62ce39a.camel@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

On Thu, 15 Jan 2026 17:13:26 +1100 Andrew Donnellan <ajd@linux.ibm.com> wrote:

> On Wed, 2026-01-14 at 10:34 +0100, Christophe Leroy (CS GROUP) wrote:
> > What is the merge plan ? I see all powerpc commits are acked by Maddy, 
> > will the series be merged by Andrew into the mm tree ?
> 
> This is what I was expecting - this revision is rebased on mm-new as it stood
> around when I sent it.

Ouch, sorry, I did not understand this.  So we've lost 4 weeks testing :(

The core MM and ARM changes are trival, in the if-it-compiles-it-works
category.  Is the mm tree really the best place for this?  It'll get
more testing in the powerpc tree?

But if you're OK with it, I'm OK with it.

> By the way it doesn't apply on top of powerpc/merge branch:

I guess we'll be hearing from Mark when this hits linux-next. 
Hopefully the resolution isn't horrible.

As I'm adding this to mm.git's mm-new branch, Mark won't actually be
seeing it.  I'll aim to move this into mm-unstable (and hence
linux-next) after just a single day.


