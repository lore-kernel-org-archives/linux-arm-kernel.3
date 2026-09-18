Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A64C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMt7o3T5uUv20HjYgOfM0t0mH+fD9HVr1xfqdEKSJaw=; b=0B0qMgFp4JLgGivNgnY3ScEUeD
	T2fpvaL7m+yW95PikNHQJvX3iV230HK6qOnZtKzuvreXwBA8Um1f5CDrqNbxZDs838k5kuiCack1w
	jKI5hSHHvNgS/XrP3gd6UYXHTrKmynxdBdEMc4i7nvwhL3TlHdwH4Hx+NKob85frSZrO1cOzR2lGx
	wXZe0ADz1uBCQ5qKg8KwTcAtU9YX98V3NkQEpOuACgNoeMT1HzIBgRjzLkankj24ZgkgIUnjakiyY
	XbtzQ7xaasPhnWEK7kwHSyle0BDXqBWiaH8dE5F0oP+Wzn5i44U/lxhE3NGOon+vETuOZC+oaKaAq
	rNzxhmIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VIf-0000000E0E8-2TZM;
	Fri, 18 Sep 2026 09:54:33 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VIc-0000000E0CL-2yLp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:54:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=kMt7o3T5uUv20HjYgOfM0t0mH+fD9HVr1xfqdEKSJaw=; 
	b=BCVr90uRlRxRuJh3Y8AOTFAVsX5cvjnxNQkEtc79U6UX79AU4cSgHYxJSrpd8WYzXtrxpyEalT4
	/gkL5hgTFuJOHkEBLolvp6QoUcPIz/OssCt9Xqh/vvQo5Z+gj3pYgHrWa0dokfbHZ1pogCqiS3Vhl
	NUtc6A7mGAZdoQVM1g7YPabVEWA6HuC7zPEybXLmKOhyyfeUAxhKniA5t04aB+YKNmhrgIqkUGqiI
	TgeVUyP5WOdDePxf5g8bj0UVLKd4Pw0k7lumv5NG4JJEAfL4KcFodLkBqK2LDuFlZnhiGQOjIBeZk
	ui4vc9rMPzfykRTt7mZSGA3pgG0/IuL745Cw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x7VIU-0000000FM1R-1jFG;
	Fri, 18 Sep 2026 17:54:23 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Sep 2026 19:54:22 +1000
Date: Fri, 18 Sep 2026 19:54:22 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <blum@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Michal Simek <michal.simek@amd.com>, Harsh Jain <h.jain@amd.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: xilinx - use kfree_sensitive() in cleanup paths
Message-ID: <aq0KTowSMfT9hUJr@gondor.apana.org.au>
References: <20260908190002.403337-2-blum@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908190002.403337-2-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_025431_775940_B0EBC170 
X-CRM114-Status: GOOD (  11.93  )
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

On Tue, Sep 08, 2026 at 09:00:00PM +0200, Thorsten Blum wrote:
> In zynqmp_aes_aead_cipher() and versal_aes_aead_cipher(), replace
> memzero_explicit() followed by kfree() with kfree_sensitive() to
> simplify the code.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/crypto/xilinx/zynqmp-aes-gcm.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

