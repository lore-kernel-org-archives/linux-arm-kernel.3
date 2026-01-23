Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE16D72350
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjNMi3uYqeJT6EZEf8oL0XR2ewQFjYD7V2Tq1CWUJaw=; b=OqKpL3qDll8czPKINw9P963Lp8
	ZmPiqDoCbpFAd+/Ma1Abpv2vF+HIketyhK3jNwWvpaqGmLsFD2G/vgdiQxS0uoVrG+gmve9n2PdyC
	E2tg9gfmAqe/oaqk0HBdKqRF7ZFHY7ioOf+8udBt7XqRcRIqfZgXSoVIBTn7/5uYA8rT7GbmaCEpo
	f6/b7oQro1KLnUNa21nrrUstu5NFS7jR4OZ7gaZYAbleyGztuj8IdTW0WPzqt8L8KMutnQt2QxHFt
	6I6gyR/2/YsWwC9MIXA6Wwjo0ZZDFc9L2/6nDZGBpSy2n2klMQDvz5+GzjGKes+UPBCC73uC8noHf
	a8cSC0Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDS5-00000008ZPA-1q5w;
	Fri, 23 Jan 2026 09:27:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDS3-00000008ZO1-3Is3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Jan 2026 09:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OjNMi3uYqeJT6EZEf8oL0XR2ewQFjYD7V2Tq1CWUJaw=; b=SgyRvzrnXURaxW97aEwveJkjO8
	m8kSIoogI/gbErYRF9YnwcmU8OFMGcqc4R4mAU9GrW4nDlaNnFAEnT2dFNKJjja1oBEiKZ0ysaIkz
	zVbOuDqV08r83QK54ax7hrl+PfcE0HLARj8IJ5FH0uJgeNq26YnMIdIFgvLgzjye2+3+5Y6uax+7Q
	hN7XZBkpmiDmebfJkUDxAHPUtkV5NeMmjTdR2vHcqervT5yDGQ2iCYJpO2QRDcmxttEEo7rn/Kmn7
	PCtAdBhd898Ftzcal2XLdgQXTF4RPyBVfrZknLG5HL77vXjL3XwXkda6o53iFbp2xaWK/GV8f2V1b
	efgjLYOA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDS0-000000022QB-2l4V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:27:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7C0981A2AF2;
	Fri, 23 Jan 2026 09:27:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F9486070A;
	Fri, 23 Jan 2026 09:27:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95963119A879B;
	Fri, 23 Jan 2026 10:27:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769160449; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OjNMi3uYqeJT6EZEf8oL0XR2ewQFjYD7V2Tq1CWUJaw=;
	b=cJHBVICCrIkBsWGROKu1iYDGsaGofBZWLdayRKYT+/d25Zvaq2IqZ4nLU3w/l37JMaPX1H
	5O0yNnnUjAYK3iCsXsSTLiyaf0Ias5zgvGtNaZFNTzvA0MvIDzzbLgLE2ufEPLhKeZweCc
	9qka43P9ULTbJGsxx+hGXQ6dq15MoTFDRRC2y/217G8a5P3EpGcXA+PBetsqbcKgedxOvg
	cmy+LQTnPoIeT5RDaGbVb/3EEY59GZCZtcXlblrtQbS6I+9S6aLnfaqEgYEN057Aarb8Bw
	FGvrPxt9YrTJoP2AcUwxaDZye2m0eI/fGiQO385Jd1CKPVyzls+cd7ky1fzecw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Rob Herring
 <robh@kernel.org>, Elad Nachman <enachman@marvell.com>, andrew@lunn.ch
Cc: conor+dt@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 chris.packham@alliedtelesis.co.nz, pali@kernel.org,
 devicetree@vger.kernel.org, mrkiko.rs@gmail.com,
 sebastian.hesselbarth@gmail.com, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 0/2] arm64: dts: a7k: add COM Express boards
In-Reply-To: <dc6e60ec-f460-4713-b1cc-97ceb2d344f5@bootlin.com>
References: <20260122165923.2316510-1-enachman@marvell.com>
 <176910484185.3007016.14688980539020105749.robh@kernel.org>
 <87a4y4lmn4.fsf@BLaptop.bootlin.com>
 <dc6e60ec-f460-4713-b1cc-97ceb2d344f5@bootlin.com>
