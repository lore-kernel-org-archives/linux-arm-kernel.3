Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C948DD72361
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIZ7e3GTNOiIxODI4lS6BiU8bmyIwVXyhvzRfYfBb4U=; b=sOrXCQasBY5x91dJrnwmOXsD4A
	dhsVkZ/alSmbJF0hfSL55Ax28FN/rsWf5f7yqHVJ0cPVI7N6JGmTouzSkILxWzz0QqrxAAx/VGhL2
	Ef01ykWEjeXY8FuCY1le/roPlhmY6zQj6vw94x/ve49A87fcLnM1navEk+9Tk7KIw+hNS8N45ZAxZ
	PQtyjXeYhXDroFr21UXSoBl4m0/1lIZUc//KdO7NtnQCjzRkhPEZHA0Z4ULfgc7RoSZ4vYobi5d23
	EZtXGKk+wWuorF3t+OxTM5gs2SPu/YOaqL6EviWlZw1FYJyZMEJrREwraDV4jyYvbdXQCQ6MOE7bJ
	KUiRzJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDCd-00000008XI6-3pXg;
	Fri, 23 Jan 2026 09:11:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDCc-00000008XHr-2Sf1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Jan 2026 09:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=RIZ7e3GTNOiIxODI4lS6BiU8bmyIwVXyhvzRfYfBb4U=; b=MrLcKM27qcCOS+6sgEDHLenI6E
	ph23yyNuC1Duy/45oM7CHMh0+Fzoh4mT3Y7IxTBQPmmRnhsg9pTKHK/+gCBDi3u5s+y/dRgxrYpLf
	jnm+RonDOr/XgC3O0bJeTa6qHTJHIlsIirqXWF2ESKomwfci7VnwxXSHErR3gUWNrXY2WQ4UmFLMp
	/G2oKraJwZyJUCwBSQnVjqb5CmVJfjhbcHAgrUswZPEXn52ERjezNEwKVigo2UzkALOXRruj9HDzE
	XV83+JPpI8+ewPu5Bt8ormRGMdqwNskd3qy2RHFuJOvQVcWSKuJ0LhEx+nIT9SvsJVbhbEWeZexMh
	nWDuLPmg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDCZ-00000001YLq-0u0U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:11:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A6230C21AB9;
	Fri, 23 Jan 2026 09:11:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4AFB06070A;
	Fri, 23 Jan 2026 09:11:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5960119A8770;
	Fri, 23 Jan 2026 10:10:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769159465; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RIZ7e3GTNOiIxODI4lS6BiU8bmyIwVXyhvzRfYfBb4U=;
	b=Nvbs12xzwYaF3iqtxGXccgO+aG9ReZpx3EWb8OJOUjoF9hA7kdZI8Z1iNMJRei5VRwqJ0e
	029oK9lpm8Qe0URY9iI5kX092qoyJeIaOC+RZXc0BntygCNKHRKoEr8KiKPg4tz/LwRa7H
	3VbmI1TyhBJK2F/id3JmTdudQ6YdSJ+oP6WWLKbwcfvgLxzxlwBNhYGAdDucy78HXUR7Qo
	cc6C34Joq1gFJ3h3nWWPVru00/FvZSvEcMP5E8wLOnZi9vge2vgYOjzaQwu0uee9/g9/qT
	7N93m246ERjlJ/Xb61Yuv/rhFw1CHJKRLZwtVbmuUOAtz89ozty2FB4zZZjBFQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rob Herring <robh@kernel.org>, Elad Nachman <enachman@marvell.com>,
 andrew@lunn.ch, Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: conor+dt@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 chris.packham@alliedtelesis.co.nz, pali@kernel.org,
  devicetree@vger.kernel.org, mrkiko.rs@gmail.com,
 sebastian.hesselbarth@gmail.com, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 0/2] arm64: dts: a7k: add COM Express boards
In-Reply-To: <176910484185.3007016.14688980539020105749.robh@kernel.org>
References: <20260122165923.2316510-1-enachman@marvell.com>
 <176910484185.3007016.14688980539020105749.robh@kernel.org>
Date: Fri, 23 Jan 2026 10:10:55 +0100
Message-ID: <87a4y4lmn4.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_091135_369988_22A46622 
X-CRM114-Status: GOOD (  22.65  )
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

