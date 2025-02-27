Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E135AC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzMqYLVgjnylHzXX6nn9XTVSze7Vk9ZZKYSg0gip+Gc=; b=JZihRT1277RM5enMnEpPayhEVy
	ClirJqkCZLEdNJFWhfpEVsWfJ78a+cqa289vzQ3wp99U8y6/xnsatx1Dxl61XQdJyslUG2lvq3QvK
	8vadPbMehLLdz5X7vYHg4n1gXt4ukTAMogLzZ4ehN3ISrhxyUo6U5gGtGFmfd+YEDjJGa3Z8XmHhl
	FJ9Fpme9g/9yzDSFovyGSdbL9dSIJFHYzp5BRe1yF+JUTrNI/mv1f7whrexMWFwNbS5TVJ4kDMThG
	iMAap2tgWZBHaGkTqFoXXP/pL6oeSBES6ZXOqXYzsvTxPCFVE7adPLSCkwXYGT+1mm9ScIlSQJlZH
	+bjAtYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjmo-00000008eA8-3gQq;
	Thu, 27 Feb 2025 19:43:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnixu-00000008MwT-41He
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0D7761F46;
	Thu, 27 Feb 2025 18:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A3AC4CEDD;
	Thu, 27 Feb 2025 18:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740682234;
	bh=PdhWZy9D7TCGdHdbg75DVHTX/1icTJe90dYyzL4iqgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QZWG+Jsm30Kz3TKsQv7Kk64q1Eq/a0DAcMQXm1ViLfsEQCLc8d562FIccbXB9lk+y
	 5NxDDvNRAhFSFweXFQU485yHjFoP8UoVgf0XSR6lU2Lajq0kaoZUmXinvaOohznvN3
	 5k7vfPb6XjdACvyyZNPFFMYD/jtMRXMwC24P0YAlz31uKP0y5ReRZzMSmiA+GGUDPr
	 xLYp5L91cfWEwc1hIfkBWp7kRrfpcH2XQS83LN1BRHeDlOabq/WdEqueCSu6z9ULTj
	 uisn0lGGG3WFDv7oI8E3ScPSjJZs+RNmiXMXkcgxeU5LglxD/2xruyc/whFo09j4ae
	 CKAVKsb1mb1hQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/mm: Fix Boot panic on Ampere Altra
Date: Thu, 27 Feb 2025 18:50:27 +0000
Message-Id: <174052227763.2420464.2784848656225511807.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250225114638.2038006-1-ryan.roberts@arm.com>
References: <20250225114638.2038006-1-ryan.roberts@arm.com>
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

On Tue, 25 Feb 2025 11:46:36 +0000, Ryan Roberts wrote:
> When the range of present physical memory is sufficiently small enough
> and the reserved address space for the linear map is sufficiently large
> enough, The linear map base address is randomized in
> arm64_memblock_init().
> 
> Prior to commit 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and
> use it consistently"), we decided if the sizes were suitable with the
> help of the raw mmfr0.parange. But the commit changed this to use the
> sanitized version instead. But the function runs before the register has
> been sanitized so this returns 0, interpreted as a parange of 32 bits.
> Some fun wrapping occurs and the logic concludes that there is enough
> room to randomize the linear map base address, when really there isn't.
> So the top of the linear map ends up outside the reserved address space.
> 
> [...]

Applied the reduced version to arm64 (for-next/fixes), thanks!

[1/1] arm64/mm: Fix Boot panic on Ampere Altra
      https://git.kernel.org/arm64/c/2b1283e1ea9b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

