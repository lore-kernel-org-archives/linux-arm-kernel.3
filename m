Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D33CC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cay9RsCh/M7Z1VNy5D8LdZzxsTlAPAMGWS8Ka5XVAL0=; b=08k98XJxMnnoSlVvGCRhhIqZK4
	fcarRHgBUr991pv4WJcAYxFLUN3d5k1iXONjzFoJLOGLqQ4Ckk6vpdjYqXs6n50rW28dCpqO4EU4I
	Nv/5fzW31TTwS2071OHRTsZAYppCtTplOy/Erfbm+1teNgqIXNmgR5RjCUQQzSIddfUz2IqJkvTbi
	mqznTKdS8h3r7zNrYyRUmTVhcF3LLPJ55/2q2H/0gEBj6y+6AHpQ7Ir/pq54EyKCOf4c23Z5rlpU+
	ZT0yfIIFrSFVLGFFesdNszbqG3nJpdAopjf+rauV6Zk4+UoTqaN0ValybrVyOtletSKERtXz6GOsq
	XWHTNwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcIO-00000004kRa-3jlp;
	Tue, 15 Jul 2025 09:49:56 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbj7-00000004dfG-36sd;
	Tue, 15 Jul 2025 09:13:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752570807; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZaVXiQjZBm13Etgxt4OiBMQbGwC/DcNY/QMigBvU2yASGR1rEwj2h3Lckh7HDVKHVdY6WreMjyllS4PjgiKd9MJsvj63PuAm+nNfA711v9gL47rfv+ho8Go8mlF+7c7X2/7nmj/581e2W9WXSaf2xMdqPe0HoMR7Z1Bjc8WDx5E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752570807; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cay9RsCh/M7Z1VNy5D8LdZzxsTlAPAMGWS8Ka5XVAL0=; 
	b=VWZKEvPkQyNT9q+RN1SpQpIreytRb5U1Ud1W3ssn7BDwVc6TiyvdWBO6ROaTioc9FuBt0VxyN6tsuB1QTpkleNwqt93aVYLSgKoLZG8KRdZ0zV4TbE/8QgeDy3jhuFfC9lifrJG+oTQlf+iD4xJs4r7vFoTVU4/4wbk7t1u0wCM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752570807;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=cay9RsCh/M7Z1VNy5D8LdZzxsTlAPAMGWS8Ka5XVAL0=;
	b=Q+yu7HcE8kRkHvDFA/I+tnaBCb5kOgIyqfrNK1+v4UFKPdJ3g3vctaCli4O4uz3f
	K+HZuX8Fr7yrG5jsyhBsjG8TNwRWXWRGIno5VWlq523Sxn/UjXRkukNAC0V4IqVQ1Dm
	63Lnmufxg2b4MdP74ghITgXZ4s1hWkjArvD4lp8U=
Received: by mx.zohomail.com with SMTPS id 17525708052071014.9248185889661;
	Tue, 15 Jul 2025 02:13:25 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Qu Wenruo <wqu@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: PWM fan control not working with Rock5B and upstream kernel
Date: Tue, 15 Jul 2025 11:13:21 +0200
Message-ID: <9751604.CDJkKcVGEf@workhorse>
In-Reply-To: <f33da910-7e83-40a0-bfcd-a6131a356358@suse.com>
References: <e9ddcc05-e6db-49b0-aad6-c7873c38c427@suse.com>
 <5271313.GXAFRqVoOG@workhorse>
 <f33da910-7e83-40a0-bfcd-a6131a356358@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_021329_814174_6E194ECB 
X-CRM114-Status: GOOD (  24.22  )
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

I've seen you've already solved your problem, but I feel I should
reply to some points anyway.

On Tuesday, 15 July 2025 10:44:21 Central European Summer Time Qu Wenruo wr=
ote:
>=20
> =E5=9C=A8 2025/7/15 17:19, Nicolas Frattaroli =E5=86=99=E9=81=93:
> > On Tuesday, 15 July 2025 06:10:45 Central European Summer Time Qu Wenru=
o wrote:
> >> Hi,
> >>
> >> My Rock5B board is running edk-rk3588 firmware and (almost) upstream
> >> kernel (6.14.6 kernel from ArchlinuxARM), using upstream dtbs (the
> >> firmware is also switched to device-tree boot mode)
> >=20
> > Consider using mainline u-boot instead. I think the only ones who
> > insist on edk2 forks are the BSD people, as they don't want to
> > write device drivers. Linux has drivers, so inventing UEFI abstractions
> > for things probably only makes your experience worse.
>=20
> Well, having something more user-friendly and more similar to a=20
> traditional PC setup is definitely more attractive to end users.

U-Boot standard boot flow works just fine for this. Broken UEFI
services and ACPI interfaces nothing implements do not achieve this.

You can flash a mainline u-boot to your ROCK 5B's SPI flash and it
will boot aarch64 UEFI distro installers off USB thumb drives, or
do PXE boot, or load your GRUB on NVMe and such just fine.

>=20
> >=20
> > Kernel 6.14 is also quite a bit behind and not supported by upstream,
> > you'll likely have a better experience compiling a kernel yourself
> > using defconfig as the base. ALARM likes to roll dice when it comes to
> > their kernel config and then not update their kernels for half a year.
>=20
> Thankfully the latest one is 6.15.6, and unfortunately it doesn't make a=
=20
> difference.
>=20
> I'm fine compiling kernels for my VMs to run tests, but for the host I'd=
=20
> leave this as the last resort method.
>=20
> I'll try the Uboot if required, but no pre-compiled upstream one is not=20
> really inviting end users.

Collabora has been providing full mainline based ROCK 5B images for a
long time: https://gitlab.collabora.com/hardware-enablement/rockchip-3588/d=
ebian-image-recipes

This includes gitlab pipelines for the mainline-based u-boot we ship
in our images: https://gitlab.collabora.com/hardware-enablement/rockchip-35=
88/u-boot/-/jobs

I'm not sure why you're on the Linux kernel mailing list complaining of
a lack of pre-compiled binaries though, it's not like kernel.org
distributes any binaries either. Compiling u-boot is fairly easy, see
https://docs.u-boot.org/en/latest/build/gcc.html for a general overview
including build dependencies.

1. fetch tf-a https://review.trustedfirmware.org/TF-A/trusted-firmware-a.git
2. compile it with make ARCH=3Daarch64 CROSS_COMPILE=3Daarch64-linux-gnu- E=
=3D0 PLAT=3Drk3588
3. fetch rkbin https://github.com/rockchip-linux/rkbin/
4. fetch u-boot https://source.denx.de/u-boot/u-boot/-/tree/master
5. export BL31=3Dpath/to/tf-a/build/release/rk3588/bl31.elf
6. export ROCKCHIP_TPL=3Dpath/to/rkbin/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_=
2400MHz_v1.18.bin
7. in the u-boot dir, run make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-g=
nu- rock5b-rk3588_defconfig
8. then again in the u-boot dir, run make -j$(nproc) ARCH=3Darm64 CROSS_COM=
PILE=3Daarch64-linux-gnu-
9. flash the resulting `u-boot-rockchip-spi.bin` to offset 0 of your device=
's SPI flash,
   or alternatively, flash `u-boot-rockchip.bin` to byte offset 32768 of an=
 eMMC flash or SD card.



