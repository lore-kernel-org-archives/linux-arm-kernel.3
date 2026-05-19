Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082DFCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Easx6MEkAooafG++iP85OK9RycPakB2ZfY18ObvhjbE=; b=mkslBkGw4sQEmdhsOFxPWvshko
	6j2FtMT6umM/rg0nUgJQ2x68AjHJrVm/4MLaxZSENrehMKRiquwKwAB6xH495jdqO6/tuEnFLQ+4C
	2iV/PK+pkWQNS+y3+4oj5SF9xVKrq3xDC8X5Yy4H7HL1c1TJavawKWO3o4DFaefmdZG6RttJZV/Aw
	QvAjbL9PzQ0jjLXuWb+NEGZqJkUqa4w5LsKVCFksiOwwfTd6JzoJW7L/bn1sNF4FLZy1vhC4hEiRI
	b1Md1WsWIXXY43oJauq3a/26/2cHlJfuviiN5DnCa4PEVXfbDJO6HnANwhG1K8okKbDuqxs2g0bxL
	6wpJ8CQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHrp-000000019Cv-460c;
	Tue, 19 May 2026 10:40:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHrd-000000018xn-2AUs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAACB4090D;
	Tue, 19 May 2026 10:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E141CC2BCFC;
	Tue, 19 May 2026 10:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779187192;
	bh=6i4/xeWkK24ypQxmT6m5p4TT5PjCbVhVZs0lIiIGkgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spCwoyYEQDrT/gY9lYLFiqwhE8K4xkItRrq0RrZF4GtD3AANM+SH/HH+LpIVOItgM
	 QeQj9UkPp+WdF5HGnOoMonn8Vl2nuePuiKbJCa8dzgHrgh7I4wo3ofv/zpIEUJqFiH
	 pJgMidlsdsCVxF6nSs81jYoyxGA+NmSHCw9EL0NuaIOhqGC86n3ShwBRQEupPBF2Vq
	 U3vV5hKNMLETtfcMAU98vc24/1/WZxEaBjLHm7hfeJZUbdNH2MKKgEiOLeQimJU5kR
	 ThNpDQnSODuoqR2YRWsK2tIxMtfnSlhILFvQkfIJfpY1NCSx3YluadUFTuSQaIzl2/
	 gA1K2YYPcwIww==
Date: Tue, 19 May 2026 11:39:46 +0100
From: Will Deacon <will@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, kernel-team@meta.com,
	leitao@debian.org, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	palmer@dabbelt.com, paulmck@kernel.org, puranjay@kernel.org,
	rmikey@meta.com, usama.arif@linux.dev
Subject: Re: [PATCH] arm64/daifflags: Make local_daif_*() helpers
 __always_inline
Message-ID: <agw98k7XVGNCR4RM@willie-the-truck>
References: <ae9f6_MSCMfgG8VT@J2N7QTR9R3.cambridge.arm.com>
 <20260427140125.1773574-2-leo.bras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427140125.1773574-2-leo.bras@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_033953_595385_F76B1356 
X-CRM114-Status: GOOD (  11.15  )
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

On Mon, Apr 27, 2026 at 03:01:26PM +0100, Leonardo Bras wrote:
> Make sure those helpers are always inlined and instrumentation safe.
> 
> Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> ---
>  arch/arm64/include/asm/daifflags.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

b4 really doesn't like this patch being a reply to another one, so I'm
just replying to say that I've picked it up manually.

Cheers,

Will

