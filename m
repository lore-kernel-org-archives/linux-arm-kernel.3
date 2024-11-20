Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A638FD711A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WhX7sy9ylH8oB54T8NmaXKVtwnhmbfEVEz1XB5edX8=; b=T1W8Qj+DZXoV6F4OuiGTr60Let
	XtpdaXffrtQXSwCs15hDa2EHGf82R1mZO9AnhqR4faV5jlF9REDcTiByTgkbburz1bxOxsLbGJU6t
	/AeKZegQgF06FLcYCsvwpf5kTdpMM/fkVhPeRN7mob6/kcNxvzxZMH7Epfyb0eCa15e+a4ofN/tTr
	Ip5EYc+r3/g9bpM0UR/YAnR+Pt5vdKiMwpFeuPBaXu1+GhWa/57jK/G2A9MeJEYDIPVj9WO4dvaBQ
	oxDtYuLc7aaUUum5pJOLTHeDSTh9jBGy3cowIazPVVNNMH9MJ3O/21Bxcca39MpD0t4vHS/NE1ikC
	pADA6tDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDm9M-0000000FcJK-2Fhm;
	Wed, 20 Nov 2024 14:57:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDm8P-0000000FcB3-3b8B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 14:56:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-431688d5127so18847785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 06:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732114608; x=1732719408; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/WhX7sy9ylH8oB54T8NmaXKVtwnhmbfEVEz1XB5edX8=;
        b=u1DRC/ukdq3Tauc7X3+j7SnAEEheq/gtH3scqNdd0qYIbkK9PidEPwOZukeeQUia1V
         EGHKQ8XY0y9DsuR/pfUL9qP0kBhoLnh5MV9Jv6xgLeX2xnRaCb0k1dxNeQtL+Q/ejWKk
         D5tlv1VTdXCcyahraqYvMSzgFBsn9OoIS4m1R6g5wi2wICFP3P7npJIn0ppOpE4E3br1
         2vvOD4rxJ8FIIM6D8Iu439aEudO/znvzacMpUecEPGwQoRPRTUttgYpI+vqCQU/VRG3s
         OjPCiFwhNw1YlH7pdaA/AhCfdh/Faic+dQ2ngG7dDphc0rzb9UmiouWjndN6biGKDqEA
         aMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732114608; x=1732719408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WhX7sy9ylH8oB54T8NmaXKVtwnhmbfEVEz1XB5edX8=;
        b=kSV/067wqN1O6Qy1bcxXKiGRMS3ZToItC1Re8c0G9AD4BolmpAjVgHpjGbeHhOmtJt
         hSpXenE3I7a6oPxNm6SWoQ9mWnA1ghO18ZRlGqFLhROk0dawr46DhZmchShwmK6RNWz/
         jNvJ4SEi5U7nx6tQqJCy9ZibkJFPVNh6foDR4T1QY9dhJSloTIHRsX5jv7W6o6rfYwOu
         jSDcOLlRvL6am++tRDdIDnzxiNvrWN9yXqUV/bzOY0+aNkTIXGjxQmevIrbiJs7rAKUS
         lxB34T76uHx2t2z99Ruhgb0ZWzSn4AIu/fn3phMCtWJaakr+DBArAJUz6Oar55RmPucg
         INEA==
X-Forwarded-Encrypted: i=1; AJvYcCUFFhqAh9a8XyNPdmCGpMipdGQLWQFzg9xAyPaX8IJzlaez2tc4HLYqz0fCSNIH1tmsGitsSGF5G0LYJedfhb1H@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8i1V5yjhe2JWCMmis7WEaiRmXObn3EvebEeWiti5GTBijvFKs
	tHjDUnVbqeo6QJAj9ogS4wfRfVvQudSIsXtzbeHnVi83eDSs+AWRGvDWC6jT4og=
X-Google-Smtp-Source: AGHT+IHrKfGLOGxnCvfbK0rlizot2Xe7bNWUl7+WlgkZB4qaV364sHZfb2rsYw8BE+EFPgwo4ike+Q==
X-Received: by 2002:a05:600c:4f83:b0:431:50fa:89c4 with SMTP id 5b1f17b1804b1-433489868e5mr29893195e9.3.1732114608102;
        Wed, 20 Nov 2024 06:56:48 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493ea7fsm2279732f8f.90.2024.11.20.06.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 06:56:47 -0800 (PST)
Date: Wed, 20 Nov 2024 15:56:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com, 
	yclu4@nuvoton.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
Message-ID: <klp4a7orsswfvh7s33575glcxhlwql2b7otrpchvucajydihsi@dqdkugwf5ze5>
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xlycwx5h2jmtpvei"
Content-Disposition: inline
In-Reply-To: <20241118082707.8504-4-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_065649_891744_86F97679 
X-CRM114-Status: GOOD (  11.42  )
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


--xlycwx5h2jmtpvei
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
MIME-Version: 1.0

Hello,

On Mon, Nov 18, 2024 at 04:27:07PM +0800, Joey Lu wrote:
> +static struct platform_driver nuvoton_dwmac_driver = {
> +	.probe  = nuvoton_gmac_probe,
> +	.remove_new = stmmac_pltfr_remove,

Please use .remove instead of .remove_new.

Thanks
Uwe

--xlycwx5h2jmtpvei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmc9+KwACgkQj4D7WH0S
/k7LQgf9Gwj9QyarYndFEA5e8v9OUMxfn6Cu7vJ3gmwOZLcBm0Oi+KHCfrK/5oMe
BYJvIWmrL6AbSFQqaIp38aZmWH2UiKV3KCeRx2kikFou49njcPVyqAKzwpCCi5TE
6XTZpAg/OHN3kJOiLwN4RZVsnsA4pR1VQVIdch+oGFMyKEgyu85MLpjeQecxRCT/
RP/bgKRO/OTWrrtnIewHNV2YsehEzx/+wY9gCh6lEVzBJYDGNNkZf49WdTO5nF1G
KB/pOfKMX4LrldyqelhrRyOOkqDa2mtB5gVdJf5vGP64XwbyxPhzUbblHk/cc5O3
wThAhMtIKX1kBcxmm20loeBenE3nrg==
=CCaY
-----END PGP SIGNATURE-----

--xlycwx5h2jmtpvei--

