Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC651D47CDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 12:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZCf9q4Eq3f7Zk60HL0G320nGRoPqD1TASM4Kn6lCNs=; b=Yp2TvH84kl5EqKYBNENtZxU+8f
	nlOs7oPipwFGi+fVNvFC6uEdI07TNb2apsI2b8h0SuwYXGq69GTytVjCaBPhMQTO/xv2t/TtUHLhI
	3EmsV0JGn4XpTNqhhPhI8LfArTVH0HKvR82OH6GqO4SWM3OUOqPjR+28CGjEe5IKBZMOt1TqjUIy9
	9ADJ/HHYfDNJZ43JyzQRyl8awtO84X7kRKoIgUW5u/nTeZTd+O125P9AIVmd8j2aaKuWN0obUxZlt
	bHg2x6AZ+pKFwrrSD3es1W5eFDUHHBulD5GP5sH+mGcDqg4/EWkl/OKMtUsRz/BGeamUs5X4RoiEY
	iV9boBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjBS-0000000E7Xt-2AB6;
	Fri, 16 Jan 2026 12:44:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjBP-0000000E7XL-3H7o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 12:44:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso2877925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 04:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768567445; x=1769172245; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZCf9q4Eq3f7Zk60HL0G320nGRoPqD1TASM4Kn6lCNs=;
        b=YCDeinvPT6Q9/sBS4ytwWw3KXwHmM34QSkPKJPz86zlAbmtzVv7C6EdXCFurB3Fn9D
         j8kyDN7pXbOZrvTJm8yk0MGW4AAX0isIMCy6hJHvQmvhyquCpWJiNUmhMKGfHXRnu6Ss
         1x56rNzh+kETe2+MTRFwtxNAxKM+L9eADz9WQqrQb/HI+aVzWGieDK3ifo9kBjNpdfZ7
         CWCfJrkuAZzGbmlpLlAm5uR5kQG4QwjgKeztYpvz6oWZzHLV0EqVtdsnz+KbdQGb74CM
         Xc08V85LSQ0UX+NpDBxg6IF9Ew44ujZP6GsCPTZAnFOZ4K+sf612kK8ZFrhtUPMCEM32
         Abeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768567445; x=1769172245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZCf9q4Eq3f7Zk60HL0G320nGRoPqD1TASM4Kn6lCNs=;
        b=iS5cqh8Iki8Tq9z5KdxYqlv4W99cxHzYUbNuipHsdca6hKg3V6zjCC+2sxa/aCWbWN
         4JZmnsAWauGgYYFwexDXmZB4sJJ8sfNT//3r99GY+7ptjvio9fZJAcpu/OFX+cXJqhmd
         TNUHJRlw/KICmCcmortC+PitBXGhSqA3kBD0wsLW8MXXM8Tvk6Ri4GzycLDZErukJelr
         jFMyrz3x1moGytikrwAAZpLejRE2Zq+6eC9ARHTazu5HXDLvx/7VNJDQbB5a1af45HbZ
         RF1peac2ceXPFIm3eYNJW6/pK95xqkH7igTsboIZXTUcPi/KcddfG1rDJqCF6jKqonBr
         zWYA==
X-Forwarded-Encrypted: i=1; AJvYcCXzSznPiotXFX33gnJ/6slk/VoWef0+7r/1v1GDyUSOdIkSVRcJBps9GpWhiuRfrLgKD6DsAsc6n5p4g7j3PpMh@lists.infradead.org
X-Gm-Message-State: AOJu0YypcF8yhxqC10inMvF4DPl6uOWKhzxJZEwwTWnBIqbUI2WeAV4b
	k8QSm7mq0+LCweGjU+Qt7Iy5nUuZiJ/1OiEPDFi62un7SXn/qYHlPQQZ
X-Gm-Gg: AY/fxX7ONVC+TDe32XS/gi2Z2eKaU5MlXwkZIv4c8NFeeACfnKtDrLGVBCLaUuaJdPh
	yEBwC4gnvi79qkLlqMAR6/bwB926UCzGJ2S9USMDbtReZMiQo28OVMlplTTQIettxKxCWrheb30
	3u9EyFAnI9bnqH4RCTY1YikgVG7M0Mo9tckp4+zngJTQ2NWkpFWLDiE6DoJ0LxE5lkhR2ds2rLy
	luPZa5yVZxN69c1P1yQQK2GTmOB+MdZBRnh6gAsAWd35H6wIwCUWVFopLcC3Mxnk3cEKaBEiOSL
	SanB5wT/aJJWJjnHAETvEF+R6nGNyjSYfQyWqj6PU8aQpVJxrHYX9TQFqLyL1yj2zWd16mO+3ss
	3igi7oczUFCZfdzxR2HgAGd2yUp1m8jzpIZlz7TE5rfp8trpcfJvXHV/5nAs9Wn2ofCuiReOMjc
	HbM7CdQR0w1fbfrl/LwR/ekozq99mEEBV0OVLViuabtxaOh2uiZ1AnylUbSe1SM3zBovTbObBHu
	Q==
