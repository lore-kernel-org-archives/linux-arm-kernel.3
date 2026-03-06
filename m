Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72F5F01832
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxd5+HhPr1aXq8AG7jS9dl3xaEa1KYdFdeENyM5pOHQ=; b=FRm8aYYWZJM+YOUYnjofxL81LA
	nlw5kwTRk9ElzDE9wz1hs4UwdPkXPYQXtWi711PGWvx5OyGYbiuIrNS73CmfdgIWSMl4MqqQsaL76
	1ZvgTHde8qm+KI1Eq/zFXTIheMArpUbSjS09hFY9jhbYcm9qVGO1y5rW3MHQpCz1+YsxxJFjak37c
	SVQWeAF9JaoaWEEyNUB6CK7yw9z057SNSO9D3wENfTOjYO6Cs0Y5gJa3mNvVPL4h9FiOpbh7Vq0Qm
	X6WMIvAVaBZOJ2Z97gkp4B2AojF3RjQLp06nIE+zXzYKI0STecVTy5mlOld8OXvDyw6eUOsS/pxcu
	VIQZDcUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVGh-00000003noQ-1uHF;
	Fri, 06 Mar 2026 13:31:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVGe-00000003nng-3ODT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:31:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E806D4E4258F;
	Fri,  6 Mar 2026 13:30:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDAD55FF92;
	Fri,  6 Mar 2026 13:30:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02D161036994E;
	Fri,  6 Mar 2026 14:30:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772803857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nxd5+HhPr1aXq8AG7jS9dl3xaEa1KYdFdeENyM5pOHQ=;
	b=S9QYFZ+bN8spKnDrozVteeI8ay2jV8Tu0iKqrFGRt1aftAs06DzF7J2XvLihvAtNee8mJI
	RQ4xIKsmzy+mvGvD1WXSgrVofGUZBVR1/1uTrn/rB+GpRBQ4z4sY8bnMMCM8ON+xvodnDu
	+k3z/H5xntZh7wxTG5ZMYb4HpR9NBrfNM5MLou+Xw2TKFIlg4iGEE+LbWt3YuEim1wedPn
	XT4lIVp2BdehjfieXtLp0ZRoINtrvzU+HgIjM9aUvDLtl9S34CyQJA9BmCdZOgzUag4Tnb
	phfAnu1BNPeR8EBqGhYCtvdcDjx4pTsEqXiTgCZ/4zcdiR9OyVdal36QCmwW3w==
Message-ID: <a91ba34f-cf47-4983-9864-9da6ac23e078@bootlin.com>
Date: Fri, 6 Mar 2026 14:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 6/8] net: stmmac: use GENMASK_U32() for mdio
 bitfields
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Samuel Holland <samuel@sholland.org>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
 <E1vy6AO-0000000Btx7-2NDV@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vy6AO-0000000Btx7-2NDV@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_053100_994310_DA100B5A 
X-CRM114-Status: UNSURE (   4.45  )
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

Hi,

On 05/03/2026 11:42, Russell King (Oracle) wrote:
> Rather than using hex numbers, use GENMASK() for mdio bitfields.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


