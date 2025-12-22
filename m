Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC64D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AttElqDSZFZ5tiQne+CS8FPfox8VRFUC9LsQjy4H18=; b=QeO6g/XaNzhPrj0UPWOX6ikcSQ
	unCY9HnW1VpwzeteQgbPrc0U/TOAmxBsJ0fFg4iFceeEYNNQvzEbcfa88NACIBZMEBB9q7G0mNmX4
	VzYpaxOhcdBMWYtpHk1aO4ou7q1O/W8Jvu9cSY6S3lZqYFV3jcLFx5rJwYPdbH3w5pnJh62ZIX1eF
	TeU86WsD3uHcMQPNKMPNuVNhkv/GrrIT7qQvyLEECjpMfYC88AbWWxiJFhB4O2o2BvYNcPD6TidWm
	Ru5DCco+NtujyvVsWwCGKNi8sSi9eLpFp+a7zZtSEyKohkI4pSmq6lEkZtjOnh9Qbz+c7ooWPxD7f
	N7E20grw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXb34-0000000DO1X-0KBK;
	Mon, 22 Dec 2025 08:13:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXb30-0000000DO0t-2r6W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:13:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1812743E82;
	Mon, 22 Dec 2025 08:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD91EC4CEF1;
	Mon, 22 Dec 2025 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766391220;
	bh=+LZc9sH1FCeBixh1w4vXv6wQcF1lRDxb/ilDg7ghLhQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R+xFP6nK0qe53POnY7jjyszn3iOUZuinw6ZqS6AJsoqWcuZII35RkzQ7YGVYI1xeK
	 LQE264oNB8kS+JJ5I3UO561Y3JAxbMY/Zf5Vi3PjC7YxsXnP/dPk+0tWsSiMPcd732
	 /olnqcnrwQ6tECTPRewTAgLaNLMGayFaJi8zIzSAmQAG8ZzZuW+5VQmFraNq2XDYE/
	 oHRotrUO1oKqgjF1gSLrHo2x7YcBsUUyGzXES/pEXpIT/lxGg6TJ2AStLzGOzjSvRE
	 0JTBn7ixNl1imKBUIDCPicOnAe5qbaF4/hzD6C1QAZidh6OB6uCAWY6P8ZjyYQddYh
	 oX2BxKQQyK2+g==
Date: Mon, 22 Dec 2025 09:13:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 tony.luck@intel.com, bp@alien8.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
 linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com, Michael.Zhao2@arm.com,
 linux-efi@vger.kernel.org
Subject: Re: [PATCH 03/12] ras: add estatus vendor handling and processing
Message-ID: <20251222091334.5cb8465f@foz.lan>
In-Reply-To: <20251219181226.2859763-1-ahmed.tiba@arm.com>
References: <euhams5heiuaawxq4e5ty7iijuvwt5gvdx3flsm4npligjeulq@lv3cwekyb2o2>
	<20251219181226.2859763-1-ahmed.tiba@arm.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_001342_790403_3519BBEF 
X-CRM114-Status: GOOD (  36.89  )
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

Em Fri, 19 Dec 2025 18:11:54 +0000
Ahmed Tiba <ahmed.tiba@arm.com> escreveu:

> On Fri, Dec 19, 2025 at 04:30:40PM +0100, Mauro Carvalho Chehab wrote:
> >On Fri, Dec 19, 2025 at 02:49:02PM +0000, Ahmed Tiba wrote: =20
> >>
> >> On Wed, Dec 18, 2025 at 05:04:53PM +0100, Mauro Carvalho Chehab wrote:
> >> =20
> >> >> Teach the estatus core how to walk CPER records and expose the vend=
or
> >> >> record notification path. This adds the section iteration helpers,
> >> >> the logging helpers that mirror the GHES behaviour, and the deferred
> >> >> work used to hand vendor GUIDs to interested drivers. No users swit=
ch
> >> >> over yet; this simply moves the common logic out of GHES so the next
> >> >> patches can wire it up.
> >> >>
> >> >> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com> =20
> >> >
> >> >...
> >> > =20
> >> >> +static bool estatus_handle_arm_hw_error(estatus_generic_data *gdat=
a, int sev, bool sync) =20
> >> >
> >> > Huh?
> >> >
> >> > This is a CPER record from GHES. Why are you moving CPER code out
> >> > of ghes.c, placing in a file named estatus.c? Doesn't make much
> >> > sense on my eyes...
> >> >
> >> > Same applies to to other GHES CPER record types. =20
> >>
> >> GHES still fills in the CPER record, but the parsing and logging logic=
 is
> >> shared with the new DeviceTree provider so I pulled those helpers into=
 the
> >> estatus core. =20
> >
> > I see, but this is not really estatus core. Instead, it is part of GHES=
 CPER
> > handling logic, which is defined at ACPI and UEFI specs. moving it to e=
status
> > sounds odd, at least on my eyes.
> >=20
> > Perhaps I'm failing to see where at ACPI/UEFI specs how CPER would be
> > integrated with an OpenFirmware approach to handle CPER without GHES.
> > Care to point to the relevant specs, if any? =20
>=20
> ACPI/APEI (via GHES) defines how CPER records are discovered and notified=
 on ACPI systems,
