Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA17CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQcN01flXvmZynFgyhsjX4tCETEGAqozzqQcGxMIPqo=; b=TVVzevzRjHKfub8QM0waSmKus2
	AhoTE5m5YOC9UjNUHBvJ1QHJM6vGljoMla85yp8Ty8USzTL6DDZtbwW2Bc/FPJB53t/mlMbApyxcr
	dI0d1nVKmw2i3uZu6O/bSGorVY/SxnSvEFx6RdUF/7enmOmCHg/JKt3LSRiGrX/0hyQN8iMrxsnoZ
	d9rGY3UF+KdYzwtcJrrBXLaszO1pgJaoOdwiFeYhSvOwD/ApJU63EzPu161nFjAFPKShohJARU7xK
	ddPUt/z1fPxCbjONTvzHKzlwROpLEMCYa9uqh9qm+OJRqByPU+xrQdbDlDBuTGEK2ywPZTRVj2Sm4
	wsAa2tLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2Nx-0000000Bmz5-1oQv;
	Tue, 24 Dec 2024 10:43:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2Ml-0000000Bmnv-0Pu8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 10:42:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15A0E5C5A61;
	Tue, 24 Dec 2024 10:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC747C4CED7;
	Tue, 24 Dec 2024 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735036937;
	bh=kEjX0uMOUgoJnsumDFEjXw0rukEN7DCNLT05YMxM1hQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A+0Ummw4MZ9/BndSUcSmJai7EXJrzI/aVGd32/aJHpyGC2eOExYGvIRXZATN6MJv7
	 jgecSBTeCeYYPaIjI1eIb3beCo0/iqdJuUL0SlbHRMG4VlWaE0PGJSewtdGe/xOrfh
	 yOKlxnSusGIY7wsgCaWH4Awb5X3Mc45bdLTlqXEa5lWTdWvz4ff0NlaVo0q9COrkxL
	 l4pH5CCY2W6lWnYq7g8LvQ/yWQdSaTi4B26BRGux2cf6tHYFKHBg3QWHu6CPqxrSQx
	 KEkWTlPbihbT9GgnmQWn+NjB3I0KlTY2r1/wMA8+fd4cx8DnrTXZZR3vnx27NQxy7P
	 frdlXRTIaTU7w==
From: Vinod Koul <vkoul@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>, 
 "Ivan T . Ivanov" <iivanov@suse.de>, linux-arm-kernel@lists.infradead.org, 
 bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org
In-Reply-To: <20241204165546.77941-1-wahrenst@gmx.net>
References: <20241204165546.77941-1-wahrenst@gmx.net>
Subject: Re: [PATCH V7] dmaengine: bcm2835-dma: Prevent suspend if DMA
 channel is busy
Message-Id: <173503693445.903491.14468199759886552238.b4-ty@kernel.org>
Date: Tue, 24 Dec 2024 16:12:14 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_024219_185999_D54E58BA 
X-CRM114-Status: UNSURE (   5.93  )
X-CRM114-Notice: Please train this message.
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


On Wed, 04 Dec 2024 17:55:46 +0100, Stefan Wahren wrote:
> bcm2835-dma provides the service to others, so it should suspend
> late and resume early. Suspend should be prevented in case a DMA
> channel is still busy.
> 
> 

Applied, thanks!

[1/1] dmaengine: bcm2835-dma: Prevent suspend if DMA channel is busy
      commit: 9602a843cb3a16df8930eb9b046aa7aeb769521b

Best regards,
-- 
~Vinod



