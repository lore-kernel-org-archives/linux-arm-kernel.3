Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9C8C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 18:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhH2cWJiOFiPJwDHm1EMiooPrujkspMZlGWkH+fi+54=; b=bwqzyYGwgnBo8/yi51IbS6iHV2
	0/7frZIR0swNr36rlxnYoP8uoTCaefXnl/B/bboLMXvUTC7GiInjdRM6PogLaGNMYX3fSUez9I086
	2ceLQBRY/92nPQ6qFBe6iLFPxVLsU5ak5MlbCCPwXNe9Et+mX/8MwB6XZhYG2PIf1Zh3ZZlU8jdYv
	SIBqRwrTeFFZdqHAblWbJKh1iUO7CNmt15nv1N1wmxKJyuEcFfKgVUq9hBHFBJceog6OROWEANGUq
	cUEVgzMuLCIWyqeG6WZoxyTuamttPJaPbETCJDvkk7BwA9dv+IwjDTUBJWwbKUmMRZb+XrmHly53V
	ntb6viHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Srh-00000007Abn-44Ip;
	Mon, 28 Apr 2025 18:06:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Spi-00000007ALP-40PQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 18:04:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cfe574976so35292345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 11:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745863437; x=1746468237; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LhH2cWJiOFiPJwDHm1EMiooPrujkspMZlGWkH+fi+54=;
        b=B6TzaecirWR/PfAaILi31xWy6pGf2rWZu3pdgWEh9b6MxRUXR4A1yWbXRsluPZZq8P
         Gm9bYs0aKGVgBs8nrRfvBSiGa8r04lpm75OxVHKcooHNAEguRALsW7jkrYgJAcNcm+WA
         HLAXherm7zUgXZY7vPoga33fJYMoBcR8fd9BD0+lD5vUtpFUz/YW0GTw/5jZZJEYyH6B
         GUpkdExOCnuJGhDuKxFCpP5gxQysE4R2x5y+yo5KBSd6N5sxa9QV9wSIumrv8FwxVYYF
         lU3mQHgpYvPfNni9R8gx3wlADvnleswgyJ94qnBIvS33wvVuWz/E/9o5MTWMahsB3I1v
         VMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745863437; x=1746468237;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LhH2cWJiOFiPJwDHm1EMiooPrujkspMZlGWkH+fi+54=;
        b=satSmjGxNZZRHa0T5FzybsdedW28OiUpA7ZGXeLS/PvdingGQdz7PXPcAbdp3p4ySA
         MEaHWo3H2E5q/He4v87CK32ZPP1mFdaBR1V5svcVfhpR9SWO/dil3Wuzq9jlQ1G3NeK/
         wd6vLu3ru07c0rg4+jwDdYXG40YKEiQLTFGgFCY75ChtvwOBOIzfn9N571nR6QnTNM5T
         vkPs0yIKdAw7dRepGXFQ2xMtuSawWN3zQQ0iFHdVauKhkEdJ2VIhqptWcHNPizyxiM3J
         GC8us5bY0xhJ03aXCBfEi8ZfWZoG+9Cebf+5AYCxgwZvo2bsomK5omltXgy8Cu6F1X7l
         0q8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWh94z+i08Tfg1OqP53Jc95taOE+wkwDg0rk719YifT16py67vKWkKp4pGFzeD3FdiRPxDF8ApVKbEvFoPwcR8/@lists.infradead.org
X-Gm-Message-State: AOJu0YzVGqn/7Mp4i1zBthYOJRe2gr9K9BaUGxI6Td6eZH5GkyowNoiP
	n6AYz5D0Km/fNFhpduMxAeZ+s2QQzm/eJw/KBn8fcONjR5Hq6QCTwRrWS+qo4iE=