> but there is no ACPI or UEFI-defined equivalent for OpenFirmware/DeviceTr=
ee platforms.
> UEFI standardises the CPER record format itself, not the transport or dis=
covery mechanism.
>=20
> On non-ACPI systems we still receive the same UEFI-defined CPER payload
> from firmware, but Linux needs a different, platform-specific contract
> to locate and acknowledge it. The DT binding is a Linux-side description
> of that contract rather than something defined by ACPI/UEFI.

That's where I'm failing to understand: CPER is part of UEFI spec, and
the only deliverable mechanism I'm aware of for CPER is via GHES or
GHESv2 - e.g. via ACPI.

Within the scope of https://uefi.org/specifications, I'm failing
to see any other deliverable mechanism.
=20
> >> Both providers already call into the same notifier chain and
> >> memory-pool helpers; this patch just moves the generic CPER walking ro=
utines
> >> next to the rest of the common code so the DT path doesn=E2=80=99t hav=
e to grow its
> >> own copy. If you=E2=80=99d prefer a different file layout or naming to=
 make that
> >> intent clearer, I=E2=80=99m happy to adjust. =20
>=20
> > Moving the code from ghes.c to estatus.c or to elsewhere shouldn't make=
 any
> > difference, as the DT handling logic could simply be calling the functi=
ons
> > from ghes.c (or estatus.c). I fail to see why they need to be moved. =20
>=20
> The motivation is to provide a shared implementation for non-ACPI provide=
rs,
> so that the DT path does not depend on ACPI/APEI.
>=20
> While the helpers currently live in ghes.c, they are CPER-specific and do=
 not rely on ACPI tables,
> APEI infrastructure, or GHES notification semantics. Keeping them there e=
ffectively makes GHES
> the only place those helpers can live, even though the logic itself is pr=
ovider-agnostic.

The logic is related to GHES, as this seems to be the only standardized
mechanism to report CPER records. As it is part of APEI, get_maintainers
points to the people that have been maintaining it as:

	$ ./scripts/get_maintainer.pl -f ./drivers/acpi/apei/ghes.c
	"Rafael J. Wysocki" <rafael@kernel.org> (maintainer:ACPI APEI,commit_signe=
r:6/13=3D46%)
	Tony Luck <tony.luck@intel.com> (reviewer:ACPI APEI,commit_signer:3/13=3D2=
3%)
	Borislav Petkov <bp@alien8.de> (reviewer:ACPI APEI,removed_lines:5/62=3D8%)
	Hanjun Guo <guohanjun@huawei.com> (reviewer:ACPI APEI,commit_signer:4/13=
=3D31%)
	Mauro Carvalho Chehab <mchehab@kernel.org> (reviewer:ACPI APEI,authored:1/=
13=3D8%,removed_lines:6/62=3D10%)
	Shuai Xue <xueshuai@linux.alibaba.com> (reviewer:ACPI APEI,commit_signer:5=
/13=3D38%,authored:2/13=3D15%,added_lines:56/218=3D26%,removed_lines:34/62=
=3D55%)
	Len Brown <lenb@kernel.org> (reviewer:ACPI)
	Jonathan Cameron <Jonathan.Cameron@huawei.com> (commit_signer:5/13=3D38%)
	Breno Leitao <leitao@debian.org> (authored:2/13=3D15%,added_lines:38/218=
=3D17%)
	Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com> (authored:2/13=
=3D15%,added_lines:103/218=3D47%)
	Ankit Agrawal <ankita@nvidia.com> (authored:1/13=3D8%,removed_lines:6/62=
=3D10%)
	Jason Tian <jason@os.amperecomputing.com> (removed_lines:7/62=3D11%)
	linux-acpi@vger.kernel.org (open list:ACPI APEI)
	linux-kernel@vger.kernel.org (open list)

Moving it elsewhere would make it confusing, as the expected deliverable
mechanism for CPER is via GHES - as this is the only one defined at the
uefi.org specs.

While it might be moved to EFI and placed under cper.c,=20
get_maintainers.pl would point to:

	$ ./scripts/get_maintainer.pl -f ./drivers/firmware/efi/cper.c
	Ard Biesheuvel <ardb@kernel.org> (maintainer:EXTENSIBLE FIRMWARE INTERFACE=
 (EFI))
	linux-efi@vger.kernel.org (open list:EXTENSIBLE FIRMWARE INTERFACE (EFI))
	linux-kernel@vger.kernel.org (open list)

which is not the people that have been maintaining RAS.

Placing it under a "estatus.c" file would make it completely
dissociated with UEFI/ACPI specs, as this name means nothing at
the specs.

Also, adding a new maintainer's entry won't make any sense, as the
people that currently reviews and maintains GHES/CPER records
should be kept.

> By moving the CPER parsing and logging pieces into a common location,
> both GHES and the DT provider can reuse the same implementation,
> while the ACPI-specific discovery and notification code remains under dri=
vers/acpi/apei/.
> This avoids having the DT provider reach into GHES internals or duplicate=
 CPER handling code.

As Boris mentioned on patch 00/12, we need to better understand
the high level scenario, as it is still not clear to me how a
firmware-first notification would happen without ACPI.

> If the current naming or file layout makes that separation unclear, I=E2=
=80=99m happy to adjust it.

Thanks,
Mauro

