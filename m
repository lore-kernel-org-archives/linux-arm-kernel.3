Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03A5C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSLLPyUJ3eeG6sl2A0x/JpnZ4BR24iB3b7G+EsJS7gA=; b=RcxX6d7dDc2pgxI9CFoxqb2xEE
	EBcdl60nKM1gXZi2vBA7gQWptweuGzTBNcSIMi7Xq7uj0iuNUTXDv1ym6FkcIDdDc6j1SYSli05J3
	hM8M7K8+2pIB/jy9AUTx4tqLL5TLJsRCPAByBQ8cOO8/UhmvbV5qgb7c+5V+HYVCm+HipO0PQec4n
	UNEv7m8N3bZhrU4Rz7P2N01lqhPkNP8bn0CK7VPQJYzaCMWnRBuShwSVkbCXL/iqgOzmFveJb/gb9
	VQBIOC+HNnCtkc5PPu0zX+z+ScHkCnqSNjtaWOYFRyAgcvmX/kRIZ82MWOL0dh2Xs2fm3Qdwhu+wz
	rY7i08ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbMD7-0000000F4Bg-0uH6;
	Fri, 24 Jan 2025 16:07:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbMBo-0000000F450-0Qot
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 16:05:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43621d27adeso15549655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 08:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737734746; x=1738339546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FSLLPyUJ3eeG6sl2A0x/JpnZ4BR24iB3b7G+EsJS7gA=;
        b=i3PeaLzn1JqR5BD7cco0T3K91TFzbk6gsnv2/3dIR0NJo2PzsP+4Ih7XOOVpf4AJub
         nRcrX0D9B1OMZqtIsX8ruN3nuBAvPTU5FoQq+wO+AsLj+9PImt/6R1i3FVwqWldCcO9R
         HVJrCtq3mb9qgrTs6KQ1dy82s52jPpxPLF88W+Dxwie5PZl0kZSh+b/qS/d09x8PdItv
         Ku6JqUe5fUGtWzYmk3XVkBsduI8REBVvjyBPaW6+FY/ZQL7HlYdyLtn0Ejn/QsEu4XWu
         p0+qcboeKg/BFrbEuJqyMuGFSoZZwhdixkb+qrBcgxM3jid0zywrmisaJu6eeEJOWpfV
         xucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737734746; x=1738339546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSLLPyUJ3eeG6sl2A0x/JpnZ4BR24iB3b7G+EsJS7gA=;
        b=ViehBrZV3o+/OzRygGhQs9ZRN1BeyXPSHwOZHZz9+WKIGGgGiQO6xEZ1ujaGTzr7xW
         UbpWLlRfCxcru39kmyJJbWT67rupW+Wj5EwOwjWJoW+VesEtUA2UtDZ+2RF4XHbsffVF
         AyjZ9r8DpmvFG7gRimxbgxEYDCePFNuz4pK3DU90aRAlzEGvAHN3fNObfw+XTWLQAe3N
         kJp9fny0/0jtDxxfoZykNqgJIBG+SkHSopBZpm+xF6aSE5VdGPIys4srEkpffUYPYIK9
         6uFJOk/EIde+AQo+6fDfoPsjSReNQQb7Z91ADbQ/KPkBsVsI12Kc8Otk8T3p2Olf8+LR
         pfgw==
X-Forwarded-Encrypted: i=1; AJvYcCVL0WLe6ieY6Z/5EKpN8Si5v4uyUggQDCJ8XQtvZDGP10ol1oLrRI6WRl+U78kT0TWaVWgAMWViJeOcTbfJjOGT@lists.infradead.org
X-Gm-Message-State: AOJu0YxFlAIsPaF399r2l98RH/NbZi8+U/nBbwLV/l+W+yQRiywpNEPG
	vXSDTF+mQOV4VtnzribItGFGKafU0NEZUbC3pzHFskkusGIZ2aqDwggTJr80unU=
X-Gm-Gg: ASbGncsMMhXrEVQRu/SouDgV9c7LLZGWA9yY5TViUN56GdcSzbr8YxibgnrtrXW+PQ/
	WA9UhoACbOGoDRr/G8+WJysJMexa6ASAYTEzEmBqM0h1DZ29vTHNx+vNwzOXtCFs+63nE0LI9DQ
	uAtvmziAtGZI69qz+aOG0nN591J1cU07VXahRNcHAOhTnLPg7u7dv5Qx7xoo9nTk8xZfYQdM1q9
	oQUedmbBjklPo/0y5vbT0C648BIhUw7Q0UAEDomOL9bVh/rZ0AKigdnDkQ+xbHj0ozNRv/9IC32
X-Google-Smtp-Source: AGHT+IHu71iPwryPb6wf6GWCZ7WryeDM57ilIizqC276MrAU2otzGaNMVdxAiRILENjcqzySRoVfkw==
X-Received: by 2002:a05:6000:1fa8:b0:386:32ca:9e22 with SMTP id ffacd0b85a97d-38bf57a9b6cmr32883744f8f.41.1737734745485;
        Fri, 24 Jan 2025 08:05:45 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:3b5a:db2d:b2b7:c8b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a313383sm3121770f8f.36.2025.01.24.08.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 08:05:44 -0800 (PST)
Date: Fri, 24 Jan 2025 17:05:42 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
Message-ID: <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6onensuvvdsjldrm"
Content-Disposition: inline
In-Reply-To: <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_080548_359797_3EEFF83C 
X-CRM114-Status: GOOD (  22.82  )
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


--6onensuvvdsjldrm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
MIME-Version: 1.0

Hi Krzysztof,

On Fri, Jan 24, 2025 at 09:22:54AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Jan 24, 2025 at 09:19:49AM +0100, Krzysztof Kozlowski wrote:
> > On Wed, Jan 22, 2025 at 11:24:33AM +0100, Markus Schneider-Pargmann wro=
te:
> > > Add compatible for ti,am62-ddr-pmctrl to the list. There is a DDR pmc=
trl
> > > register in the wkup-conf register space of am62a and am62p. This
> > > register controls DDR power management.
> > >=20
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> >=20
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> Un-acked, I missed the point that you really speak in commit msg about
> register and you really treat one register is a device. I assumed you
> only need that register from this device, but no. That obviously is not
> what this device is. Device is not a single register among 10000 others.
> IOW, You do not have 10000 devices there.

Do I understand you correctly that the whole register range of the
wkup_conf node as seen in arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
should be considered a single syscon device?

Unfortunately wkup_conf is modeled as a simple-bus with currently 5
subnodes defined of which 4 of them consist of a single register. Most
of them are syscon as well. So I think I can't change the simple-bus
back to syscon.

For the DDR pmctrl, this really only consist of a single register, the
registers surrounding this pmctrl are not related as far as I can tell.

What do you suggest how I can solve this?

Best
Markus
>=20
> So:
>=20
> NAK
>=20
> Best regards,
> Krzysztof
>=20

--6onensuvvdsjldrm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd8KHufh7XoFiu4kEkjLTi1BWuPwUCZ5O6UAAKCRAkjLTi1BWu
P5rfAQDNbL0vazXvwSxT0FMHOxQjKSLWMcLETRZTvmW8q9WHtAEA+84TjER89z3+
zrPMDyZlpDGj1SmA970Mp80fwQsW0wo=
=WI+3
-----END PGP SIGNATURE-----

--6onensuvvdsjldrm--

