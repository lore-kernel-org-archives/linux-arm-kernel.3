Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58435D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Mrs2ijgX21f6ksv66mCAQsr3PSgk54buiEGY7STqEI=; b=tUU4i3Lboz0f2W37r46O53aL7b
	EZ1j+31hVQ6N7UJvE6cYBIWsilGxXeOoPlv4caPDOgQtk5kNtff2M/HV7+7uoZTuJBQbTFPkqg5Yc
	0Sz+J10XCdUHoovjjNicn5u9fZx0aAnrtJSMgEZCCo6ymbjs4o69rT+B96ZUvFIjTFIWOKoCRtzFG
	8bTSqzf0AEBizPvo1KeeMWFcIQcJdu+UlDfNONR7grDolm/uVHlM9UuQsz/AxeSWLaTL7tKdSI8Xx
	mssjpUvZPSDzR/RUQeLslEK/81cPZgGFqZBKe0N0q0JoRfjo/HP57yP/FZMhMOn6bZa5qxD2xvITJ
	2xOlQXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4cR-000000043j5-1jzE;
	Mon, 01 Dec 2025 14:11:11 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4cM-000000043iZ-3ozu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 14:11:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso30280265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 06:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764598265; x=1765203065; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Mrs2ijgX21f6ksv66mCAQsr3PSgk54buiEGY7STqEI=;
        b=YkN+me1gRu3xG/rLgSxvsKsD1EzkdfaokTcOIKb0VzXZoHtgMWetsm5AqUV9vo+Ulx
         fT8ixpX0cy0MfxJuiEt6rZH4VYzxyJyYH9gM5tr2/rV5STGPtFEN6NzFjaOs4LqRnaHl
         Vb47o7mvAS7X+taJP7sW27JRGsLQV9I2HkclM6C+/vmu7PAck2lsfqRW7P6SWhf8dTx6
         INnD0pNs8FjRK9OokZiJ50+TQvJODlFSGzGUXvLUOfF/JwuonaZ7rjlAacMwl8XsoXZ2
         nV0NmC4W/Hi0/qabIgQqUCcdcyOsz64jEhSULtbES6Gal1e35X3xkBuwmnX0/WzHNzpd
         Bl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764598265; x=1765203065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Mrs2ijgX21f6ksv66mCAQsr3PSgk54buiEGY7STqEI=;
        b=OfWQxmQkP36IV1Jr84kGJ0Pc0OYeADTgBjnh+LtHLMNL3IW/If4988SnrBVnIcxn8J
         T1YViT1eY59h0iaysJ0joAOSZRQxS9tNU+06C06wzeAzMea+WW+OT/5eayOnzS8gRJHS
         VJsQ/brBfjrOpWXEEJpnoTkelN8myjTlBICrxBo20nz+x06trtW11+BuFovE3QVyw9sx
         Tj3/txE8HEvrs+rf3818bNasmQ49EZqVgaWVhVwxCajQxCYSPJ1C0lXFB7P9F2o5Y00i
         ESjBl8OSKN4UBOV0W1VbvyKYFIxkDzpc4ohR8I0QSQkJRk7vLr4eGJ/O20WHl1MsrgXZ
         ECDg==
X-Forwarded-Encrypted: i=1; AJvYcCXM6V3tHMSeXpFMoXWBdVTzqS+QFGLhy4cXqLXD4pmt1y+Z2qSKGZ5xN6e6ZrQPvgIDnCCu2Eb1UvzJBze1LeLy@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxta+vI4KwN/NAKvT3CUunIx40HFSZ0EkbUl9J5qU5lyTAvahE
	Gbb+KnJxLmBTLwXFywUH75H9Q+ZXIz41dLYbvBupIZ2jcVdB79/Mc0Iv
X-Gm-Gg: ASbGnctaAyRDVMxbd+GAV8mOrGvMz0EiN4Ii0OttMUMNCwK42LuFZtnEXcV1mpiJD+k
	6D4N8tcsz4l1r7P2herMzj4wgNsfaJtJcRFU2W/QKKRihc1g3umwgB7G8Nu+ThG8xU7zSsJepgV
	wtbectGcR/VLpFajDhicKo+06HG9nkVviO1A/iJpSGW3kPoYYo2LWX/sXexzaaKjBbEFqdM+fIL
	cXI7Q0mcj2ANXOX7zF7RqAKvQaBqSaFDwkKiyuLGwc9Dbr5fihZUvajFHh1EtZFBXDSkG4lRgvX
	3bMlSah2qTlkpB6DHmNrqN6L+8rShYOtYdEnRMuIEenROQ49aZ1t6MSyn2aWZDy4HYoXIJTWOpn
	uokHxxFced84e27rQFp7Q2hRF/61SMGZq9SBaZBASSg3P/sAhmxHADtOzdexWI7a3135gbsrPPH
	NgZltAwGpqRHTFOe3VKeDaPtEXZgZKy2/1Y+p5J8rDDEcmit8z0lEp3A2PuU1qyMYcq9dm3iWvL
	Q==
X-Google-Smtp-Source: AGHT+IEE6nJwSv7GJv5Tpq+9BS1wDZGt0pOH46cSqLXpdpti1ytJV7Lap5tpsWVi/xKgs1f9pxSxvw==
X-Received: by 2002:a05:600c:3553:b0:477:7a78:3016 with SMTP id 5b1f17b1804b1-477c0170782mr399239025e9.8.1764598264581;
        Mon, 01 Dec 2025 06:11:04 -0800 (PST)
