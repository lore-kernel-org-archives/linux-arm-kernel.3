Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF95C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 07:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EeUMDc2WntfI8A+x14TyU5FunBo17nAG01EM1yXferM=; b=H8DKepUb3rvh4OwhU3nFIZrdEh
	OaPwxW878Xjk5DyMcjz1W4ZMpEysycAkNKVFOlknFPi4+RiEsk6Tu9v3VMVRXT7uwGEvU3tRgQ7Z5
	IO3UM0wBPq9yqN1VNaDqFpPgVTsVnuBWeVVvaviXQsFswbGAaio3trrv17HXmO5lK0b9W7ZX9SmDm
	K4N3+XrGqL2X4hxUQNCnbB7QVJqBolZ6h6vmxgxOXkFVKaCSbSyPVJD6jxuJ2ntZJ/Hozpjb/I+ta
	15f2pJcuq3Vizt2Zemrg62mqA4mUho7BynCB7TVIVqtJIJGs3rR/m78iiKSaM3PLd/vNFa/0pxMph
	pEDYYYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBzh-0000000C0jf-0CVb;
	Tue, 05 Aug 2025 07:21:57 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBof-0000000BzhD-1Kz7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 07:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1754377833; x=1785913833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EeUMDc2WntfI8A+x14TyU5FunBo17nAG01EM1yXferM=;
  b=HAJR91iBbT63tIwUg1IEeINpaQt3TLkEv41wn6oNryp8rEOwrN1t2xEi
   xDg1je1JPD18RbZjF3h0VimXtyo5eqxembw7/oNX4GTpPyGLoEgutd8xc
   XbTakK8VsaDqdvehM8qZJ5mv0I83uiguYs8d5T4HoiiujK1OpNcAWZPTZ
   USoiIeKH0/Qujl089g+ylzHRfs0/bWxIWU8SnNs5AdspGQFldRfMPriPV
   Ru2G8ILbZbuqJGLchX/k0dmwoQ01wD4wwMR6Dnw9jlQB147jcb82jH/U2
   3gksY5T7Jc511gVOWDMgKb+2Y6Squ4VhKJb6D2kVW3UbbZM3cgrQlp4l1
   Q==;
X-CSE-ConnectionGUID: 8OggMXCVRb67Yq9VaFkfPg==
X-CSE-MsgGUID: 8IVFNqAAS7ej/ExTuYvMvg==
X-IronPort-AV: E=Sophos;i="6.17,265,1747692000"; 
   d="scan'208";a="45583489"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 05 Aug 2025 09:10:30 +0200
X-CheckPoint: {6891AE67-1-D4215818-E44699D1}
X-MAIL-CPID: 2D3DFB7860E93CFACCD9674F0CED3F89_0
X-Control-Analysis: str=0001.0A00210F.6891ADD9.008C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BCE91726E2;
	Tue,  5 Aug 2025 09:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1754377826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EeUMDc2WntfI8A+x14TyU5FunBo17nAG01EM1yXferM=;
	b=glCnyA+fmdYQNcL4hjR8TMji7ODikkmnhi0R1O5XQKeNugloKyyvHZQ83XwJsYjuB6+8Ae
	1udmhwtm9IlRZMmkW5O1u4TvP2X52nDpukEcApOm7q1jggNxlhFiQhYMnuxkCUJjAVr7Vn
	tfIQBcOQ7fdpjlqABQzQMMWOql2v0VjnXLsJ2ofukHDzU+/Pw5YpmRrN/NdoFKg1UVpgJB
	yKrDxvf9s14PS8vHOXhKatmVvMjbNox2QiHoGEdtuIblD/2y4CEOtq7+KQPObM2JexudQy
	Ov1xWntFqW8YSfXdMs5lUCO5+PAVsG9gunueaE/fPDP386+Ov+rHz04r9B8CsQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: imx8mp: Add hdmi parallel audio interface node
Date: Tue, 05 Aug 2025 09:10:25 +0200
Message-ID: <1932645.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250804104722.601440-7-shengjiu.wang@nxp.com>
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-7-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_001033_686292_F65DDE0C 
X-CRM114-Status: GOOD (  13.54  )
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

Am Montag, 4. August 2025, 12:47:22 CEST schrieb Shengjiu Wang:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> Audio Subsystem to the HDMI TX Controller.
>=20
> Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.
>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  4 +++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 28 +++++++++++++++++++-

Please separate commits for SoC and board files. Thanks

Best regards,
Alexander

>  2 files changed, 31 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mp-evk.dts
> index c0cc5611048e..cc9351a5bd65 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -442,6 +442,10 @@ &flexcan2 {
>  	status =3D "disabled";/* can2 pin conflict with pdm */
>  };
> =20
> +&hdmi_pai {
> +	status =3D "okay";
> +};
> +
>  &hdmi_pvi {
>  	status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 841d155685ee..00d8474bd1b1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2066,7 +2066,7 @@ irqsteer_hdmi: interrupt-controller@32fc2000 {
> =20
>  			hdmi_pvi: display-bridge@32fc4000 {
>  				compatible =3D "fsl,imx8mp-hdmi-pvi";
> -				reg =3D <0x32fc4000 0x1000>;
> +				reg =3D <0x32fc4000 0x800>;
>  				interrupt-parent =3D <&irqsteer_hdmi>;
>  				interrupts =3D <12>;
>  				power-domains =3D <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PVI>;
> @@ -2092,6 +2092,24 @@ pvi_to_hdmi_tx: endpoint {
>  				};
>  			};
> =20
> +			hdmi_pai: audio-bridge@32fc4800 {
> +				compatible =3D "fsl,imx8mp-hdmi-pai";
> +				reg =3D <0x32fc4800 0x800>;
> +				interrupt-parent =3D <&irqsteer_hdmi>;
> +				interrupts =3D <14>;
> +				clocks =3D <&clk IMX8MP_CLK_HDMI_APB>;
> +				clock-names =3D "apb";
> +				power-domains =3D <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> +				status =3D "disabled";
> +
> +				port {
> +
> +					pai_to_hdmi_tx: endpoint {
> +						remote-endpoint =3D <&hdmi_tx_from_pai>;
> +					};
> +				};
> +			};
> +
>  			lcdif3: display-controller@32fc6000 {
>  				compatible =3D "fsl,imx8mp-lcdif";
>  				reg =3D <0x32fc6000 0x1000>;
> @@ -2143,6 +2161,14 @@ port@1 {
>  						reg =3D <1>;
>  						/* Point endpoint to the HDMI connector */
>  					};
> +
> +					port@2 {
> +						reg =3D <2>;
> +
> +						hdmi_tx_from_pai: endpoint {
> +							remote-endpoint =3D <&pai_to_hdmi_tx>;
> +						};
> +					};
>  				};
>  			};
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



