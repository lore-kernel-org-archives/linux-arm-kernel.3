Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE33CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 12:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zdq4xlgAsz/GvQ8sKcmd6Q0LvOMqqxT1dlvIv7znvDw=; b=cBfp0nHXuX8QViPKuirz+SviD0
	jFN+0dOuCtoqTrM905ZrF336QfdDuP6PGq4RO5H9N2MH9SdQAhHMsoYLs8Nz2sA7v9RDdggVYBimk
	wNUxf3R2BHAFTfzshT5EeeAWtVqx56KEKOGOKLzv1ag2KjPzRk0nOnEy2wCas0A/vcNFpL5M2WYc0
	P7tQjcsVbkcPPMTPh+Nk8WqwTh1nZZUG4bRNCs7L/kXQNVA7yawh9FOXdLktCDv8Q2xURq5HC6eWO
	xZ3KpuSrPHdMgyyyRcgY8ewiUsNSH008tVM+Bq7ZjfF7hMEWpHHaDKpFHEYnAZqFXttnGXp6mS/iC
	zCTZJ7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcu3-0000000Dbqh-2ij3;
	Wed, 05 Nov 2025 12:46:19 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGctz-0000000Dbpn-0Gdy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 12:46:18 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so4867172a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 04:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762346774; x=1762951574; darn=lists.infradead.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdq4xlgAsz/GvQ8sKcmd6Q0LvOMqqxT1dlvIv7znvDw=;
        b=Abc4jdtSidXZu7uof1ayx1gmEv3JEOhJ3zG7/RKBuiQf5h27dHLNfzI5r2Q+eEBeQ5
         K9zonLwvIpkmg7mxUoxRh/qloN6pPkvTSpRbhKobz6LjZClvp2cZLfQEjFknZXHkjZtH
         hlOMI6owVU1WP23YJPGpGjRf8cn6etZI9LLHNZXpxhrH8Ea5b178pw1P+1bkWsLJEsWD
         prGd80VOFabwyzxPDaQR2PH/psek2rA4T39gmd/NFiA6fClVoOWZ+JXfOvzy3dCyxbC+
         BCxWv0wKqcv0QMWRXPz0NN0BjBc2tzXJgVMEbVP8GW3x6cHtGlBCLSsPJ36dlcMOB/bv
         YcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762346774; x=1762951574;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdq4xlgAsz/GvQ8sKcmd6Q0LvOMqqxT1dlvIv7znvDw=;
        b=RQswwLokvV701+vhGj0R3FdUjO+w3RiJWAt2qM1cI8mTnbdk0vytb8OXfNnAVA+WiF
         3ya1YQ3YmrGmiPfhg491yZ0co4IDcJij3pT2+t7IaFPgNpV14s7cbuSSg7N1NeKa0R9b
         HcO5Cgdc8cQvrQfW9RSpn5TjJnrjyq52l0Sabsz5bvpVWYF1ZLiiyj+WUFpSRThyyyWx
         dbNIKQPKZYrBadmbOQGziY92fhK0h6HUOl1YRfzWerQGn6S1WKSXZN6fV8TQ+Ph8V0M7
         gYXxR/Dd6Sl5x5Rag5BHu8vZZoFmgRwN6ZAj0uNoDkT8WGF1MRyfD5oRbCPPZocIzSnl
         IAgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwfDPRRrizzOKIuGsA+oNxW9rpWYWBwp55YcqtAOzupA9vtyeuxIs1aJKLLjcaVXCPGlOac/CahCBm5o9YUXro@lists.infradead.org
X-Gm-Message-State: AOJu0YxmEE6tOLnBg089eaLffnFCKlM5e8+Ea8jDXk68AsJwbkbLio8q
	1rpxUA+GoLTl/gTpUG551PahSQS3xBpQKflgXvjWga8y018WZUQmySBY
X-Gm-Gg: ASbGncs3Mlvs1OKBtcNp73I0qwA81wlmytWwnAQcoxx7LPRAdojeNir0dajo1s2FuBf
	L8xQUUV1yGnmO1Yisy5V/x21gt3yHai3kTrjC3qlCYbj1uZBpHM7w8xmiiWKSElVRNxeE2m6aGE
	sYvTMlp8rjm/j4ppsyWVvHAftyDVOzYyyyBNx/kddtReuJ32hvRkYJbq4k/Hi/GW99RuyGk5KeG
	YzquSeJhBpB6OviBtDUODMNmMPumpjd5nWFUpolShKoBqKpDnPvS0tW332kXlqkFmhEXU1jTIK4
	81lgAlXrEEQPr3h29/bH5SZRTYMnixFTNM4zN3Xm+jv9cFjBCEAANuKtm3yodT3p/wM/y4uyYy8
	rC02SS8G90tWnsUQ3lsJ+JpFPnPCa7h2NtLch1Hx1Y6DWBKe+bP1i+8uhBwATgU7SDN05PrK+1F
	0Rbvwve2RW23o=
