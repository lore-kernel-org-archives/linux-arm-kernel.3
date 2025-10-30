Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9D2CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=el8+pV2vAMXiyqDVlG1nQSsbguxe1rAmCs7T0g0V8JM=; b=dcfqfpB5RVMh4T7DlhlVvBA6IA
	B1fZwlW1UD3TqH6X1gtrL61EUDruLcSukkGrcuRmnQbgidMc5K6mpjDsiHtGxmuQfXo5ZVmCPSxZ2
	04uj3MZiqhhK4zXF+XreTn5WhYJ7mn3YkPzhJPIxY9FwhXl9x5V8ROTKsiKJc76f1ByFfAjdu4PH3
	MQxIhXr//8BQv6ugTalxQnPselISxapZQcigeuvIooAl2TX+XN8sSVpyxBesJmmXdbt5NtHzh/4bo
	DtZqFqIbxOrSlEXMpfChnOUOgE8m6VAm4+EaT288EzFqL5tLe8/AbANtNvSUAwTOyJTypePnZPkEi
	Ii4h8YyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYHV-00000004fty-3KyH;
	Thu, 30 Oct 2025 19:25:58 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYHT-00000004ftY-3pMR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:25:57 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so1445700f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 12:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761852354; x=1762457154; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=el8+pV2vAMXiyqDVlG1nQSsbguxe1rAmCs7T0g0V8JM=;
        b=I9CiUAS70e/aIS5Ns67EepKjczcgWwWm2Pnl9H1POP8gPQUTS4pxgsGmvO1FVu5rxu
         LOVsOPniEkw4ExP89M5GKZrJ8FOJnk93Yu4nlnDklek2vz2FWSWCOPv0adP9DllgDWrv
         D3ArqTQafoU7TF+MWgXnA4XlYXr6uG0WxHf/Q63lFVS3xvtOmdZH8SeTWcnUw/3mb9Q3
         YPsMSotN1iRZ25zHSvQd6XMP7qyH8itPAiXgcAOinHO0tyOHliOO+/pChqasB+zUxptn
         zolmRg+T0o0qv9JSeWN4iQCo9YQca/S22HChEsMUUM5kH13NgJxO0jHhxAlZDaqggCa+
         BKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761852354; x=1762457154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=el8+pV2vAMXiyqDVlG1nQSsbguxe1rAmCs7T0g0V8JM=;
        b=pk7S5YuBE0vq6CjCUtwtZXhoawcI5oq/X82TMnJesqgYmn6g1lQD42ILZXJVCnDG3c
         sBVMEK62sEGG5GwjgNiSigwTmiJ7c0jGItHNOHkHKhM7cmHrmvbKkKBbwMVsavLtK9Ax
         rLkmb6RyuGZD2xur6S0P0bx2IIZedQ6BEra1VpWNaMZpRWpqKFYcfCeG+FrESN5Dgp8+
         cxMLZkVX11DzWMfAgPzbOjFq+lqU+Hkn5MxTsM07Ib+tHLUiQECYnTlF3xEn1i3/hh/I
         xl1TPkKXR2klYlRXd4P+YSKw1UJ25wLY/WaytZA3D6DH00mhya+NB1kvnYDh7qjv/D4Q
         /VrA==
X-Forwarded-Encrypted: i=1; AJvYcCX3GtsWsVDNaBQb1aW2bcSpAn4oxo8ylVG02kTwd3YvQ+xRNzNDzPEtO8sdkCNT/fEo4iTuBCcRLogSSf1Tn8wM@lists.infradead.org
X-Gm-Message-State: AOJu0YwDP2POjNqYj8a/qQY9jhxQoaUvHS/MhqWwnpVqorwRJREq/byA
	7laVIJW1IA0dt9yKzxVqqHxfDP8lIdR0q9qcf2PZS5X7fIyZ3+hVoYWU
X-Gm-Gg: ASbGncsbale1PQiVoa96Z//XBJQ12na3XXfffmqtIhKCYRM3GIwMAeQKF9T3jTI4k9B
	3euIJBJyFFE7xIddCC9S8x4e5kZvjET80rwFDFjHts4ZAvNqTT8c4YEW7h490fxqNzH3oBsqw3p
	DI/mCCkWCtlEsSpXdIlmdmMSkBPy95PimFMln0L2zBTZeonswg6lhiadASwsTkPaG/pcdA0TW+B
	8ZLoXspa/3inRLW9CC7ArGrEpf8Vwr5NNRRRy2JMLPpsH7GnybYZbWRqguyjQIsdhxbbBhxlaWo
	v+fYQrcHkHYbsVUI4zypFqGgOrbW3MV9Z58IFQOVp6WJDM2wnVp4/DsHRd6xLvRe1f3qPnWNyna
	L0VZOFiUgbxuPZnvX61/hAOArInMiNgAEhvPe5iTGQck0cg2N8OS8M4E6Vpo/bFP5yxdQZ17/Ay
	4kLs3JHz3rDHQFajbVfjWjiX/LNe8WGJJHklxZycyESJP+pArbqDDfoACUwbzvHyw=
