Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B3BC71143
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELcPuvNKLZu6Ryw5rajS8NLZ+N5vs8CjzH8DFZ2k5qY=; b=dmTqI/u1r2aRwq75F8OSAE8ZBR
	9Ws6DuSlBsBYXeGupOr2s/2ctoRWxYPel323B2PgaEY4/ntAiqHn4J4V4Nsft7eFuTE5o6kuikNGg
	m1zYX/kiBNJ+k7LGdWQYQkxn18QNmsQ1r7SqMIFBeHSnEmdVmQgjkppE9z0SLfyz2b3Rh/4vqrKah
	gL2fp2oogh/DDU1/dyHIWIkUYCFfKaSkcaIEV0/9lPkuygpHQnHCtv7IvFiu0naBA39L7YRmc8nic
	+rkwMP9j6CK2evAZdUKFmG59oudcSRHKHIJodPSclT9J1ogktP6ohROICADwpxgIuvLT6PVw54quG
	AiKuKNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhpX-0000000DMQp-1FdL;
	Thu, 12 Jun 2025 13:18:55 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPf4t-0000000CxnG-0kkm;
	Thu, 12 Jun 2025 10:22:36 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso1416148a12.1;
        Thu, 12 Jun 2025 03:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749723753; x=1750328553; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELcPuvNKLZu6Ryw5rajS8NLZ+N5vs8CjzH8DFZ2k5qY=;
        b=VaW+o+5WDmlEPHSTfwHmWR3V1fj8UnInGhB/HgxYVB6fCjSSxtA49hTilGQf8w06av
         5eOO006XcpQlx4nkb2+bVrPtuwPxA0h6IF2SXQF5QdUq1QrIW4cZC62YisjoMjyRcvNH
         NfU//yq7Afmivj8mHHVBHteWWk0AqTLh4vwwzPhJ2V/0cH0zy3ANJoLfDc1yXo/mC3c+
         KWK3t2UYdht8d8EjN1BQ6o78u9hywdSRqLpXh7AMUgIB/QqTzKvFg6eYwK39wTWBtaCY
         ilcFE91WFbaE0s0SQI+fvkBCjHpoyQmpuMYiMXImI6oSG41zF9D8NOuUuxp4QleNLHBj
         vGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749723753; x=1750328553;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELcPuvNKLZu6Ryw5rajS8NLZ+N5vs8CjzH8DFZ2k5qY=;
        b=miCwyNXJ3HhKkSPKDgW7rXUrjZt9hJUABT/R8zxQu+kqGxlBSO0j7hFcdMZKm4xFB9
         kq46XEMcj5nGk2Lbx62hT3CKLFwyKCfJLWN0R/7b9xQa/ob4QP4ZfO9SKDbsgbXIIeCZ
         L+TeNCIdm4UfzxFJ7OVDTlg/dJu6zJGSQcoYmT/XFkRI0smwogWlt4C6nEMGH5Pvzyag
         L9h0+dO+NOPRmvPkjCi0BoMOFCRqmCf7GobbT5xCS9iRS0KnRnoeUoEFqvTzW4dD3xdj
         JV85B3NwyuD8aB9vefu+fGnxkxi0HngOEGCXm8DBCiJD/tdfPjaXTSyuID8zAKd835QT
         CCoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO5lWJZUmkqK3L0UDSI/tPTql69mXsXQZpen21zSBl84WyO573g4/KoRzp82oGgrSpwa+8L0utffJHnteWfEQ=@lists.infradead.org, AJvYcCVzKwNp7ECcBF9dpMyZ7+6X/IbX//Xim5PZeenQPOeXMBHjs5he5RtPW9x8absH1k2G1mGDsoti5Wnjbgo8nZRP@lists.infradead.org
X-Gm-Message-State: AOJu0YxHRePTerHZCSOtln94yUyx1rpkbP2/cUGAcW5V02XJOZdy6Kzr
	nZS+2vhsoi166SUtFFefF6nq3KNDJv0F7kzJQDlLunNJriuj03Lt6Bgd
