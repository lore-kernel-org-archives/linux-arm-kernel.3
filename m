Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EED1C79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1YWjulGrHQXzMx6OGl6R6SvTvcP7k1AMvCnp6YruR8=; b=ujux3W79nyetcmIfvI2O9em0/d
	5PkIzLU9uIHgwo7lBqsflLniJv/LIDlZmy0Umb2Ryu1g5azuwHJM3f7/WLxySt/bExnVSrsFxI07j
	wjdZnQCuW29PGzBAkVP5aMUo8MJ3965arHXX5vT6g3jMw1Oa9CuNB3SM8Flej6S52fqLhA1w/diVK
	XGwxSQo4aUIJzUUDCfxdpdO0gcDm8fq3iEHWAYvp3XAKht4TjCeWOEIepKSTeTZ3/087TDSyUUQzq
	ZMsSTIYDlX9d1Uay9K/GSgmX4cFrsr+cGk47wIq+PW5Q3ciE1B0ZCSv6pyamPwrd1/9e645fnzRH4
	PwZZ0t9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lmy-0000000CR4P-3myo;
	Wed, 09 Sep 2026 17:08:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lmw-0000000CR3o-03KV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:08:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H6wKh1388981
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 17:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G1YWjulGrHQXzMx6OGl6R6Sv
	TvcP7k1AMvCnp6YruR8=; b=daU+XEpvUaNWTAd7+b1SU8Ge0rZiT+O08N4gzT16
	GAEJfsSPMr46R0FtmLfAxckUf2f75A4bdPaMxyqfiZmge+YYxT5wh7AIHoWP9+/s
	Y2kq1Goc/+rdh0ejzvWMaKzjLr41xAtSuEyLdL0AqKmiuFhb6jO7xxTxCC9Jdp9Y
	+NTgeYQ/fwaCLBVvv12wUHBQUIkus23c/FEr3ihrNAEEpqoF22M67zUXNTorLOvE
	cFjfkntCrHhcIP3AvvzxsiYgmRQWqoIHjVpMkxdnLYoGvMpVwRYNGOznlbe1yZeO
	oXySDHwPKkPojs+Psp5VvQgKqyIhCnV7NbITKGX8OofBFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk9rh0qfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 17:08:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso782412785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 10:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788973724; x=1789578524; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1YWjulGrHQXzMx6OGl6R6SvTvcP7k1AMvCnp6YruR8=;
        b=iqCFnJd2HQf7RidPbMWSyfgoEUX4zLmbNNmcxBDalEs14KJQpTxA155VfsbE6FDXHp
         X1g6lRZ/3XdZLbT3XzhSFt7Pc8XzAbdrOxg78k3ljCcEs620rTJ9XQ6xC2NIRHZ+oJd/
         +qMfqJBMgY78wHnramn4l0dxdsgYCuZJV+hsvbQneohC+M1JC3tZBVrLFEIwPBCMSCIU
         XFy4UGJWhtdH+OfhRAtXbNVz/vFngOTZ2FeFzD0TM/MXZm7hrPlyGs3CBNlBvkmbkONL
         J8DAMPumIlc0oBOPxTvYqb2nOnD6ARfAiXXBOkJQsuKM9emghRumJVK/T6Evyf+kSxUa
         9rEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788973724; x=1789578524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1YWjulGrHQXzMx6OGl6R6SvTvcP7k1AMvCnp6YruR8=;
        b=CDaeLb3GPAxvP1kYN9h11xZU9ecaMxPBcfY7uvoYgCwUu1MSx7w3q9Ckr5SYoF1uu1
         anBGuSEWJG/Vi+wAn+YdRHzDHvl67oiZDeP9+nqz/oW1rfhhSdigLPgKEEfWc85Gcix8
         wNb5NbtDO+GiPInGXz1n4SpPQp65mKbgPKnVPpnPm1ZjIZVOGegD5tMX9gKs+W8N3v+i
         ohPgi3UgYj5BqohsCaNlZGgDjbephpX0tUgDAQXfzqGkFdvCHzUNMemOxvSqb7tiDXEc
         YRIDxLf/0x4Ilc+8xEYwNLYWFP8gU/10nH49+kuO7iARMk8rviy3BFk8SMEQPz0OtlTa
         ADOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQn8w1CZ2RFVqAdkAGiFKcNJ64AVmJcUqbH8scp4NBRpALDpApL/3DjQ5wsmMP1JC7YkwEyGWWKoWX7hsrJflH@lists.infradead.org
