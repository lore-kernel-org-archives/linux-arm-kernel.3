Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1FCCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 23:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=k87/1UoHxsQQiCPKr2ZqVo/Mg83qHAXc4nWN7VOp1eo=; b=m+Uw5zMbEd7+8f4q9EME2h361H
	IMqK1G0+MQlmbsMbzWTIyP10mtAuNzHWyGjLcpWhPCgamFmaMtkjWBG7xQ7izg8eSmdF+PbSM2TT/
	c0ZjSlgwezNnqiDdlgvJhoIY6XLKsq2CsAD/Mvej0IZD16Pr23DmChM/DW7aLEoinv7zWQHnCSJKt
	G4BGzrG+7SuQvCJXqLu7POL8KImehwz2J4PzQ/7vt1NtQPgaw5+XB9ULpAbvJRDhIq76CzoWgczcH
	WtQO/Z8YE0vNzswPKPxD88XYGpcp4EgFEwcdbj6bbkpUcntH3QUWXbBmuUqnopM9jk/I7/lPwpOFQ
	Jdn3EtUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1BzX-0000000F7Xp-0erg;
	Tue, 23 Sep 2025 23:00:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1BzV-0000000F7XO-0CLN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 23:00:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0919A43949;
	Tue, 23 Sep 2025 23:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FFBC4CEF5;
	Tue, 23 Sep 2025 23:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758668407;
	bh=DQfhhXIzQ4/yFuFqui8X9lnmS2vFtBgCOgajr6FqQaU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=QfW/YgyhyF5gh9jlYNRZMfum65QehClQ1uQ9XSa31Qw9PNqwDM0CJyr+xbAz7uMIJ
	 aCtu6dVFnHG6V5LPSyJrQCF78N+ImKYN5VIoT8H21ncoQTxAJ2HQfwRkoTzjLypqXj
	 bRuV8rmVymuPtlqmpDrQaxzME5gInH0vF5a/G1BGlrl1yf00/oeiZY+aWP4GSbm2+K
	 +ABo3dnbqHhjjCrYbnyUCqYkLqptYgbKJfpeSv3sLsrd3uVwO0R8c/dvSe6ZkGvNC+
	 ZT8qODVwe7WZMbpCIRlAto/7jaQtJCTqITcIAO13UfyejxeTe/t6zpFfX6wFqWu6iQ
	 g1hLuHmjYIGOQ==
Date: Tue, 23 Sep 2025 18:00:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "He, Guocai (CN)" <Guocai.He.CN@windriver.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"Wang, Xiaolei" <Xiaolei.Wang@windriver.com>
Subject: Re: [i.MX8 PCIe] PCIe link fails after kexec
Message-ID: <20250923230006.GA2086105@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CO6PR11MB558624C238AA9C39C9C6A936CD1DA@CO6PR11MB5586.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_160009_140409_D216B7F5 
X-CRM114-Status: GOOD (  18.82  )
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

On Tue, Sep 23, 2025 at 03:35:56AM +0000, He, Guocai (CN) wrote:
> Hi all,
> 
> We are seeing a PCIe issue on i.MX8-based board when using kexec on
> Linux kernel 6.6,  we would appreciate your help to clarify whether
> this is a known problem or if there is a recommended fix.

Can you boot a recent kernel, e.g., v6.16 or v6.17-rc7, to make sure
you're not seeing an already-fixed problem?

If you can't try a recent kernel, please include your devicetree and
the complete dmesg log including both the initial boot and the kexec.

