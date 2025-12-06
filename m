Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DCAD3ABC4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKJK/1vbn3UQHCzqMMe9+PhGMGn7Zr6PCz5ytRZ8gfY=; b=shI20+ObBpcSMH5Wpcv4ArG3ST
	pwipcNJk5AgHxZGQJPU9Zr9MdYdE5aSr2SVTgLst4c7TaVEp3vJGsEhVXuiXAQayx8i8+xpqLwpCO
	mK0c/UcvAe+kw4oVkQtY9FE2sbpi9H3IIrj6107iO0dEbgOtRUfs22IUDofKmsItIcDI6RRLRNxkj
	64VAI9zlxxZelV3TaiSh1k/n0r+KIa4YJ2LIq+vB9hSmtAcxpjKk9epcrJKSqHCVhj3jxvg+kxt4i
	xeYlJVnU1YoWQbi9XJv93oJlcss+91LPFWyI5Fx0QcJqeOjF8ETtYOy/guykO0em4fnOZzmYjB+fg
	Xb0G4kWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfqP-0000000ADeH-0IWb;
	Sat, 06 Dec 2025 00:08:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfqL-0000000ADde-3ZqN;
	Sat, 06 Dec 2025 00:08:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06D2A40229;
	Sat,  6 Dec 2025 00:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97FAC4CEF1;
	Sat,  6 Dec 2025 00:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764979688;
	bh=R7HsQDGBjcjXJ81DGGnBQnRnfKReTGHiJmsZwWhTh6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMarMEwPMDpFmOeAE6CeeAxtIrqgmlAO3jdHip31Ld+9XQox+jFZKJmkWBNUFYhOY
	 J7S6GEyYhVsXristA3lxrwkN/2idujDP6kV1nOLtAPb/yVsXB+hI7ec0g2XB08s9HP
	 61xlxNiWckbr4jPP0TM7nN3xlBE0ccvt6NqM548uJdtzfUzxt4sC+lYJzO+Plmk3tr
	 cbS1t+wmnVO6UKA+13SyT//0y2nxOD0zykoPZHAz8bDGvix8dC/AWUMJKbXLkPUMJG
	 qBMq3HaR7ezCM9BRmfIFxBKSnzNziHti3mhlf0Yv2u8M0IRsIym/CMdG+GKtb+9VS8
	 h2IQo5Tgu0UdQ==
Date: Fri, 5 Dec 2025 18:08:06 -0600
From: Rob Herring <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v6 0/7] Add ASPEED PCIe Root Complex support
Message-ID: <20251206000806.GA969079-robh@kernel.org>
References: <20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com>
 <20251204195355.GA1975043-robh@kernel.org>
 <SEYPR06MB5134D0D5911E3C86D869151E9DA7A@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134D0D5911E3C86D869151E9DA7A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_160809_914053_89115E85 
X-CRM114-Status: GOOD (  14.30  )
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

On Fri, Dec 05, 2025 at 12:12:35AM +0000, Jacky Chou wrote:
> Hi Rob,
> 
> Thanks for your comments.
> 
> > > Changes in v6:
> > > - Refer to pci-cpi-bridge.yaml to update aspeed,ast2600-pcie.yaml and
> > >   the pcie node of aspeed-g6.dtsi.
> > 
> > Where is this? You don't describe the root port and its properties at all now.
> > 
> 
> May I confirm whether the pcie@8,0 in aspeed-g6.dtsi is not considered the 
> root port? From my understanding, that node represents the root port, so I 
> want to make sure I'm aligning with your expectation before updating the binding.

I believe you told me it was the root port.

> Could you help clarify how you would like the root port and its properties to 
> be described in the schema?

properties:
  pcie@8,0:
    $ref: /schemas/pci/pci-pci-bridge.yaml#
    unevaluatedProperties: false

    properties:

And then add all the properties you have which are not defined in 
pci-pci-bridge.yaml (and pci-device.yaml by reference) (i.e. clocks, 
resets, phys, etc.).

Rob

