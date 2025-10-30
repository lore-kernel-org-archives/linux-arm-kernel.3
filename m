Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A501CCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 14:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wT4yvCc5e5lwEZTnNXQlQOaFMErDKLYUD20YsC36PiM=; b=aA3+ezyzu956SFlZyuGXCt2oCg
	xoOmStnGOKb0APX+wQb4SrjGP5w+V6y2F4VsFts9Hn8rT2GYxQPosaPYxl6pihIYvmHpbAzlwiMdh
	QYNKSoOVhRTUsPeD8LnmxQH9g58zd6ONhAdrdK0HiOHnnAqQxiNMaLOZOSCtKSQvHDHDDqs6tgpbh
	QT9t86iOi8Lvt2C3ZyPxjo655+wodl/gTu099Kgz0KDk9mcrV1Hla3CRGDQY75BfjOV/1Q9Nj0jcj
	6uUhivxsKBhWhePE6les76385z3c/LWB5NE0lMWiBfwp1bvh4+NBougbpHJoNtO3+q3aEK2DladXx
	Z7zSonMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETOk-00000004Hdj-0vEi;
	Thu, 30 Oct 2025 14:13:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETOi-00000004HdF-0pTt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 14:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E407640768;
	Thu, 30 Oct 2025 14:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7346C4CEF1;
	Thu, 30 Oct 2025 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761833582;
	bh=2qJt4HkGJ5MheTVm3JmsFCxA93LEhVSRgx9nW6R2n/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6Wy8JZlNuduqxvw8H0lIQPOum53x/+obTNhygOS/7clrt4pVx28rAAn2wr4TM2Xd
	 gqQIUTTMoe9BA2XwzCUkJtCNPkEUCCz/Yjk4n3+qWtCFuw0e4UNI5l27fZRk+BveUG
	 YDIxPnBxDqyAyTuxH4/nIRygRJgU6ePZfU3aj0qUYmBq862CE3XvBzytYcKNYjpevQ
	 tsuobJ9+t89zJo3JLc004+GZQnR2oaHbcQGuNnTOwhDNok61i2lp2gDbqZ/IIeSNfW
	 0hTBvLarpuw9kbJe4Zoh5NqPoQurtlEm8L+PRrlxdiekTREBsLym4MUgNvI9chz+ya
	 ABuOeI7FeqhaQ==
Date: Thu, 30 Oct 2025 14:12:58 +0000
From: Will Deacon <will@kernel.org>
To: Josephine Pfeiffer <hi@josie.lol>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: ptdump: use seq_puts() in pt_dump_seq_puts()
 macro
Message-ID: <aQNyaoXKsMdkIDrc@willie-the-truck>
References: <20251018170416.3355249-1-hi@josie.lol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018170416.3355249-1-hi@josie.lol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_071304_281040_8AB12C10 
X-CRM114-Status: GOOD (  20.89  )
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
> 
> All call sites pass constant strings without format specifiers, so
> using seq_printf() adds unnecessary overhead for format string parsing.
> 
> This bug was introduced in commit ae5d1cf358a5 ("arm64: dump: Make the
> page table dumping seq_file optional") in 2016, where seq_puts() was
> replaced with a new pt_dump_seq_puts() macro that mistakenly used
> seq_printf().
> 
> Fixes: ae5d1cf358a5 ("arm64: dump: Make the page table dumping seq_file optional")
> Signed-off-by: Josephine Pfeiffer <hi@josie.lol>
> ---
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

This looks fine to me but I'm slightly confused as this patch is marked
as 1/4 but I can't find the other three anywhere. Is that just an error
or is this part of a bigger series?

Thanks,

Will

