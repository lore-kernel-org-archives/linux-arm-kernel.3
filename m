Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038B2CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 19:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHMIdxjHKuTqVD8SOr4IvDDg7ji1cX6ZfEw+vHDGWBo=; b=PiuIfgcN/CX+ksqiobEmNiAQCE
	8TbD+CBqXQXagVrNAcsyZ5ni3fDEuoHeLq1sMBq1l5hoWTZEk/0YugUYtoR95k/SWoXb5/QONsiZo
	uh9+94kheDxHecqcdl0sYnaSkWddCrn/UtKGZhmKhH3Rb8Kn9A9CPyWwYSup1Grm4K1CDJCvCTvsK
	zy7P9FM15fAUz395UI5sTkO9yDIvU/TpfIaeBGcdbVfTmeJjl9RoV7NgR4wC4CWNnx2ywt50zroeH
	Jeaz0zg3pBy38QM9jmRbuqZst+1b+vFTQL1gl3JsDMqtBtSt6gippglxxR4wzEKdi1oPdB8UKWIX7
	8ry7wLpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc5N-000000047Kb-26Kf;
	Fri, 05 Sep 2025 19:27:01 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuY7l-00000002eih-3U8u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 15:13:15 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so3727334a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 08:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1757085192; x=1757689992; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHMIdxjHKuTqVD8SOr4IvDDg7ji1cX6ZfEw+vHDGWBo=;
        b=Q+TQiIvXcSJLvMNZmRgorr4aGrCIhLTpFtDED0Y1eK/iJeE/6G7JqHCj/yYrK59kKx
         Au/96gSh3Q5Jq0tSlELlehtl4bioB/zivmlqgVFDOSGetomMddGL3tNBMmIQDXaNVIZL
         brDtGRMABS7jG8IYJxZGZYQAvyUA2oTksbZmjEyDfWwdCUN04JNU9ZBzCFFiRpFrVISq
         R9wzmASLBaHIqmpyjS43PgHJt2ulTr12bzuSKPnQhEMlUaRSjd0Ho7/cJPVNvctXpPD5
         Npmu7X1klaYrWAU95DTAKnxCxZrqZgfPDyGYedaYNvlTesB8Dkiypo3qFbCvybr+E45e
         r1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757085192; x=1757689992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHMIdxjHKuTqVD8SOr4IvDDg7ji1cX6ZfEw+vHDGWBo=;
        b=gGUnhr3Oa03qouXc4AwJFwARLsXLEMoIbUitfeO1+C7QfY+gwgZwtmeqR9FqOP/LS0
         Ym01F1phkpzOcQ+oBDHoqDKhON+0scxT/SfAeMYdme0sK+XfWUIeYwIa2IFztb3KWwbz
         Axlqtk9jrsruu6A5snxTkH9Eai3eU467yKFGe2WAGoiSthutH8uSGtV0pIQtpauovYox
         +xk/xb9PcZEj7C8CdNjud1nJVX9WlLRfAaUs4dWvbVlyBLbE6jl1NwqF4NCVcrVv1ytd
         udxpfQnlxii2L1xQd8qbwRRd0zO8S3J2RlqoIuiYKDDrhQGuuSUwcug9keqym58oSwM+
         IlPw==
X-Forwarded-Encrypted: i=1; AJvYcCXsICSSHYxk/w0dbFfcKGqClF33F5YJiydpULYvPGMhIQvf/Zv5BgGXb5ExmXmhvGydTdHyvrmaGpKUKHBEte5/@lists.infradead.org
X-Gm-Message-State: AOJu0YypRX/8QwSyjPfQYwqaEtPU3Ei9pOTXsIB7UOGhhEDGPBaKGKeQ
	3g2FdhuRnNruEl7tTy0KaOl8UJJQ+GJca5PBE/Y5ATiG795wrwg+uurx1rhNQFu/YCYFI6tnRRX
	9wBBs6wdafVihcfUVo8Si3aWSf8LF9gkZ0VbW1VU=
