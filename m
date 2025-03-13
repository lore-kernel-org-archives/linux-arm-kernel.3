Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6218C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loiy5FgRrkCgs8VcDc2H/3ODdRqPrFa7i3VhvC2L9wc=; b=kHnkm+9Upc2aX1VSbGmp7eKT4l
	VCfmFycggNxfJP3TEPFNrxSEMwAyZvHnBx6FB+gMvqUGMRltNqdMPaSg6/ze8mL8MXRg+an3ODWfC
	Al5yyDYxyFNHEe6rxcoZOPGGNOtaAyR8dLT7d1kZWyCMR9CHX1fBd3kD9sPxFk50inTVL1MdZGkig
	jEllq27rZ7hQSkWU/FbIIhXSHZSOFwdRNFiecF/zvmCqyTcUAQpanS2VZ8IxpmZCFvQxS+jJVMNZQ
	KQZzAUasq14MsuArh4553iT7KfQWNWr7ByuQWTTvguoq1flAq+B9aCQv6x3YDCuR8oIAJvguackO5
	IlH3ObsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsn8n-0000000CB4g-2QCq;
	Thu, 13 Mar 2025 18:18:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmyu-0000000C8uz-1HGe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 18:08:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A08C5A47883;
	Thu, 13 Mar 2025 18:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F901C4CEDD;
	Thu, 13 Mar 2025 18:08:29 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v2] arm64/kernel: Always use level 2 or higher for early mappings
Date: Thu, 13 Mar 2025 18:08:27 +0000
Message-Id: <174188930050.275020.5161287876611864847.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311073043.96795-2-ardb+git@google.com>
References: <20250311073043.96795-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_110832_408635_674B0C4F 
X-CRM114-Status: UNSURE (   9.82  )
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

On Tue, 11 Mar 2025 08:30:44 +0100, Ard Biesheuvel wrote:
> The page table population code in map_range() uses a recursive algorithm
> to create the early mappings of the kernel, the DTB and the ID mapped
> text and data pages, and this fails to take into account that the way
> these page tables may be constructed is not precisely the same at each
> level. In particular, block mappings are not permitted at each level,
> and the code as it exists today might inadvertently create such a
> forbidden block mapping if it were used to map a region of the
> appropriate size and alignment.
> 
> [...]

Applied to arm64 (for-next/pgtable-cleanups), thanks!

[1/1] arm64/kernel: Always use level 2 or higher for early mappings
      https://git.kernel.org/arm64/c/bf25266f8382

-- 
Catalin


