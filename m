Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E25C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 18:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5rvIWGTIvOTCE3UxEp1CtwJp24SA8aalhpVBxX9P4c=; b=QgNO2laZCWL/vWWBnNT4VYtHBR
	ObR5ZF18wnsUMK1JPG7GoAngQvzKnRP8CVItHf0qIaGHDpR3oRaifvYhpu9fdP3elio9GVeAgAh0y
	Oj9mmeScUi7bBFsgHG7iV2rrIP0ag0+hjdBdXZsPkM0s3bdZn6lb3OME0ds5Z/L6r0M7NWQ/CEYz9
	AOMuo0Eu0cu/EbimIma3CH11sF2zas4r0KGTB2vIlOrR6xe+PcoSUViTkxZ46LLANyLVP2/8CTzUo
	dfKgcdRAGvDyVCh7eVUQzhuNw7EAmF4anSAveode7uSKcbUauE7KE4VpXJMx6512PnVL9deQ8ZiCk
	6Gywympg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4NS6-0000000Cemf-0sGB;
	Wed, 09 Sep 2026 18:55:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4NS3-0000000CemG-2NXi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 18:55:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IgIVA3344035
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 18:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M5rvIWGTIvOTCE3UxEp1CtwJ
	p24SA8aalhpVBxX9P4c=; b=UBKV82pFgJhLWH2fGpTDOEjWYD13vt/8iJpHl8CP
	Wr99KKnwqJFy13Qd4uny+m/WphgkXa5cJ/2iqk8KchWGMv5GOzJvBZtqW0J53X5e
	DWwKK2h8e1LdBzzOU2ilj3+96RVr853RiUg4DYPAh/ekLdJUW2vgs6Qah9bZKqzn
	KKlCQF1AO6wDQd7rTmmaXaUUWjurunrQcUcPH50lY3way1V77/rcx5jZnZSdakXk
	QoFrzV2r0wmw4j+vXJLlgjQk80PSz1wG92C0GQiY8FcFYOZsu2bsWmlCXHsExeCK
	TOAWRQYBg3W1cogKlmAWR3bNqjA89QvEyn6+ocAG5M1UEA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygg1mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:55:18 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-785b66a7017so1507135137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 11:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788980118; x=1789584918; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M5rvIWGTIvOTCE3UxEp1CtwJp24SA8aalhpVBxX9P4c=;
        b=UqIH2pVSy3YjsQuYBDnTy/xtYH9n9dAa4k74IVT0LKnAe14Fgnx7kfwg/JmFnnVnKR
         UzMJcg8AFOtHQeVPcEEekSmrpoSBFpCVoV8pm67BbwTQL2GN7C7U3X5smZFh7j/rT/1C
         xXmHhlNGBLvB0wKBNUt//YAFAZBoxOztUj07GtKgpEpwv2BFcVgtCG4mBanboiDpuq0W
         D26Ixn/uYzOl5PVYSOsoIygsgWs1WvxSrkfL9StwfTls3qVXxKPpEgdkYJGgehXzJmRW
         dWBIprBz1gUBI+WZ3rOZRYucAYPVYjrHdnPSrwhiIhDz0N5eyUGX5LcJkIGwsYMfhoJ2
         jfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980118; x=1789584918;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M5rvIWGTIvOTCE3UxEp1CtwJp24SA8aalhpVBxX9P4c=;
        b=htmvm4Z/PmMn+WrkoFN6/ZsqyP5JPCZTQwtSuSIu4MXfkViFAAklwBi4CIRcTVfskz
         t42DG4z7MiNXkXU+QXUHxsleFu6jCRn/3CDSCHjhYrFTbg0SsKXfaK4Fyjv8od5sib4n
         CLt2jh6XUqi9HQXad/wg2JJbNexKRAiP5D0y6HwWknoFfScfNVwgQV7UGjKRIVYYQTll
         DotFPJl6hPbpMewjGtEQg9BWxDR+Z3+PhBIfMUr+u5EEOdUVJ5syNw/3gzZWBX3noGI/
         360Znu7lTu3ICz/ZWBVwwhTtlo77tD8i07mOGrSC//2P0MQJ7qs/lYk9R7Rk8TwzYST2
         aAdA==
