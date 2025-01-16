Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9043AC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 01:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPT7HO0uKhENdBsBoDbMFzCNa+LMh6a1srxsA8S0Gko=; b=hLV5elakujercWD0aY3+tzI5wT
	m0jTAo9a9HqIUJBtJv8f6H6aBsESVtUGg5nCf/4teJY3rasaONsuPq6AlstXQ0Hl6ZIp6/UlCJuLO
	mRb2McoeTYhlaTAYZsb/g8XLwGAElLVIzctOpaofZ0vVQwVk/fT2qpk4PEojiTVuEwvbL3atoDpEl
	o5GE77B2iMfI2bvtG772pQVrZ8ZBEktTE/HvnXuHFjk8f8F6pL2/jrCR/itRGOILv+JfMQ77PVha+
	opkGj6BQ+nKGyZcaTfnYwg1PQiHVR1y5kjuCeldBI9J9f3ukQMxyMJpgUJ1zjt6VleGxEgUQjW9fw
	061xUPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYF8X-0000000DaMi-0cEZ;
	Thu, 16 Jan 2025 01:57:33 +0000
Received: from mail-pj1-f52.google.com ([209.85.216.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYF7H-0000000DaDS-2SG5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 01:56:16 +0000
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so826850a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 17:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736992575; x=1737597375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPT7HO0uKhENdBsBoDbMFzCNa+LMh6a1srxsA8S0Gko=;
        b=UfSjV7Cqrl/ApDt35loZOJDBO3qa0NlKUhVFUnrxlDY4xOZNWi2qAQXo3087k+1ylc
         2efirYZQ1r8UR1vsSyD9l+PrAybLXXFiUJu8mRyuflvH01kXFxvX5NryT7U1K5Y+bo4z
         or7cQhERpVZlAmUmDi7RU50DanAhH4h8cfzYvhi09Zj5CtRp7UOpVP9yPxqFgSXwkXsk
         kh4QuEYwWALns9C16nifLfkmIiwQ97wN6pZ2UweSfCtFeuXh2Jos9R79KFALfv/86UaK
         l0ugB7NQ2h5qOG07JV11q/yy40SJ2xPYTTCtQq2QlcyPGEuEj69BdaAxaK+wv1DucDzU
         kFDw==
X-Forwarded-Encrypted: i=1; AJvYcCWbMeHSQvnnETGL6AdCTimbvpoT09BxBp7bITWPe2V1GmMHlXatd+uNjLYw0bxkDUUlT40V+8+zNAiFwyTZNxXM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1OHeIjDyGsRexcqfCDWBBAqUyl16+kdJUdAyyLOsYf0pKyRCJ
	LkdSNr9Fsdr3NcMi3ouWUZxfgKHiiK32mg0PppTUVkNHzksxpE29
X-Gm-Gg: ASbGnct7fxoB7yNOrNiKSlcFlMc1R6T3/HCnqF3eGs0NdKRJqgMFN0w0hZhUOJ0Yo4g
	FLdkS7NxaEdHGBwdagW4+HUVReXUAv46TmYBNRVdEONLyecRt7sgABL9JMQsa4F9YorgGRSLKSS
	YGXM5IRSlhKL64YRoyvRFayzYKcLpfgNv80y+v4K5DulyWkNNSBbEu6e703jCQsj1S6+GB/7L4v
	IqvRFKX/Ya5pPjvJAKJCU46xeoj1HbUGFSnl7+pGLd7EQLQBBcs7iTeJ5i1li1N6xZRFExWAiDj
	gROP35rRvkgYw/0=
X-Google-Smtp-Source: AGHT+IFLaJYooeBDIow3d6P4KJcawUwpbKu9ceRFklBWxLItU2fkeooWGqXZ3z89KdMiKUuR60q/Sg==
X-Received: by 2002:a17:90b:6c6:b0:2ea:8d1e:a85f with SMTP id 98e67ed59e1d1-2f548f44771mr51223268a91.17.1736992574668;
        Wed, 15 Jan 2025 17:56:14 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c1cec9dsm2087075a91.29.2025.01.15.17.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 17:56:14 -0800 (PST)
Date: Thu, 16 Jan 2025 10:56:12 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/7] PCI: dwc: opitimaze RC Host/EP pci_fixup_addr()
Message-ID: <20250116015612.GC2111792@rocinante>
References: <20241119-pci_fixup_addr-v8-0-c4bfa5193288@nxp.com>
 <20241124143839.hg2yj462h22rftqa@thinkpad>
 <Z1i9uEGvsVACsF2r@lizhi-Precision-Tower-5810>
 <Z2R6HET6FZEO+uwi@lizhi-Precision-Tower-5810>
 <Z3wPX1F4VrQZhICG@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3wPX1F4VrQZhICG@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_175615_622452_328A33BF 
X-CRM114-Status: GOOD (  13.93  )
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

Hello,

> > > > Series looks good to me. Thanks a lot for your persistence! But it missed 6.13
> > > > cycle. So let's get it merged early once 6.13-rc1 is out.
> > >
> > > Krzysztof Wilczyński:
> > >
> > > 	Could you please pick these? all reviewed by mani? It pave the
> > > road to clean up ugle cpu_fixup_addr().
> >
> > Krzysztof Wilczyński and Bjorn Helgaas
> >
> > 	Any update for this? All already reviewed by mani.
> 
> Krzysztof Wilczyński and Bjorn Helgaas:
> 
> 	Happy new year!, could you please take care this patches?

Happy New Year 2025 to you, too!

I apologise for the delay, especially given you chasing few times.
  
However, we should be good to get the series out for the v6.14 release.
 
Again, sorry for the delay. 

	Krzysztof

