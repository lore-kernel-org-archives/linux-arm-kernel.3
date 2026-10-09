Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D31CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyOSgWJY/HMkCj7brjmuNGNFpEo79D8extLj/8v1jbA=; b=jsNn16gjUa1HJMNWhhJgB1GRpY
	8Pv+arxZGwGuZocnBMA32W37uSoeJaumZrZzBI/N1fUvqYIV0YQH5IIf/uV3sx05NuELnHuG8+2h6
	Cp/SXk63wxJSrK9ixvtcQFWB632VdX7Aoec5emVCIV1fJiv+ZSbYfOy8XSh6vO/crhmZaKH/v2MOV
	Qgwla/gNj7exQuc8EyaiVn+EiwE8x9le9ceLByAT3gBX3jxT1sUBSZn/ZbjXiKsZi2TbVrqzGJye4
	tYoFs566qbracdcWQgH1U/AbfCRlo9MxGC3PFiB2aQD+CHKwRlWdzr8wJkj7KiWUnpdTQVMwD/5vU
	9IiDjvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDE1-00000006dS9-3W6o;
	Fri, 09 Oct 2026 16:13:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDE0-00000006dS3-3jRe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:13:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC55360098;
	Fri,  9 Oct 2026 16:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6C71F00893;
	Fri,  9 Oct 2026 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791562415;
	bh=AyOSgWJY/HMkCj7brjmuNGNFpEo79D8extLj/8v1jbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SfR7CUVLdeT/UfZPvAVNa7YsEIY6HJLtUlQFrA0xPpcFjqICzpMijf9sZ/vAzKy9V
	 JEmxxoSohJGdKyAajwm9/PYLdkinS2tgZRqYOMlkE9w2FG2+NSjwJvhAelHjzD689y
	 pksDxmf0L+n88SuLUjVEQtobn1yZCypuasi74H6cRi8vDrgfWOkzL7rNQQh7K8qYVa
	 Xf9Rd8nCEXlomHg5lkae7kn4gGFJACXo/XB/GwTnGDkhgDoZTutS2mxYzABdL2qOl7
	 sNBjCYIxCauGjN8eoy2q4KFss9NGRg3/0CldmgI/AYTsWQmwek8hbAhhmaTeVopqgc
	 fSqpXuInOnrMQ==
Date: Fri, 9 Oct 2026 18:13:28 +0200
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	=?iso-8859-1?B?Suly6W15?= Jean <Jeremy.Jean@oss.cyber.gouv.fr>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] lib/crypto: arm64: Fix lost Poly1305 carry when
 resuming NEON state
Message-ID: <20261009161328.GE321175@quark>
References: <20261009125354.315476-1-ebiggers@kernel.org>
 <20261009125354.315476-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261009125354.315476-2-ebiggers@kernel.org>
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

On Fri, Oct 09, 2026 at 02:53:53PM +0200, Eric Biggers wrote:
> represents 2^128 + 4, so the conversion must produce the base 2^64 limbs
> h0 = 4, h1 = 0, h2 = 1.  The low 64-bit word sums to 2^64 + 4 and the
> middle 64-bit word (including the carry from the low word) sums to 2^64,
> so both carry out.  However, the carry out of the middle word goes to
> d2, leaving h2 = 0 and the value 4 instead of 2^128 + 4.

Going to change it to this instead, which should be clearer:

    represents 4 + 2^26*2^26 + (2^26-1)*2^52 + (2^26-1)*2^78 +
    (2^24-1)*2^104 = 2^128 + 4, despite the bit representing the 2^128
    term (bit 24 of h4) not being set; the extra comes from the h1 limb
    being above the normal base 2^26 range.  When this value is
    converted into the non-redundant base 2^64 form, a carry into the
    new 2^128 bit (in bit 0 of h2) is necessary to preserve the value.

> [EB: Rewrote the commit message to more clearly describe the bug and
>  its impact, and removed a lot of pointless LLM-generated text.]

Changed to

 [EB: Rewrote the commit message to more clearly describe the bug and
  its impact, and simplified explanation about why there's a carry bit.]

since Jérémy said it actually wasn't LLM generated.

- Eric

