Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB18E7DF11
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0gyTF7HDQLKl/NQKBiqUu7tUq7oC19o2sx5CsrD/90=; b=ah1VufnRyL8jNbbrbMUQ1OK9Cn
	g9IAv0YNRSa5+/RMYrTpTEYPwmKoLfBoAD1dG17K5giutp1bTHnroTcnb5auiVi/ZbwztDjiHzZUz
	pCwz6K2+iQKfiGrD/4K+5BHiLk4xor1jmOkiHAcJsu7IGpO4/wPrlx9TOMvKKb7DYEiNxerTaKLc2
	qkSENvg+pT8+q/u69zp9bbqAqhx1PUnPaSCUeaJiyZ0qEUs/Yq7+rTqnlJHXynEVyh0YAHk+l6lhn
	7hnNtO+9CNQ5SdtdnR1AB+zLU+s1NgtC/DoLCubx+MuK4wMDX/2yLUn9q+hRm+IWlzET6Z9LDHPnt
	DX5K6kLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxsq-00000005MzD-3U0C;
	Mon, 02 Feb 2026 17:38:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxso-00000005MyJ-3YwM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 17:38:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48069a48629so49163905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 09:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770053921; x=1770658721; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s0gyTF7HDQLKl/NQKBiqUu7tUq7oC19o2sx5CsrD/90=;
        b=Jz5BNDl7npJsOW1qZL+5LdeorO9cIazpMvajOfvQafsXrbIGD6QuXu0kGQScD+00CQ
         T2stMQRPMtBKF/Nmu1wen3nPRPsleLhD4U3W4qUXdEqIwDooemQJt+8b88WqiU6jBsvB
         TiEiP/Pffihjn9QTm+8RKsTuFP7rcfNtLkijbmym/YQOF4IMfAV2CYrpL/34n1LQon5R
         9tjuIJvMZUKunXcWxGrf9US4MwYKgTuACqgMDVmah1kHlNbekwuE8HUtS6TN39/Nb+Za
         O92829zs2pTnmgPlN0AYV/x4ecoevYjtZSm10PNtiznMsU8rYpQ65VlrwJc0AILcNTXN
         JvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770053921; x=1770658721;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0gyTF7HDQLKl/NQKBiqUu7tUq7oC19o2sx5CsrD/90=;
        b=ScUYLz0nmVAmekWSL8oEnroqIoJUXLTYdv8K3BwWOxV7ipqgMdxIfhWZlUhIw2ULVj
         /pkMx7/zMgY/npQC2DAN86rm1lQdETjELlJLTCN+YxRFgFGwVbGkiuu5s9owbj6FtDSS
         ElLDWmJijP+jtBBpJrFg2AWZJX/nVh53tnM3oQkf3H3juKGvMbbSacyVA3GASVNWIjuC
         oK8ZRJApCw+44fAeDXaJFxldVGNcGFHLgGLseJXEWpBzTAx+VidvDstJ1tbaAjd+aS28
         4d7XR5DXSa1TKt0wSWoHCAR2RDk6eHp93baMOfti1oiaPA+JBlgwvisRCa98oTUoj4XC
         dG+w==
X-Forwarded-Encrypted: i=1; AJvYcCWxFfz1IfFLJ9XU7KpfthKsKnv5J0U5+PpMuC7t5MunqKKDBg+pGbXZ4h4VEmsUI1kbD9XI5VAhMHw105vsF44o@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv6tAsfXJaB+bGIb7CMvFoJlYmj7XWiAX746YWevpI+g7tZYiZ
	iZA02AYbx6F8KS2tVItXNBzqnKpfFbJ7upY2JCSj0Eo82ahgiog6iKmTWWpN7Bb1
X-Gm-Gg: AZuq6aI2KJcymhyaaJ9k/4PQdyzB/gryrXxUQbRrhw2fDMg0TNfigDYLCBpsKwGY4fM
	DKSIBB0y1q4bsUNimmfjSnbO2osqMkrvdTMiQDsdaXwJKu2TfHHWR85e0SjcM/OLx3Xhd8r6hjl
	Pak9bgF5ydtBws3k5IwaTtM20aN9o06oCtVZ3Ix4FaH8dvMLehoYDeBd+qH5uOq2dyqulvMeWK7
	dl7FmISKs9aJlkBMsu9Rk7qjZXpMV8frJmEJPisiRr8D94zmmRN6Z0z1dhz2VeNLrTjJW1YaiIZ
	BgVkTB19sFO7NxIG27tigjchwr/RGceJljXF5FM5Ea+kXgnXpuZsc81PCNYKb/wVMIeCjbJdwBS
	7na+KWqnDa+CivNVebiX3fPqPxRPRZU3SUix9LheVW4bXtsKQGMY9JvZlwJ8Znp+gc1I3TON8AO
	V1arL/3mxOpjihqRLwSjSbawtj
