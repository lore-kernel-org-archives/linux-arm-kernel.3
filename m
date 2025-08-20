Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ACACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 23:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=NlBBGfW7LW4mcszkeYVESntRwEb6oS14Ks7u+ztxYes=; b=kPwpcPN+1ulUg2
	6gMAUAJmL1ebepR1SGM7h+e9TTmf8bVGQb24yqje1wSNtiK8g3ihQ9QfVFHUYrq+ECcQgb4ndlUtU
	8MOxYRYgzRV1tyEZ1qVWltqyP0dhI68cAaCESwiq15UXkqTWDMWUyoBmiTwXBBq7oAsVxQOCUnds0
	S9ozau23aRf30VlanBXC4GRXNzSehQ2QfboJfzrV89ZRyCevTiVDJhVC+CYaT7DwWrwM6SNO/feJh
	0VkCnORRTMV0GgmlBukI4DA2YHZC7vf0OHByZs0VYe1dmIxU9vDkE96bnegcZdKa8ndVlmgur5/tk
	C2MEMkoXZMlRKdRI0+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorzX-0000000F9pI-1Bqf;
	Wed, 20 Aug 2025 23:13:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonoz-0000000Ei6S-3eTH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 18:46:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52A9A43F86;
	Wed, 20 Aug 2025 18:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DB8C4CEE7;
	Wed, 20 Aug 2025 18:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755715565;
	bh=j9d5F5hOnILLhyNGlMupTClw/zrKYm3BliVu/NfBtsY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dBNMWpPn54Vjp6IoSb+8vC2KBwaurBdV4AQ97cehpfnKFHwaVmnoe4NVLVbF3vTTd
	 s++LCg3NTWJjxntc1Ubf5DQR5uXzhjCz24O4kc3UvUR3AGNDrdt8/VkECpmfTh5Jsg
	 iKLNrAAnqd2KCTnMk0LX4NVWYRFHZwkiqzpoKMyF/0ng13je6OA4RyEqPDXNU2WPKN
	 BExzxWal/gFbyIW1byYkaJvWifDhKzVdlQCHMFb0x5LY1sGdXqE53249Gd2PPCvfb5
	 qsDNI4/r7wcAxLztTX6/ikTsfr20dMU/fjNAx9gflq3757tKlj7QTY+9Gnc+yPBg+/
	 m8EzyhLLKKMhQ==
Date: Wed, 20 Aug 2025 13:46:03 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Jan Palus <jpalus@fastmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [Bug 220479] New: [regression 6.16] mvebu: no pci devices
 detected on turris omnia
Message-ID: <20250820184603.GA633069@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-220479-41252@https.bugzilla.kernel.org/>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_114605_953463_085A6161 
X-CRM114-Status: GOOD (  15.21  )
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

[+cc maintainers, regressions list]

Jan, thanks very much for the report and the bisection.  Could you
attach the devicetree you're using to the bugzilla?

