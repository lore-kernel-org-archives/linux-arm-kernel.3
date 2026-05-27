Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C483ACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bslgN8YyByc2uPPwR9aK15Zw85YMgKncjFfuOQiZI0=; b=l4zdxAdEZ6adKYf+m8n+1QufVf
	9r8JkVmBbMBtt5RbPE8vhbIB5jfACRZDqSgN86K8pS357b5B5NKVySkYbHxZhSlZv0l4PdEBTsbkh
	PtdkiQeRkA2iv2IhTdSPlUi0tdMSfqs6uQw54ZeAs/EARNzff0MzmVKjaiAbNd0AsDhFb3G8M6qrv
	tctjTtvhSueZC4ToU6fxgsLZfCwBdIkWswG01PVhCnCamx9P642tk/siZBOQuPCmTqfY5OfngAlcQ
	seAKv9ewMjacrc3O6qwXpUql49zZCeFg8EjeXXTb1fGR41N/L/ZtWTYYn3TOJeFCD/ErBQzzhcEKI
	a4wM3tFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9Nz-00000003WeR-1RL4;
	Wed, 27 May 2026 08:13:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS9Nw-00000003WcL-4Aqc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 08:13:06 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso38119165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 01:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779869583; x=1780474383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4bslgN8YyByc2uPPwR9aK15Zw85YMgKncjFfuOQiZI0=;
        b=Xue6G2ccUTJ/xFEHzwQ6iHIai8acZnvv2g4gJ1cWngF1XgBMrxADph5eRfCxFnCzE+
         bG1r08H8vtL4393hxct3/kgsVf6EBr7Ak7S/8dNJthXkPlI/nAK8QsURRFNatgyRJuOn
         oxQWYRQ/TVwcluuPwlPMdc5bCvfpHvHAIM4lq1d/RdU189eCZQq3AuWrHFMET+yW3PkE
         KkIvrhjx/I+g/TKgQpfbP1XI18T/httZphKgvSSSOtJyvMaXNU6z5P33MJ7SRo0Ngq5c
         hfO9i0S96VUOwt2jHIr0m4qYbRCG9OpkMvOxh4eq4rOQGbOmPD9vNCyD7Ueph38vi933
         WX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779869583; x=1780474383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bslgN8YyByc2uPPwR9aK15Zw85YMgKncjFfuOQiZI0=;
        b=Qu1HxSb4PG3MDDbef2HPBBJqtG3+3gCyCzmCX/uLNiKemVu265a0J+3+4LeKGUTUs8
         UDqImt2fit8/5+zXoHFaW1ssydGeDREhfM68LmgIMxlPp1jxmBSGB8gWuQY3BeoYVc1G
         jREcnROCZ0fMUmEYl1hKNymYbSrLkQ67cEOhREDpqWXfPeEyiBI6pWPyE+Wu4IDnvZbh
         tIgSYSRdC3rteriYm+aDSc8OuxXngqx6dD/oNN9cnn52ya5nuZaswKOs3rIPgp9HkDio
         xxol9F46+SF3IS34VxEnBfMKB7Vmgdr5nKIbvAsDOlCihiaW9o+t2uqt54TSCap25rFz
         hI2w==
X-Forwarded-Encrypted: i=1; AFNElJ/VFDn+5T2i/1f1GggenOYZO/XMjKrsE607lxKu172Yk9KXj5NA5YMnVHmx5usT0S7P9u9e8P78CS3jHy1hUDoO@lists.infradead.org
X-Gm-Message-State: AOJu0YyVQxa/w89rBVOqvnL0fpKYHMhdlOgpps+VBL7vUf8mnOvT/KGV
	iIvlwZ5520Mv9GzWuPN0SUEbjam7EI415jBp4WiH+Py1RlRu3d9I6vji
X-Gm-Gg: Acq92OGSe8QCDNE8kjnKg0NICshQS2jEz+qh1Y+rTnjkWOAZyopW0dpOrWztyxo0/a/
	QJKjEBLWVaP2+VuxeYdS2zA+7oVbU3sAnuD5VZn6KOA6SMsRBtr2mlxQlFlLmOwoRVOUbFOy1s+
	iUXsLelJk2Hn/JlWIS9cmdwvNCvLqWOpDjCeJTAaQ7OWjQjyu3+VHqoCKYCsG+3Luofnnk0zHhO
	jvO3MiXX2YpvJpvRA46YdY3EfwjytRLDyUnHWEr99QKSgAFXWKvTPGyw+uPOGaxtw8Hvd4qTEyN
	p7oH3G1q9oZLbPxTEYACkWPAqnjdQR0YL6qPiOqE+f86clxYmSYGrdE047AlCm9gYHQC+V+pa9X
	RAJHzJhwSV51h3WMKBWFdlj2ExIYo7z7oyYFnaDZ1J1n2zOmrTaqPzaEK0fXg6NHEHpr2/j4vnN
	aBO3EUqFbHDl6QngP57TIvPHy3NZztvxG/I4PhC/dB1ucx+/ucd0MdhjJun+BNIvUsGZHbUuPIu
	woasTKElYlMdyWa0Qwjy0Fq
