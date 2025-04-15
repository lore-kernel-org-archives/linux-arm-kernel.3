Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C57C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jV6NGQFGLg4JdFHEjIqGuC71J4i1+oIq9oJnSeBlp3s=; b=mwkXQFZkPxpnRm1fh80estdfcI
	RHoQ0CUIMR44v78DRpSx4VFU5uMcqdrnbwPbvCNR0SrKwCx02BBLxd/RNV7XHLmTTmVryE6HDOqwI
	carljB24Eu5sshqGKYX6i+7+4DO7Zr2KJRWpACKlXrQ4uDEm3PqgrVIOVjcVS8NiewmvY4WvURKN/
	bXlsv+xW6TPHpE5VGxF/5kWYQrMkSE1CMJe+wawvsuVrCyDBMHY1z01iSD25KrAAyHxNE96OfP1tq
	U2asPveUl+XEucMkAs4xYoomWu8mGlinq/LkyvycX100n4sRYLlNWxrfOO6BTuG46ACCkpvBTcv4Q
	T8/eqmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4beR-00000004zoT-1TXF;
	Tue, 15 Apr 2025 08:28:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aXi-00000004m3q-05gH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 07:17:15 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2295d78b433so54012505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 00:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744701433; x=1745306233; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jV6NGQFGLg4JdFHEjIqGuC71J4i1+oIq9oJnSeBlp3s=;
        b=sEb45h034UcQMfpdQFwQI6uufw7IKhkC+x1r9t3Hi5zdDtQaKV2HO9L66/PInTMEb6
         qyQentmbYS6c01c1eW4d1RdYVw5BAAhyNuP8lDHdEsBqaxD53L9KJo+2r8umszpffGpQ
         8kxxgkD/0U8o9QURs0aDxIox+fuGkdOHCvYgvmiwxMcAxa20S+QxVBXHUggGWnPQ7d4G
         fhmCMgEmeNkXPS6bBt46T/ajOyx7iKJHXWtf3Ejs2LrR2PvLZbTXuirniQoIgF6esIqa
         A3p1sv1ubzlUk3bmsaBQZZLoFNpB9FNpLK6K5xmKVvOQ1eiE//iKQ99Qb8u+fPGpTWab
         dgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701433; x=1745306233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jV6NGQFGLg4JdFHEjIqGuC71J4i1+oIq9oJnSeBlp3s=;
        b=KakKBySyJRAMysowuWx9gGphzA0dI8zv+DSxm0oOwMAHUXA1xEjHQdYyuCa65U0WTU
         C9icw3eb/T3LjGXdhIKjJS+cSXfffVubJUJrOTsDWggVbqbbo0QHKbC0DHo2kZcXuLxG
         14t08YjU4w3pkccwsz43rGs6lxMjoZrWzy4we2HUVaW3YUgfrDGOseSykShSoubalzLe
         DH4FbYq5CCK3Ay8oHopU6LWrxK+3V3tiKRBPRTHRYL0Ji+2/KkzEdReJo2mhPI47hzX3
         sk4SjiV9H9qAMpxyUO1mEz7oyzPW/fD0qIS7Mcy4q8J8BneELDzhOO51ucwfUbbMNexa
         Hu/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcJIv8g5PowlUOIGE02TfS5Geeys8QKmaXqAhWI7cB1X9T1zjTcf5FZioj3YLeIFF4Eq9sH4EvyuP+mnfz9znD@lists.infradead.org
X-Gm-Message-State: AOJu0Yxoba2dNMTDfGgmtoicKshA8sOpQZsuGOpit/H1n8laQDw5Bns3
	LypXO/OSiCUdgaMpdtpwoPfbjLifqD+8UjTI083YAwQV15e15gJREXt5pE3rCA==
X-Gm-Gg: ASbGncsSt88heiCU/NiY1mCUihl64lHNNAx/4vL1CqJur3V1ht+efFxz207xnQ1X5lQ
	IaFJ0WppZY3WHPOrNfHS5/PS82JyqyaM6gImDJe2yWiXB6yZRemX7yrN4qAvHwXo4io6QRfnzs6
	nLQySVMKZYC70jdhqMpKbfJmTh9QPqvwKJPDbU3/JY/Y5NVEkt4SM+5t4PWr5xkHRhEH+pD2KRs
	uSQEMPMgChjEFsgaFlyu0zpEcCJb/9Y47i2j7z59RuDVoGN6SDd2IV/Mxv0JkuqB4sGSqy7Rmba
	iy8cl19ohe01R2DXDvcfWvgOtg3aU9Ddjr9LVlJlJbN+w+k/Mw==
