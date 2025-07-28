Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B89DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeyvvuTCaBRy7drnXePaUBtIXrGKicLr161z5oeQWTA=; b=uy9vpY0qS7DR71my5PeroA2p7B
	7y8uViILeJ7ECQrTiFB1c4pLml+FhrMXMXhergYTOyfWWu5pZGNhxb/nraFc57yLemGVYOkdpOvdA
	/goKKtUBspu/X72cY/+nKtV7VDJs+7BI23rrDuJthsDkbTBei7x+m2yCCrlfW4ao+LqDFTM2oYvAN
	+qecHZkgPOwoOLEIXXiYSKj+nj+Ms7AjZ0wYX44WQCYKzmr+JXnknid+NT+949i9eRqX5xAvAz6bt
	I+xUnk+x9akKj+lBGiLZGg9qWdnGrJ/5MlqXl5hUVvEfyHH2BPTLbHD+lQhtyolvr8d8w62JWIGV/
	QWbbhsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRn7-0000000F7PB-15r4;
	Mon, 28 Jul 2025 17:37:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugROY-0000000F4l0-2NGu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oeyvvuTCaBRy7drnXePaUBtIXrGKicLr161z5oeQWTA=; b=Vf1libXAmZ3fGrZF9TaeB87gB2
	MJ2BnUHvG4/m97ycRsaJ57W7ul5gbL+O9Fxep5UQTv8DTohMHFI2z5tCNqmPKCr4gZbjd8A86d927
	oGo5S/UHAaItwJOjxYQv0n9P/81zK8GZIp7Jdkbuz4P6Q4u5cGTBpeg9d8jZv2lJorRU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ugROS-0037Ks-E7; Mon, 28 Jul 2025 19:12:08 +0200
Date: Mon, 28 Jul 2025 19:12:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 5/7] net: stmmac: use core wake IRQ support
Message-ID: <c8fe4307-f036-40bd-8d77-b80f19ca8fc2@lunn.ch>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ2y-006KDL-K7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ugQ2y-006KDL-K7@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_101214_601955_E9D96FC3 
X-CRM114-Status: UNSURE (   7.95  )
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

> -	if (wol->wolopts) {
> -		device_set_wakeup_enable(priv->device, 1);
> -		/* Avoid unbalanced enable_irq_wake calls */
> -		if (priv->wol_irq_disabled)
> -			enable_irq_wake(priv->wol_irq);
> -		priv->wol_irq_disabled = false;
> -	} else {
> -		device_set_wakeup_enable(priv->device, 0);
> -		/* Avoid unbalanced disable_irq_wake calls */
> -		if (!priv->wol_irq_disabled)
> -			disable_irq_wake(priv->wol_irq);
> -		priv->wol_irq_disabled = true;
> -	}
> +	device_set_wakeup_enable(priv->device, !!wol->wolopts);

It might be worth mentioning in the commit message that
device_set_wakeup_enable() does not care about unbalanced calls to
enable/disable. This obviously caused issues in the past with
enable_irq_wake()/disable_irq_wake().

	Andrew

