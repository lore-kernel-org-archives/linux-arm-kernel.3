Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8347FEC1430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 12:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lWwoqo46Zr/3jyyKrQqeEXquRAWf+PTNX5MMsSlQxIA=; b=PI9ba4h3+kigvC
	Gw0E9dbeby9AMm7gvHF2VB8SfRBBTiUxr7m5YJlbOY5QtDplVr/BjlBzTUHxdXk3bxNebMdjgr86a
	W/d6Okl1pZjPj+4vRmTjJy91Fpu/A92QTOEEjeYpc+14jCAYZBCvFXFK/XcIX1NzGKORIaa+vEiQH
	RIFbviWFpLwQdeV272MSoIrU2G+qz6Zv+xzvuKGPMl/JYelBqOjbQR6KQ4po/0fz6oSvDKaQx6w7p
	vFjW5cb5v9UqScPhrNwa4+dVNtRqxvwRo39buopnLaFGsdonrVpgCJ0wV2fiE150QJ3zBg1N9skjI
	x1huCFbncUGdp8R8VZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxP1G-0000000F9lv-2q3w;
	Tue, 03 Mar 2026 12:38:34 +0000
Received: from mx-relay100-hz2.antispameurope.com ([94.100.136.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxP1B-0000000F9l5-0Czb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 12:38:32 +0000
ARC-Authentication-Results: i=1; mx-gate100-hz2.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=lWwoqo46Zr/3jyyKrQqeEXquRAWf+PTNX5MMsSlQxIA=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772541499;
 b=p4eeD65/HSwYMHduCVhmeQ6NDme/xl8fAKKEuhMwa94eyGmiFvEFqy+Gh/7LHeeIyA/U1GjZ
 6n/37Ea+DwDWZYeSm9veUSuxdziIW0ICAUmmmY50elquQVPE9Iyw0GIQ/MKaS0gsm7+xO8aHl2i
 TqaF43ph9TM9ae70O9kFnV3ZOnJLvxqccU5KEsn4SwslLnVE60lBGBewNf01821bGHYFBbXACJn
 H5OQgXbUft4fpqBHkbz3lYSsVFys/FdHZm1xehvobK6ybz0bP3u7JR3Etvvx3o7byJopKG5YIvA
 KBYTnOC1GRoOVTdGHM0mIVKoHJMXnu8crMzeYgXzPpYrw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772541499;
 b=m06zhksKEvskTUbNkSB6w+m2k70nVtpmVy0Rusutt+V97ZGInP3wPAWTpTKJ41McU9NkFz5m
 G5roaEXwssj/9X53o7qT/Zm63aaZrp3ejvWSBPs20eJHoNGSszMjm3glbpWBXN/5oZNi3zYE6dl
 cScniysgljueU5z0rP+EmfyTovHe/b6qt7uJ7rapjo1z8xskPqI2xCPn1wq8qQmtlgHOk5n9eFa
 Ryj+EUOO5fsJpYN4u7KAzGESkOBCPvgsCmjz7V3Bs+bmKiWb8eI0ZWXYyKyNUUfkIEo37Hg3mYv
 PF+pHL2VjkN+z8QoODGZWTNnUKM6tJ9rutSIbZbRdGTJg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay100-hz2.antispameurope.com;
 Tue, 03 Mar 2026 13:38:19 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AA64E220B43;
	Tue,  3 Mar 2026 13:38:13 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, Richard Zhu <hongxing.zhu@nxp.com>
Subject: i.MX8M Plus PCIe link regression
Date: Tue, 03 Mar 2026 13:38:13 +0100
Message-ID: <23024521.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay100-hz2.antispameurope.com with 4fQFhP74nLz3PJhp
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 850274fae2b2e7370f7fd9100b832d79
X-cloud-security: scantime:1.471
DKIM-Signature: a=rsa-sha256;
 bh=lWwoqo46Zr/3jyyKrQqeEXquRAWf+PTNX5MMsSlQxIA=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772541499; v=1;
 b=k+1YqcNUWljzjdCJJY24N2/ntiX6+E0vhWCSP+Yj+OYwe2c5Dmjm+cmFxqPCBtepYdeXdRet
 I3SsJfPME50EXM8p+RXl7tzaw3EqAY4yrtnEvqmL4cbTb/grAnniCp5kShA1ubrYz2MZBcW22v/
 BeapG4LAHnYUTtPVGDeAVgTl0Pfu6sKJApRaDv80ij3QmyELCviFjB9qeDMSLQ5/9iJO8zbCSxA
 zY5kAR5TB3eJsZEWbiPw4Pl3nGBuo7lbekLzhcVHhMZbunQU9xquQpODfiBrVR5hCtYYtZ8ax3M
 EGz5D9HnGvwQnbEBQ5HfpkVCqZYX/KIMyMkvn9HpHsdiA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_043829_394873_57B3B6C3 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
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

Hi,

these days I noticed that there is a PCIe link regression on my i.MX8MP
platform (TQMa8MPxL) running next-20260227.
I could bisect it back to commit 9c03e30e3ade3 ("PCI: imx6: Skip link up=20
workaround for newer platforms"). I always get the following errors:

imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM: CFG_LINKWD_START
imx6q-pcie 33800000.pcie: probe with driver imx6q-pcie failed with error -1=
10

Connected is a Gen1 PCIe -> Ethernet adapter. Interestingly a Gen2 device is
detected without issues.

Reverting 3c96a61dd2e098dda8dcac3dce3d38a3c87afbfc and
b9a8d28ebbf118bb3eac953f4a37abbd341257ab "fixes" my platform, both Gen 1 and
Gen 2 devices are detect. Commit 3c96a61dd2e098dda8dcac3dce3d38a3c87afbfc i=
s only
required for conflict free revert.

Here is a summary with outputs:
Gen 1 device
> 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> 01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
> RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 01)

Gen 2 device
> 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> 01:00.0 SATA controller: Marvell Technology Group Ltd. 88SE9128 PCIe SATA=
 6
> Gb/s RAID controller (rev 20)

output of "dmesg | grep imx6q-pcie". Common part for all tests:
> imx6q-pcie 33800000.pcie: host bridge /soc@0/pcie@33800000 ranges:
> imx6q-pcie 33800000.pcie:       IO 0x001ff80000..0x001ff8ffff ->
> 0x0000000000
> imx6q-pcie 33800000.pcie:      MEM 0x0018000000..0x001fefffff ->
> 0x0018000000
> imx6q-pcie 33800000.pcie: config reg[1] 0x1ff00000 =3D=3D cpu 0x1ff00000
> imx6q-pcie 33800000.pcie: iATU: unroll T, 4 ob, 4 ib, align 64K, limit 16G

next-20260227
Gen 1
> imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM: CFG_LINKWD_START
> imx6q-pcie 33800000.pcie: probe with driver imx6q-pcie failed with error =
=2D110

Gen 2
> imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up
> imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00

next-20260227 + reverts
Gen 1
> imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00

Gen 2
> imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up
> imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00

What can we do here? I'm wondering why Gen 2 trains correctly, while Gen 1
doesn't.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



