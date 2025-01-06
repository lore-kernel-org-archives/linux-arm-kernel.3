Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39A2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Si2BgBS96MX5JH7PxORJ/lrXYG0aQa4ucaLVQm7L3Sk=; b=oNUebk0kYAIQYejGRHbJtG3a7C
	ENI1SCJ5ba1gQlTIptQ1hm5qYYgK7w0cyFy2noYZMrbFRtCm5OIDTfltZF9XKbB0e9NcW4UE9WreO
	66+7MV+1hCIRF9Sy6OmJJ3bi4xkehRPt9/F+1iQrjvyKIw4kuzpMwVA4j3ApBYQaRE5tuCjDVkU2y
	32dJfPE1gjl8lKg6TlflURQiZ9cpe6f7FKq1uvBmy2ts27ea/S3f35vE9+gga666fUhWv+P+UsXP/
	O/I+CuwXIyP9R0crcmTLPLJQZ3J7lmzQDjZcdWkJg/0kZjug9gyAWydDFPQCa7zmFIiqGFNmlPmG2
	rmLAuQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUm0U-00000001AjA-3V6p;
	Mon, 06 Jan 2025 12:14:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUloh-000000017nc-2tuH;
	Mon, 06 Jan 2025 12:02:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1095D5C5E5F;
	Mon,  6 Jan 2025 12:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F3BC4CED2;
	Mon,  6 Jan 2025 12:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736164962;
	bh=8hbnYnhhNRS1odBlOsB2AFOK7uZwrgUA7KpMr9M2iM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QCnnh718JfWjisbFGKiHgltXcFr004DU7UAgvYqtPvUq2cA7TsG5gikaWdxwS1t6T
	 J8zbTN5MXEP90VKg5mPPF1NKz2GEohpWoLE3LCJx/F2ynWRYPMOFuxMp+mU8zvyRn+
	 z3G6FzJ96CrqcfV/h3Sd3p1ACarU+BkMcy1WyItlcUPEc9HGvasZFctrKEek6JlzEN
	 OPIJ43ALFRXCD0ZJfCZGK7mS5kNi6YHzKDtv7n+sOY0Uxu/Ijg7LpPzOv+S+7F0QJX
	 BTregMZBJCeuJTPNUbH8Syj/zS5QQxIpNiX2wwQwqacvQHH4uUnyLBqW10+2IEmTGl
	 zoZVZtc5m6Ezw==
Date: Mon, 6 Jan 2025 13:02:38 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
Message-ID: <Z3vGXrUIII4ixNnF@ryzen>
References: <20240809073610.2517-1-linux.amoon@gmail.com>
 <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
 <5a3e8fda-f9e4-4c2f-847b-93f521b8313b@lunn.ch>
 <CANAwSgSUuEvJb2Vn58o0i7Soo3jGzM8EYHvDtUTPxRHekCpruA@mail.gmail.com>
 <c94570db-c0af-4d92-935c-5cc242356818@lunn.ch>
 <CANAwSgQ_gojVxvi_OyHTyTSdzRrno=Yymn0AdEXyTHTgDTyFcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANAwSgQ_gojVxvi_OyHTyTSdzRrno=Yymn0AdEXyTHTgDTyFcA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_040243_818860_9C3ACB57 
X-CRM114-Status: GOOD (  32.95  )
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

On Mon, Jan 06, 2025 at 01:28:27PM +0530, Anand Moon wrote:
> Hi Andrew,
> 
> On Sun, 5 Jan 2025 at 23:27, Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Sun, Jan 05, 2025 at 11:16:21PM +0530, Anand Moon wrote:
> > > Hi Andrew,
> > >
> > > On Fri, 3 Jan 2025 at 21:34, Andrew Lunn <andrew@lunn.ch> wrote:
> > > >
> > > > > +&gmac1 {
> > > > > +       clock_in_out = "output";
> > > > > +       phy-handle = <&rgmii_phy1>;
> > > > > +       phy-mode = "rgmii";
> > > >
> > > > rgmii is wrong. Please search the archives about this topic, it comes
> > > > up every month. You need to remove the tx_delay and rx_delay
> > > > properties, and use rgmii-id.
> > > >
> > > According to the RKRK3588 TRM-Part1 (section 25.6.11 Clock
> > > Architecture), in RGMII mode,
> > > the TX clock source is exclusively derived from the CRU (Clock Request Unit).
> > > To dynamically adjust the timing alignment between TX/RX clocks and
> > > data, delay lines are
> > > integrated into both the TX and RX clock paths.
> > >
> > > Register SYS_GRF_SOC_CON7[5:2] enables these delay lines,
> > > while registers SYS_GRF_SOC_CON8[15:0] and SYS_GRF_SOC_CON9[15:0]
> > > are used to configure the delay length for each path respectively.
> > > Each delay line comprises 200 individual delay elements.
> > >
> > > Therefore, it is necessary to configure both TX and RX delay values
> > > appropriately
> > > with phy-mode set as rgmii.
> > >
> > > [1[ https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c#L1889-L1914
> > >
> > > I have gone through a few of the archives about this topic
> > >
> > > [2] https://lore.kernel.org/linux-rockchip/4fdcb631-16cd-d5f1-e2be-19ecedb436eb@linaro.org/T/
> >
> > O.K, let me repeat what i have said a number of times over the last
> > couple of years.
> >
> > phy-mode = "rgmii" means the PCB has extra long clock lines on the
> > PCB, so the 2ns delay is provided by them.
> >
> > phy-mode = "rgmii-id" means the MAC/PHY pair need to arrange to add
> > the 2ns delay. As far as the DT binding is concerned, it does not
> > matter which of the two does the delay. However, there is a convention
> > that the PHY adds the delay, if possible.
> >
> > So, does your PCB have extra long clock lines?
> >
> > Vendors often just hack until it works. But works does not mean
> > correct. I try to review as many .dts files as i can, but some do get
> > passed me, so there are plenty of bad examples in mainline.
> >
> >         Andrew
> 
> Thanks for this tip, I am no expert in hardware design.
> 
> Here is the schematic design of the board, it looks like RTL8125B page 24
> is controlled by a PCIe 2.0 bus

As both me an Manivannan said earlier in this thread,
PCIe endpoint devices should not be described in device tree
(the exception is an FPGA, and when you need to describe devices
within the FPGA).

So I think that adding a "ethernet-phy" device tree node in this case is
wrong (as the Ethernet PHY in this case is integrated in the PCIe connected
NIC, and not a discrete component on the SoC).


Kind regards,
Niklas

> 
> [0] https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock5b_v13_sch.pdf
> 
> PERSTB              ---<< PCIE_PERST_L (GPIO3_B0_u)
> LANWAKER        --->> PCIE20_1_2_WAKEn_M1_L (GPIO3_D0_u)
> LAN_CLKREQB  --->> PCIE20_1_2_CLKREQn_M1_L( GPIO3_C7_u)
> IOLATEB             --->> +V3P3A
> 
> PCIE2.0 DATA Impedance 85 R
> 
> PCIE_WLAN_TX_C_DP  ----->PCIE20_0_TXP
> PCIE_WLAN_TX_C_DN  ----->PCIE20_0_TXN
> 
> PCIE2.0 CLK Impedance 100 R
> 
> PCIE3_WLAN_REFCLK0_DP --> PCIE20_0_REFCLKP
> PCIE3_WLAN_REFCLK0_DN--->PCIE20_0_REFCLKN
> 
> I have no idea about the grf clk and data path delay over here.
> 
> Thanks
> -Anand

