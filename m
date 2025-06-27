Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01787C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FoulTK6/Ji1YZNGwPxBOJmcgLkAanlrOuo2XclRRwY=; b=JL5LGseIT6xiSiadsMaVhkn3dH
	TIHRUZkbitf6dGtQQiFHLDQT/aarfNr3EUstV03JHkBb4zPL/GOZZL1euF9gpeIoh1UOxpYQbMHvu
	4KigZSbS0dNvzC9H6eyNwO/isc9erQoFlPfiTTcu61+daqSofTPGnh8vw3SLpuMESqoEDTD0mmnmg
	97cIl5iFEf1VoJn3yUN2h5HvTjq/eZBz3nzeFjVZ0vI9G9zpmaJ1HQprf91WXjnFzIQiPKmZ/0tNo
	526AwbVRic0epnkOheeYjGqCIjqAQutC1kvcR/2R3JjR3IfFRG7qG2QOVOQmC9G+b2tnJISwefV7b
	SLv0Kucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCDO-0000000FK3L-40J4;
	Fri, 27 Jun 2025 16:46:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBH4-0000000F9ZI-2nS6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:45:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 379DA5C6D47;
	Fri, 27 Jun 2025 15:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7380C4CEE3;
	Fri, 27 Jun 2025 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039157;
	bh=+AzbRskRx03Ql/CGiF9JX1Tgj5ydmudV3vXmoZQCGaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l++dfUUzJcZ1Fk5DgSHT4MrcmLDgcmnZ2aDhmjXM5FqhuV/D8eJe2CqBNbBpUQDA9
	 iMp96vwkTQeaiQLMAeSzb9q/s35o/r4sfbC3f8b5duhqHYwDaEVwlwXrzftC/6Abhc
	 a1ZYvbgdpKb2cULU99cF4FNL2F1shVALJ3C6pXWi3dYj/sp5QPJiwHNMy+6Yhci020
	 laJRB5zZEKZpYbARYz3hR8BDtUmQYVhTNUOa3Wu0i9ZRr0FOsxDcCI+8UF7jpm8ltJ
	 ODuB8aj530mKZ9w2gHkwkg2bBZCLijCowvvowRm9VDBtK8hDrtx+5o4HtP8muR0L2l
	 1dCx8c2ENhzxA==
Date: Fri, 27 Jun 2025 16:45:54 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v4 05/13] arm64: debug: remove break/step handler
 registration infrastructure
Message-ID: <aF68sRD1w6zrAlyr@willie-the-truck>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
 <20250620211207.773980-6-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620211207.773980-6-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084558_745425_983D1B4F 
X-CRM114-Status: UNSURE (   8.51  )
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

On Fri, Jun 20, 2025 at 10:11:59PM +0100, Ada Couprie Diaz wrote:
> Remove all infrastructure for the dynamic registration previously used by
> software breakpoints and stepping handlers.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/debug-monitors.h | 24 ----------
>  arch/arm64/kernel/debug-monitors.c      | 63 -------------------------
>  2 files changed, 87 deletions(-)

Reviewed-by: Will Deacon <will@kernel.org>

Will

