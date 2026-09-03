Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FABBC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsblEvBQ1teS31XosrNUPF2KwZplvL3VPUA9AIDMstw=; b=sN0LNldsZ8zr32bRW1f9+ZkxQb
	tXpSr2LCw7bi5LNDIaAj4IAqpb5a0+GvZXpQPBxxP6T397VdFfo3HowEOYesExmDzDXtTQdT12Je2
	XUsceR+H/cTnFp8ui5vmPbvaHYkLuhcrjbdLxEg1dpqTRmEoffHrJarnNIpE+ov8m4WS8fc0DJcaO
	A41PEGEV/8M01H1QBAOYlrSk0B71R2uX/ss1oLRiSWbap9m0VEIciHo+mg7cKTi7Vps55jRnXsp2X
	StEjyrfPN6C0upA7w+2/X5OSAqQd3QVLTG6ndjdNx/ayHuzZ1YLeBLSt2F4xVqJTWGoZbezw00E55
	WItNO7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26oL-0000000HLGB-2XdN;
	Thu, 03 Sep 2026 12:44:57 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26oJ-0000000HLF7-06gc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:44:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C7F434E414E5;
	Thu,  3 Sep 2026 12:44:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 83C27602B8;
	Thu,  3 Sep 2026 12:44:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1AD111C79654;
	Thu,  3 Sep 2026 14:44:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788439486; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JsblEvBQ1teS31XosrNUPF2KwZplvL3VPUA9AIDMstw=;
	b=W4NVJEgbFGjeDFu7RoTcpKjUbUAWeP1o+z8s0YMDe+2pydERf+Pkt49pYHtl/wq89nRVLE
	bQPKuPcxg/DsN3ODX+psM+Z5xkfbSAWSlGNxjxF8aQteGI/2Jb/qA07zQ6xZPUW4WiSfvr
	luuSWs+JNbXi+zMWU6fJaFtwhkQ/jRH8D0AJ2sQmY6n+BiN3IVktLB6RYPhxQIPRxE5gmq
	pEN5s5mpe6C7o+5vetEfSSf0az9z7aIDZsL2IGc2Y0r0rWp+v9DhCHQBUvvItdEM2mJ2kR
	Kft9SumbBXuzvf6laM/JMqxxth/P+J/slmmi+bxglw+CSnwmvJXaw3FTjUe1pQ==
Message-ID: <ed0618a6-b7c2-4ff4-b3d9-465f6b882cf7@bootlin.com>
Date: Thu, 3 Sep 2026 14:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: clear dma_conf on MTU change failure
To: ZhaoJinming <zhaojinming@uniontech.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Simon Horman <horms@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260903-fix-stmmac-mtu-change-use-after-free-v1-1-c81dc7d6d18a@uniontech.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260903-fix-stmmac-mtu-change-use-after-free-v1-1-c81dc7d6d18a@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_054455_211422_3AB7ED71 
X-CRM114-Status: UNSURE (   7.70  )
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

On 9/3/26 12:50, ZhaoJinming wrote:
> stmmac_change_mtu() releases the current DMA configuration and then
> reopens the interface with a freshly allocated dma_conf.  __stmmac_open()
> copies that dma_conf into priv->dma_conf via memcpy() before it can fail
> (e.g. in stmmac_request_irq()).  When it does fail, the error path frees
> the dma_conf descriptor resources and the struct itself, but priv->dma_conf
> still holds pointers to those freed resources.

Following that logic, it seems that the problem is rather that __stmmac_open()
should clear its priv->dma_conf in the error path. It would undo what was done,
leaving the state consistent.

Maxime


