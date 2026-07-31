Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BC4C55162
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 02:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmPGEnHMged4MVtOCZdKBh7EW5THeW2s3SZc/Fx5p8U=; b=WVhbBMWUXOsyZkxEqInEEWi0rP
	Cf1SBce2BHwEo/StFDIyQZW3KaJ/HcJT5Q7MnmvyNxHoieCZPOU6PkJz4SmtwXsKXzEhDM69U7i4e
	RCVOi0GZEMN7OdErAEprsZ8P20qQB6lvAbR/LgGFECgVNhsBzHXmT2a4j8bQi817y8Xo9pGwHNOut
	OLCyaXTBGh6Bdj11Os9vt+QsyNZf3xt7h8rIsRi77+WIVr757gwXXqlo4F08FSTTDKKOFsIs1kRt6
	DDBd5aog7GuvWe9VosBrM5AyitsPVzwy+ExIkyMizcvEpq3ouviRvja134vvqFbsEkD/ZGCuNGA1L
	wpdTPdYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpcjW-0000000BbrL-2Oxs;
	Fri, 31 Jul 2026 02:12:22 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpcjT-0000000BbpJ-2tbc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 02:12:21 +0000
Message-ID: <507ad6a6-52a2-4c68-9ba2-5cc4f92e192d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785463933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zmPGEnHMged4MVtOCZdKBh7EW5THeW2s3SZc/Fx5p8U=;
	b=set1ZuMU2l1LJhdbElnaHncW3htVMpJ+LT8KAyNE87oHGeSl7ekI5XfgExA7/eEmyO/xEK
	cH9suoKK28MhKg/0O3j1IwdJeTw1fAH2LwjDMLqOmWbVqqs2wRfjKhxljNqtMwsg7XPFSu
	S0HbUbvxgby2Ctjh8oGiyIouzCzomMI=
Date: Fri, 31 Jul 2026 10:11:40 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] net: stmmac: enable MAC rx/tx after DMA start
To: Abid Ali <dev.taqnialabs@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260727-stmmac-rx-fifo-block-v2-1-4dc3457d31d0@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260727-stmmac-rx-fifo-block-v2-1-4dc3457d31d0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_191219_879524_A89ADD8D 
X-CRM114-Status: UNSURE (   9.77  )
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

On 2026/7/27 14:14, Abid Ali wrote:
> The EMAC should only accept packets after the DMAs are enabled.
This is correct.
> Similarly, the teardown should ensure the MAC rx/tx is stopped before
> DMA engine is stopped.

This is _not_ correct. Instead it's a bit more complicated, according to 
their programming guidelines:

Stopping and Restarting Transmission

- Disable the Transmit DMA (if applicable) by clearing Bit 0 (ST) of the 
`DMA_CH(#i)_Tx_Control` register.
- Wait until the Transmit DMA generates the stopped interrupt (TPS field 
of the `DMA_CH(#i)_Status` register).
- Wait for any previous frame transmissions to complete. You can check 
this by reading the appropriate fields of the `MTL_TxQ0_Debug` register 
(`TRCSTS != 1` and `TXQSTS = 0`).
- Disable the MAC transmitter and MAC receiver by clearing Bit 0 (RE) of 
the `MAC_Rx_Configuration` and Bit 0 (TE) of the `MAC_Tx_Configuration` 
register.
- Disable the Receive DMA (if applicable), after ensuring the data in 
the Rx FIFO is transferred to the system memory (by reading the 
appropriate fields of the `MTL_RxQ0_Debug` register; `PRXQ = 0` and 
`RXQSTS = 0`).
- Wait until the Receive DMA generates the stopped interrupt, which is 
available in the RPS field of the `DMA_CH(#i)_Status` register.
- Restart the DMAs.
- Enable the MAC Transmitter and Receiver.

So the correct order is: stop TX DMA -> stop MAC RX/TX -> stop RX DMA.

Best regards,

Qingfang


