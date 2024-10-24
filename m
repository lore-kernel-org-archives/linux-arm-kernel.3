Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99DDCE8E8D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCnstNue4jg85kEIiyesGcA8Rnj9rjVX17h62wnrdHU=; b=dnOukURXuxc+z3yO4+cVRejebW
	VzpWlqrsiAmOoLhQv+uWnpzDmEQm9MZbsD6O9aFeaA/MUwQz389kK8ebYCRVFB5FtBtwIm7ZDV2aT
	edNY6MBJN4tEoSkMGup5eZfJkngXYmCNPuVhWwsgGD5hli+zYbQAiXnrKcJP8nVyHBjB/UdUG+nPR
	cxtb77/jfGcig7bHnDoHij4MRylkZLZ48+Y4pT6jfsGH8nhLfoRSpzL7VoKqCwxicexGsd5fWThMg
	ANWA479fkdnyCm0/m0QncflfDntTlUtb7+1VYyJguhJ3icNAZ0HDeUCMiBGKDHgO+bmU7qwMf+FnT
	9EGFMj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t402L-00000000yty-2njn;
	Thu, 24 Oct 2024 15:46:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ztd-00000000wBb-12HG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:37:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so10720645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 08:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729784227; x=1730389027; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SCnstNue4jg85kEIiyesGcA8Rnj9rjVX17h62wnrdHU=;
        b=OEx27Reqq7iTiVQYXc4708T7RuNDp+TNXE51ZF1z2lCOb/v1j+DLs08QgQpe1DF37e
         51mYKbqSi+i2gETb73NEeR0Ql1vXCzrBd4s2wXJT2f4TLMw25Cv7HSqnWqcltIrZRzIS
         ZYopsWnw3rTHMky8gGPgfhSU2OiK9o3y+fCNSgTGOG0t3NLC4LefKcTkBR5ZXEDm7elc
         0PMQCoF+Uy7BB1bC1ddSb/hwd9B+LjPTYscasLGqNKcwwn2rpQam8HgP0+pij175ydvo
         l53ylKCG64EUrzzxZB5pm65RIv2MzyypaN7WSYukDIIQzvyA9zfo3vhP9vvmW5+87/tM
         jH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729784227; x=1730389027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCnstNue4jg85kEIiyesGcA8Rnj9rjVX17h62wnrdHU=;
        b=RyhfU36P172Wy45iqWwDevzhtD5WTSgtYXf2PA2nUZA+2vy7zltW+aVv4DJjD2WwpB
         EWcetOuNfgei+jetfDVm/Ai41pV5BIj7tMBQ0SXsH4oWNGNC83P1duHgyecvli4xsa8b
         E8RXElwlpHUiAAzJR7aFzIsdgLxmViKzqouFSctNv8Z59bFtcDkbILOsEzDNa1o0m2lf
         FRN9Wzgkm2l5bMZ7pPKo7k2E4LQY+EAbSIEIaQc4hcgyrxWsc83+nYyLRlQVu0vtIhAq
         QlqNYkp+T15MOgklN90iPvvWY/8OVn1YufqWgSm6h3/sDba1dB8wZWhT/ogqeRYCwH8k
         kpxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI9+DuOhmDb2j7NEPoon+VxTcwiQuX7WQc+T6+ah77LKRC4uUs6HJtoCaKzN41nXbks8WC7kBLFQln0pbKbhyN@lists.infradead.org
X-Gm-Message-State: AOJu0YzqnldGxVBBPtYbnZR/W7TVCwt63CFIX22x5+MPP+zlPlqaU2US
	lFPwelDVlWQjdzp9pewG2xhExlpXQcKQQvPfYGHE2yLZH2EOnvepXSQJ52G60lE=
X-Google-Smtp-Source: AGHT+IFgeY+AzYZbHlaVERgkGi+hHj+CdTnAXQEQObCERD5nPgI8ASENpM18NFTIk7TmUwfS+F2JOA==
X-Received: by 2002:a5d:60cd:0:b0:37d:45ab:422b with SMTP id ffacd0b85a97d-37efcf32d1dmr4378492f8f.31.1729784227087;
        Thu, 24 Oct 2024 08:37:07 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bd6esm11615236f8f.104.2024.10.24.08.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 08:37:06 -0700 (PDT)
Date: Thu, 24 Oct 2024 17:37:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
Message-ID: <7lcmhspo5xq3numdbrfc44uqppbzigwq56vmqne5ldvg2uac6z@ivu4fmwbzajm>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aoyw5qfx5gwdpipb"
Content-Disposition: inline
In-Reply-To: <20241021103617.653386-5-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_083709_326413_C72F6F26 
X-CRM114-Status: GOOD (  12.73  )
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


--aoyw5qfx5gwdpipb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
MIME-Version: 1.0

Hello,

On Mon, Oct 21, 2024 at 06:36:17PM +0800, Inochi Amaoto wrote:
> +static struct platform_driver sophgo_dwmac_driver = {
> +	.probe  = sophgo_dwmac_probe,
> +	.remove_new = stmmac_pltfr_remove,
> +	.driver = {
> +		.name = "sophgo-dwmac",
> +		.pm = &stmmac_pltfr_pm_ops,
> +		.of_match_table = sophgo_dwmac_match,
> +	},
> +};

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers. Please just drop "_new".

Best regards
Uwe

--aoyw5qfx5gwdpipb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcaaYgACgkQj4D7WH0S
/k4cDgf+KFa71VVkDyJF4Hl2zPHZr8uawn9uZBqgpPkeGPL2gMIgZeFsbW+Ta6tM
l9QqKp1U1+CNvJx+TsnkHz0XIwAAu4+jjjLogyLd9qAvydydl7UNfs2qqtiVklt3
QKX4PUt2WLIsjSSnXZ/xvPpcHmofvemuYZcQDgiEBlHaBn+GZjD9woBQgX79OZ3W
ly+IQUOVBFIqnkBG7MrskeBodS69Snv9OGEkKCxn4me2uqdlscBZVrjIQ2H4u1Q5
K+jcXjkffyRka8EVF/QuOu90nBixXNZGAa5d/H+Gt1siRRXt6Sgw/k7KSUZ8Kb7f
UZNlLZkw0L1To+cxy3Y5F23dBVqbMA==
=+aJM
-----END PGP SIGNATURE-----

--aoyw5qfx5gwdpipb--

