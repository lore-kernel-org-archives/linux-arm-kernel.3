Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ED8D26292
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 19:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ub8N3tY8GwCy8TqVlqK7eFFGB7gNEjREB31fE0IlsTg=; b=HhirX3gEFCuFUCjeG/94uxPINw
	e3/tfgxKZ6HJbL9ZCNkf+oAoq9l5K6I+2vNiipjQ03ULQobpL4yqJb6xNByymMMZNV5EqXydMZtdF
	2qHBgXa4JhG82QSQBu1SDB3pSZh8g+qqU31foGTDI+keSzw2bvsFBoRN4g5PmJbijmJKTgmZhS3Yv
	jLu3xs+hUTzqYnCl8iMS/eiQYALc0KqCbC+1eDoxE3ZK208AxxnpZfE0gRoiFW6SHM2VxdTLarbKL
	qlfkeeR4YZB/1l2Q6ebpr1EY60ma6l5xi9ECLak6Y7zNFmgY2VyhL0E5xa+HFFBnNedxdmTFWngtf
	dAo1xNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viH8z-00000004Li9-3Vkg;
	Tue, 20 Jan 2026 19:12:01 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viH8w-00000004Lhk-2SSU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 19:12:00 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-81db1530173so2748261b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 11:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768936316; x=1769541116; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub8N3tY8GwCy8TqVlqK7eFFGB7gNEjREB31fE0IlsTg=;
        b=ENTI6ttznWclp73Pp5m6OdkpmSLGJOn9Vw4+Ozh12hGipO6D01Vtoa4Nnvgaep+cH0
         /Cve5H6C/UzOd2NNHQZZtWS5ADyOxhjCvLvILyf+yVHP+/VeJU4SMmP0Fz11ZZ3Luxzw
         IAtMpYvkL7CJVe5W7HFH9SqXhrybAoH69WwYpg0taYWspTjXHvk+KSolDugTDa4UR24b
         IogHKPUQP38i0pZplXM2R9ndQ/rphrmNFI8EjPVCA36T+LgcG5e7CsKpr7XPPEvh73Gd
         8so5S3xdXz9Pia0Pw6lzqqbBoToRtxRGbq+eZiS2agi4sSwIhElOq891mUZZ1BdecdLx
         t/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768936316; x=1769541116;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ub8N3tY8GwCy8TqVlqK7eFFGB7gNEjREB31fE0IlsTg=;
        b=g43fI+6Ool5oQWPKpD/4zrfcqJpU6a4I82tDG2xInl2UvcWmnZ89/7COP1MHSSmeel
         GvYtbp0mXvAI0CQEEjA8wlHDnLcP5U20ir0aADwOCZdcyokHxbZEoFPkOXXohPuh1rGe
         OUYTUA7pypo4ZQ5dUNBlqIYL5RHnQkt6P3ynoG7AG+FQcnLylKKVfEF5HFOAEL0mZUTD
         qPHmteduVP4UstbLFOmROb/p0lLC/Bm8NgUDJ4StL3RfAPGlgOlTuCnpabL2pO6JhcIT
         IK/rU2e+sVndnl6BhWD1qKMgjUIoVeFs2RYiAwxUUZ1yRhG8YGNxkSDV0k+sXXYJ1F0O
         zCOg==
X-Forwarded-Encrypted: i=1; AJvYcCWvXoHuaZ+/7/pPxFtEle91WuZ5KpCmE9IEK5Q2pQn+KRWIkDpAe0ia3OilCKyeYYYnKt+8irutlsvQylkywOSm@lists.infradead.org
X-Gm-Message-State: AOJu0YyE156t8DlU9lPBw4rSB5uh9phnu5t//uNSV9LMY48W5mNU/iDQ
	IRJPJZ5yedV6pwwey89uKgcQtYMeEWhsfh5mJQJ/wCUDCT+qqT9c9w22dHZP9krs5Iw=
