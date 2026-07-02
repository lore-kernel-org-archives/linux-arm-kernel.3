Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93498C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hh1GKcBgtMqoFUkB0LHwE/UJFOYQ6UKfpRoxk/RQ+SM=; b=qsNOra5ugVweDk/KSBdRmZHQrY
	PzfmHSCNVX9FzJNdqmhP2aXamdRbjH/63ObV5ZUcmnI1d3uCy0zeU1rkPd9mtrP8I++0w9Q65Hrac
	ykzSQRA0xLQbPHIZlAeQrDJcE28NuBuOkeO2PFM4kRzG5CdyrtPLj/UozgxcEkCzZpt7g8CBpIBnh
	dVkoSQClcsInzBvqbdRz/AfySw3WM9IzeXHCWlpItgbeE1p/YPxDXFNEn2OiCp/vvrf8FOT7adgcB
	euokatnC+fMn5VcMI0cvj4nAQeAyx19oj7nViaaHEil9PTsW3qG7aQH02sxvSKnHdqFsi5FqSc8PI
	dQ5HZIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJIE-00000004nfc-0J4o;
	Thu, 02 Jul 2026 15:25:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJIC-00000004nf4-0NXc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:25:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 619D3601C6;
	Thu,  2 Jul 2026 15:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756AF1F000E9;
	Thu,  2 Jul 2026 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783005931;
	bh=hh1GKcBgtMqoFUkB0LHwE/UJFOYQ6UKfpRoxk/RQ+SM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Mld9zIRzBnjiFW5lin9TsanOqPeEQE/KwS0c4zVNixDNe9FKNlqenqFcbXoKAC5n/
	 YFeVMaEY/nH0xqToUjpnejqS0Ru87jW9UkZmpHJJF4cW6FT5jiQ96MBEJnrSj4grbC
	 d5DJmELYFnr9KcZdzQjBYq4Sz0LhEiqqTafLrAC6l8kfXgZIdRCt8GY4+YyIfK+n2G
	 OKYxbHteRSxxXJSRqfOWB9FySj5aKkHuxsqGL2XOefEybA7XRYaGfKYFJcLOIbxqcZ
	 HZDJoGt3I508Fb4WEkMcFdgm1AU8VBbyZR3Co99O3EQ1V13+qcYW2HKaSnT3WYFQ9A
	 Urn/jSXMqhrHQ==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de, 
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 zhongling0719@126.com, Frank Li <Frank.li@oss.nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260701045733.33654-1-zenghongling@kylinos.cn>
References: <20260701045733.33654-1-zenghongling@kylinos.cn>
Subject: Re: [PATCH v5] dmaengine: sun6i-dma: Fix reclaim descriptors while
 terminating DMA
Message-Id: <178300592710.726714.11534436321396496964.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 20:55:27 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Wed, 01 Jul 2026 12:57:33 +0800, Hongling Zeng wrote:
> When terminating DMA transfers, active descriptors are not properly
> reclaimed. Only cyclic descriptors were handled, leaving non-cyclic
> descriptors and their LLI chains to be permanently leaked.
> 
> Fix by using vchan_terminate_vdesc() which handles both cyclic and
> non-cyclic descriptors by adding them to desc_terminated queue for
> proper cleanup.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: sun6i-dma: Fix reclaim descriptors while terminating DMA
      commit: ab1150115e68a46b687eb38c1ab92782018c9f2c

Best regards,
-- 
~Vinod



