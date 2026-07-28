Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9207C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ybSKEzGQ5u2NMO+gbB/863i60nxaiJ8Z4XJDEf1OGQ=; b=Xo/31bSt1SEgEuv2tc/fjuvXf/
	KGyfNmjH/vm2ZuLzvudKtEiPiZ4UvlBX9GF7Ksdxsvf7AbS4Tp0bw03VN+Ep7exVG1QPUt9oYk211
	+WBqlX/ml73FlJyzgCcxxln/PCJ+xDizxZmjIDWsR9mP4HLrHF0nj2TlIQC9nMVhvrFrvlIK4DXJc
	/JWwTJY3TEQJMMo8jS2edsf7Ykp0UOusKesnsKxAZMPcyg5tEBEuVDoaK1Ph6GQfAiXFsxapjNqtD
	UzoY++AvCDde2FQ6qBreKp1PI7NRmROvToKDaHU5tLUzcr6SwR3ZkXyyLzUVbsnC5ygQpcRqC5/wb
	Mo43uXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojyB-00000005gOh-0afd;
	Tue, 28 Jul 2026 15:43:51 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojy6-00000005gO8-2Ejq;
	Tue, 28 Jul 2026 15:43:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1785253418; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kvA+SlADh2Ji4j7M+ygIfzpgQ5H0BsLWV+boQ7UTIXZ4Ea54NQFvw8JyB8U41Eaz3bFufEMyNoyBNQFnS1iqyUYOq6x6fiDF4exux3DsPX0JaxYIRJDqbA1LvgJi2EoBCl+4PMPSkK+EK6snf49CWBKRshTl/1Xl91UZaE8SQA8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785253418; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5ybSKEzGQ5u2NMO+gbB/863i60nxaiJ8Z4XJDEf1OGQ=; 
	b=ccG8srgWbEYplGm1rVGetwMosqKzaDobdoJ/fxwrW1P9EQbxPnlix8ERzMOBNr3R2Mz2jEwsgvaymQwozlTsSH7+r+OZ4MqCBgKBRROF/3NKcPjr6zBf01q/S7YaQgbAYa13IDHvjUpcdHh47finXib4zO4RXCQvqqKCdiRnoJc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785253418;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=5ybSKEzGQ5u2NMO+gbB/863i60nxaiJ8Z4XJDEf1OGQ=;
	b=AXHmBWltmad8orxw3C8RjAF2DPT2Jb6vE0DmfFoOWcXD1kL/LKjzuQowkpIpMc4d
	iMBPMLU5ZF1zZLJ9yChBcxCAbMHOf7l3kuGuF6a4xmwKiztSjvIh0fv0/Ru7bn05ml1
	tsYXw3UBS9sUKXjovPvQ40Vw/fMZJs480uTqTOPM3Xq7k325JlpEbyjDJtJO3twnd8Y
	pgkrccmd6SLg9p+pOQUJA0ZaMh0VhB68Rjfcnf4k1T1jjbrcJMV40085vi8vHtkjeRH
	HHW4RRLvlrlvUAztiqsnlC3QVfyKIICmg8WsY/QG5Q4Irhy93zLnQ7FTfx+LEKATZ9d
	qqS63cV8tw==
Received: by mx.zohomail.com with SMTPS id 178525341670299.13270915750854;
	Tue, 28 Jul 2026 08:43:36 -0700 (PDT)
Message-ID: <1ba1545c318214d988e899a95279b4b0f93bc24e.camel@rong.moe>
Subject: Re: [PATCH v2] Bluetooth: Properly disable remote wakeup for
 MT7922/MT7925 on Ryzen platform
From: Rong Zhang <i@rong.moe>
To: Rafael Passos <rafael@rcpassos.me>, Marcel Holtmann
 <marcel@holtmann.org>,  Luiz Augusto von Dentz	 <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Chris Lu
 =?Big5?Q?=28=B3=B0=B8X=AAl=29?=
	 <Chris.Lu@mediatek.com>, Will-CY Lee =?Big5?Q?=28=A7=F5=ACF=BFo=29?=
	 <Will-CY.Lee@mediatek.com>, SS Wu =?Big5?Q?=28=A7=C5=BE=CB=AAY=29?=
	 <ss.wu@mediatek.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
In-Reply-To: <DKAA9VN5E4DS.2U03T6V5HEAAE@rcpassos.me>
References: <20260701-btmtk-ryzen-remote-wakeup-v2-1-767ac7907472@rong.moe>
	 <DJRKO72HWZOI.QJYJUAC45QOJ@rcpassos.me>
	 <79D5F3E6-8F40-4422-BB2D-16691E377394@rong.moe>
	 <DJRP3YO7Y0WK.20KNRZIMX1CYK@rcpassos.me>
	 <F16A2A9A-A43F-45FE-8CC0-44A129360D47@rong.moe>
	 <DKA8F33O8HID.2UV2DWTLE6S48@rcpassos.me>
	 <133c4858657c55b31affd4bff1cbd68f812de5e1.camel@rong.moe>
	 <DKAA9VN5E4DS.2U03T6V5HEAAE@rcpassos.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 23:38:26 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10 
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_084346_642479_A8F02E4C 
X-CRM114-Status: GOOD (  27.40  )
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

