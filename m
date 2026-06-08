Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BA5CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 12:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vxDtjZ+UU7C96xeFiCYrDD6u0Vo2RHrNSoMOM3Lu/o=; b=gs8+XC3YB4PUHZI1MXTEKv+gBZ
	KL28FrmFEMlg/AMiNjvrfCC41CrQPThNp3blWnUkAOloAun3oMyuVgnEESeX//GOusiLj0cP45PQ6
	BHsR7QEyhHGpZKS35FUuAb5M+KanpFcWEL7j/+bGA+YdYD75M0AM8ehVagFJ1+5G+oGHqoZZn2p4h
	iG7AJnvUEeghjXS3UiEffMvtJpNaPsreoPMvpzoE7GdDvrrZftxago4CGF6+KmAqdACZUeIrO3Y0L
	qD6dEl0n+vwhoQegLAEgIYWL20Xp0UIXgAzdFMcPlEw1CDBhZeJ+uahhoaxY23ZORjWNH927mLiCk
	C5mY8PIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYqj-00000003UgD-3NHf;
	Mon, 08 Jun 2026 12:13:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYqi-00000003Ug4-3tFm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 12:13:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 60D24601D8;
	Mon,  8 Jun 2026 12:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBD11F00898;
	Mon,  8 Jun 2026 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920780;
	bh=0vxDtjZ+UU7C96xeFiCYrDD6u0Vo2RHrNSoMOM3Lu/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=o0xh0eMTMmCg3uethEwOpYv9/tFaCJq9rKJyDVASkH9PaE5KBfFG6ho4GhGUH4lL6
	 VwZWAPlY/JUuTfj+PLYfbwGipWW/P1PRVsW7V/wkF1mZ78w0zhj9VeGK+Jit3Q0HBG
	 w5DqmMFM2aAawIeK45Zcago0EpLvAjr9ow9pYzQU3U2LSMWKust5uIOwBdMncBksmJ
	 QPI2AG3Bshyww4bsCxLRCkr3EtOc+Og9TM5nsIAhWCSqwTLOp12V7CKqKGyR6TDOeY
	 fCntxUvBePr/3fjvPg/cR89UJ5GbyJZqPFyrqc9jI7+uz89wEDkmk5JOXc5Uiiy5iE
	 bsepg9GxgTAiQ==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260531020843.594892-1-rosenp@gmail.com>
References: <20260531020843.594892-1-rosenp@gmail.com>
Subject: Re: [PATCHv3] dmaengine: ste_dma40: turn d40_base phy_chans into a
 flexible array
Message-Id: <178092077785.96550.7037031640195557298.b4-ty@kernel.org>
Date: Mon, 08 Jun 2026 17:42:57 +0530
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


On Sat, 30 May 2026 19:08:43 -0700, Rosen Penev wrote:
> Convert the separately-offset phy_chans pointer to a C99 flexible array
> member at the end of struct d40_base, and switch the allocation to
> struct_size(). The log_chans and memcpy_chans slots continue to live
> in the same allocation immediately after phy_chans, indexed via
> base->log_chans. This removes the hand-rolled pointer fixup that
> recomputed phy_chans from base + ALIGN(sizeof(struct d40_base), 4).
> 
> [...]

Applied, thanks!

[1/1] dmaengine: ste_dma40: turn d40_base phy_chans into a flexible array
      commit: cc4fea19daeb0460fe3569e0a2d523f427b2bac1

Best regards,
-- 
~Vinod



