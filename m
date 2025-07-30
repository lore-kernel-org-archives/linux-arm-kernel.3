Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE536C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 12:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CNjdPeIjNe/Cr8sVG0T9YvP+Ef20nkwmViNCVeY6D4=; b=Kf2VCIeBFB5cYHGlyhq7PPAcad
	BDZEXE+Cj4gd1k/cdJOP8OX3TnWpW07zSHwhqQ8byEO0pLFD8VvvQncaZtcJbk+VktwGbqmCp5cnV
	z02qu15qcdYGfXo4sTEmzEjFnrKhFkKLWkd8MAfd7aCEMI05YNZfvdE0eTs6+h5BR9gOyjNAquPDN
	ett9ZhVLV60DpEv+K+s/VJO7+QaaDJNUUNIcwVi9X/JfnoJIOc+tevvs69U1AP+v2TakcpjSmKDWR
	38+/pluo415n+UEoV/k1uA9Mhzc49A9BnX2dxMd90F2EMTtCGhSiNgXm0Yom+tczc9TI8qTtWC1jW
	HpBKphSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5m1-00000001RDN-2bxj;
	Wed, 30 Jul 2025 12:19:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4gu-00000001JWT-0Ye3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 11:09:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7408E43EEE;
	Wed, 30 Jul 2025 11:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DD1C4CEE7;
	Wed, 30 Jul 2025 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753873787;
	bh=0CNjdPeIjNe/Cr8sVG0T9YvP+Ef20nkwmViNCVeY6D4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TI+oVnhcSrTOFD+Zrt/5XD+vWnJ9HOWXqNFPqlCoi13+zCBM9llHXlTLfTcVzjFGQ
	 /DJLdWvPNNmWlBO21+l6zZUjf7tGRWZ2SyAUpFgROLtL9rQxQH1smbJu3jCqsE8rTy
	 qpf5ds5uyXJUYpqf/EUEqvSmXVPljL9RLWAd9pC7/5ZDNCgGRuwzNrRssxl4a4LXiU
	 ai4oBDRZY0qwY1FCbv16kR765Dut24uuo++wLa4URS9a4QS89juH7ZK7dBfeJ9brYk
	 pCPGDuS4fFo8gzP17T+bwuhTSd2jMvofxMF5Cl+3brEvGspZCDgm8Kd3mKStousCyj
	 W1uRIc+MLdeSw==
Date: Wed, 30 Jul 2025 12:09:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/10] coresight: Appropriately disable programming
 clocks
Message-ID: <015c39de-001b-4660-bc64-6fd07eff9f18@sirena.org.uk>
References: <20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com>
 <20250724-arm_cs_fix_clock_v4-v5-4-63f648dae021@arm.com>
 <b3782b8f-8c09-4fb8-bec6-186102cc66a8@sirena.org.uk>
 <f9fb2174-5bc5-4c7b-b74b-8542b4f7cbe0@sirena.org.uk>
 <15370a42-8e92-4f57-9ff2-f283d9fd30bd@arm.com>
 <20250730085637.GB143191@e132581.arm.com>
 <caffdde4-fad4-4462-ba92-84416726a12d@arm.com>
 <20250730105432.GC143191@e132581.arm.com>
 <cd250adb-61e7-414f-bf17-6cc960e44f7b@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p4x4+9VUTrJ5jiST"
Content-Disposition: inline
In-Reply-To: <cd250adb-61e7-414f-bf17-6cc960e44f7b@arm.com>
X-Cookie: Linux is obsolete
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_040948_188418_7D8C27F9 
X-CRM114-Status: GOOD (  12.16  )
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


--p4x4+9VUTrJ5jiST
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 30, 2025 at 12:01:25PM +0100, Suzuki K Poulose wrote:

> I would recommend using that and don't force the use of apb_clk/apb
> for AMBA devices. If the firmware doesn't specify a clock, but does
> specify the CoreSight components, it knows it better.

And perhaps more to the point if a currently working system suddenly
starts requiring additional clocks in it's binding that's an ABI break.

--p4x4+9VUTrJ5jiST
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiJ/XUACgkQJNaLcl1U
h9BD8wf+ODcyt3KGHVPbd4ely45VxK+DeMhInki2yIOs1Qg9ZpVeJmClCei6+PXd
RG8cM+o0v/8ut+TGA71E8c7PMiuCX64gfWtwoVRf0rDFSxHcPNTceXGJ4x3wmrhV
wDHdzatndulWuOsHPUceg8HooawvvcI8597foZoSVMYjC3aylvWEiuvajgBvrpA+
SOnaTAVCtD51Ppha5THQ6OUNgLK6W8TY0Q+yhsvn5Sg802StaXKo2XkJKN3Nz7Uj
vhIrlxN4Bg54Vp4XVYe7xhzLHW4GVsKalXWhJNfpe1jgOkbjW6CHdFMs3sQk6YdJ
0dIbSWroraDHYryqKFUSmEZIIhs4zQ==
=7HYz
-----END PGP SIGNATURE-----

--p4x4+9VUTrJ5jiST--

