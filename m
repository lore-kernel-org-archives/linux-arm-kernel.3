Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC39606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yhTqFH3U;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ws1hHqpC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/QvKnUG4iFq+pg6e/pJ49FqAE2AbwcrtIOiNlhBH95A=; b=yhTqFH3UoCeMHWwN3oZuhh6PW7
	pjR9tHDp3YvuWPPm3Dbz4wynrrk1LhPzpwNaR3ljwKgSvOncxokIHi5ZsknuXnH0yytFzgjV2eHl0
	DEje8DTX38WRc1uGgkaMGOUM8dXH0EON22yXp4t0d6YGQCb/HdElhhQfbYV6oYqovvG/Dbo0ZH4eF
	dWlPZZUqQtd4Iuu8CdSFH6JYc3yN55cXCpMQK6R8ZHYgtyog40VrADNXEkbtRbjO0HxE61s5ABpX+
	K7E0M16tbl5N3A+j/n1teQrqNtljTsgf44dfaUFSN6S+KbP7UcGjZnRWzdwCslSGfzo0M3zEqqdO+
	kOgQ7WUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxZ1-0000000980b-2URQ;
	Thu, 05 Nov 2026 13:31:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxZ0-0000000980P-2bC9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:31:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 365B0408A1;
	Thu,  5 Nov 2026 13:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4171F000C1;
	Thu,  5 Nov 2026 13:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885494;
	bh=/QvKnUG4iFq+pg6e/pJ49FqAE2AbwcrtIOiNlhBH95A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ws1hHqpCrTO3vv5+xWSpKi1W3FzvYwAnjHo7ZBri+xFew3S/iI+cg+vaLDpwRX4Bq
	 7CH55eaByLgICZl7qi4fjM2FWC0dAz7vDsAicN5XTdy7H9aMIAAut0u2LoqDOF0kcC
	 qCcUi4Q2GjAQWl+Zxb6je9rfvn6D4UylfxObtecabLBvOk5dz+OzpM2go58G+puAzL
	 2jPeQsLvvjE/3CRV8jGtCR8s4rMoyzf0+UCKnZHc6okGrT2VzObWstYJpBUnNr19x1
	 DhUau/mWTXC4er4D5cHYEemg2gy+4t9OgFaQVk8yQ7Y6RO4oWngYTJlems/uva3Y3a
	 ep/1AInJyJiEw==
Date: Thu, 5 Nov 2026 14:31:31 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, arm <arm@kernel.org>, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, James Morse <james.morse@arm.com>, 
	Ben Horgan <ben.horgan@arm.com>, Sizhe Liu <liusizhe5@huawei.com>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Message-ID: <aux_4NxiWvD9uVev@orome>
References: <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
 <auslF5pwDHtcNoCy@orome>
 <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
 <autADOKsSVVMn6r9@orome>
 <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
 <autmcaraWcXIoRfZ@ashevche-desk.local>
 <20261104161125.00000523@oss.qualcomm.com>
 <20261105-inventive-partridge-of-maturity-793a2e@sudeepholla>
 <8f45711b-d415-4694-a47a-12d4b7427e0f@app.fastmail.com>
 <20261105-quizzical-wine-oryx-e6f91a@sudeepholla>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z7tak3mo2ipp6x3b"
Content-Disposition: inline
In-Reply-To: <20261105-quizzical-wine-oryx-e6f91a@sudeepholla>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--z7tak3mo2ipp6x3b
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 10:23:24AM +0000, Sudeep Holla wrote:
> On Thu, Nov 05, 2026 at 10:54:42AM +0100, Arnd Bergmann wrote:
> > On Thu, Nov 5, 2026, at 10:30, Sudeep Holla wrote:
> > > On Wed, Nov 04, 2026 at 04:11:25PM -0800, Jonathan Cameron wrote:
> >=20
> > >> 1) Basic stand alone driver stuff.  Mostly that's all pretty standard
> > >>    and follow the specs where possible.  If there are gaps start ask=
ing
> > >>    questions. Linux definitely  doesn't support all the stuff that h=
as been
> > >>    added to the spec in recent years.  So this covers things like re=
gister
> > >>    addresses, interrupts etc.  All fine, hopefully a subsystem maint=
ainer
> > >>    can take a look and will have enough of any idea.  If not ping th=
e folk
> > >>    on this thread for help.  Things are a bit flexible for consumer =
type
> > >>    devices where fixed and bodges are common, generally less so if i=
t is
> > >>    server grade hardware.
> > >>=20
> > >> 2) Stuff that is an ACPI spec gap or place where we'd expect general=
ization.
> > >>    There are several examples of this on list this week and a few mo=
re in
> > >>    my inbox.  The particular series here might fall into this catego=
ry.
> > >>    I've not figured out enough of the details yet to say definitivel=
y.
> > >>=20
> > >
> > > Nicely summarised or categorised Jonathan. Nothing much to add.
> >=20
> > +1
> >=20
> > >> I'd also expect a driver using AML as the target interface to either
> > >> point at a published spec doc, or to include some snippets
> > >> of the AML - that can be a lot easier to read than the driver code
> > >> (imagine reading DT by only looking at how drivers parse it).
> > >>=20
> > >
> > > Ideally, it should be just HID that any vendor needs to publish unless
> > > they make use of any custom methods or something device specific like
> > > DSD/DSM. I would expect most of the devices to use standard methods a=
nd
> > > properties that are already well defined in the ACPI spec.
> >=20
> > >> Given that has new ABI etc, I'd expect that to have gotten broader r=
eview
> > >> as well.  Probably keeping it to linux-tegra and lkml alone wasn't
> > >> going to result in anyone noticing!
> > >>=20
> > >> https://lore.kernel.org/all/?q=3D20260929095915.2215685-1-anrao@nvid=
ia.com
> > >>=20
> > >
> > > Agreed, it shouldn't hurt to cc linux-acpi for such driver ACPI enabl=
ement
> > > patches.
> >=20
> > Is the "BMRQ" in
> > https://lore.kernel.org/all/20260929095915.2215685-3-anrao@nvidia.com/
> > a custom method then?=20
> >=20
>=20
> I=E2=80=99ve quickly reviewed the patch; it does implements a custom meth=
od BMRQ
> rather than a standard or out-of-the-box solution. More details on this is
> used based on my understanding below.

