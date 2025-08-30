Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E834CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2l/6/ioKKJ7XV5ft82XnPBC3zpxKpF6lmBFY8Do/UE=; b=2HPJZRloeEgGjwppsDllMGjevK
	/ymTHyZIpmiZ88MGWgP5Z9dC3uviBnN9XVcuJ5U+yo8JCPI4GLCPfwKBPkQr6VN/tS/Q741H5DI/z
	3XqY2vDd0xLZeX/M+W6mUw/Yc2h78wMP8GaMoQnNM7w+li7vleSPXnT4w1iQ5NxGfFqLH3+gXNynZ
	DKMTUL9PN87gGaCptGME8Fr++lyEUG965xbzl2cqNhiaEqKe+vYYYy9BCepZ7jIpBdaSV3XSjHxdI
	JefR8+ZnMd3ErHx+7znVis8XLUjW++kdpwE74oPwVTSOEuE+KY78TKEsZYPi2mSUDvZWs/d01e5Gz
	n+n/q5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJQ2-00000007maT-0rWm;
	Sat, 30 Aug 2025 11:06:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJ0U-00000007kxD-1Hgj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 677CC601AB;
	Sat, 30 Aug 2025 10:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBFFBC4CEEB;
	Sat, 30 Aug 2025 10:40:20 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>,
	Kees Cook <kees@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Yue Haibing <yuehaibing@huawei.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	James Morse <james.morse@arm.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	David Hildenbrand <david@redhat.com>,
	Zhenhua Huang <quic_zhenhuah@quicinc.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dev Jain <dev.jain@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc function signature
Date: Sat, 30 Aug 2025 11:39:33 +0100
Message-ID: <175655035973.1114907.7025015988406384082.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250829190721.it.373-kees@kernel.org>
References: <20250829190721.it.373-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 29 Aug 2025 12:07:25 -0700, Kees Cook wrote:
> Seen during KPTI initialization:
> 
>   CFI failure at create_kpti_ng_temp_pgd+0x124/0xce8 (target: kpti_ng_pgd_alloc+0x0/0x14; expected type: 0xd61b88b6)
> 
> The call site is alloc_init_pud() at arch/arm64/mm/mmu.c:
> 
>   pud_phys = pgtable_alloc(TABLE_PUD);
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc function signature
      https://git.kernel.org/arm64/c/ceca927c86e6

I added the acks from v1 directly as there's no change.

-- 
Catalin


