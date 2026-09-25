Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C8BC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 10:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dc2b3E2dU/PKCiTvrUVIT4JvEgyr5BpHbH25kJGzFm4=; b=FI4WKe+GAHTJH05aEXY9Ydpvhd
	M1xjetH9TyO6IuoDs1iHlOUTMCISPb/kfKfDs7r5SKNeLJdvekFPZeuGv1HKTA4cYn90GSb7+lvwn
	vO4QaBop/tpbdPTxqqft2cuJN5w375j0K06/jTbxm7Kh6PHZZuq9/Vk61jelJVNqAwzZTRrad4/3a
	Adja6qvgI79rSnrYlqvkLOoIil+iUwiMB18MCqAy4KwWaxTumPgMnpt23noXyEkmPOdQ4j5fVuVMn
	N1JLmNXaXHBFHFT579FoND4qTFkgJsScXpULATcKJiZSnUqUsGK92uvrPQI5+iUOLJ6mIxEPpfYiK
	iLo71NOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3Is-0000000D6vK-0nTG;
	Fri, 25 Sep 2026 10:37:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3Ip-0000000D6uI-1NBt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 10:37:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5Iv3W600642
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 10:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Dc2b3E2dU/PKCiTvrUVIT4Jv
	Egyr5BpHbH25kJGzFm4=; b=P9lG1xZxSB3Ijc1XZQYp/LQOQ3W2Ia8/e0e95mf8
	7q05Owzr7wbi94CZiKaOiieiMHEupmEL3RZXt4EVkRng2Ag868gpiusquMeXI+8f
	XNV453o7Alrt+BsIDS9BrL64pQigfcNqP6OfbSS9QuvqGCeCjq4q2/kfqfJ7sCYz
	lSYL798rceJnSWjIXIfE65x9nCXlKQ35AQo/uvMDGveaQg/Qj7STDYWFG3uHUMCu
	fVN5OTC+fOOgNRWtsmJqKwuSbIHKyOm7VPY6z5MZAwJDCuDMqI27LOgpBKnDKBml
	N7TBL7nh4ikEz2aZmAomlxTdlQ/+q32i7qT2WCS6ib2r1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvry5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 10:37:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c292c2fc1so179712285a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 03:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790332633; x=1790937433; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dc2b3E2dU/PKCiTvrUVIT4JvEgyr5BpHbH25kJGzFm4=;
        b=RAHjRgDao1om54J5HmejAxYmZmWAKsbGBULuGP8JncbxxaIQuZBZ8YJ9qrRqx+M5iD
         8FgA9VAkbYdPFfF23vZYgcFgJshyLFmSSZe5zscwwHaocZMNQaet6MTghIqFrEux0oIh
         ExeVANcuh4CcMtiFSlatngghy7D7V0JnKheRHulcOWikeHOPOgrEajDZMoeLZRj4DstX
         ZGQ0HUoaEokJ54Q8rB/3Rz0sr/xjp+o6BMj2fpD1UFUhSJFzYGbvFqTrP2c83MuuGV4N
         BUIG77QyIEZ+K7iIfjDvr350BwzoP7SWKe3Lc/D7HCwtGX/cQkAqSt9Px+Dio114Sv91
         o/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790332633; x=1790937433;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dc2b3E2dU/PKCiTvrUVIT4JvEgyr5BpHbH25kJGzFm4=;
        b=DXDDP8AEMBZ5MlWUxa+Y2uUrhIDjrnWWY3ao/P8sHLDSVmXN8NNtA6hJt5Lr5LzTjG
         j+4nyYehqDOgmyyov5fjrrt1CZAbB9IEq4D4PeJ/wNJhbF5VJLRG3n2Bkx0xUY0WXBMH
         QBzjV91y+2qax4Vnuo5j+IaT0vusvWAlSLyeXfjN6gHbb50N0WFBgY8CQO3QiHiuhmuJ
         aJV/ejgLpMrYQ1H3pH0cr7ZtTz98aibXAqCNObCkU2FmUBxW2w+yRcGDSSHW7gPkPaBV
         4oSfu8tiSRcct9CIxjZIyODFYIBRuuiqLwIHddA/SVyO2sMUUJMJck5F61LeldaGvyRl
         2Epw==