X-Google-Smtp-Source: AGHT+IEsKIi1AC4jZA/ksxZU1y9WCKtKtWG0llGnvi3XAKZ2YzyptaNOJKPI/OvYlRGlImVjo9ZAgw==
X-Received: by 2002:a17:902:f707:b0:224:2175:b0cd with SMTP id d9443c01a7336-22bea4c3baamr218535905ad.26.1744701432954;
        Tue, 15 Apr 2025 00:17:12 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b355sm110106255ad.87.2025.04.15.00.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:17:12 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:47:06 +0530
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
Message-ID: <cm5esahjwyoi5hky344nk2vfawf26hzgvu2rkplabav6d2r3gt@y4ypf6mdaapx>
References: <20250328030213.1650990-4-hongxing.zhu@nxp.com>
 <ovaomfvo7b3uxoss3tzhrkgdy6cvxi4kr2zxmqsfjxds5qfohl@t6kc4rswq6gp>
 <AS8PR04MB8676687332C78840B927E7568CAF2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <rqgl5jjauppyudgmugp34fillkeli3qkwf4uf2djghi6nslebg@pyi6rbwyduxd>
 <AS8PR04MB8676BB3EDFCF3E5A490AC0628CAE2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <AS8PR04MB8676C5D0DB84975D34C4C65A8CB52@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <4qrfkx3ckywcbk7qbjplal5j7v6sjs3zebeehe5dnrgjz2ej2t@krdwjb4xm2sx>
 <AS8PR04MB8676221C998474EF5A9B94288CB72@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <h7pja24zffl4t7653rjaamp6v2j5nmukbzq7rdajynemlyb6l6@3e37ggkparjg>
 <AS8PR04MB8676CFD0FA7BCBB06AC51B018CB32@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676CFD0FA7BCBB06AC51B018CB32@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_001714_065580_528A0042 
X-CRM114-Status: GOOD (  47.52  )
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

