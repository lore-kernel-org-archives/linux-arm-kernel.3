Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F87C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktQ/mCzljVKF0hvcEfd4hDNXCpVqMxkORMTuXMwuaFE=; b=u0Mqkbsh6h3qrCYvZz8KKBdkHl
	vazvhDfNXcrpkAFd7h9ajDAI2Vjxww2MQ1vziuohk2R2jcgUCABtLWvbOGi60Uf0TuxGofM6V/VnT
	7wB9kquYwk0cwmr4A5yslAay6zblwm2tB3yPdM1DZWyiTLooWlbF5fmdEkbhJKMDn24vRcBLTq4l2
	8pr2qgWXEp+v3IhU7FB25DhNg5SzcNHSdOYGCuGeToORXO9UcKeN/d37t6AsKVbdWrwelF1+7WlQY
	S4CvHNNS0sgU/ufpDdxTRT5UlgVP/VEK0mrRb6OlFbccuVcmp1edZIJDjtQBM5jvR8U/C69aZQN9P
	4eFJteLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQZ-0000000EZTR-0AzT;
	Thu, 10 Sep 2026 14:06:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fQV-0000000EZP4-2t0H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:06:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BD04447B0;
	Thu, 10 Sep 2026 14:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589461F00893;
	Thu, 10 Sep 2026 14:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049215;
	bh=ktQ/mCzljVKF0hvcEfd4hDNXCpVqMxkORMTuXMwuaFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fooDFSDCRbGIyectMaPvdLe4BSe0Xeb/ACL9L3ltDh7dVCBTLG+jKdQ4Y8+rvx1Ez
	 IDDgl4dfmKSNrXfQxDGAJp+d0UsNL20qagyQkzCytVD6FeYlYuBG8hZpval3Xt9PMe
	 pGjcj4kkKb5zOF6dr+UIIEpXyAdNsCF7DiHKMVWgkxCxlSksETReJVCF1fP6uos6qm
	 muxg7TaQhDjvw6wsm0KWNi+dFnVlbBGtZgx+JeQTJz31ZIHfdOXSKQyb2M3Vn2Ggsb
	 +6LF6m9+9k0J+/OpKW9l3Bw8zBiLVJ66u2XmV4YGK5OrVj9zDEYQ8iuW9uikZSw4ss
	 lNBZmWoUKoPrw==
From: Vinod Koul <vkoul@kernel.org>
To: Christian Lugnberg <christian.lugnberg@soundtrack.io>
Cc: Frank.Li@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
References: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
Subject: Re: [PATCH v3 0/2] dmaengine: sun6i: Fix two bugs in the DMA
 status path
Message-Id: <178904921191.109109.5746892619101559603.b4-ty@kernel.org>
Date: Thu, 10 Sep 2026 19:36:51 +0530
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


On Mon, 17 Aug 2026 15:51:21 +0200, Christian Lugnberg wrote:
> Thank you for the review, Frank.
> 
> Changes in v3:
>   - Patch 1: trim commit message to the root-cause explanation and fix
>     description, dropping the debug/reproduction part per feedback
>   - Patch 2: unchanged since v2
> 
> [...]

Applied, thanks!

[1/2] dmaengine: sun6i: fix non-atomic read of DMA position registers
      commit: c90b6973daa37f4c283342dff881ae001dea4fe6
[2/2] dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status
      commit: 9096bdc8d930147f7c39a493a859acbd3a8485d8

Best regards,
-- 
~Vinod



