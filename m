Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7A6C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 18:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hf9BmegiktNtcY6HS4qZYakNRxia/v7+na1LdoL1VGI=; b=ry4cMrSxxOZ+8pHxRM9EH7XzCp
	EtGT8abuQAt5Ra0ZwfUVDXx7m725zOuxotzfzcUDtTswPch6hZM5nfD3kRAdhxDDlWil5qeY6318N
	7IFDGNh5ngNwHbMzqSLKhSmmSLKZ4M1ZXZKLEZ9WJrToBYhomSAYQvw7TEf4FXO715NdrexDMCeRE
	1gVV6c1G/p6/zRvH3SGtQzTPAsmYeKbEOxm6/+ThTL1LmONgz1WUdtaqjgKtT0xChta8R892As1G6
	L/ukm9oV1Jd0gRLgtLL5nrOx19B+WxBt7x6hpq4+apWgubxrkyP8TD+eQFYyCmFlu/KN4Y0qnYuwA
	4RMwYzAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBAs-00000002L0m-3mwf;
	Thu, 20 Feb 2025 18:21:26 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlB2V-00000002JAf-46VY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 18:12:49 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38f3ee8a119so670499f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 10:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740075166; x=1740679966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf9BmegiktNtcY6HS4qZYakNRxia/v7+na1LdoL1VGI=;
        b=ZJpR/PIAg6un4iolqtKJc4awQAGTGTCjtRaiiN8VyOcYwhDAJJXrFPvPKrABW5MNUC
         4EAUnwowQauZ9ksF8MUsO2TxWDAON3p3nYqRR6WNX4Nm4L42WQcFlFAhKE33LRpzHl/J
         9GjZulrJ9hTedIyu6TRMh3t+NPFZ6dIqC8bjtBa96Yv7h4t1Tzz+e983oMLs5P3XNucs
         etocqoEvIJphujYfOP4D60dOoVF1RTZGZpSU3MxBM5iDvv4mOiArtmARyURaEykOJL3F
         Cj0Z9F9bd7rp3n8eXMAPUdp+foVrOemod7UdFmDbUAo7xS+N9FBz4ZOspjWTwxhiEL+Y
         Ng4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740075166; x=1740679966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hf9BmegiktNtcY6HS4qZYakNRxia/v7+na1LdoL1VGI=;
        b=hxqBKAkVr6oABXks8KChwNYLSbtA/s95tHJZfF4hD50waYRLRJ6ZgDKekynCZZ1xv5
         KLgaeFZnGttag1chqcZE9zsPL0wdOMogS7otIKO0HXE9xC6eFviW0O0zv0OzaSgzr6FP
         l9LL4QN8Ce3Ik9jhZtfaSNPc1/oEcRpobT9mPVsp8MynHdBpKdAhgNnG+P/HF2dqL3Bs
         QQvqFt3aIoCe3etms4xXwmMlbVqtS9+oDEOQekE2CfUK3c5SYXTRUoYR0xQJaIZKNRLF
         SVTVH69gme3tOpKlSUR8+z8JPOMzrLGVFBBAFS0NKgms1u1VjH2p09DF9L46cKhqJhH2
         npqA==
X-Forwarded-Encrypted: i=1; AJvYcCVMx+/ClITX0deafGZJOj+Nuaw/z0ha4LD/KcD9yiFP/FeRMUDx+4vN4bDeXl9knM81frqvaqMrCBwrXnVUupj0@lists.infradead.org
X-Gm-Message-State: AOJu0YxXaezNKyghRWEozog3LU71G/wYCnJPrsqCZ/WHSrOnP2BXprR8
	Blqh2cPaxw0wjIX4EPZRDjZYoVzuZ3YIBlkjjBlyf3YnA7Djqh32
