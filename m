Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7619EC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKZx+ytfOHaHjW4WxvMoSFj7b7vu5gzRoRhAmeG8K+0=; b=wlo/zjRgUV1xkPI/DlvjMk/G34
	S/FNy8bkaGcIermz0E1UVPHAH4Cgp9N/vfO2VokW6UiY1wvj8V+idzDbLDcXckBb/8mQ0JA00rh4i
	EyRgDhQbMmvBxLrGnbYjG1/DN7CG+z3jsJEqaoPiawYKwjuwkuaGzFGjN/YKLmooXXkaM2w4+wwyf
	lyfGRLEC2ewINbOQYYWXdlwB4maL6GwWLzmvEo3a3pQdCf22j+wQZDQnYsT4gGnX4LE1mgGLLA982
	lDvKoYX5dA5caejtijm1QKgYJytdaxhWmQ+0ZcQRD45UiSZo+0Dpsw///uz06nc5EsDQtk9QaFt9B
	WAHZdUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDuO-0000000FZJ0-2Rn7;
	Wed, 14 May 2025 15:20:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDd5-0000000FV2a-1Jpa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:02:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BE26761165;
	Wed, 14 May 2025 15:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2709EC4CEE9;
	Wed, 14 May 2025 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234962;
	bh=5VGSJ7ucwRKC6ig6fod1DNEI/NamUi+YyuaqfxQA9b0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bAqmd5d9I3Oa8Xej6pTZ4LohxpRS9jd975k8zC3+nk+yYncY4V0NH+anaEQWiEb4F
	 ggMClI4/kHUyvHhZe3i6D5SfvWtk/UUcWsSUoC4L/hqhRqlqNX0eXgNBFLnpbBm59K
	 KTVRHKeW3GHB+hpyj534CT1o+iFLUPJZUiPTAvXDXeW7CHZ8Nir1Nftei7MyiVXP6T
	 P1YOjUsE8gTbheXtG1L8TGZlRFbTOjg6rqPfGUN88RFWaUmkMroDXTeN7O5zXf6R26
	 WCWNCHVxZ0nBT7S0kt7+VMJhw/C+hwzxPbqC7iaOiO2HcL2U1HFFudDyBBWHHf7Hhz
	 1ORZI3AHOgakQ==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@nxp.com>, Joy Zou <joy.zou@nxp.com>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250424114829.9055-1-wahrenst@gmx.net>
References: <20250424114829.9055-1-wahrenst@gmx.net>
Subject: Re: [PATCH RFC] dmaengine: fsl-edma: Fix return code for unhandled
 interrupts
Message-Id: <174723496086.115648.13109604693240649188.b4-ty@kernel.org>
Date: Wed, 14 May 2025 16:02:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Thu, 24 Apr 2025 13:48:29 +0200, Stefan Wahren wrote:
> For fsl,imx93-edma4 two DMA channels share the same interrupt.
> So in case fsl_edma3_tx_handler is called for the "wrong"
> channel, the return code must be IRQ_NONE. This signalize that
> the interrupt wasn't handled.
> 
> 

Applied, thanks!

[1/1] dmaengine: fsl-edma: Fix return code for unhandled interrupts
      commit: 5e27af0514e2249a9ccc9a762abd3b74e03a1f90

Best regards,
-- 
~Vinod



