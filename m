Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948FCE677F9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 11:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJjP7GEhm9Yido8/2Yi7Kg/9NXfC12+1Hc68o0sqeZo=; b=0v2w1adheOqS3oqXoMS2eI40ec
	KnmLOfI/d2pJqkMeo0JtbGlTqEr7vdjCNjRYOFZeijyDqqNqh0VWzPa8io5jvDpjMzVZ0tsNXEM0f
	1IqvfySMp4utKKKiiMYZxjSVoLQ1xlcF06QKq/12t15Pq0gl0STEgMHhFaHAYv2U3asEsHUUqwCiw
	UoCWzFphKMFo2szxoW5vF0gur1lqWFXWk0VhN+lrYXhAFGKG9TLjpIRFdcPUjVj3xo+q20VQGk2Hx
	5ZFLhpnQd6yNCKi7+lqK/oNWBLR7jQrEnOmi97NHNYox/UQmFn7wbjoVZjbjeMEQU6hHXbxWtnENS
	UlJpFRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7C1c-00000009YWE-3ESH;
	Sat, 02 Nov 2024 11:10:36 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Bzw-00000009YIj-0qAk;
	Sat, 02 Nov 2024 11:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rJjP7GEhm9Yido8/2Yi7Kg/9NXfC12+1Hc68o0sqeZo=; b=ZL/lvV/0NG+jnrygJ/ulUipBlK
	qP9nNwqVQWNXM6Mo4bBB3wTvXS6oRzgEKSHf55UXhXhzl6CQWDcLaKiJVFPLfJWGDYzgQucVtLoXu
	EdgtwDpESedu90LNlQ/3ESKbF6ZllB13v5NTAUox4RYWGiwG0gPbhcB9nhH9k15mZ/+NFfBDzBZhT
	ZXkVWdsMEUU+MuBkn0bvppo0elNwSfGET6JHSBcIK+uM55LY9FOpzK7dAKO7wfzB9TVAXeFIWaCKY
	of25XbcMJoe7WP1/TZrB8M9THZkyGx/lpgRJ1Zogfa/NIqKJhYAzvuJg9eOUYUwS6oN1RCWC7zQ1Z
	rIC9NpXA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t7Bzn-00DyOZ-3A;
	Sat, 02 Nov 2024 19:08:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 02 Nov 2024 19:08:43 +0800
Date: Sat, 2 Nov 2024 19:08:43 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
Message-ID: <ZyYIO6RpjTFteaxH@gondor.apana.org.au>
References: <20241026040958.GA34351@sol.localdomain>
 <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
 <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
 <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_040852_258693_328F6582 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

On Sat, Nov 02, 2024 at 12:05:01PM +0100, Ard Biesheuvel wrote:
>
> The only issue resulting from *not* taking this patch is that btrfs
> may misidentify the CRC32 implementation as being 'slow' and take an
> alternative code path, which does not necessarily result in worse
> performance.

If we were removing crc32* (or at least crc32*-arch) from the Crypto
API then these patches would be redundant.  But if we're keeping them
because btrfs uses them then we should definitely make crc32*-arch
do the right thing.  IOW they should not be registered if they're
the same as crc32*-generic.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

