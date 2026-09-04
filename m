Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783FDC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08F2XPDmp3MN/acIJE0scEdKBWxNouhbbHVqjQV+qoU=; b=OvtfC34j46yA6dVqVws6rhpcmR
	bZlQCgY1rg+ZE9LGYjpzhu6k7PSKFfGLJQkGtSM9eMhEWtGXpjS+JVJSUAVjm6o21gV0Unq5D7+9l
	6uBBPYG6dT95P2sXywaZJ/90md1TegS99xM4IGbf6oyTrHK2YtZQCx7nbwX3dC4Alk4QBd+octyb5
	F6dycUIaptrzENr1EvNzc+ORoUTarJHP6tRABcDxr3foZmzPOgW6Df0728dz0wWs/ROnToNxpoUJ5
	i03tPJbpR1WsF6mAV6kKklmiQG8NyGYTcCuMfEZOmhJNDzp306ClpyEBenlBpzEeB53PHuB9BQu2j
	nMaCRBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Rbg-00000001ktW-1KaR;
	Fri, 04 Sep 2026 10:57:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Rbe-00000001ksx-0OKC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:57:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIWJP3276322
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Sep 2026 10:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=08F2XPDmp3MN/acIJE0scEdK
	BWxNouhbbHVqjQV+qoU=; b=HvIvCLqpJ20kUDEiM0nhgKqDP0MIZkstiBk8ScTg
	IQvnKmse7P8c2pE8j3ctW09mxIyczAYT1qg6JtC4fw7lRekqro1hAwLRaXCO0V9T
	m5S1qIoy7N3ftyl4s0ChrgQ8oj8geuZxrdBLDI3U5R9DXw0HbZrn0LUOzmq6AjDN
	1DHfhAZWjtTZsP5Eag55WItNORwYTgUSkpKvL79QfwSMZq7J1bOFwaGFU/erHLff
	bieNvnTk7sY/dzeQigKpTh/qoarZ/TK5J0tQLxi1vmJAoqog/SlfsWAFsZT6sYjH
	vS6h4vwfXlGR7EAt88UecpVKxCLWH7Jq5y7qx5xrjNs2fg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd12ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 10:57:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so141041285a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788519432; x=1789124232; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08F2XPDmp3MN/acIJE0scEdKBWxNouhbbHVqjQV+qoU=;
        b=geqPtUhrQ5WnJXnCJbIRlqMuMaXN1DUfe+fFDeVNjcpZ6N5IBQ7N29HJ6QHXMp9azw
         yzvuwr/nLZN2zvZMN0Eh201FLMn9R6MjU+6oFR0JKajBPKGLPptwbDdY5inyssDVpa5S
         b1OpNUhcrF2LFKBV0bfV35mIFZHBnhgcw1TcuGWx7okUH3vtzbAKxGZyJxPT1ABSnhOI
         Znd3F01JRxNoVwO7OUK3ugVKY/HA/8KHKIFR0KGsIps2USzg6JHF0LnqMMDGUMJmYTUC
         9YYbZQLFag4zIlM/X7908fEcR/I9xRPY6smOgi2xxDrgW/SOeX+CD0YWbpQs0ewIZs8d
         Ww6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519432; x=1789124232;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08F2XPDmp3MN/acIJE0scEdKBWxNouhbbHVqjQV+qoU=;
        b=tQk/PiLTI1zK2WTGAC4/jWakN8PAv5I7i6CM1qyi9EvaS6DfVCtL3Er4V+zE7KxjuH
         WGpuTzXIn5toQsiFITW+moEuivo7jGNoKs8Z+uJvlCfgnm9ImfPdz1KaFdwDCOiPNGWA
         adE/akzIxfTFEq028IAj+1tbSM0MIjbR+OhNEw8VBJufyJ2e5XraeyptP9l47oqwK7Td
         LdBn4yg82qw/p0x+u1pmH2KuKYL03TNr+xeqSbQKWKs1zjdts/uICsEg6X2brWUJ9CDU
         TmiFLqYbjcSfMkYx5b5basZJozZwCCL+hK0ELVsKNtjLUlRjk5s1ZrMA1j5pNaj62FOx
         pcHg==
