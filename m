Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492B1CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 05:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bb9BFU+tpEf23jDV6mWRZSZIrfp5E5QZk6jdr2Nh69s=; b=Mxnfsgt3dxrBsmpLKtU1KF6s5Y
	iFs9+9+hHyTsudAdOY5m/JYSl3hQjji+KsO/BdwQMrJK02zgCa9wt98mOFI4wgNSrltn/ZsPHu0Sm
	bPiQeSktg8EDYprnsEuDIQlveWg4Yy3DlpPJkBsr4dwQsTGFWeSlE16yyRGevWoSjk8DVrcfzoXdA
	eh9SEYu3d/Eikzu85b3PFB/Do43T/dK6Yl7yOl4hZU5ptTQvADG5zfzwR3KL/GISaLVhgb3t4k49m
	1wOq2mQ4N1w5fMzj5YVfwTutFqwtVsy8LoX8qYFzGxd8/lk9a+REM6Pr4fjqJv17DbwlOWU/bKyHr
	QjAXWnTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urrJd-00000004TEF-0fo2;
	Fri, 29 Aug 2025 05:06:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urrGt-00000004Stq-2PY3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 05:03:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45b7d497abaso7408135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 22:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1756443810; x=1757048610; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bb9BFU+tpEf23jDV6mWRZSZIrfp5E5QZk6jdr2Nh69s=;
        b=k0w5BGAaLFrDqr3o/+eTqUUxPIIeJsnLdM0FMMmh+sJO8hpJ+DcI5GwJX7zaApINpy
         2l61m0dieq++pail0QxeV6iozGLtWInDQO97jEPzINLmUonvkjGq3hFcuj+pHkabBL16
         tLcQCw8hqF7DSMcUQApzQ0e2/kHTz4bO2jtTbst7QWa15SFlDTaakmMRcsxi7GavHKRJ
         /KbMVWHqyQwa5E9IwpW/1h4QbDHYCIXdqvxUgOxGMMbHT+N1AyU3FDkVmgWAd1rQW+ec
         BhrkxEmClnc4MrxmpJHSaYfvyR+/t1jMUT7l0yp+Qt45XmM9S1gtErUaJxZfzfRbs5qU
         vmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756443810; x=1757048610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb9BFU+tpEf23jDV6mWRZSZIrfp5E5QZk6jdr2Nh69s=;
        b=g9MLMvhXtsjKuYrFO9QpwUq4SKYcSz8MbAS954d6x1iEUiX7W5ccDknzL6UquX5HqB
         2s6GlNCOwO+evaktVz3RGsbfM9+FEWc3MRycPNpE+EOeCCfsnXssPJIK/IILSIyuJAqF
         pm4DruQjDy/GDAueSeCrzbAfBNC8X73AUxJrRA2uakWZ6AFWL91ksSB1TEssvvLN9EKF
         +RX6Nnu6GHQcKB3hyKf75+KkXM3StakGzn9W6klnl4N+doo2STvmw2LUSMbYoKDstXoH
         NJbc/jIRljkH9P9qXgUYZXn/oORFT2Mrt1B2UQmw9JhpFTXgN6vpCkJXxOkoipQlUhuG
         NGQA==
X-Forwarded-Encrypted: i=1; AJvYcCVgWu4fE1MB/bXlM38FOZHgeK6I+bQNTNPqVgodl07pQjUfPtDoh4C9Aj2GzyM0MFzwWc4T+kttnMUIuy682lpE@lists.infradead.org
X-Gm-Message-State: AOJu0YwSPwoE1Aq5aoPMwBVz0YHmvMyX0Nr5E6VD87R1SWY29rVUNwl5
	sd58sQ3HPO8eh1xTiajCoFLBkDPm7N/EcCsu/vstGopYNh2M3hqMSFX5Ff6UcGoRQkE=
X-Gm-Gg: ASbGncuLmwXcnJa2TlldGYOtBVXd3eeFB8i1tua2wpEJWDnOJSlWWwMyA0KxTfW04/M
	JxfNEmJSz1CjufUS7ZBQVMcfK0lR+npmHZTgIz7gRKOOFlB6r9kQWZU2/oobxANwXbagij9YfPe
	c9Q53opCz1pORopUXtgQ4xMqeMxHM73U9Yhki3l8oFTcEeaSawsPRW4EJA9Cujg5+OHNbOGk4zX
	35P/gYIS4XgPBXyksEYhMu7NvnGwUUoBi64f2NR9hV8igusV61mNd5I3sdMg7lWS69MqyczQI3G
	OaC807VIWJx+sAZJ8kUMtagpdZlbLmSzYPEXDYD6dKUJp4cZv1X765Ks0ILAowAeb7xQ7cSRQPA
	hS+tlHjndn+gp8v3WmpSjbedHdlmmqCxn4EX2au/4mVIpJt4yGgbVpqu6Bjf7Dxfl7liem6T6t4
	0GypDMbKR+M3Uv
