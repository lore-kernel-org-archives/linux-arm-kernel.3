Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E0ECA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Om2BoEcn/iPgWsb8fmy2wBnU/BX1cnhB/Kz32vsRf/4=; b=t2kkNdwartp9q6drJ+KwVKIN76
	KeKRu0FA82vKq/gWJ2ulekFq1ADRHw0XLsRLueAOUhg6GxRG1hm7UH4+RpZquOMtUilhaCetxqPAM
	475pckOLxOJc9CrNsyS0v5YUywaWPqq4qAm9i69a2DbTdZxUvNfOslwzbAPZGDK1hQMX2gAksdsRW
	C8litDIJOZ7Lk/9fS788FRf+S7Axf75BYzkbmI3M4u88ZfdaysnYsqLbLKkZ7f8R3TDFZBf7P+fr+
	4Jr6UMzmxgWSUEYjI30lmIai8qltnEbkAQVMfG5uIS/Ww6y6Rpw3pyeHi0EKWznVkkksyFCjhfbsq
	+plXs9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ7N-0000000Azpg-3HVA;
	Mon, 12 Oct 2026 16:43:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ7L-0000000AzpA-0epv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:43:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C360F169E;
	Mon, 12 Oct 2026 09:43:09 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE77C3F673;
	Mon, 12 Oct 2026 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791823393; bh=dqVwho3wSVvQZgAokcn4jjb79XN9d9Foz5x+55qbQpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZtyBj70ZwScQeTCYE+1raEHOLvUwYWLNhAvAI1BwhPOfvmkLe5jGivcocs5elo21d
	 1lUz1JLk3Bo7F1hQA0IDZf0ppexcY7RaGnQ2ESyoVj+ziq+vhcjDKIQW09IRjZoP7V
	 29Y3MuX6ihR+kYtn5202yLOZId7OQojex3IFT/Ag=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-efi@vger.kernel.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] arm64/efi: Clear PTE_WRITE when applying EFI_MEMORY_RO
Date: Mon, 12 Oct 2026 17:43:05 +0100
Message-ID: <179182338471.868934.1416736534098174257.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009151600.351766-2-ardb+git@google.com>
References: <20261009151600.351766-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_094315_240252_34AFDA55 
X-CRM114-Status: UNSURE (   8.41  )
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

On Fri, 09 Oct 2026 17:16:01 +0200, Ard Biesheuvel wrote:
> set_permissions() sets PTE_RDONLY for regions that the Memory Attributes
> Table describes as read-only, but leaves PTE_WRITE set.  PTE_WRITE is
> the DBM bit, so when hardware dirty state management is enabled
> (TCR_EL1.HD), such a descriptor is writable-clean rather than read-only,
> and a write by the firmware will be permitted by the hardware (which
> marks the entry dirty) instead of faulting.
> 
> [...]

Applied to arm64 (for-next/efi), thanks!

[1/1] arm64/efi: Clear PTE_WRITE when applying EFI_MEMORY_RO
      https://git.kernel.org/arm64/c/215d7b662273