X-Forwarded-Encrypted: i=1; AKwUvBwuAd95yNI0E2IkH2xZaznUJ4QkK07xIrMtF+zVV3IIf0QV+i+LdxUk3LdQRytbCQAO6LxKewf5Bn+rtWRfg8no@lists.infradead.org
X-Gm-Message-State: AFuF++nL65QeDKp3jnnMIavRf22M7aij/u7OYsrlnds0V0/oMVarfQxS
	U4pg0HoAyc/YBcHOZMGgSG1ybguEBe2aSb3fE8PRIMEOGOmnnl4sooMtV5PzZ6GSBV+hRJlgqBG
	dgdoW0BGMBuH4nHeFJINmw4iZvgxc7jAqLJFIiKDKbkVAFOsENy654Qq6kTxZNrqUJcm1REtoeo
	0ZrA==
X-Gm-Gg: AYBFou0MLZ66wscV4akqnuEVmJUrBu7sKQcCu2ixyyYylrX9Jy+nrcXWMNGaM7Dpmlb
	cph4MIArbJbXh+Z9OadjADklHn3u4iKeVDb3/22xWw1reW4tfATTdYqUcEhvdWD3UA59TKT3UFT
	xxsV3Eu8G1pR5MOMnucAKfYAnqepjWLznkcNSm0fNi1zaz3rFs+LD3LlqfSuZycK/IjcvI4O/z1
	xtw0zUyruFcMdHPtmGR0rLCg2odoxG2N4EBNwonlT21vGhTshycc7PyYYnU4R0QO4MkxNzji4Nd
	GjHcQHJox4UCudppH9a4Ga/rPOT5rbUiInHweRZKtTd06mCfrykeFv2Bx+VU999XPruN+tFxn+4
	AeeT8ZXVKCI2fOA==
X-Received: by 2002:a05:620a:404c:b0:939:3cb9:553d with SMTP id af79cd13be357-9398048b9f8mr469237085a.38.1788519432440;
        Fri, 04 Sep 2026 03:57:12 -0700 (PDT)
X-Received: by 2002:a05:620a:404c:b0:939:3cb9:553d with SMTP id af79cd13be357-9398048b9f8mr469227285a.38.1788519431160;
        Fri, 04 Sep 2026 03:57:11 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm6543474f8f.12.2026.09.04.03.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:57:10 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:57:09 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: ZhaoJinming <zhaojinming@uniontech.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Simon Horman <horms@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: stmmac: clear dma_conf in __stmmac_open error
 path