X-Google-Smtp-Source: AGHT+IEzkbPUTWsUdbwrx8cF8glCItYLXMKn9S/r1/I1+u2rDjxseY8jv9jUrJG1td0YnlweDtYTyA==
X-Received: by 2002:a17:90b:1cc7:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-341a6c4b148mr3179401a91.12.1762346773806;
        Wed, 05 Nov 2025 04:46:13 -0800 (PST)
Received: from joaog-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417bc8e9c2sm2658920a91.1.2025.11.05.04.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 04:46:13 -0800 (PST)
Date: Wed, 5 Nov 2025 09:46:08 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Kishon Vijay Abraham I <kishon@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>
Cc: Andrew Davis <afd@ti.com>, Francesco Dolcini <francesco@dolcini.it>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: TI K3 AM69 Kernel Panic when PCIe Controller is Enabled
Message-ID: <pod3anzbqdwl3l2zldz4sd47rtbruep72ehaf7kwcuh2bgflb2@y4ox65e66mkj>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_044615_114229_A3774434 
X-CRM114-Status: GOOD (  10.87  )
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

Hello,

I was testing PCIe upstream support on TI AM69 with a NVMe Samsung SSD
to add upstream support for Toradex Aquila AM69 (sent upstream [1]) and
noticed that when enabling the PCIe controller (CONFIG_PCI_J721E_HOST=y)
on the arm64 defconfig, there is a kernel panic on nvme_pci_enable:

[    7.397838] pci 0000:00:00.0: PCI bridge to [bus 00]
[    7.402799] pci 0000:00:00.0:   bridge window [io  0x0000-0x0fff]
[    7.408887] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[    7.415675] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[    7.423501] pci 0000:00:00.0: supports D1
[    7.427509] pci 0000:00:00.0: PME# supported from D0 D1 D3hot
[    7.435887] pci 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[    7.444083] pci 0000:01:00.0: [144d:a808] type 00 class 0x010802 PCIe Endpoint
[    7.451449] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00003fff 64bit]
[    7.458407] pci 0000:01:00.0: 15.752 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x2 link at 0000:00:00.0 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4 link)
[    7.480637] pci 0000:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2

[    7.493685] pci 0000:01:00.0: ASPM: DT platform, enabling ClockPM
[    7.500002] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    7.506679] pci 0000:00:00.0: bridge window [mem 0x4000200000-0x40002fffff]: assigned
[    7.514553] pci 0000:00:00.0: bridge window [mem 0x4000300000-0x40003fffff 64bit pref]: assigned
[    7.514562] pci 0000:00:00.0: bridge window [io  0x1000-0x1fff]: assigned
[    7.530134] pci 0000:01:00.0: BAR 0 [mem 0x4000200000-0x4000203fff 64bit]: assigned
         Starting Connection service...
[    7.537834] pci 0000:00:00.0: PCI bridge to [bus 01]
[    7.547531] pci 0000:00:00.0:   bridge window [io  0x1000-0x1fff]
[    7.553644] pci 0000:00:00.0:   bridge window [mem 0x4000200000-0x40002fffff]
[    7.553684] audit: type=1334 audit(1748569869.624:11): prog-id=15 op=LOAD
[    7.560814] pci 0000:00:00.0:   bridge window [mem 0x4000300000-0x40003fffff 64bit pref]
[    7.575695] pci_bus 0000:00: resource 4 [io  0x0000-0xfffff]
[    7.575702] pci_bus 0000:00: resource 5 [mem 0x4000101000-0x40ffffffff]
[    7.587971] pci_bus 0000:01: resource 0 [io  0x1000-0x1fff]
[    7.587976] pci_bus 0000:01: resource 1 [mem 0x4000200000-0x40002fffff]
[    7.587979] pci_bus 0000:01: resource 2 [mem 0x4000300000-0x40003fffff 64bit pref]

[    7.612848] pcieport 0000:00:00.0: of_irq_parse_pci: failed with rc=-22
[    7.619482] pcieport 0000:00:00.0: enabling device (0000 -> 0003)
[    7.635343] pcieport 0000:00:00.0: PME: Signaling with IRQ 600
         Starting Virtual Console Setup...
