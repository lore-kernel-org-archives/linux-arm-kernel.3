Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C3FE6780C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 20:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRAX2ENaR0UMfJOj8d1UGNAWanY+N/tfDqoGkhhiaKs=; b=B0nszCDtZL7530aMHq/Khj+gE6
	zodlNwpHhTWh8rz1St7dTTS00qTrPCvrwKcCx/pJzFvKvnjBCXN7IP0HmoNiHK3XbuQQGwjz7HJYg
	+odYgqGucC7DhO91N4unPcS44IplJJ5cfBPgcRsfvD6IsJ3pulg7qlz8yd3HTQfBnsYkUMdieI3MS
	QCADk5fJfA7+b8hxZX+V6RzCbe9eGuEgrhajsKfticJPmIoT3JWB4BBJpRtMBDLvfg8CN7UeNr6wu
	NfuLGo6sWXEhrUdq394mIzm4UpAvUlpINhqVyjcwtBBQEcbfWptErNPcZibM/YbaEgxXapDpNlr9N
	cPgRvBAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Kff-0000000AMYI-2HFT;
	Sat, 02 Nov 2024 20:24:31 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Kdy-0000000AMRW-3kGx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 20:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730578957; x=1731183757; i=wahrenst@gmx.net;
	bh=zRAX2ENaR0UMfJOj8d1UGNAWanY+N/tfDqoGkhhiaKs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=TAFDcEr7YLK33Cc7hTp0P8fiFGLvsVwaXLo1i6EJJr8O5rYM70OUdg5Hw5eFuxL/
	 eOOrI/ZP1mUuGzqGU/s6KqaRqd+yll2GK0dHlD2fnXfhGmBx9yoO7mbxi+6qQ2WDY
	 KdluWM4HeDwfPC9K1xjjN7UvrQeIxvnsqS30G+DKE1JVmvGom5Ki1WLPnP5Ze3jsf
	 9aNOFC7GaIkwGv2BmY+kvo9R2IPjwYmkFQid0z9G/2sytTRu0QikVvOReCMbZK7Ri
	 jAakB/f3naxwGkCZuhc6xX5pK1lrT4kavHoTYP0LCfpT5BDRgfw3AJ2lSBHahjldG
	 aB5Ly3+ByJi/VrWweA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MO9z7-1tVssG0hFB-00SbiK; Sat, 02
 Nov 2024 21:22:37 +0100
Message-ID: <a98a03a2-bf62-4598-bcd4-07975271e07e@gmx.net>
Date: Sat, 2 Nov 2024 21:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pcie_bwctrl fails to probe on Rpi 4 (linux-next-20241101)
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Jim Quinlan <jim2101024@gmail.com>, Lukas Wunner <lukas@wunner.de>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, kernel-list@raspberrypi.com
References: <dcd660fd-a265-4f47-8696-776a85e097a0@gmx.net>
 <26c4c8fd-6afd-44fe-83a9-adebc1a281bc@broadcom.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <26c4c8fd-6afd-44fe-83a9-adebc1a281bc@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bRRnNjncJ9/und7brzkRb+bkth3g0joXCMO6vQlG1WIudKlR+gI
 VVY7IdA4Z4nZiOhWzBucKzWugRDj9s/YUvKDOpSboQrxNOiGXk+w7JnieWR7DzxDNgwJh2y
 rWs2HPU7YTXGlCPOYd4KKPqIhNAdknuKzwG+1FyHWzxVuOzOnbwiWtgZxqr6R58ebLBK282
 sr568n0MquQAiORTdmkIQ==
