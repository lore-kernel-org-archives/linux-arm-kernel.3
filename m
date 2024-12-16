Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1E0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 22:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2PH9pRT7HgCd5Xu5gne/9j211rCmiQ1rBQxoRa7c10=; b=WDP+D2mxEWkn3W+gBAGX4nHNhI
	pQsYANnANIOPu++iZ2KsjmrLgZj8NyL660uP2Jwf67VJbN+4es0guXXdQOofqvrZpiJohbmwN0U5J
	e+okUYEy3H4CuE4DdQclP+QioNGgAvtMaX1JXAj+KltzrmiSCWRcWUvVko8Rp+qTXPdMvF6Snj1kh
	nOwzIiMah8dqna22bMAjopw+8wRUGpUlCEPpjcGPsSNYhRm3NvAD9YYMfFDjxTvW1LWe9Z+nnqugf
	wBa8mOX5Z8+M6xr//7Yi3zVePSOvQDk3lFc26lh/jJ8vW4ZPuNYHiDvnVPJTHhn5fGZQYF8l9GFJR
	VSbAy8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJXg-0000000BYaJ-3g9O;
	Mon, 16 Dec 2024 22:26:20 +0000
Received: from mx.ssi.bg ([193.238.174.39])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNJWb-0000000BYRN-1qwj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 22:25:15 +0000
Received: from mx.ssi.bg (localhost [127.0.0.1])
	by mx.ssi.bg (Potsfix) with ESMTP id 12A4E23563;
	Tue, 17 Dec 2024 00:18:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ssi.bg; h=cc:cc
	:content-type:content-type:date:from:from:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=ssi;
	 bh=P2PH9pRT7HgCd5Xu5gne/9j211rCmiQ1rBQxoRa7c10=; b=EAFMYX0AKai2
	D20CVrb/14WbDKGX+4Q+YEnPsoql+Pxb9dWa/9uorwtILHq6mZn/nlX565nuA5E4
	LoVjiPn8M/BYWYXyem2aWq+QsSDaSmjwrN2UV8mMDnjhMC5xTwCXOXuOzlseSn/i
	HixG8qAnxx4oZQLODB7y5QXGMRSiGoCojjhYq7cNX1z6XCoFVMGPepnLBNjt+iyZ
	wJ1en+WwEIBsrtuad5oz+ZqmtDFdpCqWPfNrheC0eELpfKmG8+LVa9Ej+y4Bo8wM
	8SdlsCCoXEU6Yb4NUBzzaisEsNK8DO6RFJGTj6KkQXBqltnQqNiWkq2JaReBoStV
	rSFlKq2n8vt40N3tvrb012csM/4UN2Uk06nIXglHrwp/tI4+QDy22rqV91ilhWdN
	TTponn6SuCaPKDT7/Rimiuo+zdBu+cenWwCIR7ALERNmbbCtK6E+msDIodCFcpKH
	0RdCodgxRAt1V+d3fWyk4b7uUK05LFKaISfT9My7y4mRcs2YKJ76uw0/OIc2e9Sx
	+Es5dtIwUlMQcd2aAi6rQGVAnRK1f7nIkFummQi0fJjUc/LQeHGsVwVaHOYuRt9I
	7f3CfM/jzMG+iL2tYI1/Ba1MoslmCu/FF3Dgv1n32xvaspyl/QOua40eJPhcdotU
	6MIbwEW40TfTASMOhrT9Ecpxtaf86Xc=
Received: from ink.ssi.bg (ink.ssi.bg [193.238.174.40])
	by mx.ssi.bg (Potsfix) with ESMTPS;
	Tue, 17 Dec 2024 00:18:23 +0200 (EET)
Received: from ja.ssi.bg (unknown [213.16.62.126])
	by ink.ssi.bg (Postfix) with ESMTPSA id 1122F15D48;
	Tue, 17 Dec 2024 00:18:11 +0200 (EET)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by ja.ssi.bg (8.18.1/8.17.1) with ESMTP id 4BGMI5p7081391;
	Tue, 17 Dec 2024 00:18:07 +0200
