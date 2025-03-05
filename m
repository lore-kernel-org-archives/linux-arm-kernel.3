Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C522C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weYBo8zJpWwcjzseSIb7iG7qtpCwIdrcfvqtoIKKPn4=; b=Z+yrzAY+TcNiJiEbyAD/5h0NDp
	ZdxF9cSHOoRbuv/r3yQslEqGgjhgwjZAXFCzRoLZaF8HGlUc0937R4tiXVCpXJ25o1lSGIkwZ0oMY
	fuO522Irw0upzQLP6uUgpqQKEhFcQaUHmu4uL1tH4UgFpeC1Mh4ptjZlAORa4EiwpfR0A4Y5JM8TG
	uNKwK8ZXQvh6bz9T554ASF3mMZ2jQ3JEYqYn4Hgfb/qvffOLjcXif9J8ski8YdiQLTIMpxb6xgx5P
	IL0B5qLdWHXdAlmB1gngMiVrIWXVzD0iPK7EUfc5UORaxG8PKpH9/FYr9AyvtoNh7puF+4ZbJ+cqF
	OURhS5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpv83-00000009BRF-0ATS;
	Wed, 05 Mar 2025 20:14:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuaq-000000095xA-38eb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:39:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C70175C6C25;
	Wed,  5 Mar 2025 19:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC989C4CED1;
	Wed,  5 Mar 2025 19:32:58 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	ryan.roberts@arm.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64/mm: Convert __pte_to_phys() and __phys_to_pte_val() as functions
Date: Wed,  5 Mar 2025 19:32:56 +0000
Message-Id: <174120317313.1423488.2871713663228556221.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250227022412.2015835-1-anshuman.khandual@arm.com>
References: <20250227022412.2015835-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_113948_837871_F8B1251F 
X-CRM114-Status: UNSURE (   8.60  )
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

On Thu, 27 Feb 2025 07:54:12 +0530, Anshuman Khandual wrote:
> When CONFIG_ARM64_PA_BITS_52 is enabled, page table helpers __pte_to_phys()
> and __phys_to_pte_val() are functions which return phys_addr_t and pteval_t
> respectively as expected. But otherwise without this config being enabled,
> they are defined as macros and their return types are implicit.
> 
> Until now this has worked out correctly as both pte_t and phys_addr_t data
> types have been 64 bits. But with the introduction of 128 bit page tables,
> pte_t becomes 128 bits. Hence this ends up with incorrect widths after the
> conversions, which leads to compiler warnings.
> 
> [...]

Applied to arm64 (for-next/pgtable-cleanups), thanks!

[1/1] arm64/mm: Convert __pte_to_phys() and __phys_to_pte_val() as functions
      https://git.kernel.org/arm64/c/2d7872f3ae3b

-- 
Catalin


