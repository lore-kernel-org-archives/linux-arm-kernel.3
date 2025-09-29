Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8C4CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4EN1IBu8GDAKBsIwVx3dIliwpqHb1AywTvrC3ObXpE=; b=EX9ctFrKiCHoSLgaodxfJW3ylM
	mMvwk3Pw7OOQ6zF5hfjx5chv9Up4qeTLs+1jnUAMRGt28shhXZpOj/xEAVuGDiVN+0biXP0oO2RJZ
	27+DzdxPxBDoZIBb6meoRUHkve+xHwvGo+T0S1qLk9aSIPTFTyspt8V2iM74Wq/KXr344cmNkbgYL
	ta7Hf8iK/AU7AENNVdJU+AuMLQM8RzA4nyNKIe2VJ57B5sxzHTRGnVPLqAEv+AtQ3GYE8XTG+ptWz
	0cuYCvgGoyoL+8HiQr2VlcVJEIxQizl+DPZHhHk6FMHpaeOKM7WjjD7s+tnPAzr8ZOCXWlPvSUUQM
	C4CGqV0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GhZ-00000002yOz-0rcd;
	Mon, 29 Sep 2025 16:26:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GhT-00000002yOL-3yF2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:26:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60A7C43C92;
	Mon, 29 Sep 2025 16:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4CAC4CEF4;
	Mon, 29 Sep 2025 16:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759163167;
	bh=n0if5/wobIXPyvF3KwqHu1JX8P031jZWEl37VJeix0s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VQnM7lqH4fBMb/gAQxWR64StlfAtEjOmDPHwjQC5YGdqPLC89jPK3sTi3j7AIqb/3
	 gVrprAr/vMl68WzqYgir1S6jcWc+1pFwccrQek2avmUhyOYrqfUh/EAlL+BXpu18xY
	 pdHF4hIL8zAXLFk7olbgnFcbfwNJWibFN1NGRtPrGAfb6B9AC2YJGtHuQfRbkykS1m
	 flexMNx98LgiGaoKjqat/OneqlffYAd3rTXkO3JBx5v+tvhOEEqv9En3ovlYHACGiA
	 aqWGeLXMCIzrOzgNW12G2jtYbP6Uo6F4nuQkWicHM+EOntV1HEYGyTRnBrnQwtN1Xj
	 x68VuqzZP9MsQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, cassel@kernel.org, kishon@kernel.org, 
 sergio.paracuellos@gmail.com, 18255117159@163.com, jirislaby@kernel.org, 
 m-karicheri2@ti.com, santosh.shilimkar@ti.com, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: stable@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srk@ti.com
In-Reply-To: <20250912100802.3136121-1-s-vadapalli@ti.com>
References: <20250912100802.3136121-1-s-vadapalli@ti.com>
Subject: Re: [PATCH 0/2] PCI: Keystone: __init and IRQ Fixes
Message-Id: <175916315956.16065.1110296363886173087.b4-ty@kernel.org>
Date: Mon, 29 Sep 2025 21:55:59 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_092608_012829_0A0F94A0 
X-CRM114-Status: GOOD (  10.97  )
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


On Fri, 12 Sep 2025 15:37:57 +0530, Siddharth Vadapalli wrote:
> This series is based on commit
> 320475fbd590 Merge tag 'mtd/fixes-for-6.17-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
> of Mainline Linux.
> 
> The first patch in the series has been posted as a Fix in contrast to
> its predecessor at:
> https://lore.kernel.org/r/20250903124505.365913-10-s-vadapalli@ti.com/
> based on the feedback provided by Jiri Slaby <jirislaby@kernel.org> at:
> https://lore.kernel.org/r/3d3a4b52-e343-42f3-9d69-94c259812143@kernel.org/
> Since the Fix is independent of enabling loadable module support for the
> pci-keystone.c driver, it is being posted as a new patch.
> 
> [...]

Applied, thanks!

[1/2] PCI: keystone: Use devm_request_irq() to free "ks-pcie-error-irq" on exit
      commit: e51d05f523e43ce5d2bad957943a2b14f68078cd
[2/2] PCI: keystone: Remove the __init macro for the ks_pcie_host_init() callback
      commit: 860daf4ba3c034995bafa4c3756942262a9cd32d

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


