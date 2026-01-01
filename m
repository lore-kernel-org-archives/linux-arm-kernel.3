Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6CDFA3722
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 21:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qGeOIEXCnLq99CGQeQ1eWuZeDA3OumK0NUXsyjIwoc=; b=Wbq8W8Yhj8tKD4fJgaGCX/3oMx
	AuHGMXnLHRMb9zpzkRN7vfmV8GQnOnRtgjNzVbLX+dSFBWJCjDQD3FpVJdL7hITeQUfwZyBoRgjWo
	EoLLbdh7WfeHGoPpgqRWB1iTzUrDIEXi6jZpsSfGAAJYAjfKhwUFRW+uZS0WE3PZSPLY2y8Y7ehAe
	P32BkkZ3LSQE7ZF/IChoxqYmQt93IB1QYhexAwAkSqtpygj/ldLimzvote4mP5ncl86XgpvEAg6ql
	gLYHHo/Tc/SGoLmYyIe55YmPjtw7hQSpAfb+BMjhBhVIyLtUE8dBUF6YFGVn4tuU9YgYcpJsiGI1b
	MBn2Ogmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbQUm-00000007Wp0-28P8;
	Thu, 01 Jan 2026 21:46:12 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbQUj-00000007WoJ-2k6K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 21:46:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a0d0788adaso104835085ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 13:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767303967; x=1767908767; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qGeOIEXCnLq99CGQeQ1eWuZeDA3OumK0NUXsyjIwoc=;
        b=CqRX01XpkwSYfSJU5Lh5vnI3uqhxucR7/05aZbZJq/iLSufZFDikN33ZtierXed2Rz
         uS2jOsDksohgFFmRsYB6BiE4EWsO6Fd6tdolZjkK3fVLpCVQI1oYSfMM3ktOIcmbYbyG
         4by7gQVzq3jsPatrXbJQ2vpbmrYC0om4vagmm+15LtvagUO2PfEyi//aUKXPppUMihMn
         JmMWnATkexh9dsuLeiuDE0i21JFNlS5ewp0sAxcjRbN1oRxT3YO7pUIzm663H4DmrfJj
         vQEMzECXS1UkC/2h1LiLwGxNyouzbgmYY7ymDaDgHMFvejYaflpAx69seyjOINZqLh3v
         XA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767303967; x=1767908767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/qGeOIEXCnLq99CGQeQ1eWuZeDA3OumK0NUXsyjIwoc=;
        b=xAEACTSmkNyu1JnmzHheabTtJsSSUlBtePvckWsYWRK0leX63ljhQE0idbz9O3KyhV
         gYqMl0cfn1e2RAz0cecCjpDYLMWYs0386KAu99KjfP+mVeGSinMS7mtTqIFsn7LL5D1t
         c8Glgc6H0ti3xMkJbvRPwoTFRnPSnXnZBweSuMQFyhTiQ48ic6ARjakoObgg8DDUaPGj
         1/fVuiakDdO6qwmWjTh/YYxiRuLhmuwJ0rDFu1k9NbFO969H6lBOYkJRjgtVNNX5XltO
         RVRBDsAZqzIkzTZ+ClweUHLWw/d0UcSDhEHO5Szd8AXHqZ5X2yrtjUOGZH775YJJHetV
         AsWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZJtNKkN77CAZy/iDRNqzc+pXxvogAECwL3gRe93+eGd8MHuLBpMtNI6TmIAqZzjFtMO0qmZ01zvV1C9PtQCLM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp8NsCruqviqtrQ5Os9gsCEqahTY0xlCf2gC34XBRlw3SzD/IG
	L5nB1JaydeSRj+NvTfBfKfIfbUcuxILAx6nGdIjBkpd5HHC2NHPPKasVG14NOS4I8QI9HroDPbv
	P+8vpgJtoASX0ERcyx70cqajoqMePl1Y=
