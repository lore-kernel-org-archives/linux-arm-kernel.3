Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA31CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TB1L+FQUyzl0MZXwgPCTGStPNNRpx5XfsGy8ZsCSSo=; b=L8YeWWdPSvS/tuDZ0DDwsdWVA8
	HJk5O0ndBI0sIY8MH6woiZd2tgcXxfynbnOAwUFe/XAnbP0j3OuFyT65qUeLB49JkmD8GKGIWmwkt
	bYUO6pYcI9JexbjOXXwGVvnWb8rIfghHFX6A7o9ktTbFn2TtNMv1n0L6rJ4w6Dy9GqPvy9w6bnwmq
	ueEJuwzQElzTDT40CuaI1f0Eu2IWXfzQ6hdCJ2WWCdsDgZTsuchnok9MMWqFFXhVCuknMuJAhnhLH
	NhG0EFQa8lHdAro3KTTHKVyp5UkXrmFH5q+4mRc5TPNtAqvHxGpuT/GEcJyN+a3uBY6Jukf7mx+NS
	d5t9ILpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphlu-00000003yzQ-1nHP;
	Sat, 23 Aug 2025 06:30:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRYW-00000002aZb-0lEV
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 13:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+TB1L+FQUyzl0MZXwgPCTGStPNNRpx5XfsGy8ZsCSSo=; b=mUTa54lGE6qv0xKVWCFLXgoucJ
	iuBGnb+Or+1Tm7Br6u3JfTL7NpueffvTA+zhwhpeecxxRyeCvCQ+WOrBR/Q0DadsncazRQYKzm3rD
	xt2+I2vUf+tMrdva2ZfrtATZKwJ6VUbvNvIVug3cZVK5YeSaFFMoGoilM72VRaRx/UP75De8gjJIr
	0PMQNWLw7NE5mLvT1aIHIheltV+bOn+UNIfkx4eiVItG4lQ6kwMsoQu5zsd17eV/1cR3LQvIVt+44
	X81utX12zsm3+pMFhRmZclaSwh/uHPwRAPWyoD9sBq2C97RU9REt8GhASg+J6bTZ0Uox5zBLqi+H0
	vBPSihlw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRYS-00000000vAL-3inG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:11:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1183F1A0D24;
	Fri, 22 Aug 2025 13:11:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CADDA604AD;
	Fri, 22 Aug 2025 13:11:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65ED51C22A1CE;
	Fri, 22 Aug 2025 15:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755868291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+TB1L+FQUyzl0MZXwgPCTGStPNNRpx5XfsGy8ZsCSSo=;
	b=PC3Si3dL073tGT7/St5ggmnQp5llUhCaOW88SWlw/wJdhJK0qLNY3/bfS3+VOR63HOCzw6
	ZTfzYrzxkZV2ekIAovNo0pwhw6oHhsqzyRFSq5iLv/TuJO2I47JXntjDUZ4Onmw11r1dTw
	a5/fp10LoYpW+SLzGb40Qx0TrK2gjNIqfZf149Ec4SpwA9OBvKQpwbfTwZ4mXcR8kkFOU9
	3+E0HoDcAZZYVI5MS6YRCH64k/zyiQZd4w8quC8xy4VWvyFYZG8XQWjVb/AYe8+xigGbwE
	oxC2CovGbpXqY2x+6iaVBsOhleAS45dqt9yta+uiE+atcB694BA+4esUs6+dYw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Frank Wunderlich
 <frank-w@public-files.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2] ARM64: dts: mcbin: fix SATA ports on Macchiatobin
In-Reply-To: <E1up9Jw-00BbOE-VC@rmk-PC.armlinux.org.uk>
References: <E1up9Jw-00BbOE-VC@rmk-PC.armlinux.org.uk>
Date: Fri, 22 Aug 2025 15:11:26 +0200
Message-ID: <87sehj5wn5.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_141141_052043_54921BEA 
X-CRM114-Status: GOOD (  14.60  )
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

"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> writes:

> Booting 6.16 on the Macchiatobin, I discover that I can no longer
> access my disks, and thus the userspace boot fails. The cause appears
> to be that one of the SATA controllers doesn't have any ports:
>
> [    1.190312] ahci f4540000.sata: supply ahci not found, using dummy reg=
ulator
> [    1.196255] ahci f4540000.sata: supply phy not found, using dummy regu=
lator
> [    1.202026] ahci f4540000.sata: No port enabled
>
> This is as a result of the blamed commit below which added a default
> disabled status to the .dtsi, but didn't properly update the mcbin
> dtsi file. Fix this regression.
>
> Fixes: 30023876aef4 ("arm64: dts: marvell: only enable complete sata node=
s")
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Applied on mvebu/fixes

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/ar=
m64/boot/dts/marvell/armada-8040-mcbin.dtsi
> index 6170ca8f908f..8c7db2e87e30 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
> @@ -388,11 +388,13 @@ &cp1_sata0 {
>  	/* CPS Lane 1 - U32 */
>  	sata-port@0 {
>  		phys =3D <&cp1_comphy1 0>;
> +		status =3D "okay";
>  	};
>=20=20
>  	/* CPS Lane 3 - U31 */
>  	sata-port@1 {
>  		phys =3D <&cp1_comphy3 1>;
> +		status =3D "okay";
>  	};
>  };
>=20=20
> --=20
> 2.30.2
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

