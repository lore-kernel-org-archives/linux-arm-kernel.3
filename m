Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4555DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 15:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyam2Laux0ugR7DF3vNNAwkYT1XfFoet9+lfV2VmL18=; b=eCU2IKu8mozHzVsFPixG14JDO/
	3gKYc578e3EPaKCg9FFImhVg2546MljGJ9QRAc34YxR/DsNMnaklZcMkh9C9YEyfVU4JICqk1jj5e
	z95IqncOjTV915pjKfxwX7DJeD6achgZoHPmTOweE0cT5oRh2ixMAoWcBNX8t8JQ2/CX28i014nZc
	jaX2+IYBrrtXCv+DDOf+l9MAQXhQl40xwiJX2hG8Y1c2Z/47d3S0JYvol2qMQXuGDxKMsmc1jSlP+
	OVkIgX60G01Fs/qpPuiGJRRVJaUCIpBkp0n91T9D+iNyrZmE4DNeblkfnKCXsysuDwCCZU3YXZVGl
	YDrZ7Ogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nHm-0000000Ga1a-15Mq;
	Fri, 18 Apr 2025 15:05:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nE0-0000000GZ37-10mm;
	Fri, 18 Apr 2025 15:01:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 671CC4A218;
	Fri, 18 Apr 2025 15:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F22C4CEED;
	Fri, 18 Apr 2025 15:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744988511;
	bh=8A/sIYJ5SKbc782T5XhHrLEMq+A/QJdgAYupGNodiY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/hWodxCNPsy1G6IUlmfsUKPqnT1Ujt4MbzqWbcblOUnrPeC6mUHiaQLG39y8aCpX
	 CqM4lGrfOvsbTyqM0ArrrdiSchD0Xw68g1637tLVyX/a9miA1OW2TXJvaaJKssdA15
	 inuGhv2ZpxgFYHibi/I/56uplFouJCiprgLowDFdyI+DlKXeBDXjv5/ilK8nceskID
	 33KmL/slPYF0SJaOQKKaeK1Y5oGNFE2aC5lj8BAeoOh/smuVOSxzQ777mGw5dvt2gU
	 JYALSfe1bQeiyShNesrRus2B56KAIV2A8kPS//gNu0iYoXVZZSAu0XoWTuho1RFTd7
	 UcpVyOsFppB7Q==
Date: Fri, 18 Apr 2025 08:01:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <20250418150149.GB1890@quark.localdomain>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
 <20250418033236.GB38960@quark.localdomain>
 <aAHJRszwcQ4UyQ2e@gondor.apana.org.au>
 <20250418040931.GD38960@quark.localdomain>
 <aAIMhLD3UMM41JkT@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAIMhLD3UMM41JkT@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_080152_320046_BEE069FA 
X-CRM114-Status: GOOD (  11.98  )
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

On Fri, Apr 18, 2025 at 04:25:40PM +0800, Herbert Xu wrote:
> On Thu, Apr 17, 2025 at 09:09:31PM -0700, Eric Biggers wrote:
> >
> > arch/$ARCH/lib/crypto/ is the "right" way to do it, mirroring lib/crypto/.  I
> > was just hoping to avoid a 4-deep directory.  But we can do it.
> 
> You can do that in a follow-up, assuming nothing else pops for this
> series.

Doing it as a follow-up when this series hasn't been merged yet would be kind of
silly, since it would undo a lot of this series.  I'll just send out a v2 of
this series.

- Eric

