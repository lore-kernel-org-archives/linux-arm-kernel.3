Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B35EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrqTJm76Kt5HXWKNGtaVF8NXJWTQURY64tclnWYp1Ww=; b=TOd+O9+B8QrVgsqh5YHRT+t7c/
	bkuwp5ijhYH/A7MJKwt9A+2X22GY76nn1BiAL64YFk24fOQ8IOPUmZT0hKwHem2eFwVhUfKkko5sK
	ZCkAYcGFIJ07i6ZGY4kSwKvLrtcgmJwdiHy3xmxjSwe+8wcdbKFkkotoVLwzh89z9xkBT2RK6X1NY
	B91cmgx54Aitv0m5iKnvCMz1mtE27fNJi6b/9rC9f+v/eX09F6h0q9F30UcYwPHsYTWLRPFpshxqZ
	tewcphoxTWRx56546+MyJz6XKWTHoXuhVHU5tdQ5F3JB2JPsTU6GTgQ5JiQ++r4vwQRinMQH2+lhK
	t0eKy1bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJtM-00000004w6K-1Ucu;
	Thu, 02 Jul 2026 16:03:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJtL-00000004w4x-2PvU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55B7043B59;
	Thu,  2 Jul 2026 16:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7841F00A3D;
	Thu,  2 Jul 2026 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008235;
	bh=XrqTJm76Kt5HXWKNGtaVF8NXJWTQURY64tclnWYp1Ww=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jISRAUCs1seajBhTHUM5kTliogvG0qdZDrZcJolDVGG3KjnCe5IstZgBLwhZqhg0/
	 7hZxrgH/q0fLLDKtfA2ISqNR2j6rA871RaAK5kbunPDC5ygjUGupMkPfA6BC+dkMUu
	 4MeC6iZu6PPi5EKNPucbE7/IJ7clvD8LtAFL9QLie03MYKPsPCVc2f8hOM/m4+wu6d
	 YoMMCsHCMd1sta3GyJ2RDlZkUNxiyi9gBkjucJfPv+i5Jbk+AdAbeX1tFvZs+o9y5B
	 BS6Fg6sCELoUMQb5JdtnEQ2oWN829itJjo+nFCaHKF31K7n356UEJNEJbxoKwdQ1Da
	 ZeaKJoairPs3A==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Kedareswara rao Appana <appana.durga.rao@xilinx.com>, 
 Ulf Hansson <ulfh@kernel.org>, Alex Bereza <alex@bereza.email>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Suraj Gupta <suraj.gupta2@amd.com>, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20260402-fix-atomic-poll-timeout-regression-v4-0-f30d6a6c13cb@bereza.email>
References: <20260402-fix-atomic-poll-timeout-regression-v4-0-f30d6a6c13cb@bereza.email>
Subject: Re: [PATCH v4 0/2] Fix CPU stall in xilinx_dma_poll_timeout caused
 by passing delay_us=0
Message-Id: <178300823153.756665.13267534916736185819.b4-ty@kernel.org>
Date: Thu, 02 Jul 2026 21:33:51 +0530
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


On Thu, 02 Apr 2026 09:46:21 +0200, Alex Bereza wrote:
> 


Applied, thanks!

[1/2] dmaengine: xilinx_dma: Fix CPU stall in xilinx_dma_poll_timeout
      commit: aa99c4d1d63bbc26a5fc4c667d89b2595743c19d
[2/2] dmaengine: xilinx_dma: Rename XILINX_DMA_LOOP_COUNT
      commit: a6404c7291bcc10114e72e9d0226709ec9d05d5a

Best regards,
-- 
~Vinod



