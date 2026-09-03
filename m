Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C117C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsL8COcN47dIjt+ojWT5bl43xpZgyyoBi0nMf0bCno4=; b=Nvad0A8riDn+PNtUsJxng7Ejj5
	1l2PCsSARB8tBWqF86TJawA1AiShTd1Lc7KI/+WHfAAXoA36cfIIk7YB8ZDKcpalfXLDs1aE4VpXZ
	g6qnyD9fxKJ4GnKqRnanNVQO2q8rN6UYalBrlUi5gdjcmR22I69/Xdp5yFnOS+HuHFPfRq6yRP2YN
	elLJ6UqoVLFi7g3aEPQClXI1a/2uXaYRSE+JIRHyx4o2KS9T4toBnc0vaTFbsODb/Xa5gq+b26i/K
	Add6cUe2PAu6bOQWQRLXu3HGjVIDgkEd05BmQYLICaaRmUZiX78IifnU+qq5gRwrWjDJsbG3Ijcq+
	kODJaBDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Arh-00000000EZI-3M8z;
	Thu, 03 Sep 2026 17:04:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Arf-00000000EYS-3YJ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:04:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E591D417D5;
	Thu,  3 Sep 2026 17:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CBA81F00A3D;
	Thu,  3 Sep 2026 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455078;
	bh=OsL8COcN47dIjt+ojWT5bl43xpZgyyoBi0nMf0bCno4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MJ2t9Cc8Igi16lCvCOYOJlM6pM8aMUIB0IBoLrpDl39XLHXjMCAZVn//u3JdhCmFN
	 D6aiGSxFG1DXFN6qyRwUNJ4fUBt/pl2+rQsyeWZurKqa/HWJH7z82Zi5k7st7Edz3n
	 7Csylr2WemNYThnbfai3cybES9HNyT6NmnX0FWHUjNeXgWSNODbQ0NgtK8GTeHSmtQ
	 /5YqgM9hTwfda48Fl0oSATgicZCu/a+Zr/Od+drYKTmzbCyZpdfVh2SFExqbZSK15P
	 U3Y56mO9wc2IhCZJKAxyYJ/KPd7XrmFTARHMewtE04pK2/DM4ehKPbS5uHzqXh4xWe
	 M1hnn4eWnrqoA==
From: Vinod Koul <vkoul@kernel.org>
To: Frank.Li@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de, 
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 zhongling0719@126.com
In-Reply-To: <20260727061142.44195-1-zenghongling@kylinos.cn>
References: <20260727061142.44195-1-zenghongling@kylinos.cn>
Subject: Re: [PATCH RESEND v5] dmaengine: sun6i-dma: Fix use-after-free in
 error handling paths
Message-Id: <178845507472.1711546.14595232689588667911.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:34 +0530
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


On Mon, 27 Jul 2026 14:11:42 +0800, Hongling Zeng wrote:
> In error handling paths, the for loop frees v_lli in the loop body,
> then accesses v_lli->v_lli_next and v_lli->p_lli_next in the
> increment expression, which is use-after-free.
> 
> Fix by refactoring the cleanup into a helper function sun6i_dma_free_desc()
> that saves both the next virtual and physical pointers before freeing the
> current node, preventing the use-after-free.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: sun6i-dma: Fix use-after-free in error handling paths
      commit: 3d2c0d555d34e661d3280f85bf01ec7ed63a8f44

Best regards,
-- 
~Vinod