X-Forwarded-Encrypted: i=1; AKwUvBzVndUx1yqpxRRvaJSBioldeVucHt8IJGS1h309rL9IkdTjB5ogW2okcNcGbKA1DDGuG/FsFvzCaXuwWnvVs8fk@lists.infradead.org
X-Gm-Message-State: AFuF++mJsEBNMO38KH2Yusod+lwGLnIbUjTjritFBBttSxSC201QrlCD
	MVObgXA/szJ2OXlz2Ox+WjUqz8+C+aSjp0K+RSlj4xCF73KxXc+i4Fe87W5h3lHxyJFKjiimXg+
	En6EApyQiyNualMKoR5Jr0Yb+fVj29gy8XZoiSZe9cCCxmyDNYZfrvVhzJ6ENxAM2+c639MBI9p
	7A8Q==
X-Gm-Gg: AYBFou08I0HRGGH3AFJFwvLMXTEid+iSkiX1QZEt0Aeac5EKhtlIpwIeeMKlXA9Kyd2
	ERBIswoHM/s4r38WVrH6Tk+AW0Vh/x8FxBLmGT20Yq7T7HWnPr9kYasEY0CCwKIaxIAWcCwrhcW
	Kqk6E3zuKU1yhP13SKguQDQ+1Id1tIJ11kHthAeKSfwkmq6dVWB0bhtyoOuCjHZDNhfUNu8voRv
	SH7+1fehe/vggj0z1RgRNgo20fFdpU8QSCJ4NDaVlitG/mEC0v9961azJ7fcEqIoDHiHwwJmYnJ
	u/LP/xM9jfXc7TwanCXuK8vxbag/aWxndhHn1YnTPDlZJEaWlED3rFv9sWekMZcYhUBxbgT85Sd
	ryX7KcJVdVsoTWg==
X-Received: by 2002:a05:620a:6493:b0:936:77d7:55a4 with SMTP id af79cd13be357-93c43cfc87emr347681385a.19.1790332633362;
        Fri, 25 Sep 2026 03:37:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:936:77d7:55a4 with SMTP id af79cd13be357-93c43cfc87emr347677285a.19.1790332632792;
        Fri, 25 Sep 2026 03:37:12 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a2acb4dsm6202787f8f.0.2026.09.25.03.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:37:11 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:37:10 +0200
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
Subject: Re: [PATCH RFC net-next 4/9] net: pcs: xpcs: add Qualcomm Nord
 platform support
Message-ID: <arZO1niyhIEnAv5J@lore-desk>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-4-4b1c682af70f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ySQnkYGEMas/aZSk"
Content-Disposition: inline
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-4-4b1c682af70f@oss.qualcomm.com>
X-Proofpoint-GUID: kxGA3p4gQUWa1XMrEUfQOUyGR0Bbm2fi
X-Proofpoint-ORIG-GUID: kxGA3p4gQUWa1XMrEUfQOUyGR0Bbm2fi
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab64eda cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=TBIoFk-jyhqgT34sUlAA:9 a=CjuIK1q_8ugA:10 a=6T2aJRpNhVgXhit-X0gA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MiBTYWx0ZWRfX0x1ga7a49OUX
 HeILYupK/SZ/E0cH0uc0dQID8YLt1v9biUiP5wGahhF23ReoDilo/T+bxXrNtzM/owdonQTVdPn
 srjwZcdjEiuzn9j7Cd4wFL/e6gzocNE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MiBTYWx0ZWRfX+rL+2UXXLv3F
 F3l6xYIlItUeRCW+SLARgGsZokN8dV+SKe9hv806yzGlE4zVqOlhXHjpIQGa3sqL6nvAzEoBzRo
 dZN0z3jrsF+g6l94M4kXHo7O4oCsQRXIJj9uSXUfqcMxStYhPDQ9Ty4gPX992QuEHrQli0WRa3g
 taz/HMq5JicvjppCrfj07zOpw+pkPtIKkh6zostAHHApk6nOyfW7mqVZv8Fadc38SjlJ2JlVyi7
 o1iNwrDp6lQEMl1qsaAZyjjlkJBcc5kVw2uonKA0uUpucWdENYLSIYrByd44vXRia2g0y9ck1PR
 wChNXpL1ml9jPrMtTCJ1T/HJwcQcrvRK+J6MfjRgCyl83N5cukUFf9HPfMVjC3lRUKyheqmHLA5
 K7ABAHI0bffjmc8PkUlHts/kgBz18+N4AY4J8VhR8697GYpu0daK/L9VsfbXvXKr4LLRZ2a456H
 gU2YA8oX7vlkd7rtwZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_033715_494505_872B2281 