X-Gm-Gg: ASbGncuZD9UEtFCxbDJvi1HDyOzz79SYugKoaL/HhgYyh2usOM8WdavdFFPzt5Sjbo1
	zqKa1N+uMyaM9dX6i5TBwftipGIoKT1y9kGn56uQgSLCrMPz5DmMKiEBAuhLqetePYzlFacUmN8
	/f3LSd6YWlp96zW+vJx6Dbt8/0IpVNqHQuQcvISAamC/V3qVwdnH4F4kZAp2lcHlQglAIvSI4G
X-Google-Smtp-Source: AGHT+IE5RR3xHpHhW22PdOxC27cxpSABsoBUyfebHCL+SzRaex/Yg5PA4kv6ZoooBZkF06NN2M4yziw9mmi8ooK96Xw=
X-Received: by 2002:a05:6402:35d6:b0:61e:d34c:d1d3 with SMTP id
 4fb4d7f45d1cf-61ed34cd400mr10877470a12.19.1757085191500; Fri, 05 Sep 2025
 08:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241121071325.2148854-1-iwamatsu@nigauri.org> <CABMQnVJVTmnsx3RNYK01ikZ-jnn_y4pbrNAeZaKPzz0N_YFz5g@mail.gmail.com>
In-Reply-To: <CABMQnVJVTmnsx3RNYK01ikZ-jnn_y4pbrNAeZaKPzz0N_YFz5g@mail.gmail.com>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Sat, 6 Sep 2025 00:12:44 +0900
X-Gm-Features: Ac12FXzTX4H5emedmc2ovwKAlGVEjYg6lVwTcyicNPf8FtCjYiYPI4wGLhju7oc
Message-ID: <CABMQnVJsK3wNRQfGjomggKcwL5zaqBchoAKajbVb+ZXmrwn2iQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY address
To: dinguyen@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_081314_108932_F250E485 
X-CRM114-Status: GOOD (  19.20  )
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

ping?

2025=E5=B9=B41=E6=9C=8814=E6=97=A5(=E7=81=AB) 22:50 Nobuhiro Iwamatsu <iwam=
atsu@nigauri.org>:
>
> Hi Dinh,
>
> Could you check and apply this patch?
>
> Thanks,
>   Nobuhiro
>
> 2024=E5=B9=B411=E6=9C=8821=E6=97=A5(=E6=9C=A8) 16:13 Nobuhiro Iwamatsu <i=
wamatsu@nigauri.org>:
> >
> > On SoCFPGA/Sodia board, mdio bus cannot be probed, so the PHY cannot be
> > found and the network device does not work.
> >
> > ```
> > stmmaceth ff702000.ethernet eth0: __stmmac_open: Cannot attach to PHY (=
error: -19)
> > ```
> >
> > To probe the mdio bus, add "snps,dwmac-mdio" as compatible string of th=
e
> > mdio bus. Also the PHY address connected to this board is 4. Therefore,
> > change to 4.
> >
> > Cc: stable@vger.kernel.org # 6.3+
> > Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> > ---
> >  v2: Update commit message from 'ID' to 'address'.
> >      Drop Fixes tag, because that commit is not the cause.
> >
> >  arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts=
 b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts
> > index ce0d6514eeb571..e4794ccb8e413f 100644
> > --- a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts
> > +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts
> > @@ -66,8 +66,10 @@ &gmac1 {
> >         mdio0 {
> >                 #address-cells =3D <1>;
> >                 #size-cells =3D <0>;
> > -               phy0: ethernet-phy@0 {
> > -                       reg =3D <0>;
> > +               compatible =3D "snps,dwmac-mdio";
> > +
> > +               phy0: ethernet-phy@4 {
> > +                       reg =3D <4>;
> >                         rxd0-skew-ps =3D <0>;
> >                         rxd1-skew-ps =3D <0>;
> >                         rxd2-skew-ps =3D <0>;
> > --
> > 2.45.2
> >
>
>
> --
> Nobuhiro Iwamatsu
>    iwamatsu at {nigauri.org / debian.org / kernel.org}
>    GPG ID: 32247FBB40AD1FA6



--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 32247FBB40AD1FA6

