Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10000C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 11:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KL5UvpKHjzpyxWhNGv3591jLfaKqMWyF0eLovdVJgck=; b=hogOHxtgXHmTkckK36oZJyytEi
	oVi5VNcOPqQlfmf6jTLn26oF7YeSkylqHlViuA0wxtpry+uxF9IAX513VdUaWRppUSJv7nD1obbH2
	tU2ESbotrWFWUJ//01PDKWTHVG5nBTg5dnJDy1NWzCEh/A4AHYBgFZhMIt4ck9j5Z1+TpA5C7SQ5V
	41ObFXlnWuoFZYyumEGuGv8TuCNR2ukSd3udC7ODhKbgq21CWdicce8IIkPZ1NOZNq0UQdjfwdjyi
	4qYsCvKzvWyduBmcrA/yIrUhW9GCmoSwRrbgMB9wLD5jn5liHgxmlB/zU4/b9F/2fE9r2A56L9eb7
	kERHz49A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3iJ-0000000D9bl-3X6Y;
	Fri, 25 Sep 2026 11:03:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA3iG-0000000D9bH-38UM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 11:03:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YbGQ1193851
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 11:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KL5UvpKHjzpyxWhNGv3591jL
	faKqMWyF0eLovdVJgck=; b=h8SJlM1opHmnGymsHaTRDEHKvmL9+e3QVetJkJ3i
	9jw5a5FJ7Cp+O1glWFBGzl29UZqmQgNSsq4/6Gs57GWgTNG1ASnk7HELCgciBBMT
	uSTYoU84eVK+CqNWekYhkLrtbYQFgMOwlcl17YOQrhuAluPwBX3uewKW71EvEa5/
	XWhcK2PHbFjl9RordTtUjXuo0VWyXGRs0L4QJMw2kPLhGRjzLaOq5DQsqxUuMOkD
	j9K0nwJgJM64bMSregfTs3zKL0+KCiC1KwqxBYkxI9Xa8fwKTlYphmQ+AG2syVCK
	pP2PhKHZfMYG50MdN1LuZ7oECpjVGaXkj4srjuV9Ej631A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874k4we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 11:03:31 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso202839e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 04:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790334211; x=1790939011; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KL5UvpKHjzpyxWhNGv3591jLfaKqMWyF0eLovdVJgck=;
        b=YEN98v39ro0vtbtOtvRA2KvpErAuXEBwlstBF1OIEuZPGr/vFOQqpdRe02rS9b6Sqp
         SbE0oN229QSJX1+45yudSjLjl+W0a7PBQp98VvOA5ptHWe5shHfWdK/GYJq5vFUn7wk/
         Fte9rokEBO9TL1KFYuhLOtoCx/mRKZxDINIRRV1AX1mBP8Z3mCWxbWEQo/YBT2T2ACDN
         RW+8a8eBPCoA8/o2MhfPsiNC6X9G6f3n78y9jFRLc9uY1aasBgBVrB5ETvOumHSWfwVT
         VH3yd4MDTaNf5LEH3aLsGbenuyZYH3rwGpywoJat1lH+SbNDoUAOzjb500GPBr2+dxF/
         fkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790334211; x=1790939011;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KL5UvpKHjzpyxWhNGv3591jLfaKqMWyF0eLovdVJgck=;
        b=EwnsoJynFs3hPv8uNvDmz7jpbr1uk03zQaby3Rm9Brxgb5VT2D9nwWcKO3bnF0km0x
         Q+60XvrCbAistqI/fnQo/TVKg9G/65kUC8BC1LUeZD8oD0l6hBrHrR8LUKF8IA7hX7LL
         b4+YYV2Uu5vmBcsh3Ws+SpCmx8kvlf0vNjh4Amtt65x3AL1f4HEGFG+LkHXXhGCz8tkz
         sSD8FyMovlFq+2A+H98TAW5e/gb6ja++NIWYi+k18mXu8YqqW+NX/jL54xxAGez9RcCz
         YcMhMpkdiU7ABZnFF++ydN4rcQBxD8Wamu11w9DCLm0gKA+/892iKmhkou4IpaOhcLhq
         0+gQ==
X-Forwarded-Encrypted: i=1; AKwUvByIToz8STawic1JyuVqwc43W9LYx6W872dSutMAtTdpcvglnSVxGU4wYJk3PgAd2+F8g3jJfyH9z0le/M+JmRay@lists.infradead.org
X-Gm-Message-State: AFuF++loPUf5AFLve29hU9QSLzj3AzB2fVAraUBlE+s599OOwhkcOza5
	QTbpkbaK9enWJmZ2BJsAHyGx9Q0njAvsj2qbRHn3CMYwnxAhvvr9M2fTfOIwbMaokaZOWksj918
	C4jU/KdQxM3tWe5K6aMbJHi6zsX5AR9IPgjLa/JXoJu+H4QseIruHUs1iAZm4vSVRkXHDo2Nl7+
	YPGw==
X-Gm-Gg: AYBFou3Uha0lhhMai5d9p4z/kszQDFZafquefdpXy0NoYJ6zRF2O5/eeLEucVxZZVX+
	gmZtFLBor2fJVHATudGCXzW8IpjoUoFM19lnOqudvDDqknyhpE1RaQc1w+VRW9/443EREapdXWY
	DFKtYmkdrrAP9dHO65KPQ1D2vi7w6UGqgc9q2v1IFkHxA6/Nkycxj1kwR6XdBWMTS/Sk1HkVNyx
	7BKVBg9H0aTszz6KjkhFdONqpVBp3mObqRZ4e1mt8cd8v51RAmCYOOM/9sNN+Qe2I9jzoEbBJUE
	M/Xd028aHxWJhXvS8Ubx/IhFASg5rIzyQNwQ+wHPTeIeZYAn8oTbaeJMCyNhOA9eEe4yqRc6Bkk
	saGtdYy0SqtI5AA==
