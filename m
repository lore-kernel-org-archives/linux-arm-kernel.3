Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5221C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 17:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBHGQdqSeWvGB9mY6qlXaI9AwWyEpcoU+ydjWvyeZw8=; b=DwzfJUNIVz1ozJh5k/2G5jRZPy
	BMH1DyMLyBkFWiT8stApmVxMzLkgSwu8oeCMyCDkmt7UPJLhK++h4In7ynT3HhYK7TWW8FNK69lDy
	yxUkjotP5ZJqsRxr9zrT9o4vXCSZJMvV4gOOh6xtp0Cz07jRUn1J+1Ok9z4GMQfHZJkZ5sE2vhblC
	OY+nPra2Rf92XQzDBeia07YVPJsMbBXStpa3LimWEJqyURsHQJj9NLA9GMMaP7HqG8wNmyabxgPpI
	h/HZCOEFMTWICB+d1uzOiM4uu76LWkuxSQRq7nb0F+KzSWUGcqbXKULA5I7afPLtwQtkOWi23YMKi
	4s6NfA9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLQKu-000000047Jf-0IqR;
	Sat, 31 May 2025 17:49:36 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLQIl-000000047FN-32Un
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 17:47:25 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-74264d1832eso3318043b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 May 2025 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748713643; x=1749318443; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBHGQdqSeWvGB9mY6qlXaI9AwWyEpcoU+ydjWvyeZw8=;
        b=pgJLwvPElaUr5Zj8IKDC3SEqKCZaQEphhSMcbpHbKHHIlNXEnImVJsLvjgoecDcFgd
         IV+0+i5gn9kMVK0VmRwaKDei9SFJV8sgEGFD+xz2Met6hBUoOyFzbmYU8GTlW8A4iG9i
         c0M9snBZpI90T9Ef1xD6QbwkoIkWztx7PC2YMCbe40OQQp1DK6MCR6WQTFUC28KhZL7i
         rc3qJtSbE3k9GFP2DjuoKogYCnV5l5zg48Hm6NJh91QagptCDQJaul7Upl6XzJSnK/BA
         2KUsMe6OslkaYtD1P0UByU31U8gJhLb+dkVYrd76lUI+jslivQBIYCZ/sTCwmM/x6smL
         SvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748713643; x=1749318443;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YBHGQdqSeWvGB9mY6qlXaI9AwWyEpcoU+ydjWvyeZw8=;
        b=Hwd83aGKvnO7KJ9r4few2InUxfeBz1T12rS679TWv5et25mL4veUX5+oMXkdmXTGQt
         NJGmHA7MxVHmh/MTrjUiyUzaP5TnPPo5fFdsCsnr8MImHTeY/ubwurCWKYNlFi9hjvaz
         ACA6jEGmyQDA5VW+QgCeva6BVzRhoTm2WPSVB3+Kt4dOzoANy7KXODMM6Cg/7PABFGEL
         1GYzYQxiFjy7+Z7hb//cgEZTtL+Oi6wA4jrMee85CAznC3lDnsAjPQQhW5CGiLAZFQZO
         DJFxUqffNt8jw8s9bkl76lSIHaoeQb5PhdTA5mMUyLe4lqAwfN42ERPiB3Qp13dG+fSD
         K2Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXW/496L/Ntjldd9AOhbYHazaLhV8lqeSs9F6K4ptKiTnd5hIf82pFO3pjiYxnc1kTdJmGjnYNIo2CG0Q7bPU+Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzlZVr2ClqGq8AccpnXw3FqaiaER5SZJiC0/tDdcWW5wRKcBKpL
	Dm41BLS0yqlGbC7knPNoOEH254UBYS4U8gfoCpBwiSsXpHR34OF3N3RJGqdcHp1lxw==
X-Gm-Gg: ASbGncsZPNlA+zmqvlGkO290IN+lyshsx7QdTUa35xHNoO+1oZmpio10OzDX/1L7t9F
	qwhTCAbSGrECrkBC0T0q0MtOf9EbIwBNORm2j2n2i43dI5zPzfQcJtFdjUXaMoZiGYHJdYLLiPZ
	tx49XlO/Fx3BgWXCTZzdKmwlWhwcA5NK1SlKAIa7Dk35iTCLkmbPnm4mGpjuJJjmFbsBELExaTZ
	dHRLR98KmRnWsWAaHuPTeXD5fwxhxCZHxqLcGUAorDtW1Ll6UR0qq6Xq0ATNyVbo+I4dipFTn9R
	wxdhTBHT+Hss/tyJvJPW1VVEKQejqaMgJoMBb119L7NlFsIDF6PJIhgB3HzMgtiRJ3UzL/JMlAk
	HXCQdSzI=
X-Google-Smtp-Source: AGHT+IEQudPQU3BshE97L4wC1n51Mdqw3QLAzjvyvN2bu8Bm77uJvbC7suQxxrFON6iwO1js+sJc9Q==
X-Received: by 2002:a05:6a00:8d0:b0:73e:970:731 with SMTP id d2e1a72fcca58-747d1ab6968mr3580149b3a.16.1748713642662;
        Sat, 31 May 2025 10:47:22 -0700 (PDT)
