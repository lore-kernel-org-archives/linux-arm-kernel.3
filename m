Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AF0CC6B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5fHeiHrpOk2vfvskk98XxNTZrpPOhyutiQiQa8eWkg=; b=qLLJVjITItkuJP0JaxfH/fcXhS
	IAgPeAjN9JDG4CvRbFLPCf2119+q+PKTTL/iOPvE1zs7JPwogNaZL7hYlzUmx0JenApl82l5pWOp5
	n2iLSh0I0ZDrAmPdTG3T+fFVsCgi94dMCXCWDJApe558ZTO7MgSYyJOf+PKhMCHD6ugn8GNXUOKT+
	sJQVeH+ExR7l+w/sMAUL8fo6mi7NsSksQaLE79lPSwXaNqcHcN3EePMW+oWagTNvY771fJS4bMCr0
	cM/6rU9fOjc7oGswGh9FCMyjLVmh5l93XroFg0CDrUPQYt/mGpfnMo2NgQLs1p8vOb3odY3EYrNma
	Rp40fZhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6Br-0000000GJWl-2i2h;
	Wed, 14 Oct 2026 21:07:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6Bo-0000000GJWQ-1Ct9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 21:07:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48afbd2c386so2713023f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 14:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792012026; x=1792616826; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5fHeiHrpOk2vfvskk98XxNTZrpPOhyutiQiQa8eWkg=;
        b=So3ZNxFsKdoyIWJ/Qar/Mn9ws23423Vw85ZX2SaFf7TGItO0XAd1E2kQYRLUzjJkRO
         DOysJJH5bIVQpeLXk0EmIlclrdMMnWR65x1wpgYAoTyzwqgZffi/yNWIXrchf3ZAn3Be
         3g3YHIZzaFeNTABdhDD5iAvnGmHCjdsPrCCm5oAdXqNy3wdGV1cN2yKBQCWR0op7/mw1
         x4xPftcGCkOoAGTUadTeI+6uWpch24BvbXSo0sRnd+okswzRe5fQsQfP0/zhluFLXbxJ
         T8dZ7+PmY6lxc0eNJpKLOlELuOJmVPnewaD7ua44f/fKbi60CjmgPRjqHNF+7C8NSVpp
         TnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792012026; x=1792616826;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G5fHeiHrpOk2vfvskk98XxNTZrpPOhyutiQiQa8eWkg=;
        b=PbnLZ7uB0GO8vkG4/4Ji8m0qQwRjBeffrkC/v4/qx7fSZkJRA09MO2PzP11cu91uLt
         jusApMMSRuyarL+Ph+wyFsN4v0Smpvc4ry76sgP7VckexNwEzXkn6s2DeJ82N+v3Ul8a
         pZA/CCHYoiX2K9Y1Kqried0qcZeqR6VKCiZSdxuRsWtO0hlUE5UPMDRZX2fKGT/2SkNV
         hlAIVmlGOrMPegcTqBY6QEPCbk6mWbXe8VtQARJH8BRUO9/yo8KSMo+CNsx0df9spin2
         jDnTSxrxDeOT/RS3N8a4RqhVp1DpFJ8zem4sxfY/DnFxcDxfVU+kNaPurWjm9xGWBSEV
         d8Sg==
X-Gm-Message-State: AFq9FYKxz+bnWBsX5CMi0hKqp7I1adbuPwd8/335OeZ3V7cpL+m6kRjl
	7+XbrT1ayrBXFBw2aTVOj/90f1VFhgjICnpyAM3rr9Qg5V8ZxPigqCp5
X-Gm-Gg: AYBFou0ZjHgLJmpoxKUjUbVC6cd6oWrpF8HWmIiOLTUYhbHdScM9Dw6gKlQ4kV+ByQR
	X46i3U/lydCACOtYSTZ7b5pz9Uz94N7gffS+39It3iX3iKKJoTMtrYjK2h+MbgLwdhVm9gMTpSh
	vtMJb52oNWB89yF3AFJR3xaV6/5L+R1bzYIKTOoLM4pfNHc5PSBzsaE/BkAUnLW/tDoCyiHdl/q
	F8sG083fJrFD16YrbWXP8wLlgQrAkk3SIsrsIw/TwoO8rGOAhD0ImuR2y5LHKNsUGt1GOgc/9se
	JckCFkgiFS0PX9s1vqD4GVlSKQ1IyoagWr9PExp3dnW92j9HUQtJMNqrOUnYqatSpYMxzd05hce
	00GL8enVHoee+z94gge+3YLdGth0DxnOkkps7QoEqGVhRiuJXClRwXUE1f9WjlnLB3joSS6gu7n
	+51PuHKEgKLPWoWGIefBCggt/GwrQ7M0Y+GlaimlwRCze/s8rkIihDIWwGcjoUeZxsOppWse744
	sD/bztt0sgcV8PzmrB0ZhX6kVvqZPilUnaSVfLGLO9lULV6kahfjvyo6VXGpA==
