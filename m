Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB5FD2ECEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 00:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeTXeD4lve394SS+NlEGV1e/pJB7b1y6Fb1pz4gtbKY=; b=QC6yzU+8BfiOWDr+monICgPR4P
	NZlqnHM45SB9DcL9LwugddG5xNtNw9luQ5DP09E5aA5XhDb3p0jWlr9VpNcmDbIV+3w4UysnQHuAZ
	Rwrk77DA1k3Vh5sDIjeF7VHiI264YD9YPouFKsyRKVnKvy2dpRChv2WS1EqYTGlpElv8TRRNfW1c8
	aBqMWk4KUVBRnNwv7u7J2sMwvznzBMFTuiEZTOTfakM57JfGJPwVpeWft97OhYQJDjaF/yOlTxFMo
	AAZD9LlsYcUuKCXyW3eZYm3OOIjWeKAZ3rjkbzFTN7Lxl1ExqGxEm9IxrpJulxRkusZtnqEjPPqDm
	FtHcHWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhzTp-00000002zsg-1L9X;
	Tue, 20 Jan 2026 00:20:21 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhzTn-00000002zsL-0QoR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 00:20:20 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-81f3b4ae67bso2472259b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 16:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768868418; x=1769473218; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeTXeD4lve394SS+NlEGV1e/pJB7b1y6Fb1pz4gtbKY=;
        b=d9xNNPNe4TyiUOsMvOJTNRnbE7C0GebEyH8nRrL1dsJal0uNDcckaS+u9WfiBcmJwg
         KzJtIvMKRTgkgtteHuVYIUgL8rV/ICkM1h6bapsKvCEDQveqJE3ghmFe4na23SozFXgo
         GwJWP5dQ2nzyf/fGrUS6D2yrJbKJ5at5l170Mj3qHjLqOk8gTKEHmNXKPQzjTfOKSA/z
         TJqlLoE7BVcKJFn4Y14joTTAj28YaW4ANSanK1ayoR2j8UXAq8dixGpj3dZ2daQFFoPa
         AlTehdpQvJZrSPS7gQOvPjhLtoJXYivY9MHs5SGBFyz22pkseanzZW1gL68TIGsDoKlg
         QOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768868418; x=1769473218;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VeTXeD4lve394SS+NlEGV1e/pJB7b1y6Fb1pz4gtbKY=;
        b=dHFEmhaqhb7MJLmz+YjJ/EfQDJjgxDDBxzcplwsv+HU8lXtk5oNGPHFw79PmxHQ9Sr
         wPFsnRsj1nAJ1Kmop8EqRBddEq8cSHDZQlIhJyXBz9dgvviDLIKoWKj63CakUxyFJZuz
         VtUdZzbzexmK4bz1Q/1UUiROsGgmzHwCdrMzS4VMIkRJZGAA4kWCjppKClo9rxyT5Qm0
         TJD5j6EMY+lihMtUTZPXjKg5vUCXWYOMSXlI71B9stG/BIIYb6mESNlTe7u/qAOD/i4r
         tHUveP254olOukSpF1TiwXCB3tVeHLfzlNGIUjIbBfuRRN5woX7MAVYEEYWiAdJC6WT5
         9PLA==
X-Forwarded-Encrypted: i=1; AJvYcCUtG8v4U/BwlAX1jDjS7gZySP7ynOcP7Am3JTn+OOpC6tkAzP8dbPOrOSEAM0rrKJPsv4blg69LCVXIZ0TMJoGb@lists.infradead.org
X-Gm-Message-State: AOJu0YwTF9QtM+yLogrT9p17oq6K6QSlKYW1BOYZw5cKR46gjPCN6jji
	bw0tC5repOEAZy+zFbgu/85npfjD+BIBh7uemBBUAeHR73StC31VdtLvLy7YIpSt6eI=