UI-OutboundReport: notjunk:1;M01:P0:81YSOXPKfjk=;hgjiT11hnjsK8rhfoqQOoU/GICj
 CJpbBfap9I4EuHzrngr87EyhNvMa/36G3VNj45hQxDD0IRZlEoWDmqJF68SCRRymNiF/Gccf3
 y+KW1eAHfil93vlJ57Z09mUDptTHgy1Drloisx1G1FawLu1HIC6iUktHDaVQl2N+kP/T7Ek0P
 li9Xim2+dqhRFaNm7gHa9itutLdUnNhb2VTo1Ex4Rw0rVDN5p1J1T1o3O5bd6xxTz0Ns9N9vx
 YaJqOh0kMVIObPioKv/Abx16ob61WMrij03N2ejzM6UDAhQzKv+tOxBWjmu8FQhdV7wTfNqu7
 RR2ZxUlK5CSVWQK5V4LGNuj83mqEU6sSAB9Dm6nLmzPpVD6icTH7RXn+p7+FKNbwOSAPi40sk
 gkJzch+Vo+8uQ8gKVHKSwnZW1TU6PW0PSareElyQKq2UkEu5P5KmF/CJ7EpAYC6pzabtMIqs5
 D7fKCcuWTWP7Y0iX6Wf28jn4bFa38n07eAvAHceFpTXiCDs3JQ93D5E4dluC4e3eSVXWqC56t
 LiM0US8Ectlpsw4F2OmiNruRzKqd58pFe/sYZAr+zSXsvy4Sw6fByPbKAUdxm4/I7IMi8q0o3
 HO+JhA0XQXcuEmr2AcTlFRLWRXf1WD7jBe1QRQBwXkSslvbtexPi6FXWsPkaf3XbPbWqkis5s
 ++8AZCmNc3plIvM0KLcK0MWhRgRKv4hieFLtJFJsO+aKktbTOOnf42S2saz36fdl8qzOmJITW
 JV8+rv2zqg63pwC+Bp1wa74fsGGTQ3/XeFzJelRT3SJADFed338dsWCWEws/Xe4O+5DKlBKsM
 aLxfGmm/enwYAl1HWtZrNYrw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_132247_255006_0B99A30A 
X-CRM114-Status: GOOD (  13.83  )
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

Hi Florian,

Am 02.11.24 um 18:37 schrieb Florian Fainelli:
> Hi Stefan,
>
> On 11/2/2024 9:53 AM, Stefan Wahren wrote:
>> Hi,
>> I tested linux-next-20241101 with the Raspberry Pi 4 (8 GB RAM,
>> arm64/defconfig) and during boot the driver pcie_bwctrl fails to probe.
>> Since this driver is very new, I assume this never worked before:
>>
>> [=C2=A0=C2=A0=C2=A0 6.843802] brcm-pcie fd500000.pcie: host bridge /scb=
/pcie@7d500000
>> ranges:
>> [=C2=A0=C2=A0=C2=A0 6.843851] brcm-pcie fd500000.pcie:=C2=A0=C2=A0 No b=
us range found for
>> /scb/pcie@7d500000, using [bus 00-ff]
>> [=C2=A0=C2=A0=C2=A0 6.843900] brcm-pcie fd500000.pcie:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 MEM
>> 0x0600000000..0x0603ffffff -> 0x00f8000000
>> [=C2=A0=C2=A0=C2=A0 6.843940] brcm-pcie fd500000.pcie:=C2=A0=C2=A0 IB M=
EM
>> 0x0000000000..0x00bfffffff -> 0x0400000000
>> [=C2=A0=C2=A0=C2=A0 6.859915] vchiq: module is from the staging directo=
ry, the quality
>> is unknown, you have been warned.
>> [=C2=A0=C2=A0=C2=A0 6.885670] brcm-pcie fd500000.pcie: PCI host bridge =
to bus 0000:00
>> [=C2=A0=C2=A0=C2=A0 6.885704] pci_bus 0000:00: root bus resource [bus 0=
0-ff]
>> [=C2=A0=C2=A0=C2=A0 6.885725] pci_bus 0000:00: root bus resource [mem
>> 0x600000000-0x603ffffff] (bus address [0xf8000000-0xfbffffff])
>> [=C2=A0=C2=A0=C2=A0 6.885823] pci 0000:00:00.0: [14e4:2711] type 01 cla=
ss 0x060400 PCIe
>> Root Port
>> [=C2=A0=C2=A0=C2=A0 6.885858] pci 0000:00:00.0: PCI bridge to [bus 01]
>> [=C2=A0=C2=A0=C2=A0 6.885876] pci 0000:00:00.0:=C2=A0=C2=A0 bridge wind=
ow [mem
>> 0x600000000-0x6000fffff]
>> [=C2=A0=C2=A0=C2=A0 6.885954] pci 0000:00:00.0: PME# supported from D0 =
D3hot
>> [=C2=A0=C2=A0=C2=A0 6.909911] pci_bus 0000:01: supply vpcie3v3 not foun=
d, using dummy
>> regulator
>> [=C2=A0=C2=A0=C2=A0 6.910159] pci_bus 0000:01: supply vpcie3v3aux not f=
ound, using
>> dummy regulator
>> [=C2=A0=C2=A0=C2=A0 6.910251] pci_bus 0000:01: supply vpcie12v not foun=
d, using dummy
>> regulator
>> [=C2=A0=C2=A0=C2=A0 6.922254] mmc1: new high speed SDIO card at address=
 0001
