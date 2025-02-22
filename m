Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0ACC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 07:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQ0UFW2pdjOoWqROlGDZphwMQ2EIio94ZLPWcsQImvI=; b=NbcWfIQTrdifEz/E0YIx+9vZr7
	RG+9W9Jcd92MHIB89CfHGfVKI5YYsXqwHOl7KdbMRyg+sVcGV2JrvCbw3wAd+402dfHAomX9GnhRf
	5Ue3Ywb878Nns2UBgmPMQz3FiRROh2dHW4tBitUpICfqSTiILWZ9Ehjz6oeAm+8dySZfmhX+J0KqZ
	2ornv3FT5GHxlRCSCTH3RxBoTbVAdCdy2H6VixENkZ1/pfAm4m4NIbR4Al+1IOpocmHt55TUxnbqW
	XEWMwpUAt1EwTaXrPfBWPUdxCUOBq2ryCrqSKgb6N/aaE3P2SQWvYqnG8FT4EMG7wvH0/GCM+cuts
	SQF0HMqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlk7I-00000007aGe-45AP;
	Sat, 22 Feb 2025 07:40:04 +0000
Received: from mail-pj1-f46.google.com ([209.85.216.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlk5p-00000007aCC-2v18;
	Sat, 22 Feb 2025 07:38:34 +0000
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fc0d44a876so4690850a91.3;
        Fri, 21 Feb 2025 23:38:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740209912; x=1740814712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQ0UFW2pdjOoWqROlGDZphwMQ2EIio94ZLPWcsQImvI=;
        b=roNB1ivLWz32a8hzlzWk1GYhjNEOilNZm07ALv3Sc4e3iUrrs+1ok4RhbqK2Jq2A2z
         XXww/HG+24w2x7jiSia/nzh3nsIC8r5iwPCASdj/QwSRh+IIxG/J8BgY5sjCN5uw8R4B
         Le3OObEFQwVSdU1izQJUZzzKBpuT1GKMFLek6OBEHJCo09JwTK4BPLqjLBY8WTdbJBJu
         CPzZhYDcvExiyhs4XV0Yv/x7y7z21RpGvm8CfQGKQUr5McjuR2BNmzBZPVuccnxqwAg6
         wwcHVo/StgjTa5N5SKXF/Xq2Klj0XlBlnPVjj8QJvgl7CLUdtoPWaKLOnFNbt8+yXNnA
         EkoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ3VD/W5jZ3ym2cZkcJVq1vzVy5rR5+QF/7kA1kKa1x05efC3WcYTwtttaKmgPZjtm1IidQTBvKVWNlFHBnJo=@lists.infradead.org, AJvYcCXZxITqfiqnh42vUacYnXWlk+7uDXWB/TuxWEKHGQBKHNFseMshnHotXHpuat4+1+BEJN8J2H5bULh4Uw/98d/j@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/SpKg8YxNxhiywAimXhFEDA7gC+Nldo8PdrLCBhvDlrl1BuTL
	D+Y7KMHuyTzE7MgWfFMc9M12XhczZMVQm+rQk4YSWMTg2mhxfd9Z
X-Gm-Gg: ASbGncuRArS/9zqXAd4J2DU80zIE1gvIUT+fNhU6mC75lSwHkQ3q9IwhucsNTXf/gMf
	zAsq1c/7TNe128x3MXN95mw9eFoDZ70sqL1/sXjirQN3ngjkh5P4k8FS0KKwhNGXbQSATpLBG5+
	9fpvDTQKbeHGJTi0RHYuN+42qvP9W9acbcnCZHsElVokpdqDExFllN+SWm8xbnJNC5F/ehcxfmU
	NFxJXfty3fzcyDPpCL4GBJ0SOEVBprtwjpTG18zAZvl7Z9z8e6c5RBNrAt9aLa3V0dZhzZ+17oE
	6AGUXHg0hz+OaYgM5WDmYpPNhnhJ3n2vJoo6QPFP3RH/R22WpAnwRfIk9Aip
X-Google-Smtp-Source: AGHT+IFThR433LcObShHk7gSPjGjLSI8AWlZ6U2G2AIgjEbAQv5VuI5xA/i3kLqSjTt2eyUi9Bp6Sg==
X-Received: by 2002:a05:6a00:22d6:b0:730:94e5:1ea2 with SMTP id d2e1a72fcca58-73426c8d91bmr9220237b3a.4.1740209912568;
        Fri, 21 Feb 2025 23:38:32 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73242568acesm17390081b3a.56.2025.02.21.23.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 23:38:31 -0800 (PST)
Date: Sat, 22 Feb 2025 16:38:29 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: dw-rockchip: hide broken ATS capability
Message-ID: <20250222073829.GA1158377@rocinante>
References: <20250221202646.395252-3-cassel@kernel.org>
 <20250221202646.395252-4-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221202646.395252-4-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_233833_771181_553A996E 
X-CRM114-Status: GOOD (  15.79  )
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

> + * ATS does not work on rk3588 when running in EP mode.

Would it be OK if we started to style "rk3588" as "RK3588", unless the
lower-case is preferred?  I had a look at Rockchip's own datasheet, and the
product code names seem to be styled with upper-case.  That said, I am not
a Rockchip expert.  Just curious for the sake of consistency.

> +static void rockchip_pcie_ep_hide_broken_ats_cap_rk3588(struct dw_pcie_ep *ep)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct device *dev = pci->dev;
> +	unsigned int spcie_cap_offset, next_cap_offset;
> +	u32 spcie_cap_header, next_cap_header;
> +
> +	/* only hide the ATS cap for rk3588 running in EP mode */
> +	if (!of_device_is_compatible(dev->of_node, "rockchip,rk3588-pcie-ep"))
> +		return;
> +
> +	spcie_cap_offset = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_SECPCI);
> +	if (!spcie_cap_offset)
> +		return;
> +
> +	spcie_cap_header = dw_pcie_readl_dbi(pci, spcie_cap_offset);
> +	next_cap_offset = PCI_EXT_CAP_NEXT(spcie_cap_header);
> +
> +	next_cap_header = dw_pcie_readl_dbi(pci, next_cap_offset);
> +	if (PCI_EXT_CAP_ID(next_cap_header) != PCI_EXT_CAP_ID_ATS)
> +		return;
> +
> +	/* clear next ptr */
> +	spcie_cap_header &= ~GENMASK(31, 20);
> +
> +	/* set next ptr to next ptr of ATS_CAP */
> +	spcie_cap_header |= next_cap_header & GENMASK(31, 20);
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +	dw_pcie_writel_dbi(pci, spcie_cap_offset, spcie_cap_header);
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +}

To keep things consistent, it would be nice to capitalise sentences in code
comments, and end them with a full-stop where appropriate (e.g., longer
sentences, etc.).  That said, this is something I can after applying, to
save you the hassle of sending another versions.

Thank you!

	Krzysztof

