Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C940ACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 00:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xrat+1ehp3aNhtXJsdSFFasDy/c5q7k1BfU1KQsUgQo=; b=WsChxYyOMjtu+A4zmACwKLT+Ny
	XXcETv2uZnswBXI1TdHet85VFnnM9TuLqrdAOnekO/DfNTEeU0PlYFvqAgWHzzZ+BX+tQNV9JwI+w
	t0AnKADIgmmS3pWcKim2h1F+LPW8KycIEtxGWQVY5aCHOiW8ckY8WjjHHA+F0oTT19SzS5MmlFXLK
	CF3S0tGqkSBboL0sK1a9iuxftN7WG0XKdHR+eIw4n9GvaFNfEHhYUVELWfMvtdCyvSCqXsTWDuPkB
	TWr3vGIPkvXDuh60jo0goXgGh9kLBk3Z78OZaz5T7Ofyx6mm2Ch9q0zTKSiArlBuO7sXrGnEL7nmo
	5NnXn3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzlFT-00000004OLW-1zMN;
	Sat, 20 Sep 2025 00:14:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzlFR-00000004OKz-0Tei;
	Sat, 20 Sep 2025 00:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DEB844961;
	Sat, 20 Sep 2025 00:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F96FC4CEF0;
	Sat, 20 Sep 2025 00:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758327280;
	bh=O0bDy6Ix2CSa2N0Q4JTxtP6HuLT6aOmOzysAyCGa/JQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=L3hzw6hsVszuDiJHPBCY82Amym8WdjwMr0g4coY501cIx1Z/cbkmYyw7MErPFCgVY
	 9zOiRwZwy5zm841JL2MsK2jzXeQ3zuoERdnS/L8wMExSvv1T0o7mYbdFrsEWlA4SkK
	 3svAd1LFwZ7z30kKWvM0DWesAGVpKsw7bZJco19Lm5M47zZgjVJZtlKLQMBsZ7yYaA
	 FJfwNW5bTkOWmd9ZQMsw1BtXtJxClMXZcosYuHHq5MUc0nBPwOIMN0/MJI58CzbCdH
	 z1MYamA/HTdmcm+e+/bELj1O9aqgYTVQyFTPfnXkV3EothiEolqhY+/B6Fha//O50S
	 IdN4mLe8ZgdZQ==
Date: Fri, 19 Sep 2025 18:14:34 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
cc: Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
    Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, 
    Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Peter Xu <peterx@redhat.com>, 
    Oscar Salvador <osalvador@suse.de>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v2] asm-generic: Remove pud_user() from pgtable-nopmd.h
In-Reply-To: <c2c9fc69871a7caaa205e237ff73557f19f5e176.1755509286.git.christophe.leroy@csgroup.eu>
Message-ID: <d9f45fdb-4ecd-23b0-6c98-846be24976aa@kernel.org>
References: <c2c9fc69871a7caaa205e237ff73557f19f5e176.1755509286.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_171441_172331_9976D811 
X-CRM114-Status: GOOD (  10.12  )
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

On Mon, 18 Aug 2025, Christophe Leroy wrote:

> Commit 2c8a81dc0cc5 ("riscv/mm: fix two page table check related
> issues") added pud_user() in include/asm-generic/pgtable-nopmd.h
> 
> But pud_user() only exists on ARM64 and RISCV and is not expected
> by any part of MM.
> 
> Add the missing definition in arch/riscv/include/asm/pgtable-32.h
> and remove it from asm-generic/pgtable-nopmd.h
> 
> A stub pud_user() is also required for ARM64 after
> commit ed928a3402d8 ("arm64/mm: fix page table check compile
> error for CONFIG_PGTABLE_LEVELS=2")
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Acked-by: Paul Walmsley <pjw@kernel.org> # riscv


- Paul

