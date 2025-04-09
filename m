Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CFCC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vY1cCwOeuEYKDsSiTLX+gpvDg+AadEDeAOXISK1ljl4=; b=RHYuYyboL6r2QMd7V7eb/cM1l3
	YSjuChANsBXFMBEL9+QqJCmaMGJ55QnDIrzP28B72GdZNuidkGlmU7PSZ7huHP+/0WfWTsOv2qzU6
	QVvLbJVSTp/Bh7rMmTk71N/TEAt8oVC4WljcYT11lJ6HgngtGr2z3ZmPO3aYIWmhwu8sZB3T4VlIW
	Dxifdcx1vn2yZUKxzGynjcbLFANzs+ho6LsmU2iVDy2loKQBj3i5F8Iww2sRv+yw7iX7tBRVW8pvb
	IOxG14dC0s4DdJEeO77hfwoyrSO1KvK9ZMGIRbfAwOb7EXr/dPTpSmBT1AgcTnDUeQb9ZxLd7x4o+
	+NO+wdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Yte-00000007zPb-2Ad4;
	Wed, 09 Apr 2025 17:07:30 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YWd-00000007vGs-1HkP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:43:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-224019ad9edso91633335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 09:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744217022; x=1744821822; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vY1cCwOeuEYKDsSiTLX+gpvDg+AadEDeAOXISK1ljl4=;
        b=VuqfBfv2lI+NcqVZpXfGw5gJXw5utwV9Tik3tB/hb4WQ2bHL36i4f8TdGhu1U+b7iT
         JojkSjx109E6g8a3DFOC3PhqB2XWn1KTHWwX9JgFuw5Y6ZBfun3X3DR/0cC9pyGn71Gp
         gsHAnhX8qr6wTjt5jrveDXXYgBMq7/2VFXZeDv/b4dktmtSDuqK8FJzgvmVRKH+oX11M
         klQMVY14IEztk/0tjYBuKZ9qUBfStpMz9/dce/itAEGpe2zlXm19qmp3XaKJDSV+SsB4
         vHizbzqHEV5YaNGknVKMXPc+7XA543slejdJmO1sHG/7Xpxp3U1A3MvN61KVLxHfPUXy
         IvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744217022; x=1744821822;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vY1cCwOeuEYKDsSiTLX+gpvDg+AadEDeAOXISK1ljl4=;
        b=bvb43U2fixI4UnekFhVCeY4DXLsdvqKi1Wjaq+SRBv0XJLCx/HHNSt3hIbsfXqQ06F
         DT/OeKIQASOhWo4Db/cMSBC7K4RE23NKtvWYINHg8kaZgoB80ttvjAqU5R0MgYTxrRbY
         cAHgwEKs+ohMumE/kfVb74D66jj8Fl2bRGhvMjU9PL0vkMm5WRA2fcxj7+D2IPe/O17W
         U9oK9w2cY9+zqtsZErlA/Oj3GBihihNkKXhe/u6X7KkZgeADenKtDjEi1BsvaqZfpzeH
         ipR7aMfq/GV+11qPxqqEYZ9InE3U4Qw56rnCNHRO6GqRF7EbdOzFkQWtALVkWrq34aV0
         1XfA==
X-Forwarded-Encrypted: i=1; AJvYcCXNLLBuQ2/xK5YaTb1Nfjnz1voxiFKPACDYLQM5+33zdPlUB4S86AZyTVxiZYLEm9MfJiuQ7bg21sBOM1N6M6lY@lists.infradead.org
X-Gm-Message-State: AOJu0YxFCnxq/2JpHfV8gRWUcZgiJhgFF5edC5VF0RjhH21D/IZKUoRj
	sOrtLvRDPckYkg9fjwTwK48xjeixekLGmVEQD3SlAE/ZN0AEp/UgPOoPKu6Y1Q==
X-Gm-Gg: ASbGnctYlyt1LgKRZTeaIvyrtMLdkDnvSJu/MLbmEomkKVWDMe4gBo6kLpSgJghY0Hu
	RqSl5xREidxANItzCUdQuYe8q35XbuNZ4f7oF8sk8vgmdoQniEP12v5nAPnpsRyJEH5ppCvlRca
	3Hfyq/gFoEp6rPgZlUndjQG+b2zYUdLaM5My0Nlp7lL+fXI+zTLGLAyLAEcm3BXorultP2JUQeL
	MJnD5TSnOb5z98yg+dK70pseL6UgGeWmy0oV+ZAtVBfHNPdFpc+HghBqEgV1pI/sr72yTN5UE2c
	18j6c0ZfTSv6xfvS88m5zoOcyP/dXA5f+mK/vVZv2FJIdfF8D75bAAevwbErpQ==
