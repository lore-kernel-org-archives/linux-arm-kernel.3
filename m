Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DABEC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AbuqvrUxLbJimZLoZGxYgoQEqW8HaFtUtkBWapx+QpE=; b=4PSRkaP0k7wO8KCc5n2yxgixL3
	K5DgddHoVdemHOp8OnDnA8YOige4iNoYuIoL9QCa7L6MNxI8SDBZjrcloZs2s8dVWsyUg7UlSUBgx
	b3yPBSLVDUexXorYysYlShGIRX8V+Y9MOofAB7Llye9WOH9KaAK6EGJXdckuQNXc7T7ouyoDqJRZN
	HPr8Fk9NcuPFI36FKCOgEDrD6v4yrgUZnLsGUsuzeaj0VFVZKLbhAMxqpaBvmKjPEbcl0UFoobJ8I
	FLklYCESQ5TYHuWF1p6RK5gg8KWoEC//wgM9e0WW2PtanVZ/QRHVwHHySoiHnTn8OuaUhNTqSgyl7
	TQ6bBiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Pem-0000000CMfa-05dX;
	Tue, 01 Sep 2026 14:40:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Pek-0000000CMf3-0hAc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:40:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BBE9602D0;
	Tue,  1 Sep 2026 14:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E341F00A3A;
	Tue,  1 Sep 2026 14:40:04 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, hanzhijian <hanzhijian1991@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, 
 Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260822012205.2459806-1-hanzhijian1991@gmail.com>
References: <20260822012205.2459806-1-hanzhijian1991@gmail.com>
Subject: Re: [PATCH] PCI: imx6: fix pwrctrl device leak on PM runtime setup
 failure
Message-Id: <178827360391.66243.4223755160511839364.b4-ty@b4>
Date: Tue, 01 Sep 2026 16:40:03 +0200
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


On Sat, 22 Aug 2026 09:22:05 +0800, hanzhijian wrote:
> In imx_pcie_probe(), after pci_pwrctrl_create_devices() creates the
> pwrctrl devices, the error paths for imx_add_pcie_ep() and
> dw_pcie_host_init() both jump to err_pwrctrl_destroy to tear them down.
> However, the error path for devm_pm_runtime_set_active_enabled() returns
> directly, leaking the pwrctrl devices.
> 
> Jump to err_pwrctrl_destroy instead so the pwrctrl devices are cleaned
> up on this error path too.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: fix pwrctrl device leak on PM runtime setup failure
      commit: 0031f76f73b86f711d0e4e95a967aea1821fb867

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



