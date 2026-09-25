Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D64C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WX1zivK0KSD/gWgo1/AwVsWkfLoq+U/soHtU47sdNPs=; b=sA8zp8EJghU5upLZJ99PR/ClBO
	IkkU63L/vx7G3Ygo481YMljs4xZofL08nxK4WV/qG1jI6nCRfWOIiVI/kytnOWtFaw2czn30WWnZ0
	kT8c2dy7l4txxbufOXHrtb+4H3ldYciFlWA7Wxc2jRwgjJnD5FNbQEyyGX+7jpSbf/loqXOe5vBpO
	jtG6b8lCFR29vQU+hTjjiu6uIBx4r+u9a4IPEFc91PKZHnu6rqf3RSWWdio2Wb2WbhB+E5FdXwf0G
	PCyCGdY05M2mxwqUO68whrEmxSJBp15cmCkPhNc4IQVg93lC09epyzUcG3yE1H1Kn5Hl6LunOpb58
	4aJ64Awg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA30f-0000000D5hE-3Bss;
	Fri, 25 Sep 2026 10:18:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA30c-0000000D5gr-0YZY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 10:18:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5Iv16600642
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 10:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WX1zivK0KSD/gWgo1/AwVsWk
	fLoq+U/soHtU47sdNPs=; b=QP7QfJODydv+3Qh1M/eJR4PAhRRAN9jIVADfmb4w
	OQgRudD7Gz1c/1TFLct8axFYVFanCr2dTvdmFZ16B+P9v3ri+cE7TmZFL+KRdGX6
	z/zj3W9VzXRlmhXjZ0AvncdqwEfdE6C2XJdn9HwAi8msy5jWbzkaPISeEpH696EP
	BJqQCYTMTi51IkNaK9dsKlQfV5Czm73QBYtrvjwyc/up1coCANlIdwFFu+iN68+O
	4DKkxmsjdlAC1XrWhHCNW15lmtFJ/UJFXf5lTGKmYOukemfvr36jpmmJHWhp9Ts2
	pOeh3LJRnJ77+BTdJznqkfoT+ASf2brYCaajbszKZoX4VA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvrwag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 10:18:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53094ff7090so21825731cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331504; x=1790936304; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WX1zivK0KSD/gWgo1/AwVsWkfLoq+U/soHtU47sdNPs=;
        b=jxgQcbLrrou5vpPGz6IgKD7hM5d/e8PmxCw+HIIe74M81cieB6iNGGHdwEKGiqp9P7
         ARaJBktA12cMOMZN6kQNRqY9j8iX4pCTc1hyYfOQFoGDXlKaaslM6vIoq17/jb3vqxVt
         JacgP0v6Kz1prP03Oiy7NgELcQGVf35d/CqITWZgBSxkWZClzZdkU5NswKTrSar02cKI
         eDrXsJZnnwyEO/8VV0AnMK6P/xsgR2uxQ+gGxmCOP5qLgGobAlc0l7Ey9k0hCxCLaFCF
         8ZOu7NC5ZBkWDNrnImBiJNHhWJA00WUeikQZzzIE6tSQSBsz6+Z3hWjkPwmOUMyhxmsP
         w+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331504; x=1790936304;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WX1zivK0KSD/gWgo1/AwVsWkfLoq+U/soHtU47sdNPs=;
        b=sGsLIvuNjrXC/sozAKvWYaVcPRSBT/2qc1Md2dcAqnZPEwbNUVk275jVSunaHPByPH
         t68L1njQE9rojYFF76P+OVIHzB2VntV5dYHeqMp0O/V/iF77wRcpiwxRPOq1cAKHcy8v
         3fElIA+N0ePAj34bB+JWwentl9pyFiS2Cwd1QTw9SeCHTHHN2fpM0ZnHIThRZZ/QEBEh
         R3fqbJbRO11h1i8dc/KhcwvNqLnXh9mIOBrl6yXLeUfjJ+MPyHjJo83VvBjULY4Cc9T1
         R9H32R27YStHhHdiCranGg5X8M/tULal79mWzhTp28qL16Wp6d1v1hmP08oz3Pr4ypI4
         1paA==
