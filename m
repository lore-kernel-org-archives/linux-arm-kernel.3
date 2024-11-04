Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C16D132B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzIU8YgpQTC9sbSNtrBsbcfz0hptLkOH1MdJEhIcgOM=; b=kvG6j65FEsuEiuQ8N3TAV2ifjq
	rXjEt2ENlJYCRRbE1b3f3+yUnkzrU0zMopAEjg2skHkkkWcGJ8FV24Al1mD9Hon78x5aKoIamYG/W
	HPod+UloMBu8MkyHfANlGJhXNMlC+1fK7nRIGbvWwWs4W8Tj6hn/E5SstQvvxFFqFOGUu2OPfDS4f
	iom7jWXlq+WHCKRAC6y9GIiHtFJaTeeWEvMkn8GC/mFnE9tzOEPWNrwogLJFos2lRHc/G3FU89WhX
	J7vSPGW4nQCsXfjJB+F26aUvmzHjqveqOFHFYt/Np99Lbo9jF56us0Qq/UbJcd/sHoTjBKU6g4AZI
	Lta7+eeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wRl-0000000DjUv-0fJD;
	Mon, 04 Nov 2024 12:44:41 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wOw-0000000Dirr-0q1t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 12:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730724106; x=1762260106;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0dm2nDjg0Dy1iY623vmk5rYWhQlcAXNpHAUinLloj4Y=;
  b=BDPM/WaKl57rsrqn+CtM4zvDWFHkOiD9r+VwRePOyiFpsAw8enzhHG2X
   5kyHI17FZMPVL4gJWOX0JmXKoEwC/+9Hb61HUxihOM+MDpKpifiEVx5Fl
   46TdNA8+5MBLH3tpCmJUmhUtmAlCKCX+t7HWoPCou+LiBtXl6zdi/QoTY
   e1tLtu/fC+W4wdG6qsdtayBVnXmTupP+EbJRAkqsIb36jr/yjQIruyWmT
   06EEG3HTuvjK6GL9LCBLaToRChgYIntfLxfpLSj91FB7q75jPn2EQbbSV
   y3a/vQ9QVDT84VDxdWjRZhGyrXcPCkLR6BXHWPP7p7P4a1O08P5LBgrhy
   g==;
X-CSE-ConnectionGUID: C9EHu3NASAKpSy1dbV3r3w==
X-CSE-MsgGUID: O6uQpDuJTBS1w1ufELnJSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30527969"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="30527969"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 04:41:43 -0800
X-CSE-ConnectionGUID: Ce5W73JKR6y9/Juz58gCcQ==
X-CSE-MsgGUID: qH8SFCaMTyWlTZaONPYZSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88406382"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.33])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 04:41:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 4 Nov 2024 14:41:37 +0200 (EET)
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
    Thomas Gleixner <tglx@linutronix.de>
cc: Stefan Wahren <wahrenst@gmx.net>, Bjorn Helgaas <bhelgaas@google.com>, 
    Jim Quinlan <jim2101024@gmail.com>, Lukas Wunner <lukas@wunner.de>, 
    linux-pci <linux-pci@vger.kernel.org>, 
    Linux ARM <linux-arm-kernel@lists.infradead.org>, 
    kernel-list@raspberrypi.com
