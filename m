Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F25C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 11:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kTrvJwPYog6ibdC8R73i3/w/ryvC/QOpevsthuxZsk=; b=DaEsbbb9hKlXCsw8kR0Z80mweL
	zYEkjep0KJSoM/DV9dnBfO3WlPisxRkQD+ykX3QIbjoMa25wQExyLvj0qq3bOxxC38WVe97t3wP0/
	h2681weZTyV78UtLCZf7mvXuhSsw+FVjboKtx5gVIQno0IU58eLzXTmCnSfQc8idPNhFGhd3t2SLG
	fEgnn6UrvZq6ZM6V4jmYNxeF4AUBeG7iWZY0076AjiqNXzHujH/PH4TZXLr9JkFJB/J57blG1m0oT
	tbZlTOGi3o9yr3c5sCPKMrX4Pm6mpMbkYz0Futa6+vyxewBSbF1/0wr9DO9om0619jgyebsJTjeM9
	qPJUw5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXFH-00000000Tkb-1fRV;
	Thu, 15 May 2025 11:59:27 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXDH-00000000TbV-0DLb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 11:57:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a0b7fbdde7so755994f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 04:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747310241; x=1747915041; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8kTrvJwPYog6ibdC8R73i3/w/ryvC/QOpevsthuxZsk=;
        b=gJMP7jCb5wiX9MV0DAmkCJxa6YOjscW9v7EggbpwnG/s3gYHSA4iF4pYEAjA2KckO3
         A5fE0VkqtoEL9kFDrfbIYjD/VuxOhiFm27jXVuyeXn6zVPsRT+yaMe1qolTuVcsea+Vy
         Rac+F9kuJWt7EjzmmXgT4/fTPHbqhIHkUNZnqEg62yot285RB8q0yM+xg4UQBnSwCbgr
         AxZ+aZ18CzayVNRX2D3cFoJ1ncOvehom12wTXEAsZf1oNbMzR6Dz8R/Bx6sdsLbnbHzM
         Xb0nB0W3qhBybZlxCy+gFHukfHJKug5/n2dhQnk7nHI+tqDUrzBanL2iU17CVEBj1+T6
         uCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747310241; x=1747915041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kTrvJwPYog6ibdC8R73i3/w/ryvC/QOpevsthuxZsk=;
        b=voKuHy3EeZQrGqHvq6z9sSzWypCpUMgheCxxMR060DJbt+fREEjuHnGldY745qrcOB
         A7HlNJlzrIw70zUD8nLm5hP/nHevPxrE0ipOdtuDMW/Zopps3ecsObdR7SUKBCSrKHGO
         i45Ca1hwrre1wti9FSlyOYkhPPhjrFzvtqajrdiO3Nkk18FwZaXR7E1bVMVLtihejrGq
         YTFT+PYvKFNCZzAnfdmz7mmEXiy3M4OfMXlS7Ky5webMIgZeT+UTX0EeWeikLRGrrocm
         RlIWo4Rq2c/hVbSMqAlff/1mmziKShaguNLdqEiHb6XgNT/CFpJebpqwvJQAFBQUwQdv
         gMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy7GTH7AqgY6i3zqB+uiqWN0K4vpZjZvB/MIZX6yR0q/ei7VvsoUfgTmOzZiRX0axIhUbuMfjWpfyn1VQcT8rs@lists.infradead.org
X-Gm-Message-State: AOJu0YwPQ++/WyzPPW9RPJZxK2Rrm/7/Zlynf1Qj30QnMY9xO1MWh2Kl
	G0l8RKzA3JGZTtuHX3oywqmcecPbNGvH3t3ll1jutjdqHDfmSK33WK8Y3VuIDA==
