Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A20CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 13:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUUhsclM68Xjsn8h8HY1t1Xbm15vgk+qa6obR6iKY2U=; b=yCLClvawmp3tFCxv290aSC1k6k
	DN5gpUkwcipITpYAgOGMMIJoJX80NDye2+aq5PeQ14XPyNk+QJ+vzuU/yPZgVYrKErUu3K69PwUUh
	X7RLvhYx8Snf3e7VjWvjwod5m0jw2o5yXBmjbrmGuNssxhWJbeuuNr8VQ9xuQFDxECTGcykOvUQsI
	spJF7F5GhEl1qjo7P8fONBB9Jj0JLdGfwV55fIwcayIQSwYblOs+ctYAQG59eRfpQZjFQVgJk5CVG
	QZvgepJb0VAnEzUehqb+rFV0gQZ6mssknvAaF13lXmRb2sO3Qx7j6/9TTEM7cms26u5g7oJihupjB
	w5/CKmNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtDc-000000092V0-2yL6;
	Sun, 11 Oct 2026 13:04:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtDa-000000092Uf-1OzQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 13:03:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso6890715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791723836; x=1792328636; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUUhsclM68Xjsn8h8HY1t1Xbm15vgk+qa6obR6iKY2U=;
        b=cR/eI1kGEbrVD/sfPx+tUj4SRzH4z18tq8S7FNnSu9kWstV6cl++aJfPpWj0T92knX
         e7ejuN36ICGFrrO73kiCBfkgJu5zj6m8Un0wS/UO7XI+3KFqxueBj2ZslN5LJlVZWHLN
         NPMaydRDfjaSWWd6pzj9Hdwj2df1iL9y9KIepGx9ubrKC3rq4QcR84+Cx4SwdI3xifXK
         o8hZdPs1b6wUNcfUuhyCyH+2b3SdYHhS92k6wjIR812rZqq0FmctlJLztwYaPP36pFIw
         slkYMcVqDmfxRBB7T3SeI6/NdPbwYSTpJaD6t5J7rlcGAdrjY4Rz6rIqEZUQuD84n6Fi
         Jlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723836; x=1792328636;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XUUhsclM68Xjsn8h8HY1t1Xbm15vgk+qa6obR6iKY2U=;
        b=hcCpuQ84lo49HtQdGKZHp9p8+PDlRe/NNdGC8mJvCdGpKyPDYz8HwaLv1aIM52L8aG
         h+k6xfMQ5ZMmt6rIkLmpP75mSEvfwT4g1+yN/+SYg2flbAGSSJQx8iY2ryzxWizeJ2wF
         chItOiYiAg+pCq6WVTjL/kLttQN7thWFl3IeHKnrWANSWkvkPzp/7/78ynyR8inuo7b4
         3E/RUTfdXHqBhKwAevJUcAI7tNHCbNPtA7/7RohXAA2Sr6LnXNtOg5/RU7urAWAj1ddp
         F6qNkLhHuIa99W0HAi+dkNx0cE2zJCqDD2sV1Wwsada4KOb+YamKfEuxDY+7+YyHX/V0
         F1sA==
X-Gm-Message-State: AFq9FYItZ3xjqYhoG3yZ1UNi6p7yxkuiusOs6JkglAlfCqRyTZJ1AUNM
	uw4puNQZDvh4gdkqsImgM4SE1OMIu/8QzdqBcjrZmbawbB51mYUWpl47BJWPV118
X-Gm-Gg: AYBFou3hXry7HJrrLlPJ/lRzl3WUKY/dKtqopUS/ggGq7dJE4jnNzA52vpCtagNgAwD
	2po5uG2QHN4Gl7M/EkaZirh7JKVzgT91EvoEOdEV8MbC3IZ4RmBRiQxOYg4cl0AKcv8UGYSLeTr
	fDIfGEDwYV21mbNEiHGEguoiZM9i4u/sKCe9Po8W5i+fQxrD2i6u8Yqb1IgDslD3pA3x+MK2YQh
	+dzFzXDn711G6dzdPVQt+tLFqrXOXaFm8bFPoOfofJ5pzVqzPHRqM+ONA1kv66yqUHQIzztKuBp
	k8YFoxv662xbRShhZrP8R40MDycJX+APjLCJDf7iL5K7lAG2vR2j/dMAYjT2BN6GPA2KkroXybU
	UMp7YXgGuqyc2K+X9zcOslmC54gOTlov7CHfD2TdHg1LsHnUwPKyx94o4av89SiGXet6RCLQgG+
	7CQ7usCHUE45a5IY7DxlqlTs9fVl6iN7b2xtgtGQ5j5EekipNUmQh/W3HTxCmh/a5VbIdgJN0ha
	6V5VdtoVQBWc+tTTgjjfUcpI5kNpTwa4/zsCLV2ok6O4P6RJMr4kcQg