Subject: Re: pcie_bwctrl fails to probe on Rpi 4 (linux-next-20241101)
In-Reply-To: <26c4c8fd-6afd-44fe-83a9-adebc1a281bc@broadcom.com>
Message-ID: <85ebe4b7-b18d-e993-b298-a8b5240dee3c@linux.intel.com>
References: <dcd660fd-a265-4f47-8696-776a85e097a0@gmx.net> <26c4c8fd-6afd-44fe-83a9-adebc1a281bc@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1879004631-1730724097=:989"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_044146_273790_552DC317 
X-CRM114-Status: GOOD (  20.46  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1879004631-1730724097=:989
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Adding Thomas.

On Sat, 2 Nov 2024, Florian Fainelli wrote:
> On 11/2/2024 9:53 AM, Stefan Wahren wrote:
> >
> > I tested linux-next-20241101 with the Raspberry Pi 4 (8 GB RAM,
> > arm64/defconfig) and during boot the driver pcie_bwctrl fails to probe.
> > Since this driver is very new, I assume this never worked before:
> >=20
> > [=C2=A0=C2=A0=C2=A0 6.843802] brcm-pcie fd500000.pcie: host bridge /scb=
/pcie@7d500000
> > ranges:
> > [=C2=A0=C2=A0=C2=A0 6.843851] brcm-pcie fd500000.pcie:=C2=A0=C2=A0 No b=
us range found for
> > /scb/pcie@7d500000, using [bus 00-ff]
> > [=C2=A0=C2=A0=C2=A0 6.843900] brcm-pcie fd500000.pcie:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 MEM
> > 0x0600000000..0x0603ffffff -> 0x00f8000000
> > [=C2=A0=C2=A0=C2=A0 6.843940] brcm-pcie fd500000.pcie:=C2=A0=C2=A0 IB M=
EM
> > 0x0000000000..0x00bfffffff -> 0x0400000000
> > [=C2=A0=C2=A0=C2=A0 6.859915] vchiq: module is from the staging directo=
ry, the quality
> > is unknown, you have been warned.
> > [=C2=A0=C2=A0=C2=A0 6.885670] brcm-pcie fd500000.pcie: PCI host bridge =
to bus 0000:00
> > [=C2=A0=C2=A0=C2=A0 6.885704] pci_bus 0000:00: root bus resource [bus 0=
0-ff]
> > [=C2=A0=C2=A0=C2=A0 6.885725] pci_bus 0000:00: root bus resource [mem
> > 0x600000000-0x603ffffff] (bus address [0xf8000000-0xfbffffff])
> > [=C2=A0=C2=A0=C2=A0 6.885823] pci 0000:00:00.0: [14e4:2711] type 01 cla=
ss 0x060400 PCIe
> > Root Port
> > [=C2=A0=C2=A0=C2=A0 6.885858] pci 0000:00:00.0: PCI bridge to [bus 01]
> > [=C2=A0=C2=A0=C2=A0 6.885876] pci 0000:00:00.0:=C2=A0=C2=A0 bridge wind=
ow [mem
> > 0x600000000-0x6000fffff]
> > [=C2=A0=C2=A0=C2=A0 6.885954] pci 0000:00:00.0: PME# supported from D0 =
D3hot
> > [=C2=A0=C2=A0=C2=A0 6.909911] pci_bus 0000:01: supply vpcie3v3 not foun=
d, using dummy
> > regulator
> > [=C2=A0=C2=A0=C2=A0 6.910159] pci_bus 0000:01: supply vpcie3v3aux not f=
ound, using
> > dummy regulator
> > [=C2=A0=C2=A0=C2=A0 6.910251] pci_bus 0000:01: supply vpcie12v not foun=
d, using dummy
> > regulator
> > [=C2=A0=C2=A0=C2=A0 6.922254] mmc1: new high speed SDIO card at address=
 0001
> > [=C2=A0=C2=A0=C2=A0 7.013175] brcm-pcie fd500000.pcie: clkreq-mode set =
to default
> > [=C2=A0=C2=A0=C2=A0 7.015309] brcm-pcie fd500000.pcie: link up, 5.0 GT/=
s PCIe x1 (SSC)
> > [=C2=A0=C2=A0=C2=A0 7.015526] pci 0000:01:00.0: [1106:3483] type 00 cla=
ss 0x0c0330 PCIe
> > Endpoint
> > [=C2=A0=C2=A0=C2=A0 7.015626] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0=
x00000fff 64bit]
> > [=C2=A0=C2=A0=C2=A0 7.015954] pci 0000:01:00.0: PME# supported from D0 =
D3hot
> > [=C2=A0=C2=A0=C2=A0 7.062153] pci 0000:00:00.0: bridge window [mem
> > 0x600000000-0x6000fffff]: assigned
> > [=C2=A0=C2=A0=C2=A0 7.062191] pci 0000:01:00.0: BAR 0 [mem 0x600000000-=
0x600000fff
> > 64bit]: assigned
> > [=C2=A0=C2=A0=C2=A0 7.062221] pci 0000:00:00.0: PCI bridge to [bus 01]
> > [=C2=A0=C2=A0=C2=A0 7.062237] pci 0000:00:00.0:=C2=A0=C2=A0 bridge wind=
ow [mem
> > 0x600000000-0x6000fffff]
> > [=C2=A0=C2=A0=C2=A0 7.062255] pci_bus 0000:00: resource 4 [mem 0x600000=
000-0x603ffffff]
> > [=C2=A0=C2=A0=C2=A0 7.062269] pci_bus 0000:01: resource 1 [mem 0x600000=
000-0x6000fffff]
> > [=C2=A0=C2=A0=C2=A0 7.062590] pcieport 0000:00:00.0: enabling device (0=
000 -> 0002)
> > [=C2=A0=C2=A0=C2=A0 7.062812] pcieport 0000:00:00.0: PME: Signaling wit=
h IRQ 39
> > [=C2=A0=C2=A0=C2=A0 7.072890] pcieport 0000:00:00.0: AER: enabled with =
IRQ 39
> > [=C2=A0=C2=A0=C2=A0 7.091767] v3d fec00000.gpu: [drm] Using Transparent=
 Hugepages
> > [=C2=A0=C2=A0=C2=A0 7.124274] genirq: Flags mismatch irq 39. 00002084 (=
PCIe bwctrl) vs.
> > 00200084 (PCIe PME)
> > [=C2=A0=C2=A0=C2=A0 7.124391] pcie_bwctrl 0000:00:00.0:pcie010: probe w=
ith driver
> > pcie_bwctrl failed with error -16
>=20
> Yes this is a new failure for sure. So PME requests the interrupt line wi=
th
> IRQF_TRIGGER_HIGH | IRQF_SHARED | IRQF_COND_ONESHOT whereas the bwctrl dr=
iver
> does: IRQF_TRIGGER_HIGH | IRQF_SHARED | IRQF_ONESHOT. Reading through the
> comment of IRQF_COND_ONESHOT, that does not seem to be an incompatible
> configuration, but maybe it is an ordering issue here?

Certainly looks ordering might explain the failure. pcie_pme_probe() only=
=20
passes IRQF_SHARED flag though but I guess something within IRQ subsys=20
adds the rest of the flags.

> That is, bwctlr should claim the interrupt line first, and then PME=20
> would too, and they would be OK with the flags?

Also hotplug is sharing this same IRQ and is not providing IRQF_ONESHOT,=20
that might not be problem on RPI but could be on some other machine.

Perhaps both PME and hotplug should just add IRQF_ONESHOT flag so that the=
=20
probe order doesn't matter. Or should IRQ subsystem not fail with this=20
ordering of flags? Thomas?

--=20
 i.

--8323328-1879004631-1730724097=:989--