X-Forwarded-Encrypted: i=1; AKwUvBytTSCMi+3S1AivL7+z/cNDyBpFacrC6odPA55/sZaVKwxJUZ021DBvPVYiWg/OOWXOl1FBHd+b/d0BAtBOdBpT@lists.infradead.org
X-Gm-Message-State: AFuF++mfD4scHE+jBAxD0XD+KeMwqUnUnh0/7hwb39tj2ot/6Gn2Dsv7
	w10EHnztvwiUEZzDoUSD+JvhRnrFoUhky+wvtDUqkEgOLCPVAOCO9e8yIm1tnJ1RedktFgLaGu9
	5JErGYJg5NBFv5J8KnKDAQpDM2c13xBKdzVrAnxVUs7t7hVfVMVVkrhLQbF48WGyVP/UUP5x0XC
	JxWg==
X-Gm-Gg: AYBFou08Utg7byR/SnUHnV2uDOslnW+UrOPuLPzo6FEAv14rbGwQfdE9Lw5s56HN232
	aBc3s2cECOJ4nkFHAP3JtFb9qKqJK1OF5dr36jcpo0HRN8NPxk6TUOzQ7JemaCJo3+i0ZwC4ZQk
	XWOxCblqQhBRXT62ukkV9F/tChgaNR9JMMYMLhnoom1hEqNIl/XPqHnuyvDCo2u37nfCPWz3Er5
	BBnw7GJtII+q8pbQzg2ICdNTC0Jay4LmfFMDvC3/SckSqtQWLZyafl8cNR0W94m/PXGl+2j5Qw5
	O+SZ1DCBlEx5o+TvmnrKuatTivMnSO7cy2UuFYyvmpAa+J0FO4pNqU8qMDs0toQTeGuiQp+tuOR
	58YHWXBA4l1w3OA==
X-Received: by 2002:a05:620a:3185:b0:93b:ce00:72f4 with SMTP id af79cd13be357-93c43cc5681mr337032485a.11.1790331504349;
        Fri, 25 Sep 2026 03:18:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:93b:ce00:72f4 with SMTP id af79cd13be357-93c43cc5681mr337026385a.11.1790331503673;
        Fri, 25 Sep 2026 03:18:23 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b6108sm58203965e9.8.2026.09.25.03.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:18:22 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:18:21 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
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
        linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 3/9] net: pcs: xpcs: add custom platform
 register accessors
Message-ID: <arZKbbCcUG5FgQWi@lore-desk>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-3-4b1c682af70f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+RQ9w07xn/7cmLLc"
Content-Disposition: inline
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-3-4b1c682af70f@oss.qualcomm.com>
X-Proofpoint-GUID: gHnSJUjFwbdjd3SGNodI1F0VY1eOJf1q
X-Proofpoint-ORIG-GUID: gHnSJUjFwbdjd3SGNodI1F0VY1eOJf1q
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab64a71 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cNto7lqNzDuyVZoFmAcA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=CjuIK1q_8ugA:10
 a=TGcz8d0ICyKSqoSmTxMA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfXxNfxMNYQrOR8
 s8NuqX6Bih+nwrL/iQnOen9yEQihB5s2GrT3ueIMtMtUW1RIl+RcRZzJNasnZMSM4SQzmRa7utc
 5tUYXuaxIBL1mhzMOCXvQd1Raz2WsLs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX1OX0NAsWx14g
 1izDaKVgoz0QKMKDFEGNwdQnH44z8C/JSMz69ADbsK8A1LSDua+84CRkTlDy+pPfZDxXS72iWRZ
 T9ix3ZhwUYUt3xLqDfu9XIeOxEKowr0CnbQbz4Gs6xhdMjnJkmkJv0SABhc9saHx+v9hWnR0gFY
 eyS/ryLSCyMukFuG8pDpBaBKiYaEd635gFQvXi1yWpYmlSVjwi7Q29/HvpTZbwysGujnp5IvD+i
 wdEaPWCuDdzJEmIgNf1XLP/MKytPJ/tg1+iEoenWBcBcfTZLOa3A3gdCJhXLcjUORGZXLEZxU4W
 SErwuJI76jrqKh3jHUyYt3u/XwQ6Al8n9vzqS9mTVSC5ZBTP3KbA6OjT8VPwdzQzAW9fVkpT0dq
 cgZxBJR1rk/scoWLBbLCL2sML7CIwUoqPOk1BRPh36z+saQvxHks/9Es8CdiBUVWmnJprVOEnra
 DbB4Hpebg26/Cxc/HNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_031826_318257_F18AB460 
