Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF53FC6174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Upe3isB/Gl+xV2YsYulLR4EzMgXfGDiqIaeAB/5VGhc=; b=D8WVY0t4SETG/1RsVqD3vHvnz5
	SB/D6xcafUtVL6u8X9Cwyjmd3V9kUKwkGT9dpiAKCC3zcDdr5BoV+SagC3nmaH7fTo85QrFmb2Dzl
	IQieTgKK6a9GkAWftYm03MI12MrlRnbENqq8xRZsE6hLpvBXmUW3uOLjgI2SH0mF/DnXWI9Xn7S5I
	SE67YtSLzSGigu0mtQqjfu6KwOJhCrlsfuZog4Q1uKwtHjTwVirWEmT41rw51y1z+7/OkS4ujWQtN
	kuOdIyHKUxsUmeGUApdAjr4LLxYUaVq419PlJyppUtjfOK6pi6shKHskwcSITRHn2vwFUHAVSGJEX
	yBkAg7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbx2G-000000096DZ-2zvk;
	Sat, 03 Jan 2026 08:30:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbx2D-000000096D8-3em9;
	Sat, 03 Jan 2026 08:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Upe3isB/Gl+xV2YsYulLR4EzMgXfGDiqIaeAB/5VGhc=; b=V2ZJ+66HaWObq+W9c1fxuIn+9Q
	LKQ7/K/dS0DOyk0BjBLsg9auh1kGMrXe5JqB0u9AdvOPBzIwa4T+PgIJHg5Y1qC0iTyrPoEcTe1um
	oJVRRj/vPjWG3m4erwtgKX3CFBPzSgBXLhw5bjzBtaVrOfd4UqNNFRr8vAoIWCc2xG3c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vbx23-001Fit-Pf; Sat, 03 Jan 2026 09:30:43 +0100
Date: Sat, 3 Jan 2026 09:30:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sebastian Roland Wolf <Sebastian.Wolf@pace-systems.de>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sebastian Roland Wolf <srw@root533.premium-rootserver.net>
Subject: Re: [PATCH v2] net: mediatek: add null pointer check for hardware
 offloading
Message-ID: <6491ccf8-0318-421e-ba44-1565875e374c@lunn.ch>
References: <20260103005008.438081-1-Sebastian.Wolf@pace-systems.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103005008.438081-1-Sebastian.Wolf@pace-systems.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_003053_953477_47EA06CB 
X-CRM114-Status: UNSURE (   9.56  )
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

On Sat, Jan 03, 2026 at 01:50:08AM +0100, Sebastian Roland Wolf wrote:
> From: Sebastian Roland Wolf <srw@root533.premium-rootserver.net>
> 
> Add a null pointer check to prevent kernel crashes when hardware
> offloading is active on MediaTek devices.
> 
> In some edge cases, the ethernet pointer or its associated netdev
> element can be NULL. Checking these pointers before access is
> mandatory to avoid segmentation faults and kernel oops.

Would it make sense to return EOPNOTSUPP, or maybe ENODEV? This does
seem like an error case.

     Andrew