X-Gm-Gg: AY/fxX448EAvMNmJxPgmVgfFE2w+xF4wwLrDz/olMjQZz7OAsLPqVzGpHu3a3UwcEvx
	0gO1qaCWk1Q9SBpFNRWf6D3xXGjtvE0Y7hAAj7Z6Gj5v+EXYSF5eNBxTp2+BiPxa+mq4prem+E1
	mC2+e8DCCH//u7rGi7MPhJWRp0xP5YduT6YbyEvfDfU4S8UFiCV+H9Xp9hQeEhrV4rVsYoei0kz
	n3AkSop31vu60nnmUazff3vdcLLcQ706vme1Bp2HcC8o2GMNznHvdZgy4izkc4Zb294lEjETYNR
	tfB2+5EPIqecoFES0aJeL8nlQ0+O+MFAB4OdI5Rm8Fg2Oqt+SItwCumOjlMY6B5zvddS8GQndYN
	54EqfbL92gBMjompv8xjvu0LNK5g6jx9/f2WsMsawZRCayj0KoRZoSKM2AfgD3HZ7kSUn/LwHYk
	eLhxNU1whK0uO0PbSVyEDPU+9BddiRJYmrBszPWtSxGAiDEWm0bpwcJZIOdF66TiE6GUDA6zTnf
	C0d94KuFA==
X-Received: by 2002:a05:6a00:13a0:b0:7fb:cf05:93cb with SMTP id d2e1a72fcca58-81f9f69046cmr10992965b3a.1.1768868417895;
        Mon, 19 Jan 2026 16:20:17 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12911c2sm10078142b3a.46.2026.01.19.16.20.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Jan 2026 16:20:17 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <6e06696e-09a4-46e0-98fa-252690b888e0@sirena.org.uk>
Date: Mon, 19 Jan 2026 16:20:06 -0800
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
Message-Id: <BF71A04E-7FFB-42D1-8C8D-6FD13415EED5@nexthop.ai>
References: <9e559e33-4f2f-40d4-a15f-584548bd6057@sirena.org.uk>
 <05D2CC15-DD6B-40F0-BFF0-3264D4FF96ED@nexthop.ai>
 <b1b79de0-a078-486d-b3e9-96899354407c@sirena.org.uk>
 <3D1B59A7-6E57-4C8C-AA95-EA7AA115264F@nexthop.ai>
 <b9ad8ab8-7985-4c89-a82b-c7f31d32c167@sirena.org.uk>
 <a6d57890-89c1-445e-836c-d8239d20c621@amd.com>
 <b03307f7-93f6-4680-9241-cf28b5456fd0@sirena.org.uk>
 <a3fcef3a-d1e9-4b46-b114-3a82575e052e@amd.com>
 <980ad372-a2c7-417c-91f9-4958d3d1aaca@sirena.org.uk>
 <4831B269-DFC1-40E0-96B7-67981AC72562@nexthop.ai>
 <6e06696e-09a4-46e0-98fa-252690b888e0@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_162019_179733_5F5B998F 
X-CRM114-Status: GOOD (  37.05  )
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



> On Jan 19, 2026, at 3:20=E2=80=AFPM, Mark Brown <broonie@kernel.org> =
wrote:
>=20
> On Mon, Jan 19, 2026 at 12:30:43PM -0800, Abdurrahman Hussain wrote:
>=20
> To repeat what I previously said:
>=20
> | Please fix your mail client to word wrap within paragraphs at =
something
> | substantially less than 80 columns.  Doing this makes your messages =
much
> | easier to read and reply to.
>=20
>>> On Jan 19, 2026, at 11:56=E2=80=AFAM, Mark Brown =
<broonie@kernel.org> wrote:
>>> On Mon, Jan 19, 2026 at 08:17:46PM +0100, Michal Simek wrote:
>>>> On 1/19/26 20:01, Mark Brown wrote:
>>>>> On Mon, Jan 19, 2026 at 07:52:35PM +0100, Michal Simek wrote:
>=20
>>> None of this looks like something intended to add ACPI bindings,
>>> it's not clear to me how we'd even get the device instantiated on a
>>> normal ACPI system.  There's no ACPI IDs defined (and there aren't =
any
>>> existing ones), just a conversion of the property parsing code.
>=20
>> These "random" cleanups make the spi-xilinx.c driver work on non-DT =
platforms.
>> Which is what the cover letter says.
>=20
> The cover letter just says:
>=20
> | Transition the driver to use the generic device property API.
>=20
> | Additionally, make interrupts optional to allow the driver to fall =
back
> | to its existing polling mode on systems where interrupts are either =
missing
> | or broken.
>=20
> which doesn't mention any motivation for this, it's just a statement =
of
> what the patches do.  It's very unclear why this is a series TBH, the
> interrupts changes have no visible relationship to the device =
properties
> conversion and should have been submitted separately.