X-Received: by 2002:a05:600c:8b56:b0:477:79f8:daa8 with SMTP id 5b1f17b1804b1-4801e34307emr39892975e9.17.1768567445526;
        Fri, 16 Jan 2026 04:44:05 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e886834sm42518255e9.7.2026.01.16.04.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:44:04 -0800 (PST)
Date: Fri, 16 Jan 2026 13:44:02 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nicolinc@nvidia.com, 
	jonathanh@nvidia.com, vdumpa@nvidia.com, jgg@ziepe.ca, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH V8 3/4] dt-bindings: iommu: Add NVIDIA Tegra CMDQV support
Message-ID: <aWoyh0e2ncSsNW9y@orome>
References: <20260113054935.1945785-1-amhetre@nvidia.com>
 <20260113054935.1945785-4-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uf7gopu5xawojzkn"
Content-Disposition: inline
In-Reply-To: <20260113054935.1945785-4-amhetre@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_044407_836023_A21AC216 
X-CRM114-Status: GOOD (  16.30  )
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


--uf7gopu5xawojzkn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V8 3/4] dt-bindings: iommu: Add NVIDIA Tegra CMDQV support
MIME-Version: 1.0

On Tue, Jan 13, 2026 at 05:49:34AM +0000, Ashish Mhetre wrote:
> The Command Queue Virtualization (CMDQV) hardware is part of the
> SMMUv3 implementation on NVIDIA Tegra SoCs. It assists in
> virtualizing the command queue for the SMMU.
>=20
> Add a new device tree binding document for nvidia,tegra264-cmdqv.
>=20
> Also update the arm,smmu-v3 binding to include an optional nvidia,cmdqv
> property. This property is a phandle to the CMDQV device node, allowing
> the SMMU driver to associate with its corresponding CMDQV instance.
> Restrict this property usage to Nvidia Tegra264 only.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  .../bindings/iommu/arm,smmu-v3.yaml           | 27 +++++++++++-
>  .../bindings/iommu/nvidia,tegra264-cmdqv.yaml | 42 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/iommu/nvidia,tegra2=
64-cmdqv.yaml

Applied, thanks.

Thierry

--uf7gopu5xawojzkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlqMpIACgkQ3SOs138+
s6F4CRAAs/LaZnTRigpuhM/Lhm5MOiVhksuu5bLPcQ++2uSJQtflBIADQkopKC3r
xfOY31m01LUKx75CeQGi7ekB6+wgtvMbIpX1Hr1caTIH3MLxrkgOumZJHKyclrYZ
vl3Ztc2CdmzUwSOXvNxtH/HwIzTXPOfMme+eBDZjT2iV2BxNMJc2KPuFI0HruduH
B/QqVO8FLcmIvPGqtneO8oaXtF/xrxiUojjxPdJmVNxUvdl/EIDf+VvQcEnhR+P0
YYFgMfEk493Vhi/XMhXAg9zKwm+1yhoC7vXdklGW8IMezknR79HxrzjXx/Z9DUK6
YFhItt0501jfhq+dqNWl7NaYDQtm/b2GxXHQ//cN2N+jEUSJDxbEec8YRPFJVlTL
+dlwu3GYvSatPHYP9tRzGuq13EK8EXtH9y5XYxl7+K314jo1kfv1YE/Acjva2hwu
kycXUDVl3ryPFeJuZX41H5jDGtbkh+cWdfm2hDdhwR93xBl4gMfQ96krMNwmfCJn
g1aIIQJDGg91F+17Bc4TkCIEscdp9026BmBJ8XzismHOM/uFw0hB+K4+dAX1TpvL
7uNCBSgP8MoXEN1i0tCaSq8N9zXvzp59DoCM99F8tpg8JLHR/oD3nYfqNS7rNwQn
JI9Gam81/Bg1MWrwgwqtKlN+oi3k0OvZfFyIEzEyavI45jDBk4k=
=ntP8
-----END PGP SIGNATURE-----

--uf7gopu5xawojzkn--

