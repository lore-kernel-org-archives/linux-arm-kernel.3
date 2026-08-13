Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E1CC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvPHHmHI14SY0fTv0VRBXJtvZvYcYfJJ4/XdJPHd378=; b=dq7/00Km3e89GIqYQVOZZzIlRd
	nJx3wMotX+Fb3z5rvPFHUvdZkE4VJhaaaBZIqP2bVz4rxKc/1yXYHBBu37K354+MAGoTdKiqipv39
	DwCANkTMfWLowCZKGl9LDGjlIC3SHXVMlO1RpFmEHWY3ihDwYUqWj8Q/U8LegCpKyWFixJekBVGzb
	8rJPcsRGqTFEPRoyC9TQmxBM3TEDTdIPV7UmFl8d9W3G4YDzMLMGM1ZPpnSVoBNIvakzSwJrXY29t
	/xSqtuPkcsBHYSeqlWYk+mRf0IMrouPZkIRj3+s19LD5Ma6Lv4A2v/OPoxplydSJIK9GKurHRshfw
	OKLRrZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuP6J-0000000HUcp-1tvR;
	Thu, 13 Aug 2026 06:39:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuP6I-0000000HUcV-1ZiY;
	Thu, 13 Aug 2026 06:39:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 920CA43C24;
	Thu, 13 Aug 2026 06:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4EF91F000E9;
	Thu, 13 Aug 2026 06:39:27 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: linux-pci@vger.kernel.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Anand Moon <linux.amoon@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Jesper Nilsson <jesper.nilsson@axis.com>, 
 Jingoo Han <jingoohan1@gmail.com>, Koichiro Den <den@valinux.co.jp>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Niklas Cassel <cassel@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
 Roy Zang <roy.zang@nxp.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Yuho Choi <dbgh9129@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20260728012548.465139-1-marek.vasut+renesas@mailbox.org>
References: <20260728012548.465139-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH 0/2] PCI: dwc: Handle return value from endpoint
 .init/.preinit callbacks
Message-Id: <178660316742.413588.14087680266052241971.b4-ty@b4>
Date: Thu, 13 Aug 2026 08:39:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Tue, 28 Jul 2026 03:24:23 +0200, Marek Vasut wrote:
> This is a trivial preparatory change which allows checking
> the struct dw_pcie_ep_ops .init/.pre_init return values.
> 
> Currently only the Layerscape PCIe controller benefits from this as
> its ls_pcie_ep_init() may fail in dw_pcie_ep_get_func_from_ep() call,
> but the Renesas R-Car Gen5 will benefit from this next.
> 
> [...]

Applied, thanks!

[1/2] PCI: dwc: Handle return value from endpoint .init callback
      commit: face365457413173d4ef4baf887e93b3e3edd805
[2/2] PCI: dwc: Handle return value from endpoint .pre_init callback
      commit: c1366b72ad4e87be60b57b74635a3a0bc58d2b0b

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



