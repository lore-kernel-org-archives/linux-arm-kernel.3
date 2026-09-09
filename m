Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2ABC79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrIsFfwedfuLeKvzU70rKNtT+rVIhJ0VJ39qxRIr5Qw=; b=rj7QMyaHkMXXdcfDeIGBnt7lpj
	IzM7Jtvz4AxLxAqH0iSyz364gDzmWx5Cm/yq/Icf/l0pxLI3u9v/uE8oDDomfffPL/Bc2M+k5TfkL
	va33OJA/5PjCJeZLYQvasm5lE9eT5alYZ2BTQDSj78F29gwUxnV7VrWe9XUdnolT44OxzTptT+BdQ
	Eb3Pg9SZM4N0ZJvAxjI3qn5p2K85PE1Okauic5RmD/PYICjSRx7Lofzd+LMS9inoCH5QUJ+uW5d8y
	0dxFMEjNECx/GPt60am9UE8bvePcGmSXN61nq62OyOSz6fA1+FTLLsPBkAm2LABEmV3roo/URiKYE
	Bn5DD3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LuG-0000000CSDu-1Nzc;
	Wed, 09 Sep 2026 17:16:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LuE-0000000CSDZ-09dg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:16:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7S6R3716260
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 17:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NrIsFfwedfuLeKvzU70rKNtT
	+rVIhJ0VJ39qxRIr5Qw=; b=S72WelgfsaZtrz5JllU+R+NP9CCOf2QzT2nd3iR6
	wVf8+viNAnTjKlWgnXqmTJa+2+dOvFTecJ/+pvjjoef8HDQrzr3XkftTUg//NuT5
	QE2XVeIArXON82vf2exGclBNbCWt9I8jtGwOKQAOesYkbRJCpqFlVqVHwI7H4oCF
	j8otjdTeVixQT3MxPzRBRHAmjqQWv5JN1oO39r2VPoj9ccSctHWm5xJVArVMH3Fr
	khQaXcy0sO/7WGuWyZPw68FrU0mR/J3a+mR8p31Wx0leOSVanwZrRR86HEdyCSXx
	MZhI/FigkoPuuT56ufkksltirKf6M6JnMHyWflixtksxOQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk7921exa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 17:16:17 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e99aaaa6fso448415241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788974176; x=1789578976; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NrIsFfwedfuLeKvzU70rKNtT+rVIhJ0VJ39qxRIr5Qw=;
        b=SsxDrzzMxNuAjhgGVei2Mgf0zc4UtcRn17YA9OtclRmy+eb8Zs1vrxGO0HHnyKKnnm
         9yEFWG83gY3/EZOuV/pYW1WqRrJDfGjN6ZTTaVKOyn8tz/bDbkdCQhGksWs67Io7O6C9
         AUtBbVFthJL5OfiWR56XqqqK8pyCSOCz6RRzvLRw5yjimLehYYC3QcMQpqyt6qdfgA6U
         Vw9t7PjE42a9itUakLODokcpOr571z/aRWkwXj6AoObgGKnuKuv2foaJQrk8ecx6kOGo
         mm57nzxqrFNzd0tWIaDr+9ofpb77NImHXj9k7rQiW8S/dYFft9MwK+OtIJ7DiE06+SbT
         lDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974176; x=1789578976;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrIsFfwedfuLeKvzU70rKNtT+rVIhJ0VJ39qxRIr5Qw=;
        b=PM02CUTKu9KQL51/Y6SbZHuXpBsm+YQvmgNTUinUN1waWCZFvXfpf+V63ZNUJV8+Df
         CDEt03x2olrs6YnbMVn1/cf/7mv0t/fNyRoPecc3q465EAJWskuR0d1nHX6bUANUpLN2
         hCvYAQ9+QVYJED/z7X547dc3jFtkmO5JQSm/AzfXsuxlhuYgVCHCiHh6DuVZMEhNfWnC
         Y2YWpDk4owMs77ycS05BOI3QHZs+aUvzx/X9jICjw3Yp8JyJP5FE0rL12E1l3WG057YU
         z8+08QGJb7/Wwe4jJJpsIyv+ID0iRYmXeCaKSjs5IQEAgBjXUQ96ZlmZTnFf452pRKDm
         J9Jg==
X-Forwarded-Encrypted: i=1; AKwUvBzUZQd9Og/zMDfIeU/Qu1hZHf7z8IBtDsSSXfjD3QR0vvEg6xZrBTL3fJswmN27wodJcYk/q83EK0Hk/0sOFWEo@lists.infradead.org
X-Gm-Message-State: AFuF++mEDlyZRwuKr55ksN3/Mex8kVyJ0Quad/9SnC2Nhtn1xgamJwTe
	/+YOaptOpuyOhXKsk1rwtl9cqfZYzVu7gPHwfqgYC6y8XZlCowUAuEAnLT+XAk0NNlO1qRp2spe
	e1WRDwVHzRd4GA/KXDJXqlwOjasWQK8nBtOaZAzEA1JJdelfa8mZAtWS+wYQHM4GIKaS0Hn6nMM
	2zgA==
