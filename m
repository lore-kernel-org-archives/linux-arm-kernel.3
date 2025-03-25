Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C57C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbNibk7vAHn+5HUmQKRDw9Q3Hr2VlQle5mTru3E9iuU=; b=mSlW7h/6pnwO487tjtYRtzC7en
	SoLGf4qNhpt0TL+5gPiKN65ZKtLpAXq0PqCIp/TEPQDk0iGBYyzEVwcjBjAeTVjwCYDkDARHVtaXJ
	LWl3C1Ybwza4EENs/9wLjndSGqPNixzG7yIKmEh+PcyjL4EfEHR/juzXiQ+Orn8F+XK7dNGDBOp6B
	d06bpA7GQcAiWsT+LjHpOKf0ydc7+bH7BqvBnf1KXf4jR6A9IrB0LWnRthFHqhcJAxMxrsOBxdxHP
	YTB7xZp3w5+b2mciUes/K9gVgythOY5V7p5GoB/mJWt4SAtmDjY3OH0NpZl5blgNlyew+qZoYcC4H
	ITsenh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5wD-00000006IbH-0GiC;
	Tue, 25 Mar 2025 15:11:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5r5-00000006HX5-37a3
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 15:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RbNibk7vAHn+5HUmQKRDw9Q3Hr2VlQle5mTru3E9iuU=; b=OSnRZddbqpUVo+qOw84t/qY4Ie
	d8zNkByS81rnVDXKs3s4kQwxcoa2+i/A4/0JjIpmAtxoyxmTZrzywZlMdNxn6n5wl9rRUyO+iyhUI
	snESQdjoSJPpk898itX4FFL1Y+nYHYBwxxy/dhH+mo4VTWjgg/dQggZ+hdWYcX+60DZjy6G7Rsw+4
	EBabgiocYQ+7wvqzdxDVviQN79Nd5DTwKy2th8q5v1rLmayhtzAXIzgDe0YGi+NUjsDogA8Ht+LvO
	inWp6Sx0E+9+w0eg9bUhrMR9pKcLPUUzIqUkk/FiLVk7gQ1/Zo0L+SMsTWEISB9s/C4YG356FkTYR
	j2upU1lA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx5qy-00000005XWG-1GDu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RbNibk7vAHn+5HUmQKRDw9Q3Hr2VlQle5mTru3E9iuU=; b=lC6ctQGRJnnjgQd6d44kIc2Oxd
	euHpZqofQd0+GoZrKsUg66OIffTd+fV+6Q1cAJy7bWbUddYTJazUOuxiYgztJs9E9F/wS3Twu0yUu
	K/3Lyy5W2xEHlG6OUrJRDlrr0o15QJfGq54BUAuen3YFo3bKYQOXsc7hBvwD92tkc7X4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tx5qb-0074KB-TT; Tue, 25 Mar 2025 16:05:45 +0100
Date: Tue, 25 Mar 2025 16:05:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, davem@davemloft.net,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH 2/5] dt-bindings: net: Add MTIP L2 switch description
 (fec,mtip-switch.yaml)
Message-ID: <2ccab52d-5ed1-4257-a8f1-328c76127ebe@lunn.ch>
References: <20250325115736.1732721-1-lukma@denx.de>
 <20250325115736.1732721-3-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325115736.1732721-3-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_150612_115490_66E3D272 
X-CRM114-Status: UNSURE (   8.72  )
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

> +  phy-reset-gpios:
> +    deprecated: true
> +    description:
> +      Should specify the gpio for phy reset.

It seem odd that a new binding has deprecated properties. Maybe add a
comment in the commit message as to why they are there. I assume this
is because you are re-using part of the FEC code as is, and it
implements them?

	   Andrew


