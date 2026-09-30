Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4326FCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AWkXYD/MD09FFhnuG0xmwYrcKAW4aflAM4wC217Zdk=; b=pmuGIcmaEe3rIGW/IDGgXV8SxI
	lcDLvEDP7aH1ZRhUTRzaT5NXresIOHekWybejxD3hqn8ZtrDAVYqgeXwniEJ1fzMgHhpzWDFJsESD
	Dwt/kva1GXgQIHMKYK3m4c7rx4VjWvE9mFRHj0KoFjjI2dHZTKBPinjrzrfsMDheRMTo2Ecjz2ay6
	MjRsJLCXUjsM0o0wZdhXblSZt8WKNECdIWlYQGdZrtF+7fjPImuUbMf4FwFe0BZPXo+MXxIYEbwVq
	V9EUqhEZwP8pFnWdkmbHGXsCBjSxPjkcm5Wo5YoZdZgLOhe4hMG90j1LLl4+3NsaLWGwUmiaHQmrq
	9yufChwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBq4Y-00000005Umq-0XJL;
	Wed, 30 Sep 2026 08:53:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBq4V-00000005UmH-34GB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 08:53:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Subject:
	Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:In-Reply-To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6AWkXYD/MD09FFhnuG0xmwYrcKAW4aflAM4wC217Zdk=; b=QsD1wD3ARxeT+0zm832SBhFeKu
	cp3FgJpLrdSqNiJcJkKliNHaVbKD9TlOPSR8DpvJtriGrQUTfWrDLKtYXhdvFIN03gY8sjkB+hc77
	32loka6NZ9z2bi8Ss2mmknw7PC5iaN30eMvV6OeMVlCO5WcQObIGP6GOSqswcieDqpaORs7NG71/i
	UYg3whFe4lJvsi5pvnA0TwHgoj6H2zXHtASFInoO9U6YmW+fXfVOs2bjEqP9pX4JfRF7XRhAIgqTg
	LeTxv8py8nGaqONIUdy3hYke140QUzkcDOIFqLjYcZyR6NjwFSQ3PIntRNSjes3IPaqLzIM0wbOvj
	pdZ4EQgA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBq4R-00000003Y4b-2ybb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:53:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 72C3E4E410CD;
	Wed, 30 Sep 2026 08:53:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44E8B60749;
	Wed, 30 Sep 2026 08:53:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 32F0D10328E7B;
	Wed, 30 Sep 2026 10:53:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790758422; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6AWkXYD/MD09FFhnuG0xmwYrcKAW4aflAM4wC217Zdk=;
	b=xXlBawrSCHtRf7uBs/H3aHyT/IlWcoN+YdbdklTn+FtklaDDpr13vhlc2/7JWF0BbTRXaF
	WFP6P947sdxTV+Tdfhc6TGaPkQv2eRtZDNLiykVjAVA8wzVUNMXdpXm+W4IEQA3WDXy8CQ
	1qULBYf0iytwiWP+3C8/H3uDDj1zDixV+4giWK8wLfHN79qYv1ZI77bHUBNGHYVy824OIb
	bWXP7vbzUDRR3VRCvH4ydGcOGZ8UJGkpUFNv3mSCs8dPBePdvMGc9ircgVTK9FkOM9qixy
	jMa530GNhnA06ee70wwYI6c9b8P0ALvhWJ1hCc60PqFoo0BfJgo04rxfGeG1NA==
From: "Gregory Clement" <gregory.clement@bootlin.com>
In-Reply-To: <AM6PR01MB56865DCADF2BF67FD3277158808B2@AM6PR01MB5686.eurprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset="utf-8"
References: <20260921-send-dt-v2-0-fb6b81002ad7@studio.unibo.it>  <AM6PR01MB56865DCADF2BF67FD3277158808B2@AM6PR01MB5686.eurprd01.prod.exchangelabs.com>
Date: Wed, 30 Sep 2026 10:53:38 +0200
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Andrew Lunn" <andrew@lunn.ch>, "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>, =?utf-8?q?devicetree=40vger=2Ekernel=2Eorg?= <devicetree@vger.kernel.org>, =?utf-8?q?linux-kernel=40vger=2Ekernel=2Eorg?= <linux-kernel@vger.kernel.org>, =?utf-8?q?linux-arm-kernel=40lists=2Einfradead=2Eorg?= <linux-arm-kernel@lists.infradead.org>, "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
To: =?utf-8?q?Nicol=C3=B2_Giuliani_-_nicolo=2Egiuliani6=40studio=2Eunibo=2Eit?= <nicolo.giuliani6@studio.unibo.it>
MIME-Version: 1.0
Message-ID: <43fd0a32-5436-4303-7d0d-2e3ca33772f7@bootlin.com>
Subject: =?utf-8?q?Re=3A?==?utf-8?q?_R=3A?= [PATCH v2 0/3] =?utf-8?q?arm64=3A?=
 =?utf-8?q?_dts=3A?==?utf-8?q?_marvell=3A?= Add Sophos XGS 107w NPU
