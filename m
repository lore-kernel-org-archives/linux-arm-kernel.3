Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091A7C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 11:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxppJmf9UDttPWLLLNWxW9/hdmIXIIsGflBYvlk55PI=; b=yuXydcfD7WU/4+aU5LPmBESAhX
	NQ7Hn4hnmPLbuDWr+0rdA6jOaN7HW/4xzGtqeA+JludvSrOS3K1MsKG+NwRc3GrWNVSc7kXqvZnw+
	6dU3b9WY8olDnW/qUNSEvNB+g7gdSul5rLlYV1/jo3IQkqk5R1i8XepZy7//eq/b5m56BwoxR54VW
	nJWID1KP0Kc1+Ut3CJIw9j4eSUfwDyFxQQzBCz0iSsCXan/wBsKKHCuLff9PZg3QMyM4YA1oyXs6D
	6u6a/FHRsxkbVihs9TyAnLXukuvX1AjAivdb0+Dwp4DQ2oQ8xChuPHhuKdreV4TIzeJsG1PJrV6qf
	Or1pc0fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWrT-00000000QCB-3NKF;
	Thu, 15 May 2025 11:34:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWnF-00000000PLp-3kCA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 11:30:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso8297655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 04:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747308628; x=1747913428; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cxppJmf9UDttPWLLLNWxW9/hdmIXIIsGflBYvlk55PI=;
        b=Ce1SSJ3WB9aXa3p8eddahH6MTftNIo/IK2IXytLu4zqI/7oiU1vMCHTKKMFk6IKh6y
         ch1QHaH4S0dNQyv7SqDAAhThEe+WZVsZbguHl8I/nyjkjRjEBvvr4B0mHRKX/Qk2RRCL
         NqORqVOs3JMC+hCgE6libm8Mfd/lrjqI9TqNYeynmfXR7JbSXXxRtaEypLmdrdsoVGRe
         e9Ux5Y1TQM9UWUVHdBCxJghaq6rF7gShyoI/qgwZLB2+4keNAETpR/mV19sRCZOHznDF
         1ouJndTxorkEGuzT7EruJrhKrW/yo0Pc9lK2zvJURfSgUaK4filtk2zTZMLFKX1AKB49
         Hiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308628; x=1747913428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxppJmf9UDttPWLLLNWxW9/hdmIXIIsGflBYvlk55PI=;
        b=KmKzGDFyXbJPcaC5jWw4iTJyKYFmkIHGroTt5SiUc4XYygu4LxN7NJonP/pYVajv8d
         QpZOSy/A3MWTjo9wFEJkE6CGraMvhLLBpJD+U7Zfy3TRYoDox408qq4aOqSqLkbXOpLW
         9R5WPoKOyQxlWWkM1uLMMfVNNSunE73A06RBGQa3O3GiYOHanDnFXccu3Yxk7NA3SEvi
         MxSsrJ/vqKuwuSdq3SNiS3+UFoy7HwxeNJ6D5roR06jv54oaMjBUBh/BIT5bS/NHlMHK
         0PJ2iWpzyoFQ2QLiVW6H6YylnFpVhkf4sf5Vfq1h73GylOLlKVZbcqTjhpmKiyU7NvJk
         4ssQ==
X-Forwarded-Encrypted: i=1; AJvYcCV98FF8NbiEDg6HG1SfNHx6MwBJUhzq+8IszJRhFKhqlVEYPJFCxez1w89Q6kqkhCzGc/++YT9KLMeLtwa5d+Ec@lists.infradead.org
X-Gm-Message-State: AOJu0YwqN3kUj5EEmdCBBZZLqxzh2734WQlLn37k6wnHK5KXdOKksp4z
	l7aIQRUKbYg17PvqzAPnGgEAnh9vOxEjpUFtoQSZsKC9aj5aIaE8EqQK92vW0w==
X-Gm-Gg: ASbGncs7v/+4hUbwB1EN2inkEmRsGpIFIPzP9KrEVcIyvzi9qG0nYjfy4+CeFiZ/W9U
	KMRO5MVEqt02TMq11jg7oZoUypbZkos4OhjjiUrLn6JcW2Z6ZJu+KeSO+Af0hImcR5owM4IwWFo
	ZNRNUkzqZ+HlLcF3a9ozRuVR5ocPPUulFCNjZqDgNDlEMqNHyVCaC5UsKVjurYXbNW+HRiVQNTe
	gAz59SQCDUENSHW9Y4XsvoCq3OvMXUlpTm0ZuzQCkisNBSaNCGflT9tQaWi69060vpzV0VgmCND
	SQBSweDS8UJry69BBjQ/LNAN9QmhAwhJ0sqDssjw09weaQ8b1zzErmejajJtMzOEQ/SmlBxjpj9
	SdE/F9GDihfYuqQ==
X-Google-Smtp-Source: AGHT+IFjyhky0WjJzQJQ5Ed1Oysv28o+Tx9PsLGNR0Eb6F+Ar6MSQ3hQvGlBY2Vc8Vp6DQEa27in4A==
X-Received: by 2002:a5d:5983:0:b0:3a1:f6fd:63fc with SMTP id ffacd0b85a97d-3a34994b188mr6493795f8f.47.1747308628493;
        Thu, 15 May 2025 04:30:28 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a22ea7a53asm10520669f8f.23.2025.05.15.04.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 04:30:27 -0700 (PDT)