V1 was a single patch. And the commit body there was:

"This makes the driver work on non-OF platforms.=E2=80=9D

See https://lkml.org/lkml/2026/1/15/66

It was suggested to reword the body in imperative mood. Maybe that=E2=80=99=
s where it got lost.
I can re-add the mentioning of non-OF platforms to the cover letter to =
make it clear.

Andrew Lunn also suggested to split it into 3.

>=20
>> We are trying NOT to introduce new ACPI IDS, or fork the existing =
drivers.
>> But rather, to re-use the existing drivers as much as possible by =
relying on the
>> special DT namespace link "PRP0001":
>=20
> What is the goal in avoiding using native ACPI bindings?  PRP0001 is a
> workaround for cases where you have things that ACPI has never dreamed
> of and can't abstract well but which have already been handled by DT,
> it is not something we're aiming.  The hardware you have described
> seems like fairly normal server style hardware and like it should fit
> well with normal ACPI.  Adding ACPI IDs to existing drivers is pretty
> common and standard, I'd class that as reuse.

I did not intentionally avoid introducing new ACPI _HIDs, but at the =
same time
don=E2=80=99t understand the need to, especially when PRP0001 workaround =
works and
it works well. We don=E2=80=99t own the spi-xilinx driver and neither do =
we own the i2c-xiic.
These are standard Xilinx IP platform drivers that could be made usable =
on ACPI platforms
by just switching to device_property APIs. Which is what these series is =
trying to do.


>=20
> As far as I can see from the example you posted the devices are all
> fairly standard and just need IDs assigning to work naturally with =
ACPI.
> There's possibly an argument for using PRP0001 for the flash given =
that
> it's not especially idiomatic to have OS visible flash on ACPI =
systems,
> usually flash would only be visible to UEFI, but equally the =
description
> would trivial and systems wouldn't have to use it.

You mention =E2=80=9Cidiomatic=E2=80=9D a lot. Are you implying the SPI =
NOR-flash devices should
not be exposed to user-space? Then why does the spi-nor driver even =
exist?

We have a SPI device that needs to be accessible from users-space in =
order to
=E2=80=9Cflash" various FPGAs. How do you suggest we do that?

Also, there are hundreds of drivers in the DT namespace that are missing =
the ACPI IDs today.
Do you suggest adding ACPI IDs to every driver just so it=E2=80=99s more =
=E2=80=9Cidiomatic=E2=80=9D to use?
I am just trying to get this 2-line small change merged so we can start =
using the standard spi-xilinx driver today. I am not trying to boil the =
ocean.

>=20
>>> You should use whatever firmware interface is sensible for the =
platform,
>>> if that's x86 that's always ACPI.  For other architectures there's a
>>> split with servers using ACPI and more embedded platforms using DT.
>=20
>> Which is exactly what we are doing - using ACPI on x86 to describe =
the hardware.
>=20
> There is the bit where there's a PCI bus in the way and you don't use
> ACPI particularly idiomatically...  I can see the dodging out on the =
PCI
> bus description, but the way the devices behind the PCI bus are
> described seems confusing.

What exactly about this usage is not idiomatic? Our PCI device =
description in ACPI looks like
this (GPP5 is the PCIe bridge under which the FPGA is located):

    Scope (_SB.PCI0.GPP5)
    {
        Device (FPGA)
        {
            Name (_ADR, 0x00000000)
=E2=80=A6
            Device (I2C0) {
            ...
            }

            Device (I2C1) {
            ...
            }

            Device (SPI0) {
            ...
            }

            Device (SPI0) {
            ...
            }

        }
     }

I have provided ASL fragments for I2C and SPI earlier.

Which part of it is not idiomatic?







