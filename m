Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C83FC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 15:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frtGNcVn5NDL/agSpjrx2zVobwDTBHuob92CW6m54o4=; b=DrbxxnI+s5XWjFND/CL+27+iKO
	Xm2SGh6EaENqd6Witoip/fWMZufOuO/07gtCqBQpQ+1lDZo2dDXkbEIpOqaaNASbcCgK6LZnG4bp9
	wVV1wYPPmnnCwPv5ADd3Di07VGk7l4JuPpI6OxdrTdYWM+xhc9N96oo3XSdzYlhf+3ajWJgNiEupT
	GWrxTHCjorgxGxeqtHrJT65EwPy80mjNNs6bT3DxLjyQPNgzTUXxa/RS0k8d/tsvZYG3QaULZgN38
	mh5zor0YDiULFXffPe7tdgfW4erjBbAhRznsxDGKnPZSOoVB8q+TMjUI9DMJ0K5c475xgxpbBo0vh
	JXDNn6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyt4C-000000012BM-2lhf;
	Tue, 25 Aug 2026 15:28:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyt49-000000012Ae-1zcS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 15:27:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PEU1FS2114524
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 15:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=frtGNcVn5NDL/agSpjrx2zVo
	bwDTBHuob92CW6m54o4=; b=H0nyUJKQMFJv6vMfFknL098fHZm3O+cOn8HaEN1a
	+ul83dAc3KQbPvOcIpJrVe1h3YZbhLa1W4KU5YpUtU6PV5jHyAtbDfuSkU7U2BCF
	+s6qHQ2iv0HOaaK6dH73j5P8kEAIS3fi+UJGtdBY3yCqIJuf5B+Bd2K0262ks771
	Mi91JKudN1zOi/+JpYzl1NiUgulk4zyw+C8Nymuipdrlc8X62Yavya9tg3F/8W3y
	Mpqb6N81gazhvU9dVD6JDMY7JHrK9zmmbEz51BlaRg9wV9CXHnitSNOee3UZst4G
	0oER6y8WXdmEJsU4nNmk2VRH+RzS7qj32ciBtuRMtGNEdQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9cgprc89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 15:27:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07f25de2so39072741cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 08:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787671675; x=1788276475; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frtGNcVn5NDL/agSpjrx2zVobwDTBHuob92CW6m54o4=;
        b=O1hLVJGoTfQ4PXYOBGiF11FbLSl50jrec0nMf6BGEN+5QwhYMEca40y/OVvnnDKPsv
         bzQSx9LhKaGbM54r4UvCzqtKd9aViqJyDPDuASEBMfi5+ZKCCFIFfG8GYOCXZCXpLJfH
         ocGc+tN6hcf1tX4cPb+Z9AACTVjgBKhdjoTj+RNvneCCrG6+EjkUTCSA6aIIAlEaBjVI
         gjv2Ew/rY3IXcATBTAKrmd0Ci5bLPRf6wmzufFpjsRnMtZZPevFmRar4DezANV3gf8Rf
         PMRoEyXv+C+GE0X/DFA2GBYepf1fyqb2zMsE9m3ALlkxI14646jL79QX3Zjagka0NY6o
         stqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787671675; x=1788276475;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frtGNcVn5NDL/agSpjrx2zVobwDTBHuob92CW6m54o4=;
        b=pTPy8lBYNMiuhAIj/eb8jXfle2HiKY4YxgErcn6nvJE+vBu8r5ZVUZVEsqpiAB8m7Z
         MIpwZSbF+kucdUz98XDezImgtbt29DRGoQfnnAQu90jc7GUUpbYHDrJY9WiBu63Pxd/5
         fnvRGt0JqxKDdk3WBQC7m+OgxwdwEeFYKyO99VgtWUCTAIB6DxFg36jBpsdqx/MmoM/f
         DdIMhtTDJNjW4dnwJQq+MqCP6cfzbCW5v8pdoDXJo/BiZ/oVbYLFtr2NoMw+oNNAwPLo
         QyjDCv6CjdsMqcWkSCpTrwrNxcFbb/Wn2uET/2t4mqmZuTZtdOAZlY/p04zKBizsJxon
         oAAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKFtYzxtAQVb07/fWkysO++eWosMAVjVInn/g/cSN/f5aO9RUpV+jLB9G0/22sOa35h4TDOWVBNIAipZ/r907s@lists.infradead.org
