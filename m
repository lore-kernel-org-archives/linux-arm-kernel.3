Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B363CCEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PXroKdeKungPKSuFMqQVLZ09bF3qbvunSo1wZ/xkxk=; b=RV9ReIR5G4Evkp7sLxKNifWF+K
	bPgpvGw0Qm4U0m5MVZzuvP3RYzq0r3qfy+vVroADhGhkOeMkAgEXuGIGrXxE+yJmXFELuXYYhsKIw
	vDn69+kYvKOhAElPDIoUuMCrhhPvsDeGDUGoN6VzCzMHss9djeYBINMAnnrc+1AaWDs4xZutw8LaU
	Z4d+GCn4TRdU9OPshhOnc1X68oZtMpcXZt5dNllDYlYR5GhZoCIa7HHWo+Ac11TRMBx7K8zJHKN7H
	3emLJc5zr3lRXEWaMIfrGUs7rrxdSavup+FkApXG2S2mPMjFqrzrACL7ec/u+t3xlbghlAzA/mqKD
	g2nep/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9zT-0000000H6Le-26xO;
	Tue, 18 Nov 2025 00:54:41 +0000
Received: from mail-m155115.qiye.163.com ([101.71.155.115])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9zP-0000000H6JP-3QWy;
	Tue, 18 Nov 2025 00:54:37 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29e843e9e;
	Tue, 18 Nov 2025 08:54:29 +0800 (GMT+08:00)
Message-ID: <20d86c90-9066-4a44-8fff-f4e3edef256e@rock-chips.com>
Date: Tue, 18 Nov 2025 08:54:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 "open list:PCIE DRIVER FOR ROCKCHIP" <linux-pci@vger.kernel.org>,
 "open list:PCIE DRIVER FOR ROCKCHIP" <linux-rockchip@lists.infradead.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC v1 0/5] Fix some register offset as per RK3399 TRM part 2
To: Anand Moon <linux.amoon@gmail.com>
References: <20251117181023.482138-1-linux.amoon@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20251117181023.482138-1-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a9474bc4909cckunma9a3e37740cfc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUNDSFZKH01OGEwZSBkdHx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZDj8c+t0H/ppLW12rpDdGxE+CcklsaHR0Rd2uwBf1hZX8AIYU+Oa5dYiiaT1g2ToLEpfU5V59tWZRVlanl/OJBzfZkMFaOEpjT4uJvMsV6lAexk7ovOhquNARon8M/qSR4rDyRx/lsPaPQUsIFq+WQ2EVUmikYiWUhfZK3LOPEc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=9PXroKdeKungPKSuFMqQVLZ09bF3qbvunSo1wZ/xkxk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_165436_349452_497C032A 
X-CRM114-Status: GOOD (  11.20  )
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

Hi Anand,

在 2025/11/18 星期二 2:10, Anand Moon 写道:
> In order to enable ASPM we need to fix the register offset as
> RK3399 TRM part 2 - PCIe Controller.
> 
> Tested on Radxa Rock Pi 4b.
> 

I checked your patch, and it looks like indeed we made some mistakes
here. Could you add fixes tag for each?

BTW, regarding to patch 1, I think you should leave out ASPM part, that
should be another topic after these fixes.

> Thanks
> -Anand
> 
> Anand Moon (5):
>    PCI: rockchip: Fix Link Control register offset and enable ASPM/CLKREQ
>    PCI: rockchip: Fix Device Control register offset for Max payload size
>    PCI: rockchip: Fix Slot Capability Register offset for slot power
>      limit
>    PCI: rockchip: Fix Link Control and Status Register 2 for target link
>      speed
>    PCI: rockchip: Fix Linkwidth Control Register offset for Retrain Link
> 
>   drivers/pci/controller/pcie-rockchip-host.c | 31 +++++++++++----------
>   drivers/pci/controller/pcie-rockchip.h      |  5 ++++
>   2 files changed, 21 insertions(+), 15 deletions(-)
> 
> 
> base-commit: e7c375b181600caf135cfd03eadbc45eb530f2cb


