Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55865CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 07:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtlUKepwY+74pLSNJNka3fYy+/86iIE0K3o5wL8EfII=; b=3yxmFDvyjT3xBCrtCrCzvFX2tJ
	ciewn25xdzqM+J6WNCOnuwPWiP+8e4dYZ/WSDdLUf8CFXCd58v4NapDIWk86WZXuVe3HIK9T9fOM/
	t2ZR7VJZ6DMTjbQkzor9cSBtxNQG6OflfSrITcC8Sz1VA6rmV3g6JAB2iogSFA7rc8W/XxEWLF1Lw
	sbeSKfagRBw+zW7nTYLLWX9sdfk3xjACa+yflUgJ2A79V5eFpakRYQnQTguJL+QFY9/qPqCidDMy1
	5NAzJVZckw2kUD50gNCIhv0J7riA5oVr52R9MK2LSTHsvMncekDlNR+ZZNI81H8F9oPXarRab7M9E
	evLGBqcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGuDB-0000000Ezsk-3mlO;
	Thu, 06 Nov 2025 07:15:13 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGuD9-0000000Ezs6-0TH2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 07:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=DtlUKepwY+74pLSNJNka3fYy+/86iIE0K3o5wL8EfII=; 
	b=G0gx0CoVsAShTwmJyAqltaBCJ+m7JlFS+Oghr6UVJDAHisrGccKyYNktrsaqB3DAPv+4DXYTYSL
	JrQyuk9BRloqH02UKCHKGn7BUXNiDIgjp7KhPQ0lDsdjpFX+DM5nCf9sckQREsX8XSi2eYS/2dWei
	XBSdP0rbMvLR+pS7ZFJKTSvMsfbklcOKuvDTT8jsJCkhU0UfnPGn8qsPdhD8RJz2POA+SnmVW6Y2V
	bVWxGig52wttmW//6cyu3XakfmoaxQF6V46c36GkXryVZI1q1XLeHrwO5JzO4C3gO9NrxRBaQ/G/3
	L62Ik1mxEZZYPOT0hteMfbFW6we3c2md1+/g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vGuD5-000rkX-0t;
	Thu, 06 Nov 2025 15:15:08 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 06 Nov 2025 15:15:07 +0800
Date: Thu, 6 Nov 2025 15:15:07 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, ebiggers@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v4 03/21] crypto/arm64: sm4-ce-gcm - Avoid pointless
 yield of the NEON unit
Message-ID: <aQxK-6dKZI5Y44VJ@gondor.apana.org.au>
References: <20251031103858.529530-23-ardb+git@google.com>
 <20251031103858.529530-26-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031103858.529530-26-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_231511_151863_E900F00D 
X-CRM114-Status: GOOD (  14.75  )
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

On Fri, Oct 31, 2025 at 11:39:02AM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Kernel mode NEON sections are now preemptible on arm64, and so there is
> no need to yield it when calling APIs that may sleep.
> 
> Also, move the calls to kernel_neon_end() to the same scope as
> kernel_neon_begin(). This is needed for a subsequent change where a
> stack buffer is allocated transparently and passed to
> kernel_neon_begin().
> 
> While at it, simplify the logic.
> 
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/crypto/sm4-ce-gcm-glue.c | 25 +++++---------------
>  1 file changed, 6 insertions(+), 19 deletions(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