X-Gm-Gg: AY/fxX7TBZUBEpMx6HXZkWernVZgNvX5YgI4yrDtYPWpzraWRRO3CIAKvRFvOmhPMdE
	IVQrA1funVVZGEyiCyscHC3UWjpCwoxF839Cm61yrWo44i7jvQzz9B1TKGB/fMI+LzB6a0gzoNE
	HOKeTx+L01PXuJ43Wir6IXa3cJEJfgIvizGWqHTVgzmGjLCodrpmJ6ouvBX1/pCYUuDpm+Q2T5p
	WBjMGItiKfkyHBs+9f370Hki1EbE73z1lqJYto5zD0En3s3yaBvj+GHLrIB5LbwRR26Bqzjzgpr
	tPG/3y/Bir3apAZLfpb6VrY7XKUuWJPK+VM/y++0TBYHPS5sozai66GgWXwy/yJofEM7C6cxwir
	TpSc3pZqd5K1bFzy13yG8kUU2YuRF/ERZJOu64eiJOGPboE+55PEjhjvh8whtTW42dVycRc3dbE
	pb7FIo/r5ZnZLFDa9y5oIMBmKdRQ8umv3ean+f8JhXqMajesYeISQJh1jaPpx0RK8SPO/YcQU=
X-Received: by 2002:a05:6a21:7305:b0:36c:2cf5:9b06 with SMTP id adf61e73a8af0-38e45eacbfamr2933705637.79.1768936316195;
        Tue, 20 Jan 2026 11:11:56 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf354b24sm12357331a12.28.2026.01.20.11.11.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Jan 2026 11:11:55 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <c3fc04a4-4b09-4c6a-a0f1-e5aa92a22976@sirena.org.uk>
Date: Tue, 20 Jan 2026 11:11:44 -0800
Cc: Michal Simek <michal.simek@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>,
 linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <80A8F67E-7A01-4F9F-9D84-29722678A2CE@nexthop.ai>
References: <b1b79de0-a078-486d-b3e9-96899354407c@sirena.org.uk>
 <3D1B59A7-6E57-4C8C-AA95-EA7AA115264F@nexthop.ai>
 <b9ad8ab8-7985-4c89-a82b-c7f31d32c167@sirena.org.uk>
 <a6d57890-89c1-445e-836c-d8239d20c621@amd.com>
 <b03307f7-93f6-4680-9241-cf28b5456fd0@sirena.org.uk>
 <a3fcef3a-d1e9-4b46-b114-3a82575e052e@amd.com>
 <980ad372-a2c7-417c-91f9-4958d3d1aaca@sirena.org.uk>
 <4831B269-DFC1-40E0-96B7-67981AC72562@nexthop.ai>
 <6e06696e-09a4-46e0-98fa-252690b888e0@sirena.org.uk>
 <BF71A04E-7FFB-42D1-8C8D-6FD13415EED5@nexthop.ai>
 <c3fc04a4-4b09-4c6a-a0f1-e5aa92a22976@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_111158_663389_BC55B44C 
X-CRM114-Status: GOOD (  37.17  )
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



