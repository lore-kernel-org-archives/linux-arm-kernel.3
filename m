Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F2FD29C5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 19:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSkN2v4jXjj+0Ms83+xyH85wKEYXHJ9b5ea+Dvfcjt8=; b=26dKY4NB1gLVQYbmrqT9jDSDXI
	WAt78zKW7D1TQBCbTe//HW1fvHxqFI8SqS7L5v/8ivPUUL5WAFuUT5biLYNTCuqP3IBgaiZ+/skOF
	7S9pbLK+cCYml+/RyCntsWWVwqO7m+dqV0XraKMPfNJfZnhPE6UyjVwMl+qIVUBKFH6tNNTmw6F+V
	BQKB6WK/4+Td757mzkURyHJ88ndOwRp52s9DsLZZeMtEHAgFBaaXBwb7Os2q4a5BwC1H0tGvxnZQl
	/Y/erQL9MeDaCr5cuy7nXIytg8ZhyIbGl8B48hVStJ6fhtuSEU0PFbFn0y3qKOjzDRat3seYsh3aE
	WI6UQcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuVV-00000002kW7-1a3n;
	Mon, 19 Jan 2026 19:01:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuVU-00000002kVs-1rAv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 19:01:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8786A60135;
	Mon, 19 Jan 2026 19:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326CCC116C6;
	Mon, 19 Jan 2026 19:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768849303;
	bh=tKjeh8msjClsQYtO0ds3L7yaxHdHnzKWgNBka2GGlpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDM9zGN6ef387sGofUwWTbNxfAljGcEMhxVcuOi9BV8Ee7FvL0Ji4Q3d54EDVytbJ
	 0wt0ipJf4U73Nj7aJdTKl5/k7ZjWwm+wAEuxoZirUpBAYEvJzKHe7HOU5kh87ITVqJ
	 yhh2QNEgWAOB3Xkicm8VV/Uswl7OovCgy5O6PNYqXtgw2gR2U803+0xN29BHLjIduF
	 8Hpg3+JM5lOjlpdmrqq5ZmEqYSziCKh6/nDVMKKbeKUO7nvuldK3H55OOxQXmwrhjN
	 awuXmXS2y9hfxrSAd3cIIOyMBrjMIQFJnL/u9u8sqMRK3cgH19b6ELxgJbfcJFnyZ8
	 zkkRBhF29DYcA==
Date: Mon, 19 Jan 2026 19:01:38 +0000
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
Message-ID: <b03307f7-93f6-4680-9241-cf28b5456fd0@sirena.org.uk>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
 <20260119-spi-xilinx-v3-3-4566c33bac0d@nexthop.ai>
 <8436e914-429f-40b9-8e6f-ec3b02702cad@sirena.org.uk>
 <69F83558-4675-4FC2-8656-BC6E3481AD65@nexthop.ai>
 <9e559e33-4f2f-40d4-a15f-584548bd6057@sirena.org.uk>
 <05D2CC15-DD6B-40F0-BFF0-3264D4FF96ED@nexthop.ai>
 <b1b79de0-a078-486d-b3e9-96899354407c@sirena.org.uk>
 <3D1B59A7-6E57-4C8C-AA95-EA7AA115264F@nexthop.ai>
 <b9ad8ab8-7985-4c89-a82b-c7f31d32c167@sirena.org.uk>
 <a6d57890-89c1-445e-836c-d8239d20c621@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KsDaClmaKXt8A/4a"
Content-Disposition: inline
In-Reply-To: <a6d57890-89c1-445e-836c-d8239d20c621@amd.com>
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


--KsDaClmaKXt8A/4a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2026 at 07:52:35PM +0100, Michal Simek wrote:
> On 1/19/26 19:38, Mark Brown wrote:

> > This was specifically targetted at some embedded x86 systems where there
> > was a goal to reuse device tree bindings for things that just can't be
> > expressed well in ACPI.  _DSD is generally considered tasteless for more
> > server style systems, AIUI the general approach preferred by ACPI
> > forward OSs is to use some combination of DMI quirking and registering
> > with a per-device ID (like the per generation fake PCI IDs that Intel
> > uses for all IPs on their SoCs).  Just blindly accepting _DSD can end up
> > with something that's not used because it's not what the ecosystem
> > wants.

> Is it a better way to use auxiliary bus as was recommended by Greg in past
> on drivers/misc/keba/cp500.c review?
> https://lore.kernel.org/linux-i2c/2024060203-impeding-curing-e6cd@gregkh/

The driver there appears to be doing runtime enumeration based on some
EEPROMs on the system and creating platform devices based on what it
finds there so it's a bit of a different thing, the aux bus suggestion
is about what the code that does with the data it got from the EEPROM.
This patch is for something described directly by firmware so there's no
way we'd create an aux device, that's purely in kernel.

I have no idea what the hardware this series targets is (other than that
it's using a FPGA) or if there's even a motivation for the change other
than code inspection.

--KsDaClmaKXt8A/4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluf5EACgkQJNaLcl1U
h9Dy0gf+OS2LP3VmrR5J7irzVl+DrTdrNVc/qZ+Xm5xSwwFK2D6u7RRJhQ8xgcAx
iHEP+TS/bw3H8HEQWFn9Y9GirDBLpvXxr0Rg5srdFx53048pCof1x0CzDwRekz+Q
vmLgOARyRJci5gZbBiDnwATkqJeIbknBZT4NQFSAE+Ur8calXl0IxeiJOx8K/XWk
/JFMCs1/0Yh/3ztvEEslbriwoaJoK8z69qeAE+hK2dofOv8x9P4POTbGUPTRDWlz
pixLn8kL6gA9+8q5cEziBYo77DkFaSRApdFYCD2iEVnyfzrr99p4/uY4gFTt5wKA
vvpUUoRUVUA0PotpMy4bcOwk11EWZg==
=EJtx
-----END PGP SIGNATURE-----

--KsDaClmaKXt8A/4a--