Hi Rafael,

On Tue, 2026-07-28 at 11:45 -0300, Rafael Passos wrote:
> Hi Rong,
>=20
> On Tue Jul 28, 2026 at 11:00 AM -03, Rong Zhang wrote:
> > > I believe its a hub connected to the chipset.
> > >=20
> > > /:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/12=
p, 480M
> > >     | ...
> > >     |__ Port 008: Dev 004, If 0, Class=3DWireless, Driver=3Dbtusb, 48=
0M
> > >=20
> > > In the block diagram on the manual [1], Key "E" Wifi is tied
> > > to the AMD PROM21 CHipset.
> >=20
> > Yes, and no.
> >=20
> > The block diagram indicates that the NIC card's PCIe interface (note th=
e
> > "x1") is connected to the chipset, without any mention of its USB
> > interface.
> >=20
> > Based on the bus number (001), it's more likely a root hub of the SoC
> > instead of the chipset.
> >=20
> > You can check the root hub's PCI path with
> >=20
> >    realpath /sys/bus/usb/devices/usb1
> >=20
> > Then you can cross-check with the PCI topology, i.e., `lspci -tnnnvvv'.
>=20
> Interesting!
>=20
> lspci -tnnnvvv
> -[0000:00]-+-00.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Root Complex [1022:14d8]
>            +-00.2  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge IOMMU [1022:14d9]
>            +-01.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Dummy Host Bridge [1022:14da]
>            +-01.1-[01-03]----00.0-[02-03]----00.0-[03]--+-00.0  Advanced =
Micro Devices, Inc. [AMD/ATI] Navi 21 [Radeon RX 6800/6800 XT / 6900 XT] [1=
002:73bf]
>            |                                            \-00.1  Advanced =
Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller [1002:ab2=
8]
>            +-02.0  Advanced Micro Devices, Inc. [AMD] Raphael/Granite Rid=
ge Dummy Host Bridge [1022:14da]
>            +-02.1-[04-0e]----00.0-[05-0e]--+-00.0-[06]--
>            |                               +-02.0-[07]----00.0  MEDIATEK =
Corp. MT7925 (RZ717) Wi-Fi 7 160MHz [14c3:0717]
>            |                               +-03.0-[08]----00.0  Realtek S=
emiconductor Co., Ltd. RTL8125 2.5GbE Controller [10ec:8125]
>            ...

You snipped too many lines. There should be a line similar to

           |                               +-0c.0-[0d]----00.0  Advanced Mi=
cro Devices, Inc. [AMD] XXXX [YYYY:ZZZZ]

which is the root hub.

>=20
>=20
> realpath /sys/bus/usb/devices/usb1
> /sys/devices/pci0000:00/0000:00:02.1/0000:04:00.0/0000:05:0c.0/0000:0d:00=
.0/usb1

Based on the PCIe bridge chain being so long, it now looks more likely a
root hub of the chipset, hmm...

>                 ------               --------------------
>                 /                    |
>         This matches the             \--and this matches the chain before
>         root complex                    the MT7925.

... and yes, it shares the same PCIe router with MT7925. I can 99%
confirm it's a USB root hub of the chipset now.

So it really seems that the MT7925 is quite uncomfortable with AMD's USB
root hub, no matter on the SoC (my case) or the chipset (your case),
which makes some sense as they probably share the same xHCI controller IP
core.

Because of that, I still suspect that you have encountered the same
autoresume bug. Running into the bug is just like triggering a kill-
switch that requires some sorts of platform reset (power cycle in my
case, and BIOS reset in your case) to make a recover.

>=20
> Am I on the right path ?
>=20
> > > It is integrated (soldered) to my motherboard.
> >=20
> > Huh? How can an M.2 "Key E WiFi" expansion card being soldered to a
> > "vertical M.2 socket"?
> >=20
> > AFAIK, once the metal shield(s) are unscrewed, it should be replaceable=
,
> > see
> > https://www.techpowerup.com/review/asrock-b850-steel-legend-wi-fi/4.htm=
l
> >=20
> > But it doesn't matter anyway since the issue has gone ;-)
>=20
> Oh ! Its vertical ! You nailed it!
> I assumed it was soldered because there was no space there for a
> horizontal layout (and I didnt try unscrewing it). Neat!

In the foreseeable future I am not going to have a desktop platform ($$$)
so I can't easily debug the issue myself. Hence, it would be helpful if
you could reliably reproduce the issue, so that we can have an in-depth
debug. But let's forget it for the time being since your device works
fine now!

Thanks,
Rong

>=20
> Thanks,
> Rafael Passos