X-Forwarded-Encrypted: i=1; AKwUvByaUCk5eFbMzN7PLuGkUAAj1dks2jQ/8/SWjHvFMDv/pw5cCWeiIvvMKSEwd8DYmadWrjmEUF05DlCamkJiUl45@lists.infradead.org
X-Gm-Message-State: AFuF++lx9R/KMIgMXXFPbeNgTRQJaCAc4BA/Gy5OXKGXMpbl6V4B4AqH
	KMDRfGZSrdVMqBtlypRqZnNtvhMMkpmV33enu9ze18u2uAYjXnyC5kRKUOkyNueDEDvYbUA6bmI
	uPjy9vWdopFpSi9WDjU4dBzvLKXIFAMoDQoHg8lBf9PNdZe/BaH97JptRqWqyNTbsJKumuNyCLZ
	P7mg==
X-Gm-Gg: AYBFou0nJ/OTtRpGKMEjGVAdCFHAj6IG+U//mYmx+e6YrEaAywnzIJk0Gdd/+5YHRfq
	JVMUANjmq42YbnWTwKS2aGINek+54+ndfbabH/n/4o3U01xv3hVY1cJZ5TL1Kppx/A9HjvWRbhw
	QuQo6Y9GG1irPLL/0mBUhKVFlAmpdJoq+H77VIEQKQhhGnUL3K/Poz8R39iusuKAzQ2NiAmSRdD
	LB5A0gb1eC3k1IHjj6S9I90Gnx6dYitP9zuE8ZGM6R1U+jMTqmtT4pBVscQvOSRs6INLSRtXvwu
	QdowVGBw5gU12VQ/mTvwLtzgkYoBPLPiANhvHtKhQV6fSs+gLM/BqQvoUD6D5AKvWCNsx3TiPD/
	lASaTauWV9aes0A==
X-Received: by 2002:a05:6102:6b01:b0:785:3211:f5e4 with SMTP id ada2fe7eead31-78a4a6c8a04mr16623437137.4.1788980117617;
        Wed, 09 Sep 2026 11:55:17 -0700 (PDT)
X-Received: by 2002:a05:6102:6b01:b0:785:3211:f5e4 with SMTP id ada2fe7eead31-78a4a6c8a04mr16623409137.4.1788980116994;
        Wed, 09 Sep 2026 11:55:16 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d49d57sm9738765e9.14.2026.09.09.11.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:55:15 -0700 (PDT)
Date: Wed, 9 Sep 2026 20:55:15 +0200
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
Subject: Re: [PATCH net-next v2 9/9] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
Message-ID: <aqGrk9TLx8RJ4Xzr@lore-desk>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hx4+qUIsDXNsQO4F"
Content-Disposition: inline
In-Reply-To: <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMSBTYWx0ZWRfX+8B5n+bPhwBw
 rGbet0/mXwD3zeWek4usbTBHtcD252tgd8kko+JBsZTs39GjWea+Poayfk1bUjOLt3EPJqJjEqX
 1yLUAiEd54ACZXSLNn+x6qNnJRAL+o4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMSBTYWx0ZWRfXzUSWvpu8KrKV
 KmtSDG6/TypQrOyHaRgM21XURejivt4lcXlILPkLf0ZG2Sp0trJkjPn6or6i3WLAxKdSSbon1c7
 AT/ahvNCYjPnRrACt8Totj/W5n/UnYSF/Yxwqkc3bz9VdYjYzwgxbRkGtkaq8e8/mwsligL/ANW
 EaUOXtn8Ljx7JPw/3KS65LCKE1UMO0v8OAGts+kMafeESi2wsyzHb4WbBcP2O9sAiOuIomdtCEP
 geEfmPVEpFpDHSum7kiZilZj3aiB2obzJAKzfx7wwaGPRFlrV8mxU3oqlQ1GrXqSDGTPdxzFmD9
 pcAV4PBRR2Sa11WY40bC2rp44j8K4ffXvrJdwk+afo7MFjXc/Vv5LvF0j7Zrf3Sv5nS3Hl5xxgk
 iUEl7F44a9FsHqcFWnELKYUSYgi6ijEDayJzAv6189774WZ7NlfvhET5LqP0liRHyJr54Ixnpnl
 n+zENN0XCnfbo8jIAWA==
X-Proofpoint-ORIG-GUID: S4HaF7SFiGX2rXft6-F0UuDh5zF4x__f
X-Proofpoint-GUID: S4HaF7SFiGX2rXft6-F0UuDh5zF4x__f
X-Authority-Analysis: v=2.4 cv=Z/F5j3RA c=1 sm=1 tr=0 ts=6aa1ab96 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=DFbXc3gujWXi7Ms4cGQA:9 a=CjuIK1q_8ugA:10 a=AyJwBSL0_NbV6ZD5tKsA:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_115519_726870_10AEC576 
X-CRM114-Status: GOOD (  23.60  )
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

