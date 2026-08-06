Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228D2C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3nce32vAoj+StcrSmDBdi8JY6HtMOaBjb/2ZFF7lIc=; b=FBjv+gewpOkF+lzorRvZG0Pi2Z
	KVjBayuFzAGxAZ5nIrxnhf3ZyJlo9atP+u1qQu7BtEcCsf+0sOhZ+NJV491eKCnHRQpVtVWDJYXsw
	Sq6tTBeFe2fRluR8bwsgP+YmZtY2Z8MSzIn1Bw1P1nuG3ZZp04SogRJhVR1dVgol3Um/CWlPE40UT
	X/bAxZAA+x2DdHif7srEW/V/gMnM9yUJw8/OgL55U+JbYlqd7sr/o2q9vbbAWbimsWEBoEFkigdoe
	y8wIsWNdbgZZrVAvgcAX+trbM38SX3R97fHi43NfYBiOB5t84MHjMDguunPyNfd5rhxNQwSSMjono
	A1HhjNJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvKK-00000005Y26-1xng;
	Thu, 06 Aug 2026 10:27:52 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvKG-00000005Y0y-3XlV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:27:51 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1865247f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786012064; x=1786616864; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3nce32vAoj+StcrSmDBdi8JY6HtMOaBjb/2ZFF7lIc=;
        b=oaeEG0ImcTKiaWaHzm9uAs6reIIwOYs1sDrzlspHNN1ms2RsIiWzNTfcZcUmJLK5VK
         ls+83Okg6DIXcVaQoTQdsQtVWJ9BQhv0P5VkC9usk0Xdz+sBBuUCE2rzUzPWNBcQEgJd
         b2Bdy0gvK5hT8Ctl/G5/Msv1ktlpBlcDqMZPDW8mzJxNPeLGTRI8bJpRUqdBJJ1nCfFE
         xZyM2vZaXnDcBdM/d/oODjo0zZLainP5xk1IlU4BNOvtuh3XDdiCQwicjD5kh0q6ifVP
         yr8x+ocKqVtu2yzur/epyWRrl9GgaW1kgY4i3IjIrbud8dtS4fABWQJuHe9MTNw+ELZA
         fJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012064; x=1786616864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3nce32vAoj+StcrSmDBdi8JY6HtMOaBjb/2ZFF7lIc=;
        b=D3BRC2Id3pLlyo9Y13ASlaLFmG9xNzMcBZyO2I7Pa2hTfbLfTtsiMEfyhtHHLN3NMF
         9Y2eBiivfvCMWLkE7igZ9h8zbJluqQU5EVJ7TG/LzVJMhLieNOrDAm8vEuiunhG1LwQR
         qySBzXsG6lvGicpu+VXVusRiad4qvHWhRMVL84dPiw/nMS0t0PVMu9q4nbKP2LEQ6yG5
         smuuNF3h49lZUaikTlgHGkSScDzJlgfmddR8z4eCghSsMOWM3IeJyNI1uyooT4rs/fp8
         3ydxF1+e79Y8/Vt5bTXLGDNXsBpT60hjoVKpZ5ZNI7ZKEnR4oernSsGJmzvaCCmJuZvl
         P0KQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpy4XTaRqbAQ+Uh2aKxeU3vKZSMelUiz/4QoMhKxH+Mnya5CEE5a1VHH+D6SRSgx3WaVWta3gNqpsYNnSbjMNg8@lists.infradead.org
X-Gm-Message-State: AOJu0YzTWy3riCERPcR+4ll+4ArFwi3eOqZsS4y8LJjRTAcCRTNxorSk
	GGAqTj60dIOunJjWEvE+Qjj9+pVfQoR1GXoQnqgp03IgjxUtCTz31mWz
X-Gm-Gg: AR+sD13RMdUTP9QnHYI+8C5+OEfFUcvPWEOM16uaza0V1sAD0fl7gwjjzSNFVcymPqQ
	54+63AzBCRJD29eRb11qFNlpviRRjuCfA2Yhi90WzDZdFBi07fPvqff0PPMwbTz5uUNSyIs6NPG
	datTpPk02/GMmrIi3HS4fB7ZXsVcub3qLiBTSx7Cr7ocfMHi/KRM1j530PrYp3b62laM0AAqhoq
	LFk13C1dem6LrndYSkWfpwiL0MQ3p4f3EOTYXoCP3uCqXeEgpzJqclhW1assZeE2gFNcdTJ1Sa/
	1Gg1KPradsPasp6nXW6Onjg3A7TWwVA1JfAHIoGlZ7XrnFQDiCJXh9j181ciWShhvdI0+V2Jr4i
	Ov+ul3crzxcacE8NvSrQxikU+SxE4Nu86Pv5kCXm0h4a1gB7qAQ+xXIHxaOz+TZqJGjBPypR/rl
	VdPOspLLMNUMZvKsrrilv+a2uAV76lEaT5f4rZD18SXFsjO0/IvQOPbjm5TQ+cUlTn0SZ/d7ax0
	DBD555cvYlElKZxo70W0SLLcfVv
X-Received: by 2002:adf:f4c9:0:b0:47f:f3f9:ae37 with SMTP id ffacd0b85a97d-47ffd21da75mr315812f8f.7.1786012063284;
        Thu, 06 Aug 2026 03:27:43 -0700 (PDT)
Received: from [192.168.33.7] ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b18368sm4385820f8f.20.2026.08.06.03.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:27:41 -0700 (PDT)
Message-ID: <93ee7456-4179-4d78-b980-1df0b7e0278a@gmail.com>
Date: Thu, 6 Aug 2026 12:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: drop extra AXI bus ranges that break
 PCIe
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260628231156.1254012-1-rosenp@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20260628231156.1254012-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_032749_124308_5B77CEF6 
X-CRM114-Status: GOOD (  11.39  )
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

