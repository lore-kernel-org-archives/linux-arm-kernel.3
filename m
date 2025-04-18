Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2186EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsAr3Jz/tHLrP0z7D88gB5vvb65YGhOS4mbJ55rWlVQ=; b=IAiuH2lT1bVN5PWnVwZ1EZWCJX
	ECv+xh3egOEyM7xKVuHxLkb2990XRgxY2jTAAiiYyII7lquqDKprinFei69fJbCd+bCcofLTdDGxR
	4x0iwhrFDHs/6oFnY6haZp/0bfm3FalAFJvIkz9ZJuWwf4I52/SVmQlGV6DzzpfxjdwkUBxqpXDZY
	vHR9qDqlokrUZrWIw/Ws9dA9sUXbGXgltd1OkEXtGc0TFxGLIuv6O7eOeMh/7nXLdAsbWm0/D42GH
	u+Emp8NuZ05mXBOKPvoBetyX3ntaH4KkdyzBj7C/pe7dj/HVhcjt5hdI40yZ0IsK62ybntwBhzrXR
	8M7ylt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5nAA-0000000GY6Y-0zYp;
	Fri, 18 Apr 2025 14:57:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5n7b-0000000GWkr-2TeE;
	Fri, 18 Apr 2025 14:55:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F7845C2C87;
	Fri, 18 Apr 2025 14:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8ABC4CEE2;
	Fri, 18 Apr 2025 14:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744988114;
	bh=Frm0OyEXiFNugmsEtT7iUopntSsaA9tw3r4eeSFnUbY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=s6KPu1LU/g8obT6chIIPEOIfs15cvyNkdg3BIqXZ6EqPBWW5RtaYX7i04EEkia9Pb
	 StL/4Fzc1ioA5zc9Rh7I0rqEuEezen59ERoS399lhYnv7labcWMHHrHtmEMQl5ByjN
	 zzVDfTQNylcxNYx7ZlWv7xGxfXYF9j6hvuNzUafJwWddt463KxNhXvEjhlZN5CSQh6
	 Is8wYv36J/use3ISNJSXzchH8EMe5uFcHACvo01+bW8cE4RHkytxMdfrpMHGx/tS+n
	 qJX2Z0LID1RsDXKPHUunCf9uDOphDOFwnI66xC5hGnR4DOn5ztA9h7SB5h4RwSrmKY
	 6twznn41rphgQ==
Date: Fri, 18 Apr 2025 16:55:13 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>, Bjorn Helgaas <helgaas@kernel.org>
CC: Shawn Lin <shawn.lin@rock-chips.com>, lpieralisi@kernel.org, kw@linux.com,
 bhelgaas@google.com, heiko@sntech.de, manivannan.sadhasivam@linaro.org,
 robh@kernel.org, jingoohan1@gmail.com, thomas.richard@bootlin.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
User-Agent: K-9 Mail for Android
In-Reply-To: <22720eef-f5a3-4e72-9c41-35335ec20f80@163.com>
References: <20250417165219.GA115235@bhelgaas> <22720eef-f5a3-4e72-9c41-35335ec20f80@163.com>
Message-ID: <225CC628-432C-4E88-AF2B-17C948B3790B@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_075515_670278_309327A6 
X-CRM114-Status: GOOD (  12.87  )
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



On 18 April 2025 14:33:08 CEST, Hans Zhang <18255117159@163=2Ecom> wrote:
>
>Dear Bjorn,
>
>Thanks your for reply=2E Niklas and I attempted to modify the relevant lo=
gic in drivers/pci/probe=2Ec and found that there was a lot of code judging=
 the global variable pcie_bus_config=2E At present, there is no good method=
=2E I will keep trying=2E
>
>I wonder if you have any good suggestions? It seems that the code logic r=
egarding pcie_bus_config is a little complicated and cannot be modified for=
 the time being?


Hans,

If:

diff --git a/drivers/pci/probe=2Ec b/drivers/pci/probe=2Ec
index 364fa2a514f8=2E=2E2e1c92fdd577 100644
--- a/drivers/pci/probe=2Ec
+++ b/drivers/pci/probe=2Ec
@@ -2983,6 +2983,13 @@ void pcie_bus_configure_settings(struct pci_bus *bu=
s)
         if (!pci_is_pcie(bus->self))
                 return;
  +       /*
+        * Start off with DevCtl=2EMPS =3D=3D DevCap=2EMPS, unless PCIE_BU=
S_TUNE_OFF=2E
+        * This might get overriden by a MPS strategy below=2E
+        */
+       if (pcie_bus_config !=3D PCIE_BUS_TUNE_OFF)
+               smpss =3D pcie_get_mps(bus->self);
+
         /*
          * FIXME - Peer to peer DMA is possible, though the endpoint woul=
d need
          * to be aware of the MPS of the destination=2E  To work around t=
his,



does not work, can't you modify the code slightly so that it works?

I haven't tried myself, but considering that it works when walking the bus=
, it seems that it should be possible to get something working=2E


Kind regards,
Niklas