X-Received: by 2002:a05:600c:a088:b0:4a0:2644:80db with SMTP id 5b1f17b1804b1-4a18e4d55a2mr331849525e9.35.1792012025838;
        Wed, 14 Oct 2026 14:07:05 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd68dce7sm8179535e9.3.2026.10.14.14.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 14:07:04 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, krzk@kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Wed, 14 Oct 2026 23:06:57 +0200
Message-ID: <1wUqZrTnSiGMTyqeA30cyw@gmail.com>
In-Reply-To: <20261014131954.GA1623979@bhelgaas>
References: <20261014131954.GA1623979@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartzLu3b8EiSJuMDdR1hVgfBw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_140708_348147_7A121B8E 
X-CRM114-Status: GOOD (  12.84  )
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

--nextPartzLu3b8EiSJuMDdR1hVgfBw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 14 Oct 2026 23:06:57 +0200
Message-ID: <1wUqZrTnSiGMTyqeA30cyw@gmail.com>
In-Reply-To: <20261014131954.GA1623979@bhelgaas>
References: <20261014131954.GA1623979@bhelgaas>
MIME-Version: 1.0

Hi,

This is mostly a reply for Navid, not Bjorn, but since the topic of=20
capitalization came up=20

Am Mittwoch, 14. Oktober 2026, 15:19:54 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Bjorn Helgaas:
> Capitalization of "zx279128s" here (menu item, help text, comment
> below) should probably match the commit log and marketing materials
> for this SoC.
>=20
> The config symbol should use the same tag as the subject line.
> PCIE_ZX279128S might be too specific if more SoCs might share this
> driver.

=46or my little pet chip I decided to keep the letters lowercase because th=
e SoC=20
name is borderline unreadable. At least zx297520v3 has some minor visual=20
distinction whereas ZX297520V3 does not. If somebody had asked me why I wou=
ld=20
have said the above and that Linux generally uses snake_case not CamelCase.

So I'd suggest to zse zx279128s rather than ZX279128S unless the symbol is=
=20
capitalized anyway.

Now just wait for the zx234502 charger and zx234290 PMIC...
=20
--nextPartzLu3b8EiSJuMDdR1hVgfBw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP7vEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoihqoP/2vakcsfXpu+Ci+GS+WV
e7rBcoFUyeSymrqBIbFTVnyAjrjc8gPnoJsgGCeYhjKPqMuHfgoic0eVqtS4cMq8
BHExipQPVyxZO6NW0HMfIEhbII9WDqdctyOcuy2GSedoIMJzIPWMXpMnX46JyKOB
1MBV8Q/S8GWhnhk1T/KCKwkaSoSZJHhoiw/lo5o8F+P8I9dcp7ZrxHx5adGFs+fe
UNcC27+Sp3EVDpBFGm2+6CCGXA0d/Qo7Uk5ty7NM0+HSJXcALpE+7LaJiI/86tTw
Vt3hTnzzG0eN0Tip7+9uRebVf+Qs9c7bfw8Sul479iAAxyG9Z6P3HOWpFb+w8yED
YOClg/A/MOekZBJXb7IYLXV4ENzO3pDqoKI2X8UX8lkNhHQsQzT1ZNHyMTMrvbbk
EaRsivRO0CHD9AAX5PlqzJCpNKNEexkpzqkIN9cCBDl0OcY/Lcx0YT2Zo0F0bY0J
9K8/B9tRssVA56pmeoMY4Yf9cOGXFBOUXiNhJloY/r4pNYA8dCp68WWAB/pVxfGJ
qKiMZAcpZ7oUuw4ShbC4SufoVUrsvcxNWwuuNex2mpLspZCO70Dpy/Vlxs6KAQb7
Dsyp9HyIVZq21HsJ67gfF1MMRcEKqg/zJPA+6PpI9QwuLB9kJFmh5dH/oSd+HJsK
q2rJ6y1sOhtsWG3VBwTYdMBy
=fL1G
-----END PGP SIGNATURE-----

--nextPartzLu3b8EiSJuMDdR1hVgfBw--




