Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E616CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYOfZuoNHQ6zfb1eIHdQ/g7m/nIgJIBArSgWVNXdu3o=; b=EyieSrBQECUxu/uN5Yq2S2FZ4F
	MlsV8yv5cJopRdUraZbWnDYizMUOImXbFDV5kkL73YtZGfo+25wGfk5hwZ5wpL6GcXiqxVjHFCsyL
	FLRdYDa6uNyGJD3V3n0hFZOiKwyO4CHkjQCjfONmaC1G1ZTXg96U0Ik+GzhjO7ZfYSSDhpPyosygy
	YwqxFc2mjoefQ68oqd4q1J3guWF1c3RBEh7kXEBitRCX1Zyz7zUNU+iin8QNk2FL6oe/YTc/YfVc2
	OJWGTFv3wPZhW6JnPGD2EsSxFXJ95WLJnq04K4M3xds5pSnqE2MAzL0u0nLG74X+r9Lo2HIh80oLb
	jLGWal8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAngS-0000000CzNL-03C1;
	Mon, 20 Oct 2025 11:04:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAngO-0000000CzLY-37WW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:04:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47109187c32so19793565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760958247; x=1761563047; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FYOfZuoNHQ6zfb1eIHdQ/g7m/nIgJIBArSgWVNXdu3o=;
        b=ZcfNGx+TYhEvTtKbT91QNg+KEE5wnlmrZ0cYDFujRFbOsTodZxX0J7TtWoqG8sAaxx
         tZzpiFCB5dGWR+8L9zSUuFM1QSdv3XqEJvqJBqZo7kIIQsCVw3Yd91dLJ17u1neYQdg/
         pqdbs6EiQqlu9JS5ppXvULBDh7j4XqveO5vbgKj5mEgGC61LJVdVQWXbhxGWGpYo+GSB
         FFGEOmYKAD/GAa22GwCFOKHKOKbBn0qzaQASsJKKVQHoiNr2jTDtuR/tKY56cmBPwtMh
         t+/DQTLn2jsgv/FfyzGMwMJCesJ1FGEA70HcVgfJFVPXZc0VOmUnmmE5JMxpJB0zahqB
         KFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958247; x=1761563047;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYOfZuoNHQ6zfb1eIHdQ/g7m/nIgJIBArSgWVNXdu3o=;
        b=TBF6FsvgWsRPc+8clZPR/UnYKlljH0F6QYFBk5VkFm+KUJXvrLWdTHWCTDQ8sFkC89
         HLhy30QUxkMbqOrUX1kt7+qJ75Z5umeXxUSQq9tcMzivor7ULhRbkfVVpt3vGraym17D
         8JcDi0tMjc3oHTpBILb6tjnXrJQmKF+Qy91nziv+2jsfiVCQ63y4n12SkgwaU2YyryxZ
         vwujKDZwe2chUQ6fkBJ/UGj3D7ZTOhBNpKmysUqmEihascl1Q8Bow2IFh28FgRHAgsf+
         HkNPzdbActaB74GxEP73X5vNnTnze26h98+yaTMIGsyC8VbrJzrGzb82FnBPfSkFluNo
         OUXA==
X-Forwarded-Encrypted: i=1; AJvYcCVdqr3w5qGQ6eMbAKlbUesxTV6Wdo+er41uEZl9BQAqSx853s38ttbiOuv7WnJCCy6u5N+Ah4CNud4VYGefPFth@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Bh2BqONgT2lHQf8gMMShJ44KrTxRVRi9Li7OrRf6mfROBz6K
	HAmxa+Q6DD0yi1/f0R6sh35gIGJEUO8s/BN2hyPglxLvlzx6KiQYRJmK
X-Gm-Gg: ASbGnctgrnBVah2yKJYt7IcuNLgW7VzS9GG2OBRF8O19OC0WVdBiE1ecDmRd2yQbEAW
	qrBbMmQxyNdTPJ1ms+R08XfIQuhbvqZffAndekXktVS0UHsD0gr1arddJQKRddFgYmiU1ON8Re8
	FDh2wiFr5mZYTaEE+Qsz2Y0/5CdueysqGrzGKcWQ/EIeMyNdX6tP9R/vUl0XWL/SthCgUZbmejM
	f3ZHFvd3cEWVUn4uXFSyRVqIEQTK47maeBfdY1D7d7H37WRX55cwq6h3EljUQpHrT0zywqK9Vrc
	ripqPQ7KeYx7qZN39XtIZmp+c0C8E28b4wTgbVaKhCXCpYasUwHie2jyvL2LCBBCO2BatJ/+72S
	CC5K9wjbAFjycoCKjBMDbgzKy3gQ4Ep11LipB2gqx6SxPbbgnL6/eHuZdUkjuJwYsiZUM1DIKdV
	b6nB2114kurAdgxA0cyw51wSLUOIDLOkoS3uPx/rmerA==
X-Google-Smtp-Source: AGHT+IGgJEIPMXEXNKI395DmJYirOVPGUv9eBwNI0mKNkT1iDHPejiG58osCYccM9drAAu3VR8kn5A==
X-Received: by 2002:a05:600c:34d5:b0:46f:b42e:e394 with SMTP id 5b1f17b1804b1-4711793473fmr92013195e9.41.1760958246642;
        Mon, 20 Oct 2025 04:04:06 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715520dd65sm137840795e9.15.2025.10.20.04.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:04:05 -0700 (PDT)