X-CRM114-Status: GOOD (  22.56  )
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

--+RQ9w07xn/7cmLLc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Some XPCS integrations do not expose the standard direct or indirect
> register layout. Allow the platform driver to use optional register read
> and write callbacks for both Clause 22 and Clause 45 accesses, while
> retaining the existing access paths when no callbacks are supplied.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  drivers/net/pcs/pcs-xpcs-plat.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-p=
lat.c
> index e669a7b248ac4677aeb5cd1874108f5c87f837d2..e78a233fb198d940951064a71=
e8597c6c666bc9d 100644
> --- a/drivers/net/pcs/pcs-xpcs-plat.c
> +++ b/drivers/net/pcs/pcs-xpcs-plat.c
> @@ -24,8 +24,16 @@
>  /* Page select register for the indirect MMIO CSRs access */
>  #define DW_VR_CSR_VIEWPORT		0xff
> =20
> +struct dw_xpcs_plat_ops {
> +	int (*reg_read)(struct platform_device *pdev, void __iomem *reg_base,
> +			int dev, int reg);
> +	int (*reg_write)(struct platform_device *pdev, void __iomem *reg_base,
> +			 int dev, int reg, u16 val);

I guess here we can use the same signature used in
xpcs_mmio_read_reg_{direct,indirect}()/xpcs_mmio_write_reg_{direct,indirect=
}().
Doing so we can probably have a generic platform ops the driver can set dur=
ing
probe. What do you think?

Regards,
Lorenzo

> +};
> +
>  struct dw_xpcs_plat {
>  	struct platform_device *pdev;
> +	const struct dw_xpcs_plat_ops *ops;
>  	struct mii_bus *bus;
>  	bool reg_indir;
>  	int reg_width;
> @@ -169,6 +177,10 @@ static int xpcs_mmio_read_c22(struct mii_bus *bus, i=
nt addr, int reg)
>  	if (addr !=3D 0)
>  		return -ENODEV;
> =20
> +	if (pxpcs->ops)
> +		return pxpcs->ops->reg_read(pxpcs->pdev, pxpcs->reg_base,
> +					    MDIO_MMD_VEND2, reg);
> +
>  	if (pxpcs->reg_indir)
>  		return xpcs_mmio_read_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg);
>  	else
> @@ -182,6 +194,10 @@ static int xpcs_mmio_write_c22(struct mii_bus *bus, =
int addr, int reg, u16 val)
>  	if (addr !=3D 0)
>  		return -ENODEV;
> =20
> +	if (pxpcs->ops)
> +		return pxpcs->ops->reg_write(pxpcs->pdev, pxpcs->reg_base,
> +					     MDIO_MMD_VEND2, reg, val);
> +
>  	if (pxpcs->reg_indir)
>  		return xpcs_mmio_write_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg, val);
>  	else
> @@ -195,6 +211,10 @@ static int xpcs_mmio_read_c45(struct mii_bus *bus, i=
nt addr, int dev, int reg)
>  	if (addr !=3D 0)
>  		return -ENODEV;
> =20
> +	if (pxpcs->ops)
> +		return pxpcs->ops->reg_read(pxpcs->pdev, pxpcs->reg_base,
> +					    dev, reg);
> +
>  	if (pxpcs->reg_indir)
>  		return xpcs_mmio_read_reg_indirect(pxpcs, dev, reg);
>  	else
> @@ -209,6 +229,10 @@ static int xpcs_mmio_write_c45(struct mii_bus *bus, =
int addr, int dev,
>  	if (addr !=3D 0)
>  		return -ENODEV;
> =20
> +	if (pxpcs->ops)
> +		return pxpcs->ops->reg_write(pxpcs->pdev, pxpcs->reg_base,
> +					     dev, reg, val);
> +
>  	if (pxpcs->reg_indir)
>  		return xpcs_mmio_write_reg_indirect(pxpcs, dev, reg, val);
>  	else
>=20
> --=20
> 2.34.1
>=20

--+RQ9w07xn/7cmLLc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarZKbQAKCRA6cBh0uS2t
rJ2pAP4sM6uACZtauXlAHma3Iy2D2u2SCYHtgVPuBzVAUjSMZAEAv+u2+f2JmW/b
9fEdEMskwqkblVO/hcT8oQAkaehV4QU=
=N0j3
-----END PGP SIGNATURE-----

--+RQ9w07xn/7cmLLc--