X-Gm-Gg: ASbGnctg6AISAVTh9DbNUcd1INuMSxqTUTLMM1GwD/vEr556jJsPAMr8H1UZaDipyxb
	cODkVYAKMXnWBUIY41CC/ivcwhIrioM2EFW3RJYTv2poaL7FxiJSOAqwstZwwCIYGsAb1tN3N6N
	FEZEW14Uz8xWMPOKsj23qSDpkB71wQJnSJmjywAJ4vGXzaKLYHAtQ+3NwyirWyJrWrz649ICTnO
	f6IKovJgqPsqMRhHCeNlM5g8XDr9yXBHVPgiQtU04uG1A0jYYIZaBAAzZ4lCEXdFY5ATO+Ffbxh
	kB8lUCbGEpJAiiFxeMFGf+TL1sWKsc/6HdKu3Y5y8+NbsS4726L1cnkro533X39egDaosLXMSI1
	w1fS+8LdcRg==
X-Google-Smtp-Source: AGHT+IE0/bTYEFCNhrQjD7YEJLFi+GzwBTgnJRxUstfNcaX5VD81i0FvmEvIypNuTLGINT6BjMUjbg==
X-Received: by 2002:a05:6402:40c5:b0:607:f431:33f4 with SMTP id 4fb4d7f45d1cf-6086b2a46c4mr1919282a12.16.1749723753038;
        Thu, 12 Jun 2025 03:22:33 -0700 (PDT)
Received: from smtpclient.apple ([89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6086a551a2esm939584a12.1.2025.06.12.03.22.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Jun 2025 03:22:32 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add HDMI PHY PLL clock source
 to VOP2 on rk3576
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250612-rk3576-hdmitx-fix-v1-3-4b11007d8675@collabora.com>
Date: Thu, 12 Jun 2025 12:22:19 +0200
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com,
 Andy Yan <andyshrk@163.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <01D5D2D8-392B-4926-884E-1A4FB87C03CF@gmail.com>
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
 <20250612-rk3576-hdmitx-fix-v1-3-4b11007d8675@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_032235_216975_35E47D6A 
X-CRM114-Status: GOOD (  20.56  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Cristian Ciocaltea =
<cristian.ciocaltea@collabora.com> w dniu 11 cze 2025, o godz. 23:47:
>=20
> Since commit c871a311edf0 ("phy: rockchip: samsung-hdptx: Setup TMDS
> char rate via phy_configure_opts_hdmi"), the workaround of passing the
> rate from DW HDMI QP bridge driver via phy_set_bus_width() became
> partially broken, as it cannot reliably handle mode switches anymore.
>=20
> Attempting to fix this up at PHY level would not only introduce
> additional hacks, but it would also fail to adequately resolve the
> display issues that are a consequence of the system CRU limitations.
>=20
> Instead, proceed with the solution already implemented for RK3588: =
make
> use of the HDMI PHY PLL as a better suited DCLK source for VOP2. This
> will not only address the aforementioned problem, but it should also
> facilitate the proper operation of display modes up to 4K@60Hz.
>=20
> It's worth noting that anything above 4K@30Hz still requires high TMDS
> clock ratio and scrambling support, which hasn't been mainlined yet.
>=20
> Fixes: d74b842cab08 ("arm64: dts: rockchip: Add vop for rk3576")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi =
b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index =
6a13fe0c3513fb2ff7cd535aa70e3386c37696e4..b1ac23035dd789f0478bf10c78c74ef1=
67d94904 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1155,12 +1155,14 @@ vop: vop@27d00000 {
> <&cru HCLK_VOP>,
> <&cru DCLK_VP0>,
> <&cru DCLK_VP1>,
> - <&cru DCLK_VP2>;
> + <&cru DCLK_VP2>,
> + <&hdptxphy>;
> clock-names =3D "aclk",
>      "hclk",
>      "dclk_vp0",
>      "dclk_vp1",
> -      "dclk_vp2";
> +      "dclk_vp2",
> +      "pll_hdmiphy0";
> iommus =3D <&vop_mmu>;
> power-domains =3D <&power RK3576_PD_VOP>;
> rockchip,grf =3D <&sys_grf>;
>=20
> --=20
> 2.49.0
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

Cristian,
It fixes fractional hd modes for me on rk3576.
Thx for this fix!
 =20