On Mon, Apr 14, 2025 at 03:15:28AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2025年4月13日 23:39
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not exit
> > L23 ready
> > 
> > On Thu, Apr 10, 2025 at 02:45:51AM +0000, Hongxing Zhu wrote:
> > > > -----Original Message-----
> > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > Sent: 2025年4月10日 0:44
> > > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > > > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > > > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > > > kernel@pengutronix.de; festevam@gmail.com;
> > > > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > > > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > > > Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may
> > > > not exit L23 ready
> > > >
> > > > On Tue, Apr 08, 2025 at 03:02:42AM +0000, Hongxing Zhu wrote:
> > > > > > -----Original Message-----
> > > > > > From: Hongxing Zhu
> > > > > > Sent: 2025年4月3日 11:23
> > > > > > To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > > > > > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > > > > > bhelgaas@google.com; shawnguo@kernel.org;
> > > > > > s.hauer@pengutronix.de; kernel@pengutronix.de;
> > > > > > festevam@gmail.com; linux-pci@vger.kernel.org;
> > > > > > linux-arm-kernel@lists.infradead.org;
> > > > > > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > > > > > Subject: RE: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe
> > > > > > may not exit
> > > > > > L23 ready
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org>
> > > > > > > Sent: 2025年4月2日 23:18
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
> > > > > > > On Wed, Apr 02, 2025 at 07:59:26AM +0000, Hongxing Zhu wrote:
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: Manivannan Sadhasivam
> > > > > > > > > <manivannan.sadhasivam@linaro.org>
> > > > > > > > > Sent: 2025年4月2日 15:08
> > > > > > > > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > > > > > > > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > > > > > > > > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > > > > > > > > bhelgaas@google.com; shawnguo@kernel.org;
> > > > > > > > > s.hauer@pengutronix.de; kernel@pengutronix.de;
> > > > > > > > > festevam@gmail.com; linux-pci@vger.kernel.org;
> > > > > > > > > linux-arm-kernel@lists.infradead.org;
> > > > > > > > > imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > > > > > > > > Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95
> > > > > > > > > PCIe may not exit L23 ready
> > > > > > > > >
> > > > > > > > > On Fri, Mar 28, 2025 at 11:02:10AM +0800, Richard Zhu wrote:
> > > > > > > > > > ERR051624: The Controller Without Vaux Cannot Exit L23
> > > > > > > > > > Ready Through Beacon or PERST# De-assertion
> > > > > > > > >
> > > > > > > > > Is it possible to share the link to the erratum?
> > > > > > > > >
> > > > > > > > Sorry, the erratum document isn't ready to be published yet.
> > > > > > > > > >
> > > > > > > > > > When the auxiliary power is not available, the
> > > > > > > > > > controller cannot exit from
> > > > > > > > > > L23 Ready with beacon or PERST# de-assertion when main
> > > > > > > > > > power is not removed.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > I don't understand how the presence of Vaux affects the
> > controller.
> > > > > > > > > Same goes for PERST# deassertion. How does that relate to
> > > > > > > > > Vaux? Is this erratum for a specific endpoint behavior?
> > > > > > > > IMHO I don't know the exact details of the power supplies in
> > > > > > > > this IP
> > > > design.
> > > > > > > > Refer to my guess , maybe the beacon detect or wake-up logic
> > > > > > > > in designs is  relied on the status of SYS_AUX_PWR_DET
> > > > > > > > signals in this
> > > > case.
> > > > > > >
> > > > > > > Can you please try to get more details? I couldn't understand the
> > errata.
> > > > > > >
> > > > > > Sure. Will contact designer and try to get more details.
> > > > > Hi Mani:
> > > > > Get some information from designs, the internal design logic is
> > > > > relied on the  status of SYS_AUX_PWR_DET signal to handle the low
> > power stuff.
> > > > > So, the SYS_AUX_PWR_DET is required to be 1b'1 in the SW
> > workaround.
> > > > >
> > > >
> > > > Ok. So due to the errata, when the link enters L23 Ready state, it
> > > > cannot transition to L3 when Vaux is not available. And the
> > > > workaround requires setting SYS_AUX_PWR_DET bit?
> > > >
> > > Refer to the description of this errata, it just mentions the exist
> > > from
> > >  L23 Ready state.
> > 
> > Exiting from L23 Ready == entering L2/L3. And since you mentioned that Vaux
> > is not available, it is definitely entering L3.
> > 
> > > Yes, the workaround requires setting SYS_AUX_PWR_DET bit to 1b'1.
> > >
> > > > IIUC, the issue here is that the controller is not able to detect
> > > > the presence of Vaux in the L23 Ready state. So it relies on the
> > > > SYS_AUX_PWR_DET bit. But even in that case, how would you support the
> > endpoint *with* Vaux?
> > > >
> > > This errata is only applied for i.MX95 dual PCIe mode controller.
> > > The Vaux is not present for i.MX95 PCIe EP mode either.
> > >
> > 
> > First of all, does the controller really know whether Vaux is supplied to the
> > endpoint or not? AFAIK, it is up to the board designers to route Vaux and only
> > endpoint should care about it.
> > 
> > I still feel that this specific erratum is for fixing the issue with some endpoints
> > where Vaux is not supplied and the link doesn't exit L23 Ready. Again, what
> > would be the behavior if Vaux is supplied to the endpoint? You cannot just say
> > that the controller doesn't support Vaux, which is not a valid statement IMO.
> > 
> Sorry, I miss-understand the question you posted in the previous reply.
> I get the following answer from designers when the Vaux is supplied to the
>  remote endpoint. Hope it can get ride of your concerns.
> Q:
> How about the situations when remote partner has the Vaux present?
> For example, i.MX95 PCIe used as RC, and a endpoint device with one Vaux
>  present is connected to i.MX95 PCIe RC.
> 
> A:
> " As per my understanding it should work irrespective of vaux presence in remote partner."

Okay, thanks for the confirmation. Please include this information in commit
message for documentation.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