> On Jan 20, 2026, at 10:45=E2=80=AFAM, Mark Brown <broonie@kernel.org> =
wrote:
>=20
> On Mon, Jan 19, 2026 at 04:20:06PM -0800, Abdurrahman Hussain wrote:
>=20
> To repeat once again:
>=20
> | Please fix your mail client to word wrap within paragraphs at =
something
> | substantially less than 80 columns.  Doing this makes your messages =
much
> | easier to read and reply to.
>=20
>>> On Jan 19, 2026, at 3:20=E2=80=AFPM, Mark Brown <broonie@kernel.org> =
wrote:
>=20
>>>> But rather, to re-use the existing drivers as much as possible by =
relying on the
>>>> special DT namespace link "PRP0001":
>=20
>>> What is the goal in avoiding using native ACPI bindings?  PRP0001 is =
a
>>> workaround for cases where you have things that ACPI has never =
dreamed
>>> of and can't abstract well but which have already been handled by =
DT,
>>> it is not something we're aiming.  The hardware you have described
>>> seems like fairly normal server style hardware and like it should =
fit
>>> well with normal ACPI.  Adding ACPI IDs to existing drivers is =
pretty
>>> common and standard, I'd class that as reuse.
>=20
>> I did not intentionally avoid introducing new ACPI _HIDs, but at the =
same time
>> don=E2=80=99t understand the need to, especially when PRP0001 =
workaround works and
>> it works well. We don=E2=80=99t own the spi-xilinx driver and neither =
do we own the i2c-xiic.
>> These are standard Xilinx IP platform drivers that could be made =
usable on ACPI platforms
>> by just switching to device_property APIs. Which is what these series =
is trying to do.
>=20
> It's just not idiomatic ACPI, indeed some other OSs actively reject =
the
> idea of binding to PRP0001 described devices.  In general we don't =
want
> to encourage people needlessly creating unusual hardware descriptions,
> that provides better future proofing so we're less likely to have to
> work around our own past decisions and avoids causing hassle for other
> OS vendors with having to deal with Linux special firmware =
descriptions.
>=20
>>> As far as I can see from the example you posted the devices are all
>>> fairly standard and just need IDs assigning to work naturally with =
ACPI.
>>> There's possibly an argument for using PRP0001 for the flash given =
that
>>> it's not especially idiomatic to have OS visible flash on ACPI =
systems,
>>> usually flash would only be visible to UEFI, but equally the =
description
>>> would trivial and systems wouldn't have to use it.
>=20
>> You mention =E2=80=9Cidiomatic=E2=80=9D a lot. Are you implying the =
SPI NOR-flash devices should
>> not be exposed to user-space? Then why does the spi-nor driver even =
exist?
>=20
> Flashes are widely used on non-ACPI systems where exposing them to the
> OS is a perfectly normal and standard thing to do.  Usually on a =
system
> with ACPI NOR flashes would be purely for the firmware to store itself
> and it's data, storage exposed to the OS would be at least eMMC or
> something.  ACPI has a very strong idea of what the systems it is used
> with should look like.
>=20
>> We have a SPI device that needs to be accessible from users-space in =
order to
>> =E2=80=9Cflash" various FPGAs. How do you suggest we do that?
>=20
> You should probably register the device, it's just a question of if =
it's
> weird enough that it does actually fit with PRP0001 or if it's =
something
> with general enough application in ACPI systems that a HID should be
> allocated.
>=20
>> Also, there are hundreds of drivers in the DT namespace that are =
missing the ACPI IDs today.
>> Do you suggest adding ACPI IDs to every driver just so it=E2=80=99s =
more =E2=80=9Cidiomatic=E2=80=9D to use?
>=20
> To drivers that are used on ACPI systems, yes.  Many devices wouldn't =
be
> used on ACPI systems, or would be expected to be exposed differently
> (for example, hidden behind AML).

This is not for a normal off the shelf server. In our case we are =
building an embedded
switch with an AMD CPU and Xilinx FPGAs that happens to use EDK2 based =
BIOS and ACPI.

We, as a vendor, have full control of the BIOS/ACPI and would like to =
use it describe
hardware and make as much use of the standard Linux drivers as possible. =
We have dozens of
I2C devices like temp sensors, voltage regulators, DCDC converters, =
EEPROMS, SPI-NOR flash
devices behind the Xilinx IP blocks. Most of the devices we use don=E2=80=99=
t have proper ACPI _HIDs.

>=20
>> I am just trying to get this 2-line small change merged so we can =
start using the standard spi-xilinx driver today. I am not trying to =
boil the ocean.
>=20
> I mean, adding a HID wouldn't take substantially more code.

We could, but we don=E2=80=99t own the Xilinx IP blocks. Are we not =
justified in using PRP0001
hack until the driver owner adds the HIDs? Wasn=E2=80=99t PRP0001 =
created as an escape hatch for
these kind of scenarios?


>=20
>>> There is the bit where there's a PCI bus in the way and you don't =
use
>>> ACPI particularly idiomatically...  I can see the dodging out on the =
PCI
>>> bus description, but the way the devices behind the PCI bus are
>>> described seems confusing.
>=20
>> What exactly about this usage is not idiomatic? Our PCI device =
description in ACPI looks like
>> this (GPP5 is the PCIe bridge under which the FPGA is located):
>=20
> The use of PRP0001.

Understood.