[    7.649648] pcieport 0000:00:00.0: AER: enabled with IRQ 600
[    7.660029] am65-cpsw-nuss c000000.ethernet eth1: PHY [gpio-0:04] driver [TI DP83867] (irq=379)
[    7.660666] nvme 0000:01:00.0: of_irq_parse_pci: failed with rc=-22
[    7.668777] j721e-pcie 2910000.pcie: host bridge /bus@100000/pcie@2910000 ranges:
[    7.669791] am65-cpsw-nuss c000000.ethernet eth1: configuring for phy/sgmii link mode
[    7.675751] nvme nvme0: pci function 0000:01:00.0
[    7.682528] j721e-pcie 2910000.pcie:       IO 0x4100001000..0x4100100fff -> 0x0000001000
[    7.690339] nvme 0000:01:00.0: enabling device (0000 -> 0002)
[    7.695034] j721e-pcie 2910000.pcie:      MEM 0x4100101000..0x41ffffffff -> 0x0000101000
[    7.703120] SError Interrupt on CPU7, code 0x00000000bf000000 -- SError
[    7.703127] CPU: 7 UID: 0 PID: 70 Comm: kworker/u32:3 Tainted: G   M                6.18.0-rc1-00023-g417c89ae1522 #3 PREEMPT
[    7.703133] Tainted: [M]=MACHINE_CHECK
[    7.703135] Hardware name: Toradex Aquila AM69 V1.0 on Aquila Development Board (DT)
[    7.703139] Workqueue: async async_run_entry_fn
[    7.703155] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    7.703159] pc : nvme_pci_enable+0x54/0x598 [nvme]
[    7.703178] lr : nvme_pci_enable+0x48/0x598 [nvme]
[    7.703183] sp : ffff80008130bad0
[    7.703184] x29: ffff80008130baf0 x28: 0000000000000000 x27: 0000000000000000
[    7.703189] x26: ffff000800028028 x25: ffff000800e211c0 x24: ffff00080d242260
[    7.703194] x23: ffffbfcbbb091150 x22: ffff0008081b50c8 x21: ffff0008081b5000
[    7.703199] x20: ffff0008081b5000 x19: ffff00080d242000 x18: 0000000000000006
[    7.703203] x17: 203e2d2066666630 x16: ffffbfcbeb0d1ca0 x15: 2e2e303030313030
[    7.703207] x14: 303031347830204f x13: 3030303130303030 x12: 30307830203e2d20
[    7.703211] x11: 6666663030313030 x10: 313478302e2e3030 x9 : 4920202020202020
[    7.703216] x8 : 3a656963702e3030 x7 : 205d383235323836 x6 : 362e37202020205b
[    7.703220] x5 : ffff00080834f000 x4 : 0000000000000006 x3 : ffff800092800000
[    7.703224] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
[    7.703229] Kernel panic - not syncing: Asynchronous SError Interrupt
[    7.703232] CPU: 7 UID: 0 PID: 70 Comm: kworker/u32:3 Tainted: G   M                6.18.0-rc1-00023-g417c89ae1522 #3 PREEMPT
[    7.703236] Tainted: [M]=MACHINE_CHECK
[    7.703238] Hardware name: Toradex Aquila AM69 V1.0 on Aquila Development Board (DT)
[    7.703239] Workqueue: async async_run_entry_fn
[    7.703244] Call trace:
[    7.703247]  show_stack+0x18/0x24 (C)
[    7.703254]  dump_stack_lvl+0x34/0x8c
[    7.703260]  dump_stack+0x18/0x24
[    7.703263]  vpanic+0x324/0x368
[    7.703270]  nmi_panic+0x0/0x64
[    7.703274]  add_taint+0x0/0xbc
[    7.703279]  arm64_serror_panic+0x70/0x80
[    7.703282]  do_serror+0x3c/0x70
[    7.703285]  el1h_64_error_handler+0x34/0x50
[    7.703290]  el1h_64_error+0x6c/0x70
[    7.703293]  nvme_pci_enable+0x54/0x598 [nvme] (P)
[    7.703299]  nvme_probe+0x358/0x77c [nvme]
[    7.703304]  local_pci_probe+0x40/0xa4
[    7.703311]  pci_device_probe+0xc0/0x240
[    7.703316]  really_probe+0xbc/0x29c
[    7.703324]  __driver_probe_device+0x78/0x12c
[    7.703329]  driver_probe_device+0xd8/0x15c
[    7.703334]  __device_attach_driver+0xb8/0x134
[    7.703339]  bus_for_each_drv+0x88/0xe8
[    7.703344]  __device_attach_async_helper+0xb4/0xd8
[    7.703349]  async_run_entry_fn+0x34/0xe0
[    7.703353]  process_one_work+0x148/0x28c
[    7.703360]  worker_thread+0x2d0/0x3d8
[    7.703364]  kthread+0x12c/0x204
[    7.703369]  ret_from_fork+0x10/0x20
[    7.703374] SMP: stopping secondary CPUs
[    7.708837] Kernel Offset: 0x3fcb6aa00000 from 0xffff800080000000
[    7.708840] PHYS_OFFSET: 0xfff1000080000000
[    7.708842] CPU features: 0x080000,04025000,40004001,0400421b
[    7.708845] Memory Limit: none
[    7.996038] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---


The issue seems to be related to the Serdes PHY
(CONFIG_PHY_CADENCE_TORRENT and CONFIG_PHY_J721E_WIZ) being enabled as a
module on the arm64 defconfig. Enabling these configs as built-in, at
least on my system, makes the PCIe work.

Toradex already reported this to TI for the downstream kernel [2], but
it seems that it is also happening on upstream.

[1] https://lore.kernel.org/lkml/20251104144915.60445-1-francesco@dolcini.it/
[2] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1406797/am69-nvme-pcie-and-kernel-panic

Best Regards,
João Paulo Gonçalves


