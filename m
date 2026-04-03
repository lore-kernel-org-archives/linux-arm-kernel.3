Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524ACE85368
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 20:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2av+ftgNuFD53hSt56LSxxtAxbO0fchOHbj967j2GV0=; b=ThUY81CpD4JP/eKwInupW2kqxz
	B2tdJT9qrG4ePlGIWKWw1V6Dk50wWKPZ6SDedpGhcKbxqStim/1fmmCcjysNgOdIuToisTDzeJamd
	zTPUUlcZ69sfXw2lUW122eAdEZDX/tdVIxQOeONnriQjukZiFdS1RrmcEgoaANVL76CteIF4i6/hC
	SH9419qBqlqSmu0ou3mlPNq74TfHmnO3rm5f1p+Ou6CLX8p0Gxh5G4qGXp5xIy4JfUYdPpOghTbwT
	HUY2I0CgEZuXWn3J6N1dJgXZDyQDap4eQJziXC89O6kqdREImOEAmwnoOaK5MzQR2m8lP1zcV7+b3
	BixZngZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8khg-00000002WMj-3S6d;
	Fri, 03 Apr 2026 20:01:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8khd-00000002WMN-2NSq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 20:01:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C1390436F4;
	Fri,  3 Apr 2026 20:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED41C4CEF7;
	Fri,  3 Apr 2026 20:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775246472;
	bh=/Hog9vPmqfzb/GY6jN9Z+oDejJCGNcblxWSQxxJFasc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=edZgOFa+m6Z050EMv3mxaVUk0YISBKg2JBK6vbhoknN0eJr3nHfl5BUYDi9pzAK2y
	 w7ZJK2An7cb/s5lyaMZy4827EjdUXAhdnW8554Qo7taO6guAnx+VGDYJ0jR9rDggck
	 hADR/CParFIaOweZKtRH69wpJd9ufF90tUAgu8puluP4zo+47llnbG9Qn3WM9Kg6g+
	 6FbhhMuCih/EuAKhSXzlu7ZBNJnf0tDtUSzgIgKAiEm0WebVOfgL1OsbLGhfafO2Sr
	 Izf8LvQ4JWhoh2mDOqihYfR2myKnFJA6WwIdzSyMUGgVOtYhifK2AXFhddU2fbujNb
	 22VJxQgLNIT7A==
Date: Fri, 3 Apr 2026 12:59:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Demian Shulhan <demyansh@gmail.com>
Subject: Re: [PATCH 0/5] crc64: Tweak intrinsics code and enable it for ARM
Message-ID: <20260403195958.GA2882@sol>
References: <20260330144630.33026-7-ardb@kernel.org>
 <20260401195943.GA2466@quark>
 <dc424b4a-11b5-475f-a53a-987b5813bac5@app.fastmail.com>
 <20260402234028.GA2256@sol>
 <9b5affa6-0e04-4256-b740-6ffdad1747b9@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b5affa6-0e04-4256-b740-6ffdad1747b9@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_130113_664251_9E8A5722 
X-CRM114-Status: GOOD (  22.50  )
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

On Fri, Apr 03, 2026 at 08:49:04AM +0200, Ard Biesheuvel wrote:
> 
> 
> On Fri, 3 Apr 2026, at 01:40, Eric Biggers wrote:
> > On Thu, Apr 02, 2026 at 10:52:17AM +0200, Ard Biesheuvel wrote:
> >> 
> >> On Wed, 1 Apr 2026, at 21:59, Eric Biggers wrote:
> >> > On Mon, Mar 30, 2026 at 04:46:31PM +0200, Ard Biesheuvel wrote:
> >> >> Apply some tweaks to the new arm64 crc64 NEON intrinsics code, and wire
> >> >> it up for the 32-bit ARM build. Note that true 32-bit ARM CPUs usually
> >> >> don't implement the prerequisite 64x64 PMULL instructions, but 32-bit
> >> >> kernels are commonly used on 64-bit capable hardware too, which do
> >> >> implement the 32-bit versions of the crypto instructions if they are
> >> >> implemented for the 64-bit ISA (as per the architecture).
> >> >> 
> >> >> Cc: Demian Shulhan <demyansh@gmail.com>
> >> >> Cc: Eric Biggers <ebiggers@kernel.org>
> >> >> 
> >> >> Ard Biesheuvel (5):
> >> >>   lib/crc: arm64: Drop unnecessary chunking logic from crc64
> >> >>   lib/crc: arm64: Use existing macros for kernel-mode FPU cflags
> >> >>   ARM: Add a neon-intrinsics.h header like on arm64
> >> >>   lib/crc: arm64: Simplify intrinsics implementation
> >> >>   lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64
> >> >
> >> > I think patches 3 and 4 should be swapped, so it's cleanups first (which
> >> > make sense regardless of the 32-bit ARM support) and then the 32-bit ARM
> >> > support.
> >> >
> >> 
> >> Ok.
> >
> > I can also apply patches 1-2 and 4 now if you want.  Let me know if I
> > should do that or if a new version is coming.
> >
> 
> Yes, good idea. I'll take care of the ARM stuff next cycle.

I've applied patches 1-2 and 4 to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

- Eric

