Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7380DC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxMY1nqX0yyGvdIZz68ICS3+ucAiC6IkbfSFVxjdUOI=; b=Ynr/drzWreNsifws8RaZoFWRQV
	Ul8qtcTQEWu1iwMS+VYaRapjQgBvLMPh6r09Njm2J+UN0VqTjbyrOO5t9irl7dAeYVtAARlnsJ4Aa
	9tHgRi3HJySMG8+F6d7AFf5gRx2zs/Oa86hpmOusKkNBgdwRPOQegfVTbD7NuUzMXlB8aI33Wbw+O
	G/GHJ92neB80gM6w0u5j99kasA0apD2s8R2DC1DX152eliehI22K/rR0KU+0WhEZ5LRGhQOmXT5r3
	3fSAr7ehd/jFxboU6XGkS/yOL2uoXuR9ISbJgC4J55JP49zbptgs49tjo+R4Mlx1nhKdfe0CyxCr0
	KekSdFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9n0u-0000000BhMB-0JZQ;
	Thu, 24 Sep 2026 17:13:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9n0s-0000000BhLg-3Yuo;
	Thu, 24 Sep 2026 17:13:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5177C43D1D;
	Thu, 24 Sep 2026 17:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958A91F00899;
	Thu, 24 Sep 2026 17:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790270018;
	bh=kxMY1nqX0yyGvdIZz68ICS3+ucAiC6IkbfSFVxjdUOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OkpYA0br9Z+nqOV6iwnooU3a9PFXfF17GLqHBA8ks2ICgq3akAIEaf5EH7r+eIXgt
	 zij7fZYbcT4cuaKvQhUaU48PdhNqZz6ocloJViw6PD4OObn8I+0/PUbxYirtuERCQF
	 /+8CeWqaqmK9J87vCLJcVewgG5JA9A5FHOO3FJVtJeQFpLuhqxRzPAXPxTwmNptRPf
	 uMuwvFJweuNOmRqN8AwyrPf1Xc/r6oXKudf4qcEhQM5G6UmARw0GPJFOVRAhjKpUyX
	 7Gkxnn9eb8QHizZ+exKAVGQgkmfZR3ocE2LPVskflvOdmG4b2BEtHSZEk5ZAFBHCrh
	 9y+6lF7yrncxg==
From: Sasha Levin <sashal@kernel.org>
To: Artem Dinaburg <artem@trailofbits.com>
Cc: Sasha Levin <sashal@kernel.org>,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sandeep Dhavale <dhavale@google.com>,
	Will Shiu <will.shiu@mediatek.com>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 6.1.y] erofs: Fix detection of atomic context
Date: Thu, 24 Sep 2026 13:13:23 -0400
Message-ID: <2026-09-24-daily-reply-0004-re-erofs-atomic-context-follow-up@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arSoAUX4jDzgY-rG@MacBookPro.fritz.box>
References: <20260922200448.27724-1-artem@trailofbits.com> <arSoAUX4jDzgY-rG@MacBookPro.fritz.box>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> Thanks for your effort, this commit has a follow-up commit
> commit c99fab6e80b76422741d34aafc2f930a482afbdd
>
> erofs: fix atomic context detection when !CONFIG_DEBUG_LOCK_ALLOC
>
> could you please consider backport those to stable kernels as well?

c99fab6e80b7 ("erofs: fix atomic context detection when !CONFIG_DEBUG_LOCK_ALLOC")
is queued for 6.1 together with this patch, and 6.6.y and 6.12.y already
have it. I've also queued both commits for 5.15. 5.10 doesn't need either,
since it always hands decompression off to the workqueue.

-- 
Thanks,
Sasha

