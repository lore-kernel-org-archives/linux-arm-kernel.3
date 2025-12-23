Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C9DE6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 11:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+MlrX3ndoEQZUZ8jVVlNdNh1jBBMsDRCHgt2dyzijw=; b=CBp/IaQyuff1MUdmbZuhHs36Rc
	34PufILePfTNytoI9XKBN0JGPmnQoBroSGpaVbpKfeTC3YwaVgMfqmbceHyF3A5ziWUekPQbwVByW
	LoQMG8HO2OXmeDeHCGFIVQcWVY/5BoKNzRGaByCXuvRdCSmt1+V+pAS5hwrenLF5gbLO+zh3nusPU
	TXaiMNnvcI9h2/puWSWLE010WPWfJ+PFLg7PTbYo82LwR/tho9WslbpV/75YfMrBlKAIf/SriDT/C
	uyP9J142xnpQsHoT97gjkbtAGPx/RYJad24RTSYgtf0nNh65/2FS2gSs/qOoSObGPFljvLB4dTudP
	h5CK8SiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Z2-0000000EwiS-0W8v;
	Tue, 23 Dec 2025 11:28:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Z0-0000000Ewhp-1ArU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 11:28:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2C7160141;
	Tue, 23 Dec 2025 11:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C92C116D0;
	Tue, 23 Dec 2025 11:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766489305;
	bh=2zqAY6YhuR6aovqd+4F5iZK5voCCVx81r3xUyWfFGqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FjAtNB1hNYlZ83eLUN/5mzx4g9vRuQeHTSrwoYycM5RoLPOhA4+xreuL2TwbQ7FlE
	 3qEBJvF5zgY3PJhbOwF7gGchnlljOnkfxiP6GHxtJ++h4SVq3m7AxXlLcmQK4n6kEv
	 avSeMVWoHbpap1+sflJk5SExcknRQ4sCW5W8ZTj6kw2CDr+jPEj9TfTGbV21uJ3szE
	 IMHuSa4h+liC+As7T2W56n2LJYFGH4VKVE+YrqExFhJuTstqcTyiLLM6ycOWv1ZGTR
	 iaC/V46GCGOvRluV9ggH/S7IHNrkcvIHGInUuYclsGTnGSfBKR0VSYcFs0wNZOY63D
	 ykjHDrY2qVCPw==
From: Vinod Koul <vkoul@kernel.org>
To: Michal Simek <michal.simek@amd.com>, 
 Vishal Sagar <vishal.sagar@amd.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
In-Reply-To: <20251218-xilinx-dma-residue-fix-v1-1-7cd221d69d6b@ideasonboard.com>
References: <20251218-xilinx-dma-residue-fix-v1-1-7cd221d69d6b@ideasonboard.com>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Add support for residue on
 direct AXIDMA S2MM
Message-Id: <176648930316.697163.15880064963614554229.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 16:58:23 +0530
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


On Thu, 18 Dec 2025 10:39:37 +0200, Tomi Valkeinen wrote:
> AXIDMA IP supports reporting the amount of bytes transferred on the S2MM
> channel in direct mode (i.e. non-SG), but the driver does not. Thus the
> driver always reports that all of the buffer was filled.
> 
> Add xilinx_dma_get_residue_axidma_direct_s2mm() which gets the residue
> amount for direct AXIDMA for S2MM direction.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: xilinx_dma: Add support for residue on direct AXIDMA S2MM
      commit: 5c9142a8063f71233b25d94ae0d73e7dcf9d2a1d

Best regards,
-- 
~Vinod