X-Gm-Gg: ASbGncuIjVuw2l5n4E6YOZODsrkJnmDgWGTn3lHYTjHgOP9lpwfPl+G5viY/2iCQ0cz
	6IW249xMngRWFw43YyanrCwUPghL9eDQu2Ma86cEtFt/5I3uA3hn30Wdbrq18DfbbeID4xB/B1G
	iEiYcq34ik4bdBMmXHfiprS0NYCVqDpfLvgzIWVl7V29nAo1UwdRUyXH1O8Jcl/uh2OOPZ5pdsI
	jDJMKd9kWSFv4J50u9V5G2Ht8QRg4iz3agsV2IUZ+7dmfycg1hqX7Yrt8dkfhzQsnqkskTIYfYj
	hIIoM/N/CPd/jDHZh298p5DUWZbqbflxDVHNp5w7Xy2eVXMCJTDOo14LY5QPH/E/5UF3sPa/mQI
	WBMDUbTCaxuHd+g==
X-Google-Smtp-Source: AGHT+IHT8sGe+qq8cIc4avwun1XMAZX5YQZUGXMdjWUKnjqYpkS2IP5Zbr/WCevnDOHJQIVwI5wV7A==
X-Received: by 2002:a05:6000:188c:b0:3a0:a09d:b31e with SMTP id ffacd0b85a97d-3a34994f2e1mr7059180f8f.59.1747310241228;
        Thu, 15 May 2025 04:57:21 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm22405542f8f.86.2025.05.15.04.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 04:57:20 -0700 (PDT)
Date: Thu, 15 May 2025 12:57:18 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Aradhya Bhatia <a-bhatia1@ti.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Junhao Xie <bigfoot@classfun.cn>, Kever Yang <kever.yang@rock-chips.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document
 optional aux clock
Message-ID: <ne4injlr4nwvufjdg7uuisxwipqfwd5voohktnbjjvod5om3p3@eriso5cw77ov>
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
 <20250406144822.21784-2-marek.vasut+renesas@mailbox.org>
 <2ny7jhcp2g5ixo75donutncxnjdawzev3mw7cytvhbk6szl3ue@vixax5lwpycw>
 <84cc6341-a2c1-4e3c-8c9e-2bc6589c52a6@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84cc6341-a2c1-4e3c-8c9e-2bc6589c52a6@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_045723_090702_EFD5F19F 
X-CRM114-Status: GOOD (  21.33  )
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

On Mon, May 12, 2025 at 10:42:20PM +0200, Marek Vasut wrote:
> On 5/9/25 9:37 PM, Manivannan Sadhasivam wrote:
> > On Sun, Apr 06, 2025 at 04:45:21PM +0200, Marek Vasut wrote:
> > > Document 'aux' clock which are used to supply the PCIe bus. This
> > > is useful in case of a hardware setup, where the PCIe controller
> > > input clock and the PCIe bus clock are supplied from the same
> > > clock synthesiser, but from different differential clock outputs:
> > 
> > How different is this clock from the 'reference clock'? I'm not sure what you
> > mean by 'PCIe bus clock' here. AFAIK, endpoint only takes the reference clock
> > and the binding already has 'ref' clock for that purpose. So I don't understand
> > how this new clock is connected to the endpoint device.
> 
> See the ASCII art below , CLK_DIF0 is 'ref' clock that feeds the controller
> side, CLK_DIF1 is the bus (or 'aux') clock which feeds the bus (or endpoint)
> side. Both clock come from the same clock synthesizer, but from two separate
> clock outputs of the synthesizer.
> 

Okay. So separate refclks are suppplied to the host and endpoint here and no,
you should not call the other one as 'aux' clock, it is still the refclk. In
this case, you should describe the endpoint refclk in the PCIe bridge node:

		pcie@... {
			clock = <refclk_host>;
			...

			pcie@0 {
				device_type = "pci";
				reg = <0x0 0x0 0x0 0x0 0x0>;
				bus-range = <0x01 0xff>;
				clock = <refclk_ep>;
				...
			};
		};


and use the pwrctrl driver PCI_PWRCTRL_SLOT to enable it. Right now, the slot
pwrctrl driver is not handling the refclk, but I can submit a patch for that.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

