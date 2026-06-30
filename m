Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0081C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LevAtRYyK0lkodfBPzo64Nz48aV/w2AHKkcP6qQOV88=; b=FQhGOQBFKZNlFGzbRK0/bZ76uW
	Ur1wAPy0alp2r35d68m+C/Sp3mWTmkEU02aOdUZIdbXL9bfR5YIqJ1Trp9ubyhdrXP4Z8bOv4BIsV
	1IX+kDvKU2u1xwM4dltAUXRs76k8AK+sOtGwzvGKp9sKlNDLj434yc4CnzkUCKtRCku3VlHlw+ukx
	4/LscWePr1IykS10hwuuN+Pj2I7Ufeg7tnmW+8EdXtCKdM1CM9YUiXbzNtSfo4MhcqtrgkiK8Qhcv
	aBi8YOEufB+LHXlmA602t2BAtY7Eb83w37jy5p5Msjm6jsdh4XfwRBvrJ/tmuSd+w/0g8XTmBhkZF
	Rj/ZKbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webVV-0000000HUjn-2HTO;
	Tue, 30 Jun 2026 16:40:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webVU-0000000HUjW-31qn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:40:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A71740D8F;
	Tue, 30 Jun 2026 16:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF271F00A3A;
	Tue, 30 Jun 2026 16:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782837620;
	bh=LevAtRYyK0lkodfBPzo64Nz48aV/w2AHKkcP6qQOV88=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bw/+o6PvWL8kpLimYjqUS4V1cbLY5T2rQpfy/ChDrsBvoGrbqAkD4jiu2i2Phjyxs
	 vFuDDO4RTNcGlAn9rIyQQnpcBQ87qkygToz7J1UkFzU0d7KbrPMhQY6UfR3yWN74bn
	 nfoO+NyLU0mpliM6Jlvvq2OY917f2Y/yvzIv1v/r6ubvY+RpIVxZqlWxzhp7371onc
	 qx+FLFUWNzXAXj4BKfLiLTOCygAjJ10Nz/ij8l7hq8Mfp3f9G5FFRxbzSzrk9HExSZ
	 DDo/Z4goxTd5BtureFntgX1/cP4yQ2XyBQn2wq6MWUNJEzywlI8h+lvD4P5CwQiR0V
	 sSOcveb+Q05fQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Kemeng Shi <shikemeng@huaweicloud.com>, maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shikemeng@huaweicloud.com
Subject: Re: [PATCH v3 1/6] irqchip/gic-v3-its: Fix memleak in its_probe_one()
In-Reply-To: <20260623020135.3584-2-shikemeng@huaweicloud.com>
References: <20260623020135.3584-1-shikemeng@huaweicloud.com>
 <20260623020135.3584-2-shikemeng@huaweicloud.com>
Date: Tue, 30 Jun 2026 18:40:16 +0200
Message-ID: <878q7wq8wf.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, Jun 23 2026 at 10:01, Kemeng Shi wrote:
> Fix collection leak when its_init_domain() failed in its_probe_one().
>

Lacks a Fixes: tag