X-Gm-Gg: ASbGncuhx8h9IUtxzAYuHSbD36PN5FRUegWNzecLPsvDIgzMZkflrwv5WG6a7R7UAa5
	4k7oSoqv/9J7HK1xOKFRmJghuxGbTznaClBjd8VDv99xAmkx67UR1vJs1/u9jkAP4/UvXz44JCE
	eLXcjvYMhQFl2aPvUuV8LOFHzYA7qkO7oph8XcN4bRVylTdUT2Sf/Po5PL/5YtXc4aG50tKGfny
	/8RgJl4Q6g3aiycV7BfQRQbNQRY1EuBRBBu0YfViYl91oNsbFiqB+azq38Bp8Cf3aodey5bzLP9
	IPZbK8ZF6MWqVlvuWvG0M7HMFw0IyeI7R8tPf0I/NuDy
X-Google-Smtp-Source: AGHT+IFufjFxqWpK/DiwzoIhe+tnqis6Q5i4cTihbGu1kOEcV7a+TqrcCHr03xN9hBxN/HPNsngJAw==
X-Received: by 2002:a05:6000:4282:b0:39a:c9c1:5453 with SMTP id ffacd0b85a97d-3a08a3c8a48mr205683f8f.49.1745863436775;
        Mon, 28 Apr 2025 11:03:56 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29b9c4sm167552465e9.3.2025.04.28.11.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 11:03:56 -0700 (PDT)
Message-ID: <e12bac66ea9158e058e48521e6906cb04960e980.camel@linaro.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo
 Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette	 <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Russell King	 <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Date: Mon, 28 Apr 2025 19:03:54 +0100
In-Reply-To: <20250410-dancing-free-peacock-536c24@shite>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250410-dancing-free-peacock-536c24@shite>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-2+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_110359_009730_95CFF912 
X-CRM114-Status: GOOD (  26.64  )
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

Hi Krzysztof,

On Thu, 2025-04-10 at 08:18 +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 09, 2025 at 09:37:21PM GMT, Andr=C3=A9 Draszik wrote:
> > This series adds initial support for the Samsung S2MPG10 PMIC using the
> > MFD framework. This is a PMIC for mobile applications and is used on
> > the Google Pixel 6 and 6 Pro (oriole / raven).
> >=20
> > *** dependency note ***
> >=20
> > To compile, this depends on the Samsung ACPM driver in Linux next with
>=20
> Are you sure these are build time dependencies? Do not look like.

Yes, there is a build time dependency on the ACPM driver (also
mentioned in Kconfig). In particular the last series mentioned
below (acpm-children) adds devm_acpm_get_by_node() which this
driver needs.

>  Also,
> if they are, the patchset will wait for quite some time.

All the dependencies appear to have landed in linux-next as of
writing this.

>=20
> > the following additional patches:
> > https://lore.kernel.org/all/20250324-acpm-atomic-v2-0-7d87746e1765@lina=
ro.org/
> > https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linar=
o.org/
> > https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@li=
naro.org/
> >=20
> > *** dependency note end ***
> >=20
> > +++ Kconfig update +++
> >=20
> > There is a Kconfig symbol update in this series, because the existing
> > Samsung S2M driver has been split into core and transport (I2C & ACPM)
> > parts. CONFIG_MFD_SEC_CORE is now truly a core driver, and
> > the I2C code that was part of it is now enabled via CONFIG_MFD_SEC_I2C.
> >=20
> > This was necessary because unlike the other S2M PMICs, S2MPG10 doesn't
> > talk via I2C, but via the Samsung ACPM firmware.
> >=20
> > +++ Kconfig update end +++
> >=20
> > This series must be applied in-order, due to interdependencies of some
> > of the patches. There are also various cleanup patches to the S2M
> > drivers. I've kept them ordered as:
>=20
> They should not depend... although actually not my trees, except the
> firmware.

The s2mpg10 core patch adds enums and register macros for the new
PMIC, which the clk and rtc drivers then use, hence I'm calling out
this dependency - they can not compile without the core patch in place.


Cheers,
Andre'


