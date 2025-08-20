Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0495ACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 01:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5X6WDk5lmEEbhdO+VSINzKKs/pm+DoYKSxqvM8wsmG4=; b=oNuBPI7DH6nL3T7dNApJx9rRFz
	SNl2IHj3i3121cgoc5xGtFoicaavLnvqd6a1WBd0B2RE81YyUg8PbEmihh8GzhZzRmV3ASHiDG6KL
	g6esKrGYW4H5W5H04cmyCQyjARTOomv+dugmIRDh9J+N5/5z0nSGpYrpIa/2v7ZEZTPfx7ptwVXQO
	nm++IppGNM9pLXJdiMQRoPH4SumUGqYYBzkkfd1cBHN5NBWbgBevpB1QmAQxh+1UrN3EZbaK/F3YB
	j7gma3YXY3Iz//6DTacJNTRpaH4g5FHSsdaOMd4pKZvFYrmK1gjtR//vyK6C+BJ99D8Ey5y/Ul6KK
	ULEuNdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXlT-0000000C6at-3Qft;
	Wed, 20 Aug 2025 01:37:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXWk-0000000C4sR-07vY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 01:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8AAFC5C5A64;
	Wed, 20 Aug 2025 01:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB17FC113CF;
	Wed, 20 Aug 2025 01:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755652929;
	bh=giJrwNr4gTNI+BHt14QArf7z8KvI8kFYYAqwhT6nAzc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H/AKtw8RMqpy1JosLZEooNgULsO4wBZsWKirV3sTpu1SUB2bXcRfWL680obJWgZL2
	 AyX7yUuQmp9vkp8MoF7VGXbza+fcDlaEm5p3EZovW9zmudPrjyGHouiATXHPu+gzu0
	 e0fpta8hr+QKHjiGrwIuvKMFZVktAABjw1hXwGIXXaG1hQSTdfUfTTHd0EXKD1hvB/
	 q/DbOERoiBF3qlZMa/h3Cg11HLD7szlcYO8lHJ+bihAfzFQWVVjlIIfxMmJqMknj0e
	 BiuD7Ffl90P1nV82+pNwmGSinDFwuMfrPbwchulcA9nyCKIFPiUQMdVKrqYeWQyN8s
	 1ZEURTQMJupow==
Date: Tue, 19 Aug 2025 18:22:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Cc: rohan.g.thomas@altera.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Serge Semin
 <fancer.lancer@gmail.com>, Romain Gantois <romain.gantois@bootlin.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Ong Boon Leong
 <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew
 Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Set CIC bit only for TX
 queues with COE
Message-ID: <20250819182207.5d7b2faa@kernel.org>
In-Reply-To: <20250816-xgmac-minor-fixes-v2-3-699552cf8a7f@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
	<20250816-xgmac-minor-fixes-v2-3-699552cf8a7f@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_182210_114702_E83B0D72 
X-CRM114-Status: UNSURE (   5.89  )
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

On Sat, 16 Aug 2025 00:55:25 +0800 Rohan G Thomas via B4 Relay wrote:
> +	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;

Hopefully the slight pointer chasing here doesn't impact performance?
XDP itself doesn't support checksum so perhaps we could always pass
false?