Date: Tue, 17 Dec 2024 00:18:05 +0200 (EET)
From: Julian Anastasov <ja@ssi.bg>
To: David Laight <David.Laight@ACULAB.COM>
cc: "'netdev@vger.kernel.org'" <netdev@vger.kernel.org>,
        "'Naresh Kamboju'" <naresh.kamboju@linaro.org>,
        "'Dan Carpenter'" <dan.carpenter@linaro.org>,
        "'pablo@netfilter.org'" <pablo@netfilter.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "'open list'" <linux-kernel@vger.kernel.org>,
        "'lkft-triage@lists.linaro.org'" <lkft-triage@lists.linaro.org>,
        "'Linux Regressions'" <regressions@lists.linux.dev>,
        "'Linux ARM'" <linux-arm-kernel@lists.infradead.org>,
        "'netfilter-devel@vger.kernel.org'" <netfilter-devel@vger.kernel.org>,
        "'Arnd Bergmann'" <arnd@arndb.de>,
        "'Anders Roxell'" <anders.roxell@linaro.org>,
        "'Johannes Berg'" <johannes.berg@intel.com>,
        "'toke@kernel.org'" <toke@kernel.org>,
        "'Al Viro'" <viro@zeniv.linux.org.uk>,
        "'kernel@jfarr.cc'" <kernel@jfarr.cc>,
        "'kees@kernel.org'" <kees@kernel.org>,
        Simon Horman <horms@verge.net.au>, lvs-devel@vger.kernel.org
Subject: Re: [PATCH net-next] Fix clamp() of ip_vs_conn_tab on small memory
 systems.
In-Reply-To: <24a6bfd0811b4931b6ef40098b33c9ee@AcuMS.aculab.com>
Message-ID: <5e288aa5-5374-5542-b730-f3b923ba5a36@ssi.bg>
References: <24a6bfd0811b4931b6ef40098b33c9ee@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_142513_638022_0556B506 
X-CRM114-Status: GOOD (  24.96  )
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


	Hello,

On Sat, 14 Dec 2024, David Laight wrote:

> The 'max_avail' value is calculated from the system memory
> size using order_base_2().
> order_base_2(x) is defined as '(x) ? fn(x) : 0'.
> The compiler generates two copies of the code that follows
> and then expands clamp(max, min, PAGE_SHIFT - 12) (11 on 32bit).
> This triggers a compile-time assert since min is 5.

	8 ?

> 
> In reality a system would have to have less than 512MB memory
> for the bounds passed to clamp to be reversed.
> 
> Swap the order of the arguments to clamp() to avoid the warning.
> 
> Replace the clamp_val() on the line below with clamp().
> clamp_val() is just 'an accident waiting to happen' and not needed here.
> 
> Detected by compile time checks added to clamp(), specifically:
> minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/all/CA+G9fYsT34UkGFKxus63H6UVpYi5GRZkezT9MRLfAbM3f6ke0g@mail.gmail.com/
> Fixes: 4f325e26277b ("ipvs: dynamically limit the connection hash table")
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: David Laight <david.laight@aculab.com>

	Looks good to me, thanks to everyone!

Acked-by: Julian Anastasov <ja@ssi.bg>

	Pablo, Simon, probably, this should be applied
to the 'nf' tree as it fixes a build failure...

> ---
> 
> Julian seems to be waiting for a 'v2' from me.
> Changed target tree to 'net-next'.
> I've re-written the commit message.
> Copied Andrew Morton - he might want to take the change through the 'mm' tree.
> Plausibly the 'fixes' tag should refer to the minmax.h change?
> This will need back-porting if the minmax set get back-ported.
> 
> I'm not sure whether there ought to be an attribution to Dan Carpenter <dan.carpenter@linaro.org>
> 
>  net/netfilter/ipvs/ip_vs_conn.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/netfilter/ipvs/ip_vs_conn.c b/net/netfilter/ipvs/ip_vs_conn.c
> index 98d7dbe3d787..c0289f83f96d 100644
> --- a/net/netfilter/ipvs/ip_vs_conn.c
> +++ b/net/netfilter/ipvs/ip_vs_conn.c
> @@ -1495,8 +1495,8 @@ int __init ip_vs_conn_init(void)
>  	max_avail -= 2;		/* ~4 in hash row */
>  	max_avail -= 1;		/* IPVS up to 1/2 of mem */
>  	max_avail -= order_base_2(sizeof(struct ip_vs_conn));
> -	max = clamp(max, min, max_avail);
> -	ip_vs_conn_tab_bits = clamp_val(ip_vs_conn_tab_bits, min, max);
> +	max = clamp(max_avail, min, max);
> +	ip_vs_conn_tab_bits = clamp(ip_vs_conn_tab_bits, min, max);
>  	ip_vs_conn_tab_size = 1 << ip_vs_conn_tab_bits;
>  	ip_vs_conn_tab_mask = ip_vs_conn_tab_size - 1;
>  
> -- 
> 2.17.1

Regards

--
Julian Anastasov <ja@ssi.bg>


