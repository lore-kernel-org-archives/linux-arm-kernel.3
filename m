Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95B3E69185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 17:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/2iR2t92OCH9/EybMxXNXRhh30tebsZGZl/G3WtQ4A=; b=nITe9PhIqfjctlbAoUgGU3OivL
	aFhfMZHUyFv5LmkLz78+j+imusLD20wxSbstxLqs/yQdfNQ9XEon0B1ZbnlV2yw6mAXMmlAuORZab
	LoowMU+tc8liUUokIcxX9iB6ADPc8Yo2P1GvlShmvZU3wLyaOyxmmn9sdfZYKR7vaEvfjSyEPXlNW
	5Og6iQ9kHK4OypPNAeSjUz7koQYuyX2cEVZraMsadm2yRS3PcjwohZ3nGnfQ3rTb3ciR+vv1xDETI
	f81iyeqM9PqXwbJSfSRK5fyCdqSdhagV1SiqUztW7fzGlh2EhK089PxaT4f6rqT4qZuZwbgUvREsZ
	lW43aMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEX8w-00000002vOb-0tQo;
	Fri, 22 Nov 2024 17:08:30 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEX7z-00000002vBa-16N6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 17:07:32 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-720d5ada03cso2216749b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732295250; x=1732900050; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0/2iR2t92OCH9/EybMxXNXRhh30tebsZGZl/G3WtQ4A=;
        b=myFyNG19wDImP9Ub0f6Yc/2bFf0IuvuswXUhStyrtiQEOL23UP3Ki0ietXR+ev7d7r
         ccipqCwSwJfXbVah9tyjLDtVVnX3DTG2msNT5/WorF11Wd9wU2Vr2akrQwgtHCB3hRku
         ADRZXBH3FvFdpWWK6BYTjDE9In+E5qVrD+hTSoZoM3WxXipO5pDIJSus7wTVipmb3fiO
         A7/xruaqQ1beyatw+qsWwBUNpxv8YP1WGRhppMUPfyro8S8AcZss5OW1nGPGgcrZVYQ+
         N6kQrAb7H7QxuwcUBOq1jG/2jw/rzMjWZtwfmMYEs3Y5Z/Cm/RLJ8CkhBJJ76skdwPJW
         65Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732295250; x=1732900050;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/2iR2t92OCH9/EybMxXNXRhh30tebsZGZl/G3WtQ4A=;
        b=mN7g9NksIz6wsHNQAVV4LSVtCBt8HvOcsbrdk2XxqcXmnZYrGfj/J5vGGOMjsWV/tw
         uGSESoVLL9i1G6lDoEB8IplAJLUpRbTfyFsKiTWDb6SrO305k/1/5X5OyD021eZbfLqK
         2fD6kkWz6gTzxq69KZRFFf+bgUyUJCE+mg0nEPnvz1zXB4QQc0rzpTNoW7vMoHuaZq0b
         ewMthvMjEHwP15YX37ACgcMdlizID04Z0ADcOYp97sqzlKCQsYLCiKnRL+caTOANmg76
         +iLLc8S0iVmIIxBl0feAt0sRj8+Li/WKD+4UtHG0FZp1vAVFCsVIfd5fJRFQ2fTqddLS
         Jo8A==
X-Forwarded-Encrypted: i=1; AJvYcCVsvwdOnT1bpeYJSD1NbFrFQuV2Td4rlJOaGd4bJNPncckgpXCp39lAbJcFdb1gZ0ghO5cXqfJOWMl/Sjd+0LxK@lists.infradead.org
X-Gm-Message-State: AOJu0YzTluP3SGmLazBuJp+N8vIZFh15wYevom+2i8Ra3gfTkSf2KYdq
	Kx8sf/cXKDUCXi6PWE3GK1pIMT+Q9ggKSLFwNMpAx8AQa3e1BtLsXKWXSkjKhQ==
X-Gm-Gg: ASbGncunCauYsFLiyXnluI5NdUmdHk1pPNf/+vUqunXJWFx8UdiEkkcoaF/2mvnut2K
	gExBSrBBOGWCe3AFCGGhzl8U81gKZMBr/aw6zdDRrchfD4S74197w9PTIcqKExOYm/rwFB/YhPv
	t/ZQX0pYoxpEDCg4tsG4lPDo/iKkyEY0g6YNRDoJZQSEoQ0z/C4vd8cm10L1l+TcMYfj+nVPsW8
	IaJDUgy0/l+rBticivSBDIyV5Yb0ngg+Bm6reHag3zXchDFMi77KHN0AdNn
X-Google-Smtp-Source: AGHT+IGZvDpaoKhSksqbzMsm60Yp0W7DGNYEnn4YmD/coS4PDUIKaXASCZ3cNh00dMOu8rfdsP6n3g==
X-Received: by 2002:a17:902:d4c6:b0:20e:a2f7:8ab9 with SMTP id d9443c01a7336-2129f6ac33amr44650405ad.27.1732295250203;
        Fri, 22 Nov 2024 09:07:30 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba1b40sm18541705ad.87.2024.11.22.09.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 09:07:29 -0800 (PST)
Date: Fri, 22 Nov 2024 22:37:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 05/10] PCI: imx6: Make core reset assertion
 deassertion symmetric
Message-ID: <20241122170723.s43eokayvnuhas4r@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-6-hongxing.zhu@nxp.com>
 <20241115065221.scfb2chnoetpdzu6@thinkpad>
 <AS8PR04MB8676D25A87FBF45E2B1D26628C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676D25A87FBF45E2B1D26628C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_090731_306872_7BFAF8E0 
X-CRM114-Status: GOOD (  15.49  )
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

On Mon, Nov 18, 2024 at 02:59:59AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2024年11月15日 14:52
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: l.stach@pengutronix.de; bhelgaas@google.com; lpieralisi@kernel.org;
> > kw@linux.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > shawnguo@kernel.org; Frank Li <frank.li@nxp.com>;
> > s.hauer@pengutronix.de; festevam@gmail.com; imx@lists.linux.dev;
> > kernel@pengutronix.de; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v6 05/10] PCI: imx6: Make core reset assertion
> > deassertion symmetric
> > 
> > On Fri, Nov 01, 2024 at 03:06:05PM +0800, Richard Zhu wrote:
> > > Add apps_reset deassertion in the imx_pcie_deassert_core_reset(). Let
> > > it be symmetric with imx_pcie_assert_core_reset().
> > >
> > > In the commit first introduced apps_reset, apps_reset is asserted in
> > > imx6_pcie_assert_core_reset(), but it is de-asserted in another place,
> > > in
> > 
> > I'd suggest rewording like below to make it easy to understand,
> > 
> > "PCI: imx6: Deassert apps_reset in imx_pcie_assert_core_reset()
> I'm very appreciate for your rewords. Should the imx_pcie_assert_core_reset()
>  be imx_pcie_deassert_core_reset()?
> 

Yeah!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

