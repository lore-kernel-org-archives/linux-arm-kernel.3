Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76597CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrayKAKaSRu3AEFjENKUssZHoHeNJ30UqnLov4d3dfA=; b=xQkhDkiHptdUwh/q3xzkbVrI2f
	IwaTS1Qg7hy0xLpdD8ZvqZIDDkWUJLZoE3DEwMOv/zonAlsmoFCgxClmd0BCnscOb8HEf27MCbUGk
	mKs9Yuxiuepz91ziYvIkdY21IfEzouHpSY1T/TPBLJ0MCMTzhyY6ZMqw1oUcgipOtbF5mueIgwI8P
	9FOQw7176r39/vQ4NkLkGDASTB6wOva1KFdPUP/89O150MLnIrfSspAlIfmI4HX4ZzeMFRGiQeyoS
	xdnsOeK/ei2cfXlFBJU0INZzjsx/MdSm3DLHjcunC/I8lHnpQRYFTylWva+FKruhRJkERXTUM6fit
	v3TBuN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqVg-00000006HB8-2Jng;
	Fri, 31 Oct 2025 14:53:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqVe-00000006HAj-08pK;
	Fri, 31 Oct 2025 14:53:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FE3643713;
	Fri, 31 Oct 2025 14:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D644AC4CEE7;
	Fri, 31 Oct 2025 14:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761922425;
	bh=6vHW2fp30oSt1Z1dUetdmISj2k4xcp73KZzarQrJoJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hg3KPhvnGuPVN9p618BTCV3Kb5hMDEZ/ev5rl0D2cJy40ogHWKJltb29YlTacv1Hi
	 nuQtkj25k0SbWF25CFg/DdLkuzPz/RURsIOAU66uFwwv54A/ApMvz2Xin7BsGdZJYF
	 j5yZ5pWm8lBpWJCqiZ1jkvWYhsR3NN5d+uurlsoXAbqh3iFti2RRduOfw9NOsGAbjG
	 ppISPIizNTSaIzCoNKSmA1BdWs0SLU19Q5fqROuSRTvMR/SbviKtgq9Tg/ONMgapjg
	 OVI9t4PhUWeYhizGXPmrLqFj5OA7wLfWopW9c8lkW1uLlNRcLU6wNHfYQUlKFZeWXd
	 4921bdDmC5uyQ==
Date: Fri, 31 Oct 2025 20:23:27 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] PCI: dw-rockchip: Add runtime PM support to
 Rockchip PCIe driver
Message-ID: <e7cttuu5525k7ryvmkh6ifspm5vloj4muazvmp3yxtkgsdtbjs@u4odsfurejxq>
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-3-linux.amoon@gmail.com>
 <ukgkfetbggzon4ppndl7gpitlsz7hjhzhyx3dgxqhdo52exguy@bqksd7d27lpy>
 <CANAwSgTECOAoKeJS_=HxkkTP4OJvYu5xGQxY__Auh81v3QT=-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANAwSgTECOAoKeJS_=HxkkTP4OJvYu5xGQxY__Auh81v3QT=-w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_075346_119998_0C2B5A93 
X-CRM114-Status: GOOD (  21.11  )
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

On Fri, Oct 31, 2025 at 07:33:23PM +0530, Anand Moon wrote:
> Hi Manivannan
> 
> Thanks for your review comment.
> 
> On Fri, 31 Oct 2025 at 14:09, Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Mon, Oct 27, 2025 at 08:25:30PM +0530, Anand Moon wrote:
> > > Add runtime power management support to the Rockchip DesignWare PCIe
> > > controller driver by enabling devm_pm_runtime() in the probe function.
> > > These changes allow the PCIe controller to suspend and resume dynamically,
> > > improving power efficiency on supported platforms.
> > >
> >
> > Seriously? How can this patch improve the power efficiency if it is not doing
> > any PM operation on its own?
> >
> I could verify that runtime power management is active
> 

This is runtime status being active, which is a different thing as it only
allows the runtime PM hierarchy to be maintained. But the way you described the
commit message sounds like the patch is enabling runtime PM of the controller
and that improves efficiency (as if the controller driver is actively doing
runtime PM operations).

