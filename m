Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650FECF6C00
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYeONbMPZsohq9VBaUL+fOZtixRXDsqHxHYEMCv0KqU=; b=Twp53zcUDxH8xoSu38xTBrogY9
	iiRVYMvIE6djVs9nA66+zJqTyQjBv+X2lu+tHIbUTUWEdUhwBeumxQv66vhQgs96KTr1gPS1kl9lB
	z67K6UQenxb5rehqTrUDcYY2oyrO1Yl4csBeXxPmnQrT02DNiN988G4kN7pPgdLDjAXQzenfrDkO4
	wbhiier8OiwPAzVJyCYzvxFBxFwuAxbI40nuIO5pGZ5LDdtZkL3p9z8ecx6sRwc+Ki2kf0RTT/XMx
	8btz0MF70Msq9aTTMew2+MSEsRJRlHNdmZ/XdV1ll6rtFKorfBc40OKTpgTRVh7nKS7b3314J/qCt
	a8DErkdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdP4P-0000000ERCF-1nT0;
	Wed, 07 Jan 2026 08:39:09 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdP4L-0000000ERAq-1vR0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 08:39:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D330E4E41FCB;
	Wed,  7 Jan 2026 08:39:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 912BD606F8;
	Wed,  7 Jan 2026 08:39:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED8FA103C86DC;
	Wed,  7 Jan 2026 09:38:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767775140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=QYeONbMPZsohq9VBaUL+fOZtixRXDsqHxHYEMCv0KqU=;
	b=U7RPDc9lUGFV9EfgCe5xJCH8kkFydm4o1dDmMUTz43CE7s8pO7CHQE+V7r767Zl7uFlXz+
	KXD2ZNLnCwFvJmzT+jW2MwHFSRJtrahjDtN0lA95Sg+NTbL4HlEkF9dtRm2Im0Z+a8WhbA
	zbmaJygHIMjwWrCxES+2G8gNwDKprMMZ00mzfrSBryxc8kb3VVEGPUDg1qwvgNnTL+lBAy
	Jp0t7HHqP4LLtUGFYpA2RghAhSw8u4uYUXwBTGRZavw8ejwRI0MUTWu8pCsiwossi5ppUf
	HEXW8J5vZhaTsExGvaoCuqppPPP+j7vqFa7nb2bAACYM9WwBTge5SFh6Lx6wPQ==
Message-ID: <e439e649-ca9a-4245-80bf-9f1749c5af3e@bootlin.com>
Date: Wed, 7 Jan 2026 09:38:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/9] net: stmmac: dwmac4: fix RX FIFO fill
 statistics
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aV1w9yxPwL990yZJ@shell.armlinux.org.uk>
 <E1vdDi5-00000002E1P-24pm@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <E1vdDi5-00000002E1P-24pm@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_003905_636858_36CB4FD3 
X-CRM114-Status: GOOD (  10.18  )
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



On 06/01/2026 21:31, Russell King (Oracle) wrote:
> In dwmac4_debug(), the wrong shift is used with the RXFSTS mask:
> 
>  #define MTL_DEBUG_RXFSTS_MASK          GENMASK(5, 4)
>  #define MTL_DEBUG_RXFSTS_SHIFT         4
>  #define MTL_DEBUG_RRCSTS_SHIFT         1
> 
>                        u32 rxfsts = (value & MTL_DEBUG_RXFSTS_MASK)
>                                     >> MTL_DEBUG_RRCSTS_SHIFT;
> 
> where rxfsts is tested against small integers 1 .. 3. This results in
> the tests always failing, causing the "mtl_rx_fifo__fill_level_empty"
> statistic counter to always be incremented no matter what the fill
> level actually is.
> 
> Fix this by using FIELD_GET() and remove the unnecessary
> MTL_DEBUG_RXFSTS_SHIFT definition as FIELD_GET() will shift according
> to the least siginificant set bit in the supplied field mask.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


