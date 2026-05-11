Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92D8CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCWmJzpIjJjluTw5IwaZ5xcVi0SJM48LsJhoxYzTBTY=; b=fCIOfyKTKGVBdHG4nWs0p2/rve
	XijK4oUkhJWXNsPRkoBUwNK4LpN97hovpuVerYDvtXoEtDRjdCCHK6V4alhZSgA6raQt27oJ2oASD
	1365o1th/1dX4A5xHrYHII8vebN7rAzVzeG2Wmaggyqd8u33DwZjn3KRZMqvvVJRwIKoWSEx/5ARL
	1wCoh4tZom6EN2PwXetPo3Z9rqXAhlVlYZQpyFK6r9O/2G2+tkILd7yS4Iqi+LiAnWm9/Hop7ne75
	i+NPiJe7bOMtY8j7C3DIkUrq8xvbJtG9FN+sFrypV4VcC/A6rObYZ1/cYITwlFalyHYi5kNzP4uxW
	GPodpLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTVs-0000000ECyw-1gvf;
	Mon, 11 May 2026 16:29:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTVr-0000000ECyX-0EiY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7091F60121;
	Mon, 11 May 2026 16:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48FB3C2BCC9;
	Mon, 11 May 2026 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516986;
	bh=c63a4JxePfIgjpgQ4bMho60Nz7+hTPym2Qpet2uaDk8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XYYpvVFOF00vdXabkI5V87vD7BFVLIXY+qFT2ClunVZKi+tPI0A/8qTXulLEY0DeY
	 qqTTvho0mSwUsjNJmWHHt6a2oIXHQ7gWau/W3GBodDGBrrCrwwzAPgzTyOBbTojYam
	 3hwFGn6hN8g4UvabpRwzolIBi/k5DjAoTHC7foRroFwNEwScLAA5gcYiPmxbzWkpxt
	 /1s8jwlVN1Mx7zwpG0PeyVk/MLDHjSg871CdLooSg27sJ0LsUt1lbuWmc6ZBL+lzxT
	 jSdhQSMc7FFsWMF//ZopDDSrTnhyoosExOzX5FNBFlEwfKrA+3pdTz1xoZPoXHnDhb
	 NwMTBxpC7XaXQ==
Date: Mon, 11 May 2026 12:29:43 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Ian
 Rogers <irogers@google.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v19 0/7] ring-buffer: Making persistent ring buffers
 robust
Message-ID: <20260511122943.41e204bc@gandalf.local.home>
In-Reply-To: <20260507131416.35bc304d89f974ae3b33d20b@kernel.org>
References: <177751968499.2136606.17388366710182662849.stgit@mhiramat.tok.corp.google.com>
	<20260502152304.560a5954@robin>
	<20260502181619.7f5003dc@robin>
	<20260507131416.35bc304d89f974ae3b33d20b@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Thu, 7 May 2026 13:14:16 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> > I'll test this some more, and make a proper patch.  
> 
> Ah, indeed. Thanks for fixing!
> 
> BTW, shouldn't we unify common logic of those functions?

Hmm, there's not much common between the two. One is a consuming read and
the other is a non-consuming read that needs to test for a bunch of race
conditions.

If you see something that can be shared, I'm all for it.

-- Steve

