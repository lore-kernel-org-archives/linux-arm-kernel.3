Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DB5C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 07:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r1/pjCbMq5HqeLfwNFLm/Rk07CuwWDFZjEVftpzoSw=; b=0ynNopu+pgJKAES/IH6/wFv1gB
	kpuibPMRKTdNtp3reQiTvteFUU040VNzBdV8MqB6ThI5Lx4It/5WA9T5SFkrG03jNcYX9j0inyPX1
	Tm5hOXJLPtZq+FKsd9F0e7tut5Jtc5PbAy4Q2c4GzOxTwILhOLdtf/0Dyhh6yB9gqgwDzyF8hN+f3
	I/+caYahZasKpea7y5b6mgaOew8uXU/eRe+gmGNBDIDum77jkeZ8FsFensCnNS60O6FcjtZ4nyLS2
	pRNc8k4eEAVTKeQhDxVu/rnwLZ6k8yfQwlRYdUnLiIAnn7B/ImRoa2wIYS6lBqBsI8i/3hLCBzYbF
	masx+MnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaSI-00000004P6U-1zfb;
	Tue, 15 Jul 2025 07:52:02 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaPp-00000004Ohj-0PT9;
	Tue, 15 Jul 2025 07:49:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752565767; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NoJYzzJe6uSZcEDfrXvjfpzNtylciNSxwU1s8hfSquSE1iInmQsP0Wkr4Qn+GVfVpQYk1hCeCDZBZjDNBbJyCkDukZ3XMJSdt4gxquuM1+OQIsm2QFHbiGrpxUH1SLraz2w0/PMNg4Pt9XaOzCLp5QFk479esVTzBYmutNUnR0s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752565767; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2r1/pjCbMq5HqeLfwNFLm/Rk07CuwWDFZjEVftpzoSw=; 
	b=U7gD6Qtvk0OEp1kOcGqqkqbfiuf6gHCnJ7oB70s9290ucaNkVwqE2WPS07RwIccZ5VbmKe2664d/gI4RosCca7t0eMrIGUzkCM4nYymYOlc7x1XY4zQLz5y4RlG71KKt0JrMdwlozaWXa0RWBGdShnozHEc8oalCXFeuf4LQKZw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752565766;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=2r1/pjCbMq5HqeLfwNFLm/Rk07CuwWDFZjEVftpzoSw=;
	b=jt2s9hHTKmOXOyVv2F4xNRTf8t6Nux5aETLG7G5L5983lF3HRrGMfxXji0zAqlwc
	zlhLU2OybUrbgBm9BD8OOO04cuUTXoyO5Ubak/QFf1YpAQVNiD/aSQwEXqCjfHVAsoO
	+Jt7+MzRWZUHQsw773veKyFlDRbIGTTD8XlnAA9Y=
Received: by mx.zohomail.com with SMTPS id 1752565763947198.70326485853093;
	Tue, 15 Jul 2025 00:49:23 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Qu Wenruo <wqu@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: PWM fan control not working with Rock5B and upstream kernel
Date: Tue, 15 Jul 2025 09:49:21 +0200
Message-ID: <5271313.GXAFRqVoOG@workhorse>
In-Reply-To: <e9ddcc05-e6db-49b0-aad6-c7873c38c427@suse.com>
References: <e9ddcc05-e6db-49b0-aad6-c7873c38c427@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_004929_231171_63AD0942 
X-CRM114-Status: GOOD (  23.20  )
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

On Tuesday, 15 July 2025 06:10:45 Central European Summer Time Qu Wenruo wr=
ote:
> Hi,
>=20
> My Rock5B board is running edk-rk3588 firmware and (almost) upstream=20
> kernel (6.14.6 kernel from ArchlinuxARM), using upstream dtbs (the=20
> firmware is also switched to device-tree boot mode)

Consider using mainline u-boot instead. I think the only ones who
insist on edk2 forks are the BSD people, as they don't want to
write device drivers. Linux has drivers, so inventing UEFI abstractions
for things probably only makes your experience worse.

Kernel 6.14 is also quite a bit behind and not supported by upstream,
you'll likely have a better experience compiling a kernel yourself
using defconfig as the base. ALARM likes to roll dice when it comes to
their kernel config and then not update their kernels for half a year.

>=20
> Before that I'm using ACPI mode thus no PMW support, but the firmware's=20
> fan control is working properly although running at a fixed rpm setting.
>=20
> But after switching to the upstream kernel and device-tree mode, the pwm=
=20
> fan control never works.

Check /sys/class/pwm, export the pwm associated with the fan in the DT,
then manually set a period and duty cycle that corresponds to a period
the fan supports. If it doesn't spin, then the problem is likely that
there is a disconnect between what Linux thinks the PWM signal is and
what it actually is.

I'm guessing the problem here is that your firmware of choice leaves
the clock tree in a bit of a state, and the PWM is clocked from
something that's incorrect. If it's not the right clock period for
the fan, it won't spin.

A logic analyzer would be able to tell you definitively whether that's
the case.

>=20
> `sensors` command detects the fan, and the pwm seems to properly=20
> following the temperature, but the physical fan just do not spin at all:
>=20
> center_thermal-virtual-0
> Adapter: Virtual device
> temp1:        +80.4=C2=B0C
>=20
> bigcore2_thermal-virtual-0
> Adapter: Virtual device
> temp1:        +84.1=C2=B0C
>=20
> package_thermal-virtual-0
> Adapter: Virtual device
> temp1:        +81.3=C2=B0C
>=20
> pwmfan-isa-0000
> Adapter: ISA adapter
> pwm1:            128%  MANUAL CONTROL <<<
>=20
> gpu_thermal-virtual-0
> Adapter: Virtual device
> temp1:        +79.5=C2=B0C
>=20
> littlecore_thermal-virtual-0
> Adapter: Virtual device
> temp1:        +82.2=C2=B0C
>=20
> bigcore0_thermal-virtual-0
> Adapter: Virtual device
> temp1:        +83.2=C2=B0C
>=20
>=20
> I'm wondering is this a bug in the upstream PWM code or something else=20
> is missing preventing the fan from working properly.

The upstream PWM code definitely works, and has worked for every
Rockchip device so far. The PWM fan on my ROCK 5B (mainline u-boot,
mainline kernel, mainline TF-A) works just fine.

>=20
> Thanks,
> Qu
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>=20