>> [=C2=A0=C2=A0=C2=A0 7.013175] brcm-pcie fd500000.pcie: clkreq-mode set =
to default
>> [=C2=A0=C2=A0=C2=A0 7.015309] brcm-pcie fd500000.pcie: link up, 5.0 GT/=
s PCIe x1 (SSC)
>> [=C2=A0=C2=A0=C2=A0 7.015526] pci 0000:01:00.0: [1106:3483] type 00 cla=
ss 0x0c0330 PCIe
>> Endpoint
>> [=C2=A0=C2=A0=C2=A0 7.015626] pci 0000:01:00.0: BAR 0 [mem 0x00000000-0=
x00000fff 64bit]
>> [=C2=A0=C2=A0=C2=A0 7.015954] pci 0000:01:00.0: PME# supported from D0 =
D3hot
>> [=C2=A0=C2=A0=C2=A0 7.062153] pci 0000:00:00.0: bridge window [mem
>> 0x600000000-0x6000fffff]: assigned
>> [=C2=A0=C2=A0=C2=A0 7.062191] pci 0000:01:00.0: BAR 0 [mem 0x600000000-=
0x600000fff
>> 64bit]: assigned
>> [=C2=A0=C2=A0=C2=A0 7.062221] pci 0000:00:00.0: PCI bridge to [bus 01]
>> [=C2=A0=C2=A0=C2=A0 7.062237] pci 0000:00:00.0:=C2=A0=C2=A0 bridge wind=
ow [mem
>> 0x600000000-0x6000fffff]
>> [=C2=A0=C2=A0=C2=A0 7.062255] pci_bus 0000:00: resource 4 [mem 0x600000=
000-0x603ffffff]
>> [=C2=A0=C2=A0=C2=A0 7.062269] pci_bus 0000:01: resource 1 [mem 0x600000=
000-0x6000fffff]
>> [=C2=A0=C2=A0=C2=A0 7.062590] pcieport 0000:00:00.0: enabling device (0=
000 -> 0002)
>> [=C2=A0=C2=A0=C2=A0 7.062812] pcieport 0000:00:00.0: PME: Signaling wit=
h IRQ 39
>> [=C2=A0=C2=A0=C2=A0 7.072890] pcieport 0000:00:00.0: AER: enabled with =
IRQ 39
>> [=C2=A0=C2=A0=C2=A0 7.091767] v3d fec00000.gpu: [drm] Using Transparent=
 Hugepages
>> [=C2=A0=C2=A0=C2=A0 7.124274] genirq: Flags mismatch irq 39. 00002084 (=
PCIe bwctrl) vs.
>> 00200084 (PCIe PME)
>> [=C2=A0=C2=A0=C2=A0 7.124391] pcie_bwctrl 0000:00:00.0:pcie010: probe w=
ith driver
>> pcie_bwctrl failed with error -16
>
> Yes this is a new failure for sure. So PME requests the interrupt line
> with IRQF_TRIGGER_HIGH | IRQF_SHARED | IRQF_COND_ONESHOT whereas the
> bwctrl driver does: IRQF_TRIGGER_HIGH | IRQF_SHARED | IRQF_ONESHOT.
> Reading through the comment of IRQF_COND_ONESHOT, that does not seem
> to be an incompatible configuration, but maybe it is an ordering issue
> here? That is, bwctlr should claim the interrupt line first, and then
> PME would too, and they would be OK with the flags?
sorry, i don't have any clue about PCIE and the related stuff.

