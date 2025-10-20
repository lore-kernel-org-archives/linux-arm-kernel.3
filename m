Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12896CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:
	Content-Type:MIME-Version:Subject:Cc:To:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Pa5+u9QjFpdCt3QGlBVROCbgssonhS9xjrxu/nfbTI=; b=fsUUvDSHCGH1Fgev7fzwITDJnY
	hbVPWVOLdU7chzN4/Lwbhfa/bckW6TGz1d955+JZMhedfK1bRVSwQtmCyvRgZfFBFhS9Sn3YRlhRi
	n6VFP3RpPpGSC4MS8QzCO/Yrm2BpwBHP4J5dh4iEG/xiLHA3zo3vsig60ER+T++kXz1CDjxzdmNbt
	UJHSFpDiYWKJSj6Dif+5/D3azqqeiSp+lsdTXcqcrwPAFlz9+nfUPKhWAsJMyl04La/gc2xtQQ1d3
	dHmrBLRpp2hssZGsFHVX3wXGJb6s1URIBvNrn5gcJ6GmoqecII950yysQ5D54LMaFbGpN5qpl11fG
	p4W3R+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnD7-0000000CsGV-11LC;
	Mon, 20 Oct 2025 10:33:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnD4-0000000CsDb-0nHc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 10:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760956427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Pa5+u9QjFpdCt3QGlBVROCbgssonhS9xjrxu/nfbTI=;
	b=RhUKUvR5CaVQto2tLAEir77HWbHqWEqeEluOOLh1yApOsIriAgE94BNuGAcukseK3xPf2x
	S3HO1Jx6RXlG0TzAjIubBXZWsVKePB7iRP1Mr/hIbrCAf7WP0HnuDqinVRfDlqToe1GmBV
	n/ZNTUhReGYg4p+gNs2Vj3OiMqgY7PM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-262-GDfMxLa6PWCu3OjmYdRDgg-1; Mon,
 20 Oct 2025 06:33:43 -0400
X-MC-Unique: GDfMxLa6PWCu3OjmYdRDgg-1
X-Mimecast-MFC-AGG-ID: GDfMxLa6PWCu3OjmYdRDgg_1760956421
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6701E18009C2;
	Mon, 20 Oct 2025 10:33:40 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.57])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9FADD30001BC;
	Mon, 20 Oct 2025 10:33:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251020005038.661542-12-ebiggers@kernel.org>
References: <20251020005038.661542-12-ebiggers@kernel.org> <20251020005038.661542-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, linux-crypto@vger.kernel.org,
    Ard Biesheuvel <ardb@kernel.org>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
    linux-s390@vger.kernel.org
Subject: Re: [PATCH 11/17] lib/crypto: sha3: Simplify the API
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1062181.1760956416.1@warthog.procyon.org.uk>
Date: Mon, 20 Oct 2025 11:33:36 +0100
Message-ID: <1062182.1760956416@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_033350_303088_76A748D9 
X-CRM114-Status: GOOD (  21.01  )
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

Eric Biggers <ebiggers@kernel.org> wrote:

> Instead of having separate types and functions for each of the six SHA-3
> algorithms, instead divide them into two groups: the digests and the
> XOFs.  The digests use sha3_ctx and the XOFs use shake_ctx.  The
> internal context is now called __sha3_ctx.

Please roll changes into the original patches rather than posting them with a
set of "fixes" and add a Co-developed-by tag for yourself.  Or if you want
your authorship on your changes, just switch the Author to yourself and put a
note in the changelog noting that you modified it from what I posted.

> +/** Context for SHA3-224, SHA3-256, SHA3-384, or SHA3-512 */
> +struct sha3_ctx {
> +	struct __sha3_ctx	ctx;
> +	u8			digest_size;	/* Digest size in bytes */
> +};

Don't do that.  That expands the context by an extra word when there's spare
space in __sha3_ctx.  If you go with the separate types, then this field is
redundant.  Actually, I lean slightly towards passing in the desired digest
length to sha3_*final() and doing a WARN if it doesn't match.

> +static inline void sha3_zeroize_ctx(struct sha3_ctx *ctx)

sha3_zero_ctx() please if you don't like "sha3_clear_ctx".  "zero" is a
perfectly usable as verb in itself.

> +/** Zeroize a shake_ctx.  Call this after the last squeeze. */

/**
 * shake_zero_ctx - Clear a shake_ctx.
 * @ctx: The context to clear.
 * 
 * Clear the context for a shake XOF.  Call after the last squeeze.
 */

Something like this, please.

David


