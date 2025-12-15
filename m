Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714FCD5B862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 18:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jl75yZUM9J9Amj5RpllOg4vpxPeavZkC77uA8KJylVE=; b=iQTbje0X0ymdVRvx/vJLDaIrQz
	DC+FX7tmH5aQ7HJkWH52qqQ6QHfknKxmH5LLViGJmFDJYRgpxW+dh1U7LZY2ppwu/KHliHEUipcjp
	qC+ibYfjLUgrc18/0RobSokzfK0p6tk1U4bL8dNJUZZYj7FSNmE19ZcCyPLZQd1P7oAfJsukUKXNA
	2wuePfbH6oy/xxKZyDCM0c/vw0EOpVYqBlIpgzigMF6gkPBa7odMMU+5M8lYzcVuRUUjdPh2eB4pT
	F2uAyTGDUmXOl4Cj6Vvj8GfEuhtzCeG6PGbKFLBBDuGeFsvW/kj3Bg5vPRcbIvn5ufzOg6hobjKlL
	GTlhEs4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVD7s-000000047Xl-1GGM;
	Mon, 15 Dec 2025 18:16:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVD7n-000000047Wl-3Jb8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 18:16:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00424FEC;
	Mon, 15 Dec 2025 10:16:35 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7CC13F694;
	Mon, 15 Dec 2025 10:16:40 -0800 (PST)
Date: Mon, 15 Dec 2025 18:16:38 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v2 0/2] efi/arm64: Simplify SVE/SME state preserve/restore
Message-ID: <176582226393.1756467.4367015850424872029.b4-ty@arm.com>
References: <20251206190114.892262-4-ardb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206190114.892262-4-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_101647_867434_04407962 
X-CRM114-Status: GOOD (  11.25  )
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

On Sat, 06 Dec 2025 20:01:15 +0100, Ard Biesheuvel wrote:
> The EFI specific SVE/SME state preserve/restore logic is unneeded, and
> can be removed. Patch #1 adds some lkdtm test cases to emulate the
> condition under which this code might be called.
> 
> v2:
> - Document that BUG_IN_HARDIRQ and PANIC_IN_HARDIRQ will crash the
>   system.
> - Add Kees's R-b
> - Rebase onto torvalds's tree of today so it is expected to apply
>   cleanly to -rc1
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

(not really a fix but postponed applying it for -rc1 due to conflicts)

[1/2] lkdtm/bugs: Add cases for BUG and PANIC occurring in hardirq context
      https://git.kernel.org/arm64/c/eb972eab0794
[2/2] arm64/efi: Remove unneeded SVE/SME fallback preserve/store handling
      https://git.kernel.org/arm64/c/63de2b3859ba

-- 
Catalin

