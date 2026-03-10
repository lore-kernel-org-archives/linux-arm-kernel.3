Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812D4EB106E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZxpAj35byR6TQ3nM9neCGTwEH97bcalVH2DZu6972E=; b=PRXcQxPSReQwnzpdZdXJGxm9LB
	Lb0aSPeY08C6xPcweS/zwoI28qYp0p6/Pl336QoEaIK7yrx+KFWvzuVcZsI4f+AdzAm1hH81zoFyq
	gfIYk69YIlxTx8FoQE8VmjRd0ePgHQ/+lafB2UUDgWYXCDAb2VC1munJ/i6gFsbD5eah4g2D0Cdx7
	2r5Hup6vai6LMgdKjBjs0jy+XN/kGpgdtix9Kr/QyDFCMYrx4B2cGUOW9V171QvjnDsr4LDDD77R1
	TEbXPQlpEZjsdgwTo/u71o3jee70VM+oXrSSmfEp8etzCyM++19fkbRUkjiI0SWPJYAgyKSDxbFho
	yHBWkwAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyqF-00000009mTK-1FiU;
	Tue, 10 Mar 2026 15:17:51 +0000
Received: from sender4-of-o56.zoho.com ([136.143.188.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyqD-00000009mSS-3JJV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:17:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773155806; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=My9q5wA6JCYcOq3GwksDpbhCfSrQrNbWFvJWEaNHGK3fh5O//MS1woxS8aWKvVcT0/yuwyEtWG6Xm6QgFquFrnIp9bvMFX2ZKVX5coTtfzzaJ+FONXBLfsan5bZLdoCMd2yuhEt3y3XwlgqOLRtc16QFFISxsNL+9b+Oilx/5OE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773155806; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1ZxpAj35byR6TQ3nM9neCGTwEH97bcalVH2DZu6972E=; 
	b=YvlbySsgdyzhXaBm9BDHQ+PspXgY9+Ci/975YlptD9YfHHorVZhvVTi4D55GmZie/AA53v+/S5Jx+0MWVGALrIYR/GajYP1pfqcHfnoMFPh4dzA8HlD/+srmNfvguR9s7OB+sOBrDsqg6kW6Yz8w2o6j3A7g8fK1Bc3tKyzNHqU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pta2002.com;
	spf=pass  smtp.mailfrom=pta2002@pta2002.com;
	dmarc=pass header.from=<pta2002@pta2002.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773155806;
	s=zoho; d=pta2002.com; i=pta2002@pta2002.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1ZxpAj35byR6TQ3nM9neCGTwEH97bcalVH2DZu6972E=;
	b=YX91xCk2e4x/dovGjUQTR/J4caOZJUnu3Wl9gH/AqM3j+RpRwXShJ5RIOYfgpvB8
	NSakOUETBk17LsNnMvqtkM+pt9ZVgHe6AEwiXRXE46nrwA3zHQMHm7qo8Na3CRlD4vl
	OwM2JmUqlYYHcTGbet5fvbvtK7hDE7luL7Uf1DGI=
Received: by mx.zohomail.com with SMTPS id 1773155803980884.3152690256852;
	Tue, 10 Mar 2026 08:16:43 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89a07f66f4eso97937536d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:16:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWaI9C+2tMexzVSXSd41BjjxwmHJprWIYL/nHafdXlkWnyfs04bw5YXjg6To7pPm0BV+j2CvmCGuTRyIKmCmvH@lists.infradead.org
X-Gm-Message-State: AOJu0YwfF8ip4hdeSzdVnAOsMCGqLUcrwUoy2aZjMtucbx1NeYyEzPE7
	EUMHzCTitwG7iwPNCf+MsNpDnTIiGpuiTK24WiQU0jx/McIBsdbPgZPDQiZNH6pPE4g5IzA4sFN
	uJGbqkFnyUjNqekUt4Z3576mXSoB2Qgs=
X-Received: by 2002:ad4:5d6a:0:b0:899:f78e:d733 with SMTP id
 6a1803df08f44-89a30a5e93bmr225894656d6.19.1773155802990; Tue, 10 Mar 2026
 08:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260304-radxa-r5-itx-hdmirx-v2-1-6567e9e3298b@pta2002.com> <9638846.rMLUfLXkoz@phil>
In-Reply-To: <9638846.rMLUfLXkoz@phil>
From: Pedro Alves <pta2002@pta2002.com>
Date: Tue, 10 Mar 2026 15:16:31 +0000
X-Gmail-Original-Message-ID: <CAAEXfUVU86E0jmh1AyjsejnpKutD=5No=kv8Aid6fnCDJuHc7w@mail.gmail.com>
X-Gm-Features: AaiRm51zN46HfOKYv24Pqj3C_wPKGA8XlgjBcO75Q4XopjpPttYiB_EocE5nLDM
Message-ID: <CAAEXfUVU86E0jmh1AyjsejnpKutD=5No=kv8Aid6fnCDJuHc7w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_081749_866212_DE6DF79B 
X-CRM114-Status: GOOD (  13.40  )
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

Thanks for taking a look.

On 10/03/2026 08:48, Heiko Stuebner wrote:
> Am Mittwoch, 4. M=C3=A4rz 2026, 21:44:39 Mitteleurop=C3=A4ische Normalzei=
t schrieb Pedro Alves:
>> +&hdmi_receiver {
>> +    pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmi=
m1_rx_sda &hdmirx_det>;
>
> are you sure the hdmim1_rx_hpdin is routed?
> Because that is gpio3_D4 while your hpd-gpios below is gpio1_c6.

I took a look at both the Radxa 5 ITX schematic[1] and at the RK3588
datasheet[2]. As far as I can tell, the pin is indeed routed.

The schematic calls it HDMIIRX_HDPOUT_H, on gpio3_d4, and it seems to be
controlling pin 19 of the HDMI port via HDMI_RX_HPD_PORT (see page 31).
The hpd-gpios meanwhile is a GPIO that's used to detect when an HDMI
cable is plugged in (goes low when there's voltage on
VCC5V_HDMIRX_PORT), but since this has no fixed pin in hardware, the pin
choice seems like it can be rather arbitrary by Radxa, who wired it to
gpio1_c6.

>> +    pinctrl-names =3D "default";
>> +    hpd-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
>
> Also please provide a pinctrl setting for the gpio hpd pin.

Sure, I'll take care of this and send a follow-up.

[1]: https://dl.radxa.com/rock5/5itx/v1110/radxa_rock_5itx_v1110_schematic.=
pdf
[2]: https://wiki.friendlyelec.com/wiki/images/e/ee/Rockchip_RK3588_Datashe=
et_V1.6-20231016.pdf

Regards,
Pedro