X-Gm-Message-State: AFuF++n/wWuOUHay9BjRki+eF21k0xSSgfqNeT1D0DoNENujphnBeue8
	JLG09jAW/6AGJ8sYyv3GGnpC4nyicHksfsbUuUmqaiDzqU6PpvubLlk//RsygUZ49Ii5Gr25Flg
	IvG2ZlJRxaVDgDKVuJYjqIS0LoH3AaS/DZ0C8D+FMUSgbIpUJMjBhQk9p1kpEQmwnxWJsKulNiK
	Uf+g==
X-Gm-Gg: AYBFou3Ly5Y2LkBCc62P13070ftDFC87H95GyM3BO7uEh+tpcfejtM9D206OOWoEvMx
	miAGrf7f4HUlAubDwZ/3ECe/XSZPtwylwPaFJJTTAAIuquN+PiTdQXgypDQQFJfVfDYuJKMhaqC
	7bFMtJ2slpke68CBbEd4WnYlJt7NKlqY9iomKvVI4j4oLyAWuLxXef6j7XEyRkdEiDPvxJJHvvy
	dhvT+a1sWEAnu2gfQnjwdFnAQGHdSh8Agfnx35aBey1LVlN89gwFSFNU4GAO5WvFTBS6SCQXTU2
	niMElo/mccdCavuzaXHDiWiJygqJ2ECmmqLqMJt6tu+8LNi4WTCwFFRhr6NMxLOS/bS9PZ4ZRZT
	QM3Mm8KsHc9eV6w==
X-Received: by 2002:a05:620a:d89:b0:938:39e7:725 with SMTP id af79cd13be357-939c94a60ecmr1014705185a.32.1788973724290;
        Wed, 09 Sep 2026 10:08:44 -0700 (PDT)
X-Received: by 2002:a05:620a:d89:b0:938:39e7:725 with SMTP id af79cd13be357-939c94a60ecmr1014685785a.32.1788973723191;
        Wed, 09 Sep 2026 10:08:43 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfc1sm5185045e9.4.2026.09.09.10.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:08:42 -0700 (PDT)
Date: Wed, 9 Sep 2026 19:08:41 +0200
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
Subject: Re: [PATCH net-next v2 2/9] net: phy: dp83867: add regulator supply
 management
Message-ID: <aqGSmVslLLsp7tJu@lore-desk>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-2-bbe3389d0652@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c9IX8H6zKLOh4Z/N"
Content-Disposition: inline
In-Reply-To: <20260908-shikra_ethernet-v2-2-bbe3389d0652@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ff8HAp+6 c=1 sm=1 tr=0 ts=6aa1929d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Tc_FYgHOodJxOJMde3UA:9 a=CjuIK1q_8ugA:10 a=eESnzHPFhmDI2KvGUDgA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5MSBTYWx0ZWRfXxlqxSc7T6Ft3
 IoXjuAi+dOTcuI4RFN7n4ooViSenTaUvuZ84whtqpEjOA+fgqxl6EjIvt0DcCJTrgzQFGuY5VcS
 L1+Mj0bPvTZJJ7Wdcdn7CE47v1lMtL3Un1qt9/WskoSxhtjiEunEkv7qNYfsfDx8LP804p+wNR/
 /ocKCCQII+9UYZ5XllLr1+JjMj1FyANN7uNgtveY/GqQA8svH5yHyFdCWwFUo//LDRvkwKE2zsh
 6pio7FvuPHTJ+EIIFUOzv4uOy4kn5BdC29Xh0cfVnRpVaVjFZ1kgqDc3r+FhwcyswtKAS004i25
 EWj2o2hbuq45RPzGitrK6KAejDtn3lKdTGYTm+XbriQ1myXb4taqnmlXS7wFVQYdAlvSifpoVgW
 wewbol7cWRFQb4tPGgYQTBEShMSpSKMS6YVsWKaGp4j0hf4Q2Xkr6tSBkB3uzg0VGnOfgytMgrS
 Emyt2R7EzYFMzCQHePg==
