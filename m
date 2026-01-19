Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB847CCF2EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 20:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJmtHjW42S2n0YlNgk+uujnA9gZ+ERrhk/g3IuawkPA=; b=bGnV6n5bOv5R5VXU82T/N/JVJB
	iRRrZYmwdyYPc6WjOJaG1IUjmcpL+In9mKaHM4+inbMMu/8dV5/2svTfYkvN2Hp9Ny6sfmDt0wkZR
	fVTZo6VrnI/wnK0NI5/obg6LSoG/5alK9FiwOwZNSdLD/LlJavy4h8ta6S1cKmGJr9tdcsKri0nHn
	Q7Djhmy5PAZ+QKk+rSkzd3u3J/1R/QCRePY4S46x5y/6aH5EWVCsg4WNsglHcO/o4rK+/Tismb30x
	vDae8ngmhV08Wicu3kFDmAHNgaL+gVJyJ0nxayQW1XWlonWLwDU8WUqcdacoOU0wwPidRcHkygLnf
	TzN62vvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvtr-00000002pzR-20dt;
	Mon, 19 Jan 2026 20:30:59 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvto-00000002pyf-0yyl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 20:30:57 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a0833b5aeeso47487355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 12:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768854655; x=1769459455; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJmtHjW42S2n0YlNgk+uujnA9gZ+ERrhk/g3IuawkPA=;
        b=JMVmsOZnhXhQKXPjI7FNypAMhOPaeOEOaDWBvElBd0R7zJViu7epsxskjthMiH0Cpw
         5MI7ZZRkBk8r8Vl5Us+dGjRAhYqhJKkD29XhpC+ooE2E7Qc0QXduzxTq6s/Ecv2SsKGl
         CUMcJnsal+NybLnccrhSEoRHm1w0qLma2toSvhmrRm+uTtel61h9jL3r7feM/pCn5zzO
         RktdYv650R1x0XCQeO8K3c4BjDyZ+ataSxmu+U7alt8bMmqIMmbJwDCJmraLQttTtH7A
         XpvzE1oHi0nbRkr6YavdRCG51TGOcjNwJzgYFskAq6UJaPzHINsKozMI1JPWtDLEYGnl
         cVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768854655; x=1769459455;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJmtHjW42S2n0YlNgk+uujnA9gZ+ERrhk/g3IuawkPA=;
        b=IxPMzVi3wCfxsnke82Nx755XK+yX9OfCRv8UhpGSE8sM+u8YadWdbsHvXTx9NCF38c
         Opg0GPpKhgBUuHacboVsA+HVVGY+gteOFJC1aLFNiooucTYVfTTJFL14jGqEZAttk1dT
         c8rHrcpHhPLVE1wXE0Jtoqc6x6I32GJnCogyka6pqSGcDkrroGPfecihkrbo15RL7QJ1
         HK6bQUQPhPghn1x+Abm3f2CmbJ7mWyVlL5KjbdLV/TzuxLDrudzc3KXXWOtKacrunpSK
         YYVSdOB53B2eHZTH/lEwfrxNi0hofIP3yoSNxl7WmpRlWJh6oJbrfscc5nOzsjWH6KgV
         6QWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAlC+hRjuuNyQuZp58356uALUr3bAh+sD3zHt43pPpm3oqGB402IqqTyhHFgRfQ44h9ilAFmX3MotfdeaQ8rvV@lists.infradead.org
X-Gm-Message-State: AOJu0YxxL/+O9aGCAT35G95W6tk5GfIjvuTxkCNMTh+v50lcPZzKpQT+
	sPt4Eadf1Kka6ydgUfCvf4HuteWUYc+5QqDymwN+ty8yncUNs8zQngNrACouOMm3AQY=
X-Gm-Gg: AZuq6aKDqV7/OQc0HNDEGeGzC3nAk13OKNo/OBCgSkWvfYyWIqu+z07A+tkwVPu5zi7
	o9FBPOK3NrGkgRny8dA3Jrdgpq0weML77P+ACnxbxK6jUI3JlY5Yzpgfs+3s6J4ep2FytAExw4o
	0EBIyU2UODYUwVIaI6OA7cWlLVwekxAqYPU3Z4qk+CMX1A/V7W+FItGibd+vFZjRlE8KFx1XX9V
	D+KrhUIU7kuI3XM0/2ol/4Me4E4DR78LXP4tf340e4GvqA6YupXaAlddEnCg9mP0AQ4w24SU+/8
	Qqguw/AdYiV1fqG8b3Stf7VX8cP9MSYBI7Lhno+1Na/3LNZIJslSc3u85jDV/rn4CMVJxip1TFH
	IO3fmyyilr3/7M938KxR+eNQWDVxEskFVt0+vBL7Cfhc5LD06KmjQLneEXdDs0ZrHiGCESWJsAo
	TqldA1lgDxIDv7PU99+uY9nfCw35k+Qx/Y7Qc=
X-Received: by 2002:a17:902:c405:b0:2a0:b06d:1585 with SMTP id d9443c01a7336-2a7188f91a1mr110618635ad.34.1768854654686;
        Mon, 19 Jan 2026 12:30:54 -0800 (PST)
