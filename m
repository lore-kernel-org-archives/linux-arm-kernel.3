Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02E8C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 21:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdxqtwCk7o+O0CLrGZFj6OI2hJCqZaTjy23dy8ldGiQ=; b=VUJV93SNnNnIcHazHSe3EuLiu5
	NdoTr+6Hv4sg1bCIuWhxdFPoHdRkHBd6RJ8en1csYyZwLG/6umWSqB+6SQkkYvYSzbBm9f4miYXay
	teRR9yyODvrlaaud0kxIBCSmg3sGL/FBK2TNJI5i0Wc4knhfoC+2gUMW0SKaaVjunmQZeJ7QMt55v
	4QMPCY8udwo/EmFF8lLuvV2e3E12OQPt5aa0FfcTcBrXkSqEIchF3hITyrcxVtqyozHvRGgF2bW3l
	0NpWN9b/n+pQp54fx/UEX9W0POgt3JJHyGTZtoLcAR2c3rzoadkeh3X1RRD+K4URhTt9yczph3uq5
	nx7jlEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vifi9-000000064Tg-2k1T;
	Wed, 21 Jan 2026 21:25:57 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vifi7-000000064TC-00AE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 21:25:56 +0000
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id E8EEE140EF3;
	Wed, 21 Jan 2026 21:25:49 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id D49596000C;
	Wed, 21 Jan 2026 21:25:47 +0000 (UTC)
Date: Wed, 21 Jan 2026 16:26:12 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Daniel Thompson <daniel@riscstar.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, LKML <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: iommu: Fix NULL pointer deref when io_page_fault tracepoint
 fires
Message-ID: <20260121162612.3e0fd03f@gandalf.local.home>
In-Reply-To: <aW5YnTnOJ2dJNuhq@aspen.lan>
References: <20260116-iommu-io_page_fault_null_fix-v1-1-6c20c2e62987@riscstar.com>
	<fca8f2cd-c3e5-40b0-a793-bded109e37bc@web.de>
	<aW5CIA1aCC8FVyFl@aspen.lan>
	<a2aa3091-4a93-48be-970a-8bc506fb0cd3@web.de>
	<aW5YnTnOJ2dJNuhq@aspen.lan>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: s5arapdzgk1tddoiu6s7j7sgtddh7rnm
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: D49596000C
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+qYpolyQ0nxcIiCgW3JrPU4QjD8DMW0ao=
X-HE-Tag: 1769030747-404029
X-HE-Meta: U2FsdGVkX18mMhNCVX6b+tW5GGOQMGF0uRdwyeG86P2+f76iRCx3ok9l4PkXPP1axNXtnOf0xzoxreKqpInVOcvO3nZjevmzeF9ew5/fxz8qbSHd7KslLkLJWepqS9CiSlh+azoSxGj+PG+lT48kupd7DRvYMC40aYQ/d93uyFvKMi0Kc8cLb5mSRb0p3GvONDtP+MNtl+afsYOzx2fpDfp95XDMr3iobre6VuGQGXmd8xIvNxH0RX5cyZ+Hy1nKwYNDD4xL3qHIF1cP3w8BgB8t9ApZP210Rn1ZJ++xJX8i/jT6mtgVHj7tKojhJJchTb4MZr3a1SvOxEgN+zR28pB9efNIuAT6smjNz11I4PxULuDWLjh+gEh3gyghm9jaKGv6s2mn6BtsunkHsYFTIwc/UhrS6LxEDk4ehWE4gScI9XUn391R9DhK3AzgsoWY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_132555_100355_D569C759 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

On Mon, 19 Jan 2026 16:15:25 +0000
Daniel Thompson <daniel@riscstar.com> wrote:

> I dislike the proposed new summary. I think keeping "io_page_fault"
> in the summary is a much better use of characters than spelling
> dereference in full.

Agreed. You may safely ignore the comments outside of adding a "Fixes" tag.
That probably should be done.

As for your patch:

  Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