X-Received: by 2002:a05:600c:4ed0:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-482db481b45mr150644815e9.21.1770053920464;
        Mon, 02 Feb 2026 09:38:40 -0800 (PST)
Received: from strix.localnet ([197.250.227.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cf4asm46449032f8f.28.2026.02.02.09.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:38:39 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
 Drew Fustini <fustini@kernel.org>
Subject: Re: [RFC PATCH v2 1/7] ARM: zte: Add zx297520v3 platform support.
Date: Mon, 02 Feb 2026 20:38:29 +0300
Message-ID: <6235462.lOV4Wx5bFT@strix>
In-Reply-To: <CAD++jLn6WCnqcoRwrGv3X3tqx=weBdobu-QJ-jdSxOSPVjN_eA@mail.gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com> <1848649.VLH7GnMWUR@strix>
 <CAD++jLn6WCnqcoRwrGv3X3tqx=weBdobu-QJ-jdSxOSPVjN_eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5074665.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_093842_929900_F193895E 
X-CRM114-Status: GOOD (  12.19  )
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

--nextPart5074665.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Date: Mon, 02 Feb 2026 20:38:29 +0300
Message-ID: <6235462.lOV4Wx5bFT@strix>
MIME-Version: 1.0

Am Montag, 2. Februar 2026, 12:09:03 Ostafrikanische Zeit schrieben Sie:
> Hi Stefan,

> I don't have any other ideas than to proceed with a 32bit port.

Yeah that's what I'll do.

Thanks for the help to everyone, I think I have enough guidance to disappear 
into my hacking cave for a while. I also received some feedback from people 
with different versions of this hardware, and as expected some things are 
working and some aren't. I'll probably spend the next few weeks or months 
trying to understand those devices better and submit my patches once they are 
ready for closer review. Since this is an evening hobby (and learning) project 
it might take a while.

Cheers,
Stefan

--nextPart5074665.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmmA4RUbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJED0TvMhUTxoiLuUQAJovSVKo6Frb2L0eYfZz
03MBUuJUxhKyn71lRHcK6teYCVDmZZDFRCwXMRcT3fYBJDOGJ/zaOwJDLv2w8ESM
+wARokuTJbP/k8qXwdrmOUUxSHhMbBz9lJvdh/NRjeCHmHCHDHBYImVa7DVV57kX
u6zrA0I8xfQSXBDHCclxw7/EPDRWIqiYBIzsgqmBmS/ATTMgoyxu6kIOR8ct22kZ
rXamZq5xuurxqehTGANVVs/CgugpIR1WMVaUPSMDfEnikvDghScKrOKdLQZ2Oe5a
htFXLUIHneqnCgiXWh5xriMgdN38rAKJ8VzmeoUCR/BlFANqmmZ90eTvjH1oFIfM
qU4nciXrKMZomoexrNcDPzm8lqYa5EYcuhdF0mjtVzDhQUQzFIyW3UYDIL4caqTe
ic92sLHT9HXScWnlF+3ZLOUOS0MEAzI/ub4pqezCSEL+r2mRUVIdnPCBvjUgeVuX
TtGlfjpVQCcKJRcK9p5k8sA1q3GAS1Taq3g3SzdQAOjVavhGWBiFMxgrsJpbNV83
VCbPfkArHwVxle/v7Xouxg61VFbs5axc9cBDpvSWLVntgeFgGnYFKhM+jY1Q8Pow
p8pH3XACwwcVZO0/Bfob8yMj8n0l+MvfalbEG4ANTFot0Lf61cM24wx+oXf2aOVN
bgabrZ2+eRfAeyyvSGFmLdfv
=3Xo1
-----END PGP SIGNATURE-----

--nextPart5074665.31r3eYUQgx--