Received: from orome (p200300e41f07e000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f07:e000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0e21e8sm323578165e9.15.2025.12.01.06.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 06:11:02 -0800 (PST)
Date: Mon, 1 Dec 2025 15:11:00 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, will@kernel.org, 
	robin.murphy@arm.com, joro@8bytes.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolinc@nvidia.com, vdumpa@nvidia.com, jgg@ziepe.ca, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2 3/3] arm64: dts: nvidia: Add nodes for CMDQV
Message-ID: <r2mkiktazyn3nvhirbs2ac7n5ymdw62ueutpxt55cnivdi7pdn@6i4hjtvxp2ph>
References: <20251125071659.3048659-1-amhetre@nvidia.com>
 <20251125071659.3048659-4-amhetre@nvidia.com>
 <dff3a962-82dd-4aac-ae11-69f0e95ba04d@nvidia.com>
 <acae92d8-3394-436c-be8e-8bed7a923e85@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hmgu7kapjngbyggz"
Content-Disposition: inline
In-Reply-To: <acae92d8-3394-436c-be8e-8bed7a923e85@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_061106_975049_8DD26342 
X-CRM114-Status: GOOD (  24.91  )
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


--hmgu7kapjngbyggz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2 3/3] arm64: dts: nvidia: Add nodes for CMDQV
MIME-Version: 1.0

On Mon, Dec 01, 2025 at 03:06:55PM +0530, Ashish Mhetre wrote:
>=20
> On 11/25/2025 3:52 PM, Jon Hunter wrote:
> >=20
> >=20
> > On 25/11/2025 07:16, Ashish Mhetre wrote:
> > > The Command Queue Virtualization (CMDQV) hardware is part of the
> > > SMMUv3 implementation on NVIDIA Tegra SoCs. It assists in
> > > virtualizing the command queue for the SMMU.
> > >=20
> > > Update SMMU compatible strings to use nvidia,tegra264-smmu to enable
> > > CMDQV support. Add device tree nodes for the CMDQV hardware and enable
> > > them on the tegra264-p3834 platform where SMMUs are enabled. Each SMMU
> > > instance is paired with its corresponding CMDQV instance via the
> > > nvidia,cmdqv property.
> > >=20
> > > Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> > > ---
> > > =C2=A0 .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi |=C2=A0 8 +++
> > > =C2=A0 arch/arm64/boot/dts/nvidia/tegra264.dtsi=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 55 +++++++++++++++++--
> > > =C2=A0 2 files changed, 58 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
> > > b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
> > > index 06795c82427a..375d122b92fa 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
> > > @@ -26,5 +26,13 @@ iommu@5000000 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iommu@6000000 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 status =3D "okay";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmdqv@5200000 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
tatus =3D "okay";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >=20
> > This needs to be ordered in the file according to its address.
>=20
> Hi Jon, Thanks for the review.
> cmdqv nodes follow same ordering as its corresponding iommu nodes.
> I have added them immediately after corresponding iommu nodes.

No, you didn't. It seems like you sorted by type and then address. But
we always sort by address first. Type doesn't matter.

This node belongs above the iommu@6000000 node and after iommu@5000000.
The same ordering should be respected in the DTS include.

Thierry

--hmgu7kapjngbyggz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmktofQACgkQ3SOs138+
s6EyLhAAsTEU10nghdoSpblIcVzJ/qhmjr7WspdOv/UxyNC6yGc32tbPTSMeeGKB
ojvenyoNPugSaOyLZXSFTl/kpTKdGcoCkegC04uNDzwhNYdBeqEmWQBcWAA726Br
KavTOQhDpPmV0XdPm1lDVjo9xbNSDasetodfY48k8vfJCf4BEdBCAY3LDzvzdAQ5
m77dDHC0z38Ytkjl5kbQsuZywmE67pYDtsOV4kQ0dZiZXBKWzJVEME92ADY5t2Y1
MuLoASC1ETuEPnpjMJ1lU+1QTUiDN7LlgDiQzRkR/MkBrw+GbaUrwhzh0pNB8xHR
BS9h/RUC8wpaiDulhMEq8ZDPFsjHkH3WlGNv7vC4HspcUhzkzaT8PFSfuzcHYSNr
gddqDlRd9cpPkoqPVT9BLfX8VPeIOSz4vQp8fr5OlM0gNVS71Dlr7qr8DNQo9JbU
hZ0P1D7clUrw5gCGXcEDHLtpesD+jOswALr64iahD1xGKEDcUsZIM+DLgmFjuuU7
sRcKhRF6Y0eroL1Skol2tvZ6iLrTRXToACMtXiR3HGPAtiU4nm04EC8nr1WVbNYL
qjfxz0QXACVToYJPxQVVcjZ+uLMBtBR7rVsd7Q+A/NeBPwctkw3/+foLMmRsP6jw
AuvrP0nzagjXuL/UJEOYw9YYgbg5e58q8OG1mWmjeqKRcU7JmN4=
=78kF
-----END PGP SIGNATURE-----

--hmgu7kapjngbyggz--

