Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180D3CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 12:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gF83nl403Sdj/qjvhDOcwgB5YMUIigmWGAmJyoI5oFE=; b=cl7dkuHdGaNWhyluh6VOVn/zvT
	Ztqeiw6lpUo69EjQWeE8Tr2EoH6qMQd8/VwkmL0Deo01jplQq5r85z8zCoSRVN2oZbyXXQOdN/HKG
	nQG8WE6e2vhNyjUBIPKEsvm0YGm25bpW02m9UpJx8MXZmOr8rgEPhgvNZgPeK3hMHDF+VbiiZ24La
	Kci41gv74RpnQQXzZqUS8W+z7CqVER7wujsVuDYpvThjpCkL7pIY61AV0XfvdM6Y/iczJlOeH3+oJ
	VBG2QauBHiPYNpoQRb45XtQAA8RlUqTKDDvDP9Pgdf9uQSuVbSuUucxAIgFa+FJz6sXdFEw85uVjH
	oTcCVYjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGwi-00000009N8i-3Gbc;
	Fri, 24 Oct 2025 12:31:04 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCGwg-00000009N7n-0Vom
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 12:31:03 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vCGwe-0002Ya-Bf; Fri, 24 Oct 2025 14:31:00 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Dinh Nguyen <dinguyen@kernel.org>,  Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Matthew Gerlach
 <matthew.gerlach@altera.com>,  kernel@pengutronix.de,
  netdev@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-stm32@st-md-mailman.stormreply.com,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 01/10] net: stmmac: dwmac-socfpga: don't set has_gmac
In-Reply-To: <92e953b8-4581-4647-8173-6c7fa05a7895@bootlin.com> (Maxime
	Chevallier's message of "Fri, 24 Oct 2025 14:11:45 +0200")
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
	<20251024-v6-12-topic-socfpga-agilex5-v5-1-4c4a51159eeb@pengutronix.de>
	<92e953b8-4581-4647-8173-6c7fa05a7895@bootlin.com>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Fri, 24 Oct 2025 14:30:57 +0200
Message-ID: <87tszo7a7y.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_053102_164254_FA2BD145 
X-CRM114-Status: GOOD (  21.25  )
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


Hi Maxime,

On 2025-10-24 at 14:11 +02, Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Hi Steffen
> 
> On 24/10/2025 13:49, Steffen Trumtrar wrote:
> > Instead of setting the has_gmac or has_xgmac fields, let
> > stmmac_probe_config_dt()) fill these fields according to the more
> > generic compatibles.
> > 
> > Without setting the has_xgmac/has_gmac field correctly, even basic
> > functions will fail, because the register offsets are different.
> > 
> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> > index 354f01184e6cc..7ed125dcc73ea 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> > @@ -497,7 +497,6 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
> >  	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
> >  	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
> >  	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
> > -	plat_dat->has_gmac = true;
> 
> Note that this field is now gone as per :
> 
>   26ab9830beab ("net: stmmac: replace has_xxxx with core_type")
> 
> You'll need to rebase the series :)
>

I see, bad timing, but luckily an easy patch :)


Best regards,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

