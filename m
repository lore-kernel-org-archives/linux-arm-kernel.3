Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB2DC2D0A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 18:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ex7eoXsOGwipzer8glQZQi9Td7dG2oGs2hJRx0Qok+U=; b=h9tGwZznKC1YFRTSWBVqYH495b
	/fFL0i1NeFGVN1OsC/367AFCqXj0P7ASZWdAQaw8u9c0XL8Cj9PHCVSZF42aU6efAfVlJ32TjJ+1U
	Nwk3u3ReTl8aHFKfd+CfM4FAyiLIoV6y1+kBCBLEI0sDZBdfShZ0Uwj4x8NtMvgDAhuS9986doSz3
	GxTqqIvD8HOq+HyvZpLpbfPX/v2y2Dsc4Nyb9diBstLDZ4SU44iAM47lGX1BBLRGX3wrqzgLoZDx9
	cO3M4L3HQbElJ0zjTB3T2Q7eccepmBT0gg2ctVsjWOoJLH1QGMbZf7/X5LN/6+5hAObh1dhSZd3RP
	CxGyaejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPwi-000000016nR-0Zak;
	Thu, 15 Oct 2026 18:12:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPwc-000000016lX-1v8z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 18:12:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C8A914BF;
	Thu, 15 Oct 2026 11:12:41 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A7523F871;
	Thu, 15 Oct 2026 11:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792087964; bh=V86yQw2cdso6AicU0JXttx1tZfScvEduAhjH1cO1zcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HWaCx8U38ceCAPFYpqDCW/6C9dyaKcOx8EI3XD3Zn0Rud99NfAzNb7W4b/0EuaGjL
	 7bwM2oNhjdEDLg9qHR/0ldAnLQu3jaOlj7oTGPKBlIGJjFtxVCTWnGv7w6/zRGEhiw
	 6c4+WkVy7wpy6sVvjmtvrgVqaovONHfGxPngPmRA=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Iurii Trukhin <yuri@trukhin.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: raise default ARCH_MMAP_RND_BITS for 48-bit and 52-bit VA
Date: Thu, 15 Oct 2026 19:12:35 +0100
Message-ID: <179208793359.161729.16083745247655027140.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAOx7e9K5sgNcWNj4CemyZd0Ar1ZjR4o44B4nryohq-Ue6TNdKA@mail.gmail.com>
References: <CAOx7e9K5sgNcWNj4CemyZd0Ar1ZjR4o44B4nryohq-Ue6TNdKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_111246_534003_66C56CF6 
X-CRM114-Status: UNSURE (   7.61  )
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

On Wed, 14 Oct 2026 22:23:35 -0700, Iurii Trukhin wrote:
> Since commit f101c5644771 ("arm64: Support ARM64_VA_BITS=52 when
> setting ARCH_MMAP_RND_BITS_MAX"), arm64 supports up to 33, 31, and 29
> bits of mmap ASLR entropy on 48-bit and 52-bit virtual address spaces
> for 4K, 16K, and 64K pages respectively. However, ARCH_MMAP_RND_BITS
> still defaults to ARCH_MMAP_RND_BITS_MIN (18, 16, and 14 bits), which
> was set in commit 8f0d3aa9de57 ("arm64: mm: support ARCH_MMAP_RND_BITS")
> when 39-bit VA was the 4K default.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: raise default ARCH_MMAP_RND_BITS for 48-bit and 52-bit VA
      https://git.kernel.org/arm64/c/ac9de62b1902

