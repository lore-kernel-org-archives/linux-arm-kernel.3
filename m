Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2F3C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJxSIAZXO2C4Zhd9fy6/iiyMv7oQ8uqx9BwDDb/UO4o=; b=kXnIbp6JGDJDrYp/A3vjU9ht02
	wM8BGbQxfV5wAs0Q2S1ApjI9YGak2xxI8gp4jLbu8Hv3uf0bX5bClkIoBjcirxpFdpK1LZmvjUJ1p
	jWVByixVFAbSWor3j2l+3JKyfrI/KyoyDdf+x4ymRV0xW1+45ye0Fgw+q+cgFrZjALVyn2Qj0IIPf
	IHkxl6oY1IFDbKXgZC1LKt9KJ+X1tVFg76WxwCoQWbvNeLeEbFh9NGcbsR6S9apVQ048KAetossX7
	kML5Wr/ZavZs24m3k7FLVPWRejbPI01UvT+txiRXYr5UIsaoIIPzrjBdCe2onTPv6S29yYwF/IJ5w
	9mCPrrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3zRx-0000000HKxx-2QEL;
	Sun, 13 Apr 2025 15:40:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3zQ5-0000000HKrQ-1vAS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 15:38:54 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2243803b776so49989995ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 08:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744558732; x=1745163532; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wJxSIAZXO2C4Zhd9fy6/iiyMv7oQ8uqx9BwDDb/UO4o=;
        b=zYKDUHRMc6LY2nEgsbhA5zekz2Wxlo/zpzrrpF9Wv78IJnmvKUY8+Ntu6COOOXGSZP
         Ca6kOA+7ajdukMSMQoL5IY0Hw36y1g7LhXo2AzS7CHbe6lBB2oO1I3mzMqzW4hWtdOBl
         9knElPsZLEX2laVx34hBDdOZh0F7uzzj+sOoHxy5S0tjgrxHug10O7zjBxCDAbP9Qu8z
         cCdHvmcXgAWojfZMQuNenbN94eYRe3kME0e16VNM9j1Krsbth31AauRyI453qz45lAVx
         ZV6LVNbw2Ll83eL3S6ezXSytQllv5MCZKQ+cHTgUWp4gUqghl7V+LgYXOzvPAHJ+rm2C
         NFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744558732; x=1745163532;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wJxSIAZXO2C4Zhd9fy6/iiyMv7oQ8uqx9BwDDb/UO4o=;
        b=pmzJ8ZS0HH5oDF6lZFXwpEsfh4yMuJUvjUUey/sy+2BUVzFQTNeNTitgnVveMdPPWt
         MlKtfzbnmytGKuA/kk2MPuydge79J+ZGmiH8XBxmUBMl0d9/GZS+egZNW4Zd0RZxR757
         4qf+iq++lfytxt5yzD18cRn9jawCJ5B+J3mAlTikNWEP0NOcoFkhuMMry41aj6qYEjeF
         PzWtpwkz9sTPZO0zgOpC33dgzjolhrUkv7nyjclWmKfIh+wubZM7Xzj/rlBlHly2QE1t
         HKsimu/X+FGm1xCgdd9HL3mPNZVFCNef7AnH15lRrn4+XKD/4rs3HZAuJeAxx9fH+G92
         rTcw==
X-Forwarded-Encrypted: i=1; AJvYcCWknjurEcmlZMrymxTzPq8ETftiV9OWZ1BRGfPKoOAZXVreyzKm/fTDjVTRI1dv3DefOLUZsea/jRFRx301pZzD@lists.infradead.org
X-Gm-Message-State: AOJu0YxBVR2IpajQPtNKVkYvamGS6ohKrrp8XVIggK4YA6hsW1zuUHMX
	9a5E3+wMMTxEqY5hoLP64fz78jIS9BrYuzCefgXFimZ7LCd7BjbJeLYJK78sXw==
X-Gm-Gg: ASbGnctjkqjh1hVfNIWtsTZKhfz0R33kEM4/iHRT1o0wWm+hdzi8conoWGsgRiVqmyZ
	v5lXyYp3UKBVTvztXhO9Dk4eD6Hj91/Ci4u3HXp3fGkC582SEyvhjNYjW5zVe0fi7uCiBu4tcFh
	JsaeLYYtFxQZBVDR3jrKyWBn8pCrGP9Lgj9YP4Pk3kUYC4Up2DhCU8ldnF5/oR/1IcdFtvouS/U
	a9qkzVrVbSD9qpHTpm4cW07ZSZQs+/ld+4xwjYVsPxoqjxsLTBkr9ptscapuF7goQsp8LvNX/NH
	B1p/C7YOWa6S2O+g21DV+GweipBbOIqgW5DmRc+tDlTpKbqaZeKv
X-Google-Smtp-Source: AGHT+IF144jyIPz4NUFnuSSDcuxFolD9nML5zcTpAccGjMR/wBPaVGXigppgwKhzhmzy2ywG7rsfww==
X-Received: by 2002:a17:903:1905:b0:223:65a9:ab86 with SMTP id d9443c01a7336-22bea4aab88mr160177565ad.12.1744558732319;
        Sun, 13 Apr 2025 08:38:52 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df09071fsm9507767a91.25.2025.04.13.08.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 08:38:51 -0700 (PDT)
Date: Sun, 13 Apr 2025 21:08:45 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not exit
 L23 ready