X-Received: by 2002:a05:600c:3581:b0:490:482c:4391 with SMTP id 5b1f17b1804b1-490482c4586mr387652955e9.23.1779869582774;
        Wed, 27 May 2026 01:13:02 -0700 (PDT)
Received: from orome (p200300e41f1bda00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:da00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49059fb42dasm270978095e9.7.2026.05.27.01.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:13:00 -0700 (PDT)
Date: Wed, 27 May 2026 10:12:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>, 
	Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: Re: [PATCH v5 3/4] PCI: tegra: Add Tegra264 support
Message-ID: <ahanW-6XndunYC-S@orome>
References: <20260526-tegra264-pcie-v5-0-84a813b979d7@nvidia.com>
 <20260526-tegra264-pcie-v5-3-84a813b979d7@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j4qm33uwbiswsuek"
Content-Disposition: inline
In-Reply-To: <20260526-tegra264-pcie-v5-3-84a813b979d7@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_011305_063790_484601DF 
X-CRM114-Status: GOOD (  24.47  )
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


--j4qm33uwbiswsuek
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/4] PCI: tegra: Add Tegra264 support
MIME-Version: 1.0

On Tue, May 26, 2026 at 10:53:12AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Add a driver for the PCIe controller found on NVIDIA Tegra264 SoCs. The
> driver is very small, with its main purpose being to set up the address
> translation registers and then creating a standard PCI host using ECAM.
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - make PCIE_TEGRA264 symbol tristate
> - drop dependency on PCI_MSI
> - reorganize tegra264_pcie struct
> - use standard wake-gpios property
> - rename tegra264_pcie_bpmp_set_rp_state() to tegra264_pcie_power_off()
> - use dev_err() instead of dev_info() for some error messages
> - add clarifying comment as to why bandwidth requests aren't fatal
> - address some compiler warnings on 32-bit physical address platforms
> - drop needless comments
> - explicitly deinitialize controller on suspend
> - use devm_pm_runtime_active_enabled()
> - rename "free" label to "free_ecam"
> - use dev_err_probe() in more places
> - reselect default pin state during resume, not probe
> - return early on absence of wake GPIO
> - simplify BW value calculation
>=20
> Changes in v2:
> - specify generations applicable for PCI_TEGRA driver to avoid confusion
> - drop SPDX-FileCopyrightText tag
> - rename link_state to link_up to clarify meaning
> - replace memset() by an empty initializer
> - sanity-check only enable BAR regions
> - bring PCI link out of reset in case firmware didn't
> - use common wait times instead of defining our own
> - use core helpers to parse and print PCI link speed
> - fix multi-line comment
> - use dev_err_probe() more ubiquitously
> - fix probe sequence and error cleanup
> - use DEFINE_NOIRQ_DEV_PM_OPS() to avoid warnings for !PM_SUSPEND
> - reuse more standard registers and remove unused register definitions
> - use %pe and ERR_PTR() to print symbolic errors
> - add signed-off-by from Manikanta as the original author
> - add myself as author after significantly modifying the driver
> ---
>  drivers/pci/controller/Kconfig         |   9 +-
>  drivers/pci/controller/Makefile        |   1 +
>  drivers/pci/controller/pcie-tegra264.c | 544 +++++++++++++++++++++++++++=
++++++
>  3 files changed, 553 insertions(+), 1 deletion(-)

Ignore this one. I messed up and fixups for this ended up in an
unrelated patch. I'll send an updated version shortly.

Sorry for the noise,
Thierry

--j4qm33uwbiswsuek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoWp4cACgkQ3SOs138+
s6HJ9BAAp5sb8ml3mtyJAtl6FMSPiAYlmRM+Rln/kTddrHpNfNe7Ps7RkRrnzhIK
GxGgDwX+8fkfF7jdWfdo+we+uYdJY+5qdblwFtd0Am1Ek2lo+CVv4LIWpoIGWVx7
qCM5CGjH+B+5mq+a5qZO3Jkp0ItV3qPR9ICa7dBZR0Hf+d+tmmtCG0L9frIi+red
D4jhLX7ZSwJwY0HkqMNWPJsk3BjRBiwinut+CRpdpbH5WKDHUs//knQjikdMpCyt
js2IfnMuMUG/MMmnE/L/4Mw/cN+mVqeOVnLCZ2jhqcW4PD870E5mDWcbQGJTtBOa
aYM+jYUzyRF6FRUDa+8LDMFT4kLJSCG8UsTNkYZuM2BTpcpcobb9SHELVsHzBMca
iboEKEW2ivHSL0SrzWwiwfo3mUjVEs+2zicFCjFomzlieY2/nEKJDxX0qz7vl2YI
pggUPMtCQt+HWjJBm4qPp7E7gHbEl42K6WwgMLjpaaqFj9dyscZkgvYP1fxWubEa
9Gomsf9BYzPf+PEQQ1V5TC9pIAkBI67+aB9xP+eZe2CPlHjC+7cI191jmjTYiAGJ
VP0QGnFjXm0mBowPZ8bEW9gIAtUNIMaeUyxbXbk1AtmSIPE1BytX9+MZqW3LZB1g
+D2Ukq9lvn/GNQVDr0ZsH+G1hGubr+5xcP5gy1mCV8S82ocUvrk=
=a2y4
-----END PGP SIGNATURE-----

--j4qm33uwbiswsuek--

