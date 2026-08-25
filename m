Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2651C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obQKP09CHzI3oI6cWTnZgbb3Pr3kwiToCNqXpKlHYrs=; b=L/fLQ7o+8+3E9x1DAMqrmeAjZK
	dmlrszNjrvdErX+mk9JtEKwf4LoHCmMauJEM2BDhNIm4xA0R6XbzpIMqZPeP7RgRCdkBwTp/S6DHt
	9UwcEJmvDLzhRYqwMDHGC6F51O1ErkznRajs/DBE+hN+2/HDDCQe3glBF/c47LlwyFvJsr7pyOH9V
	t2xvQgarTX1Nx5JzSDiFZo0BQ08xWI6Sg/LP5FUk7VUeSB2q/SVgWUIYy1UCEweI//cEJNSNd83jE
	y+rXIju6zkL98R0G9HwVZB1YdqKmJN2q4j57KX0FOUAwb+G+NCP8w24tC6WkIx2p6w/lMr4jmAwtd
	jCtiySKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrFG-00000000rss-0bG2;
	Tue, 25 Aug 2026 13:31:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrFD-00000000rru-24CP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 13:31:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 425544E412E4;
	Tue, 25 Aug 2026 13:31:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 14058604C4;
	Tue, 25 Aug 2026 13:31:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3BFA11C792B6;
	Tue, 25 Aug 2026 15:30:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787664667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=obQKP09CHzI3oI6cWTnZgbb3Pr3kwiToCNqXpKlHYrs=;
	b=lU4e9zl7GduiDG6itsz7WGWMhIR9hmzqzkwulLrSONC1ikgrt/goD+8xEa+yY7ae1XnoUx
	O3wZVfUnQD89chgOEtgsuL4hXTagSWGF82EBqNHwqVByvMtJV3JA9LVmRyuN60VTuder2P
	mQwOlbn4+2d1YgKLM+uSKSUjYDmxjqD0YWr/TTysnG9oaZWSTEJe4+SMEVXtfOcdPmyph7
	367rVe/8RjNzr0FXKyvrDR3zGNF3yWvQM4PGa45dCBZDxr1qmTNxtBa7+gg3uaiYktT2yw
	iyYbvv8T8PgkABKItpZaiagsWjuVAlNWgLCoCvPJBmNPwX65ip0ikXZyws6eyA==
Message-ID: <324e6485-633c-4a2a-ba62-661f75dd6c31@bootlin.com>
Date: Tue, 25 Aug 2026 15:30:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: re-apply taprio offload in
 __stmmac_open()
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>
References: <20260825-stmmac-est-reapply-after-open-v1-1-dfa80735e0a1@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260825-stmmac-est-reapply-after-open-v1-1-dfa80735e0a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_063115_672333_0677E928 
X-CRM114-Status: GOOD (  11.75  )
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

Hello Lorenzo,

On 8/25/26 11:24, Lorenzo Bianconi wrote:
> The core soft reset issued in stmmac_init_dma_engine() clears the
> MTL_EST registers, but nothing re-applies the taprio offload after it:
> priv->est->enable stays true while the hardware EST block is left
> disabled. The TX/XDP paths then keep dropping frames larger than
> priv->est->max_sdu[] and taprio is reported as offloaded, although the
> EST block is not programmed.
> 
> Re-apply the taprio offload in __stmmac_open() after PTP is up. The
> base time is recomputed from the reserved base time and the current PTP
> time, since the timestamp counter has been re-initialized and the
> previously programmed base time is stale.

I agree with idea, but the way I see that, this new reconfigure method shares
some code with stmmac_tc.c's tc_taprio_configure() step (the base time computation).

Can you also take a pass on that, so that we have a single helper (your new
stmmac_est_reconfigure) that does the base time computation and the EST setup, that
would be used in the .ndo_open, clock adjust and tc_taprio configuration ?

Maybe rename it stmmac_setup_est() to keep consistency with the stmmac_setup_ptp()
that comes before, this would also open the door for an equivalent
stmmac_cleanup_est() if we ever need it.

Maxime