Date: Thu, 15 May 2025 12:30:24 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, p.zabel@pengutronix.de, 
	thippeswamy.havalige@amd.com, shradha.t@samsung.com, quic_schintav@quicinc.com, 
	cassel@kernel.org, johan+linaro@kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/9] Add STM32MP25 PCIe drivers
Message-ID: <ey7s64iavsb64eavu7i55b7nflqexn7nb65wcrlrqgo63mv6jt@ueut7quj6qpp>
References: <20250514091530.3249364-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250514091530.3249364-1-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_043029_962667_BD9E2B8F 
X-CRM114-Status: GOOD (  22.56  )
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

On Wed, May 14, 2025 at 11:15:21AM +0200, Christian Bruel wrote:
> Changes in v9:
>    - Describe atu and dbi2 shadowed registers in pcie_ep node
>    Address RC and EP drivers comments from Manivanna:
>    - Use dev_error_probe() for pm_runtime_enable() calls
>    - Reword Kconfig help message
>    - Move pm_runtime_get_noresume() before devm_pm_runtime_enable()

Please do not post the next revision without resolving all the comments for the
previous one. It just adds more noise.

- Mani

> 
> Changes in v8:
>    - Whitespace in comment
>    
> Changes in v7:
>    - Use device_init_wakeup to enable wakeup
>    - Fix comments (Bjorn)
> 
> Changes in v6:
>    - Call device_wakeup_enable() to fix WAKE# wakeup.
>    Address comments from Manivanna:
>    - Fix/Add Comments
>    - Fix DT indents
>    - Remove dw_pcie_ep_linkup() in EP start link
>    - Add PCIE_T_PVPERL_MS delay in RC PERST# deassert
>    
> Changes in v5:
>    Address driver comments from Manivanna:
>    - Use dw_pcie_{suspend/resume}_noirq instead of private ones.
>    - Move dw_pcie_host_init() to probe
>    - Add stm32_remove_pcie_port cleanup function
>    - Use of_node_put in stm32_pcie_parse_port
>    - Remove wakeup-source property
>    - Use generic dev_pm_set_dedicated_wake_irq to support wake# irq
>    
> Changes in v4:
>    Address bindings comments Rob Herring
>    - Remove phy property form common yaml
>    - Remove phy-name property
>    - Move wake_gpio and reset_gpio to the host root port
>    
> Changes in v3:
>    Address comments from Manivanna, Rob and Bjorn:
>    - Move host wakeup helper to dwc core (Mani)
>    - Drop num-lanes=<1> from bindings (Rob)
>    - Fix PCI address of I/O region (Mani)
>    - Moved PHY to a RC rootport subsection (Bjorn, Mani)
>    - Replaced dma-limit quirk by dma-ranges property (Bjorn)
>    - Moved out perst assert/deassert from start/stop link (Mani)
>    - Drop link_up test optim (Mani)
>    - DT and comments rephrasing (Bjorn)
>    - Add dts entries now that the combophy entries has landed
>    - Drop delaying Configuration Requests
> 
> Changes in v2:
>    - Fix st,stm32-pcie-common.yaml dt_binding_check	
> 
> Changes in v1:
>    Address comments from Rob Herring and Bjorn Helgaas:
>    - Drop st,limit-mrrs and st,max-payload-size from this patchset
>    - Remove single reset and clocks binding names and misc yaml cleanups
>    - Split RC/EP common bindings to a separate schema file
>    - Use correct PCIE_T_PERST_CLK_US and PCIE_T_RRS_READY_MS defines
>    - Use .remove instead of .remove_new
>    - Fix bar reset sequence in EP driver
>    - Use cleanup blocks for error handling
>    - Cosmetic fixes
> 
> Christian Bruel (9):
>   dt-bindings: PCI: Add STM32MP25 PCIe Root Complex bindings
>   PCI: stm32: Add PCIe host support for STM32MP25
>   dt-bindings: PCI: Add STM32MP25 PCIe Endpoint bindings
>   PCI: stm32: Add PCIe Endpoint support for STM32MP25
>   MAINTAINERS: add entry for ST STM32MP25 PCIe drivers
>   arm64: dts: st: add PCIe pinctrl entries in stm32mp25-pinctrl.dtsi
>   arm64: dts: st: Add PCIe Root Complex mode on stm32mp251
>   arm64: dts: st: Add PCIe Endpoint mode on stm32mp251
>   arm64: dts: st: Enable PCIe on the stm32mp257f-ev1 board
> 
>  .../bindings/pci/st,stm32-pcie-common.yaml    |  33 ++
>  .../bindings/pci/st,stm32-pcie-ep.yaml        |  67 +++
>  .../bindings/pci/st,stm32-pcie-host.yaml      | 112 +++++
>  MAINTAINERS                                   |   7 +
>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  20 +
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        |  57 +++
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  21 +
>  drivers/pci/controller/dwc/Kconfig            |  24 +
>  drivers/pci/controller/dwc/Makefile           |   2 +
>  drivers/pci/controller/dwc/pcie-stm32-ep.c    | 411 ++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-stm32.c       | 364 ++++++++++++++++
>  drivers/pci/controller/dwc/pcie-stm32.h       |  16 +
>  12 files changed, 1134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
>  create mode 100644 drivers/pci/controller/dwc/pcie-stm32-ep.c
>  create mode 100644 drivers/pci/controller/dwc/pcie-stm32.c
>  create mode 100644 drivers/pci/controller/dwc/pcie-stm32.h
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

