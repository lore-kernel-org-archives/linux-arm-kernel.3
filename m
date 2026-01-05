Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE1DC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6DvBnCsrgL8x4ukbky8kxmgJGnTRNcdOYoxeSP2na4=; b=pVgGoL26Nsbc9sy7KAFgE68UzQ
	dCiqX2uaN14itBy+bzcL9AbqtEZQ5mXy5WC44+IHDwPRnG8WsU2YD8SlGMwl4aXcdiPHCsJqArIst
	Wq4mlMced+CN1Hf9qVNtbcR6EzR6d9yBsC/JLqSe8ONclP5sjlsDqx9urGS5ufRXyET/e6+IUoN+x
	GOdldaCO0yhvmlqmTYbfjvYhRm0RnRKcWn+aP9rtMnTtmGiiK/WJHq2KHvG4YBcqCJFMuVdz+tIOI
	1VHuqW8Chw9KV1bgRX6wGUSLxFqIQnDGYDMgwYfDimo56BAkYvCVQzfvuGMxgeB+LDueEUx5fyzHi
	AvR3KUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vco77-0000000Bn5B-1jIw;
	Mon, 05 Jan 2026 17:11:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vco75-0000000Bn50-0eex
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:11:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 345ED6013A;
	Mon,  5 Jan 2026 17:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EB7C116D0;
	Mon,  5 Jan 2026 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767633085;
	bh=4IJW8PtwfE62HLVFioMlKVN/Aa3YduhpWOed1uWROUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rC3cuSGxXTz4TkHwyqP6XTCF+pBVrzO3YP/Rwbt7RRRYU4TBI3S5UNUAoKkdspEAc
	 /o3PWdu51kAS9/RkCiQZPP7CPaEnm/RhU5skhirfEvObCnOxvc7F9bTbkNa+vF5+JJ
	 g2zrhS4y5s/wFk/5tCcN09ezjm2GqcZyLswtkSh9WNuDI6PG/tCueAWvzg86YUAqUR
	 3WEeCbXUUE5suEsVVVjx8VOp3ihuMiIFq3dC+aplBVOCL2roX08nkEuo6GjJXF/LjL
	 /XahwB6QVK9icCfcXcTYcs0ITDPFSBil9Ttg2O1oOm4ig1jxkXGFHqXl7oNUa5UoHJ
	 PnexfcIfYHxiQ==
Date: Mon, 5 Jan 2026 17:11:21 +0000
From: Will Deacon <will@kernel.org>
To: Josephine Pfeiffer <hi@josie.lol>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: ptdump: use seq_puts() in pt_dump_seq_puts()
 macro
Message-ID: <aVvwuWAjm3DXM2Yb@willie-the-truck>
References: <20251018170416.3355249-1-hi@josie.lol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018170416.3355249-1-hi@josie.lol>
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

On Sat, Oct 18, 2025 at 07:04:16PM +0200, Josephine Pfeiffer wrote:
> The pt_dump_seq_puts() macro incorrectly uses seq_printf() instead of
> seq_puts(). This is both a performance issue and conceptually wrong,
> as the macro name suggests plain string output (puts) but the
> implementation uses formatted output (printf).

What's conceptually wrong with using printf() to print an unformatted
string? There are loads of printk() calls that do that and I think it's
fine.

>  arch/arm64/mm/ptdump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
> index ab9899ca1e5f..a35fcd62bf75 100644
> --- a/arch/arm64/mm/ptdump.c
> +++ b/arch/arm64/mm/ptdump.c
> @@ -35,7 +35,7 @@
>  #define pt_dump_seq_puts(m, fmt)	\
>  ({					\
>  	if (m)				\
> -		seq_printf(m, fmt);	\
> +		seq_puts(m, fmt);	\
>  })

Given that this macro has exactly one caller and it isn't a fast path,
wouldn't it be better to go the other way around and remove this helper
in favour of using pt_dump_seq_printf() everywhere?

i.e. something like the diff below

Will

--->8

diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index ab9899ca1e5f..8a03b2c9f88b 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -32,12 +32,6 @@
                seq_printf(m, fmt, ##args);     \
 })
 
-#define pt_dump_seq_puts(m, fmt)       \
-({                                     \
-       if (m)                          \
-               seq_printf(m, fmt);     \
-})
-
 static const struct ptdump_prot_bits pte_bits[] = {
        {
                .mask   = PTE_VALID,
@@ -232,7 +226,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
                if (st->current_prot && pg_level[st->level].bits)
                        dump_prot(st, pg_level[st->level].bits,
                                  pg_level[st->level].num);
-               pt_dump_seq_puts(st->seq, "\n");
+               pt_dump_seq_printf(st->seq, "\n");
 
                if (addr >= st->marker[1].start_address) {
                        st->marker++;