Received: from smtpclient.apple ([50.47.115.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fb239sm102531395ad.70.2026.01.19.12.30.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Jan 2026 12:30:54 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <980ad372-a2c7-417c-91f9-4958d3d1aaca@sirena.org.uk>
Date: Mon, 19 Jan 2026 12:30:43 -0800
Cc: Michal Simek <michal.simek@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4831B269-DFC1-40E0-96B7-67981AC72562@nexthop.ai>
References: <8436e914-429f-40b9-8e6f-ec3b02702cad@sirena.org.uk>
 <69F83558-4675-4FC2-8656-BC6E3481AD65@nexthop.ai>
 <9e559e33-4f2f-40d4-a15f-584548bd6057@sirena.org.uk>
 <05D2CC15-DD6B-40F0-BFF0-3264D4FF96ED@nexthop.ai>
 <b1b79de0-a078-486d-b3e9-96899354407c@sirena.org.uk>
 <3D1B59A7-6E57-4C8C-AA95-EA7AA115264F@nexthop.ai>
 <b9ad8ab8-7985-4c89-a82b-c7f31d32c167@sirena.org.uk>
 <a6d57890-89c1-445e-836c-d8239d20c621@amd.com>
 <b03307f7-93f6-4680-9241-cf28b5456fd0@sirena.org.uk>
 <a3fcef3a-d1e9-4b46-b114-3a82575e052e@amd.com>
 <980ad372-a2c7-417c-91f9-4958d3d1aaca@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_123056_307445_6FF2A7EB 
X-CRM114-Status: GOOD (  40.97  )
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



> On Jan 19, 2026, at 11:56=E2=80=AFAM, Mark Brown <broonie@kernel.org> =
wrote:
>=20
> On Mon, Jan 19, 2026 at 08:17:46PM +0100, Michal Simek wrote:
>> On 1/19/26 20:01, Mark Brown wrote:
>>> On Mon, Jan 19, 2026 at 07:52:35PM +0100, Michal Simek wrote:
>=20
>=20
>> If you know it I think you have multiple options how to wire existing =
drivers.
>=20
>> 1. ACPI - which is what this series is trying to do
>=20
> Is it?  It just looks like random cleanups.  We've got a change to =
make
> interrupts optional and this change to device properties - the cover
> letter just says it's a transition to device property but there's no
> indiciation why it's being done.  The cover letter for the series just
> says it's switching to device properties with no further explanation.
> It looks like a "that's the newer API" thing than something that's =
been
> thought through.
>=20
> None of this looks like something intended to add ACPI bindings,
> it's not clear to me how we'd even get the device instantiated on a
> normal ACPI system.  There's no ACPI IDs defined (and there aren't any
> existing ones), just a conversion of the property parsing code.
>=20

These "random" cleanups make the spi-xilinx.c driver work on non-DT =
platforms.
Which is what the cover letter says.

We are trying NOT to introduce new ACPI IDS, or fork the existing =
drivers.
But rather, to re-use the existing drivers as much as possible by =
relying on the
special DT namespace link "PRP0001":

"The special DT namespace link device ID, PRP0001, provides a means to =
use the existing DT-compatible device identification in ACPI."

Also from the same document:

"
Platform bus support

Since we are using platform devices to represent devices that are not =
connected to any physical bus we only need to implement a platform =
driver for the device and add supported ACPI IDs. If this same IP-block =
is used on some other non-ACPI platform, the driver might work out of =
the box or needs some minor changes.
"


>> 2. DT - on x86 not sure if feasible
>=20
> No, x86 decided not to use DT and shoehorn everything into APCI (and =
the
> x86 SoCs put their platform devices behind fake PCI that looks like =
PCI
> to the OS).
>=20
>> 3. platform drivers - as described above by Greg not an option on =
PCIe
>> 4. aux bus - for example keba drivers
>> 5. dfl - drivers/fpga/dfl* - used for accelerators.
>=20
> These are orthogonal to the above, they're Linux internal things not a
> concept the firmware has.  You have firmware descriptions of things =
that
> can be mapped onto platform devices but that's a separate thing.
>=20
>> Pretty much all current Xilinx drivers for soft IPs (spi, i2c, uarts,
>> watchdogs, etc) are platform drivers (more OF drivers because =
platform data
>> are mostly not used).
>=20
>> It means I think would be good to get any recommendation which way to =
go.
>=20
> You should use whatever firmware interface is sensible for the =
platform,
> if that's x86 that's always ACPI.  For other architectures there's a
> split with servers using ACPI and more embedded platforms using DT.

Which is exactly what we are doing - using ACPI on x86 to describe the =
hardware.

>=20
>>> I have no idea what the hardware this series targets is (other than =
that
>>> it's using a FPGA) or if there's even a motivation for the change =
other
>>> than code inspection.
>=20
>> I think all these cases are very similar. You have x86 with pcie root =
port
>> which is connected directly (or via pcie slot) to fpga. In fpga you =
have
>> pcie endpoint HW which connects other IPs sitting on AXI.
>=20
> What are "all these cases"?  For something connected via PCI I would
> expect a PCI driver that knows via some mechanism what's connected to =
it
> and then instantiates the IPs, probably as aux devices.  I would not
> expect to see the contents of the PCI device described in firmware at
> all, that's a big goal with using PCI.  If something is not connected
> via PCI that's obviously not going to fly but it sounds like you're =
only
> interested in PCI cases here.

Yes, we have a somewhat =E2=80=9Cgeneric=E2=80=9D PCI driver that =
actually doesn=E2=80=99t need to know
what=E2=80=99s actually =E2=80=9Cbehind=E2=80=9D it. It only implements =
irq_chip and gpios.
It=E2=80=99s the firmware (ACPI) that describes the devices as nested =
device nodes under the
FPGA device node. These HW ACPI tables are SKU specific, so the generic =
FPGA PCI driver
can be kept generic. And all the device enumeration just works. It goes =
with the kernel
philosophy of keeping the policy out of the kernel as much as possible.

All we need is these little =E2=80=9Crandom=E2=80=9D cleanups to tie it =
all together and make it working.

Regards,
Abdurrahman


