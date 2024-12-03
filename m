Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF18E6C5E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 01:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2BawypFFndD3SrGkOuaOBklERnQr8M/kRlTiV79YKA=; b=bh/Fq7JWwg7VeDKpuwgpL1eWEb
	OUlMCAtDVk6f8LM6esA3gyfo8P+dnwTAqAu3kpfABkMDDj7zvm9cM9Ldys/iC9A2QYlRqcVvk4enB
	DAxESUS5ivDodVfZX5F6/fblooFnGKmgEaYmJS8iJRtgADLJyMK1yggyQRMo0WdZK2ERMjYAcyFqT
	WK1+1506XMvym/r5iU2j4EeopjMHhHyKeKt0XiW5feIkTEuRt7llP+Yq0bONaA8XMNccrsqySlapm
	aBv7oWdrUjdsZReTdI6l/91aWRtzvCEmrvq8gEUC3oNgjZOi+BRxwbdxu5u/r0BrivYfEqYQ5rFPW
	gYD0Vd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIHy4-00000007wry-3iU0;
	Tue, 03 Dec 2024 01:44:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIHx4-00000007wj2-3bvH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 01:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+2BawypFFndD3SrGkOuaOBklERnQr8M/kRlTiV79YKA=; b=Pe1aDSZhV4jQUs1b8BbmvYSH21
	YpVo8jw8cVF6cIMafA0FBeyAKLNamFvRU98nDh6kvZOv3mbr/K4blghnVzE2dAEDg8M+iG+L5MPXY
	Ld94wp7cF4STHSj6GVnyCvp6cHRiavTXWt+kUBNb/sv1bjNLUPIhrnANNvuyfKYde40M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIHwo-00F1En-LE; Tue, 03 Dec 2024 02:43:30 +0100
Date: Tue, 3 Dec 2024 02:43:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
Message-ID: <9f2c8532-8e52-439a-b253-ad2ceb07b21b@lunn.ch>
References: <20241202023643.75010-1-a0987203069@gmail.com>
 <20241202023643.75010-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202023643.75010-4-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_174346_898195_AD76F37A 
X-CRM114-Status: UNSURE (   8.17  )
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

> +	/* We support WoL by magic packet, override pmt to make it work! */
> +	plat_dat->pmt = 1;
> +	device_set_wakeup_capable(&pdev->dev, 1);

It seems odd to me that there is no WoL support in this glue
driver. So i assume the core driver is doing it? So why does the core
driver not set pmt and wakeup_capable ?

	Andrew

