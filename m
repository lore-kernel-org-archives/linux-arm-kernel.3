Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA4D1061B07
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOF3McKorP7VTGh3x2yrLA4/BnIsjXMpRz4887A+PYk=; b=RgzRhTxDkv+28B6+pZMNIvNhe3
	CwHa7MFQR5INw8R0ZPFJQd0lfFBnD3etqfYA9aoQw+bxV5hj2d+VWDQjgNmkHKpB6VjxeaXJwqcFl
	Nx5gILZelEw0OZAwxGvIFQtMKoeN38RTfBTGWCpjNxU/tAxDHMEFRrZi8a6cdQMBqRJxBMrTMCwfT
	bttR9pROYEdLgde2PxbwiT/gBo2djkSLBWxprsKuiW0zgyBKadRbx66TDikokuV77MhX9l/O4xm2W
	EoPT+5mv6WpPYMf9/COvtY2fJboFgNlGuhxWC2t4FRe2lnAfQ05qBSOSezUGKp/zWoMcMoxwHJ9HO
	I5XtGMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7E2Y-0000000BWev-47Fm;
	Mon, 30 Mar 2026 14:56:31 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7E2V-0000000BWeD-3a4u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:56:29 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82ae378fff8so2903555b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774882586; x=1775487386; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOF3McKorP7VTGh3x2yrLA4/BnIsjXMpRz4887A+PYk=;
        b=k/42ntIOu3zFhPntCshW+LCGJUtJk5/uOCZGxDfValH41JalEP3xzQ+Jf6PPmuq554
         eJ0ap6PnmMs+X09baYpCq/4KPXRD8pHxiXXo/aFReH26DJaaojEyCQqYZL8YEO/yvi4a
         Bit+kQLfTUXlhCkIWih7ehaRyyT6FCoraIZ6PTplOahVMzNc3he8unFgx1Dmp9Z5IOYZ
         ETXE9xCqqqDFtRybLWfgoVBamNqVxIg42TBfBdTksrh99cquviuinTGQ9/tNoRJSkd9S
         rEYDFVzWRwBvgDa6ibwzjiZqCCjGAJoZcQqodQ14es4M+d5d9JmyQ/nDXplJ/0NsN790
         rQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882586; x=1775487386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOF3McKorP7VTGh3x2yrLA4/BnIsjXMpRz4887A+PYk=;
        b=r4pEYXNTYKLhpDebGKYV/dQWuSUf0/Fv0aFulRw30MFi5V9vMePWd09aribvGncE4q
         0sbEwOM7Y5wQeDsg1J3o3bX9XbeC2+8d7fWF1sCmUD1gsnTxestp9QrwuoZvtSdPT2Rn
         rhfg7lHy8l9X45haSpf/X77GvZZV2N8Gd27ERQlsOvLEcmcxQpv93uwJeaT+Bq3M70Uy
         66/UnhcdkNWf3vO0fDkMSInYVmrK+zXWTFs3uHSOlBNNbEl6djKTRHa/YHdp596El7Xq
         XkWdYJMWE2wqgHpsTSk0AIZ+v/J/W37M8V1Px96fH88PPhOUDZnkSm78RtybD68UBAyF
         1dOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU29U/w3JYJ221jNgfrGDNs3vZk+IGhkx9E31b+6twEyRcDyb3w6EY5pX0PkKkiYdNQ/z248WttDnkM0aVsaO73@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5iksKpGhTrRES+xnYv/jVtch79MFazmRiRmJ2SN9msgBQD6cH
	X1uahZYrAigRuPlQQTBi24fVUtojtS0+VInZWrhBq/GOL67GEg8EyBP+/Cx1aNYRVkM=