On Wed, Aug 20, 2025 at 05:43:39PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=220479
> 
>            Summary: [regression 6.16] mvebu: no pci devices detected on
>                     turris omnia
>           Reporter: jpalus@fastmail.com
> 
> Booting kernel 6.16 results in no PCI devices being detected (output of `lspci`
> is completely empty). Bisected to:
> 
> 5da3d94a23c6c1ee1f896aeeb00965eacf1d0bb3 is the first new commit
> commit 5da3d94a23c6c1ee1f896aeeb00965eacf1d0bb3 (HEAD)
> Author: Rob Herring (Arm) <robh@kernel.org>
> Date:   Thu Nov 7 16:32:55 2024
> 
>     PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"
> 
>     The mvebu "ranges" is a bit unusual with its own encoding of addresses,
>     but it's still just normal "ranges" as far as parsing is concerned.
>     Convert mvebu_get_tgt_attr() to use the for_each_of_range() iterator
>     instead of open coding the parsing.
> 
>     Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>     Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>     Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>     Link: https://patch.msgid.link/20241107153255.2740610-1-robh@kernel.org
> 
>  drivers/pci/controller/pci-mvebu.c | 26 +++++++++-----------------
>  1 file changed, 9 insertions(+), 17 deletions(-)
> 
> 
> kernel 6.16 logs following mesages related to PCI:
> 
> mvebu-pcie soc:pcie: host bridge /soc/pcie ranges:
> mvebu-pcie soc:pcie:      MEM 0x00f1080000..0x00f1081fff -> 0x0000080000
> mvebu-pcie soc:pcie:      MEM 0x00f1040000..0x00f1041fff -> 0x0000040000
> mvebu-pcie soc:pcie:      MEM 0x00f1044000..0x00f1045fff -> 0x0000044000
> mvebu-pcie soc:pcie:      MEM 0x00f1048000..0x00f1049fff -> 0x0000048000
> mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00fffffffe -> 0x0100000000
> mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00fffffffe -> 0x0100000000
> mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00fffffffe -> 0x0200000000
> mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00fffffffe -> 0x0200000000
> mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00fffffffe -> 0x0300000000
> mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00fffffffe -> 0x0300000000
> mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00fffffffe -> 0x0400000000
> mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00fffffffe -> 0x0400000000
> mvebu-pcie soc:pcie: pcie0.0: cannot get tgt/attr for mem window
> mvebu-pcie soc:pcie: pcie1.0: cannot get tgt/attr for mem window
> mvebu-pcie soc:pcie: pcie2.0: cannot get tgt/attr for mem window
> mvebu-pcie soc:pcie: PCI host bridge to bus 0000:00
> pci_bus 0000:00: root bus resource [bus 00-ff]
> pci_bus 0000:00: root bus resource [mem 0xf1080000-0xf1081fff] (bus address
> [0x00080000-0x00081fff])
> pci_bus 0000:00: root bus resource [mem 0xf1040000-0xf1041fff] (bus address
> [0x00040000-0x00041fff])
> pci_bus 0000:00: root bus resource [mem 0xf1044000-0xf1045fff] (bus address
> [0x00044000-0x00045fff])
> pci_bus 0000:00: root bus resource [mem 0xf1048000-0xf1049fff] (bus address
> [0x00048000-0x00049fff])
> pci_bus 0000:00: root bus resource [mem 0xe0000000-0xe7ffffff]
> pci_bus 0000:00: root bus resource [io  0x1000-0xeffff]
> PCI: bus0: Fast back to back transfers enabled
> pci_bus 0000:00: resource 4 [mem 0xf1080000-0xf1081fff]
> pci_bus 0000:00: resource 5 [mem 0xf1040000-0xf1041fff]
> pci_bus 0000:00: resource 6 [mem 0xf1044000-0xf1045fff]
> pci_bus 0000:00: resource 7 [mem 0xf1048000-0xf1049fff]
> pci_bus 0000:00: resource 8 [mem 0xe0000000-0xe7ffffff]
> pci_bus 0000:00: resource 9 [io  0x1000-0xeffff]
> 
> 
> while kernel 6.15 logs following:
> 
> mvebu-pcie soc:pcie: host bridge /soc/pcie ranges:
> mvebu-pcie soc:pcie:      MEM 0x00f1080000..0x00f1081fff -> 0x0000080000
> mvebu-pcie soc:pcie:      MEM 0x00f1040000..0x00f1041fff -> 0x0000040000
> mvebu-pcie soc:pcie:      MEM 0x00f1044000..0x00f1045fff -> 0x0000044000
> mvebu-pcie soc:pcie:      MEM 0x00f1048000..0x00f1049fff -> 0x0000048000
> mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00fffffffe -> 0x0100000000
> mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00fffffffe -> 0x0100000000
> mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00fffffffe -> 0x0200000000
> mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00fffffffe -> 0x0200000000
> mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00fffffffe -> 0x0300000000
> mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00fffffffe -> 0x0300000000
> mvebu-pcie soc:pcie:      MEM 0xffffffffffffffff..0x00fffffffe -> 0x0400000000
> mvebu-pcie soc:pcie:       IO 0xffffffffffffffff..0x00fffffffe -> 0x0400000000
> mvebu-pcie soc:pcie: pcie0.0: Slot power limit 10.0W
> mvebu-pcie soc:pcie: pcie1.0: Slot power limit 10.0W
> mvebu-pcie soc:pcie: pcie2.0: Slot power limit 10.0W
> mvebu-pcie soc:pcie: PCI host bridge to bus 0000:00
> pci_bus 0000:00: root bus resource [bus 00-ff]
> pci_bus 0000:00: root bus resource [mem 0xf1080000-0xf1081fff] (bus address
> [0x00080000-0x00081fff])
> pci_bus 0000:00: root bus resource [mem 0xf1040000-0xf1041fff] (bus address
> [0x00040000-0x00041fff])
> pci_bus 0000:00: root bus resource [mem 0xf1044000-0xf1045fff] (bus address
> [0x00044000-0x00045fff])
> pci_bus 0000:00: root bus resource [mem 0xf1048000-0xf1049fff] (bus address
> [0x00048000-0x00049fff])
> pci_bus 0000:00: root bus resource [mem 0xe0000000-0xe7ffffff]
> pci_bus 0000:00: root bus resource [io  0x1000-0xeffff]
> pci 0000:00:01.0: [11ab:6820] type 01 class 0x060400 PCIe Root Port
> pci 0000:00:01.0: PCI bridge to [bus 00]
> pci 0000:00:01.0:   bridge window [io  0x0000-0x0fff]
> pci 0000:00:01.0:   bridge window [mem 0x00000000-0x000fffff]
> /soc/pcie/pcie@1,0: Fixed dependency cycle(s) with
> /soc/pcie/pcie@1,0/interrupt-controller
> pci 0000:00:02.0: [11ab:6820] type 01 class 0x060400 PCIe Root Port
> pci 0000:00:02.0: PCI bridge to [bus 00]
> pci 0000:00:02.0:   bridge window [io  0x0000-0x0fff]
> pci 0000:00:02.0:   bridge window [mem 0x00000000-0x000fffff]
> /soc/pcie/pcie@2,0: Fixed dependency cycle(s) with
> /soc/pcie/pcie@2,0/interrupt-controller
> pci 0000:00:03.0: [11ab:6820] type 01 class 0x060400 PCIe Root Port
> pci 0000:00:03.0: PCI bridge to [bus 00]
> pci 0000:00:03.0:   bridge window [io  0x0000-0x0fff]
> pci 0000:00:03.0:   bridge window [mem 0x00000000-0x000fffff]
> /soc/pcie/pcie@3,0: Fixed dependency cycle(s) with
> /soc/pcie/pcie@3,0/interrupt-controller
> PCI: bus0: Fast back to back transfers disabled
> pci 0000:00:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> pci 0000:00:02.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> pci 0000:00:03.0: bridge configuration invalid ([bus 00-00]), reconfiguring
> PCI: bus1: Fast back to back transfers enabled
> pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> pci 0000:02:00.0: [168c:003c] type 00 class 0x028000 PCIe Endpoint
> pci 0000:02:00.0: BAR 0 [mem 0x00000000-0x001fffff 64bit]
> pci 0000:02:00.0: ROM [mem 0x00000000-0x0000ffff pref]
> pci 0000:02:00.0: supports D1
> pci 0000:02:00.0: PME# supported from D0 D1 D3hot
> pci 0000:00:02.0: ASPM: current common clock configuration is inconsistent,
> reconfiguring
> pci 0000:00:02.0: ASPM: Bridge does not support changing Link Speed to 2.5 GT/s
> pci 0000:00:02.0: ASPM: Retrain Link at higher speed is disallowed by quirk
> PCI: bus2: Fast back to back transfers disabled
> pci_bus 0000:02: busn_res: [bus 02-ff] end is updated to 02
> pci 0000:03:00.0: [168c:0033] type 00 class 0x028000 PCIe Endpoint
> pci 0000:03:00.0: BAR 0 [mem 0x00000000-0x0001ffff 64bit]
> pci 0000:03:00.0: ROM [mem 0x00000000-0x0000ffff pref]
> pci 0000:03:00.0: supports D1
> pci 0000:03:00.0: PME# supported from D0 D1 D3hot
> pci 0000:00:03.0: ASPM: current common clock configuration is inconsistent,
> reconfiguring
> pci 0000:00:03.0: ASPM: Bridge does not support changing Link Speed to 2.5 GT/s
> pci 0000:00:03.0: ASPM: Retrain Link at higher speed is disallowed by quirk
> PCI: bus3: Fast back to back transfers disabled
> pci_bus 0000:03: busn_res: [bus 03-ff] end is updated to 03
> pci 0000:00:02.0: bridge window [mem 0x00200000-0x003fffff] to [bus 02]
> add_size 200000 add_align 200000
> pci 0000:00:02.0: bridge window [mem 0xe0000000-0xe03fffff]: assigned
> pci 0000:00:03.0: bridge window [mem 0xe0400000-0xe04fffff]: assigned
> pci 0000:00:01.0: PCI bridge to [bus 01]
> pci 0000:02:00.0: BAR 0 [mem 0xe0000000-0xe01fffff 64bit]: assigned
> pci 0000:02:00.0: ROM [mem 0xe0200000-0xe020ffff pref]: assigned
> pci 0000:00:02.0: PCI bridge to [bus 02]
> pci 0000:00:02.0:   bridge window [mem 0xe0000000-0xe03fffff]
> pci 0000:03:00.0: BAR 0 [mem 0xe0400000-0xe041ffff 64bit]: assigned
> pci 0000:03:00.0: ROM [mem 0xe0420000-0xe042ffff pref]: assigned
> pci 0000:00:03.0: PCI bridge to [bus 03]
> pci 0000:00:03.0:   bridge window [mem 0xe0400000-0xe04fffff]
> pci_bus 0000:00: resource 4 [mem 0xf1080000-0xf1081fff]
> pci_bus 0000:00: resource 5 [mem 0xf1040000-0xf1041fff]
> pci_bus 0000:00: resource 6 [mem 0xf1044000-0xf1045fff]
> pci_bus 0000:00: resource 7 [mem 0xf1048000-0xf1049fff]
> pci_bus 0000:00: resource 8 [mem 0xe0000000-0xe7ffffff]
> pci_bus 0000:00: resource 9 [io  0x1000-0xeffff]
> pci_bus 0000:02: resource 1 [mem 0xe0000000-0xe03fffff]
> pci_bus 0000:03: resource 1 [mem 0xe0400000-0xe04fffff]
> pcieport 0000:00:02.0: enabling device (0140 -> 0142)
> pcieport 0000:00:03.0: enabling device (0140 -> 0142)

#regzbot introduced: 5da3d94a23c6 ("PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"")

