Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEA0D60D09
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 01:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8U8UwDGXeKDkqdmDQD2AJ6C8adRsvYsEsUh2q0q8beE=; b=nxRwfN2+MwnQoc6IL3826jT8b/
	rNNQERTWzSoWBGpacaJvGYT34K9cLCCJ9tpL6uWtFd0RTLl/5eHN6uALiM0Cd2a2iAA3TCGUpv06c
	RLtDWDdpgciChjQPI1fhgJPCS+EBZDIftaRkc4BcmH7zoPeHuuIHraYl4aUHD2WB/2JRkhNVEe2/Q
	XUdUbVA7E7dCOotZ7S7ZvW37VkyfPqUZgNwqOzRPHHb+lEfTS2oHDM8W3GYNMT+/DDoZk0sjqj44x
	yBo7Eoa5j8Mmn0d7sHQE9Epgjwz5lzoe47yLW0A8cGXOPiSaM1NotjbIK0LyHUs+k6FUUXLDiU+bo
	jjo/Kfpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDMw-0000000B6x3-3KAK;
	Tue, 19 Nov 2024 01:49:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDM1-0000000B6nb-3HHI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 01:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8U8UwDGXeKDkqdmDQD2AJ6C8adRsvYsEsUh2q0q8beE=; b=uzjToPKKzfDbUOnMQ8BEFtGznv
	HP/d4wX3y4jUF9yLCoXy/fI+gFmjX6TMNsWTRweaxbcGNOgkr+7lVo8hrl226YdeZTsmqdthvjGYv
	sm3Qoh3WHHy4iU9zQbBTSZpJBdWC/qZuf8nkAJOg4iJhhhqH3twZ42e9mmHR3EOgLjyM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDDLn-00DjVx-O7; Tue, 19 Nov 2024 02:48:19 +0100
Date: Tue, 19 Nov 2024 02:48:19 +0100
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
Subject: Re: [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
Message-ID: <4d44bc93-6a81-4dc8-9f22-a103882f25e1@lunn.ch>
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118082707.8504-4-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_174833_817206_09E3E709 
X-CRM114-Status: UNSURE (   8.18  )
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

> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
> +		tx_delay = 0; /* Default value is 0 */
> +	} else {
> +		if (arg <= 2000) {
> +			tx_delay = (arg == 2000) ? 0xF : (arg / PATH_DELAY_DEC);
> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);

The device tree binding says:

+  tx-internal-delay-ps:
+    enum: [0, 2000]


So only two values are allowed. Yet the C code is

arg / PATH_DELAY_DEC

which seems to allow 16 values?

Please make this consistent.


    Andrew

---
pw-bot: cr