X-Proofpoint-ORIG-GUID: xiHkzeVDeEU1MmrWFcFV-dpSM0w65_FV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5MSBTYWx0ZWRfX7H3Mfk/dkMr2
 se/ZC+9efUhyuQux0l6oBTUtfW2vqN/Z0PP7H6mDaJKDPNjkP/z9y5RkfzJgH7pK3NXH2NKG7q+
 019m7rqmjLIs8oqfSUc1tiRrvsbb98U=
X-Proofpoint-GUID: xiHkzeVDeEU1MmrWFcFV-dpSM0w65_FV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_100846_070193_8E4CC36C 
X-CRM114-Status: GOOD (  27.63  )
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

--c9IX8H6zKLOh4Z/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Some embedded board designs use GPIO-controlled regulators for the
> DP83867 power rails. Add dp83867_power_on() to enable all four supply
> domains at probe time. Absent supplies are silently skipped, so boards
> that do not describe them are unaffected.
>=20
> When any supply is newly enabled the driver sleeps for 200 ms before
> returning.  This satisfies the post power-up stabilisation requirement
> mentioned in section 6.6 of the DP83867E/IS/CS datasheet.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/phy/dp83867.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
> index 88255e92b4cdbd6da2e2c1d10f9c72348d28dbc3..dbeee7cad6f0cbfeb127bfd28=
f43ee2a16c78879 100644
> --- a/drivers/net/phy/dp83867.c
> +++ b/drivers/net/phy/dp83867.c
> @@ -15,6 +15,7 @@
>  #include <linux/etherdevice.h>
>  #include <linux/bitfield.h>
>  #include <linux/nvmem-consumer.h>
> +#include <linux/regulator/consumer.h>
> =20
>  #include <dt-bindings/net/ti-dp83867.h>
> =20
> @@ -719,9 +720,41 @@ static int dp83867_resume(struct phy_device *phydev)
>  	return 0;
>  }
> =20
> +static int dp83867_power_on(struct phy_device *phydev)
> +{
> +#ifdef CONFIG_OF
> +	static const char * const supply_names[] =3D {
> +		"vdda-2p5", "vdd-1p0", "vdda-1p8", "vddio",
> +	};
> +	struct device *dev =3D &phydev->mdio.dev;
> +	u32 count =3D 0;
> +	int i, ret;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(supply_names); i++) {
> +		ret =3D devm_regulator_get_enable_optional(dev, supply_names[i]);

nit: I guess it easier to read if you do something like:

		if (ret !=3D -ENODEV)
			return dev_err_probe();

		count +=3D !ret;

> +		if (!ret)
> +			count++;
> +		else if (ret !=3D -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "failed to enable %s supply\n",
> +					     supply_names[i]);
> +	}
> +
> +	/* Datasheet section 6.6 suggests a 200ms post power-up stabilization */
> +	if (count)
> +		fsleep(200000);
> +#endif
> +	return 0;
> +}
> +
>  static int dp83867_probe(struct phy_device *phydev)
>  {
>  	struct dp83867_private *dp83867;
> +	int ret;
> +
> +	ret =3D dp83867_power_on(phydev);
> +	if (ret)
> +		return ret;
> =20
>  	dp83867 =3D devm_kzalloc(&phydev->mdio.dev, sizeof(*dp83867),
>  			       GFP_KERNEL);
>=20
> --=20
> 2.34.1
>=20
>=20

--c9IX8H6zKLOh4Z/N
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqGSmQAKCRA6cBh0uS2t
rNquAQC5wJNUN95Ep26s8XtzLNRj4JBV+qFthkyWqQAnIRtBTgEA+pcM+Wip2fRN
UHB7AACiMwvDdjPTHaF37W2hm07h/g0=
=eyly
-----END PGP SIGNATURE-----

--c9IX8H6zKLOh4Z/N--

