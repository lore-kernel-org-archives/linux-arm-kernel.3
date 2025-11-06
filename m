Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639B4CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 07:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBgLji/1weaJQdSKWmMv3FFhXVrOshzsvKfPhLEbqZo=; b=xymghQwFeJXOjx/4Q/FSrsX11z
	yHzK5s+aEKpBKtKsTlaS/hXKoydXfnxmUwUrtlecW6d9+Q3SsCletqUYkMtGEQFxpJkFBO5IDb++1
	G2Sdfaf2w7RiqZQMxoCbWyH06VFQvLJxCtbjGJA+Fqov1+b1FJPCmCWcbbKcepIiHSqCqS2UU4d6p
	jdHk/A7NavQs6z/BAEXz4q270k3Ai4G+w84sJbMuAq3HnnFZeFrweJuuRbcuVtOeNN/HKLGJY62JZ
	Ld6qTXSRqlZsxNSUZM8gIHz2A+Bdz4d7Frs0hqyGaYLs/u8YekLOK/0v+ZT4YVdWfjOVavBzJW9dL
	5282Omug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGu7G-0000000Ez83-3eA1;
	Thu, 06 Nov 2025 07:09:06 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGu7E-0000000Ez72-1QaJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 07:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=BBgLji/1weaJQdSKWmMv3FFhXVrOshzsvKfPhLEbqZo=; 
	b=kdLXakno7SHSKk9tS2ivYVRxBzqh7EMBU8ZZ1sZQ8Fl3bi7Fs0+TcW5FMHuQlZcXgE/8Crf/+nM
	Jwg6WdGBm8uVUBmuIG7usQtPLJEm1AypugwYoryTWl3GJ7w0BN26qh5Hw80FwRymAw4Qxx5plwSvB
	LFJLEkBjv5ALAcgoMcuzNOkyWXoMPH7sMOaHS3cFQOHTUfuaECsdubVmgNuls+Vbe+wL4S8ME/DYO
	VZPxtm9iGAgtC2bbr7zwqRA9zOgR0dV07fLMktWMYF7lWJLRSEwjtg31F/iFB4A8AHQYKwr4ZOevM
	oUgyF9OJHmyCKkScSEk14d7FHbumzfZ25jZA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vGu78-000rbR-2T;
	Thu, 06 Nov 2025 15:08:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 06 Nov 2025 15:08:58 +0800
Date: Thu, 6 Nov 2025 15:08:58 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, ebiggers@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v4 01/21] crypto/arm64: aes-ce-ccm - Avoid pointless
 yield of the NEON unit
Message-ID: <aQxJigkyl4bCDpxh@gondor.apana.org.au>
References: <20251031103858.529530-23-ardb+git@google.com>
 <20251031103858.529530-24-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031103858.529530-24-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_230904_398602_5BCBC3F1 
X-CRM114-Status: GOOD (  11.10  )
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

On Fri, Oct 31, 2025 at 11:39:00AM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Kernel mode NEON sections are now preemptible on arm64, and so there is
> no need to yield it explicitly in order to prevent scheduling latency
> spikes.
> 
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/crypto/aes-ce-ccm-glue.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

