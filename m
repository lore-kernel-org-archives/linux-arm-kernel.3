Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35990CCF2DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 19:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4e6RoglALX0F3jdj2Uumhf/EavmNFlUv5VgBki4jNQY=; b=dDWRRWM/JWsc9AxIK6PHuiSHXC
	VK70zPLSFgwE5grPaEPs+QoKS3MS6hSzVaEYkRjRkXdzDzdZFJrR5BoKwMMxK8juO3Eqy4Z5ACT8D
	bGn9JlsWuShtURFxaTDRtXDo+CC8bTd6loCFQQg+XAG6lMzUZT5fNGuB3unk5DzRTDidKllSK6eWn
	psEQG+DCEqgKNM9wf5P9iR2zzB0b3hYRWw6ASsLI93T6IZpz934Mi1ImqsjpFC+vDAYrn2Sfz9sPm
	sO7R/lggi8BHXX7ZEMsKmy8M/6o7r06WaYJgFPuo2GAP+uaNY0OwYR/O/i5daUJpkPMS4PIydP42V
	jRgbxqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvN2-00000002njX-3dIB;
	Mon, 19 Jan 2026 19:57:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhvN1-00000002njQ-18ew
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 19:57:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5145E60151;
	Mon, 19 Jan 2026 19:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127F2C116C6;
	Mon, 19 Jan 2026 19:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768852622;
	bh=I6Vvisgn1Q+kcWkCapIkRE+4BWbsnVSRRjSJ+RZxpm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JEE0kulJOkzrMzaVqpk/pyIFfKMGoK6hHprAGuMfz0ulvVyppFgV2H0nbPmXSlwZX
	 yPLFTYuKaVcZ903IGuhCr7kp6/i+iPQxUqCqs2bUZJuHejsAzxSQ5cLQW95r8SY/j8
	 8i618MqYH9PhTwZ2i+0LQgBeNSCiUzcTxGE2DwP96eF8NLXd1yeiNLwBVVOh+btsYi
	 gKXgv1+wHeTHOSCEHZYAzG6roKCOt90m3Gfpvs9i/qjWSTsid+sgBAD4uXKNSLwd8y
	 F8wkpVnsJu+/vGJFqHrUHGIfzr9XzJCUGOZ3TnDlXB3p/a2XRm5KBIHTfz0khF37Mz
	 qv+rf5GY7ahuQ==
Date: Mon, 19 Jan 2026 19:56:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
Message-ID: <980ad372-a2c7-417c-91f9-4958d3d1aaca@sirena.org.uk>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z9QuIhghQmufumfI"
Content-Disposition: inline
In-Reply-To: <a3fcef3a-d1e9-4b46-b114-3a82575e052e@amd.com>
X-Cookie: Does not include installation.
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


--z9QuIhghQmufumfI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2026 at 08:17:46PM +0100, Michal Simek wrote:
> On 1/19/26 20:01, Mark Brown wrote:
> > On Mon, Jan 19, 2026 at 07:52:35PM +0100, Michal Simek wrote:

> > > Is it a better way to use auxiliary bus as was recommended by Greg in past
> > > on drivers/misc/keba/cp500.c review?
> > > https://lore.kernel.org/linux-i2c/2024060203-impeding-curing-e6cd@gregkh/

> > The driver there appears to be doing runtime enumeration based on some
> > EEPROMs on the system and creating platform devices based on what it
> > finds there so it's a bit of a different thing, the aux bus suggestion
> > is about what the code that does with the data it got from the EEPROM.
> > This patch is for something described directly by firmware so there's no
> > way we'd create an aux device, that's purely in kernel.

> I don't thing it is actually eeprom because in fpga you can place at certain
> location just memory (or RO memory) to describe what it is inside.

The table of per module I2C EEPROM devices (there's a whole pile flagged
as optional) sure does look like it, and it's a very standard way to
implement hardware enumeration of non-enumerable systems.

> If you know it I think you have multiple options how to wire existing drivers.

> 1. ACPI - which is what this series is trying to do

Is it?  It just looks like random cleanups.  We've got a change to make
interrupts optional and this change to device properties - the cover
letter just says it's a transition to device property but there's no
indiciation why it's being done.  The cover letter for the series just
says it's switching to device properties with no further explanation.
It looks like a "that's the newer API" thing than something that's been
thought through.

None of this looks like something intended to add ACPI bindings,
it's not clear to me how we'd even get the device instantiated on a
normal ACPI system.  There's no ACPI IDs defined (and there aren't any
existing ones), just a conversion of the property parsing code.

> 2. DT - on x86 not sure if feasible

No, x86 decided not to use DT and shoehorn everything into APCI (and the
x86 SoCs put their platform devices behind fake PCI that looks like PCI
to the OS).

> 3. platform drivers - as described above by Greg not an option on PCIe
> 4. aux bus - for example keba drivers
> 5. dfl - drivers/fpga/dfl* - used for accelerators.

These are orthogonal to the above, they're Linux internal things not a
concept the firmware has.  You have firmware descriptions of things that
can be mapped onto platform devices but that's a separate thing.

> Pretty much all current Xilinx drivers for soft IPs (spi, i2c, uarts,
> watchdogs, etc) are platform drivers (more OF drivers because platform data
> are mostly not used).

> It means I think would be good to get any recommendation which way to go.

You should use whatever firmware interface is sensible for the platform,
if that's x86 that's always ACPI.  For other architectures there's a
split with servers using ACPI and more embedded platforms using DT.

> > I have no idea what the hardware this series targets is (other than that
> > it's using a FPGA) or if there's even a motivation for the change other
> > than code inspection.

> I think all these cases are very similar. You have x86 with pcie root port
> which is connected directly (or via pcie slot) to fpga. In fpga you have
> pcie endpoint HW which connects other IPs sitting on AXI.

What are "all these cases"?  For something connected via PCI I would
expect a PCI driver that knows via some mechanism what's connected to it
and then instantiates the IPs, probably as aux devices.  I would not
expect to see the contents of the PCI device described in firmware at
all, that's a big goal with using PCI.  If something is not connected
via PCI that's obviously not going to fly but it sounds like you're only
interested in PCI cases here.

--z9QuIhghQmufumfI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlujIgACgkQJNaLcl1U
h9Du4Qf/QEKPMJId1EFhT9SWaLCmGH9yQJ7HkMRcEjshV2zUijpH0Ao9FHDyKNou
fzwxki5H2KmSHH6lMX0m06XzZCrBUZA3udtzOijysVDlyzYg8xojG6Gt5FBzj+v8
QTtBqSipaYb8fGecQdgGxFrrzDaahTmvvGFqQugl4F1D+osDoCNy9m2zREo6UAuh
MzOFlO/vyekNBsoaiV1LhxurwqPpJHq6dNJ2N+SVId5KvrFswMaNI8TJMzJ2C5qp
h1naAXVxaBwkmXfaKzky/XmTQCGHT65sdSk0sixwz0f9fcNFfuumZJMhtqcxzTxR
ZMxVbNFyBY+PbByehglZ1BTi/zn9kg==
=2Frd
-----END PGP SIGNATURE-----

--z9QuIhghQmufumfI--

