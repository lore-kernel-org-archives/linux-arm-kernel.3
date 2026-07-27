Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925FEC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 08:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zh+8qUVvssq+SHvztM6nQdaXig7PmSRyTTTYa9BlJ3k=; b=JCXANA3kX7cu9t092NOlYWr4MH
	CVfJPLFT4W3XD9uNdUr91F0yyqbTAGaIwRtbk3UQ9CGlDQM9kaYfL+qTw4b9KnMpmAzpstCBd2Jno
	+IyPFS+SVNOEcDGNwjYATM4j4JaLZvxtV6KOUI6Bp/hedItjq27IP7mLyH0A0q1Z3RM9fU4LMUB7z
	Co/ox4GnbdVCOzY84aDBgLBP7HLwB3C7l0RssH7F0L5XuRTQ9kVsb/Lfn8sT/m32GtG9t5UpDTB7F
	uJb+x2uQrskDo0triLy3Tg1ia0UluRe99eRhyIuxhU9/rXqv8oNRD4+unZoRT+6eyAkmwx9wGBgJP
	QGpeLpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGcR-00000002ECp-0nDT;
	Mon, 27 Jul 2026 08:23:27 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGcO-00000002ECK-2sMd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 08:23:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DFB861A1283;
	Mon, 27 Jul 2026 08:23:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD451601BE;
	Mon, 27 Jul 2026 08:23:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7270C11C12267;
	Mon, 27 Jul 2026 10:23:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785140597; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Zh+8qUVvssq+SHvztM6nQdaXig7PmSRyTTTYa9BlJ3k=;
	b=z4kt1OtdzIogUuPvXpecO3/rTeEdmMbydEJ5UAuHTPl3MQN7vgRaL8fJc3vHXkIpnuvG4x
	ZBAJ1b04LqhBSeidb4JFshxSOt2eLQtWcLbAwe4dDu7euv6mGvE3B64byob6omsA+EQg9y
	ee0X8oSoCsDB9SiHBi+vRlXC25SuYzcDor47Cbav/dioWLIlBxKCOdBiOvan0R84b67O8V
	ZAwFoAJ/bli0oSPBGTJtt7kQagIEj4gR3wKEx0fIArVnMQmhA9AHswDEA/2GRfiA6wtC+d
	lpKZK3h4RAZEKiII/uYuYr1BuduLQaUcYm6RqOxciCVIW4Diu1+/DlVlY/cueQ==
Message-ID: <8e9563ce-e103-4fda-80e7-5dffaca2a03a@bootlin.com>
Date: Mon, 27 Jul 2026 10:23:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: stmmac: enable MAC rx/tx after DMA start
To: Abid Ali <dev.taqnialabs@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260727-stmmac-rx-fifo-block-v2-1-4dc3457d31d0@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260727-stmmac-rx-fifo-block-v2-1-4dc3457d31d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_012324_892794_714EB773 
X-CRM114-Status: GOOD (  10.81  )
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

On 7/27/26 08:14, Abid Ali wrote:
> When the MAC receiver is enabled before the DMA channels are started,
> incoming frames fill the MTL FIFO with no DMA engine to drain it.
> If the PHY/Switch is already up at this point, and there is inflow
> of packets towards EMAC, the per-queue FIFO overflows within this window.
> 
> Once the FIFO is full, the MTL read controller goes idle and never
> retries delivery even if the DMA comes alive later on.
> This behaviour happens due to enabling the MAC RX path before
> the DMA setup is ready, and any delay between these events increases
> the chances of blocking the rx path permanently.
> 
> The EMAC should only accept packets after the DMAs are enabled.
> Similarly, the teardown should ensure the MAC rx/tx is stopped before
> DMA engine is stopped.
> 
> Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>

Ah great ! This matches the programming model for the few ref manuals I
have, e.g. cycloneV manual does state that the MAC must be enabled after the
DMA has been configured.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