X-Gm-Message-State: AFuF++kTiN1BHpuyIx8T+7E1VmWAHluSfwCfuTmZ7IV8RFUfI+3tPzWQ
	pQBpBZ5RqB1ljY/YKAVXIjkDSUdtKGjXlSdq6ycST+I8yoc7qimlHZwqBWMLdM6lHkBCEOaWFB5
	080HyeVYtXmcBoQ8M5XN4jmxXSaUU54Rvsrqtl3DNneF/yx7eR2qP9mcLWkmApunqhOto7qWf6z
	OcnQ==
X-Gm-Gg: AR+sD12z9HXL7lo5d8VkB41psOSqeAjgdfp+jmYKKvAZPIPVPv+k/JD/hZhOaQhKdzS
	KA7Oqn4OKy3kXOiP7upl6RI72bxtCYgfmaMiafDn3I1zfG+0UZaS/35oxMrQaKCpGKOC7UiPXel
	rhXmlydQgagnWMFTXHhyTDn7vSuJX60dW03TAFFstkPI3VDVbHCqY0NAGlzi0a2zPaCQH/w/NcI
	HqHct18c6SR7a1ab2UESkBOxdFAVZIU7e0+9+RmxPp9prU+lw+zPhfvSLH2SiK2JDttL4mZt8AY
	QZcXR6yGARSxwLBT9Z6kCIg0b4eQXvQsPYHbhBCtehAotIgo6t2KM4MPefD4rnGdZF3Ui1Nei+z
	4eBafGoN9WuefZQ==
X-Received: by 2002:a05:622a:4c0a:b0:52d:78c9:9379 with SMTP id d75a77b69052e-52e2f144748mr79688851cf.30.1787671674789;
        Tue, 25 Aug 2026 08:27:54 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:52d:78c9:9379 with SMTP id d75a77b69052e-52e2f144748mr79688061cf.30.1787671674206;
        Tue, 25 Aug 2026 08:27:54 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d6acasm9422066b.9.2026.08.25.08.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:27:52 -0700 (PDT)
Date: Tue, 25 Aug 2026 17:27:52 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>
Subject: Re: [PATCH net] net: stmmac: re-apply taprio offload in
 __stmmac_open()
Message-ID: <ao20eOjQLwyLfq0e@lore-desk>
References: <20260825-stmmac-est-reapply-after-open-v1-1-dfa80735e0a1@oss.qualcomm.com>
 <324e6485-633c-4a2a-ba62-661f75dd6c31@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RjxRD0fGgCNWreNJ"
