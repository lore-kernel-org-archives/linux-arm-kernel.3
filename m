Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC8DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 08:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+neGWa8OqKBZ1Do2yjMNb/FZN1kT+CXr2XFwta3nxI=; b=NVKj1EUKs3yeulIPbwiaIEb/yg
	c/yAEU8WKqlPCA10QZ1Mx8CrveyUJnEzDN0uqMhjoHt6MqeDeqKyVhWVk8xAjjbf8wbBwDnWUmqL0
	okEgCRLmkq9RJ7f4ikyLosS7l8mTEKECZRTp1g1akEZYMa1Ph12l6YHpE27N2dW6Lq6ftqNVPX3Ee
	n8cksgckyJAmFg4KmWXbsOGT3swJ8isZrEoiYghDs9wk3tDuSGDsGNq9shI1TlPwosoKNBN9YgTtX
	Lrv6bBT9O4zxaQQ9fT8jWiXWW/5zcWBzBaP1qcSeDmdpTZ+BU85rddN4MaPASTtzolQNIpoA2JdWK
	9AKRvp1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq8u-000000010Y8-23H7;
	Wed, 01 Jul 2026 08:18:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq8t-000000010Xx-146I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 08:17:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F35D42B70;
	Wed,  1 Jul 2026 08:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62A61F000E9;
	Wed,  1 Jul 2026 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782893878;
	bh=h+neGWa8OqKBZ1Do2yjMNb/FZN1kT+CXr2XFwta3nxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e1YXBn3WqP2Zd4Z8JlUanT1IFMAXm57F4Y2bNb+ms+CRVMoLbk6A2N+AJD9aQIXe7
	 xoffTqEhCluA44hJHcPR48I5pv9IRCtMG5EqYxGq2H86kZHsCHWUC+fyWWLTO8PhJ/
	 kv7YL6/MStckCZuDK3ijElsAq5B0wpqfiVPfx11x1cYFp/XtMr7+OszojAXfyEMOgN
	 bQ7s8jvxMnD5lAUBAD+ITg/5ggtRz4Ux4ijRW/iKvDlY/1+7GvTZzEoaGpXvH+WMnR
	 7lt8C2ICQyu/d0YbRsg9IgbhhApSylUw4hY9A3FRo3R6fSlzjGilDve3ijj8Me5aWm
	 EpBV7onJCeS1Q==
Date: Wed, 1 Jul 2026 13:47:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: Frank.Li@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, mripard@kernel.org, arnd@arndb.de,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	zhongling0719@126.com, Frank Li <Frank.li@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v5] dmaengine: sun6i-dma: Fix reclaim descriptors while
 terminating DMA
Message-ID: <akTNMl8dhepg6GvN@vaman>
References: <20260701045733.33654-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701045733.33654-1-zenghongling@kylinos.cn>
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

On 01-07-26, 12:57, Hongling Zeng wrote:
> When terminating DMA transfers, active descriptors are not properly
> reclaimed. Only cyclic descriptors were handled, leaving non-cyclic
> descriptors and their LLI chains to be permanently leaked.
> 
> Fix by using vchan_terminate_vdesc() which handles both cyclic and
> non-cyclic descriptors by adding them to desc_terminated queue for
> proper cleanup.
> 
> Add pchan->desc != pchan->done check to prevent double-adding completed
> descriptors, which would corrupt the list.

You should run checkpatch to fix the formatting issues.
ERROR: trailing whitespace
#65: FILE: drivers/dma/sun6i-dma.c:95

For now, I have fixed and applied

-- 
~Vinod

