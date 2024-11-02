Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6B1E67805
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k39rYMoWjO6+nGMnJR7eYdIhWn0FMNGEl3Akb1BGe20=; b=3XkMMeyZo0OdzHgf716jfCYbOs
	VBXlzzPTvNo9KyFDgqiJq3NppYImtUgG5egN+V0ERPaPmpnYF16vCb2+oUOiaPogeSi2IwPGWGL8Z
	JY71/tMB+9UCSFzlE9Vv+vUgyjsndDi60Ndm/7f2qVRr0g5sZ4ouq1eF2BNz5pfCZszw5Wmc6l4+f
	wOhRNzTgc/eXj7sX8iJhaYbvieBy09z9yIyHjkdaPf3t9QzoV0Wmfk9VOzFdbduNdvrSp/apkfv3s
	C714Vb5aAy3IXyQDzXvu0U2rmXF7U/uundXnkMEDAhYyzv/C+SuVYOYRmuRBvdSxFlniXOW3Me807
	vbSBR/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7H8L-0000000A2es-15N1;
	Sat, 02 Nov 2024 16:37:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7H6f-0000000A2Sw-2Olq;
	Sat, 02 Nov 2024 16:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9844A40E05;
	Sat,  2 Nov 2024 16:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFD1C4CEC3;
	Sat,  2 Nov 2024 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730565367;
	bh=efn4VpG7p6xFb/S4X3ANPIQCQKp6IXfEyCLH0VWZIIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlpVtnzWd/zB5XmFf980RxtRY6lt695NC4d5DAQWzdJq8P9d/vTpUIa9uhRZxXlNg
	 V1d2QzYc2hobwbFxK4fWDOeUmxR84BXOCx0bbPmSs0eqzXhWKKg5gbNDPcqLKd+ItV
	 0pXNaQHtN/eHmbiDg0Z7SgO8wxZv7vCv329kh8IFtCEPWR/9ZVZ4PS1sF2pFzadm7O
	 KR046MH/33qcHZt/KH+f3V2nu048roFu5R/+fD2mNhDgdzzAq87Tul2/R4s/yR1t+w
	 9f2q8hLJXw4bMrhpexvm+tOdexgGWME42h9ZVxDY348o62nZnpHwJGFG+M9IE+WQFR
	 2wSFp9BrXYOKQ==
Date: Sat, 2 Nov 2024 09:36:05 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
Message-ID: <20241102163605.GA28213@sol.localdomain>
References: <20241026040958.GA34351@sol.localdomain>
 <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
 <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
 <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
 <ZyYIO6RpjTFteaxH@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyYIO6RpjTFteaxH@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_093609_770404_20EEF053 
X-CRM114-Status: GOOD (  22.92  )
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

On Sat, Nov 02, 2024 at 07:08:43PM +0800, Herbert Xu wrote:
> On Sat, Nov 02, 2024 at 12:05:01PM +0100, Ard Biesheuvel wrote:
> >
> > The only issue resulting from *not* taking this patch is that btrfs
> > may misidentify the CRC32 implementation as being 'slow' and take an
> > alternative code path, which does not necessarily result in worse
> > performance.
> 
> If we were removing crc32* (or at least crc32*-arch) from the Crypto
> API then these patches would be redundant.  But if we're keeping them
> because btrfs uses them then we should definitely make crc32*-arch
> do the right thing.  IOW they should not be registered if they're
> the same as crc32*-generic.
> 
> Thanks,

I would like to eventually remove crc32 and crc32c from the crypto API, but it
will take some time to get all the users converted.  If there are AF_ALG users
it could even be impossible, though the usual culprit, iwd, doesn't appear to
use any CRCs, so hopefully we are fine there.

I will plan to keep this patch, but change it to use a crc32_optimizations()
function instead which was Ard's first suggestion.

I don't think Ard's static_call suggestion would work as-is, since considering
the following:

    static inline u32 __pure crc32_le(u32 crc, const u8 *p, size_t len)
    {
            if (IS_ENABLED(CONFIG_CRC32_ARCH))
                    return static_call(crc32_le_arch)(crc, p, len);
            return crc32_le_base(crc, p, len);
    }

... the 'static_call(crc32_le_arch)(crc, p, len)' will be inlined into every
user, which could be a loadable module which gets loaded after crc32-${arch}.ko.
And AFAIK, static calls in that module won't be updated in that case.

That could be avoided by making crc32_le() a non-inline function in lib/crc32.c,
so the static call would only be in that one place.  That has the slight
disadvantage that it would introduce an extra jump into the common case where
the optimized function is enabled.  Considering that some users are passing
small amounts of data into the CRC functions (e.g., 4 bytes), I would like to
minimize the overhead as much as possible.

It could also be avoided by making CRC32 and CRC32_ARCH bool rather than
tristate.  I would prefer not to do that, since there can be situations where
only loadable modules need these functions so they should not have to be built
into the core kernel.

So I plan to go with the crc32_optimizations() solution in v3.

- Eric

