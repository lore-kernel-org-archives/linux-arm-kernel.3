Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E0DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHV/wkqrDcN+ul9zd+D/ndl8jlSi87LrEnOqwLNbzyM=; b=hxKcuOnKOPs3k3FyfAHj4EKRsh
	EEcNszin0J4aXGgvnv29ARyG3eHWvpkyxgvDqaQeUR0Wz2TX8aT9g/FEQJ5E7j1M6AEn+jxKhRAKQ
	mccScXTgy3EuDVUhDKYgYmT00ycny08Of8SsBdd8a5gyLMvnh5G3bRuroaJ1abOQnUFOcimerjpkf
	NVdRWsVnp1CX+vxpXVpY9sxLPIPwarao4YixCzzPndORrFulhAGYIr0ldR7SfCy7+3WbQRFDi4vEZ
	cuiKTXpTJatginZscaZZwqa/j/IUnEDFUTPBQLfjHJ4+TeND/QdNvmeHwdFuYXTOgM+PVGvkdzUMG
	gX1ibx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVfm-00000009jlM-4Atk;
	Wed, 25 Jun 2025 19:20:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQCG-00000008oPV-29vP;
	Wed, 25 Jun 2025 13:29:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 939C5A5262C;
	Wed, 25 Jun 2025 13:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFDCC4CEEE;
	Wed, 25 Jun 2025 13:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750858191;
	bh=1XnOVUk2FHxr2/AMNsDMwgOAlwlX7mRmXj/UKnoVNGI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WL9Xp+WKv90uVhgXxY6pmrgba9Ie/AiqM+WGlsv63ZFh9prR19mLn7slDOJu/vmbs
	 MnFavOPUHIzben83ZttjjVPbj91bIj6eF2Itwhxsi4reYmn9bb2qIEAKRjLb1uCvYN
	 j1DIToRLeHwHmG1Bqy+g+o7O0QfmsRBwTX41jAO6SVJ2XQDXxyCeO4Z5RQm8COlotj
	 K1R5Ou+0bJG8z0lgKskK0tRl/B2r2uH0lXj8IIq0zNSNVhq43dmE743lib3ppWU2vx
	 Z0wb4u3J3FM5bsl58wknhCwIxWGvR5zMThNWTlbvZQDADKnBBD2Aa/0z9WEbW+uP9L
	 AIUdieur8/RiA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, 
 Kevin Xie <kevin.xie@starfivetech.com>, Simon Xue <xxm@rock-chips.com>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Stanimir Varbanov <svarbanov@mm-sol.com>, Niklas Cassel <cassel@kernel.org>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Laszlo Fiat <laszlo.fiat@proton.me>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20250625102347.1205584-9-cassel@kernel.org>
References: <20250625102347.1205584-9-cassel@kernel.org>
Subject: Re: [PATCH v4 0/7] PCI: dwc: Do not enumerate bus before endpoint
 devices are ready
Message-Id: <175085818998.6505.2530660642460588895.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 07:29:49 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_062952_621432_D4412542 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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


On Wed, 25 Jun 2025 12:23:46 +0200, Niklas Cassel wrote:
> The DWC PCIe controller driver currently does not follow the PCIe
> specification with regards to the delays after link training, before
> sending out configuration requests. This series fixes this.
> 
> At the same time, PATCH 3/7 addresses a regression where a Plextor
> NVMe drive fails to be configured correctly. With this series, the
> Plextor NVMe drive works once again.
> 
> [...]

Applied, thanks!

[1/7] PCI: Rename PCIE_RESET_CONFIG_DEVICE_WAIT_MS to PCIE_RESET_CONFIG_WAIT_MS
      commit: 817f989700fddefa56e5e443e7d138018ca6709d
[2/7] PCI: rockchip-host: Use macro PCIE_RESET_CONFIG_WAIT_MS
      commit: bbc6a829ad3f054181d24a56944f944002e68898
[3/7] PCI: dw-rockchip: Wait PCIE_RESET_CONFIG_WAIT_MS after link-up IRQ
      commit: c7eb9c5e1498882951b7583c56add0b77bfc162e
[4/7] PCI: qcom: Wait PCIE_RESET_CONFIG_WAIT_MS after link-up IRQ
      commit: 15b6b243cc2b1017cf89e2477aa0b4e1a306a82a
[5/7] PCI: dwc: Ensure that dw_pcie_wait_for_link() waits 100 ms after link up
      commit: 80dc18a0cba8dea42614f021b20a04354b213d86
[6/7] PCI: Move link up wait time and max retries macros to pci.h
      commit: d7467bc72ce4e3f64062017d6c9ae3816e8a7b0e
[7/7] PCI: Reduce PCIE_LINK_WAIT_SLEEP_MS
      commit: 470f10f18b482b3d46429c9e6723ff0f7854d049

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