Received: from thinkpad ([120.56.204.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf6ebsm5018495b3a.141.2025.05.31.10.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 10:47:19 -0700 (PDT)
Date: Sat, 31 May 2025 23:17:13 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, 
	Frank Li <frank.li@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kw@linux.com" <kw@linux.com>, 
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] PCI: dwc: Add quirk to fix hang issue in L2 poll
 of suspend
Message-ID: <tv67nul5owjqywhqmekb2cf5q2acyb3jpcfvz6k62jd6sxd5gv@izy7uomaakei>
References: <20250408065221.1941928-2-hongxing.zhu@nxp.com>
 <20250408145840.GA231894@bhelgaas>
 <AS8PR04MB86766063C3A9E969234779EB8CB42@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB86766063C3A9E969234779EB8CB42@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_104723_778422_38863141 
X-CRM114-Status: GOOD (  38.20  )
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

On Wed, Apr 09, 2025 at 02:31:22AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > Sent: 2025年4月8日 22:59
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: jingoohan1@gmail.com; Frank Li <frank.li@nxp.com>;
> > l.stach@pengutronix.de; lpieralisi@kernel.org; kw@linux.com;
> > manivannan.sadhasivam@linaro.org; robh@kernel.org;
> > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v1 1/4] PCI: dwc: Add quirk to fix hang issue in L2 poll of
> > suspend
> > 
> > On Tue, Apr 08, 2025 at 02:52:18PM +0800, Richard Zhu wrote:
> > > i.MX6QP PCIe is hang in L2 poll during suspend when one endpoint
> > > device is connected, for example the Intel e1000e network card.
> > >
> > > Refer to Figure5-1 Link Power Management State Flow Diagram of PCI
> > > Express Base Spec Rev6.0. L0 can be transferred to LDn directly.
> > 
> > Please include the section number.  Section numbers are easy to find
> > because they're in the spec PDF contents, but figures are not.  E.g., "PCIe
> > r6.0, sec 5.2, fig 5-1"
> > 
> Okay, would add them later.
> 
> > > It's harmless to let dw_pcie_suspend_noirq() proceed suspend after the
> > > PME_Turn_Off is sent out, whatever the ltssm state is in L2 or L3 on
> > > some PME_Turn_Off handshake broken platforms.
> > 
> > Maybe we don't need to poll for these LTSSM states on *any* platform, and
> > we could just remove the poll and timeout completely?
> > 
> Yes, I used to suggest remove the L2 poll and timeout in the following
>  discussion.
> https://lkml.org/lkml/2024/11/18/200
> Hi Krishna:
> Is it feasible to eliminate the L2 poll and timeout in this context?
> 

Spec r6.0, sec 5.2 mandates L2/L3 Ready state:

"L2/L3 Ready transition protocol support is required."

Also in many places, it suggests waiting for L2/L3 Ready state before powering
down the device. So I don't think we should just remove the poll for all
platforms.

> > If not, we need to explain why it is safe to skip the poll on some platforms.
> > "Skipping the poll avoids a hang" is not a sufficient explanation.
> > 

So the issue is that the device doesn't transition to L2/L3 Ready state and the
host platform just 'hangs'? Do we know why the hang happens?

> > s/ltssm/LTSSM/
> Okay.
> > 
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > > @@ -947,7 +947,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)  {
> > >  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> > >  	u32 val;
> > > -	int ret;
> > > +	int ret = 0;
> > >
> > >  	/*
> > >  	 * If L1SS is supported, then do not put the link into L2 as some @@
> > > -964,15 +964,17 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
> > >  			return ret;
> > >  	}
> > >
> > > -	ret = read_poll_timeout(dw_pcie_get_ltssm, val,
> > > -				val == DW_PCIE_LTSSM_L2_IDLE ||
> > > -				val <= DW_PCIE_LTSSM_DETECT_WAIT,
> > > -				PCIE_PME_TO_L2_TIMEOUT_US/10,
> > > -				PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> > > -	if (ret) {
> > > -		/* Only log message when LTSSM isn't in DETECT or POLL */
> > > -		dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n",
> > val);
> > > -		return ret;
> > > +	if (!dwc_check_quirk(pci, QUIRK_NOL2POLL_IN_PM)) {
> > > +		ret = read_poll_timeout(dw_pcie_get_ltssm, val,
> > > +					val == DW_PCIE_LTSSM_L2_IDLE ||
> > > +					val <= DW_PCIE_LTSSM_DETECT_WAIT,
> > > +					PCIE_PME_TO_L2_TIMEOUT_US/10,
> > > +					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> > > +		if (ret) {
> > > +			/* Only log message when LTSSM isn't in DETECT or POLL */
> > > +			dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM:
> > 0x%x\n", val);
> > > +			return ret;
> > > +		}
> > >  	}
> > >
> > >  	/*
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h
> > > b/drivers/pci/controller/dwc/pcie-designware.h
> > > index 56aafdbcdaca..05fe654d7761 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > @@ -282,6 +282,9 @@
> > >  /* Default eDMA LLP memory size */
> > >  #define DMA_LLP_MEM_SIZE		PAGE_SIZE
> > >
> > > +#define QUIRK_NOL2POLL_IN_PM		BIT(0)
> > > +#define dwc_check_quirk(pci, val)	(pci->quirk_flag & val)
> > 
> > Maybe just my personal preference, but I don't like things named "check"
> > because that just means "look at"; it doesn't give any hint about how to
> > interpret the result of looking at it.
> > 
> How about dwc_match_quirk(pci, val) (pci->quirk_flag & val)?
> 

Maybe just dwc_quirk()?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