X-Google-Smtp-Source: AGHT+IFVd6qIssetNf0PlgYJI19qTYNEIHf0vWYP6G6M987Vw9zUraqTXmyhlT/MrqFSPHzJ1uz73g==
X-Received: by 2002:a05:600c:3544:b0:45b:7c4c:cfbf with SMTP id 5b1f17b1804b1-45b7c4cd1e7mr35520595e9.23.1756443809583;
        Thu, 28 Aug 2025 22:03:29 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:6103:4200:a4c6:4e84:e72c:19fd? ([2a02:2f04:6103:4200:a4c6:4e84:e72c:19fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b66bbcf19sm66990015e9.4.2025.08.28.22.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 22:03:29 -0700 (PDT)
Message-ID: <27d76eac-6141-45db-a347-edfc3bb593d4@tuxon.dev>
Date: Fri, 29 Aug 2025 08:03:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Add
 documentation for the PCIe IP on Renesas RZ/G3S
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250828193605.GA957994@bhelgaas>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20250828193605.GA957994@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_220331_624907_5542B928 
X-CRM114-Status: GOOD (  14.42  )
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

Hi, Bjorn,

On 8/28/25 22:36, Bjorn Helgaas wrote:
> On Thu, Aug 28, 2025 at 10:11:55PM +0300, claudiu beznea wrote:
>> On 8/8/25 14:25, Claudiu Beznea wrote:
>>> On 08.07.2025 19:34, Bjorn Helgaas wrote:
>>>> On Fri, Jul 04, 2025 at 07:14:04PM +0300, Claudiu wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> The PCIe IP available on the Renesas RZ/G3S complies with the PCI Express
>>>>> Base Specification 4.0. It is designed for root complex applications and
>>>>> features a single-lane (x1) implementation. Add documentation for it.
>> ...
> 
>> Renesas HW team replied to me that there are no clock, reset, or interrupt
>> signals dedicated specifically to the Root Port. All these signals are
>> shared across the PCIe system.
>>
>> Taking this and your suggestions into account, I have prepared the following
>> device tree:
>>
>> pcie: pcie@11e40000 {
>> 	compatible = "renesas,r9a08g045-pcie";
>> 	reg = <0 0x11e40000 0 0x10000>;
>> 	ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>;
>> 	/* Map all possible DRAM ranges (4 GB). */
>> 	dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0x1 0x0>;
>> 	bus-range = <0x0 0xff>;
>> 	interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
>> 		     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
>> 	interrupt-names = "serr", "serr_cor", "serr_nonfatal",
>> 			  "serr_fatal", "axi_err", "inta",
>> 			  "intb", "intc", "intd", "msi",
>> 			  "link_bandwidth", "pm_pme", "dma",
>> 			  "pcie_evt", "msg", "all";
>> 	#interrupt-cells = <1>;
>> 	interrupt-controller;
>> 	interrupt-map-mask = <0 0 0 7>;
>> 	interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INTA */
>> 			<0 0 0 2 &pcie 0 0 0 1>, /* INTB */
>> 			<0 0 0 3 &pcie 0 0 0 2>, /* INTC */
>> 			<0 0 0 4 &pcie 0 0 0 3>; /* INTD */
>> 	clocks = <&cpg CPG_MOD R9A08G045_PCI_ACLK>,
>> 		 <&cpg CPG_MOD R9A08G045_PCI_CLKL1PM>;
>> 	clock-names = "aclk", "pm";
>> 	resets = <&cpg R9A08G045_PCI_ARESETN>,
>> 		 <&cpg R9A08G045_PCI_RST_B>,
>> 		 <&cpg R9A08G045_PCI_RST_GP_B>,
>> 		 <&cpg R9A08G045_PCI_RST_PS_B>,
>> 		 <&cpg R9A08G045_PCI_RST_RSM_B>,
>> 		 <&cpg R9A08G045_PCI_RST_CFG_B>,
>> 		 <&cpg R9A08G045_PCI_RST_LOAD_B>;
>> 	reset-names = "aresetn", "rst_b", "rst_gp_b", "rst_ps_b",
>> 		      "rst_rsm_b", "rst_cfg_b", "rst_load_b";
>> 	power-domains = <&cpg>;
>> 	device_type = "pci";
>> 	#address-cells = <3>;
>> 	#size-cells = <2>;
>> 	renesas,sysc = <&sysc>;
>> 	status = "disabled";
>>
>> 	pcie_port0: pcie@0,0 {
>> 		reg = <0x0 0x0 0x0 0x0 0x0>;
>> 		ranges;
>> 		clocks = <&versa3 5>;
>> 		clock-names = "ref";
>> 		device_type = "pci";
>> 		vendor-id = <0x1912>;
>> 		device-id = <0x0033>;
>> 		bus-range = <0x1 0xff>;
> 
> I don't think you need this bus-range.  The bus range for the
> hierarchy below a Root Port is discoverable and configurable via
> config space.

Thank you for the pointer. I'll update and send a new version.

Claudiu