X-Received: by 2002:a05:600c:6215:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a18e4ca157mr109610335e9.22.1791723836253;
        Sun, 11 Oct 2026 06:03:56 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm243456455e9.7.2026.10.11.06.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:54 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Sun, 11 Oct 2026 15:03:43 +0200
Message-ID: <RqVLVgMZQZCOx29YUhhdJQ@gmail.com>
In-Reply-To: <20261010130024.177503-14-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-14-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartayMeA89TTDyMHsX0IsJQmw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_060358_417226_B9E743A5 
X-CRM114-Status: GOOD (  14.33  )
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

--nextPartayMeA89TTDyMHsX0IsJQmw
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Sun, 11 Oct 2026 15:03:43 +0200
Message-ID: <RqVLVgMZQZCOx29YUhhdJQ@gmail.com>
In-Reply-To: <20261010130024.177503-14-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi,

I can't say much about the substance of this patch as I haven't dealt with=
=20
PCIe before. What follows are just some gut feeling comments:

Am Samstag, 10. Oktober 2026, 14:59:51 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb=20
Navid Ghahremani:
> +static int zx279128s_pcie_init_crm(struct zx279128s_pcie *pcie)
> +{
=2E..
> +       /* Ungate the clocks */
> +       ret =3D regmap_write_bits(crm2, CRM2_CLK, port->clk_on, port->clk=
_on);
> +       if (ret)
> +               return ret;
> +       fsleep(50);

If this is a clock control it would be better to write a clock driver that=
=20
manages the crm2 region and exposes a proper clock handle.

=46or the phy parts that are part of topcrm: drivers/phy has PCIe PHY drive=
rs.=20
Maybe one of them happens to match the hardware registers, although that is=
=20
unlikely given that the registers are inside topcrm. Either way adding #phy-
cells to topcrm and isolating the phy controls in a phy driver would be bet=
ter=20
than having these two syscon controls.

By and large the zx279128s_pcie_init_crm has a bad code smell: It looks lik=
e=20
an LLM translation of ZTE's code to me without understanding what the=20
registers actually do.

--nextPartayMeA89TTDyMHsX0IsJQmw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrLiS8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiSIgP/2QBvIWwIVHmKwhmCg1p
GNxlKYheuEN95hM+/16s9Z2ZB19AJOH7rqbpRDkBHcnbRm9R+LVJmnbgDpd/wdis
F9ISmIuQA3MqqlCnUcqDQtFnAELUsxTgyk84j6Bzf0j6un4ch5bkycPs9QJvWLpW
9zsbHJzNhf//uv5WrtHBvO+vPTcJeSWtHr9/MjAIAgPQQiFsVWZ45xOeEaR5mApj
DbwtuBM2gkPdgGZ94rSLawNd/MklkWQOWWOrQf0qb6jyOVmPA0IU54uKUeCaStVH
xMmJ1nu8EBEvzyV8v1WlG3HjonSPc/SQRLv3IBD8cBKFFvnROuiXGvk70aLVg84F
tgFyWcjvrTQ61+aCnd/Yf1bFLKtwnMIjv/eMpUtceiZWwn0XYGlgCKnsW7omre47
71gTg5e8HGHR3wAfBpNLXlxPTREBzQQ7bP+MNbHFdbuilqat9yIWLjEruwUWP5DP
+a+SoFZOWXF+6RtdgaKBaE9HxI8YLaaHjcPDKLVxT5HPKGwu17MO9zuoFAMEtH+6
zosoJ3ZYNXiZp2LIBpJ3UERoHzqERgqAp8tSXaHFyGABlVav+fItIz+YLCw5DVjz
8T4drjN/zl2lJCJj22+ywIo4CNhkRZOvJ/FMUgwPIcRUy2wajkOHWsRTatDa+RxT
nfxS2kfTtdCAjzhnXAtEZti/
=+Ytg
-----END PGP SIGNATURE-----

--nextPartayMeA89TTDyMHsX0IsJQmw--




