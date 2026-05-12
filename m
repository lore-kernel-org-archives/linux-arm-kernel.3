Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C33CCD4846
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 00:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24GM5OB6erBZYdLVYgSIwU4BQPr10WSW4wCAGCqi2GM=; b=R/t3dK8TlA25OJzKny2HTj0aNn
	D2LhVThrBbx4W9pmvMUpOpLfYYRjcKRpHWc9JknuBBYGJ4MTOtyfXdkN8HB/4h9sVAbfnh4V+P+wd
	aYM5DVfEBCe+8cpsMCJeo/cQtkE3Ob0d1PDC7/iYM+3t4ymv/0GluNeGe33u36e+Z4M6G3vRu9F3o
	bBIopJap7z5hFtswutxSEWdIx8IOa214AdGjiPIYU/hzpIV7ZUs6Sy2bPzg90vNG9x602ieq+9vyG
	fAAncNww+MLkeWQZOMRha9Iv2AQQx49HEm+CCC++hLnQdKIecaZqr2xwXu7/raAtEFGhynHtNR9Zg
	FRpohG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbOQ-0000000F7ib-29uz;
	Tue, 12 May 2026 00:54:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbOP-0000000F7iO-0q6k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 00:54:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 25C396001A;
	Tue, 12 May 2026 00:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3219C2BCB0;
	Tue, 12 May 2026 00:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778547275;
	bh=I0C9SVdPZIofrk/2NYSPziKCFfKB6wJ7FO+blU1dDpc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YUlOH647EhHXBO61NbZyj0E9iEKS2dPZrXHF6gzN9iUTdnlBnHqa9a9JAJflPIxks
	 SA02DEnU2CDJjmE/cbgVGWFog2Ri0AUhfMnNb0kzAavEmIV+LK2LMZ9dzbIjS3Zeq8
	 CCcporAywCEhvshFmOSBBOUQRgtQuSrCqbti7Besn8GLQEVw68rWMhjCrIDy5WQTFK
	 ILkxLe1zTZbbUECFKwa8ODVTsecpbQKiwklqPNGCLw6cC4Z4y9ChfeH+Y6L0uZEM6b
	 cSawowI41AWCqKFsjDWlZraLHWBsdwy6X1xJjpKdv9PiiUOEec3NQFOUO31MfUlTLP
	 yT9QjCKn6yKsw==
Date: Tue, 12 May 2026 09:54:31 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v19 0/7] ring-buffer: Making persistent ring buffers
 robust
Message-Id: <20260512095431.a01161ece2acb7f48d7bd8c2@kernel.org>
In-Reply-To: <20260511122943.41e204bc@gandalf.local.home>
References: <177751968499.2136606.17388366710182662849.stgit@mhiramat.tok.corp.google.com>
	<20260502152304.560a5954@robin>
	<20260502181619.7f5003dc@robin>
	<20260507131416.35bc304d89f974ae3b33d20b@kernel.org>
	<20260511122943.41e204bc@gandalf.local.home>
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

On Mon, 11 May 2026 12:29:43 -0400
Steven Rostedt <rostedt@kernel.org> wrote:

> On Thu, 7 May 2026 13:14:16 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
> 
> > > I'll test this some more, and make a proper patch.  
> > 
> > Ah, indeed. Thanks for fixing!
> > 
> > BTW, shouldn't we unify common logic of those functions?
> 
> Hmm, there's not much common between the two. One is a consuming read and
> the other is a non-consuming read that needs to test for a bunch of race
> conditions.
> 
> If you see something that can be shared, I'm all for it.

Maybe we can introduce a common inline function to calculate
max_loop, or at least replacing "3" with a common macro.

Thank you,


> 
> -- Steve


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