Message-ID: <apqkBQJMqHKTUxEp@lore-desk>
References: <20260904-fix-stmmac-mtu-change-use-after-free-v2-1-91e680476921@uniontech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E1MazB2LUUx/XJQ2"
Content-Disposition: inline
In-Reply-To: <20260904-fix-stmmac-mtu-change-use-after-free-v2-1-91e680476921@uniontech.com>
X-Proofpoint-GUID: QKzdf-5UpzMP1Lo12drBr2MF5_lLLKfC
X-Proofpoint-ORIG-GUID: QKzdf-5UpzMP1Lo12drBr2MF5_lLLKfC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA5OCBTYWx0ZWRfXxv2RDOEBkt8b
 sM3jWm9doKFb5SbNzHM78wU4lbrY+qIYnk7OkCvqu7snwB2L8gHoFgFwrHEZaxm3032/NmjBHWW
 A6tVprKRVt5xnnFwXhrvvJfHpWO6eUk=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9aa409 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=iHwBjlyiAAAA:8 a=SaV9t1am_M5Vh_LyuNUA:9 a=CjuIK1q_8ugA:10
 a=sX82_v1_a9lhBkuKYFsA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA5OCBTYWx0ZWRfX6IrFPhC7ZGBt
 cJzqsnAvZtC8y3/c52NIxLe0cwirGSgGrYouisBwYWnSwe3SlUtcETsuzqECS2GvIEyMJJy5ED/
 tSzt4MNbO5BcnvRdQz91wWMIT+6EqSxVxS18zeY57qXM4jbvYuVTgt1hJ52f23X0BFBLrIgPkLL
 ABdOVNspXLgPkFG1n8N2abf+k4sVeGjE2GPR//xVAkSMU9OkqOeipaPwO16tMRN5ItYo5wlJqmY
 gxXEMhMYc1itqvAfen7VsLB19wt1ATBx3lkdSjMYEzbjPSbtxT5B63r5Gcj/cqmTA5EEleeuSVc
 shuC+F/Uygr4dVrnVWreqC2SfCNCqwqhTdd8QVqtSihvba6K99oWJz8Fub2qv6iewfzXmEXzbPI
 VTRjGJpzf5q4hNWlYrFOfGTGARsoaKz/XKdpQdsKA1lCtNjDFL4V4AnGyrjJOqg6v0SmxAow9Vg
 5GWAfHkbr0hGDgsN9zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_035714_249485_893799AA 
X-CRM114-Status: GOOD (  27.18  )
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

--E1MazB2LUUx/XJQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> __stmmac_open() copies the freshly allocated dma_conf into priv->dma_conf
> via memcpy() before it can fail, e.g. in stmmac_request_irq().  When it
> does fail, the callers free the dma_conf descriptor resources and the
> struct itself, but priv->dma_conf still holds pointers to those freed
> resources, a use-after-free that triggers when a subsequent
> stmmac_release() or another MTU change releases the resources again.
>=20
> Undo the memcpy in the error path by zeroing priv->dma_conf, leaving the
> state consistent regardless of the caller.
>=20
> Fixes: 30134b7c47bd2 ("net: ethernet: stmicro: stmmac: fix possible memor=
y leak in __stmmac_open")
> Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>

Hi ZhaoJinming,

I agree the issue is real, but assuming free_dma_desc_resources() always
tolerates a fully zeroed dma_conf struct seems a bit fragile to me.
Is it better to use a pointer for priv->dma_conf that we can set to NULL in
case of error? What do you think?

Regards,
Lorenzo

> ---
> Changes in v2:
> - Move the clearing of priv->dma_conf from stmmac_change_mtu() into
>   __stmmac_open() error path, undoing the memcpy() at the point where it
>   was made and covering both callers.
> - Link to v1: https://lore.kernel.org/r/20260903-fix-stmmac-mtu-change-us=
e-after-free-v1-1-c81dc7d6d18a@uniontech.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 24656b35350b14454fb10deced6516eb89e2c0c9..4369e64faf9f878aa20ac5075=
705044f55c5f8bf 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4190,6 +4190,7 @@ static int __stmmac_open(struct net_device *dev,
> =20
>  	stmmac_release_ptp(priv);
>  init_error:
> +	memset(&priv->dma_conf, 0, sizeof(priv->dma_conf));
>  	return ret;
>  }
> =20
>=20
> ---
> base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
> change-id: 20260903-fix-stmmac-mtu-change-use-after-free-693da6eb4a30
>=20
> Best regards,
> --=20
> ZhaoJinming <zhaojinming@uniontech.com>
>=20
>=20

--E1MazB2LUUx/XJQ2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapqkBQAKCRA6cBh0uS2t
rM/dAQDZOoJDs5HeJVYmNfdj9lanQiEx9EXr1USvD3sf/UejtAD+KxxYvB/7Bsu/
1P09VTIKMhSBbGLdyJNvqrrQNHSSOQc=
=8C6m
-----END PGP SIGNATURE-----

--E1MazB2LUUx/XJQ2--