User-Agent: SOGoMail 5.12.4
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_095348_224057_8FACDFAF 
X-CRM114-Status: GOOD (  25.67  )
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

On Wednesday, September 30, 2026 10:35 CEST, Nicol=C3=B2 Giuliani - nic=
olo.giuliani6@studio.unibo.it <nicolo.giuliani6@studio.unibo.it> wrote:

>=20
> Hi Gregory, Andrew, Sebastian,
Hello  Nicolo,

> This series has Acked-by from Krzysztof on 1/3 and 2/3, and Reviewed-=
by from Andrew on 3/3. Is there anything else needed before it can be a=
pplied, or should I wait for the next merge window?

I am working on the backlog today, either I will apply it or I will let=
 know if something is missing.

Gregory

>=20
> Thanks,
> Nicolo Giuliani
>=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> Da: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.uni=
bo.it@kernel.org>
> Inviato: luned=C3=AC 21 settembre 2026 02:26
> A: Rob Herring; Krzysztof Kozlowski; Conor Dooley; Andrew Lunn; Grego=
ry Clement; Sebastian Hesselbarth
> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-a=
rm-kernel@lists.infradead.org; Nicol=C3=B2 Giuliani - nicolo.giuliani6@=
studio.unibo.it; Krzysztof Kozlowski
> Oggetto: [PATCH v2 0/3] arm64: dts: marvell: Add Sophos XGS 107w NPU
>=20
> The Sophos XGS 87/107 desktop firewalls pair an AMD x86 host with a
> separate network processing unit (NPU): a Marvell Armada CN9130 SoC w=
ith
> its own eMMC and SPI NOR flash. The NPU serves the eight RJ45 ports a=
nd
> the SFP cage through a Marvell 88E6193X switch on its MDIO bus, which=
 is
> connected to the SoC by a 10GBASE-R link, and reaches the x86 host ov=
er
> PCIe.
>=20
> This series adds the Sophos vendor prefix, the compatible string of t=
he
> NPU board and a device tree that describes the NPU as a standalone sy=
stem:
> UART console, eMMC, SPI NOR flash, the SFP cage and the switch with i=
ts
> ports. The port LEDs, the USB ports and the PCIe link to the x86 host=
 (the
> CN9130 acts as a PCIe endpoint towards it, which needs endpoint suppo=
rt
> that is not part of this series) are not described.
>=20
> Tested on an XGS 107w with Linux 6.18: boot from eMMC, eMMC and SPI N=
OR
> access, the mvpp2 link to the switch at 10 Gb/s, the 88E6193X probing=
 with
> its eight user ports, and 936 Mbit/s through a front port. The SFP ca=
ge
> is untested.
>=20
> dt=5Fbinding=5Fcheck passes for vendor-prefixes.yaml and armada-7k-8k=
.yaml,
> and CHECK=5FDTBS=3Dy on marvell/cn9130-sophos-xgs107w.dtb reports no =
warning
> specific to this board.
>=20
> Based on the mvebu/dt branch of the mvebu tree (008e9faade).
>=20
> Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
> ---
> Changes in v2:
> - Patch 1: drop the second sentence of the commit message, add Acked-=
by
> - Patch 2: move the entry before the SolidRun ones and list only
>   marvell,cn9130 after the board compatible, as the other CN9130 boar=
ds do
> - Patch 3: use the compatible list of patch 2; pass the switch reset =
as
>   reset-gpios and drop the boot loader workaround; remove the LED
>   expander node and the SFP address comment
> - Link to v1: https://patch.msgid.link/20260919-send-dt-v1-0-365615a7=
4ef3@studio.unibo.it
>=20
> ---
> Nicolo Giuliani (3):
>       dt-bindings: vendor-prefixes: Add Sophos
>       dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
>       arm64: dts: marvell: Add Sophos XGS 107w NPU board
>=20
>  .../bindings/arm/marvell/armada-7k-8k.yaml         |   7 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  arch/arm64/boot/dts/marvell/Makefile               |   1 +
>  .../boot/dts/marvell/cn9130-sophos-xgs107w.dts     | 188 +++++++++++=
++++++++++
>  4 files changed, 198 insertions(+)
> ---
> base-commit: 008e9faadef8c0aaa9b8a3ff05a2126e3c5b08b7
> change-id: 20260919-send-dt-6bbd08a470d2
>=20
> Best regards,
> --
> Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
>=20
>