X-CRM114-Status: GOOD (  32.90  )
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

--ySQnkYGEMas/aZSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Qualcomm Nord exposes the DesignWare XPCS register blocks through
> separate direct-MMIO windows instead of the standard contiguous
> MMD/register layout. Add accessors that translate MMD accesses to the
> Nord windows:
>=20
>   MMD 3 (PCS), standard registers: SR_XS at 0x0000
>   MMD 3 (PCS), vendor registers:   VR_XS at 0x2000
>   MMD 1 (PMA/PMD):                  SR_PMA at 0x3000
>   MMD 31 (VEND2), standard regs:    SR_MII at 0x4000
>   MMD 31 (VEND2), vendor registers: VR_MII at 0x5000
>=20
> Each register uses a 32-bit MMIO stride. The vendor bit is removed from
> the register index before calculating a vendor-window offset.
>=20
> Select these accessors using the Nord synthetic XPCS ID, allow its
> smaller direct-MMIO resource, and add the Nord USXGMII Clause 37
> compatibility.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  drivers/net/pcs/Makefile        |  3 +-
>  drivers/net/pcs/pcs-xpcs-plat.c | 17 +++++++-
>  drivers/net/pcs/pcs-xpcs-qcom.c | 86 +++++++++++++++++++++++++++++++++++=
++++++
>  drivers/net/pcs/pcs-xpcs-qcom.h | 16 ++++++++
>  drivers/net/pcs/pcs-xpcs.c      | 13 +++++++
>  include/linux/pcs/pcs-xpcs.h    |  1 +
>  6 files changed, 134 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
> index 4f7920618b90051e839a74a7101aaaf055a77f74..3d7cf1a5cd0783078edcefc6d=
fec626af469495d 100644
> --- a/drivers/net/pcs/Makefile
> +++ b/drivers/net/pcs/Makefile
> @@ -2,7 +2,8 @@
>  # Makefile for Linux PCS drivers
> =20
>  pcs_xpcs-$(CONFIG_PCS_XPCS)	:=3D pcs-xpcs.o pcs-xpcs-plat.o \
> -				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
> +				   pcs-xpcs-nxp.o pcs-xpcs-qcom.o \
> +				   pcs-xpcs-wx.o
> =20
>  obj-$(CONFIG_PCS_XPCS)		+=3D pcs_xpcs.o
>  obj-$(CONFIG_PCS_LYNX)		+=3D pcs-lynx.o
> diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-p=
lat.c
> index e78a233fb198d940951064a71e8597c6c666bc9d..e013a5253a22651220e62352d=
03faabc3a3c3658 100644
> --- a/drivers/net/pcs/pcs-xpcs-plat.c
> +++ b/drivers/net/pcs/pcs-xpcs-plat.c
> @@ -20,6 +20,7 @@
>  #include <linux/sizes.h>
> =20
>  #include "pcs-xpcs.h"
> +#include "pcs-xpcs-qcom.h"
> =20
>  /* Page select register for the indirect MMIO CSRs access */
>  #define DW_VR_CSR_VIEWPORT		0xff
> @@ -239,8 +240,14 @@ static int xpcs_mmio_write_c45(struct mii_bus *bus, =
int addr, int dev,
>  		return xpcs_mmio_write_reg_direct(pxpcs, dev, reg, val);
>  }
> =20
> +static const struct dw_xpcs_plat_ops xpcs_qcom_ops =3D {
> +	.reg_read =3D xpcs_qcom_reg_read,
> +	.reg_write =3D xpcs_qcom_reg_write,
> +};
> +
>  static struct dw_xpcs_plat *xpcs_plat_create_data(struct platform_device=
 *pdev)
