Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0044D262B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tx+HtW8XkiBnXI7M6euzyp+ztlyz/4sLflVtjAAczJI=; b=A44F1rgE8XHFpvK/VZXg6Jfbf3
	A8kUXLrWfB55ck89gq2MjMhz7Ama2ZWmhlGss51mLx+1QY7t2Ymh/ZNQYNvSoCYcoiBo/t5PCj0Im
	ynYmWL+qPuwFqbNiSSattrlhnHKZ9GX6gW/GBreoeNDzH/FbnK/ZCk7AWfBXVpAlmH39J1cKZcbGK
	BdaEYOlkX8iU89M7Bw3sKHhfJzlyvGFSPsv/FlGmAeVUyUW699AtD0/D3L6e1Sq5QqyVOJLAt8aOT
	DnbNJaOj7ii8fPIKRZ7ROFzRyEW995d8KJbXaR2RkKurB1dfmJAb0woSKhQF+qkWzcS0Wpqmszv/d
	flhJRmdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viOAZ-00000004o8p-0Llr;
	Wed, 21 Jan 2026 02:42:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viOAY-00000004o8f-0uEX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 02:42:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E270260007;
	Wed, 21 Jan 2026 02:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75CDC16AAE;
	Wed, 21 Jan 2026 02:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768963324;
	bh=v6iM2yAiePFKIrDAfdbKUGOtEjOGrJcEX1d0m5fqtzc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RpUsS3+svJ7wU44s7Lrl6l37xAuKy9c+32CPVneqmEiNATCL8aT0KgHmRSznKcH2O
	 Zd4Sm2Cn3cf4ObLU4l+FRIKNaCHajuzbPPwNvG9a654obIVXOC/lk3vmgfcBRs7vBe
	 4YJlD0ZNmbRrnO60XPUFBgiW7ppTMtEQarKsX0D2O/C6nmUrgSKTpspStRJy8/xnya
	 vBBt/Ba34i7Y0g4PBB/SQg/3lO01ejrY+uqTQ0eyB26j32Zyw8xzS1M8rB4LDeAxJh
	 SmBvnmF5XMDhugBWYLuBUQOqTkGzAzyVvlu9TklzpljShCemXSF+gryFS+nES2RxTC
	 crQnJJ/WR/m/g==
Date: Tue, 20 Jan 2026 18:42:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
Cc: Suraj Gupta <suraj.gupta2@amd.com>, <radhey.shyam.pandey@amd.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <michal.simek@amd.com>, <sean.anderson@linux.dev>,
 <linux@armlinux.org.uk>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <bmasney@redhat.com>
Subject: Re: [PATCH V3 1/2] clk: Add devm_clk_bulk_get_optional_enable()
 helper
Message-ID: <20260120184202.30ca2a5f@kernel.org>
In-Reply-To: <20260116192725.972966-2-suraj.gupta2@amd.com>
References: <20260116192725.972966-1-suraj.gupta2@amd.com>
	<20260116192725.972966-2-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 17 Jan 2026 00:57:23 +0530 Suraj Gupta wrote:
> Add a new managed clock framework helper function that combines getting
> optional bulk clocks and enabling them in a single operation.
> 
> The devm_clk_bulk_get_optional_enable() function simplifies the common
> pattern where drivers need to get optional bulk clocks, prepare and enable
> them, and have them automatically disabled/unprepared and freed when the
> device is unbound.
> 
> This new API follows the established pattern of
> devm_clk_bulk_get_all_enabled() and reduces boilerplate code in drivers
> that manage multiple optional clocks.

Michael, Stephen, if this is okay with you could we get an ACK?
https://lore.kernel.org/all/20260116192725.972966-2-suraj.gupta2@amd.com/
I can try to apply it on top of -rc1 in case you want to pull it 
into the clk tree as well?

