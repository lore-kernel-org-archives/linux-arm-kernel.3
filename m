Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DD0CCA463
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 05:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NQoVsKz0LnNjJ4rVcBhJaqVhtFod/04Q9AhzSfJg/Y=; b=v7HrskaKdKwx7kkOac/YwvttdJ
	DgkKegKs1pKCFITbDFu66ReVWVEFmxbpA/Glwu+PCdQlCXSDUaisSZz+IfUSs60CNNfSM2dFAaDfR
	8H0/A6HK7V9RW61CeYAG8R4ly/IY8x6QUjDVAt6MngTt07gg/h5ODIdMEnrz0wwIg7YC811QHUyZ8
	7d1dt2+QTvKMjxpbXFlG+I7B71yTd/WELsoy8e1NZsyd9oXLj26aG9PtlS19FJj5K+UzXBJ1hcJtE
	LGpo7o9MWEZfJdAdFkrOCrVGG9hF0qs4++aKF6sbbXKXi4fePtrEJNVFecw8LuALJtJApk/syyMMc
	XGmbYJ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxKw-00000004TFi-1OVV;
	Sat, 17 Oct 2026 05:52:06 +0000
Received: from mail-ed2-x04.google.com ([2a00:1450:4864:33::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxKt-00000004TEi-0GOk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 05:52:04 +0000
Received: by mail-ed2-x04.google.com with SMTP id 4fb4d7f45d1cf-6afe183a704so201546a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 22:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792216321; cv=none;
        d=google.com; s=arc-20260327;
        b=XmBFqoda0/B8Ks+yEpZhA+9gzdvyMlUbs8f2ttY54acx9xgHjjntAGcxKMRWjqW1Rr
         6gW9vHUUkRts8PbGBBZVUgLcSd5hTNWtIwgzG25NtMnIPyPopOonbumeq6r7HGmFHG9q
         tcYREHYwqX+Zp02/oY5UfKcgluJ9arbQEwJGOKelL1LGt9GqmFQj9JOdJ4sSnX70k/we
         J2FwSDcTqKv38IGBnIbvIN3GG9GA9GVAm4KJ7DSdl4HEo7ugaQ9FN61uYAB1QG0iOEt3
         4Y6KTaZVH0kWNNeIgPXjuU0hwWcb5rRIEpYTj66TaFkU/6qK9nwpCD+u6yOR4KvElBCb
         R5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1NQoVsKz0LnNjJ4rVcBhJaqVhtFod/04Q9AhzSfJg/Y=;
        fh=ICfbZqqzVtKXINJ9djAoIJPC8C0u2osmpqgq0KgClac=;
        b=o6b/i1rAJp8WGRbqJn7yTOxM3sn2CEYKhECSfrFP4635irrsBhPJp4o3XIdYz3p4vN
         5X0d6JuhmRxLgW0q5QA9oowJTwwWK/g6IycTFgn+2jciihAN/zV+7w0WByiJirO0QQMC
         pyJyIRNrb0O6ZMBRAVuof28wSOtV5P4M4lAkWA50grn7mALvmk8yZM5Yx0aG3GqNJxdN
         263fAHt93IFQS75F5mmYH6Df2AWHPpcURVgvsE4z+qbMC7XouDde0kG4B2mU1j/N4Lq2
         uFbiUObVTZpEZco0y+u9xit9azhVf4nl2f5AOKw67dyyzppbtHbWjqB4eJYJQhTWeINj
         lv7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216321; x=1792821121; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1NQoVsKz0LnNjJ4rVcBhJaqVhtFod/04Q9AhzSfJg/Y=;
        b=Di5fzN6uGnbITvngAV6lcNhNGiFfplDafIuxrzlTbp+mP+CgTb4WI3UxGaK+XO/x7z
         pRUzoFzNQ3ZDPUCnuehMPBUKlnhxLek9rGyrt7ADhRaQ6uRM3Km06ctGhX3hGSNyMDFp
         mazC/IoTkdOQldKu44rE+Kzs10hGQxi3qy5CnhSpO5GeoVu+cdGklk52U/v7s1L8fObT
         xnGrTIMNbZoT7VuiBuAzoPE8PpqhJLoOBsos36zfHgYRCsjJt8Jtrq6RECJgAKnn4P4U
         rnIVXRZorkptwvuXdAXBVcCb96TX1YhBivSAYe45PHPGjNgdBCFmBzsVORaPPLCef7Ro
         YM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216321; x=1792821121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NQoVsKz0LnNjJ4rVcBhJaqVhtFod/04Q9AhzSfJg/Y=;
        b=B4GSKPsWnPos3Yx2WDtTavx8ZdyiYvsiSGj4rhZNrWEx1Wb5h1zJplMqikerLqIfMc
         IYi5REQAuFB5QhyR7f3pRbwWYXoocqTcTbWXV1T1xjS7E4byZmpNscWEYS9fFgsXiGmN
         W7t1zp2CJWPbbCbz+l26oy7c5BM6b5OB3fVQa+R/MGaNe+kyhP0xf1YASQZbFQgjh4iO
         lhDgkJCBUKcgDoNwFowTSQiPIrg3gCCWkjruepAUvZUM9J01Evk6rcf6AoU1Lychyssk
         6pesrhWa5R7HZOtyvROCJW1hHW72IkGSN+69AHJmXqkp6nY3rD7D8013Yr4zvKBroKHq
         iv1g==
X-Forwarded-Encrypted: i=1; AKwUvBzdsgEhlZmJDVhlu2H0KDtIzf7XNW1seCX896Q1HK3n9DY9i3DaLWL6JAi0Uhu5HUL2qNGKVZ5dV+khhf8vKVH+@lists.infradead.org
X-Gm-Message-State: AFq9FYKvohox7d5PvTiS4ziUGL2jQK+hGhmxY3zygAvO6xNQn4y1u9fQ
	vR8l2kEF4wZkfc/iTLNoubVatLX5vlDyUkXRcVV5qh/akP/OvWPvb8kMmNw7ZLY0eboRM+fElJD
	Ha7AF+tw2Q47+o5DxOubXeq3JfaoQ7Fc=
X-Gm-Gg: AYBFou2h/TCmdZzRXu5pM1DILa4ZA6ubkhPuzv/6kMI6HHI+/IHqq7lDY9Oud2ykyxB
	Ncul3Sn2uc98/xyCF1QRwfdUn+JPGHJdyOAN8h7lfqwvL7DCZLNMZKo1RULE5H7bIPTTaZzojS0
	LRw0aDHrMw3Ld52HiUtc/PzDDTs5qg/5xtLjWrD8jjcL0rZpZ3vbvt2S2RxLsLDsm3NMACE4lRL
	daw5ECQK4mQFHYWOqIOwabGWxgWhpiSV7m8vsh7Z8LScrKA9uWBTNV+zqCdnctUScatpmh2e4wq
	0wdkQo/6DbdaqGuHQEVOVLC+AaJGzpTVFNkKD/qXW052xF7wIGGVUXvssQ==
X-Received: by 2002:a17:907:930e:b0:c31:8c48:e18b with SMTP id
 a640c23a62f3a-c419df3d9e2mr123713166b.14.1792216320815; Fri, 16 Oct 2026
 22:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20261008175225.3375274-1-coiaprant@gmail.com> <20261008175225.3375274-4-coiaprant@gmail.com>
 <20261016163709.00cc7c12@kernel.org>
In-Reply-To: <20261016163709.00cc7c12@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sat, 17 Oct 2026 13:51:48 +0800
X-Gm-Features: AclHuK9gR2DkSi4xw_m2fA1Jz76Zlk0PlqVhdG4GFOV5ZHbiAG1eg9HG8sAydCI
Message-ID: <CALj3r0jc4GECe=Dp_gngTsVL03YmXhAt+BSQJei4QRrwLRrerA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 3/6] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	David Wu <david.wu@rock-chips.com>, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_225203_151929_8EF71C0F 
X-CRM114-Status: GOOD (  14.58  )
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

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8817=E6=97=
=A5=E5=91=A8=E5=85=AD 07:37=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri,  9 Oct 2026 01:51:57 +0800 Coia Prant wrote:
> > +config PCS_XPCS_PLATFORM
> > +     tristate "Generic XPCS controller support"
> > +     default PCS_XPCS
>
> Why the default? Surely there are platforms with PCS_XPCS enabled
> which work today =3D=3D don't care about the new code?
>
> Linus is known to hate _any_ new symbols defaulting to enabled
> on olddefconfig.
>
> > +     help
> > +       Generic DWXPCS driver for platforms that don't require any
> > +       platform specific code to function or is using platform
> > +       data for setup.
> > +
> > +       If you have a controller with this interface, say Y or M here.
> > +
> > +config PCS_XPCS_ROCKCHIP
> > +     tristate "Rockchip XPCS controller support"
> > +     default ARCH_ROCKCHIP
>
> Same here.
>

Thanks, both defaults are dropped in v12:

- PCS_XPCS_PLATFORM no longer defaults to PCS_XPCS. There is no
  in-tree user of the generic snps,dw-xpcs glue that needs it selected
  by default, so platforms that need it select it explicitly.

- PCS_XPCS_ROCKCHIP no longer defaults to ARCH_ROCKCHIP. DWMAC_ROCKCHIP
  already selects it.

Link: https://lore.kernel.org/all/20261017054406.1828061-1-coiaprant@gmail.=
com/T/#t

- Coia

