Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04135EB7ECD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 10:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tc5060lOULfVsdNRxfTIuSjgRGoa5zkf8LbdJsu7Flc=; b=XUEpfFD79WVrU4uyCnly7CQEpk
	Lt0C6osMhjPF7dGwt4rjAtcKiS0relJ1/c3HVlLJcXUFOMeYUQr6DNUv0V1y08saxqotM6fq/CamJ
	AkXw51j+T3i/AnOwp5NGLqCeDq2GeGFd59c9AKgU8vUm2LOMB8VLbiPBsMEf/KzvPrsghi80YTE6G
	tKugpxJf0Jcjv3JHMaxfcjBvy6jwq3QsuXsQIGtm0lsXjkzjOrAmL0C223hxWcbnnkw6e1lgX55nl
	HLTAe36g8ZjSPDsCT7FQm7U44HEo0wb1QQY6tJlJvRuzZiJC7z60ineHd+M2yYqtECKJTcGZUi/yg
	0fBznKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjmz-0000000H0qb-1pB0;
	Wed, 04 Mar 2026 10:49:13 +0000
Received: from mx-relay28-hz2.antispameurope.com ([94.100.136.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjmv-0000000H0pM-3CTA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 10:49:12 +0000
ARC-Authentication-Results: i=1; mx-gate28-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Tc5060lOULfVsdNRxfTIuSjgRGoa5zkf8LbdJsu7Flc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772614049;
 b=NmqwiAfnjl1u5J5Pua6NHunN2ghLD8aRuv0YiH+otLGuTQylBRGMI0avy4PEYxciyUYc559Y
 JW4F/xQnwc581zZTY5CycvZl1EwrMjJwVYh2dhf1tpKSvBnQGGp6uzowLNqt2Em4ZAzlCVXUU65
 ySlu7cidETjYp5zKAksXWIX2QTSJALFek9KYpQAlJLj8DfFuheAGDOGGRVaRXJI9LH36tIc97QC
 WNUh7gaun2ypCeXFdOomVkUzPx45VdjSNpywtjCvHAFaM4Li00nV1wPvkHtCBgFCmnbocnoyCNW
 idyg6ag2eLc+904/Qdv3bwcEzPWFhDK7dNuXPw/3XdsJQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772614049;
 b=S9GdKs/OFi0CaEtacRA0rOX01FyAJv43PxdkWQaJdwa/bdIQ05z9TfjD1dJo9q0q2QTw1d5D
 cGG+f3puuV5ZJqmmIf3xL1CeOiLvaIWxi3+eicos3hsy1N3TkZRXrKo9posCXoSmNXfKQfz26hr
 ENxHq6eo08Zv48zfDVESj7LzBtfaGzdiUoecnn8L7QbVK81TWbNJAy7ZFtSl1JAf75e2o1cFa6y
 5hAp+ePQ+DDIS5tPMQUjFZgGCR5rkcpkwTLXxmmIstfe5E+oerREM0Ts5Nr84sNG4Uo/pmFOeOT
 1LVNLfV+Sw9Is6FKoKhCdgOLLVcxvswgWMe0Yhgm7u/5A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay28-hz2.antispameurope.com;
 Wed, 04 Mar 2026 09:47:29 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5ED3ACC0D36;
	Wed,  4 Mar 2026 09:47:23 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: i.MX8M Plus PCIe link regression
Date: Wed, 04 Mar 2026 09:47:23 +0100
Message-ID: <6102060.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <2qto2ddqmtks37wxtklxo4ctvxyezmgtjcuprnk6crant5fvsu@vdbmqomrcqt3>
References: <23024521.EfDdHjke4D@steina-w>
 <AS8PR04MB88332979F06EDE29E751BCE18C7CA@AS8PR04MB8833.eurprd04.prod.outlook.com>
 <2qto2ddqmtks37wxtklxo4ctvxyezmgtjcuprnk6crant5fvsu@vdbmqomrcqt3>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay28-hz2.antispameurope.com with 4fQmWb5Jc5z1QKgG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 327ce3c9e8c61b36ad9fc7d5cc2ee034
X-cloud-security: scantime:1.715
DKIM-Signature: a=rsa-sha256;
 bh=Tc5060lOULfVsdNRxfTIuSjgRGoa5zkf8LbdJsu7Flc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772614049; v=1;
 b=Mofox+Yl4CbXqSnmNvdDgGo9detVBB3+AUo4ofzktcSzrM+OyLejEFeuVWhbnR7p6LNZHbja
 HHnRCE7EzrEKncdBhpBBf4pTHq0Wryae/h/EmoPMTmxoqfBBxfqhuemm2UxMMgTHjBpy3KYUicH
 3/qquuOAD50T83DZ5iMTPC4A6VUi66a5z+af/GyUYOpdLxWS8WNRij0mkaqs6Zx07KIkd8ft/eY
 c/dBG/OYBhJ13pTDsZuPxBYW2q9cxOpoQGdMopWvonNQdVE7CgKyQArnTaRHw9fG/mrqgyVm58q
 7SQ20vMQ/pdExKgZAJcQIb242V6Ggo14vMTAkhBXo+41g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_024910_061410_D5AAAD9D 
X-CRM114-Status: GOOD (  35.44  )
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

Am Mittwoch, 4. M=C3=A4rz 2026, 07:32:48 CET schrieb Manivannan Sadhasivam:
> On Wed, Mar 04, 2026 at 02:55:51AM +0000, Hongxing Zhu wrote:
> > > -----Original Message-----
> > > From: Manivannan Sadhasivam <mani@kernel.org>
> > > Sent: 2026=E5=B9=B43=E6=9C=884=E6=97=A5 0:42
> > > To: Hongxing Zhu <hongxing.zhu@nxp.com>; Alexander Stein
> > > <alexander.stein@ew.tq-group.com>
> > > Cc: linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > > imx@lists.linux.dev
> > > Subject: Re: i.MX8M Plus PCIe link regression
> > >=20
> > > On Tue, Mar 03, 2026 at 01:38:13PM +0100, Alexander Stein wrote:
> > > > Hi,
> > > >
> > > > these days I noticed that there is a PCIe link regression on my
> > > > i.MX8MP platform (TQMa8MPxL) running next-20260227.
> > > > I could bisect it back to commit 9c03e30e3ade3 ("PCI: imx6: Skip li=
nk
> > > > up workaround for newer platforms"). I always get the following err=
ors:
> > > >
> > > > imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM:
> > > > CFG_LINKWD_START imx6q-pcie 33800000.pcie: probe with driver
> > > > imx6q-pcie failed with error -110
> > > >
> > > > Connected is a Gen1 PCIe -> Ethernet adapter. Interestingly a Gen2
> > > > device is detected without issues.
> > > >
> > > > Reverting 3c96a61dd2e098dda8dcac3dce3d38a3c87afbfc and
> > > > b9a8d28ebbf118bb3eac953f4a37abbd341257ab "fixes" my platform, both
> > > Gen
> > > > 1 and Gen 2 devices are detect. Commit
> > > > 3c96a61dd2e098dda8dcac3dce3d38a3c87afbfc is only required for confl=
ict
> > > free revert.
> > > >
> > > > Here is a summary with outputs:
> > > > Gen 1 device
> > > > > 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> > > > > 01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
> > > > > RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (r=
ev
> > > > > 01)
> > > >
> > > > Gen 2 device
> > > > > 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
> > > > > 01:00.0 SATA controller: Marvell Technology Group Ltd. 88SE9128 P=
CIe
> > > > > SATA 6 Gb/s RAID controller (rev 20)
> > > >
> > > > output of "dmesg | grep imx6q-pcie". Common part for all tests:
> > > > > imx6q-pcie 33800000.pcie: host bridge /soc@0/pcie@33800000 ranges:
> > > > > imx6q-pcie 33800000.pcie:       IO 0x001ff80000..0x001ff8ffff ->
> > > > > 0x0000000000
> > > > > imx6q-pcie 33800000.pcie:      MEM 0x0018000000..0x001fefffff ->
> > > > > 0x0018000000
> > > > > imx6q-pcie 33800000.pcie: config reg[1] 0x1ff00000 =3D=3D cpu 0x1=
ff00000
> > > > > imx6q-pcie 33800000.pcie: iATU: unroll T, 4 ob, 4 ib, align 64K,
> > > > > limit 16G
> > > >
> > > > next-20260227
> > > > Gen 1
> > > > > imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM:
> > > > > CFG_LINKWD_START imx6q-pcie 33800000.pcie: probe with driver
> > > > > imx6q-pcie failed with error -110
> > > >
> > > > Gen 2
> > > > > imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up imx6q-pcie
> > > > > 33800000.pcie: PCI host bridge to bus 0000:00
> > > >
> > > > next-20260227 + reverts
> > > > Gen 1
> > > > > imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up imx6q-pcie
> > > > > 33800000.pcie: PCIe Gen.1 x1 link up imx6q-pcie 33800000.pcie: PCI
> > > > > host bridge to bus 0000:00
> > > >
> > > > Gen 2
> > > > > imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up imx6q-pcie
> > > > > 33800000.pcie: PCIe Gen.2 x1 link up imx6q-pcie 33800000.pcie: PCI
> > > > > host bridge to bus 0000:00
> > > >
> > > > What can we do here? I'm wondering why Gen 2 trains correctly, while
> > > > Gen 1 doesn't.
> > > >
> > >=20
> > > Thanks for the report and sorry for the breakage. Commit 9c03e30e3ade=
3,
> > > mentions that the workaround is only needed for the i.MX6 platforms. =
So
> > > I'm not sure why the patch breaks i.MX8M and that too only for Gen 1
> > > speed.
> > >=20
> > > Also, before 9c03e30e3ade3, LTSSM was always started in Gen 1, but as=
 per
> > > your finding, only Gen 1 devices fail to work. So the code till
> > > imx_pcie_wait_for_speed_change() shouldn't have an impact. Maybe the
> > > issue is due to skipping imx_pcie_wait_for_speed_change()?
> > >=20
> > > Richard, thoughts?
> > Hi Maini:
> > Prior to calling imx_pcie_wait_for_speed_change(), the PCIe link must
> >  already be established. Before commit 9c03e30e3ade3, the speed change
> >  procedure was only initiated after the initial Gen1 link was successfu=
lly
> >  brought up.
> >=20
> > Hi Alexander:
> > Sorry for the breakage.
> > Before commit 9c03e30e3ade3, i.MX8MP PCIe forced Gen1 link training
> >  initially, then switched to Gen3 after link-up by triggering a speed
> >  change. After commit 9c03e30e3ade3, link training starts directly at
> >  the Gen3 capability level.
> >=20
> > The two link training methods differ only in the i.MX8MP Root Complex (=
RC)
> >  link capability configuration prior to link training: one method forces
> >  Gen1 speed, while the other retains the default Gen3 setting in your t=
ests.
> >=20
>=20
> I still don't understand why the link fails to train at Gen 1.

Independently from the configured maximum link speed, shouldn't the initial
link be Gen1 anyway and upgraded to Gen 2 later on?

I added some debug output to dw_pcie_link_up()

imx6q-pcie 33800000.pcie: dw_pcie_link_set_max_speed: current pci->max_link=
_speed: 3
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f704
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x28000000
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f722
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM: CFG_LINKWD_START
imx6q-pcie 33800000.pcie: probe with driver imx6q-pcie failed with error -1=
10


imx6q-pcie 33800000.pcie: dw_pcie_link_set_max_speed: current pci->max_link=
_speed: 2
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x28000000
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x28000000
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM: CFG_LINKWD_START
imx6q-pcie 33800000.pcie: probe with driver imx6q-pcie failed with error -1=
10


imx6q-pcie 33800000.pcie: dw_pcie_link_set_max_speed: current pci->max_link=
_speed: 1
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08000010
imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00

So for any maximum speed above Gen1 it seems that LTSSM is stuck at link
training.
Unfortunately only link training and link up bits are defined and RM doesn't
show anything, so I don't know what the other bits are indicating.

=46or a Gen2 device the link training succeeds right away.

imx6q-pcie 33800000.pcie: dw_pcie_link_set_max_speed: current pci->max_link=
_speed: 2
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08000010
imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up
imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/



