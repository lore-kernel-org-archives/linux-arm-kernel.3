Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39480FD375D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tH1txli5ZbjJyuBn6TTwaByCQYmvFas0S+xVPZo4XkU=; b=jkNlKx3/foZF4dyo2ukWIMWBun
	JGqpksD/M+hJDo42TMOdXra+V4L0uVcuLx14gqigK68syUA6+1/BR4bQoaxTQwatApcR9qPon0PEy
	Jsz01bMAo+/B4mMHQmQ5TbXB+Ev8T1nxQzXbNBUKxqj0YNS0+/tMF5k0TGxiCM9bFmkUh+X5EuuBx
	VfDVmFfRGcenChSJIUiC6C/mf/NO91luv0T2Y5ewUrTo8NHJaNlHuwtMrSDrs+uG+t5+R1bOZ55k9
	0Q8tGV+GWdJnyEcjwb4fuLphK5W+MZrONrher1NxJeI38EhRtgO8f+9AZpROZtbmRh+TAfvpQ7umC
	b4FMF7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEun-000000045rv-3EkG;
	Wed, 25 Feb 2026 13:26:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEuk-000000045rH-4ABL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 13:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tH1txli5ZbjJyuBn6TTwaByCQYmvFas0S+xVPZo4XkU=; b=cAp580mKnk5S4g5wzcKCqiiMz3
	/s/rRMPjpt0tf1CQP7k/mON5eUC2AHBHAifFo+EoGjEZtNnOaz0BSo+eYyhrzNWQ9ej+33z4zv7Kp
	aoyt2SA7oU7NHNFkxMxTaXuZzuvsC2J4KLZUml9OBEvkJTK08/6yYPSOWHamHIUUnzmw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vvEuY-008kQQ-UM; Wed, 25 Feb 2026 14:26:42 +0100
Date: Wed, 25 Feb 2026 14:26:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: fix .ndo_fix_features()
Message-ID: <af465a47-264f-4029-943a-fd4222092f9d@lunn.ch>
References: <E1vuU3X-0000000Ae9G-1Er8@rmk-PC.armlinux.org.uk>
 <20260224173037.7871e5ac@kernel.org>
 <aZ6xqig4zh_Un8R7@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ6xqig4zh_Un8R7@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_052655_031697_E0E7D8D4 
X-CRM114-Status: UNSURE (   8.75  )
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

> Then, looking at the "Enable TSO" block of code in stmmac_hw_setup(),
> it looks to me like we can end up with some queues that have TSO
> enabled, and others which don't (because TBS has been enabled on the
> queue.) As far as I'm aware, the network layer doesn't support
> per-queue TSO.

There is a software implementation of TSO. See for example:

commit 3ae8f4e0b98b640aadf410c21185ccb6b5b02351
Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date:   Mon May 19 14:00:00 2014 -0300

    net: mv643xx_eth: Implement software TSO

You might be able to use this to fill in the gaps.

    Andrew