> On Thu, 22 Jan 2026 18:59:20 +0200, Elad Nachman wrote:
>> From: Elad Nachman <enachman@marvell.com>
>>=20
>> Add support for Armada 7020 Express Type 7 CPU module board by Marvell.
>> Add device tree bindings for this board.
>> Define this COM Express CPU module as dtsi and provide a dtsi file for
>> the carrier board (Marvell DB-98CX85x0 COM Express type 7 carrier board).
>> Add the Falcon DB to the MAINTAINERS list
>>=20
>> Since memory is soldered on CPU module, memory node is on CPU module
>> dtsi file.
>>=20
>> This Carrier board only utilizes the PCIe link, hence no special device
>> or driver support is provided by this dtsi file.
>> Devise a dts file for the combined com express carrier and CPU module.
>>=20
>> The Aramda 7020 CPU COM Express board offers the following features:
>>=20
>> 1.  Armada 7020 CPU, with dual ARM A72 cores
>> 2.  DDR4 memory, 8GB, on board soldered
>> 3.  1Gbit Out of Band Ethernet via RGMII to PHY and RJ45 connector,
>>     all are present on A7K CPU module (none on the carrier)
>> 4.  Optional 10G KR Ethernet going via the COM Express type 7 connector
>> 5.  On-board 8 Gbit, 8-bit bus width NAND flash
>> 6.  On-board 512 Mbit SPI flash
>> 7.  PCIe Root Complex, 4 lanes PCIe gen3 connectivity, going via the
>>     COM Express type 7 connector
>> 8.  m.2 SATA connector
>> 9.  Micro-SD card connector
>> 10. USB 2.0 via COM Express type 7 connector
>> 11. Two i2c interfaces - one to the CPU module, and one to the
>>     carrier board via the COM Express type 7 connector
>> 12. UART (mini USB connector by virtue of FT2232D UART to USB
>>     converter, connected to the Armada 7020 UART0)
>>=20
>> Elad Nachman (3):
>>   dt-bindings: arm64: add Marvell 7k COMe boards
>>   arm64: dts: a7k: add COM Express boards
>>   MAINTAINERS: Add Falcon DB
>>=20
>>  .../bindings/arm/marvell/armada-7k-8k.yaml    |  11 ++
>>  MAINTAINERS                                   |   1 +
>>  arch/arm64/boot/dts/marvell/Makefile          |   1 +
>>  .../dts/marvell/armada-7020-comexpress.dtsi   | 161 ++++++++++++++++++
>>  arch/arm64/boot/dts/marvell/armada-70x0.dtsi  |   7 +
>>  .../boot/dts/marvell/armada-ap806-dual.dtsi   |   4 +-
>>  .../dts/marvell/db-falcon-carrier-a7k.dts     |  27 +++
>>  .../boot/dts/marvell/db-falcon-carrier.dtsi   |  22 +++
>>  8 files changed, 232 insertions(+), 2 deletions(-)
>>  create mode 100644 arch/arm64/boot/dts/marvell/armada-7020-comexpress.d=
tsi
>>  create mode 100644 arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dts
>>  create mode 100644 arch/arm64/boot/dts/marvell/db-falcon-carrier.dtsi
>>=20
>> --
>> 2.25.1
>>=20
>>=20
>>=20
>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>   pip3 install dtschema --upgrade
>
>
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/next-20260121 (exact match)
>  Base: tags/next-20260121 (use --merge-base to override)
>
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>
>
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/marvell=
/' for 20260122165923.2316510-1-enachman@marvell.com:
>
> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: ethernet@0 (marvel=
l,armada-7k-pp22): ethernet-port@0:phy-mode:0: '10gbase-kr' is not one of [=
'gmii', 'sgmii', 'rgmii-id', '1000base-x', '2500base-x', '5gbase-r', 'rxaui=
', '10gbase-r']
> 	from schema $id:
> http://devicetree.org/schemas/net/marvell,pp2.yaml

Does this mean we should add 10gbase-kr to the phy-mode enum list in
Documentation/devicetree/bindings/net/marvell?

Adding it would likely resolve the warning, but I=E2=80=99m not sure if it=
=E2=80=99s the
correct approach from the driver=E2=80=99s perspective. That=E2=80=99s why =
I=E2=80=99ve included
Andrew in the To field and added Maxime as well.

Regards,

Gregory

>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

