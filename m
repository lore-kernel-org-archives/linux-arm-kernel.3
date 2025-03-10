Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B7AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 21:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+K+oYnzvP7cvJmByySSnLSNOlGBNi2lVWx28f1YEq8=; b=2ncAv3bknNMDPPNuX3cEHWi5mE
	nfRVjJRXeV5yR1vl4dC7Y9qZBBtBa6h+916P9ZyX6dI+U3Xil+pvWlJcDfgb92sNuARZhwz8xotar
	Y35mYUwgteXGcAirrraUuiU2dxKjbf+qLHv5tGu0ejPezx2xAs6fU0eE99vFPeylujMKt85CeG7jU
	YBEpSeq+JyjHpyrgwB8G8299QwPbqURdVKrFrJFgHqW7C4Wum5BvdUj6bJ3mZkitD6VSlDjoseSi7
	MIL1cZk1VKM+KP6dmsZmDOO2L6frGorSxBaHY3Ia+N5wB4T4nb7sIrljYBoQYgenCKOyhvSP5Eolf
	H9ktdVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trkNs-00000003yI9-1Jrt;
	Mon, 10 Mar 2025 21:10:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trkKs-00000003xgJ-2RXJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 21:06:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1712E5C632A;
	Mon, 10 Mar 2025 21:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3055CC4CEED;
	Mon, 10 Mar 2025 21:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741640813;
	bh=w3JGUoFoP4s4o1EYb78J+8jvJOeydIyBNZmbEoCe2w0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q5rSR7e2arCQtcsqfVS3LjgCtGkhwx2Vg/Z2dcW8XiCKOOP7joc9VWEYP1fyQwpoT
	 4O0ak4YHnJtkNY14eCXfXZSu6EtE0hCVhcOFk3CPXjKF8NpyCwtLZ1tIsBSWeM+qLq
	 RcdTrpwotdEpcq/Z8Lm3LstaeCQ1Ix2MXg9wxWk4lY2YSX9XcSDXRfZd4MoaGipRz6
	 bNoGNKyOBUuoQ0dN/L6nctA/ej9tJ9JR0AqNudhMW/GRuMzaIJltbq9snl2YFoR/Db
	 Pmdt7FGWGQDNPmhqc2POLwulidaacsFVpi/jAuVJCWPJpfCdxv0E9kAZuUxu+h221k
	 6ZGBM99NFG9Lw==
From: Vinod Koul <vkoul@kernel.org>
To: peter.ujfalusi@gmail.com, Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, srk@ti.com
In-Reply-To: <20250205121805.316792-1-s-vadapalli@ti.com>
References: <20250205121805.316792-1-s-vadapalli@ti.com>
Subject: Re: [PATCH] dmaengine: ti: k3-udma: Enable second resource range
 for BCDMA and PKTDMA
Message-Id: <174164081079.489187.11258465770123332216.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 02:36:50 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_140654_676197_235CBC5A 
X-CRM114-Status: UNSURE (   7.32  )
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


On Wed, 05 Feb 2025 17:48:01 +0530, Siddharth Vadapalli wrote:
> The SoC DMA resources for UDMA, BCDMA and PKTDMA can be described via a
> combination of up to two resource ranges. The first resource range handles
> the default partitioning wherein all resources belonging to that range are
> allocated to a single entity and form a continuous range. For use-cases
> where the resources are shared across multiple entities and require to be
> described via discontinuous ranges, a second resource range is required.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: ti: k3-udma: Enable second resource range for BCDMA and PKTDMA
      commit: 566beb347eded7a860511164a7a163bc882dc4d0

Best regards,
-- 
~Vinod



