Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA5EE6F084
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 11:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZEhtYVtEvmfmbhi5PG418nLkkyldUEWw3ik2I5tjzg=; b=U9gtMnr7EkJhU/DBYOP6Z2hRL0
	S9tDSUEkTodFDhhX1zQksqnD/HXvlMm766DKszJWS2HaRoH5XKDI1uN8GZqfnNrXWOS9acFJKPhG8
	jRdgV45/rzj51whDfv2vtv2iznFzK3bLERX6lrS0NHe88/qnYtWLeRTjBcLuuENb71jDZdnfjP+0z
	nexjQURwsyLzMHb4MQJncO8aOTrK/2oBHeK2Qyr/f1dVrsJzIPZS7PS6gvLs/ynGdaAUd2zIBe3A3
	h7TNkEJXM+kboLflPuDRMBCbb3Lf8kGL7ScX8ewphC3/nfgnMdZRtavUo3R81nZ97xGcdGEoMFPkf
	vTkgde6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Z1-0000000Ewi6-3OC3;
	Tue, 23 Dec 2025 11:28:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Yy-0000000EwhG-17Y4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 11:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BE64600CB;
	Tue, 23 Dec 2025 11:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4640DC113D0;
	Tue, 23 Dec 2025 11:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766489302;
	bh=3aHaU2K3mzEQdrebTm1zRL81apIMrnHUsIlEm/uSDCw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YWuLuXdcMkI6FiYaqNy2I8a2qYw5mbdEb9CitKLjPg0gSuUxo2i55TVGYHGEEcplR
	 ej6iTj2Q+i38YIhQ4MTGj0tQUOcPL/5Ly6qOfafbK40MjII4jPSKvGlya+3I4vdRWY
	 XCAnwijZU6cGHSPN8r3Jqe4dR9/EpDEd5LsYJySkpYbxUFwVk7XzHakiA8dsmq0mLh
	 F/OmHk2tJwdcWcnaEs1idrNxEB8m3fETSoRKmLYmmhiaLacjmrhW2d9G2tkZgMCZWs
	 ev6TOwQ65c1IiTAqkvQmQMvcgpG68H05GHXisYyeF2n/SsJQYN1/kJ56XZxvQ+qD82
	 jzZeRYqRzEoUQ==
From: Vinod Koul <vkoul@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20251221064754.1783369-1-wens@kernel.org>
References: <20251221064754.1783369-1-wens@kernel.org>
Subject: Re: [PATCH RESEND] dmaengine: sun6i: Add debug messages for cyclic
 DMA prepare
Message-Id: <176648930092.697163.4869399888360483655.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 16:58:20 +0530
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


On Sun, 21 Dec 2025 14:47:52 +0800, Chen-Yu Tsai wrote:
> The driver already has debug messages for memcpy and linear transfers,
> but is missing them for cyclic transfers.
> 
> Cyclic transfers are one of the main uses of the DMA controller, used
> for audio data transfers. And since these are likely the first DMA
> peripherals to be enabled, it helps to have these debug messages.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: sun6i: Add debug messages for cyclic DMA prepare
      commit: 7105e968d1f6f6753f8fc3c47b8a705b6dad36d4

Best regards,
-- 
~Vinod



