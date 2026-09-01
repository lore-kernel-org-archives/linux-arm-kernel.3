Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2368C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tTkCcMq6zotwRicGA7neKe28S4A5lFqmzjTU8MYQPE=; b=BXo5W7MpzE0a1r75/RKTosZ6sC
	F0vasq/4QqwpuE2RzVo8SkHWMPtcXq3in3HyG8fmZxd2+I+QEW4CCjQmQGPYZC7tu5OvmiNwc20Ft
	NAr1mRvRSGpweYDCdcsPFFIEKTRHW193m3bwikjxbZiVI3b22FgvhKkYL8XY8Ok482mCjLFyDYEDR
	rTS+sgzKLRm9INVp44TehsSmN4iobSwjgMqifvknkz8U7GZmIQT0/XYypfnJiXHhTvvoGNIgBv9Ce
	CsH8D4UudWZcxEmqZJ5yRbFVMBDElgfB2Du98mQEjrAIATIb0boHdr7nmoVpcW/8OXGUPp+MXWuvI
	LMak+aBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KSU-0000000BNEd-35mH;
	Tue, 01 Sep 2026 09:07:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KSR-0000000BNE0-3QJP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:07:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179C3T2061566
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 09:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4tTkCcMq6zotwRicGA7neKe2
	8S4A5lFqmzjTU8MYQPE=; b=jKW8ZG75NTlQIR4jrv4KkMX72pX2UEteYN2bAmsO
	TnlxoaPY0S2DF/s+10YQA+xdqpd18Tr9wSiUdhAiEVA71d72RSVlm4BbhFgwSpFw
	/oi6x0BcXQhDsWz2d2lE4fFfkmUsIt9B+k8AHS7RlYY+OPx06D8vdGK1U8pMA8O/
	YF+NbdUVd7kCyYkS7QBAg1IrB6DNHDHI01f3YVVDY8cC/D9RNdut88RTR722EK2D
	YkAgLxJp5CwCmQtNwX2f74ds3hHZjdn746qnUOjdvlIRoFLvxyFCBCJXoKqShRNd
	Qb6gFWovopyyidhDmH+EfxGpT/rPDG3kXF4szs493FxrGQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh17n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 09:07:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so894617685a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 02:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788253626; x=1788858426; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4tTkCcMq6zotwRicGA7neKe28S4A5lFqmzjTU8MYQPE=;
        b=R0Zd3WOLPywZmzGI9p8ZA5ub/TrbXF6f5qUabWKz5GIn8rbQlqyAqAlILCIoBgvZ1O
         8PxDSHsrSgje04OgDKQHIQXEqBCGOM1Xtial69pgm/hHM1stCH1DzLHbaWl68SJ/pKdN
         9cO1BMIXQu9tYxd32slbz0QAky5hoU0tobViON5IqnUrtruZ95/yIveuGSIayyUX9Liz
         sO12dDxSotQrZcKMqX8Ib/wAbhSgLTOT9rLTRoxTpT+Rfq8zfz8rlFDiw65JS0Edr04i
         C/acerrsC4SjW10NtoIL05Xv12WlpTLJyFjoVspVBwoGMIOT5zjqaW0f58wvaDBUU0z/
         Iqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253626; x=1788858426;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tTkCcMq6zotwRicGA7neKe28S4A5lFqmzjTU8MYQPE=;
        b=iMWIM88cNLEA3He0A8dDbZ8UWQDqDsdOuYr1yO3H4mmfQMWYqUmQ23KFC1T/gaDJ3O
         UzYhJq2PlbFGN0u4QceScKuwdSTyKh70KyTQB9G4K68lq5l9jdExHj34d917s3Fwb1vY
         qNi86Vzo2GTcBPD3ZsqQwHqn8+M2VzXQZQVCfnxkIwyT7Yz7J+RK+hM4dVTRYCYlEeiT
         Q2k5IK1kXahzrlFo2dmQt8MMdbKYIDo4fgRik8FxU1OEVlBaTLiNTsKHv7BMlrEjQi3y
         YhSdHmCw3whfWAYAe3sHjCSKrP/eFQAUHGJwBWZ111HA25fHGhRSVzRBGYIFtHjzz2eh
         hsXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHg7SIWUJGLXH9IQyXEKSfaVPeg3MFrEeHu+Tvxu3irt/lYf+SP1wxyxC1LRNZs9kqPZnXdGZQ7ktWdFf9LnqU@lists.infradead.org
X-Gm-Message-State: AFuF++khsqBs7I4pxd02x5Rcy1UgaxFX6G4F1Qt6V4QYWcedLgNPS///
	Cku/XCReyjDvYaygPCG5PpqS2RhpLLhxlrHxDup9lxfm4rTHT3jlIffWAcDW71sGfdtRf8/a2ps
	XjEn1vW+f4f2XmEpOHDzxoqnau+VIRYKlu7irDyBuINVsnRDl6J1TnL0wpLAiJNL5hJn+F+OsGd
	/gPA==