>  {
> +	const struct dw_xpcs_info *info;
>  	struct dw_xpcs_plat *pxpcs;
> =20
>  	pxpcs =3D devm_kzalloc(&pdev->dev, sizeof(*pxpcs), GFP_KERNEL);
> @@ -248,6 +255,12 @@ static struct dw_xpcs_plat *xpcs_plat_create_data(st=
ruct platform_device *pdev)
>  		return ERR_PTR(-ENOMEM);
> =20
>  	pxpcs->pdev =3D pdev;
> +	info =3D device_get_match_data(&pdev->dev);
> +	if (!info)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (info->pcs =3D=3D QCOM_NORD_XPCS_ID)
> +		pxpcs->ops =3D &xpcs_qcom_ops;
> =20
>  	dev_set_drvdata(&pdev->dev, pxpcs);
> =20
> @@ -285,7 +298,7 @@ static int xpcs_plat_init_res(struct dw_xpcs_plat *px=
pcs)
>  	else
>  		spc_size =3D pxpcs->reg_width * SZ_2M;
> =20
> -	if (resource_size(res) < spc_size) {
> +	if (!pxpcs->ops && resource_size(res) < spc_size) {
>  		dev_err(dev, "Invalid reg-space size\n");
>  		return -EINVAL;
>  	}
> @@ -452,8 +465,10 @@ DW_XPCS_INFO_DECLARE(xpcs_pma_gen4_3g, DW_XPCS_ID_NA=
TIVE, DW_XPCS_PMA_GEN4_3G_ID
>  DW_XPCS_INFO_DECLARE(xpcs_pma_gen4_6g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_GE=
N4_6G_ID);
>  DW_XPCS_INFO_DECLARE(xpcs_pma_gen5_10g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_G=
EN5_10G_ID);
>  DW_XPCS_INFO_DECLARE(xpcs_pma_gen5_12g, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_G=
EN5_12G_ID);
> +DW_XPCS_INFO_DECLARE(xpcs_qcom_nord, QCOM_NORD_XPCS_ID, DW_XPCS_PMA_ID_N=
ATIVE);
> =20
>  static const struct of_device_id xpcs_of_ids[] =3D {
> +	{ .compatible =3D "qcom,nord-dw-xpcs", .data =3D &xpcs_qcom_nord },
>  	{ .compatible =3D "snps,dw-xpcs", .data =3D &xpcs_generic },
>  	{ .compatible =3D "snps,dw-xpcs-gen1-3g", .data =3D &xpcs_pma_gen1_3g },
>  	{ .compatible =3D "snps,dw-xpcs-gen2-3g", .data =3D &xpcs_pma_gen2_3g },
> diff --git a/drivers/net/pcs/pcs-xpcs-qcom.c b/drivers/net/pcs/pcs-xpcs-q=
com.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..63c95c951454819b62eb3fd00=
abcc6b529e2004b
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-qcom.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm DesignWare XPCS platform helpers
> + *
> + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/mdio.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "pcs-xpcs.h"
> +#include "pcs-xpcs-qcom.h"
> +
> +/* Qualcomm Nord direct MMIO XPCS windows. */
> +#define QCOM_XPCS_SR_XS_BASE		0x0000
> +#define QCOM_XPCS_VR_XS_BASE		0x2000
> +#define QCOM_XPCS_SR_PMA_BASE		0x3000
> +#define QCOM_XPCS_SR_MII_BASE		0x4000
> +#define QCOM_XPCS_VR_MII_BASE		0x5000
> +
> +static int xpcs_qcom_reg_offset(int dev, int reg)
> +{
> +	switch (dev) {
> +	case MDIO_MMD_PCS:
> +		if (reg & DW_VENDOR)
> +			return QCOM_XPCS_VR_XS_BASE +
> +			       ((reg & ~DW_VENDOR) << 2);
> +
> +		return QCOM_XPCS_SR_XS_BASE + (reg << 2);
> +
> +	case MDIO_MMD_PMAPMD:
> +		return QCOM_XPCS_SR_PMA_BASE + (reg << 2);
> +
> +	case MDIO_MMD_VEND2:
> +		if (reg >=3D DW_VENDOR)
> +			return QCOM_XPCS_VR_MII_BASE +
> +			       ((reg - DW_VENDOR) << 2);
> +
> +		return QCOM_XPCS_SR_MII_BASE + (reg << 2);
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}

This seems to be the real difference with respect to the
xpcs_mmio_read_reg_direct()/xpcs_mmio_write_reg_direct(), right?
Maybe a different approach (simpler but probably less flexible is to make
xpcs_mmio_addr_format() SoC dependent. What do you think?

> +
> +int xpcs_qcom_reg_read(struct platform_device *pdev, void __iomem *reg_b=
ase,
> +		       int dev, int reg)
> +{
> +	int offset, ret;
> +
> +	offset =3D xpcs_qcom_reg_offset(dev, reg);
> +	if (offset < 0)
> +		return offset;
> +
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D readl(reg_base + offset) & 0xffff;
> +
> +	pm_runtime_put(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +int xpcs_qcom_reg_write(struct platform_device *pdev, void __iomem *reg_=
base,
> +			int dev, int reg, u16 val)
> +{
> +	int offset, ret;
> +
> +	offset =3D xpcs_qcom_reg_offset(dev, reg);
> +	if (offset < 0)
> +		return offset;
> +
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	writel(val, reg_base + offset);
> +
> +	pm_runtime_put(&pdev->dev);
> +
> +	return 0;
> +}
> diff --git a/drivers/net/pcs/pcs-xpcs-qcom.h b/drivers/net/pcs/pcs-xpcs-q=
com.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..a1084f6a10a96baa8ba0d192e=
e64cdaed90da125
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-qcom.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __PCS_XPCS_QCOM_H
> +#define __PCS_XPCS_QCOM_H
> +
> +#include <linux/io.h>
> +#include <linux/types.h>
> +
> +struct platform_device;
> +
> +int xpcs_qcom_reg_read(struct platform_device *pdev, void __iomem *reg_b=
ase,
> +		       int dev, int reg);
> +int xpcs_qcom_reg_write(struct platform_device *pdev, void __iomem *reg_=
base,
> +			int dev, int reg, u16 val);
> +
> +#endif /* __PCS_XPCS_QCOM_H */
> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index 7f5c7a275630f2b064e4b9abdd6c3619e9346cec..1f556b4f7c44f06f24a2f7247=
34d3a7d71424de3 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
> @@ -1571,6 +1571,15 @@ static const struct dw_xpcs_compat nxp_sja1110_xpc=
s_compat[] =3D {
>  	}
>  };
> =20
> +static const struct dw_xpcs_compat qcom_nord_xpcs_compat[] =3D {
> +	{
> +		.interface =3D PHY_INTERFACE_MODE_USXGMII,
> +		.supported =3D xpcs_usxgmii_features,
> +		.an_mode =3D DW_AN_C37_USXGMII,
> +	}, {
> +	}
> +};
> +
>  static const struct dw_xpcs_desc xpcs_desc_list[] =3D {
>  	{
>  		.id =3D DW_XPCS_ID,
> @@ -1584,6 +1593,10 @@ static const struct dw_xpcs_desc xpcs_desc_list[] =
=3D {
>  		.id =3D NXP_SJA1110_XPCS_ID,
>  		.mask =3D DW_XPCS_ID_MASK,
>  		.compat =3D nxp_sja1110_xpcs_compat,
> +	}, {
> +		.id =3D QCOM_NORD_XPCS_ID,
> +		.mask =3D DW_XPCS_ID_MASK,
> +		.compat =3D qcom_nord_xpcs_compat,
>  	},

I guess this part is supposed to be part of patch 2/9, right?

Regards,
Lorenzo

>  };
> =20
> diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
> index 4ea995b70150e33e1e1a47cc7aa324c53742fbdc..0f69e14b2a4c8d17b59a570de=
bd14a77ab040182 100644
> --- a/include/linux/pcs/pcs-xpcs.h
> +++ b/include/linux/pcs/pcs-xpcs.h
> @@ -26,6 +26,7 @@ enum dw_xpcs_pcs_id {
>  	DW_XPCS_ID_NATIVE =3D 0,
>  	NXP_SJA1105_XPCS_ID =3D 0x00000010,
>  	NXP_SJA1110_XPCS_ID =3D 0x00000020,
> +	QCOM_NORD_XPCS_ID =3D 0x00000030,
>  	DW_XPCS_ID =3D 0x7996ced0,
>  	DW_XPCS_ID_MASK =3D 0xffffffff,
>  };
>=20
> --=20
> 2.34.1
>=20

--ySQnkYGEMas/aZSk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarZO1gAKCRA6cBh0uS2t
rBWpAQCWF+cS4RIEIgUz5tLtSpKvBFgHeyoBfhSvBs9EIH2WlQEA35iDZn/bftHZ
vU+Kq52oiCfQCvVfHwNGyP7zLB+vcgw=
=5a1d
-----END PGP SIGNATURE-----

--ySQnkYGEMas/aZSk--

