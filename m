Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16B7CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 07:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgwW0ArP1Xeb+OuDBxc0n1MTgi0tuz5Lo5UBvgrMi2Y=; b=FYxDPlJfSTgSzfmogkLHKSHKoe
	o6mdnQ7LY9kW9DpLRyAF7WrubVKipkzGhWNs8p+fSKbWX8YpGKzublnVFUEVtMikq125GRt96HENe
	evAAJz6JY/tGjsMaAOf3yCnWyOxH/RRxfCN9ot3uynSi9apaLCH0TVbZUvDBdJPuLH6GP1od5wEFD
	r2KMhzaZSS8BlHvu4LBnMHautVPhwIDocHE6/RASe4AkK++GlT47k5R6EHALfzoVoDA2T9LCWgv+q
	Zga6ezTlx30Pnnf/EDyuUEGkBlwMGqNh6WwujqHrZxJroH0s28Meaa3BfmP5MA2UwO8VJ3W4G9qQa
	jk5f6zbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9I1x-00000003iGJ-3Kvu;
	Thu, 16 Oct 2025 07:04:09 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9I1t-00000003iFy-2cLH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 07:04:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1FCEEC03B71;
	Thu, 16 Oct 2025 07:03:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C1636062C;
	Thu, 16 Oct 2025 07:04:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C887D102F229A;
	Thu, 16 Oct 2025 09:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760598241; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=EgwW0ArP1Xeb+OuDBxc0n1MTgi0tuz5Lo5UBvgrMi2Y=;
	b=Wx1st7lIJl/IIfm3alE87+k9DoScC+ITTNsxAUKKuQEgaGTYImMhig9VUTBDPghOMKpvYe
	r14AH2/hwAYAfIgT6y7u39Tnb2KBoCiRcVeoJz2o8eodfpoaFh+z0OstVwi9/2u9I0hY8j
	YBHsgvoZSFWSm8tFkwhM0vSTeD5PV/wbJDAxm6ocwFxtaindVc/+uAhoWgPERk2GtQB6SZ
	a46/SApA0VKOKY5zzA+a3Gnn/dYeYnbqzLm+55v1jX44GjCSy+oKD9E2IBx6PcMLPcFFqX
	9MGSXk6vmZpLpng9AmEtzsaqShRsJmQnEuS2DycgI9moygjf6RCYVHlCjo/xjQ==
Message-ID: <d47e6753-ed00-4380-b11a-75088e885a48@bootlin.com>
Date: Thu, 16 Oct 2025 09:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/5] net: stmmac: dwc-qos-eth: move MDIO bus
 locking into stmmac_mdio
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
 <E1v945J-0000000AmeJ-1GOb@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v945J-0000000AmeJ-1GOb@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_000405_851161_D243D0A2 
X-CRM114-Status: UNSURE (   4.07  )
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

> Rather than dwc-qos-eth manipulating the MDIO bus lock directly, add
> helpers to the stmmac MDIO layer and use them in dwc-qos-eth. This
> improves my commit 87f43e6f06a2 ("net: stmmac: dwc-qos: calibrate tegra
> with mdio bus idle").
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>