X-Received: by 2002:a05:6102:160c:b0:7a2:4b76:55fe with SMTP id ada2fe7eead31-7af1eaeade3mr2080943137.21.1790334210487;
        Fri, 25 Sep 2026 04:03:30 -0700 (PDT)
X-Received: by 2002:a05:6102:160c:b0:7a2:4b76:55fe with SMTP id ada2fe7eead31-7af1eaeade3mr2080917137.21.1790334209864;
        Fri, 25 Sep 2026 04:03:29 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff04440e2sm48935915e9.0.2026.09.25.04.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 04:03:28 -0700 (PDT)
Date: Fri, 25 Sep 2026 13:03:28 +0200
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
Subject: Re: [PATCH RFC net-next 5/9] net: pcs: xpcs: initialize runtime PM
 as suspended
Message-ID: <arZVAEHs04xLNXTu@lore-desk>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-5-4b1c682af70f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lVoFIgUXX7x55kE9"
Content-Disposition: inline
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-5-4b1c682af70f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 74rFIrER5PIsuY46fH8WNfRNu-6l_JwG
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab65503 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=05hQUwIZQIh6G6I0U8UA:9 a=CjuIK1q_8ugA:10 a=QVkzxUxUNwT0qHlZT5MA:9
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MyBTYWx0ZWRfXyLiJgHjKB1c9
 SiuFzjdKe9fBQ/MphmHOey6mhM2qOUoP2xEa52ah1nfPFv24wv4Ko2cjJ4XFNOej8aqtom8MPU8
 6yYMGbJEUuBMywjNN192EpVPzT4LvgXLttc4Tvv9FrE76FdT7+D6QptZRpQS25bQx2VEyrqufbU
 RW5ou+dTouKJSf/Wu09qIoltwZwXKPuPELyMCegP8RfwTe6pNAPV27Gz9ZGzpSSa0AIqBE/rwZX
 zD+A45hWSeiry3iznYXX2wVIho4PkHwK7r7OVDN5ftDQy4Vr6wbb1QxN0z5HZqeH5K0zV3Uwrfx
 Wlp/eFm1MiAttcSKwzmX5Z5d8EtEysVoaYktYNIIXGzkI/FmwJvOojlGRruYBqHWyIObc8gAIEQ
 R6LAhwOvGz1+qlFUMj+cjh2O+p5LI9GZc/zqXECkLi97tTIg27uVSwMP9L9DRdMGc96VkJsINIM
 PpeN6pWQ7J2qTKxMrqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MyBTYWx0ZWRfX06WzDVkPdRQS
 cnlhAtdzUkHyKt3Z0CmyW/NRYaMPmVySPfKOIL5GcXxsMrGAHIcsc4S6JHLtmuV3n+LQGzPKNGP
 /jT0Cwi6TTFsC42FY9yL9wSJuBXEhFg=
X-Proofpoint-GUID: 74rFIrER5PIsuY46fH8WNfRNu-6l_JwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_040332_806128_05D3D69C 
X-CRM114-Status: GOOD (  25.71  )
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

--lVoFIgUXX7x55kE9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> xpcs_plat_init_clk() acquires the optional CSR clock but does not
> prepare or enable it. Marking the device runtime-active at that point
> makes the PM core assume that the hardware is already powered.
>=20
> On Nord, once the XPCS CSR clock was described, the first
> pm_runtime_resume_and_get() accessed XPCS registers without invoking
> runtime_resume() to enable the clock. The matching runtime put then
> invoked runtime_suspend() and attempted to disable a clock which was
> never enabled, producing an already-disabled clock warning.
>=20
> Initialize the runtime-PM state as suspended instead. The first
> register access now runs the resume callback and enables the CSR clock,
> while the subsequent suspend callback performs the matching disable.
> Check and propagate the state-transition error as part of probe.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

This patch seems a fix to me even for other SoCs. The pcs device is marked
as 'PM active' in xpcs_plat_init_clk() but the CSR clock is not actually
enabled. Moreover, the CSR clock will not be enabled even in the pm ops
since xpcs_plat_pm_runtime_resume() will not be executed (the device is
already as PM active). Am I missing something?

Regards,
Lorenzo

> ---
>  drivers/net/pcs/pcs-xpcs-plat.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-p=
lat.c
> index e013a5253a22651220e62352d03faabc3a3c3658..328c50940d46eb8e7bea06ecd=
1a20214e3cde61c 100644
> --- a/drivers/net/pcs/pcs-xpcs-plat.c
> +++ b/drivers/net/pcs/pcs-xpcs-plat.c
> @@ -322,7 +322,11 @@ static int xpcs_plat_init_clk(struct dw_xpcs_plat *p=
xpcs)
>  		return dev_err_probe(dev, PTR_ERR(pxpcs->cclk),
>  				     "Failed to get CSR clock\n");
> =20
> -	pm_runtime_set_active(dev);
> +	ret =3D pm_runtime_set_suspended(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to set runtime-PM suspended state\n");
> +
>  	ret =3D devm_pm_runtime_enable(dev);
>  	if (ret) {
>  		dev_err(dev, "Failed to enable runtime-PM\n");
>=20
> --=20
> 2.34.1
>=20

--lVoFIgUXX7x55kE9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarZVAAAKCRA6cBh0uS2t
rLCrAQCobR+wMwviJitki0D8UXg+bk1Lsss+ylzGxdzBJPlCvwEA06MlQVLUPViq
8IliKoIeVuqVM6Tj5hwuPKqdwtvAwws=
=qJHD
-----END PGP SIGNATURE-----

--lVoFIgUXX7x55kE9--

