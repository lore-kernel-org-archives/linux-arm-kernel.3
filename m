Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9673CCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 03:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/mOHkyVCGlpZGPK0VdOwC9RDdilpu9JCgLw5m5Dy4Y=; b=0phaeQlebjiIh3cjaSZRO94KbS
	HEm2AJxJwpF/A6XhkGkS9oPz5zUiHLVWLLIW9+CFV7M3GHgPBjYq+K8WZgwgQBKJDnPgG4hrpuNgi
	+53uV1dJZKMbK88vHBSNs8+gG2s21hzQLpOw0Ot7tUyVA9A4FGDztQODmmxhvEugnE0+5E+dfSPuL
	EiW4HIGQi+WKXpc3KdKGoRbSKajsSdh4vyEpmS001RkZ2H67U2SBOh95LW+hQIfVqmd9MhvhkLwN/
	Z2TsaJeLbybE1YM4ci17hO9mQhoYSmmEY1gh48S+mjAYJiP6X7kwDMTrgFzrspjsfywTBC8IAV5IG
	2/fV0s2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKq94-0000000FO8W-2bkZ;
	Mon, 17 Nov 2025 03:43:14 +0000
Received: from mail-m3269.qiye.163.com ([220.197.32.69])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKq91-0000000FO7F-2HOp;
	Mon, 17 Nov 2025 03:43:13 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29c9004d4;
	Mon, 17 Nov 2025 11:42:59 +0800 (GMT+08:00)
Message-ID: <8f3cc1c1-7bf7-4610-b7ce-79ebd6f05a6e@rock-chips.com>
Date: Mon, 17 Nov 2025 11:42:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johan Jonker <jbx6244@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/3] PCI: rockchip: 5.0 GT/s speed may be dangerous
To: Geraldo Nascimento <geraldogabriel@gmail.com>
References: <cover.1763197368.git.geraldogabriel@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <cover.1763197368.git.geraldogabriel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a8fe8a40409cckunm2225600d70b383
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk9ISFZDHx8aThpIQxkdTU1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=iqz49SGWasZFgXzvmpgvrAR/MiWOraupVXaPEaboWVYCcb/RkncHqs1bDxk236bb5xLnrZpa/O9g9zIVR3QitzVvwYdmqnu25XhHXnG5UGEq/cJdWiS4vzlPE29CJQ8C9imQcmwuPVBFSZsuTZaZ61zjdE1XET97PRp2eNCjBec=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=L/mOHkyVCGlpZGPK0VdOwC9RDdilpu9JCgLw5m5Dy4Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_194312_071591_CAFB7BC8 
X-CRM114-Status: GOOD (  12.22  )
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

Hi Geraldo,

在 2025/11/15 星期六 17:10, Geraldo Nascimento 写道:
> In recent interactions with Shawn Lin from Rockchip it came to my
> attention there's an unknown errata regarding 5.0 GT/s operational
> speed of their PCIe core. According to Shawn there's grave danger
> even if the odds are low. To contain any damage, let's cover the
> remaining corner-cases where the default would lead to 5.0 GT/s
> operation as well as add a comment to Root Complex driver core,
> documenting this danger.
> 

I'm not sure just adding a warn would be a good choice. Could we totally
force to use gen1 and add a warn if trying to use Gen2.

Meanwhile amend the commit message to add a reference
of RK3399 official datesheet[1] which says PCIe on RK3399 should only
support 2.5GT/s?


[1]https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf

> Geraldo Nascimento (3):
>    PCI: rockchip: warn of danger of 5.0 GT/s speeds
>    PCI: rockchip-host: comment danger of 5.0 GT/s speed
>    arm64: dts: rockchip: drop max-link-speed = <2> in helios64 PCIe
> 
>   arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 1 -
>   drivers/pci/controller/pcie-rockchip-host.c            | 5 +++++
>   drivers/pci/controller/pcie-rockchip.c                 | 8 ++++++--
>   3 files changed, 11 insertions(+), 3 deletions(-)
> 