X-Gm-Gg: ASbGncvqfN1WXd5SVg2MpvP3nY8TEBzjVRJ6vYV0NIiW3bqPllmnerVt48rXxCS6qWq
	ABqJ+XDObI13C41Z0qx2WTryg6whIrwbgCpokkrMRZLN7/IOogBPpoFwGXtwSs7aNQtDYuGKHA1
	W9qEseqfw+j7Bi7/7HmsE4Z5vyk7Xtnekf2xO6Ski1sHZDszTXY6S+PncYt4vD8plaBJknBIHiG
	OOdjwQfUMGwOhG97D1k6PtjMsig1y2YkUgjhQnXT40Krr2x7fphQs1jZ/LZ8E0bs4GivN1/gBLW
	mvdVfrfkdCaAV4Guylbq1GcgKd+UyscDdRbcpDxny1Q7Jpl7Jb59axFZfNfCU2E/ku0=
X-Google-Smtp-Source: AGHT+IG8SxlEpGzhrbOAaMiZSLB6w/8BQXRpKpsCxpcNHWG6kyfbSzJtzHPfDd1frA7kH4B1Z2SqFw==
X-Received: by 2002:a5d:6dd1:0:b0:38f:4f25:14a3 with SMTP id ffacd0b85a97d-38f6e979d1amr195111f8f.30.1740075166029;
        Thu, 20 Feb 2025 10:12:46 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5efdsm21016778f8f.43.2025.02.20.10.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 10:12:45 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Emilio =?UTF-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
 David Laight <david.laight.linux@gmail.com>,
 Anastasia Belova <abelova@astralinux.ru>
Cc: Anastasia Belova <abelova@astralinux.ru>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH] clk: sunxi: clean up rate counting
Date: Thu, 20 Feb 2025 19:12:43 +0100
Message-ID: <2385242.n0HT0TaD9V@jernej-laptop>
In-Reply-To: <20250203112930.650813-1-abelova@astralinux.ru>
References: <20250203112930.650813-1-abelova@astralinux.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_101248_021447_8C1DE509 
X-CRM114-Status: GOOD (  18.26  )
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

Dne ponedeljek, 3. februar 2025 ob 12:29:28 Srednjeevropski standardni =C4=
=8Das je Anastasia Belova napisal(a):
> If n =3D 255, the result of multiplication of n and 24000000
> may not fit int type. Swap division and shift with multiplication.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: 6424e0aeebc4 ("clk: sunxi: rewrite sun9i_a80_get_pll4_factors()")
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>

While this should work, should we try to remove (old) sunxi clock drivers
instead? Drivers we converted 8 years ago, except A20 GMAC and A80 PRCM clo=
cks.
Even if we convert them now, we need some transition time for them.

Best regards,
Jernej

> ---
>  drivers/clk/sunxi/clk-sun9i-core.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-s=
un9i-core.c
> index d93c7a53c6c0..639c83ed63b8 100644
> --- a/drivers/clk/sunxi/clk-sun9i-core.c
> +++ b/drivers/clk/sunxi/clk-sun9i-core.c
> @@ -25,12 +25,12 @@
> =20
>  static void sun9i_a80_get_pll4_factors(struct factors_request *req)
>  {
> -	int n;
> -	int m =3D 1;
> -	int p =3D 1;
> +	unsigned int n;
> +	unsigned int m =3D 1;
> +	unsigned int p =3D 1;
> =20
>  	/* Normalize value to a 6 MHz multiple (24 MHz / 4) */
> -	n =3D DIV_ROUND_UP(req->rate, 6000000);
> +	n =3D DIV_ROUND_UP(req->rate, 6000000ul);
> =20
>  	/* If n is too large switch to steps of 12 MHz */
>  	if (n > 255) {
> @@ -50,7 +50,11 @@ static void sun9i_a80_get_pll4_factors(struct factors_=
request *req)
>  	else if (n < 12)
>  		n =3D 12;
> =20
> -	req->rate =3D ((24000000 * n) >> p) / (m + 1);
> +	/* Division and shift should be done before multiplication to
> +	 * avoid overflow. The result will be correct because '>> p' and
> +	 * '/ (m + 1)' are both just conditional 'divide by 2'
> +	 */
> +	req->rate =3D ((24000000ul >> p) / (m + 1)) * n;
>  	req->n =3D n;
>  	req->m =3D m;
>  	req->p =3D p;
>=20