W dniu 29.06.2026 o 01:11, Rosen Penev pisze:
> These addresses overlap with DRAM on BCM5301X/BCM470X SoCs, causing the OF
> address translation code to route PCIe MMIO accesses through the AXI bus
> space instead of directly to memory, breaking PCIe. Remove the extra
> ranges to restore the original single-entry mapping that only covers the
> AXI peripheral register space.

This seems to make PCIe state worse for me. For testing / debugging
purposes I used patch as below in this e-mail.

1. Without this change and with CONFIG_PCIE_IPROC_BCMA:
[    6.077054] pcie_iproc_bcma bcma0:7: mem resource: [bus 00-ff]
[    6.082908] pcie_iproc_bcma bcma0:7: mem resource: [mem 0x08000000-0x0fffffff]
[    6.440537] pcie_iproc_bcma bcma0:8: mem resource: [bus 00-ff]
[    6.446410] pcie_iproc_bcma bcma0:8: mem resource: [mem 0x20000000-0x27ffffff]
[    6.810388] pcie_iproc_bcma bcma0:9: mem resource: [bus 00-ff]
[    6.816261] pcie_iproc_bcma bcma0:9: mem resource: [mem 0x28000000-0x2fffffff]
(PCIe & BCM4366 work perfectly)

2. Without this change and with CONFIG_PCIE_IPROC_PLATFORM:
[    5.947182] iproc-pcie 18012000.pcie: mem resource: [bus 00-ff]
[    5.953123] iproc-pcie 18012000.pcie: mem resource: [mem 0x08000000-0x0fffffff]
[    6.311082] iproc-pcie 18013000.pcie: mem resource: [bus 00-ff]
[    6.317045] iproc-pcie 18013000.pcie: mem resource: [mem 0x20000000-0x27ffffff]
[    6.680915] iproc-pcie 18014000.pcie: mem resource: [bus 00-ff]
[    6.686880] iproc-pcie 18014000.pcie: mem resource: [mem 0x28000000-0x2fffffff]
(PCIe seems OK, BCM4366 seems to timeout with brcmfmac but probing happens)

3. With this change and CONFIG_PCIE_IPROC_PLATFORM:
[    5.976228] iproc-pcie 18012000.pcie: mem resource: [bus 00-ff]
[    6.339603] iproc-pcie 18013000.pcie: mem resource: [bus 00-ff]
[    6.709426] iproc-pcie 18014000.pcie: mem resource: [bus 00-ff]
(PCIe setup fails, brcmfmac fails in probe early)

Did you actualy test this PATCH? What device did you use? Do PCIe
device(s) work for you with this change?


*** *** ***


Full logs below:

1. Without this change and with CONFIG_PCIE_IPROC_BCMA:
[    6.061340] pcie_iproc_bcma bcma0:7: host bridge /axi@18000000/pcie@12000 ranges:
[    6.068910] pcie_iproc_bcma bcma0:7:      MEM 0x0008000000..0x000fffffff -> 0x0008000000
[    6.077054] pcie_iproc_bcma bcma0:7: mem resource: [bus 00-ff]
[    6.082908] pcie_iproc_bcma bcma0:7: mem resource: [mem 0x08000000-0x0fffffff]
[    6.203892] pcie_iproc_bcma bcma0:7: link: UP
[    6.208476] pcie_iproc_bcma bcma0:7: PCI host bridge to bus 0000:00
[    6.214794] pci_bus 0000:00: root bus resource [bus 00-ff]
[    6.220302] pci_bus 0000:00: root bus resource [mem 0x08000000-0x0fffffff]
[    6.227219] pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0xc8 may corrupt adjacent RW1C bits
[    6.237032] pci 0000:00:00.0: [14e4:d612] type 01 class 0x060400 PCIe Root Port
[    6.244383] pci 0000:00:00.0: PCI bridge to [bus 00]
[    6.249366] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[    6.256182] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[    6.263984] pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
[    6.270824] PCI: bus0: Fast back to back transfers disabled
[    6.276453] pci 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[    6.284641] pci 0000:01:00.0: [14e4:4365] type 00 class 0x028000 PCIe Endpoint
[    6.291894] pci_bus 0000:01: 2-byte config write to 0000:01:00.0 offset 0x4 may corrupt adjacent RW1C bits
[    6.301602] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00007fff 64bit]
[    6.308081] pci 0000:01:00.0: BAR 2 [mem 0x00000000-0x007fffff 64bit]
[    6.314552] pci 0000:01:00.0: BAR 4 [mem 0x00000000-0x000fffff 64bit pref]
[    6.321549] pci 0000:01:00.0: supports D1 D2
[    6.326066] PCI: bus1: Fast back to back transfers disabled
[    6.331664] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    6.338339] pci 0000:00:00.0: bridge window [mem 0x08000000-0x08bfffff]: assigned
[    6.345858] pci 0000:00:00.0: bridge window [mem 0x08c00000-0x08cfffff 64bit pref]: assigned
[    6.354325] pci 0000:01:00.0: BAR 2 [mem 0x08000000-0x087fffff 64bit]: assigned
[    6.361664] pci 0000:01:00.0: BAR 4 [mem 0x08c00000-0x08cfffff 64bit pref]: assigned
[    6.369443] pci 0000:01:00.0: BAR 0 [mem 0x08800000-0x08807fff 64bit]: assigned
[    6.376785] pci 0000:00:00.0: PCI bridge to [bus 01]
[    6.381761] pci 0000:00:00.0:   bridge window [mem 0x08000000-0x08bfffff]
[    6.388576] pci 0000:00:00.0:   bridge window [mem 0x08c00000-0x08cfffff 64bit pref]
[    6.396346] pci_bus 0000:00: resource 4 [mem 0x08000000-0x0fffffff]
[    6.402632] pci_bus 0000:01: resource 1 [mem 0x08000000-0x08bfffff]
[    6.408921] pci_bus 0000:01: resource 2 [mem 0x08c00000-0x08cfffff 64bit pref]
[    6.416490] pci 0000:00:00.0: 4.000 Gb/s available PCIe bandwidth (5.0 GT/s PCIe x1 link)
[    6.424849] pcie_iproc_bcma bcma0:8: host bridge /axi@18000000/pcie@13000 ranges:
[    6.432384] pcie_iproc_bcma bcma0:8:      MEM 0x0020000000..0x0027ffffff -> 0x0020000000
[    6.440537] pcie_iproc_bcma bcma0:8: mem resource: [bus 00-ff]
[    6.446410] pcie_iproc_bcma bcma0:8: mem resource: [mem 0x20000000-0x27ffffff]
[    6.573857] pcie_iproc_bcma bcma0:8: link: UP
[    6.578343] pcie_iproc_bcma bcma0:8: PCI host bridge to bus 0001:00
[    6.584658] pci_bus 0001:00: root bus resource [bus 00-ff]
[    6.590169] pci_bus 0001:00: root bus resource [mem 0x20000000-0x27ffffff]
[    6.597084] pci_bus 0001:00: 2-byte config write to 0001:00:00.0 offset 0xc8 may corrupt adjacent RW1C bits
[    6.606896] pci 0001:00:00.0: [14e4:d612] type 01 class 0x060400 PCIe Root Port
[    6.614242] pci 0001:00:00.0: PCI bridge to [bus 00]
[    6.619226] pci 0001:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[    6.626038] pci 0001:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[    6.633833] pci 0001:00:00.0: PME# supported from D0 D3hot D3cold
[    6.640691] PCI: bus0: Fast back to back transfers disabled
[    6.646307] pci 0001:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[    6.654490] pci 0001:01:00.0: [14e4:4365] type 00 class 0x028000 PCIe Endpoint
[    6.661744] pci_bus 0001:01: 2-byte config write to 0001:01:00.0 offset 0x4 may corrupt adjacent RW1C bits
[    6.671454] pci 0001:01:00.0: BAR 0 [mem 0x00000000-0x00007fff 64bit]
[    6.677930] pci 0001:01:00.0: BAR 2 [mem 0x00000000-0x007fffff 64bit]
[    6.684405] pci 0001:01:00.0: BAR 4 [mem 0x00000000-0x000fffff 64bit pref]
[    6.691400] pci 0001:01:00.0: supports D1 D2
[    6.695899] PCI: bus1: Fast back to back transfers disabled
[    6.701496] pci_bus 0001:01: busn_res: [bus 01-ff] end is updated to 01
[    6.708163] pci 0001:00:00.0: bridge window [mem 0x20000000-0x20bfffff]: assigned
[    6.715681] pci 0001:00:00.0: bridge window [mem 0x20c00000-0x20cfffff 64bit pref]: assigned
[    6.724149] pci 0001:01:00.0: BAR 2 [mem 0x20000000-0x207fffff 64bit]: assigned
[    6.731488] pci 0001:01:00.0: BAR 4 [mem 0x20c00000-0x20cfffff 64bit pref]: assigned
[    6.739267] pci 0001:01:00.0: BAR 0 [mem 0x20800000-0x20807fff 64bit]: assigned
[    6.746611] pci 0001:00:00.0: PCI bridge to [bus 01]
[    6.751585] pci 0001:00:00.0:   bridge window [mem 0x20000000-0x20bfffff]
[    6.758411] pci 0001:00:00.0:   bridge window [mem 0x20c00000-0x20cfffff 64bit pref]
[    6.766179] pci_bus 0001:00: resource 4 [mem 0x20000000-0x27ffffff]
[    6.772465] pci_bus 0001:01: resource 1 [mem 0x20000000-0x20bfffff]
[    6.778755] pci_bus 0001:01: resource 2 [mem 0x20c00000-0x20cfffff 64bit pref]
[    6.786333] pci 0001:00:00.0: 4.000 Gb/s available PCIe bandwidth (5.0 GT/s PCIe x1 link)
[    6.794701] pcie_iproc_bcma bcma0:9: host bridge /axi@18000000/pcie@14000 ranges:
[    6.802233] pcie_iproc_bcma bcma0:9:      MEM 0x0028000000..0x002fffffff -> 0x0028000000
[    6.810388] pcie_iproc_bcma bcma0:9: mem resource: [bus 00-ff]
[    6.816261] pcie_iproc_bcma bcma0:9: mem resource: [mem 0x28000000-0x2fffffff]
[    6.933856] pcie_iproc_bcma bcma0:9: PHY or data link is INACTIVE!
[    6.940061] pcie_iproc_bcma bcma0:9: no PCIe EP device detected
(...)
[   17.154435] pci 0000:00:00.0: enabling device (0140 -> 0142)
[   17.163433] brcmfmac 0000:01:00.0: enabling device (0140 -> 0142)
[   17.284228] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4366c-pcie for chip BCM4366/4
[   17.293218] pci 0001:00:00.0: enabling device (0140 -> 0142)
[   17.298957] brcmfmac 0001:01:00.0: enabling device (0140 -> 0142)
[   17.305669] brcmfmac 0000:01:00.0: Direct firmware load for brcm/brcmfmac4366c-pcie.luxul,xwr-3150-v1.bin failed with error -2
[   17.434303] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4366c-pcie for chip BCM4366/4
[   17.443792] brcmfmac 0001:01:00.0: Direct firmware load for brcm/brcmfmac4366c-pcie.luxul,xwr-3150-v1.bin failed with error -2
[   17.460111] kmodloader: done loading kernel modules from /etc/modules.d/*
[   17.594565] brcmfmac 0000:01:00.0: Direct firmware load for brcm/brcmfmac4366c-pcie.txt failed with error -2
[   17.605523] brcmfmac 0000:01:00.0: Direct firmware load for brcm/brcmfmac4366c-pcie.clm_blob failed with error -2
[   17.616026] brcmfmac 0001:01:00.0: Direct firmware load for brcm/brcmfmac4366c-pcie.txcap_blob failed with error -2
[   17.882440] brcmfmac: brcmf_c_process_clm_blob: no clm_blob available (err=-2), device may have limited channels available
[   17.893611] brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob available (err=-2)
[   17.901575] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4366/4 wl0: Nov  5 2018 03:19:56 version 10.28.2 (r769115) FWID 01-d2cbb8fd
[   17.914286] brcmfmac: brcmf_c_process_clm_blob: no clm_blob available (err=-2), device may have limited channels available
[   17.925461] brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob available (err=-2)
[   17.934431] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4366/4 wl0: Nov  5 2018 03:19:56 version 10.28.2 (r769115) FWID 01-d2cbb8fd

2. Without this change and with CONFIG_PCIE_IPROC_PLATFORM:
[    5.931202] iproc-pcie 18012000.pcie: host bridge /axi@18000000/pcie@12000 ranges:
[    5.938882] iproc-pcie 18012000.pcie:      MEM 0x0008000000..0x000fffffff -> 0x0008000000
[    5.947182] iproc-pcie 18012000.pcie: mem resource: [bus 00-ff]
[    5.953123] iproc-pcie 18012000.pcie: mem resource: [mem 0x08000000-0x0fffffff]
[    6.073685] iproc-pcie 18012000.pcie: link: UP
[    6.078362] iproc-pcie 18012000.pcie: PCI host bridge to bus 0000:00
[    6.084766] pci_bus 0000:00: root bus resource [bus 00-ff]
[    6.090285] pci_bus 0000:00: root bus resource [mem 0x08000000-0x0fffffff]
[    6.097210] pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0xc8 may corrupt adjacent RW1C bits
[    6.107025] pci 0000:00:00.0: [14e4:d612] type 01 class 0x060400 PCIe Root Port
[    6.114383] pci 0000:00:00.0: PCI bridge to [bus 00]
[    6.119364] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[    6.126178] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[    6.133987] pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
[    6.140807] PCI: bus0: Fast back to back transfers disabled
[    6.146419] pci 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[    6.154612] pci 0000:01:00.0: [14e4:4365] type 00 class 0x028000 PCIe Endpoint
[    6.161865] pci_bus 0000:01: 2-byte config write to 0000:01:00.0 offset 0x4 may corrupt adjacent RW1C bits
[    6.171581] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00007fff 64bit]
[    6.178065] pci 0000:01:00.0: BAR 2 [mem 0x00000000-0x007fffff 64bit]
[    6.184548] pci 0000:01:00.0: BAR 4 [mem 0x00000000-0x000fffff 64bit pref]
[    6.191575] pci 0000:01:00.0: supports D1 D2
[    6.196108] PCI: bus1: Fast back to back transfers disabled
[    6.201703] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    6.208381] pci 0000:00:00.0: bridge window [mem 0x08000000-0x08bfffff]: assigned
[    6.215901] pci 0000:00:00.0: bridge window [mem 0x08c00000-0x08cfffff 64bit pref]: assigned
[    6.224377] pci 0000:01:00.0: BAR 2 [mem 0x08000000-0x087fffff 64bit]: assigned
[    6.231718] pci 0000:01:00.0: BAR 4 [mem 0x08c00000-0x08cfffff 64bit pref]: assigned
[    6.239506] pci 0000:01:00.0: BAR 0 [mem 0x08800000-0x08807fff 64bit]: assigned
[    6.246849] pci 0000:00:00.0: PCI bridge to [bus 01]
[    6.251829] pci 0000:00:00.0:   bridge window [mem 0x08000000-0x08bfffff]
[    6.258644] pci 0000:00:00.0:   bridge window [mem 0x08c00000-0x08cfffff 64bit pref]
[    6.266414] pci_bus 0000:00: resource 4 [mem 0x08000000-0x0fffffff]
[    6.272698] pci_bus 0000:01: resource 1 [mem 0x08000000-0x08bfffff]
[    6.278990] pci_bus 0000:01: resource 2 [mem 0x08c00000-0x08cfffff 64bit pref]
[    6.286613] pci 0000:00:00.0: 4.000 Gb/s available PCIe bandwidth (5.0 GT/s PCIe x1 link)
[    6.295180] iproc-pcie 18013000.pcie: host bridge /axi@18000000/pcie@13000 ranges:
[    6.302795] iproc-pcie 18013000.pcie:      MEM 0x0020000000..0x0027ffffff -> 0x0020000000
[    6.311082] iproc-pcie 18013000.pcie: mem resource: [bus 00-ff]
[    6.317045] iproc-pcie 18013000.pcie: mem resource: [mem 0x20000000-0x27ffffff]
[    6.443688] iproc-pcie 18013000.pcie: link: UP
[    6.448267] iproc-pcie 18013000.pcie: PCI host bridge to bus 0001:00
[    6.454667] pci_bus 0001:00: root bus resource [bus 00-ff]
[    6.460175] pci_bus 0001:00: root bus resource [mem 0x20000000-0x27ffffff]
[    6.467091] pci_bus 0001:00: 2-byte config write to 0001:00:00.0 offset 0xc8 may corrupt adjacent RW1C bits
[    6.476903] pci 0001:00:00.0: [14e4:d612] type 01 class 0x060400 PCIe Root Port
[    6.484251] pci 0001:00:00.0: PCI bridge to [bus 00]
[    6.489233] pci 0001:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[    6.496043] pci 0001:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[    6.503852] pci 0001:00:00.0: PME# supported from D0 D3hot D3cold
[    6.510689] PCI: bus0: Fast back to back transfers disabled
[    6.516305] pci 0001:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[    6.524494] pci 0001:01:00.0: [14e4:4365] type 00 class 0x028000 PCIe Endpoint
[    6.531751] pci_bus 0001:01: 2-byte config write to 0001:01:00.0 offset 0x4 may corrupt adjacent RW1C bits
[    6.541466] pci 0001:01:00.0: BAR 0 [mem 0x00000000-0x00007fff 64bit]
[    6.547949] pci 0001:01:00.0: BAR 2 [mem 0x00000000-0x007fffff 64bit]
[    6.554425] pci 0001:01:00.0: BAR 4 [mem 0x00000000-0x000fffff 64bit pref]
[    6.561453] pci 0001:01:00.0: supports D1 D2
[    6.565994] PCI: bus1: Fast back to back transfers disabled
[    6.571589] pci_bus 0001:01: busn_res: [bus 01-ff] end is updated to 01
[    6.578263] pci 0001:00:00.0: bridge window [mem 0x20000000-0x20bfffff]: assigned
[    6.585784] pci 0001:00:00.0: bridge window [mem 0x20c00000-0x20cfffff 64bit pref]: assigned
[    6.594251] pci 0001:01:00.0: BAR 2 [mem 0x20000000-0x207fffff 64bit]: assigned
[    6.601593] pci 0001:01:00.0: BAR 4 [mem 0x20c00000-0x20cfffff 64bit pref]: assigned
[    6.609373] pci 0001:01:00.0: BAR 0 [mem 0x20800000-0x20807fff 64bit]: assigned
[    6.616716] pci 0001:00:00.0: PCI bridge to [bus 01]
[    6.621696] pci 0001:00:00.0:   bridge window [mem 0x20000000-0x20bfffff]
[    6.628513] pci 0001:00:00.0:   bridge window [mem 0x20c00000-0x20cfffff 64bit pref]
[    6.636281] pci_bus 0001:00: resource 4 [mem 0x20000000-0x27ffffff]
[    6.642567] pci_bus 0001:01: resource 1 [mem 0x20000000-0x20bfffff]
[    6.648855] pci_bus 0001:01: resource 2 [mem 0x20c00000-0x20cfffff 64bit pref]
[    6.656445] pci 0001:00:00.0: 4.000 Gb/s available PCIe bandwidth (5.0 GT/s PCIe x1 link)
[    6.665008] iproc-pcie 18014000.pcie: host bridge /axi@18000000/pcie@14000 ranges:
[    6.672629] iproc-pcie 18014000.pcie:      MEM 0x0028000000..0x002fffffff -> 0x0028000000
[    6.680915] iproc-pcie 18014000.pcie: mem resource: [bus 00-ff]
[    6.686880] iproc-pcie 18014000.pcie: mem resource: [mem 0x28000000-0x2fffffff]
[    6.813683] iproc-pcie 18014000.pcie: PHY or data link is INACTIVE!
[    6.819982] iproc-pcie 18014000.pcie: no PCIe EP device detected
[    6.826014] iproc-pcie 18014000.pcie: PCIe controller setup failed
(...)
[   17.185931] pci 0000:00:00.0: enabling device (0140 -> 0142)
[   17.191622] brcmfmac 0000:01:00.0: enabling device (0140 -> 0142)
[   17.334049] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4366c-pcie for chip BCM4366/4
[   17.342898] pci 0001:00:00.0: enabling device (0140 -> 0142)
[   17.348616] brcmfmac 0001:01:00.0: enabling device (0140 -> 0142)
[   17.355507] brcmfmac 0000:01:00.0: Direct firmware load for brcm/brcmfmac4366c-pcie.luxul,xwr-3150-v1.bin failed with error -2
[   17.484169] brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4366c-pcie for chip BCM4366/4
[   17.493422] brcmfmac 0001:01:00.0: Direct firmware load for brcm/brcmfmac4366c-pcie.luxul,xwr-3150-v1.bin failed with error -2
[   17.508727] kmodloader: done loading kernel modules from /etc/modules.d/*
[   17.624073] brcmfmac 0000:01:00.0: Direct firmware load for brcm/brcmfmac4366c-pcie.txt failed with error -2
[   17.634965] brcmfmac 0001:01:00.0: Direct firmware load for brcm/brcmfmac4366c-pcie.clm_blob failed with error -2
[   17.645412] brcmfmac 0001:01:00.0: Direct firmware load for brcm/brcmfmac4366c-pcie.txcap_blob failed with error -2
[   19.956940] ieee80211 phy0: brcmf_msgbuf_query_dcmd: Timeout on response for query command
[   19.965302] ieee80211 phy0: brcmf_c_preinit_dcmds: Retrieving cur_etheraddr failed, -5
[   19.973263] ieee80211 phy0: brcmf_bus_started: failed: -5
[   19.976167] ieee80211 phy1: brcmf_msgbuf_query_dcmd: Timeout on response for query command
[   19.978802] ieee80211 phy0: brcmf_attach: dongle is not responding: err=-5
[   19.987015] ieee80211 phy1: brcmf_c_preinit_dcmds: Retrieving cur_etheraddr failed, -5
[   20.001904] ieee80211 phy1: brcmf_bus_started: failed: -5
[   20.007461] ieee80211 phy1: brcmf_attach: dongle is not responding: err=-5
[   20.026165] brcmfmac 0000:01:00.0: brcmf_pcie_setup: Dongle setup failed
[   20.032966] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 ****** RAMSIZE is 0x240000, RAMSIZE_ADJ is 0x240000 *******
[   20.035716] brcmfmac 0001:01:00.0: brcmf_pcie_setup: Dongle setup failed
[   20.046023] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 initvars_cis_pci: Not CIS format
[   20.052724] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 ****** RAMSIZE is 0x240000, RAMSIZE_ADJ is 0x240000 *******
[   20.063236] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 srom rev:0
[   20.076179] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 initvars_cis_pci: Not CIS format
[   20.076207] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 srom rev:0
[   20.084861] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 initvars_srom_pci, SROM CRC Error
[   20.095424] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 initvars_srom_pci, SROM CRC Error
[   20.104079] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 initvars_srom_pci, Using external nvram
[   20.114699] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 initvars_srom_pci, Using external nvram
[   20.125346] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 Setting clocks to 800/400/200
[   20.136503] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 Setting clocks to 800/400/200
[   20.147686] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 si_set_bb_vcofreq_frac: only work on 4360, 4350
[   20.157972] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 si_set_bb_vcofreq_frac: only work on 4360, 4350
[   20.168236] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 Enabling D-cache
[   20.180109] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 000000.000 Enabling D-cache
[   20.191955] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.568 gic_dist_init max_irq 64
[   20.201108] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.568 gic_dist_init max_irq 64
[   20.210287] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.570 c_init: Watchdog reset bit set, clearing
[   20.220139] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.569 c_init: Watchdog reset bit set, clearing
[   20.229963] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.570
[   20.241195] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.569
[   20.252494] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: RTE (PCIE-MSG_BUF) 10.28.2 (r769115) on BCM4366 r4 @ 40.0/200.0/800.0MHz
[   20.260254] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: RTE (PCIE-MSG_BUF) 10.28.2 (r769115) on BCM4366 r4 @ 40.0/200.0/800.0MHz
[   20.268014] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.570 nvram_init: called again without calling nvram_exit()
[   20.281096] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.569 nvram_init: called again without calling nvram_exit()
[   20.294148] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.570 initvars_cis_pci: Not CIS format
[   20.306520] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.569 initvars_cis_pci: Not CIS format
[   20.318881] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.602 srom rev:0
[   20.329431] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.601 srom rev:0
[   20.340000] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.602 initvars_srom_pci, SROM CRC Error
[   20.348630] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.601 initvars_srom_pci, SROM CRC Error
[   20.357274] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.602 initvars_srom_pci, Using external nvram
[   20.367905] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.601 initvars_srom_pci, Using external nvram
[   20.378547] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.602 allocating a max of 511 rxcplid buffers
[   20.389704] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.601 allocating a max of 511 rxcplid buffers
[   20.400860] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.602 pciemsgbuf0: Broadcom PCIE MSGBUF driver
[   20.412021] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.601 pciemsgbuf0: Broadcom PCIE MSGBUF driver
[   20.423190] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.602 nvram_init: called again without calling nvram_exit()
[   20.434433] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.601 nvram_init: called again without calling nvram_exit()
[   20.445664] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.602 initvars_cis_pci: Not CIS format
[   20.458038] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.601 initvars_cis_pci: Not CIS format
[   20.470400] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.634 srom rev:0
[   20.480947] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.633 srom rev:0
[   20.491516] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.634 initvars_srom_pci, SROM CRC Error
[   20.500149] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.633 initvars_srom_pci, SROM CRC Error
[   20.508790] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.634 initvars_srom_pci, Using external nvram
[   20.519425] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.633 initvars_srom_pci, Using external nvram
[   20.530068] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.634 wlc_ucode_download: wl0: Loading non-MU ucode
[   20.541224] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.633 wlc_ucode_download: wl0: Loading non-MU ucode
[   20.552389] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.635 reclaim section 0: Returned 216 bytes to the heap
[   20.564060] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.634 reclaim section 0: Returned 216 bytes to the heap
[   20.575732] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.635 initvars_cis_pci: Not CIS format
[   20.587754] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.634 initvars_cis_pci: Not CIS format
[   20.599775] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.667 srom rev:0
[   20.610322] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.666 srom rev:0
[   20.620887] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.667 initvars_srom_pci, SROM CRC Error
[   20.629520] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.666 initvars_srom_pci, SROM CRC Error
[   20.638158] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.667 initvars_srom_pci, Using external nvram
[   20.648792] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.666 initvars_srom_pci, Using external nvram
[   20.659433] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.668 wlc_bmac_attach, deviceid 0x43c4 nbands 1
[   20.670580] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.667 wlc_bmac_attach, deviceid 0x43c5 nbands 1
[   20.681743] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.668 wlc_bmac_attach: mutxmax is configured to auto
[   20.693077] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.667 wlc_bmac_attach: mutxmax is configured to auto
[   20.704410] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.668 wlc_bmac_attach: mutxmax is 8 after adjustment
[   20.716176] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.667 wlc_bmac_attach: mutxmax is 8 after adjustment
[   20.727953] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.668 ipxotp_init: mapping otpbase at 0x18007000 to 0x18007000
[   20.739718] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.667 ipxotp_init: mapping otpbase at 0x18007000 to 0x18007000
[   20.751489] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.674 ipxotp_init: mapping otpbase at 0x18007000 to 0x18007000
[   20.764126] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.675 ipxotp_init: mapping otpbase at 0x18007000 to 0x18007000
[   20.776820] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.674 wl0: wlc_bmac_attach: chiprev 4 corerev 65 cccap 0x58400009 maccap 0xf0018705 band 2.4G, phy_type 11 phy_rev 33
[   20.789452] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.675 wl0: wlc_bmac_attach: chiprev 4 corerev 65 cccap 0x58400009 maccap 0xf0018705 band 5G, phy_type 11 phy_rev 33
[   20.802050] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.675 ipxotp_init: mapping otpbase at 0x18007000 to 0x18007000
[   20.819476] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.677 ipxotp_init: mapping otpbase at 0x18007000 to 0x18007000
[   20.836719] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.676 wl0: wlc_stf_txcore_shmem_write: No clock
[   20.849351] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.677 wl0: wlc_stf_txcore_shmem_write: No clock
[   20.873328] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.676 wl0: wlc_ampdu_tx_set: AGG Mode = MAC+AQM txmaxpkts 512
[   20.884659] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.677 wl0: wlc_ampdu_tx_set: AGG Mode = MAC+AQM txmaxpkts 512
[   20.897191] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.677 wlc_mutx_attach: mutxmax is 8
[   20.909739] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.678 wlc_mutx_attach: mutxmax is 8
[   20.920058] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.678 wl0: Broadcom BCM4366 802.11 Wireless Controller 10.28.2 (r769115)
[   20.930348] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.680 wl0: Broadcom BCM4366 802.11 Wireless Controller 10.28.2 (r769115)
[   20.943833] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.678 SPLITRX_MODE_2 enabled : tcmsegsize 160
[   20.957342] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.680 SPLITRX_MODE_2 enabled : tcmsegsize 160
[   20.968590] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.678 TCAM: 512 used: 273 exceed:0
[   20.979832] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.680 TCAM: 512 used: 273 exceed:0
[   20.990053] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.678 reclaim section 1: Returned 179856 bytes to the heap
[   21.000252] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.680 reclaim section 1: Returned 179856 bytes to the heap
[   21.012522] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.679 ThreadX v5.6 initialized
[   21.024810] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE: 026738.680 ThreadX v5.6 initialized
[   21.034668] brcmfmac 0000:01:00.0: brcmf_pcie_bus_console_read: CONSOLE:
[   21.044518] brcmfmac 0001:01:00.0: brcmf_pcie_bus_console_read: CONSOLE:

3. With this change and CONFIG_PCIE_IPROC_PLATFORM:
[    5.952372] iproc-pcie 18012000.pcie: host bridge /axi@18000000/pcie@12000 ranges:
[    5.960046] iproc-pcie 18012000.pcie:      MEM 0xffffffffffffffff..0x0007fffffe -> 0x0008000000
[    5.968830] iproc-pcie 18012000.pcie: non-prefetchable memory resource required
[    5.976228] iproc-pcie 18012000.pcie: mem resource: [bus 00-ff]
[    6.083649] iproc-pcie 18012000.pcie: link: UP
[    6.088328] iproc-pcie 18012000.pcie: PCI host bridge to bus 0000:00
[    6.094736] pci_bus 0000:00: root bus resource [bus 00-ff]
[    6.100253] pci_bus 0000:00: 2-byte config write to 0000:00:00.0 offset 0xc8 may corrupt adjacent RW1C bits
[    6.110080] pci 0000:00:00.0: [14e4:d612] type 01 class 0x060400 PCIe Root Port
[    6.117455] pci 0000:00:00.0: PCI bridge to [bus 00]
[    6.122437] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[    6.129255] pci 0000:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[    6.137065] pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
[    6.143959] PCI: bus0: Fast back to back transfers disabled
[    6.149559] pci 0000:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[    6.157762] pci 0000:01:00.0: [14e4:4365] type 00 class 0x028000 PCIe Endpoint
[    6.165043] pci_bus 0000:01: 2-byte config write to 0000:01:00.0 offset 0x4 may corrupt adjacent RW1C bits
[    6.174759] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0x00007fff 64bit]
[    6.181232] pci 0000:01:00.0: BAR 2 [mem 0x00000000-0x007fffff 64bit]
[    6.187707] pci 0000:01:00.0: BAR 4 [mem 0x00000000-0x000fffff 64bit pref]
[    6.194752] pci 0000:01:00.0: supports D1 D2
[    6.199283] PCI: bus1: Fast back to back transfers disabled
[    6.204918] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    6.211571] pci 0000:00:00.0: bridge window [mem size 0x00c00000]: can't assign; no space
[    6.219783] pci 0000:00:00.0: bridge window [mem size 0x00c00000]: failed to assign
[    6.227474] pci 0000:00:00.0: bridge window [mem size 0x00100000 64bit pref]: can't assign; no space
[    6.236637] pci 0000:00:00.0: bridge window [mem size 0x00100000 64bit pref]: failed to assign
[    6.245284] pci 0000:01:00.0: BAR 2 [mem size 0x00800000 64bit]: can't assign; no space
[    6.253306] pci 0000:01:00.0: BAR 2 [mem size 0x00800000 64bit]: failed to assign
[    6.260817] pci 0000:01:00.0: BAR 4 [mem size 0x00100000 64bit pref]: can't assign; no space
[    6.269287] pci 0000:01:00.0: BAR 4 [mem size 0x00100000 64bit pref]: failed to assign
[    6.277244] pci 0000:01:00.0: BAR 0 [mem size 0x00008000 64bit]: can't assign; no space
[    6.285276] pci 0000:01:00.0: BAR 0 [mem size 0x00008000 64bit]: failed to assign
[    6.292783] pci 0000:00:00.0: PCI bridge to [bus 01]
[    6.297774] pci_bus 0000:00: Some PCI device resources are unassigned, try booting with pci=realloc
[    6.307231] pci 0000:00:00.0: 4.000 Gb/s available PCIe bandwidth (5.0 GT/s PCIe x1 link)
[    6.315808] iproc-pcie 18013000.pcie: host bridge /axi@18000000/pcie@13000 ranges:
[    6.323424] iproc-pcie 18013000.pcie:      MEM 0xffffffffffffffff..0x0007fffffe -> 0x0020000000
[    6.332206] iproc-pcie 18013000.pcie: non-prefetchable memory resource required
[    6.339603] iproc-pcie 18013000.pcie: mem resource: [bus 00-ff]
[    6.453649] iproc-pcie 18013000.pcie: link: UP
[    6.458235] iproc-pcie 18013000.pcie: PCI host bridge to bus 0001:00
[    6.464631] pci_bus 0001:00: root bus resource [bus 00-ff]
[    6.470158] pci_bus 0001:00: 2-byte config write to 0001:00:00.0 offset 0xc8 may corrupt adjacent RW1C bits
[    6.479983] pci 0001:00:00.0: [14e4:d612] type 01 class 0x060400 PCIe Root Port
[    6.487348] pci 0001:00:00.0: PCI bridge to [bus 00]
[    6.492331] pci 0001:00:00.0:   bridge window [mem 0x00000000-0x000fffff]
[    6.499146] pci 0001:00:00.0:   bridge window [mem 0x00000000-0x000fffff 64bit pref]
[    6.506946] pci 0001:00:00.0: PME# supported from D0 D3hot D3cold
[    6.513829] PCI: bus0: Fast back to back transfers disabled
[    6.519436] pci 0001:00:00.0: bridge configuration invalid ([bus 00-00]), reconfiguring
[    6.527649] pci 0001:01:00.0: [14e4:4365] type 00 class 0x028000 PCIe Endpoint
[    6.534932] pci_bus 0001:01: 2-byte config write to 0001:01:00.0 offset 0x4 may corrupt adjacent RW1C bits
[    6.544656] pci 0001:01:00.0: BAR 0 [mem 0x00000000-0x00007fff 64bit]
[    6.551135] pci 0001:01:00.0: BAR 2 [mem 0x00000000-0x007fffff 64bit]
[    6.557610] pci 0001:01:00.0: BAR 4 [mem 0x00000000-0x000fffff 64bit pref]
[    6.564646] pci 0001:01:00.0: supports D1 D2
[    6.569167] PCI: bus1: Fast back to back transfers disabled
[    6.574789] pci_bus 0001:01: busn_res: [bus 01-ff] end is updated to 01
[    6.581448] pci 0001:00:00.0: bridge window [mem size 0x00c00000]: can't assign; no space
[    6.589659] pci 0001:00:00.0: bridge window [mem size 0x00c00000]: failed to assign
[    6.597339] pci 0001:00:00.0: bridge window [mem size 0x00100000 64bit pref]: can't assign; no space
[    6.606504] pci 0001:00:00.0: bridge window [mem size 0x00100000 64bit pref]: failed to assign
[    6.615151] pci 0001:01:00.0: BAR 2 [mem size 0x00800000 64bit]: can't assign; no space
[    6.623174] pci 0001:01:00.0: BAR 2 [mem size 0x00800000 64bit]: failed to assign
[    6.630684] pci 0001:01:00.0: BAR 4 [mem size 0x00100000 64bit pref]: can't assign; no space
[    6.639155] pci 0001:01:00.0: BAR 4 [mem size 0x00100000 64bit pref]: failed to assign
[    6.647101] pci 0001:01:00.0: BAR 0 [mem size 0x00008000 64bit]: can't assign; no space
[    6.655133] pci 0001:01:00.0: BAR 0 [mem size 0x00008000 64bit]: failed to assign
[    6.662640] pci 0001:00:00.0: PCI bridge to [bus 01]
[    6.667631] pci_bus 0001:00: Some PCI device resources are unassigned, try booting with pci=realloc
[    6.677080] pci 0001:00:00.0: 4.000 Gb/s available PCIe bandwidth (5.0 GT/s PCIe x1 link)
[    6.685636] iproc-pcie 18014000.pcie: host bridge /axi@18000000/pcie@14000 ranges:
[    6.693257] iproc-pcie 18014000.pcie:      MEM 0xffffffffffffffff..0x0007fffffe -> 0x0028000000
[    6.702037] iproc-pcie 18014000.pcie: non-prefetchable memory resource required
[    6.709426] iproc-pcie 18014000.pcie: mem resource: [bus 00-ff]
[    6.823645] iproc-pcie 18014000.pcie: PHY or data link is INACTIVE!
[    6.829939] iproc-pcie 18014000.pcie: no PCIe EP device detected
[    6.835975] iproc-pcie 18014000.pcie: PCIe controller setup failed
(...)
[   17.032372] brcmfmac: brcmf_pcie_get_resource: BAR1 Not enabled, device size=0, addr=0x00000000000000
[   17.041676] brcmfmac: brcmf_pcie_probe: failed 14e4:4365
[   17.047041] brcmfmac 0000:01:00.0: probe with driver brcmfmac failed with error -22
[   17.054824] brcmfmac: brcmf_pcie_get_resource: BAR1 Not enabled, device size=0, addr=0x00000000000000
[   17.064097] brcmfmac: brcmf_pcie_probe: failed 14e4:4365
[   17.069433] brcmfmac 0001:01:00.0: probe with driver brcmfmac failed with error -22


*** *** ***


diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
index 5aa677f81..5a67e4b0c 100644
--- a/drivers/pci/controller/pcie-iproc.c
+++ b/drivers/pci/controller/pcie-iproc.c
@@ -1463,6 +1463,14 @@ int iproc_pcie_setup(struct iproc_pcie *pcie, struct list_head *res)

  	dev = pcie->dev;

+	{
+		struct resource_entry *window;
+
+		resource_list_for_each_entry(window, res) {
+			dev_info(dev, "mem resource: %pR\n", window->res);
+		}
+	}
+
  	ret = iproc_pcie_rev_init(pcie);
  	if (ret) {
  		dev_err(dev, "unable to initialize controller parameters\n");

> Assisted-by: opencode:big-pickle
> Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   arch/arm/boot/dts/broadcom/bcm-ns.dtsi | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> index bd52de0faa3e..27a97c8122de 100644
> --- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
> @@ -95,10 +95,7 @@ L2: cache-controller@22000 {
>   	axi@18000000 {
>   		compatible = "brcm,bus-axi";
>   		reg = <0x18000000 0x1000>;
> -		ranges = <0x00000000 0x18000000 0x00100000>,
> -			 <0x08000000 0x08000000 0x08000000>,
> -			 <0x20000000 0x20000000 0x08000000>,
> -			 <0x28000000 0x28000000 0x08000000>;
> +		ranges = <0x00000000 0x18000000 0x00100000>;
>   		#address-cells = <1>;
>   		#size-cells = <1>;
>   