To get everyone on the same page: in a nutshell, BPMP is a separate
processor that handles various aspects of power management (Boot and
Power Management Processor). The CPU communicates with it over a shared
memory region and a mailbox/doorbell for signalling.

> > How does this relate to the EC and PCC interfaces in ACPI systems?
> >=20
>=20
> I am still evaluating how the BPMP driver is intended to operate on ACPI
> systems. In the meantime, I share the same questions noted above. The cur=
rent
> commit message lists several driver features that may not be required for
> ACPI, which has introduced some clarity issues regarding the intended des=
ign.

My understanding is that an ACPI systems, as opposed to DT where we do
this all through kernel drivers, the inter-processor communication is
done via AML. This is because standard power management operations use
this same mechanism to enable clocks, deassert resets, etc.

> > In current mainline, I see that the bpmp driver is used on DT systems
> > by the tegra specific cpufreq, memory and pci drivers, but I would
> > expect that on ACPI those all use shared drivers. Are there any other
> > users that are not already covered on ACPI?
> >=20
>=20
> For ACPI systems, CPUFreq operates through CPPC via PCC, MEMIO, or
> supported backends.
>=20
> My understanding is that the BMRQ method is called by tegra_bpmp_transfer=
(),
> which supports Tegra-specific drivers for power domains, clocks, resets,
> I2C, PCIe, and memory. On ACPI, these can be abstracted through PCC
> OpRegions as part of standard methods like _ON/_OFF or other device state
> methods. Although device/memory DVFS is trickier since the ACPI
> specification lacks standard methods for it today, the commit message
> implies these components are largely unused on ACPI systems.

I think this goes back to the disconnect from the patch thread and
earlier in this discussion: the intent was very much to encapsulate all
the power management within standard ACPI methods, and that's working
fine, hence why clocks, resets and power domains are not getting exposed
on ACPI systems.

However, there's no equivalent in ACPI to expose these MBWT knobs, hence
the need to expose this through BPMP directly.

Thierry

--z7tak3mo2ipp6x3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrshTAACgkQ3SOs138+
s6F/FA/+ObQrZtsqOmcyTIJjG1fJSEbJOLpkQwiKNY62NJ38g6XFAQhHDquZK7fU
Q8zZA0rub/mrtVypRyvKH4aVCdFSRd1g6aCSbTa7P46GPlk+aqwqWiZTLFVQOMXN
+/aHuJvK7hh98Bz0FJl6uElcDjGG9+DkSThb7wMiqnqXCT/+Nn6FlqDpAMmobiby
MrY+FwU4LI4LApngp1EhEmA79HuuoRfPZwPgOXvcuT4W8Mp/fX2ObKHcbrjUWh/F
KQRcI+/6yemzKGUUn77IDoSm3BcYoFpMSoT17pToEjGnLMw8OIIJgetGCwY1Vo0O
luXnMzylpJ5Dv9b5PtOhayc3RMjXXNGVpjeiZYTmkCXpd6gpNbYJL3h1hoRoEWad
t0ETWzP7TAdkVocXmZwo65U7vI6E+1DgXgE6FDTJUaCPQpvNcAlwWlUFF3X2Mh0L
dMLkX8ywPdGb0z3/J70LVwwn2F0lbKfbYTRkHTi829x3iJXbQ1MK2llCCm58gBwz
7MjwrYHFZmiCGWFqjYAADDmAaYR11PMRlSkJjWdaURIgtyugFSuE4MzFY7RoIdNd
jtbxlWsiaM8FKd79mBUA6uCSWLb2VTbpJc6mkA7notTGmApThOfPi8r9sn4W2Drj
X5ZBqtAzUt/qlKjMrQ08k3zYg+4QMddSGiwTk47KF6qoZNJ/YLk=
=QkJC
-----END PGP SIGNATURE-----

--z7tak3mo2ipp6x3b--

