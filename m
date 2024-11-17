Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0606D68BF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 08:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAFozerT8AmWvaMiQhtVKgrLvIOoUAQYsmUVcu4V1u0=; b=k/aAb8CFNHzwxBoFhsCl/MtUNB
	LDs7/ZJcNZNWvQm2HCv18/OmgqRcsjwLC5FLbkgHGuQNZdetgGYyTLfJP4XPhH2bV0diJJijBdxXg
	dhtUq8VENk02m5RZmFU6bSbFKG9ATWZmFjeg9rc6A68Ggurxc6PWQA/uDihlThy4J1KeHl0m1L+9/
	oTz8/jH0L7mevlZ7a/YoaMRwL54GRKUSmuAvSrJXL8VLS51gEoLsuBIP6EDjMRijH45cMBxh1v+kx
	tW2mBGF6FmuPaDAENiYSwTXL8VqftxwIJmQUyzO4xNnIfYhUCACPEjxzq9xbW41a+DDkNwVwvxni1
	JBsPWylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCb3t-000000073dJ-0c3n;
	Sun, 17 Nov 2024 08:55:17 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCb2x-000000073Rc-0bVG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 08:54:20 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9ed7d8d4e0so158662866b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 Nov 2024 00:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1731833657; x=1732438457; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAFozerT8AmWvaMiQhtVKgrLvIOoUAQYsmUVcu4V1u0=;
        b=ft/nJ+gmnxK2M4804u/UoIPpVttdcS6QRu0k38ejZXvo27i7AJV6cyqsB4K+CtiD5N
         Gt8PBAhFk5ag5Mm/v3QouM7/Rg/Vt1r8lDpnmx8WymPu+XXdE+o4DpFjY0/+6xfx67DZ
         JqpIs1Nc7FwAdc4/CtIWmBZHbAKOyKw/PCKtnr5cp9Sqn9SkwucpPagE3r+4Pxm3TxRE
         3HVGRZP7+CtabWoGSQrFhojq8Y92JzUq8yfTN/vSUAl2zPEzapNqjoVIA9RhKRy7GZnb
         e1D0A7jjtO1FMxYs9Cgohgz2OqmS2hhr5Kh+vzfcgeElRkQ2HbkaLUkSFjtXcrn+fvGl
         WTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731833657; x=1732438457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAFozerT8AmWvaMiQhtVKgrLvIOoUAQYsmUVcu4V1u0=;
        b=UpX6fuSMWPpc/y+kefD603nHKP3bI/bp++puug4GmbAOKKxsDHaSmbnqpyDLhsjIS5
         +FNuBDovlHZnHd7v8452fV5Q55Qpvz+bTZ72lpvlgquQ6d7k5AUTrjEriFIw1pvyaBHP
         ISgwPAcGTNbS+1hofouF/IiUIWYO4mzjy64ZSdzT4weqI9gsglPHlEpg/Tyd57wmMewX
         i2uj48SBbz2juLVygcJV2IJj9Sp3bWoDZpeJiw6jt32QSh/59xiylA8lkNOS9PII+Wcb
         G4qEGn5CADdsLnRCuZgjEW22tzYuc+K7K6OawvMuH6JdxiDm/sykloVEmHTUM3JynMyl
         ob0A==
X-Gm-Message-State: AOJu0Yzkrt5GZxxwpCCsd5+fuGFZ5rjOg1v3Yfmd/Py4zpLa+p09KsZz
	ZFydkPkleLjlg1QAu6VKHMpqxjaOeXl/E5Dz+JntOcv3gtKZD4F0YolGJuqstXU/RGsKR34o9Sl
	GGz5ZjNXasaE0xrAEfOyyuV2R0/+KD6uSQLU=
X-Google-Smtp-Source: AGHT+IH9A6EZKAlNlaThpg9AAuD/cbmV9VJvtt/bhTQvVCtVUAtunC0O/fpyJLc/etjVvqahiNW3SCx3U6/D6U7BbUI=
X-Received: by 2002:a17:907:3f98:b0:a9e:d539:86c4 with SMTP id
 a640c23a62f3a-aa4833f41cdmr702610266b.9.1731833657034; Sun, 17 Nov 2024
 00:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20241004061541.1666280-1-nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20241004061541.1666280-1-nobuhiro1.iwamatsu@toshiba.co.jp>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Sun, 17 Nov 2024 17:53:51 +0900
Message-ID: <CABMQnVK_RUC84QQ5zb+ZpuMOZcFMNV6HzEYAfmX4bOrRm+rvTw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY ID
To: dinguyen@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_005419_385707_D9204A95 
X-CRM114-Status: GOOD (  16.01  )
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

Hi Dinh,

Please check and apply this patch?

Thanks,
  Nobuhiro

2024=E5=B9=B410=E6=9C=884=E6=97=A5(=E9=87=91) 15:16 Nobuhiro Iwamatsu <iwam=
atsu@nigauri.org>:
>
> From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
>
> On SoCFPGA/Sodia board, mdio bus cannot be probed, so the PHY cannot be
> found and the network device does not work.
>
> ```
> stmmaceth ff702000.ethernet eth0: __stmmac_open: Cannot attach to PHY (er=
ror: -19)
> ```
>
> To probe the mdio bus, add "snps,dwmac-mdio" as compatible string of the
> mdio bus. Also the PHY ID connected to this board is 4. Therefore, change
> to 4.
>
> Fixes: 8fbc10b995a5 ("net: stmmac: check fwnode for phy device before sca=
nning for phy")
> Cc: stable@vger.kernel.org # 6.3+
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts b=
/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts
> index ce0d6514eeb571..e4794ccb8e413f 100644
> --- a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts
> @@ -66,8 +66,10 @@ &gmac1 {
>         mdio0 {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
> -               phy0: ethernet-phy@0 {
> -                       reg =3D <0>;
> +               compatible =3D "snps,dwmac-mdio";
> +
> +               phy0: ethernet-phy@4 {
> +                       reg =3D <4>;
>                         rxd0-skew-ps =3D <0>;
>                         rxd1-skew-ps =3D <0>;
>                         rxd2-skew-ps =3D <0>;
> --
> 2.45.2
>


--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 32247FBB40AD1FA6