> [root@rockpi-5b alarm]# cat
> /sys/devices/platform/a41000000.pcie/power/runtime_status
> active
> [root@rockpi-5b alarm]#  find /sys -name runtime_status
> /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/power/runtime_status
> /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/pci_bus/0004:41/power/runtime_status
> /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/power/runtime_status
> /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/net/enP4p65s0/power/runtime_status
> /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/net/enP4p65s0/enP4p65s0-3::lan/power/runtime_status
> /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/net/enP4p65s0/enP4p65s0-2::lan/power/runtime_status
> /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/net/enP4p65s0/enP4p65s0-1::lan/power/runtime_status
> /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/net/enP4p65s0/enP4p65s0-0::lan/power/runtime_status
> /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/mdio_bus/r8169-4-4100/power/runtime_status
> /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/mdio_bus/r8169-4-4100/r8169-4-4100:00/power/runtime_status
> /sys/devices/platform/a41000000.pcie/pci0004:40/0004:40:00.0/0004:41:00.0/mdio_bus/r8169-4-4100/r8169-4-4100:00/hwmon/hwmon11/power/runtime_status
> 
> Well, the powertop shows that the runtime power management is enabled
> on Radxa Rock 5b,
> 
> PowerTOP 2.15     Overview   Idle stats   Frequency stats   Device
> stats   Device Freq stats   Tunables   WakeUp
> >> Good          Wireless Power Saving for interface wlan0
>    Good          VM writeback timeout
>    Good          Bluetooth device interface status
>    Good          NMI watchdog should be turned off
>    Good          Autosuspend for unknown USB device 2-1.3 (8087:0a2b)
>    Good          Autosuspend for USB device USB 2.0 Hub [2-1]
>    Good          Autosuspend for USB device Generic Platform OHCI
> controller [usb1]
>    Good          Autosuspend for USB device xHCI Host Controller [usb8]
>    Good          Autosuspend for USB device Generic Platform OHCI
> controller [usb4]
>    Good          Autosuspend for USB device EHCI Host Controller [usb2]
>    Good          Autosuspend for USB device xHCI Host Controller [usb6]
>    Good          Autosuspend for USB device EHCI Host Controller [usb3]
>    Good          Autosuspend for USB device xHCI Host Controller [usb5]
>    Good          Autosuspend for USB device xHCI Host Controller [usb7]
>    Good          Runtime PM for PCI Device Intel Corporation Wireless
> 8265 / 8275
>    Good          Runtime PM for PCI Device Rockchip Electronics Co., Ltd RK3588
>    Good          Runtime PM for PCI Device Rockchip Electronics Co., Ltd RK3588
>    Good          Runtime PM for PCI Device Realtek Semiconductor Co.,
> Ltd. RTL8125 2.5GbE Controller
>    Good          Runtime PM for PCI Device Rockchip Electronics Co., Ltd RK3588
>    Good          Runtime PM for PCI Device Samsung Electronics Co Ltd
> NVMe SSD Controller SM981/PM981/PM983
> 
> PowerTOP 2.15     Overview   Idle stats   Frequency stats   Device
> stats   Device Freq stats   Tunables   WakeUp
>               Usage     Device name
>               1.1%        CPU use
>             100.0%        Radio device: rfkill_gpio
>             100.0%        runtime-rockchip-gate-link-clk.712
>             100.0%        PCI Device: Realtek Semiconductor Co., Ltd.
> RTL8125 2.5GbE Controller
>             100.0%        runtime-rockchip-gate-link-clk.717
>             100.0%        runtime-rockchip-gate-link-clk.714
>             100.0%        runtime-rockchip-gate-link-clk.489
>             100.0%        runtime-a40000000.pcie
>             100.0%        runtime-a40800000.pcie
>             100.0%        runtime-rockchip-gate-link-clk.718
>             100.0%        runtime-rockchip-gate-link-clk.706
>             100.0%        runtime-rockchip-gate-link-clk.708
>             100.0%        PCI Device: Intel Corporation Wireless 8265 / 8275
>             100.0%        Radio device: btusb
>             100.0%        runtime-fcd00000.usb
>             100.0%        PCI Device: Samsung Electronics Co Ltd NVMe
> SSD Controller SM981/PM981/PM983
>             100.0%        Radio device: rfkill_gpio
>             100.0%        runtime-fc000000.usb
>             100.0%        Radio device: iwlwifi
>             100.0%        PCI Device: Rockchip Electronics Co., Ltd RK3588
>             100.0%        PCI Device: Rockchip Electronics Co., Ltd RK3588
>             100.0%        PCI Device: Rockchip Electronics Co., Ltd RK3588
>             100.0%        runtime-rockchip-gate-link-clk.711
>             100.0%        runtime-fc400000.usb
>             100.0%        runtime-rockchip-gate-link-clk.704
>             100.0%        runtime-rockchip-gate-link-clk.701
>             100.0%        runtime-rockchip-gate-link-clk.716
>             100.0%        runtime-rockchip-gate-link-clk.707
>             100.0%        runtime-rockchip-gate-link-clk.709
>             100.0%        runtime-rockchip-gate-link-clk.719
>             100.0%        runtime-xhci-hcd.1.auto
>             100.0%        runtime-feb50000.serial
>             100.0%        runtime-rockchip-gate-link-clk.715
>             100.0%        runtime-rockchip-gate-link-clk.710
> 
> > Again, a pointless patch.

This patch might make sense on its own, to enable runtime PM status of the
controller so that the runtime PM could be applied to the entire PCIe hierarchy.

> I implemented a .remove patch to ensure proper resource cleanup,
> which is a necessary step for successfully enabling and managing
> runtime power for the device.

How a dead code (remove callback for a always built-in driver) becomes necessary
for runtime PM.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