Message-ID: <68f61725.050a0220.343129.f1f0@mx.google.com>
X-Google-Original-Message-ID: <aPYXHZQYtY_jcRhd@Ansuel-XPS.>
Date: Mon, 20 Oct 2025 13:03:57 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v5 5/5] PCI: mediatek: add support for Airoha AN7583 SoC
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
 <20251012205900.5948-6-ansuelsmth@gmail.com>
 <hjyhso2sqgyq4ymzqg6pmjfrfncla24zwsev2mfinolmclm3ih@sol2yoapbykq>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hjyhso2sqgyq4ymzqg6pmjfrfncla24zwsev2mfinolmclm3ih@sol2yoapbykq>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_040408_807579_5FBA80B4 
X-CRM114-Status: GOOD (  35.08  )
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

On Sun, Oct 19, 2025 at 01:01:44PM +0530, Manivannan Sadhasivam wrote:
> On Sun, Oct 12, 2025 at 10:56:59PM +0200, Christian Marangi wrote:
> > Add support for the second PCIe Root Complex present on Airoha AN7583
> > SoC.
> > 
> > This is based on the Mediatek Gen1/2 PCIe driver and similar to Gen3
> > also require workaround for the reset signals.
> > 
> > Introduce a new flag to skip having to reset signals and also introduce
> > some additional logic to configure the PBUS registers required for
> > Airoha SoC.
> > 
> > While at it, also add additional info on the PERST# Signal delay
> > comments and use dedicated macro.
> > 
> 
> This belongs to a separate patch which should come before this one.
> 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek.c | 92 ++++++++++++++++++++------
> >  1 file changed, 70 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > index 1678461e56d3..3340c005da4b 100644
> > --- a/drivers/pci/controller/pcie-mediatek.c
> > +++ b/drivers/pci/controller/pcie-mediatek.c
> > @@ -148,6 +148,7 @@ enum mtk_pcie_flags {
> >  	NO_MSI = BIT(2), /* Bridge has no MSI support, and relies on an
> >  			  * external block
> >  			  */
> > +	SKIP_PCIE_RSTB	= BIT(3), /* Skip calling RSTB bits on PCIe probe */
> >  };
> >  
> >  /**
> > @@ -684,28 +685,32 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
> >  		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
> >  	}
> >  
> > -	/* Assert all reset signals */
> > -	writel(0, port->base + PCIE_RST_CTRL);
> > -
> > -	/*
> > -	 * Enable PCIe link down reset, if link status changed from link up to
> > -	 * link down, this will reset MAC control registers and configuration
> > -	 * space.
> > -	 */
> > -	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
> > -
> > -	/*
> > -	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
> > -	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> > -	 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
> > -	 */
> > -	msleep(100);
> > -
> > -	/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
> > -	val = readl(port->base + PCIE_RST_CTRL);
> > -	val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> > -	       PCIE_MAC_SRSTB | PCIE_CRSTB;
> > -	writel(val, port->base + PCIE_RST_CTRL);
> > +	if (!(soc->flags & SKIP_PCIE_RSTB)) {
> > +		/* Assert all reset signals */
> > +		writel(0, port->base + PCIE_RST_CTRL);
> > +
> > +		/*
> > +		 * Enable PCIe link down reset, if link status changed from
> > +		 * link up to link down, this will reset MAC control registers
> > +		 * and configuration space.
> > +		 */
> > +		writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
> > +
> > +		/*
> > +		 * Described in PCIe CEM specification revision 3.0 sections
> > +		 * 2.2 (PERST# Signal) and 2.2.1 (Initial Power-Up (G3 to S0)).
> > +		 *
> > +		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
> > +		 * for the power and clock to become stable.
> 
> You can drop the comments since PCIE_T_PVPERL_MS definition has them.
> 
> > +		 */
> > +		msleep(PCIE_T_PVPERL_MS);
> > +
> > +		/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
> > +		val = readl(port->base + PCIE_RST_CTRL);
> > +		val |= PCIE_PHY_RSTB | PCIE_PERSTB | PCIE_PIPE_SRSTB |
> > +		       PCIE_MAC_SRSTB | PCIE_CRSTB;
> > +		writel(val, port->base + PCIE_RST_CTRL);
> 
> If PCIE_LINKDOWN_RST_EN corresponds to PERST# signal, then it should be
> deasserted only after the power and REFCLK are stable. But I'm not sure what the
> above PCIE_RST_CTRL setting is doing. If it somehow affects either power or
> REFCLK, then it should come before PCIE_LINKDOWN_RST_EN.
>

Hi I checked MT7622 programming guide for this.

The order of operation for reset is exactly what you have described.

Indded, first everything is reset (assert all signals) then we set
PCIE_LINKDOWN_RST_EN that in unrelated. We wait for clock stabilization
with the msleep and only AFTER we deassert the PCIE_PERSTB.

So no, PCIE_LINKDOWN_RST_EN is not PERST# signal sw but it's actually
PCIE_PERSTB.

> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
	Ansuel