Message-ID: <h7pja24zffl4t7653rjaamp6v2j5nmukbzq7rdajynemlyb6l6@3e37ggkparjg>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-4-hongxing.zhu@nxp.com>
 <ovaomfvo7b3uxoss3tzhrkgdy6cvxi4kr2zxmqsfjxds5qfohl@t6kc4rswq6gp>
 <AS8PR04MB8676687332C78840B927E7568CAF2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <rqgl5jjauppyudgmugp34fillkeli3qkwf4uf2djghi6nslebg@pyi6rbwyduxd>
 <AS8PR04MB8676BB3EDFCF3E5A490AC0628CAE2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <AS8PR04MB8676C5D0DB84975D34C4C65A8CB52@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <4qrfkx3ckywcbk7qbjplal5j7v6sjs3zebeehe5dnrgjz2ej2t@krdwjb4xm2sx>
 <AS8PR04MB8676221C998474EF5A9B94288CB72@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676221C998474EF5A9B94288CB72@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_083853_514682_9283A0E2 
X-CRM114-Status: GOOD (  35.81  )
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

On Thu, Apr 10, 2025 at 02:45:51AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2025年4月10日 0:44
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de; lpieralisi@kernel.org;
> > kw@linux.com; robh@kernel.org; bhelgaas@google.com;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not exit L23
> > ready
> > 
> > On Tue, Apr 08, 2025 at 03:02:42AM +0000, Hongxing Zhu wrote:
> > > > -----Original Message-----
> > > > From: Hongxing Zhu
> > > > Sent: 2025年4月3日 11:23
> > > > To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > > > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > > > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > > > kernel@pengutronix.de; festevam@gmail.com;
> > > > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > > > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > > > Subject: RE: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may
> > > > not exit
> > > > L23 ready
> > > >
> > > > > -----Original Message-----
> > > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > Sent: 2025年4月2日 23:18
> > > > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > > > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > > > > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > > > > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > > > > kernel@pengutronix.de; festevam@gmail.com;
> > > > > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > > > > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > > > > Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may
> > > > > not exit L23 ready
> > > > >
> > > > > On Wed, Apr 02, 2025 at 07:59:26AM +0000, Hongxing Zhu wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > > Sent: 2025年4月2日 15:08
> > > > > > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > > > > > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > > > > > > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > > > > > > bhelgaas@google.com; shawnguo@kernel.org;
> > > > > > > s.hauer@pengutronix.de; kernel@pengutronix.de;
> > > > > > > festevam@gmail.com; linux-pci@vger.kernel.org;
> > > > > > > linux-arm-kernel@lists.infradead.org;
> > > > > > > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > > > > > > Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe
> > > > > > > may not exit L23 ready
> > > > > > >
> > > > > > > On Fri, Mar 28, 2025 at 11:02:10AM +0800, Richard Zhu wrote:
> > > > > > > > ERR051624: The Controller Without Vaux Cannot Exit L23 Ready
> > > > > > > > Through Beacon or PERST# De-assertion
> > > > > > >
> > > > > > > Is it possible to share the link to the erratum?
> > > > > > >
> > > > > > Sorry, the erratum document isn't ready to be published yet.
> > > > > > > >
> > > > > > > > When the auxiliary power is not available, the controller
> > > > > > > > cannot exit from
> > > > > > > > L23 Ready with beacon or PERST# de-assertion when main power
> > > > > > > > is not removed.
> > > > > > > >
> > > > > > >
> > > > > > > I don't understand how the presence of Vaux affects the controller.
> > > > > > > Same goes for PERST# deassertion. How does that relate to
> > > > > > > Vaux? Is this erratum for a specific endpoint behavior?
> > > > > > IMHO I don't know the exact details of the power supplies in this IP
> > design.
> > > > > > Refer to my guess , maybe the beacon detect or wake-up logic in
> > > > > > designs is  relied on the status of SYS_AUX_PWR_DET signals in this
> > case.
> > > > >
> > > > > Can you please try to get more details? I couldn't understand the errata.
> > > > >
> > > > Sure. Will contact designer and try to get more details.
> > > Hi Mani:
> > > Get some information from designs, the internal design logic is relied
> > > on the  status of SYS_AUX_PWR_DET signal to handle the low power stuff.
> > > So, the SYS_AUX_PWR_DET is required to be 1b'1 in the SW workaround.
> > >
> > 
> > Ok. So due to the errata, when the link enters L23 Ready state, it cannot
> > transition to L3 when Vaux is not available. And the workaround requires setting
> > SYS_AUX_PWR_DET bit?
> > 
> Refer to the description of this errata, it just mentions the exist from
>  L23 Ready state.

Exiting from L23 Ready == entering L2/L3. And since you mentioned that Vaux is
not available, it is definitely entering L3.

> Yes, the workaround requires setting SYS_AUX_PWR_DET bit to 1b'1.
> 
> > IIUC, the issue here is that the controller is not able to detect the presence of
> > Vaux in the L23 Ready state. So it relies on the SYS_AUX_PWR_DET bit. But even
> > in that case, how would you support the endpoint *with* Vaux?
> > 
> This errata is only applied for i.MX95 dual PCIe mode controller.
> The Vaux is not present for i.MX95 PCIe EP mode either.
> 

First of all, does the controller really know whether Vaux is supplied to the
endpoint or not? AFAIK, it is up to the board designers to route Vaux and only
endpoint should care about it.

I still feel that this specific erratum is for fixing the issue with some
endpoints where Vaux is not supplied and the link doesn't exit L23 Ready. Again,
what would be the behavior if Vaux is supplied to the endpoint? You cannot just
say that the controller doesn't support Vaux, which is not a valid statement
IMO.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