X-Gm-Gg: AR+sD11bxUOVEIXvMTR76JdMEJUl/gxvQ9C3U78HG+7m1FsQU8Qf8ppKKLKQfPybg8m
	Jl6o3WFL+6SXXRzktZyHIYkwhSG/9Rjg/RMbHWDgN1Gf5samYqPty1s5M73MMQ56VJ7P1rQs/Lp
	ZH9JjgdVVhPrtBxK9d1B5SlXUgxSFXD5AnTtuHh9ra+4hEdWLXZnsLkuZqvIBdErK8PX6qXW+ye
	2HzFSTU5QnBlH3tXBoLR2VnFc+9oTZ5RIVjsqB4Nf9yDSQdvK+BIECWWNhIfYH4JNMCCS5p4Yys
	YRh6wQtSMVczXEBkiBpbVRC+nppG15ixoef3pqDqqxk/vsrkfNWKd8Sc3qE+TGp/aUsUSwVknwT
	ozwsMvwLbXhzzEg==
X-Received: by 2002:a05:620a:440e:b0:923:7821:dc0d with SMTP id af79cd13be357-93948132c08mr841860485a.33.1788253625905;
        Tue, 01 Sep 2026 02:07:05 -0700 (PDT)
X-Received: by 2002:a05:620a:440e:b0:923:7821:dc0d with SMTP id af79cd13be357-93948132c08mr841852685a.33.1788253625338;
        Tue, 01 Sep 2026 02:07:05 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d791a7sm3645264f8f.31.2026.09.01.02.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:07:04 -0700 (PDT)
Date: Tue, 1 Sep 2026 11:07:03 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Furong Xu <0x1207@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net 0/2] net: stmmac: fix qdisc configuration overwrite
 during qdisc_graft().
Message-ID: <apaVt5NN-FTjtTfJ@lore-desk>
References: <20260829-stmmac-fix-graft-overwrite-v1-0-a4f84c4c264e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+NEuofCU5XXUBBBx"
Content-Disposition: inline
In-Reply-To: <20260829-stmmac-fix-graft-overwrite-v1-0-a4f84c4c264e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4MSBTYWx0ZWRfX2QF9PC+y5dyB
 GuEgk6mGLnCY/Z+m3gwCnndNgfqaKLUsb3Xm3xa0gyCYn2Gtfs7WE2GM0kBIWwm3Bj6qmQeFFe+
 PLgRVG8gZFJ4tMItiXtv6jTUs8CHx1s=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a9695ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=GaJwwe295ui8M3rlBr0A:9 a=CjuIK1q_8ugA:10 a=5MFtv9REYAT2gr-WTQEA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 7KgfC8RrRcpZ3YgxhgGFn8DkANq7hSff
X-Proofpoint-ORIG-GUID: 7KgfC8RrRcpZ3YgxhgGFn8DkANq7hSff
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4MSBTYWx0ZWRfX/sPN2q/zkOPU
 pYmsA69QtYJ8boNd6bJ7qN9JZ4fgxU6GO+5Bzg56303SMzjthE0NBqvBiIJVQmu43JuSyQIe0GW
 Ks0iK/z0B7oS1d7J9QATVrzShZnL3SJodwa5+JssUZY/jUG9dB3FnWvQn/+OuBFosBV6LKXLaOH
 /2rxLPD9X00QwcnzPHkJSf69okU5SsGXagg7jxt/jeLff4d07J2HrOjuMvkYOPfV2rIm4Ytieay
 tRGx9dulmCCl7191kLNE+cLvFKN1VRflGhuVQiaG6yKH9VNDIq/ptI05l8seSsb0vJJiyOtZP/B
 ZD0EQ/Z3pQJaMebQ1OHj0GdjHefCTgePbhJmEspCgJpcEgScgL2ZD+K9yA/bF26KNlWC2KvAXH0
 PDwTmAO92wzkazmLmaof7RpzZ2w3Gh9iPJI3ye6LLB92xBJf9JpaSp1uZ8BUJakDgpbLJebk7ja
 V75HnwXSjnOZXeJj4oQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_020707_966229_4C10541D 
X-CRM114-Status: GOOD (  15.60  )
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

--+NEuofCU5XXUBBBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> ---
> Lorenzo Bianconi (2):
>       net: stmmac: preserve real_num_tx_queues on mqprio setup failure
>       net: stmmac: preserve FPE preemption class across qdisc replacement
>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h    |  7 ++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 97 +++++++++++++++++++=
------
>  2 files changed, 80 insertions(+), 24 deletions(-)
> ---
> base-commit: 2188569e7e1b0bc3f3b557dc97ab7a02befc11c8
> change-id: 20260827-stmmac-fix-graft-overwrite-d3ec2e72d901

Please drop this version, I will address some sashiko's comments in v2.

Regards,
Lorenzo

>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--+NEuofCU5XXUBBBx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapaVtwAKCRA6cBh0uS2t
rJT0AQCa9ps03VLvVpsG68lb345JfNeswBHXjWyOPPGvKjsjKAEAkoYEoKyPKGei
DAnKuH9j5nC3/fVKBpAavY/ehooieQk=
=+nd+
-----END PGP SIGNATURE-----

--+NEuofCU5XXUBBBx--

