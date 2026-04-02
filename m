Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D01D6AB17
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 21:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQ2bS1Eo5fYYY7bBP48qfxUbVE9L7YOvl5e8aX12QkY=; b=3orz2IJF4rsrg65CI4fc2GBOfK
	sis31AR33LwrH6KSu0hrESbTsrdOOAM8nzX88EfGEZntCYXn/vAlERseSxmEQy9sHqZxdvCtpf+qA
	0dEt5yLsbZOhX1tmgt2ulP2w9wnHtGVfpzlmaJP9T2N317sjsWrGSEBcS8iUoZ9pPMQGbJ0uG8iRe
	Mnwx77c0AKiVynHI6eZN0cmwXkOGzJJicAWATWM+ldke+Kub3fD9wiDDYbjurl8qySxiHws+KCm2I
	ti34udTvgdL9+aOZRaz1XyLcnF3nMtHCgGklxZ8zIR1LhcEOzN9cN+38HY4ARsqSFO3ILoUT9sDVz
	C7PEFFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8PKt-00000000mN5-1kzp;
	Thu, 02 Apr 2026 21:12:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8PKq-00000000mMh-2ekR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 21:12:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3543619F6;
	Thu,  2 Apr 2026 14:12:09 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A4563F7D8;
	Thu,  2 Apr 2026 14:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775164335; bh=h9LLr3Dt6QdO9kmFYrtZWs/LXI1F0pkVzdJN0HMQm0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bL4ToBIzmnkOn5EFvRjGpJ9Ar23K6gAvx02gxe3I91ydQNWEfZoHUn6Pi1VbglwHx
	 ZigxxaX72zpweeSrE2zarRkxtfXDIogCCFuwRgIHEWmBnqBEoYnoWd7GL8Wi8Grlif
	 STRNj8Mz69JW44nV0CdgPENmIEdtFQKBGnIYtWoo=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jinjiang Tu <tujinjiang@huawei.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Fix bugs for realm guest plus BBML2_NOABORT
Date: Thu,  2 Apr 2026 22:11:13 +0100
Message-ID: <177516427354.96925.15845278407181370172.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330161705.3349825-1-ryan.roberts@arm.com>
References: <20260330161705.3349825-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_141216_713625_FD383A3E 
X-CRM114-Status: GOOD (  11.36  )
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

On Mon, 30 Mar 2026 17:17:01 +0100, Ryan Roberts wrote:
> This fixes a couple of bugs in the "large block mappings for linear map when we
> have BBML2_NOABORT" feature when used in conjunction with a CCA realm guest.
> While investigating I found and fixed some more general issues too. See commit
> logs for full explanations.
> 
> Applies on top of v7.0-rc4.
> 
> [...]

Applied to arm64 (for-next/bbml2-fixes), thanks! I had some comments on
the first patch, so I may rebase it or add something on top.

[1/3] arm64: mm: Fix rodata=full block mapping support for realm guests
      https://git.kernel.org/arm64/c/f12b435de2f2
[2/3] arm64: mm: Handle invalid large leaf mappings correctly
      https://git.kernel.org/arm64/c/15bfba1ad77f
[3/3] arm64: mm: Remove pmd_sect() and pud_sect()
      https://git.kernel.org/arm64/c/1d37713fa837