X-Gm-Gg: AY/fxX59MRnQGwFHPoj5JbRNL0Ta6Yl7/jpJWefKgMtn0HgA2pNAB4LNSPH6ljwkclO
	htDvjpV71FI5fZBSPJMMLJrd62935vsSaSlGSIAOeUYpC5kY8lbylpm7GdQvU7Kmxguxm+xcm+0
	q0398cjQXOXJlxf6sUFUlVFwgJIxGjflAZAUJAoEa9eT/4xjX8olZbrIph2oLaC+0SrzE2ZeSqJ
	3rM4tWlODoxWfutJP7xBxBppHIoQ3tPs36h5mqV09Vu+P5JrvUPBTLkM4okts8fqB/ZdJXNm6c+
	9LAy
X-Google-Smtp-Source: AGHT+IHSUyciBMOilIcbt7HWqVU9MizsV+4Y+vMa4rwxqp1kK6Xy4T8CKC8ooJ7UwHC5GL0rYFqcLpHFUdgExBBrRuo=
X-Received: by 2002:a05:7022:e11:b0:11b:7dcd:ca9a with SMTP id
 a92af1059eb24-12172302438mr46279194c88.34.1767303966643; Thu, 01 Jan 2026
 13:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20260101172052.1862252-1-olek2@wp.pl> <20260101172052.1862252-2-olek2@wp.pl>
In-Reply-To: <20260101172052.1862252-2-olek2@wp.pl>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 1 Jan 2026 22:46:19 +0100
X-Gm-Features: AQt7F2oqocFNQmJB-3KQEF2TnEZfZsw4aObS_R4iYm5tqbcpTsbrKBpnm8uH8pk
Message-ID: <CAMhs-H_iN7pWsis2HbeJ-xr+9JoMa+EF-+7z9e21DJ1dyNNtuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mips: dts: ralink: mt7621: add crypto offload support
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: ansuelsmth@gmail.com, herbert@gondor.apana.org.au, davem@davemloft.net, 
	chester.a.unal@arinc9.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, tsbogend@alpha.franken.de, 
	angelogioacchino.delregno@collabora.com, linux-crypto@vger.kernel.org, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_134609_833171_6898AF5C 
X-CRM114-Status: GOOD (  17.43  )
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

Hi Aleksander,

On Thu, Jan 1, 2026 at 6:21=E2=80=AFPM Aleksander Jan Bajkowski <olek2@wp.p=
l> wrote:
>
> Add support for the built-in cryptographic accelerator. This accelerator
> supports 3DES, AES (128/192/256 bit), ARC4, MD5, SHA1, SHA224, and SHA256=
.
> It also supports full IPSEC and TLS offload, but this feature isn't
> implemented in the driver.
>
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/r=
alink/mt7621.dtsi
> index 0704eab4a80b..9ba28fa016fb 100644
> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> @@ -361,6 +361,14 @@ cdmm: cdmm@1fbf8000 {
>                 reg =3D <0x1fbf8000 0x8000>;
>         };
>
> +       crypto@1e004000 {
> +               compatible =3D "mediatek,mt7621-eip93", "inside-secure,sa=
fexcel-eip93ies";
> +               reg =3D <0x1e004000 0x1000>;
> +
> +               interrupt-parent =3D <&gic>;
> +               interrupts =3D <GIC_SHARED 19 IRQ_TYPE_LEVEL_HIGH>;
> +       };
> +

AFAICS, the crypto engine for mt7621 has also a clock gate[0] and a
reset line[1]. These two are not present in this binding.

[0]: https://elixir.bootlin.com/linux/v6.18.2/source/include/dt-bindings/cl=
ock/mt7621-clk.h#L36
[1]: https://elixir.bootlin.com/linux/v6.18.2/source/include/dt-bindings/re=
set/mt7621-reset.h#L33

Best regards,
    Sergio Paracuellos

>         ethernet: ethernet@1e100000 {
>                 compatible =3D "mediatek,mt7621-eth";
>                 reg =3D <0x1e100000 0x10000>;
> --
> 2.47.3
>