X-Gm-Gg: AYBFou19sSUeOU8AvmSM0uQQeSb/wwrmVponrfyEdMh3qBWfRyGZoNzTGHfmdcPCpqv
	3W5A8+Az6qqu3jN+jPqTGdzCIWekEqL77JpSZcvDTffP8+hx7mWb9+TnskODxidogjvkpIIVnx5
	TnO4BkGbKN8F1uCy11vhu+UDN/CG6wBYHZ1KJnpSuKiqtx4DD19Z3cLcUqS8plHABa0/cjJjAXs
	xmeyOKawDyD7b9/P04UuKjm+frDW4bcQu/edoUXsdiWmtHhSb0gYlm8ZClgspRkMAEouPPcUGrz
	sScJGeg8tOkapxmvDRxYRpizYzDXh5B4NzyT9SoE5/np3mNg7NcCyicGEWh55gAhnqn/7D7BVZY
	mY9mtfSbJOs6Tew==
X-Received: by 2002:a05:6102:5698:b0:78f:f234:75b9 with SMTP id ada2fe7eead31-790726d342emr1955928137.0.1788974176164;
        Wed, 09 Sep 2026 10:16:16 -0700 (PDT)
X-Received: by 2002:a05:6102:5698:b0:78f:f234:75b9 with SMTP id ada2fe7eead31-790726d342emr1955829137.0.1788974175459;
        Wed, 09 Sep 2026 10:16:15 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb04f1esm60278055e9.0.2026.09.09.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:16:13 -0700 (PDT)
Date: Wed, 9 Sep 2026 19:16:13 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 4/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
Message-ID: <aqGUXf4aaPNGhuJm@lore-desk>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-4-bbe3389d0652@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jz3BLvdJrcEnCQaB"
Content-Disposition: inline
In-Reply-To: <20260908-shikra_ethernet-v2-4-bbe3389d0652@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa19461 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=VkhmObMS16-UOsR-uKgA:9 a=CjuIK1q_8ugA:10
 a=Ytgtto6viW8UiwRGLNEA:9 a=TD8TdBvy0hsOASGTdmB-:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5MiBTYWx0ZWRfX++uPDOtxvVm/
 bw4QSxz1d+BomMw30C0OqTuurb+/GJvgGLN7D8u7W5aOKEV8Yq2DBsv5XWnV2tJVTnvTsOQfZFb
 OXmx7Lq0AfrUIocda5AZhMn7cc/D+h91oFbMcFvC0Z6+O8SsBzTC+taWyhtig3r/Uc3ysUCRfz+
 wgAbEVTaL4jaCqdlx63B0KwvVnqQpfNcyU1XLcSC83LKL/x3CBEhUSWRCSj/5lSu0e8sDKqjNSK
 +A/oLE/eNgjfUE3mV8M8ETKqEw7KSbOyov3MLPJWhk913VsinnRd59l7PBf2Gr8vy/e4zTyVS8w
 OxxTQFTM9M31xAaCU8xavnJjRtoovo0FehqMHq6j+Zr+08XJW7PKeh1a+mhQLsPdhsa8yaA1nXP
 skxp+8zW6dmjawpDFYcMVwHckDBNm8TBaUe4k9/DNzVoeDopuT8LLWIM2lOC0X3xjRGF6G5Yy2v
 9vWNO0eZ7TosgXap7mQ==
X-Proofpoint-ORIG-GUID: 4K0qauQ9-5omo-5dSsPcxiPUOegFyoIH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5MiBTYWx0ZWRfX8TsOtZ5MKLwH
 bJOWQ8d04xA5jAYhJQMZHVrD9x2xIxZM9tms2UFSC1q2TpeVKsLiN5CVBrZj+frCNhx2N1uqCaz
 VWx6Pxk+XkuSF/6gay9DVoRrez96Gc4=
X-Proofpoint-GUID: 4K0qauQ9-5omo-5dSsPcxiPUOegFyoIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_101618_082388_F1FE7954 
X-CRM114-Status: GOOD (  23.62  )
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

--Jz3BLvdJrcEnCQaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The return value is never checked by its sole caller and the speed
> validation duplicates a check higher up the call stack.  Convert to
> void and remove the dead code.
>=20
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..44270c25d874f72e7f971757f=
ec659d36468c315 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -371,9 +371,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *e=
thqos)
>  	return 0;
>  }
> =20
> -static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
> +static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int spee=
d)
>  {
> -	struct device *dev =3D &ethqos->pdev->dev;
>  	unsigned int prg_rclk_dly, loopback;
>  	unsigned int phase_shift;
> =20
> @@ -384,11 +383,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqo=
s *ethqos, int speed)
>  	/* Select RGMII, write 0 to interface select */
>  	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
> =20
> -	if (speed !=3D SPEED_1000 && speed !=3D SPEED_100 && speed !=3D SPEED_1=
0) {
> -		dev_err(dev, "Invalid speed %d\n", speed);
> -		return -EINVAL;
> -	}
> -
>  	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
> =20
>  	if (speed =3D=3D SPEED_1000) {
> @@ -479,8 +473,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos=
 *ethqos, int speed)
> =20
>  	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
>  		      RGMII_IO_MACRO_CONFIG);
> -
> -	return 0;
>  }
> =20
>  static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
>=20
> --=20
> 2.34.1
>=20
>=20

--Jz3BLvdJrcEnCQaB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqGUXQAKCRA6cBh0uS2t
rIibAP0S/gGVaDgOtJQrrnNWdWnIJWz20hm/VIyYD9SKCquKdwD/YToyiF5E74NX
CzVfv/b293W/qNrfSESKxGxMQFlq6A8=
=s/dw
-----END PGP SIGNATURE-----

--Jz3BLvdJrcEnCQaB--