Content-Disposition: inline
In-Reply-To: <324e6485-633c-4a2a-ba62-661f75dd6c31@bootlin.com>
X-Proofpoint-GUID: mSD43Kgfg9V_M-Uz69CAk6-2GoQGEImf
X-Proofpoint-ORIG-GUID: mSD43Kgfg9V_M-Uz69CAk6-2GoQGEImf
X-Authority-Analysis: v=2.4 cv=I+NVgtgg c=1 sm=1 tr=0 ts=6a8db47b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=nIpPZXGhJxVyofb8EZsA:9
 a=CjuIK1q_8ugA:10 a=3ofb-eRetcnstJVkoFkA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEzMSBTYWx0ZWRfXxb1ZUeQMKUxC
 0eVoUrW9uQ6FGQOQnMuEd6s6/UatLeYCBuMWX/WDi/nq0pGm+Kj34vl3kmxeIfQa73nFTGDdzYZ
 NP8EeyPbpX6Cxrf8NVgWFiXxh+UIOOfx2pgcY+3W6anvj23M3HSR+GK8B1TIfTbKAJ2KL0JNGgr
 ss4k95dwIcRSRNwgsKRiS5DO8R/T8546Vv4zyzhWvitueKpuTCK4j073Vq6r4sS6tg8W0FTLxig
 V9s4wUiXIY4H+SqQFE9UJDssVbMoaEChTE6oorllPQHlg1xugkzm481oYoJQNuTWYazqZ36kkXY
 MX2qiYXNPifJpyr3/tD2Mhkwa5NtPrnQo7ZR+5tSc5kSgQ9vzuw5B+vOP5nZMuVEcT7fHQ38sKf
 BKY1GizUWu3jl1UwhYGMiAaIt9OOERY0KuxPXKpwAg+rQERBTl7tSkAYy44YmEFA+k4v5NzHfZE
 +K8FMNkQku9fl6+xolA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEzMSBTYWx0ZWRfX7AjiawvTi/DO
 xz124UXbzsfvLNABlv0tg8xd6xsFzx/vWYdl9RUP3ZzKvEK8NfjmVmqvQa/BZWXt4jWUtBQaBuZ
 fV+MzkJp6gvLZGc6xjkM9TyGzXcrGKg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_082757_631930_EBBAD421 
X-CRM114-Status: GOOD (  25.31  )
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

--RjxRD0fGgCNWreNJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hello Lorenzo,

Hi Maxime,

>=20
> On 8/25/26 11:24, Lorenzo Bianconi wrote:
> > The core soft reset issued in stmmac_init_dma_engine() clears the
> > MTL_EST registers, but nothing re-applies the taprio offload after it:
> > priv->est->enable stays true while the hardware EST block is left
> > disabled. The TX/XDP paths then keep dropping frames larger than
> > priv->est->max_sdu[] and taprio is reported as offloaded, although the
> > EST block is not programmed.
> >=20
> > Re-apply the taprio offload in __stmmac_open() after PTP is up. The
> > base time is recomputed from the reserved base time and the current PTP
> > time, since the timestamp counter has been re-initialized and the
> > previously programmed base time is stale.
>=20
> I agree with idea, but the way I see that, this new reconfigure method sh=
ares
> some code with stmmac_tc.c's tc_taprio_configure() step (the base time co=
mputation).
>=20
> Can you also take a pass on that, so that we have a single helper (your n=
ew
> stmmac_est_reconfigure) that does the base time computation and the EST s=
etup, that
> would be used in the .ndo_open, clock adjust and tc_taprio configuration ?

Do you mean introducing a single helper (e.g stmmac_setup_est()) where we h=
ave a
tc_taprio_qopt_offload pointer in the routine signature to distinguish betw=
een
the 'configure' and 'reconfigure' cases? E.g:

void stmmac_setup_est(struct stmmac_priv *priv,
		      struct tc_taprio_qopt_offload *qopt)
{
	...
	if (qopt) {
		/* configure from tc path */
	} else {
		/* reconfigure from __stmmac_open() path */
	}
	...
}

Regards,
Lorenzo

>=20
> Maybe rename it stmmac_setup_est() to keep consistency with the stmmac_se=
tup_ptp()
> that comes before, this would also open the door for an equivalent
> stmmac_cleanup_est() if we ever need it.
>=20
> Maxime
>=20

--RjxRD0fGgCNWreNJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCao20eAAKCRA6cBh0uS2t
rCWPAP0dtF22l4GthdsLp5ww51FQYvuX/6UpG3VXmDHxHcb8TAD9HGCQ7Xzmu1US
s/5xpqTPZFpaX+MJoDQrocRQD0SD4AU=
=wQy/
-----END PGP SIGNATURE-----

--RjxRD0fGgCNWreNJ--