Date: Fri, 23 Jan 2026 10:27:24 +0100
Message-ID: <877bt8llvn.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_092732_818565_7CA0C9A0 
X-CRM114-Status: GOOD (  16.49  )
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


> Hi,
>
> On 23/01/2026 10:10, Gregory CLEMENT wrote:
>> Hello,
>>=20
>>> On Thu, 22 Jan 2026 18:59:20 +0200, Elad Nachman wrote:
>>>> From: Elad Nachman <enachman@marvell.com>
>>>>
>>>> Add support for Armada 7020 Express Type 7 CPU module board by Marvell.
>>>> Add device tree bindings for this board.
>>>> Define this COM Express CPU module as dtsi and provide a dtsi file for
>>>> the carrier board (Marvell DB-98CX85x0 COM Express type 7 carrier boar=
d).
>>>> Add the Falcon DB to the MAINTAINERS list
>>>>
>>>> Since memory is soldered on CPU module, memory node is on CPU module
>>>> dtsi file.
>>>>
>>>> This Carrier board only utilizes the PCIe link, hence no special device
>>>> or driver support is provided by this dtsi file.
>>>> Devise a dts file for the combined com express carrier and CPU module.
>>>>
>>>> The Aramda 7020 CPU COM Express board offers the following features:
>>>>
>>>> 1.  Armada 7020 CPU, with dual ARM A72 cores
>>>> 2.  DDR4 memory, 8GB, on board soldered
>>>> 3.  1Gbit Out of Band Ethernet via RGMII to PHY and RJ45 connector,
>>>>     all are present on A7K CPU module (none on the carrier)
>>>> 4.  Optional 10G KR Ethernet going via the COM Express type 7 connector
>>>> 5.  On-board 8 Gbit, 8-bit bus width NAND flash
>>>> 6.  On-board 512 Mbit SPI flash
>>>> 7.  PCIe Root Complex, 4 lanes PCIe gen3 connectivity, going via the
>>>>     COM Express type 7 connector
>>>> 8.  m.2 SATA connector
>>>> 9.  Micro-SD card connector
>>>> 10. USB 2.0 via COM Express type 7 connector
>>>> 11. Two i2c interfaces - one to the CPU module, and one to the
>>>>     carrier board via the COM Express type 7 connector
>>>> 12. UART (mini USB connector by virtue of FT2232D UART to USB
>>>>     converter, connected to the Armada 7020 UART0)
>>>>
>
>  [...]
>
>>> My bot found new DTB warnings on the .dts files added or changed in this
>>> series.
>>>
>>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>>> are fixed by another series. Ultimately, it is up to the platform
>>> maintainer whether these warnings are acceptable or not. No need to rep=
ly
>>> unless the platform maintainer has comments.
>>>
>>> If you already ran DT checks and didn't see these error(s), then
>>> make sure dt-schema is up to date:
>>>
>>>   pip3 install dtschema --upgrade
>>>
>>>
>>> This patch series was applied (using b4) to base:
>>>  Base: attempting to guess base-commit...
>>>  Base: tags/next-20260121 (exact match)
>>>  Base: tags/next-20260121 (use --merge-base to override)
>>>
>>> If this is not the correct base, please add 'base-commit' tag
>>> (or use b4 which does this automatically)
>>>
>>>
>>> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/marve=
ll/' for 20260122165923.2316510-1-enachman@marvell.com:
>>>
>>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: ethernet@0 (marv=
ell,armada-7k-pp22): ethernet-port@0:phy-mode:0: '10gbase-kr' is not one of=
 ['gmii', 'sgmii', 'rgmii-id', '1000base-x', '2500base-x', '5gbase-r', 'rxa=
ui', '10gbase-r']
>>> 	from schema $id:
>>> http://devicetree.org/schemas/net/marvell,pp2.yaml
>>=20
>> Does this mean we should add 10gbase-kr to the phy-mode enum list in
>> Documentation/devicetree/bindings/net/marvell?
>
> No, 10gbase-kr is legacy, one should use "10gbase-r" instead, cf commit
>
> e0f909bc3a24 ("net: switch to using PHY_INTERFACE_MODE_10GBASER rather th=
an 10GKR")
>
> That should probably be documented in the bindings at some point :)

Thanks, Maxime!

Elad, I=E2=80=99ll amend the commit unless you have a strong reason against=
 it.

Gregory

>
> Maxime

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