X-Google-Smtp-Source: AGHT+IE3xIDwnt8NO9gbUQB3KijPHDP05Rq680UcAG4/m3XHIlHkUMPbeqsLE7Kwcs0Zor4mVUhuHg==
X-Received: by 2002:a5d:5d0d:0:b0:426:dbef:9abf with SMTP id ffacd0b85a97d-429bd6837f5mr659933f8f.23.1761852353820;
        Thu, 30 Oct 2025 12:25:53 -0700 (PDT)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952da645sm32324401f8f.30.2025.10.30.12.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 12:25:52 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:25:50 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: "Sheetal ." <sheetal@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH V2 1/4] dt-bindings: dma: Update ADMA bindings for
 tegra264
Message-ID: <5emjmww2vawtquweilm2ajmv7ux6ljwkyz26cqnwhe566vtxqj@hjo77tk567pn>
References: <20250929105930.1767294-1-sheetal@nvidia.com>
 <20250929105930.1767294-2-sheetal@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j3nwz6pkhho24mer"
Content-Disposition: inline
In-Reply-To: <20250929105930.1767294-2-sheetal@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_122555_965895_8CE9935C 
X-CRM114-Status: GOOD (  16.34  )
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


--j3nwz6pkhho24mer
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2 1/4] dt-bindings: dma: Update ADMA bindings for
 tegra264
MIME-Version: 1.0

On Mon, Sep 29, 2025 at 04:29:27PM +0530, Sheetal . wrote:
> From: sheetal <sheetal@nvidia.com>
>=20
> - Update ADMA device tree bindings for tegra264 to support up to 64
>   interrupt channels by setting 'interrupts' property maxItems to 64.
> - Also, update the 'allOf' conditional schema to ensure correct maxItems
>   for 'interrupts' based on compatible string, including tegra210 (22)
>   and tegra186 (32) ADMA controllers.
>=20
> Signed-off-by: sheetal <sheetal@nvidia.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/dma/nvidia,tegra210-adma.yaml        | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Hi Vinod,

can you pick this patch up into your tree, or should I take it through
the Tegra tree?

In the former case:

Acked-by: Thierry Reding <treding@nvidia.com>

Thanks,
Thierry

--j3nwz6pkhho24mer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkDu74ACgkQ3SOs138+
s6EpLQ//X9VzCgAX/G/3K6C197+MTv9SDzEHBXtQd/vVJndgAvMhrwWBalp7uAuJ
yGv9CD3ib85ccgvBX12oY9x9kR8fcU2Ueyq/q3inTXcJ0eQIXwwzodA179kEPb0D
gID1Gh4GQO8w6dMoa4kXETQfaiPFiLcNqY5/ZzhP142ewpo8uMDWDh1jF9+E3+08
Q5qK2CvBeX/NnD8MTfLHiLr9LUAuRsqP/HD0Ff3VemEcawCTC8oqfhcc3aSR9zIx
hlPBSGnWWw1CFXt0sQk+cD6qMSVotTkzFcGTKpUQP3/wQ1mytl9VKlUzZhOn+fSS
1Q4UI0ebUL2qIZavXxiN4K6FreupBZNnmmJ88bR0Gfbc+oDObPN2dOZK8BQ0dFHr
6qKfuK74GFqY/d+T5/ewa4WapaTPo0l+liTIPVmxWrXq+wtTBS3OsCLZAno72rLq
3DJRV9jywdNrQEE19jG1N4M8Q5GilE0JJ1IJheZ8IpXp063YKSGT04gUG6kidBdp
z5dfoumLJk+NtpjOhTelg86Fs5yEYeHiQHv74+WX53w/Ic4ipKESb5oGwDs98jZQ
iy6+e6oB/rigSK50jJTiLy0UMl/kJs5eWbhZavwTRmcdGPYUL6jHqnim8PChbL69
UwdsFcEqki8rikgxb4B+EHQhzKLL6dWL19CG5KPlfF3eNzgZLfE=
=bQb4
-----END PGP SIGNATURE-----

--j3nwz6pkhho24mer--

