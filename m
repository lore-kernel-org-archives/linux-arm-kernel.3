Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A124ECCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 07:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ym51P7wIBI8NceAbs2Y6O/r8XdS9ULqAFrC6Z2ACIE=; b=0+MLeZnL25kxmePIg5kUJYYbtV
	wVwMF/FyVyAcKvUiaUhN/D+YO/FeS/kM0SmWV6ZE3hJj3w4QoYxm6s5HGdSql0NQgpDlpcGMApwih
	TO0ZVvzhWyaq/isGYVJgIQvl5GH1haomPTcSqpKn7b56fASWMq+jlHGavsy7g8RY7ZUDr+E/Eco4c
	SKvN8Xlh7LgMkkTrNLqaXHZympBe4AOAFBdefY+7SFbseL5BeqH3eRY5nZhPd1FlPP8+e86EZloLJ
	POByVLl0zGYQVE3adu+aW79PlEPmTvhcOGYzurKytc5kQVsjbglromTYRHV7kZb1K2aGW2Zjv2hn7
	xwmQotgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGu9p-0000000EzSq-39rK;
	Thu, 06 Nov 2025 07:11:45 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGu9m-0000000EzSA-3XhL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 07:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=9Ym51P7wIBI8NceAbs2Y6O/r8XdS9ULqAFrC6Z2ACIE=; 
	b=sYqDDYO6RN6tsSs7WO9n+9tkfLCoc/rERCwD7wp+5WjlKDRdV+OpJywLLXodO1yEVdatvYkxvNH
	fCd4q3nGYs71bfUJhz3N6pKeAYNgsHwKCdZ/sVGtDem9E4yyJHbrZAW/Y5W58Q+BGDpJGPymnVICQ
	Vkw9vWXd9ndlyON4V/aoQ0VDJHfOXEr75NWUmUlHYpGY5ZWqjm4x5PNRyp8PH2Yc0INhZ2TbvrG2Q
	Sd4Ku+TKfPnJB3AuDd6LI+g3DEoz1lGuDfVeM6UUMsLLiFByyg7O+vDeYn13jvHYik38GoV5yM7aW
	8ewsSWABp7DvmznbwqViPlyxjQg93oEIGXVA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vGu9j-000rfi-0Q;
	Thu, 06 Nov 2025 15:11:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 06 Nov 2025 15:11:39 +0800
Date: Thu, 6 Nov 2025 15:11:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, ebiggers@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v4 02/21] crypto/arm64: sm4-ce-ccm - Avoid pointless
 yield of the NEON unit
Message-ID: <aQxKK_5QWa4AM1IH@gondor.apana.org.au>
References: <20251031103858.529530-23-ardb+git@google.com>
 <20251031103858.529530-25-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031103858.529530-25-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_231143_393268_21CE8F9E 
X-CRM114-Status: GOOD (  14.04  )
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

On Fri, Oct 31, 2025 at 11:39:01AM +0100, Ard Biesheuvel wrote:
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
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/crypto/sm4-ce-ccm-glue.c | 25 +++++---------------
>  1 file changed, 6 insertions(+), 19 deletions(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

