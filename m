Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBDECCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtPswNkFpEI6mYZS8IgiqNzawQ2r3gzjueILPfCT58o=; b=FnhtMSLhA8YqUOz6yZ+C84cBYV
	g35tHcTRTtWOGxTFHRNW0mpDWNgptmHlgrhvPTMpY0vuCLGPvigii2yT4kD45cQApczlpdUS2Stfg
	+f7MELWRux0x/mhViJ80jjTTCdR9rLA3at5aHwQipTxYB1OXcu8++k7xdPmcr71Yal/ceiBRlja3o
	G4Xgsjoa/FjyfP2gghdy5B1/be1jv/XLbQO/DR1Sr8UnRNUUg5M/nG8h7iFKCr9hPQn1Ol8UY9apI
	xogYq7dhzNMTrqRa+2QLg0e0ECHYItBDyRQBTiQDrgosRJO0rie2lerolSvxZQQROcmem6XdG385g
	GT+7nWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEbn-0000000Hamx-1Q6w;
	Tue, 21 Oct 2025 15:49:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEbl-0000000HamW-1cp9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:49:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F02474580C;
	Tue, 21 Oct 2025 15:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742C7C4CEF1;
	Tue, 21 Oct 2025 15:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761061748;
	bh=OXTAf2vBKvRueTPuVWkRspJ60c2GrNw29sEA1D0jzFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l6ZGKHQ6L8Im05FB+cDihH7NFZlsTQicV4UGwn8Imqxk7IiFyNBjRzw826sEI7+Y8
	 pCZRF+q1by0a+vbrJH9pbWZlou32hv6rX5iO7GmWQWU3br7ZRBeyN/S513d0fN11pU
	 QhIE3U6+IjVDcQpkkHcKQcL6wnpM+1rQJVgniuKcrckkuFlONKu9BDXBEnHxN+9aK6
	 Up/QozBsJE0ZdUF2vhZMVCefUw13O2Kaw44hRW6ZRq+NRc1R9jqaUely9y6rvlPbc7
	 L1BEA8+DDiWCsd5VYe/WzrdNqEEB2ZapqLk4AQ5rpQknltDN3oBgM6s6YwpTgCz6bY
	 BSDlps4L5HedQ==
Date: Tue, 21 Oct 2025 15:49:06 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Holger Dengler <dengler@linux.ibm.com>
Cc: Harald Freudenberger <freude@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 15/17] lib/crypto: s390/sha3: Migrate optimized code into
 library
Message-ID: <20251021154906.GB83624@google.com>
References: <20251020005038.661542-1-ebiggers@kernel.org>
 <20251020005038.661542-16-ebiggers@kernel.org>
 <51fc91b6-3a6e-44f7-ae93-aef0bcb48964@linux.ibm.com>
 <20251020175736.GC1644@sol>
 <29e766ca-54e4-453d-9dfc-ea47e2a1f860@linux.ibm.com>
 <5895ed68-dd6e-4f3d-9e6f-c27459556ff7@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5895ed68-dd6e-4f3d-9e6f-c27459556ff7@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_084909_447704_0BD24B29 
X-CRM114-Status: GOOD (  18.81  )
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

On Tue, Oct 21, 2025 at 10:43:00AM +0200, Holger Dengler wrote:
> Hi Eric,
> 
> On 21/10/2025 09:24, Holger Dengler wrote:
> > On 20/10/2025 19:57, Eric Biggers wrote:
> [...]>> - Risk of bugs.  QEMU doesn't support the s390 SHA-3 instructions, so no
> >>   one except the s390 folks can test the code.  I can try to write code
> >>   for you, but I can't test it.  And the s390 SHA-3 code has had bugs;
> >>   see commits 992b7066800f, 68279380266a5, 73c2437109c3.
> >>
> >>   The first priority should be correctness.
> > 
> > Let me figure out, if me and my colleagues can do the testing for you.
> > Unfortunately, I'll be unavailable for the next two weeks. But I'll come back
> > with a solution for the testing.
> 
> I talked to Harald: we can do the testing for you on our development machines.
> Please send new series to us or provide them in your git repo.

Thanks!  I'll Cc both of you on v2 when I send it later.  For now, this
series (v1) can be found in lore at
https://lore.kernel.org/linux-crypto/20251020005038.661542-1-ebiggers@kernel.org/T/#u
And as mentioned in the cover letter it's also retrievable from git:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha3-lib-v1

v1 already has the s390 optimized implementations of
sha3_absorb_blocks() and sha3_keccakf().  If you could enable the
following:

    CONFIG_CRYPTO_LIB_SHA3_KUNIT_TEST=y
    CONFIG_CRYPTO_LIB_BENCHMARK=y

... and then show the results for sha3_kunit before and after the commit
"lib/crypto: s390/sha3: Migrate optimized code into library", that would
be helpful.

In v2, I'll look into providing overrides for the one-shot functions
sha3_{224,256,384,512}() too.  If it works out, I'll ask you to re-test
with that additional change as well.

- Eric