--hx4+qUIsDXNsQO4F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
> GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
> backed by a new shikra_data descriptor that enables the three NOC clocks
> required for DMA memory access (axi-noc, pcie-tile-axi-noc, stmmaceth)
> all at 120 MHz, and the 36-bit DMA address width.
>=20
> As part of the NOC clock voting logic, the qcom-ethqos glue driver takes
> a second enable reference on the "stmmaceth" clock, which is already
> enabled by the stmmac core. All three clocks in shikra_noc_clks[] must
> run at 120 MHz for NOC access, and managing "stmmaceth" through the same
> clk_bulk path keeps the rate-setting and enable/disable together.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++=
++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 8871d285941162c72e2a8f79d2eef915d9283796..c474f1e5a043777a52bcbff8a=
488640f6dbdca30 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -328,6 +328,36 @@ static const struct ethqos_emac_driver_data emac_v4_=
0_0_data =3D {
>  	},
>  };
> =20
> +static const struct ethqos_noc_clk_cfg shikra_noc_clks[] =3D {
> +	{ "axi-noc", 120000000 },
> +	{ "pcie-tile-axi-noc", 120000000 },
> +	{ "stmmaceth", 120000000 },
> +};
> +
> +static const struct ethqos_emac_driver_data shikra_data =3D {
> +	.dma_addr_width =3D 36,
> +	.has_emac_ge_3 =3D true,
> +	.noc_clk_cfg =3D shikra_noc_clks,
> +	.num_noc_clks =3D ARRAY_SIZE(shikra_noc_clks),
> +	.rgmii_config_loopback_en =3D false,
> +	.dwmac4_addrs =3D {

nit: this part seems in common between emac_v3_0_0, emac_v4_0_0 and
shikraemac_v3_0_0, emac_v3_0_0 and shikra.
Can we add a common definition? E.g.

static const struct dwmac4_addrs qcom_emac_dwmac4_addrs {
	...
};

Regards,
Lorenzo

> +		.dma_chan =3D 0x00008100,
> +		.dma_chan_offset =3D 0x1000,
> +		.mtl_chan =3D 0x00008000,
> +		.mtl_chan_offset =3D 0x1000,
> +		.mtl_ets_ctrl =3D 0x00008010,
> +		.mtl_ets_ctrl_offset =3D 0x1000,
> +		.mtl_txq_weight =3D 0x00008018,
> +		.mtl_txq_weight_offset =3D 0x1000,
> +		.mtl_send_slp_cred =3D 0x0000801c,
> +		.mtl_send_slp_cred_offset =3D 0x1000,
> +		.mtl_high_cred =3D 0x00008020,
> +		.mtl_high_cred_offset =3D 0x1000,
> +		.mtl_low_cred =3D 0x00008024,
> +		.mtl_low_cred_offset =3D 0x1000,
> +	},
> +};
> +
>  static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  {
>  	struct device *dev =3D &ethqos->pdev->dev;
> @@ -962,6 +992,7 @@ static const struct of_device_id qcom_ethqos_match[] =
=3D {
>  	{ .compatible =3D "qcom,qcs404-ethqos", .data =3D &emac_v2_3_0_data},
>  	{ .compatible =3D "qcom,sa8775p-ethqos", .data =3D &emac_v4_0_0_data},
>  	{ .compatible =3D "qcom,sc8280xp-ethqos", .data =3D &emac_v3_0_0_data},
> +	{ .compatible =3D "qcom,shikra-ethqos", .data =3D &shikra_data},
>  	{ .compatible =3D "qcom,sm8150-ethqos", .data =3D &emac_v2_1_0_data},
>  	{ }
>  };
>=20
> --=20
> 2.34.1
>=20
>=20

--hx4+qUIsDXNsQO4F
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqGrkwAKCRA6cBh0uS2t
rArrAP9R8xEG+zLWVTIluHMbwn06eRZVDw4njA5XwSEu+LwHrQEAo4TJM5euvbra
4jutQknO4Wvvhxx1ELycGgKuzOGCTw0=
=m+rn
-----END PGP SIGNATURE-----

--hx4+qUIsDXNsQO4F--

