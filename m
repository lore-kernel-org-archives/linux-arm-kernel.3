Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B68FCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 09:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XB3+EZyHStMbJWyfu9oUjul9eDNETGU8O8plme6nr8=; b=ukthChAxksVbkBE7YNyJzRVorV
	tUTpGtjfFXc3DCSMRvwlrwGDMcHLTr2W1R7Vijme4GDLsGgnfCqV3BxtK04+kdMztCMYK7poZ3b4K
	lr+6c0VjJgo9MZ63HNb8APyVvGhW7mmfVQTf8+2Tn3akjz2toP8Wv8ApZTr70+nTrekQB9/lZtvnt
	FHYyK8RB6C5HKJcG4VLsh4gg/HdnPku8Lu8zAgGfOsIxGnpUvk1+G/5sDbqzTWEDFWvwYPtz+N6pJ
	TMHjCZz/Hhva1KrcbodJEMv9x+L82941KmxNEjGShN7obtP2qW/TxXI1qN3bhT3hg9NTAlyy4ydG5
	9GHBiQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBjd-0000000APtg-3zDB;
	Sun, 07 Sep 2025 09:30:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBgt-0000000APGG-2D28
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 09:28:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso28901645e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757237285; x=1757842085; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7XB3+EZyHStMbJWyfu9oUjul9eDNETGU8O8plme6nr8=;
        b=cMaMZi2ZWX2hIhLr0szriNgiT4eCKM1RLy9FJFTeFiE03oIFzgpxEN/pbNIq7NaTrs
         p3zo/2r1x1cGIzdW03AE1mVvcU2SSQloxnjXfaX/V1IHJ7wylGKPnoRapfHKi4L3ZWEl
         sQsnPsgjHb3zJ3aF17Lv3oGlPEorynds2lZtU5wqwN4fAxw7FfV6gwCpk5WQx1hFFd9j
         KSS5mEhIOThybqitJUIkmIrqkS7kuuabQbTog+C0jCmYoO43VPexPJwHRup4VqeHTwcb
         g9VZiABFgLa+gOyhEFOsM3mKzPoMLI74l0VvATq3FFXK9euQ6J7ODNv2CS9l3voMtFBZ
         9TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757237285; x=1757842085;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7XB3+EZyHStMbJWyfu9oUjul9eDNETGU8O8plme6nr8=;
        b=f6huuurVt1LjCINKUbYQoNWQ5yuGfsHbh7C51mq2gfdVN89+UAvbE2F/TZg/sAQxvn
         O23Dsx1wUjHj8LimBriT5HAhSezwGA2210LJtEqaXL5XBfa+413I8A4eHpnve1kTnJDR
         IDBBfTwtW3aBDJg6aZhykPzKJ4e7G0qoeHJYQgptP1CZ6Ekr2S977eaGq0/KAy2Clmeu
         SEfC4kpoKhpLaO8TkO5xdbTbsZrVHtQ/EjBqDt/X/93D9WhFTbo0jLgx+38ZyXfE/ktf
         UrZJuoJdkO33sVpLTmL1RE99+DGbdp47pf2F/B9jw+0a2yQQJbPSzKAwvrphBZB3oPP7
         0ySQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwb9h4ypweDuJRcBEtIXqr8kPb4q1LrQblCSt/o/gbKgrVCq4kDHQKo4WJd2GnechTLr0Qj3IWnqYxrEee+Az4@lists.infradead.org
X-Gm-Message-State: AOJu0YwBYP9AjFzGEuQT0zBtQWFqnJOUX1r3aN3HoT5dFYiosbxuMo3G
	Uvr2QcdWb4GpZSHxlYghxrYCBdjG9PYG25dZJp4VHG+r48j1zpMvGgbZ
X-Gm-Gg: ASbGncven3a8PwKKItyKZ2N3fn0U7AaWfpYnaKzzUSs5oXOaZdmxkbfwWmaoDmfx+JU
	3TrZlM5rI3Xq1LJJBx0FAisCvDPaz5H37ITwK3V+Wv5GeRlpKAC9iElzhTj9tyOTpJD3HJJBdkc
	33znC4reYoMpgLItbJvXByN0h1oEoEJB2qZyDqT0N/X6VIVWKA7d4YttnwzsM5T3kabIXViCFxD
	x5FIJwyM30IyXfBFWTBdRurveYUBDusd2jWn4B4mZsDAYDgf4Wy5HjtONW/qIwKJD5WA4TNmRPy
	rgQ+8lFpV8Aw30EQ3pNVBUEEh6Ds118NK4nZ0DfDsM4QqNPKow+veMw8EcnRY4owvSCbdELhB2z
	Nj4oENjgmpixsW2rFW+Ves5M1NGuK9SrdaaGRx9D4QD/hvxHoJoJCZL29PVVrdXXE
