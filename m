Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B61C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSlq3w/NWZiDr688hgN1b6ijc9WOIvCGvW1QO0Zr6Hw=; b=oPrubhgCopH9imrhuZR4ur0cqG
	zAAsWVMrMvZg+Wg6C2wuzSoMKFyuwu19jZN9c83OjjW1G7isNhuPa+ZVHMosiqF+IrxEjXx17AVdl
	M5lPR/iNAicgw9QsuPlqw0VSOCJ33s/6dW2v9OKWSmjb2BiADjy+BA3ZcuBMHuTl9Y69S7hVccR1O
	lbzi4WViAaIaS/qqMIAv5VCaMlG9iVokzeSmJ4hzSipxaRR+Zg+OxCXkMQwiEdE2jgyitKt9VgfAA
	SLXl+ZdlDUOMLbns0/seUWvMPbdvhfhjDaM9GkWc29BgwZdIKh45xaBIS3BtiLFxntprwdYePgnsB
	G/LbrB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub00C-00000000Pi2-3Q91;
	Sun, 13 Jul 2025 16:56:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazxl-00000000PZf-0hGo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 16:54:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D42FC43AFC;
	Sun, 13 Jul 2025 16:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB5CC4CEE3;
	Sun, 13 Jul 2025 16:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752425644;
	bh=Ow06yQH+u1TUlWbbAwuQ6n6w8NZPq6HcKp1HGVfdQHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psBeNjv+mOu40r53jPAVUKkDWtOk29oQIjMtjuLacb0tSv7EYhwPGGy6ZIDNaeC5J
	 KLGDmHHNB6+CME4dLYfequUVCrgryGgkQH3/ZtSzl4Yh3rWI+TLRdtDli+cU7oBIR9
	 zTOcoykL/TuRZrmJp07fl9qyX5HaP+gNdLKl1Qkj21ZJxQ4c34NFHgWsvkF1Yvqpac
	 eXeBG/x7hXS2z+QMZ9oYTXXdBknoip3I9nOkH1YdWeRxSH9ljLerT2DjATvVmjB0kV
	 z3v7vio7962xSabdWzzE4DRFI1u18UTLVjtmdSYnSdykM0mDtU6xhHaZqh0NBwhRGn
	 IFi7rHIUzSk7Q==
Date: Sun, 13 Jul 2025 09:54:01 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Elliott, Robert (Servers)" <elliott@hpe.com>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH 03/26] lib/crypto: sha1: Add SHA-1 library functions
Message-ID: <20250713165401.GA1773@quark>
References: <20250712232329.818226-1-ebiggers@kernel.org>
 <20250712232329.818226-4-ebiggers@kernel.org>
 <IA4PR84MB4011819C07CD123FEDD4EC75AB55A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA4PR84MB4011819C07CD123FEDD4EC75AB55A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_095405_232923_9863C8F0 
X-CRM114-Status: GOOD (  10.74  )
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

On Sun, Jul 13, 2025 at 03:05:16PM +0000, Elliott, Robert (Servers) wrote:
> > -----Original Message-----
> > From: Eric Biggers <ebiggers@kernel.org>
> > Sent: Saturday, July 12, 2025 6:23 PM
> > Subject: [PATCH 03/26] lib/crypto: sha1: Add SHA-1 library functions
> ...
> > +static void __maybe_unused sha1_blocks_generic(struct sha1_block_state
> > *state,
> > +					       const u8 *data, size_t nblocks)
> > +{
> > +	u32 workspace[SHA1_WORKSPACE_WORDS];
> > +
> > +	do {
> > +		sha1_transform(state->h, data, workspace);
> > +		data += SHA1_BLOCK_SIZE;
> > +	} while (--nblocks);
> > +
> > +	memzero_explicit(workspace, sizeof(workspace));
> > +}
> 
> That assumes the caller will never pass nblocks of 0... should that be
> checked first?

No.  This is a static function, and it's easy to verify that all callers
pass a positive nblocks.  All these code paths are also well-covered by
sha1_kunit.  Also, lib/crypto/sha256.c and lib/crypto/sha512.c do the
exact same thing.  Also, most of the architecture-specfiic
implementations of sha{1,256,512}_blocks() assume positive nblocks too.

- Eric

