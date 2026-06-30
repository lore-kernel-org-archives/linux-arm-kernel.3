Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3646C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4fT7HpFn8E51NABKyJEmwtwCezpdLYaRFz0wF4Gi+M=; b=Nkgd9kfukfaW/AnfR3L2qJTCbw
	68Kzf9Yx+uyLrKh6p65C7/GCgMamVjiZbdpLhzGI0ibbfSsxfqLf7MXza61dlAj0V2wc86CQsTuOu
	Z8xzPRjE7Pmze934YZKF9wkFHigLJmGMKHaopm/C1akc6gWlLz5uJ2FyQcWpWg2CrtjYaIbFocucC
	SzkKm3hXZkP8k1WkNF4JgUOhJv2rTM19TqCSALdyLBoQLO6aYEan0Eg5JFRWUVU9P62uaBkkNmba0
	vDE9rACmqVgW0LijmzdLezIsldz9J4Q3/suOINVOLA/grWGY2u9yTzKeHrHi2cBDW6w308VTRydYN
	CZwsDUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webYy-0000000HVMY-1S3s;
	Tue, 30 Jun 2026 16:43:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webYx-0000000HVLM-0IQV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 16:43:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE41941924;
	Tue, 30 Jun 2026 16:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE5C1F000E9;
	Tue, 30 Jun 2026 16:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782837834;
	bh=m4fT7HpFn8E51NABKyJEmwtwCezpdLYaRFz0wF4Gi+M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gpnaG3oD++wj2K2BXJuk0zdKujoAuYwAyTrkq27hJu3ECF+O0+G+LnhSfd+DHnZwI
	 HzWZqEprTh5IaAGA/CzZ1/esoREN+pTH5ggktWPSRZC2QF+aBgvvq892crOSUkpb5K
	 cP4gOwmp4ipP4HB/p80rDpR5Q1k74ZLq1aQvYKk1bGRTDCr9H8wVpClKUW19asgH2A
	 F6NgwUQAWPWkR4Iik2y6FP1MjeLvvtG7lQgKoN0SI63r0KNWhubjFgTVCGlcg4F0fa
	 7rKrXZC2JWAdso8BaNB9vMjuEgM4HbH+RB1ZEJiK3I9+WPnpBSbxHV7bPp9V4dj0K4
	 uFBQrNsoc4e4Q==
From: Thomas Gleixner <tglx@kernel.org>
To: Kemeng Shi <shikemeng@huaweicloud.com>, maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shikemeng@huaweicloud.com
Subject: Re: [PATCH v3 4/6] irqchip/gic-v3-its: Add ITS address info in more
 error logs
In-Reply-To: <20260623020135.3584-5-shikemeng@huaweicloud.com>
References: <20260623020135.3584-1-shikemeng@huaweicloud.com>
 <20260623020135.3584-5-shikemeng@huaweicloud.com>
Date: Tue, 30 Jun 2026 18:43:51 +0200
Message-ID: <87zf0cou60.ffs@fw13>
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
> We have a lot of logs containing ITS address info which is helpful to

We have nothing ...

> distiguish which ITS occurs error. Just add ITS address info into more
> exsiting error logs.

existing

'Just add ITS ...' does tell WHAT the patch does but does not explian
WHY this is required, useful or whatever reason you have.