X-Google-Smtp-Source: AGHT+IFQqN1xdf8yX2rXwR72QToKnSI/WjPbg116r2WIKGc/6EtoIOWfniY52wX2yGeNBiMugvz2yw==
X-Received: by 2002:a05:600c:1548:b0:45b:88d6:8ddb with SMTP id 5b1f17b1804b1-45dddf0234emr35756295e9.37.1757237285381;
        Sun, 07 Sep 2025 02:28:05 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:267e:37:6a88:3fc5? ([2a02:168:6806:0:267e:37:6a88:3fc5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e74893acecsm45931f8f.36.2025.09.07.02.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:28:04 -0700 (PDT)
Message-ID: <34a23816bf125c577a03ba68f251e7a77db9805b.camel@gmail.com>
Subject: Re: [PATCH] PCI: mvebu: Fix the use of the for_each_of_range()
 iterator
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Jan Palus <jpalus@fastmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pali
 =?ISO-8859-1?Q?Roh=E1r?=	 <pali@kernel.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	
 <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
Date: Sun, 07 Sep 2025 11:28:04 +0200
In-Reply-To: <hiu2ouj4f7zak2ovtwtigf6fylz4c7fdyyqiqezsddoouzr4n5@bfs7kudjfnp5>
References: <20250902151543.147439-1-klaus.kudielka@gmail.com>
	 <hiu2ouj4f7zak2ovtwtigf6fylz4c7fdyyqiqezsddoouzr4n5@bfs7kudjfnp5>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+b1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_022807_568439_0CE7F19B 
X-CRM114-Status: GOOD (  18.15  )
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

On Wed, 2025-09-03 at 14:44 +0200, Jan Palus wrote:
>=20
> Thanks for the patch Klaus! While it does improve situation we're not
> quite there yet. It appears that what used to be stored in `cpuaddr` var
> is also very different from `range.cpu_addr` value so the results
> in both `*tgt` and `*attr` are both wrong.
>=20
> Previously `cpuaddr` had a value like ie 0x8e8000000000000 or
> 0x4d0000000000000. Now `range.cpu_addr` is always 0xffffffffffffffff.
> Luckily what used to be stored in `cpuaddr`:
>=20
> u64 cpuaddr =3D of_read_number(range + na, pna)
>=20
> appears to be stored in range.pci_bus_addr now. I can't make any
> informed comment about this discrepancy however I can confirm following
> change (in addition to your patch) makes mvebu driver work again (or at
> least like it used to work in 6.15, it still needs Pali's patches to
> have some devices working):
>=20
> -			*tgt =3D DT_CPUADDR_TO_TARGET(range.cpu_addr);
> -			*attr =3D DT_CPUADDR_TO_ATTR(range.cpu_addr);
> +			*tgt =3D DT_CPUADDR_TO_TARGET(range.parent_bus_addr);
> +			*attr =3D DT_CPUADDR_TO_ATTR(range.parent_bus_addr);


Oh well, a CPU address that is not a CPU address....

Looking again at of_range_parser_one() - which I assume to be "correct" her=
e:

	range->flags =3D parser->bus->get_flags(parser->range);

	range->bus_addr =3D of_read_number(parser->range + busflag_na, na - busfla=
g_na);

	if (parser->dma)
		range->cpu_addr =3D of_translate_dma_address(parser->node,
				parser->range + na);
	else
		range->cpu_addr =3D of_translate_address(parser->node,
				parser->range + na);

	range->parent_bus_addr =3D of_read_number(parser->range + na, parser->pna)=
;

Indeed, range.cpu_addr is a translated version of range.parent_bus_addr, an=
d does
not seem to be relevant to pci-mvebu.

The driver previously interpreted the raw part of the "/soc/pcie/ranges" re=
source
(storing it in a local variable called cpuaddr).

To restore the behavior completely, we thus can use range.parent_bus_addr -=
--
confirming your test.

I'll prepare a patch version 2, including this second fix.