> ## Board & Setup
> Linux version 6.6.103-yocto-standard (oe-user@oe-host) (aarch64-wrs-linux-gcc (GCC) 13.4.0, GNU ld (GNU Binutils) 2
> .42.0.20240723) #1 SMP PREEMPT Wed Sep  3 20:13:35 UTC 2025
> 
> Machine model: Freescale i.MX8QM MEK
> PCIe device: Intel Corporation Wireless 7260
> 
> 
> ##Boot flow:
> #step 1: Initial boot: Linux kernel boot from tftp .
> setenv ipaddr 128.224.165.120
> setenv gatewayip 128.224.165.1
> setenv netmask 255.255.255.0
> setenv serverip 128.224.165.20
> 
> tftp 0x8a0000000 vlm-boards/29106/kernel
> tftp 0x8d0000000 vlm-boards/29106/dtb
> booti 0x8a0000000 - 0x8d0000000
> 
> 
> #step 2: Switch to another kernel on disk using kexec
> Reproduction steps
> root@nxp-imx8:~# mkdir /mnt/sdisk
> root@nxp-imx8:~# mount /dev/mmcblk0p1 /mnt/sdisk/
> root@nxp-imx8:~# scp ghe-cn@128.224.153.151:/folk/ghe-cn/images/Image /mnt/sdisk/kernel     //the images is the same.
> 
> root@nxp-imx8:~# kexec -l /mnt/sdisk/kernel --append="console=ttyLP0,115200 video=HDMI-A-1:1920x1080-32@60 rw root=
> /dev/nfs nfsroot=128.224.165.20:/export/pxeboot/vlm-boards/29105/rootfs,tcp,v3 ip=128.224.165.120:128.224.165.20:12
> 8.224.165.1:255.255.255.0::eth0:off selinux=0 enforcing=0"
> 
> root@nxp-imx8:~# kexec -e
> 
> 
> #After the second kernel boots, the PCIe link does not come up.
> #Key log differences
> 
> #####  boot (boot_cold.log):
> imx6q-pcie 5f010000.pcie: host bridge /bus@5f000000/pcie@5f010000 ranges:
> imx-drm display-subsystem: bound imx-drm-dpu-bliteng.2 (ops dpu_bliteng_ops)
> imx6q-pcie 5f000000.pcie: host bridge /bus@5f000000/pcie@5f000000 ranges:
> imx6q-pcie 5f000000.pcie:       IO 0x006ff80000..0x006ff8ffff -> 0x0000000000
> imx6q-pcie 5f000000.pcie:      MEM 0x0060000000..0x006fefffff -> 0x0060000000
> imx6q-pcie 5f000000.pcie: iATU: unroll F, 6 ob, 6 ib, align 4K, limit 4G
> imx6q-pcie 5f000000.pcie: eDMA: unroll F, 1 wr, 1 rd
> imx6q-pcie 5f000000.pcie: PCIe Gen.1 x1 link up
> imx6q-pcie 5f000000.pcie: PCIe Gen.1 x1 link up
> imx6q-pcie 5f000000.pcie: Link up, Gen1
> imx6q-pcie 5f000000.pcie: PCIe Gen.1 x1 link up
> imx6q-pcie 5f000000.pcie: PCI host bridge to bus 0000:00
> 
> #→ Link up successfully
> 
> root@nxp-imx8:~# lspci
> 00:00.0 PCI bridge: Freescale Semiconductor Inc Device 0000 (rev 01)
> 01:00.0 Network controller: Intel Corporation Wireless 7260 (rev 6b)
> root@nxp-imx8:~#
> 
> 
> #####After kexec (boot_kexec.log):
> 
> imx6q-pcie 5f000000.pcie:       IO 0x006ff80000..0x006ff8ffff -> 0x0000000000
> imx6q-pcie 5f000000.pcie: iATU: unroll F, 6 ob, 6 ib, align 4K, limit 4G
> imx6q-pcie 5f000000.pcie: eDMA: unroll F, 1 wr, 1 rd
> 
> imx6q-pcie 5f000000.pcie: Phy link never came up
> imx6q-pcie 5f000000.pcie: Phy link never came up
> imx6q-pcie 5f000000.pcie: PCI host bridge to bus 0000:00
> 
> #→ Link never comes up, no PCIe devices detected.
> 
> root@nxp-imx8:~# lspci
> 00:00.0 PCI bridge: Freescale Semiconductor Inc Device 0000 (rev 01)
> root@nxp-imx8:~#
> 
> 
> #Questions
> Are there existing patches or recommended workarounds for this scenario?
> Thanks for your time and any guidance you can provide.
> 
> Best regards,
> 
> Guocai

