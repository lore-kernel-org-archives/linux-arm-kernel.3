Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A46FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 13:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qK8eJ72oUfZkFBOw+tTcLnGpMzZXzfZ2mLBjQdYOmks=; b=rwOpaSRRXKaU6KNkzlBhnCpt86
	erbPuJHZ/WTjBoOYkP6Sxxk0xBylVAwO0PypbVU9rnztYHvnm0xswPY2JGsHajrvo21VEyZHlNkVR
	1D5bmdR7+WWItlR0qkfyuebZceYwuWJkykMEh/BprZ0Ik20wh4KbVxo9xKUjW8fuQvJ97KIP5Cy6t
	WicWNrFeMUDqy3Vnady/xV44qWkAFIZfFVQ9SLmBUDPKSYn8ZlESLIbnYhs2epTmeHDJJdALrm1Jd
	HVDnP1JJqVMFBsbeixQ/4/v4tMoKcrYrD5iUuk1ZrN26AmFyBmUWDXtaSlhRgnok+dX/+04wRDmuZ
	6SLNp4kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhKo-00000008ZLN-3aVy;
	Tue, 14 Jan 2025 13:51:58 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhJZ-00000008ZFG-2CCB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 13:50:42 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaeecbb7309so1034483766b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 05:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1736862639; x=1737467439; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qK8eJ72oUfZkFBOw+tTcLnGpMzZXzfZ2mLBjQdYOmks=;
        b=wqHOC2jnguDvYdsD39Tmwgq4Gn9SU3a57q22lHZjZahbL2F9I3JWRt9tPnCgdsrZdm
         ZMr0dSBV6Jyf5gs+KdUzUsOq4M8NRE2P2EjcRsfdrpbwSCzvpseN8WYUB6A8lqbdwBe7
         kSEs4SuNpK5CkF+hahuubm3OvXNZucmn49WqwEjaKu15F3qtFQkBAcWOXUPbA5Mv/qPZ
         0ihnL+ipcRgdCOJtLW6puFJeVA62CP9B8BRRC+TB4knfAe8FKmQjtv4AGw+txjo3kgth
         /LLjuwTA8oA1lhRnKkKP75erlI/jFyn0VNnS58LLRvYIvV/dOQnB6y4Yokb0HcnGlH0f
         7oQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736862639; x=1737467439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qK8eJ72oUfZkFBOw+tTcLnGpMzZXzfZ2mLBjQdYOmks=;
        b=P16WqsX8iCtE2Kbk87AnbKHaDfEvE7Az1OXQNgpy4jziTfAj0AW2Vx76U7iJuzrgcd
         2LYXKHXh9kos+aMnwXzoZoYuwuHvc3paK6CXbP5WApKk/mku5/Z2zSAOb0deeEA9yEpl
         Db2lhO+f96GFfNHLeAcHMZUYXul3j/O7fiUbWlTLQvvjFZEwN1bihV8cCO71a8XKyIjp
         fRk6h/yGWXnvdzgbgwB7Mq/wpyQadCSHMGyVHWZI8jf6Ktzy4Mv4gEgd7Vs7nkEhJ70I
         GaBuboPKqx9ReVYQFSxQTTYqiBG5nqtUbL7Sf2MjAL2VDNcK1UM/V3CVUTR299t8Fsbh
         vtFg==
X-Forwarded-Encrypted: i=1; AJvYcCV0kVWbLBPl8L6xtkADqACAonvYnO40xQ7XztdI8NHKzRRYXYKtwFyp4y5zHWlcBcnR7LAftA1t2g6D5VOVuC46@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl2G5Pg+PhidReWY2bpuIMpGQPUITNYU0LD8Y+qy/dcPji+GUL
	WsGBMCfpF6hYvUqr129WLikRJ/iT93zFtz2vQUwko53rizfhfd1cP0nkbDj+T6+0JkXQmK8f/VI
	1bCMH+it7v+iOrspnKCp2JUrrPPvV2RFsklY=
X-Gm-Gg: ASbGnctQp7hYOSABhJ0SN5T37flOmoXH09qIvLu5HbBBcOiHVVY4kkXWdXVGArOdBay
	pnTOryVKzUeatOx+Qcu8rF2pg/qUnGxdp1/gfeO+ZV2qMQnORETnvOyln2a3A9m7hRgDTGvQ=
X-Google-Smtp-Source: AGHT+IF46TQhtbMMZMIZCKwTcvvfKRkqdMf4+iusbVX+iTYMmw+SknyG/9KNTOsKRbNl7xnQQq1VrKvxMWJ1gHVadbI=
X-Received: by 2002:a17:907:3d89:b0:aac:1ff1:d33d with SMTP id
 a640c23a62f3a-ab2ab740dd9mr2228481666b.30.1736862639349; Tue, 14 Jan 2025
 05:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20241121071325.2148854-1-iwamatsu@nigauri.org>
In-Reply-To: <20241121071325.2148854-1-iwamatsu@nigauri.org>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Tue, 14 Jan 2025 22:50:13 +0900
X-Gm-Features: AbW1kvYfwvDX59DGr73TkVKQWrZUOAfV-Cykp2gPV41y5Dp3jhO_fwHVhjZEQuo
Message-ID: <CABMQnVJVTmnsx3RNYK01ikZ-jnn_y4pbrNAeZaKPzz0N_YFz5g@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY address
To: dinguyen@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_055041_559942_6D2A7998 
X-CRM114-Status: GOOD (  16.44  )
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

Could you check and apply this patch?

Thanks,
  Nobuhiro

2024=E5=B9=B411=E6=9C=8821=E6=97=A5(=E6=9C=A8) 16:13 Nobuhiro Iwamatsu <iwa=
matsu@nigauri.org>:
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
> mdio bus. Also the PHY address connected to this board is 4. Therefore,
> change to 4.
>
> Cc: stable@vger.kernel.org # 6.3+
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  v2: Update commit message from 'ID' to 'address'.
>      Drop Fixes tag, because that commit is not the cause.
>
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

