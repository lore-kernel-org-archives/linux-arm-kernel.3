Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064C7CD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnQ9MPAYpd0fxk76rGMZS9hOaWFlYma1+sDSqr8GlGA=; b=pzTD1oSc8E3tHSiP64SF1C2cHv
	P6Vt8gheQe0nykkkYYDECOWgggfEQveVr/lrt852oKB4fiTi/3ggkKDYydm57K+bhaGl7Haa4nVOH
	RO8G8Kgh6fuJjePZrQHCD/fULmUDPqZJ9pQqHX1vg8kjxWREq+eXeC0YU1G7P6en19LkYew3su6Cj
	KipWdnF/IwfbJzn7m3UYZXkMRiNSXcXhB7ifxVt//fuYzYAB6a2I3eHVuzmqyrCkxZiZbcL2BiYdu
	e311GVAXXqTTJ3l4r8zVsJCAL48YuueXm9u1QUvP3SRVzurAlkn9ePhk8XNMrNbw59Z0Zc1pzExRo
	xRzEnplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTmz-0000000279n-05Rt;
	Fri, 19 Jun 2026 07:37:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTmx-0000000279h-3oSb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:37:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EB65444D1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 07:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194E61F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 07:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781854639;
	bh=YnQ9MPAYpd0fxk76rGMZS9hOaWFlYma1+sDSqr8GlGA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=g1f9jlX8G5K3xqMhw6dOWrgEVlni/Ezpn3Gza1D7DzGz0+7SPYXkoDwsul1rCZfLI
	 k0YFuXUB8ijYEzn9d5zccJ0oK/9KcY45dhv9S9C+lUZWfIiBDLNAmCUIQmzlWTUXUN
	 VskVK7wvA+0hx7VsjwUVDIdsgSyWBofCtMb3QCZSPxMHlOpjlzgW4njp9RxNNLo0Tc
	 IVf4G7xIioy+BPMzuKeLDioPxtCFnUg8AZz8uMolB6SLW+pNRVhLyS0Wv8uTmqVqlN
	 x5FMNQaWiEdbz0mZ9qW0kCQuUdkw9q8PuCwtxyB0oW7H/iDHnnOQ5ZzQagMa5QaQTf
	 DBLBbu7uIto5A==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ad49da7123so1586547e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:37:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+jpht2TdcjW2Dx0E69E+mH2unnIGG2TSpOPEWhqXg8ID7o9NbT7tikHn9XhRH29wrgTHjR0vdf8xaejZaAgbUV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrz52qyXK4YxXXtzeK6hgvMKAJqy6qc66VOe3UFSNXvhzlQPOP
	xIHUqnwjTsNnrWsDtEcjxSTiUTDAmNoSZxvjWL6Zi3SWz6AXvN2JN4fI/0FRN2gD+pb9ae1Abz3
	c2EhI2CYh21Bzv6RzNnjBeRQRPOk8Tm/PeNgWKngQTQ==
X-Received: by 2002:a05:6512:61c5:20b0:5a8:73c2:c90b with SMTP id
 2adb3069b0e04-5ad57229d41mr401564e87.20.1781854637750; Fri, 19 Jun 2026
 00:37:17 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 02:37:15 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 02:37:15 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260618101047.4185497-1-sherry.sun@oss.nxp.com>
MIME-Version: 1.0
References: <20260618101047.4185497-1-sherry.sun@oss.nxp.com>
Date: Fri, 19 Jun 2026 02:37:15 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfsNa4itdpyGtR16wMb+wMkJwg+9=QJF2-oOoVVfFCF3g@mail.gmail.com>
X-Gm-Features: AVVi8CfCeqYM86-ykNLbU8hxtvU1LP7wSiVMnCr70BLSiKSY_mF23r-WT1fp8gY
Message-ID: <CAMRc=MfsNa4itdpyGtR16wMb+wMkJwg+9=QJF2-oOoVVfFCF3g@mail.gmail.com>
Subject: Re: [PATCH 0/8] Add PCIe M.2 Key E connector support for NXP i.MX boards
To: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, sherry.sun@nxp.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	amitkumar.karwar@nxp.com, neeraj.sanjaykale@nxp.com, marcel@holtmann.org, 
	luiz.dentz@gmail.com, hongxing.zhu@nxp.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	bhelgaas@google.com, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 18 Jun 2026 12:10:39 +0200, "Sherry Sun (OSS)"
<sherry.sun@oss.nxp.com> said:
> From: Sherry Sun <sherry.sun@nxp.com>
>
> This series adds support for NXP Wi-Fi/BT combo chips (88W9098, AW693)
> inserted into PCIe M.2 Key E connectors on several i.MX EVK/MEK boards.
>
> For M.2 cards that rely on PCIe L2 link state and wake-up mechanisms, the
> card must remain powered during suspend. Patch 1 uses the existing
> dw_pcie_rp::skip_pwrctrl_off flag to skip power-off during suspend and skip
> power-on during the init path.
>
> Alsp the btnxpuart driver is extended to obtain a pwrseq descriptor via the
> OF graph on the UART controller device in patch 2.
>
> Sherry Sun (8):
>   PCI: imx6: Add skip_pwrctrl_off flag support
>   power: sequencing: pcie-m2: Add PCI ID for NXP 88W9098 and AW693
>     Bluetooth

Can this be applied independently without build-time issues?

Bart

>   Bluetooth: btnxpuart: Add M.2 Bluetooth device support using pwrseq
>   arm64: dts: imx8mq-evk: Describe the PCIe M.2 Key E connector
>   arm64: dts: imx95-19x19-evk: Describe the PCIe M.2 Key E connector
>   arm64: dts: imx8dxl-evk: Describe the PCIe M.2 Key E connector
>   arm64: dts: imx8qm-mek: Describe the PCIe M.2 Key E connector
>   arm64: dts: imx8qxp-mek: Describe the PCIe M.2 Key E connector
>
>  arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 56 +++++++++++++-----
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts  | 44 ++++++++++++--
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 58 ++++++++++++++-----
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 54 ++++++++++++-----
>  .../boot/dts/freescale/imx95-19x19-evk.dts    | 55 +++++++++++++-----
>  drivers/bluetooth/btnxpuart.c                 | 33 ++++++++++-
>  drivers/pci/controller/dwc/pci-imx6.c         | 36 +++++++-----
>  drivers/power/sequencing/pwrseq-pcie-m2.c     |  4 ++
>  8 files changed, 264 insertions(+), 76 deletions(-)
>
> --
> 2.50.1
>
>

