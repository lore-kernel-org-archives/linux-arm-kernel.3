Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75642CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVqaM/cBXG8IN5SK2GwWOvCfhQl+ciR30TodxRC57lA=; b=ugKMG/dtA9VA+hecD4l9miY9uh
	pzh3DqMsD3eWmrs9D1rteTimrecF49gn/ZQxxXnx3FpGjVOQyyguSqgEoUPR/WVWF7DYTbAX+Qd2h
	KxPtDRiHKBkNrFzGhTHCez1YQkGa71sE/8dI5seCy25JXrqVDEUiGCxGSWHpw6onN0rOdwmGLnWQq
	hHeT4qasgbLM0flr8728KXKx1FqTtQ1Un32kyxYiqxCV7luLDqKdsF7j5rGJlu+WLky82kpbdNMWm
	THlH2nQlWOEqNiS7+yVezhaEeLdYjs4bzRxNIhWXu8t++Ohyj3G0sZNi6+jCa6c/4kkT09MjMdLdl
	Ekne4Ugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7d1-000000061Nh-3Dqs;
	Fri, 09 Oct 2026 10:15:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7cz-000000061NW-3VDO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:15:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D6C543292;
	Fri,  9 Oct 2026 10:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3F61F000FF;
	Fri,  9 Oct 2026 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540901;
	bh=VVqaM/cBXG8IN5SK2GwWOvCfhQl+ciR30TodxRC57lA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Qi+NrNAv7bRZo4O8AbjMnRVjTjiHG0jH9swau95y154wdnmSAlo0t3kd0IRZRDOJy
	 5d4fsugWEOTpbQ8M7YV99/pV0zBfLIfD4jTLVkUE4SDW+5r+J5NMp4tPo3x+pDJCRO
	 hgt8JUyEUTj05R8GtxPvRrz8pFm3KIfGJQaSzdRYYRDn4ZQTkm5ZrcjtEhpLCJRMZz
	 KCk7TkrBJMDJU4GiR56/DLNCo5ZWA+XFrr/d5m+//NR/QyGXbC53tTeeJGHA8KRoQO
	 1W87DipHf0HHhLEYB1nLDQEQMGmUADn+8AFcOYTjDRPtWkxpcq3qgp2w5QqkXSoW98
	 gDxk7QU5jJEDA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261002202341.253152-1-Frank.Li@oss.nxp.com>
References: <20261002202341.253152-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] dmaengine: add dmaengine_get_provider_device() API
Message-Id: <179154089879.553139.15809990665785569211.b4-ty@kernel.org>
Date: Fri, 09 Oct 2026 12:14:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Fri, 02 Oct 2026 16:23:40 -0400, Frank.Li@oss.nxp.com wrote:
> Add dmaengine_get_provider_device() API and kernel doc for
> dmaengine_get_dma_device() to describe the difference.
> 
> dmaengine_get_dma_device() is used for DMA mapping because some DMA
> engines provide per-channel iommu mapping.
> 
> dmaengine_get_provider_device() is used to find a DMA engine channel
> by a filter function.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: add dmaengine_get_provider_device() API
      commit: 61527d7e6998e87b3acd04f1cd2f4d6814385051

Best regards,
-- 
~Vinod



