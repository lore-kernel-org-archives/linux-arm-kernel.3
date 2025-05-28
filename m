Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884B0C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 17:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxS9LOz/lna+lajGxPcojitM/qIvBOh9GofGcmD1jvI=; b=s9s76Itol65KoVP9YFroCHkUvf
	5k6F804eWOG0HZ2dgnLSsJyI4Lnovz8LumF/w8FN1pPyxfcGFxQ9s92+ScLvDttxFFMrz1IW3e9t4
	w2pQYZSNDxscZLXA96uRkkMKPOfEPkdPpp7woRkE3mmOtUkGV3DBnBToaz5pCgWyXvsF7m0E0HqWZ
	HO5hDjQ8lMhkfUjbDX1Wd2bFuL1kN744BIRldL+/mCXj7PapFPydTWpdCPlKgBhQZ3pir/TC7mqG9
	RwDsWyKBCmwx6LGBel9T9ICGn/Q1PyCaZuMA2KRx71JI1m2dm8cpMc7vrfKU+/to6E9G/jUVGgsgk
	eLnT/tqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKog-0000000DqZn-3iCo;
	Wed, 28 May 2025 17:43:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKmX-0000000DqHe-0GVt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 17:41:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2EB8CA4F8EC;
	Wed, 28 May 2025 17:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1279C4CEED;
	Wed, 28 May 2025 17:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748454095;
	bh=wKtF2TTBr95PsHmFi5eC75IGaydJ9FAvyCT1U7OGi2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VyDBcMSYJjRDXdJy03WeDhWnlWXnaVGjLHm7CF/wOV9cyCp0wLkY8Gu+dXFOLhpUm
	 8ZWDDIutYeuQoLisXfnZaETOqR73mi8Yk/6NvuG5gzCmU865gKBHzqz8aJsGW8LkZ8
	 /D/eOieVlO0JXUCWSfuwW6fq7gWY5IVUAD4B7hJkEd6A1n6q1904ylhlThRJx6C2Nl
	 Xi7+DW6tu0/fuTO1QssdqXPLtAaXty+SSOSEsTrMVNy926zTXoNa74KCQnB0OTOfC5
	 2jQHewgBoz0EpiAN5HsM+utAswYG7hsCd5OnrgIo4fVSAQxzAfSfmITXzouH7C5IZf
	 5xT3DeFEuuWHw==
Date: Wed, 28 May 2025 10:41:32 -0700
From: Kees Cook <kees@kernel.org>
To: Jann Horn <jannh@google.com>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Subject: Re: [linus:master] [crypto] 40b9969796:
 UBSAN:unsigned-integer-overflow_in_lib/crypto/chacha20poly1305-selftest.c
Message-ID: <202505281040.C8E022E@keescook>
References: <202505281024.f42beaa7-lkp@intel.com>
 <20250528061427.GA42911@sol>
 <202505280937.6802F0F210@keescook>
 <CAG48ez3i37DYjM+SjBjC-VKQOiJs7-YVdLEQ7aqXQwxWs-rS9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez3i37DYjM+SjBjC-VKQOiJs7-YVdLEQ7aqXQwxWs-rS9Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_104137_230281_A961240C 
X-CRM114-Status: GOOD (  27.66  )
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

On Wed, May 28, 2025 at 07:15:18PM +0200, Jann Horn wrote:
> On Wed, May 28, 2025 at 6:46 PM Kees Cook <kees@kernel.org> wrote:
> > On Tue, May 27, 2025 at 11:14:27PM -0700, Eric Biggers wrote:
> > > If this new sanitizer is going to move forward, is there any sort of plan or
> > > guide for how to update code to be compatible with it?  Specifically considering
> > > common situations where unsigned wraparound (which is defined behavior in C) can
> > > be intentionally relied on, like calculating the distance from the next N-byte
> > > boundary.  What are the best practices now?
> >
> > Hi, yes, this is still under development. I tried to make it hard to
> > enable accidentally (not via COMPILE_TEST, not UBSAN-default, etc), but
> > we (still) don't have a way to disable configs for randconfigs. :(
> >
> > We're hoping to see Clang 21 with the more versatile Overflow Behavior Types:
> > https://discourse.llvm.org/t/rfc-v2-clang-introduce-overflowbehaviortypes-for-wrapping-and-non-wrapping-arithmetic/86507
> >
> > and our current testing is showing many fewer false positives. (Having
> > run syzkaller for weeks now.)
> >
> > > Documentation/dev-tools/ubsan.rst says nothing about this and only mentions
> > > "undefined behavior", which this is not.
> >
> > Right -- this will get extensive documentation before we move it out of
> > its development phase.
> >
> > I'm not sure how to enforce "don't enable this unless you're developing
> > the Overflow Behavior Types" with current Kconfig, given the randconfig
> > gap... I have some memory of Arnd doing something special with his
> > randconfigs to avoid these kinds of things, but I can't find it now.
> 
> You could depend on CONFIG_BROKEN, the canonical "if you enable this
> and stuff breaks, it's your fault" flag?

Yeah. Talking with Justin out of band, he suggested the same. It's
easier to carry a 1 line patch downstream while we're testing to enable
this feature, so I'll send a patch to add CONFIG_BROKEN for now.

-Kees

-- 
Kees Cook

