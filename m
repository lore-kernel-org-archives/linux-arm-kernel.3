Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FFBD3A661
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJ+dC1+4ZiHEQDgeU3fYeNHYmT0utELbJCQ8uYRI6pg=; b=N9DteeTkDJmFJokYT/QHNNxBMA
	rNiTsjhAvGXtn0RZvOJTdWJgQfoblP5pNytPEM69W0bEPfhTHvKgE4PU/WI3jrk67rmCP89u4cjZO
	FhMW4l2s7mTbN7qmdyHciRU5dfyYu7/mcNPUv/tbVv07z29AoGcHONdVNE9nuezI2ZggnAHzX85Hl
	XuM1O5e6xWKn/dRJEYY2Q2QnMe9jaTtERLEXjkj+gumvgtb2pt6BI+xjoSE2XesuYYlkzFM3ITgap
	pWSnd3j0F+N1y6SR5JF+CVJsj6wvf+BZl3kS9xWlbKNROb1BRHCuBRRJXU9T6HYpjhlPpFMceXsVN
	P4UQIxBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nVK-0000000Elzk-3LCF;
	Tue, 29 Oct 2024 14:47:30 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nT5-0000000ElgJ-2Uue
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 14:45:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C8B31C0003;
	Tue, 29 Oct 2024 14:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730213109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fJ+dC1+4ZiHEQDgeU3fYeNHYmT0utELbJCQ8uYRI6pg=;
	b=iDH/SeYmV60b+LV3bzsR3t53id4bQ/Vw04kE/AfHvXUuPZY02OK6qS18rcqRh1aw7V7b8q
	LPkhLTlg0Toz050MWeyG6jGFg0x246Bj7eadjEf01JrkXzkQlmCmXPhWx7P/z/TzJOlF2R
	BZ/iFu7PoNC62kEp3xJWauHlhmj/cZX8C3MwoT8G0fJxHiGvQgra78MRZ9hBSLgouHSv3o
	NqVNkGnbHtVO5DHSOynyOKClVNLSzaZSvoXYy31oXv+PuNNglNZ0K/C49Gtd2qqCrMnOrm
	jbG5IR/0ZRCbSUbnxkpXzCfh8sjkZjOZ0fNEey+O2qgq/MEO9gy+ucGeJwVjCQ==
Message-ID: <a905c45d-344b-49e9-a0c9-fb7b6445edad@bootlin.com>
Date: Tue, 29 Oct 2024 15:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/7] Support external snapshots on dwmac1000
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Language: en-US
In-Reply-To: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_074512_024248_DCEA94C6 
X-CRM114-Status: GOOD (  14.32  )
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

Hello Maxime,

On 10/29/24 12:54, Maxime Chevallier wrote:
> Hi,
> 
> This series is another take on the pervious work [1] done by
> Alexis Lothoré, that fixes the support for external snapshots
> timestamping in GMAC3-based devices.
> 

[...]

> [1]: https://lore.kernel.org/netdev/20230616100409.164583-1-alexis.lothore@bootlin.com/
> 
> Thanks Alexis for laying the groundwork for this,
> 
> Best regards,
> 
> Maxime

Thanks for making this topic move forward. I suspect the series to be missing
some bits: in the initial series you mention in [1], I also reworked
stmmac_hwtstamp_set in stmmac_main.c, which is also currently assuming a GMAC4
layout ([2]). I suspect that in your series current state, any new call to
stmmac_hwtstamp_set will overwrite any previously configured hardware timestamping.

[2]
https://lore.kernel.org/netdev/20230616100409.164583-8-alexis.lothore@bootlin.com/
> 
> Maxime Chevallier (7):
>   net: stmmac: Don't modify the global ptp ops directly
>   net: stmmac: Use per-hw ptp clock ops
>   net: stmmac: Only update the auto-discovered PTP clock features
>   net: stmmac: Introduce dwmac1000 ptp_clock_info and operations
>   net: stmmac: Introduce dwmac1000 timestamping operations
>   net: stmmac: Enable timestamping interrupt on dwmac1000
>   net: stmmac: Don't include dwmac4 definitions in stmmac_ptp
> 
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  4 +
>  .../net/ethernet/stmicro/stmmac/dwmac1000.h   | 15 +++-
>  .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 85 +++++++++++++++++++
>  drivers/net/ethernet/stmicro/stmmac/hwif.c    | 14 ++-
>  .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 11 +++
>  .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 38 +++++++--
>  .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  | 10 +++
>  7 files changed, 165 insertions(+), 12 deletions(-)
> 


-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