X-Gm-Gg: ATEYQzy9KME6UfliiefBg7W8q8ot2A4e5xvjnMm0rcT/Pneyh3ulES7Pw15VVuA0n3j
	FSIsT9g1erJ78SoRqFYQr1xyiQS6OddWnDpzpTTc+WJc/dUz+1CX63fDVfG2eq9cKImBSRyI9TK
	VPB3Fep814vGNU1b9vH62pPfht+LdhVNN+zC088RgauhC6Tv/d3JGC4I8bgNWga2ZJymGH368hA
	V88gLCUUnLLrA3OgAySvEPC8FI+qX5rjVzHNIA/Smp7pl2kElvLT7MmkNgG3dJW6WGOA4xUT/wv
	Hdqf8BKqv3Jo+ZK0b57mjzQIya7zVBf80ACAKeqkThrO5MwV9/eiAjPllEGoTecZ4S7jG0qxumM
	ptC068gCQsvRAD7lBGOyf7Xmb8YvYUTsIdPgRmvFG3Zi4NiweIP1bgzocsOQLjuzlJrCo3f4ChT
	IjdCRyHR/b19slR7epJcVNLaFGFAc=
X-Received: by 2002:a05:6a00:ad03:b0:829:a590:6d0f with SMTP id d2e1a72fcca58-82c96087f4amr11583763b3a.58.1774882586297;
        Mon, 30 Mar 2026 07:56:26 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:51d0:8872:b109:d470])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8498779sm7540458b3a.25.2026.03.30.07.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:56:25 -0700 (PDT)
Date: Mon, 30 Mar 2026 08:56:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: Re: [PATCH v3 0/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Message-ID: <acqPFV005fH8qHpV@p14s>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_075627_898561_810B0B82 
X-CRM114-Status: GOOD (  26.91  )
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
Cc: Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>, devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Mar 18, 2026 at 04:13:06PM +0100, Markus Schneider-Pargmann (TI) wrote:
> Hi,
> 
> Split the firmware memory region in more specific parts so it is better
> described where which information is stored. Specifically the LPM metadata
> region is important as bootloader software like U-Boot has to know where
> that data is to be able to read that data and resume from RAM.
> 
> IO+DDR is a deep sleep state in which a few pins are set to be sensitive
> for wakeup while the DDR is kept in self refresh. Everything else is
> powered off.
> 
> The changes in this series were suggested as part of the IO+DDR u-boot series:
>   https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com
> 
> There are currently no real users of the memory-region that is split in
> this series. The size of the memory-region in total stays the same.
> The new layout is derived from the software running on the r5f
> processor:
>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd#L172
>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/source/drivers/device_manager/sciclient.h#L459
> 
> Additionally the two important devicetree nodes for resuming from IO+DDR
> have the bootph-pre-ram flag added as this data needs to be read before
> the RAM is in use.
> 
> Best
> Markus
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
> Changes in v3:
> - Squash the enforcement of the memory-region-names requirement in the
>   patch adding the memory-region-names, as suggested.
> - Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com
> 
> Changes in v2:
> - Make memory-region-names required if memory-region is present
> - Fixup memory-region and memory-region-names conditions. Require either
>   2 or 6 regions for memory-region and memory-region-names
> - Reword and restructure the binding documentation for memory-region and
>   memory-region-names
> - Add memory-region-names to all uses of memory-region
> - Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com
> 
> ---
> Markus Schneider-Pargmann (TI) (7):
>       dt-bindings: remoteproc: k3-r5f: Split up memory regions
>       dt-bindings: remoteproc: k3-r5f: Add memory-region-names

I have picked-up the above two.  The .dtsi files need to go through the TI
tree.

Thanks,
Mathieu

>       arm64: dts: ti: k3: Use memory-region-names for r5f
>       arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
>       arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
>       arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
>       arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase
> 
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 55 ++++++++++++++++++----
>  .../arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi |  1 +
>  .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      |  2 +
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 42 ++++++++++++++++-
>  .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      |  2 +
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 42 ++++++++++++++++-
>  .../arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi |  4 ++
>  .../arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi |  2 +
>  .../boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi      |  4 ++
>  .../boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi      |  6 +++
>  .../boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     |  6 +++
>  .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |  3 ++
>  .../k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi   |  8 ++++
>  13 files changed, 163 insertions(+), 14 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7
> 
> Best regards,
> -- 
> Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> 

