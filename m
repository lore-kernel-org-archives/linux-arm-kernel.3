Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAF7C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kTp+KF2ackhDKpdSDEbwId/A0bzbBkflWnXmv2uWRk=; b=nOHw8vfsFRDAqPK/fBgkw3HWEK
	I55uuEgBjk+aobLZzAZD+YXIRHl7qO4FjJBWEillJT+S33a+SWg4QrhTg318U984t45XcCDjc8edr
	jzJtiorXTRSd/HEAqxBRmYb9l+IRVquKpYwwutwp1g7F0COZp4A3DiTXwtOF9Y5aJzcS7gbF6KVbg
	5VVSTNe4AUAOzlmSEfxk9kGwDas+aKfYmlH7LdAvW+oGg3W3d2JTcteVRVa9Qns3+4Bay+lf/DAZE
	MsT+SPX4ZsniXepdf5jJVzoQvcUwJuwrcvs4jjp5KGeNSFJacw+/q5rHa1GC0EpnLY1eBqk4AC9q8
	q9ryR/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bMi-0000000F16L-0CLj;
	Fri, 18 Sep 2026 16:23:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bMh-0000000F15r-0Gvf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 16:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2kTp+KF2ackhDKpdSDEbwId/A0bzbBkflWnXmv2uWRk=; b=V+femqsSG0PY+k2R+RWj3eFXY/
	vaEEdWNqmQ7142jC16GxlT3UZRGcD8g1ckGo7K8a/2Oe3mmYypox/JcfztSpx9N4gpzPlhWSs7+A4
	YBY3MbFD/IAD6ZvDY6F3rgfEu7kTstEpRalo345wpjOpr+QH0i245zbAVkA6jhCECLisOKMeF1cud
	vfxXgOk4ucWhMhfAOp+h9Mzk33ng5I7pD17Qp/OkX3YTOH7xGf1CTFa68NUU5vcThAdBQueP7utHg
	NBdHWdHYOktsmSPmPEaMTlsw4R3kw5pJlkvzjulYjB4KYSAl3ExH9b5EyvMiSz3uisGwzCwUCtz1E
	r2zKM4Ng==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7bMd-0000000AJYl-3VAb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:23:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D026B168F;
	Fri, 18 Sep 2026 09:22:58 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E8AB3F86C;
	Fri, 18 Sep 2026 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789748582; bh=Mh4gt7RAn+qHAj4101OdvRQ24SvZO0G58CPOuegPX0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iq34HdVh6YlEI/sWdUCCv2ENtlQe/91AhJi92p/1myQB9Nd5xNP9T+mKEH/g+UsZy
	 yqeXSG6xdyXbpmrZE2mnOZc+R0TN7ZV/E0pPFzW5hTCyTV0kkETgJT9DTyObzhyAkL
	 Lrb3nMn1qzimqUevi3R9kaUjuATIVfUfMWy/CJiM=
Date: Fri, 18 Sep 2026 17:22:58 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 00/14] arm64: Remove unused big-endian support
Message-ID: <aq1lYhkoMNBW2l-x@J2N7QTR9R3>
References: <20260918145217.1669-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_172304_104461_0D1A34B1 
X-CRM114-Status: GOOD (  12.29  )
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

On Fri, Sep 18, 2026 at 03:52:02PM +0100, Will Deacon wrote:
> Hi all,
> 
> This is version three of the big-endian removal series previously posted
> here:
> 
> v1: https://lore.kernel.org/r/20260811140132.22778-1-will@kernel.org/
> v2: https://lore.kernel.org/r/20260907163726.17104-1-will@kernel.org
> 
> Changes since v2 include:
>   * Retain support for emitting absolute symbol references with PIE
>   * Retain endianness handling on EFI MMU-enabled boot path
>   * Invert compile-time endianness check in Hisilicon sec2 driver
>   * Added some tags

> Will Deacon (13):
>   selftests/arm64: Remove big-endian support
>   arm64: bpf: Remove big-endian support from the JIT compiler
>   arm64: crypto: Assume a little-endian kernel
>   arm64: lib: Assume a little-endian kernel in custom library routines
>   arm64: lib: Assume a little-endian kernel in optimised string routines
>   arm64: assembler: Remove endianness helper macros
>   arm64: vdso32: Always build compat vDSO object as little-endian
>   KVM: arm64: Remove support for a big-endian hypervisor object
>   arm64: Remove all usage of CONFIG_CPU_BIG_ENDIAN
>   arm64: Remove all usage of __AARCH64EB__
>   crypto: hisilicon/sec2: Remove check of CONFIG_CPU_LITTLE_ENDIAN
>   arm64: Kbuild: Remove vestigial big-endian support
>   drivers: Kconfig: Simplify dependencies on ARM64 && !CPU_BIG_ENDIAN

FWIW, for the series:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

