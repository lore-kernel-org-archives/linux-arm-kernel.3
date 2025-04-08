Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5F5C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 04:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mahaabwDrQlQzhrNZftxJhgbFWCOhwEQ+DtuX71tBgo=; b=n6/n/wcUNZ2QHcTc+i24XxpYvE
	F7CLp2OW+YWFLoMidmhd7d4Mxe50Z74n0KzqIKOJIL+bHwne56mREcmPnQTOM0keA/1yW/YNnkxap
	kacr/S+0kQ2OqzuUGKjHe5kPlGIphaJc3rFe3Fi7jCcdHpaNwvKZvrFtt0tV/ceA9wTYh4uPgfosD
	9Cs8S6kBzPEtRJ45PKPCyYU6yleA8j+Jm6kDbDbkIkZi2WVs07+M0VsjvTq0uXJksFZ0fWGWWhizj
	sVgKxPkNQUFvFvuY1LwgskSOkhC+kkke4RZhZ0X8Il48BFtx+FphZJP3FxS6GnFa7sBW21O63MB6b
	YZgPN6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u20Vc-00000002gr6-0pCz;
	Tue, 08 Apr 2025 04:24:24 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u20Tq-00000002glR-40rR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 04:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mahaabwDrQlQzhrNZftxJhgbFWCOhwEQ+DtuX71tBgo=; b=YfBrzn9h6eYCkpnfx+kdVgpMYM
	/ORtIBDJCM6yaKVs3H08hjqHKk8iDe9xqkermuv0sDSrgaEvWhwOAf2GYX8dJ7qxMeajRitWdRlLi
	P1OtoaL22eOs7/kuKS40NdC48/wwk0Aa9Vk3rlDvpQw6QexNPKi00vkSVM1YiXlyis4XlaHM5MVmK
	J/OUN6sylUHcgGCidEUttf7D82CbMQ0+XwLa2XM2lxD8hSUOE/j85eafYrOqrvtVZfFeCLZqnfQaa
	ahEwWt7J6P3ZxuLQmjFqMHr7KvK0/prUfnqVvWhCgoz5LJXwpPKBSjfe5z6XwoXfh5lYxnKtpGW1V
	W+IJySFQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u20TZ-00Dlme-1v;
	Tue, 08 Apr 2025 12:22:18 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 08 Apr 2025 12:22:17 +0800
Date: Tue, 8 Apr 2025 12:22:17 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Li Zhijian <lizhijian@fujitsu.com>
Cc: davem@davemloft.net, linux-crypto@vger.kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] crypto/testmgr: Fix acomp_req leak
Message-ID: <Z_Skef-ZAYAzPfOF@gondor.apana.org.au>
References: <20250408041647.88489-1-lizhijian@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408041647.88489-1-lizhijian@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_212234_992980_8662E4BD 
X-CRM114-Status: GOOD (  13.74  )
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

On Tue, Apr 08, 2025 at 12:16:47PM +0800, Li Zhijian wrote:
> The kmemleak reported that
> ...
> unreferenced object 0xffff888108d6c300 (size 256):
>   comm "cryptomgr_test", pid 183, jiffies 4294700957
>   hex dump (first 32 bytes):
>     00 c1 d6 08 81 88 ff ff 00 cb d6 08 81 88 ff ff  ................
>     50 cd a7 81 ff ff ff ff b8 fb 93 02 00 c9 ff ff  P...............
>   backtrace (crc 29cca632):
>     __kmalloc_noprof+0x2fa/0x430
>     test_acomp+0x174/0x960
>     alg_test_comp+0x6f/0x90
>     alg_test.part.26+0x105/0x410
>     cryptomgr_test+0x20/0x40
>     kthread+0x10c/0x250
>     ret_from_fork+0x30/0x40
>     ret_from_fork_asm+0x1a/0x30
> unreferenced object 0xffff888108d6c100 (size 256):
>   comm "cryptomgr_test", pid 183, jiffies 4294700972
>   hex dump (first 32 bytes):
>     00 1d da 08 81 88 ff ff 00 c3 d6 08 81 88 ff ff  ................
>     50 cd a7 81 ff ff ff ff b8 fb 93 02 00 c9 ff ff  P...............
>   backtrace (crc 3047d62b):
>     __kmalloc_noprof+0x2fa/0x430
>     test_acomp+0x174/0x960
>     alg_test_comp+0x6f/0x90
>     alg_test.part.26+0x105/0x410
>     cryptomgr_test+0x20/0x40
>     kthread+0x10c/0x250
>     ret_from_fork+0x30/0x40
>     ret_from_fork_asm+0x1a/0x30
> 
> acomp_request will be chained to req[0], however,
> acomp_request_free(), it will not free the whole chain.
> 
> Fix it by freeing them one by one.
> 
> Fixes: 99585c2192cb ("crypto: testmgr - Add multibuffer acomp testing")
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Closes: https://lore.kernel.org/linux-crypto/20250408002741.089f1e9a@outsider.home/
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
> ---
>  crypto/testmgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the patch but this will be removed by

https://patchwork.kernel.org/project/linux-crypto/patch/048b1e176dd3507ec31497ccf215630dc2b2ed04.1744018301.git.herbert@gondor.apana.org.au/

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

