Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F32E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M10tiwOdLVw9bqkcNzMJO1N1l8CQ6AxAx1cDRaMiwWA=; b=0WYY1GOExnJ1RqjkYejrc7TJC9
	Y2uv9wq3gJh0d16sF5/9pZOTR2BrgJo/67cQOZPqoQE1ImoroDcYmqVfKhH1ry5mi4GL2F49SALHP
	JVGDnjBl03yYqFJU7C5/dukuvBIHXx1PZfOL0TVNsn87nCrI3DyywYSYHlqtqaBBr1GkhvQDieypy
	zyJbHShCnyVjG9iltviFWuTOMp/Hj00HpGzi4EbKEBU9sD2q5VW2GshtgzojnvJk4FVpyPs4cMz9l
	o9Sqmo++BLwwGRxOMINCMCAp5BuMvroo8cyF+TDskFdthNdChrxHX1mL8aMJZkqor06hnN8Knfa+y
	zL8c82Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGWt-0000000H6jC-3Of5;
	Thu, 05 Dec 2024 18:24:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGVE-0000000H6Ui-2ELK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:23:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2565B5C54BC;
	Thu,  5 Dec 2024 18:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772D1C4CED1;
	Thu,  5 Dec 2024 18:23:02 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] arm64: mte: Fix copy_highpage() warning on hugetlb folios
Date: Thu,  5 Dec 2024 18:23:00 +0000
Message-Id: <173342292874.1735998.297921244309986411.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204175004.906754-1-catalin.marinas@arm.com>
References: <20241204175004.906754-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_102304_610134_83E2CC92 
X-CRM114-Status: UNSURE (   9.16  )
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

On Wed, 04 Dec 2024 17:50:04 +0000, Catalin Marinas wrote:
> Commit 25c17c4b55de ("hugetlb: arm64: add mte support") improved the
> copy_highpage() function to update the tags in the destination hugetlb
> folio. However, when the source folio isn't tagged, the code takes the
> non-hugetlb path where try_page_mte_tagging() warns as the destination
> is a hugetlb folio:
> 
>   WARNING: CPU: 0 PID: 363 at arch/arm64/include/asm/mte.h:58 copy_highpage+0x1d4/0x2d8
>   [...]
>   pc : copy_highpage+0x1d4/0x2d8
>   lr : copy_highpage+0x78/0x2d8
>   [...]
>   Call trace:
>    copy_highpage+0x1d4/0x2d8 (P)
>    copy_highpage+0x78/0x2d8 (L)
>    copy_user_highpage+0x20/0x48
>    copy_user_large_folio+0x1bc/0x268
>    hugetlb_wp+0x190/0x860
>    hugetlb_fault+0xa28/0xc10
>    handle_mm_fault+0x2a0/0x2c0
>    do_page_fault+0x12c/0x578
>    do_mem_abort+0x4c/0xa8
>    el0_da+0x44/0xb0
>    el0t_64_sync_handler+0xc4/0x138
>    el0t_64_sync+0x198/0x1a0
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mte: Fix copy_highpage() warning on hugetlb folios
      https://git.kernel.org/arm64/c/cf3b16dae4ca

-- 
Catalin