X-Google-Smtp-Source: AGHT+IGmox3LqV854DFPIki4F+4Ez1MkIE7qgsYtzCRr9m1FgmnFh+N3/PD/p2Tx05KbHuOZaTpH7A==
X-Received: by 2002:a17:903:32ce:b0:224:7a4:b2a with SMTP id d9443c01a7336-22ac297c916mr55618525ad.11.1744217022535;
        Wed, 09 Apr 2025 09:43:42 -0700 (PDT)
Received: from thinkpad ([120.56.198.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b642besm14327585ad.46.2025.04.09.09.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 09:43:41 -0700 (PDT)
Date: Wed, 9 Apr 2025 22:13:36 +0530
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
Message-ID: <4qrfkx3ckywcbk7qbjplal5j7v6sjs3zebeehe5dnrgjz2ej2t@krdwjb4xm2sx>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-4-hongxing.zhu@nxp.com>
 <ovaomfvo7b3uxoss3tzhrkgdy6cvxi4kr2zxmqsfjxds5qfohl@t6kc4rswq6gp>
 <AS8PR04MB8676687332C78840B927E7568CAF2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <rqgl5jjauppyudgmugp34fillkeli3qkwf4uf2djghi6nslebg@pyi6rbwyduxd>
 <AS8PR04MB8676BB3EDFCF3E5A490AC0628CAE2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <AS8PR04MB8676C5D0DB84975D34C4C65A8CB52@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676C5D0DB84975D34C4C65A8CB52@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_094343_358265_D6BD7DE3 
X-CRM114-Status: GOOD (  28.80  )
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

On Tue, Apr 08, 2025 at 03:02:42AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Hongxing Zhu
> > Sent: 2025年4月3日 11:23
> > To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de; lpieralisi@kernel.org;
> > kw@linux.com; robh@kernel.org; bhelgaas@google.com;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > linux-kernel@vger.kernel.org
> > Subject: RE: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not exit
> > L23 ready
> > 
> > > -----Original Message-----
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > Sent: 2025年4月2日 23:18
> > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > > lpieralisi@kernel.org; kw@linux.com; robh@kernel.org;
> > > bhelgaas@google.com; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > > kernel@pengutronix.de; festevam@gmail.com; linux-pci@vger.kernel.org;
> > > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > > linux-kernel@vger.kernel.org
> > > Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not
> > > exit L23 ready
> > >
> > > On Wed, Apr 02, 2025 at 07:59:26AM +0000, Hongxing Zhu wrote:
> > > > > -----Original Message-----
> > > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > Sent: 2025年4月2日 15:08
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
> > > > > On Fri, Mar 28, 2025 at 11:02:10AM +0800, Richard Zhu wrote:
> > > > > > ERR051624: The Controller Without Vaux Cannot Exit L23 Ready
> > > > > > Through Beacon or PERST# De-assertion
> > > > >
> > > > > Is it possible to share the link to the erratum?
> > > > >
> > > > Sorry, the erratum document isn't ready to be published yet.
> > > > > >
> > > > > > When the auxiliary power is not available, the controller cannot
> > > > > > exit from
> > > > > > L23 Ready with beacon or PERST# de-assertion when main power is
> > > > > > not removed.
> > > > > >
> > > > >
> > > > > I don't understand how the presence of Vaux affects the controller.
> > > > > Same goes for PERST# deassertion. How does that relate to Vaux? Is
> > > > > this erratum for a specific endpoint behavior?
> > > > IMHO I don't know the exact details of the power supplies in this IP design.
> > > > Refer to my guess , maybe the beacon detect or wake-up logic in
> > > > designs is  relied on the status of SYS_AUX_PWR_DET signals in this case.
> > >
> > > Can you please try to get more details? I couldn't understand the errata.
> > >
> > Sure. Will contact designer and try to get more details.
> Hi Mani:
> Get some information from designs, the internal design logic is relied on the
>  status of SYS_AUX_PWR_DET signal to handle the low power stuff.
> So, the SYS_AUX_PWR_DET is required to be 1b'1 in the SW workaround.
> 

Ok. So due to the errata, when the link enters L23 Ready state, it cannot
transition to L3 when Vaux is not available. And the workaround requires setting
SYS_AUX_PWR_DET bit?

IIUC, the issue here is that the controller is not able to detect the presence
of Vaux in the L23 Ready state. So it relies on the SYS_AUX_PWR_DET bit. But
even in that case, how would you support the endpoint *with* Vaux?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

