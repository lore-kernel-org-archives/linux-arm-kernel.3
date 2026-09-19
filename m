Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10FCC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqG9f5lzL9qDXlX9VaIV1TdU3erotb5WQ+seYvtPtig=; b=ea9Q+VFzPlKGKp89nLzLZ6Cvh/
	h/hP6I6vwwY07LNJR0wzobfI8gb7B9Z+uA0/1ydE5NYnrf+TGjwqa0XgwyTxBw6jH3Ie4j5+JSIK+
	pgf07zKkyCtTR4kTwUlXWp2QASQ+qRZHfexetLvAVxES1HqZbWQodyNHheX1K5jAk5hcP8FNrIIyg
	RrKcvJNhdDKIgLlHPdCQyjen5Gai+z7Ckj500f4WQPSOCWoTwitqMRLZ2Mb0QcP9VhjCgpcPqaIW0
	jva7+HYtVxlnjEKxyLPoySlh1dE2JY1v0SmyH4MXopw71fn7jzj+UlUadN6kFRuvn08nhHQWzYenq
	4rhbM0Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7yvi-0000000GY5H-2jBW;
	Sat, 19 Sep 2026 17:32:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7yvf-0000000GY4a-342Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 17:32:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JGKPi9564166
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 17:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HqG9f5lzL9qDXlX9VaIV1TdU
	3erotb5WQ+seYvtPtig=; b=M9pF5FaPKwl5mA156xYxOhScuVO02hmsmedapARv
	9+kklJNS86FnFMnCbQAtcLt8ZCMDy7PgqUvV4enyNqrH+0ZamayoeXkKRT4PtwQ/
	HFAlbVD0MEbyhMq1knPGp0VB5gEnhpDLt6lTL8lJXVhAzd4rA0geQtJcf1I8ehJ7
	3VgO787FpVQWqebNTDBCux9MkV6la1qPXRC4AsRrKSb0kCQaRZuq+TZ28UNIBsSZ
	3j+GkzqZQvPQsyOPz9IfcM5Vad/3DwQoP8DSdhI7FC72LS3xP82EzlUYhtkJdwRi
	H9HzxB7YD44wSAm0Jk1YskOeUWbOAV/u7DtDVBt0W+GbYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxsdsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 17:32:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93be6ed214eso221704185a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 10:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789839165; x=1790443965; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HqG9f5lzL9qDXlX9VaIV1TdU3erotb5WQ+seYvtPtig=;
        b=XsCd7Qxy+o+dhL18KPD9ZNy+S5eLVkwHZnUcnEeWLVlJD3lP97apMIknexQCsK9cPW
         jERk8Adtw6NzvigXIIgdoOebglMOXSzKbOxSUfMz9UcZdpD3Oq4z6dF78b3ieRWxk7tM
         nppWO9QZH6tpcLyR7rn1M1TuzFIMFucc/qdsdgbowzNraD960jvjSTdWikMYE28r9t8X
         rThjru9/Cb7hxzHN10i7Cf3O8wdhqIZWIMks63YWAfv99UAiCQVUyYSWZglqP5BiG1Lt
         Zs1jZu4Pi4eeVsX10sC47XPQdo90RqXQvNdyOklHxlOB+KDGp0KkZ7xXX8/qugh6MUMK
         gx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789839165; x=1790443965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqG9f5lzL9qDXlX9VaIV1TdU3erotb5WQ+seYvtPtig=;
        b=W16W6xiSdYm5vRQJdu2aBdJYdPFUGu8/e/Gztj9rPExRvbrz8wBPZLHIGLwCzqEdWC
         B5bqDBflV5Rf8kcJiha1kFr8P6q1ifQFCvDUradRTgxu+I4uEI25c+vawson7mvEfRm6
         oNCnNt0hnprTxylmk6j/u4CZM699Ko/3Z0ln4tp7EjGIVWpwYgZAt6R9mp++M7QFEUMF
         yN8AMNvSUvQ9kEtWwD6S6rIllI5IgEp9uAk8YYzoZ+botOtJc6h+QLQQ1Opeu44soWzu
         36c7akelCopAskH4XwoP2vnCMdnYdqKXt/WVlfmiG9VAVwqDFwFXgEtUnMwKFXEDlEWU
         uDUg==
X-Forwarded-Encrypted: i=1; AKwUvBywEy09d1mLxwEvR6tlPDYBuiAkS5bpAHSBRiURdn0e4tWrBcAjmpg3JmBXrPKDT+Rv8ANCfC6dFjx+iyExr+ks@lists.infradead.org
X-Gm-Message-State: AFuF++l5puD9jdatF/M/HCtcDsSNO61MFBK1Ly8XR+xDxGfKtg/riUqq
	uAzlo2Ahr1iv9wz5f+1KUVuvYYDoRjT7gZalBu9vspmrQFzIgzdtsBjMroHjarlmK6SKVxB/DYZ
	NCmWWZ8/9UhJbNoos+PxlBToebfkaqXdVBxbe/Y8sZTIkny4vekb9Ws30TtuyYUvATOn9jyrCp0
	1rkA==
X-Gm-Gg: AYBFou3neFBs1570rus4ztYgaYIlW8hYi0Ee4Nh70nfgguzeyhrv3zHfVq8k9VAeOMA
	YllocCqKyOvuljWx9Bjd5geEaD2KRahD0/W4AfosLbv+MLGNQ28nJr1FuA4AfSxmqAYwdeX1GTk
	3964Zcq5RzvfLAPY6w87As0dMBKuw1w4JUEj3gO7vYjkwNWmrJIWmbXRJFA7xR8M9RB1cv0e5Hn
	8TX5yQADiS9S9XkM5VilimvLdtlu3f3XIhaW09zsNkFddFSZeaiKFwTqEx54x558Vc1jFn2CLQi
	xEyaWufEHlr1n6l6WskjLWxeKy4Weonsl/6KK4WKwAVaItVReYhF6zMN0Bg1mAc0POn1djnwHab
	JwWIsWyLKkQisfw==
X-Received: by 2002:a05:620a:2697:b0:93b:da60:a557 with SMTP id af79cd13be357-93bf5595446mr265129285a.19.1789839164992;
        Sat, 19 Sep 2026 10:32:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2697:b0:93b:da60:a557 with SMTP id af79cd13be357-93bf5595446mr265123785a.19.1789839164435;
        Sat, 19 Sep 2026 10:32:44 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm330064325e9.4.2026.09.19.10.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 10:32:43 -0700 (PDT)
Date: Sat, 19 Sep 2026 19:32:42 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Tao <gongtao0607@gmail.com>
Cc: netdev@vger.kernel.org, "Chester A. Unal" <chester.a.unal@arinc9.com>,
        Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 2/2] net: dsa: mt7530: trap frames to conduit in MFC
 on EN7581 and AN7583
Message-ID: <aq7HOswpuqqboFj5@lore-desk>
References: <20260919065214.31604-1-gongtao0607@gmail.com>
 <20260919065214.31604-3-gongtao0607@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hVJhV1FC9rC/pOle"
Content-Disposition: inline
In-Reply-To: <20260919065214.31604-3-gongtao0607@gmail.com>
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6aaec73d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=heobWi1WCqv2MVib:21 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=3Szyxn8DIQ0cRF5uja8A:9 a=CjuIK1q_8ugA:10
 a=oxjvUbtD-TdPno90v-gA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDI1NSBTYWx0ZWRfXxiVNLvw2yxw0
 7vrmdlxaSKPWkIguuqmUl3fCjccaku8EN1frrg3EvB7Cf8EsvcKhy4U7XSR9zsSz4zt5OZv6o+3
 TyUIqgUtrnhf3vyTroWNdk0xKM/hwIg=
X-Proofpoint-GUID: OWMe1tnj_WZUM_bY1nu3xlNA-YqMEPtI
X-Proofpoint-ORIG-GUID: OWMe1tnj_WZUM_bY1nu3xlNA-YqMEPtI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDI1NSBTYWx0ZWRfX0+plnYCFxZSY
 dBuJz02HbTBByimSGyiOFVGXl2NgeLezZwIExqMfu7yPRfuEDwQcHkX15A+5+5D9MxDWgrx1ZvT
 vGFKQZS3RCRgDZ7JxuPTVyH7lJT8jZ4AysbNVDIT36a5QHFM37xuH0/+C9O1gUWSp4avWwe4e2V
 ltc98lfzrd8mS9l0ViY73RNsM/WMVvYtRiiz1B8NAqS7WQiGxfe9ttXy4nRCiljvPCZq3z4L4L2
 KJ1LfYseGKwHKDgYI3PQjy4yh6eF3ysnt9LubddkOP7jASbLsGVOPW9xeFc2Yr5174Ot6foExjM
 Vq0X24Gu8FaWlv/iOeDufuVe/ykP94HA430dw2pj/7rCz9aIjiNI+mlJv5js5bZcPAR+llT2MB1
 lUtJGAwGrNZCHb5HF3+p+femMrn0BEvMQ/fRrBW1BMHQvUuX5HH4qT37l1u7lnds7SPgyjIYvHR
 h62jpBTLhLmUq2uuMng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_103247_882732_157AFD84 
X-CRM114-Status: GOOD (  24.64  )
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

--hVJhV1FC9rC/pOle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On MT7531 and MT7988 switches, trapped frames forwarding is directed to
> CPU ports specified in the MT7531_CFC (0x04) CPU_PMAP bitmap. When support
> for EN7581 was introduced, it was assumed to follow the MT7531 model.
>=20
> However, on Airoha EN7581 and AN7583 switch IP, setting MT7531_CFC alone
> is not sufficient for trapped control frames (such as STP BPDUs) to exit
> towards the CPU port. The switch forwarding hardware also requires the
> MT7530_CPU_EN bit and MT7530_CPU_PORT field to be enabled in MT753X_MFC
> (0x10). Without this, trapped frames are dropped by the switch forwarding
> logic and never reach the CPU conduit.
>=20
> Include ID_EN7581 and ID_AN7583 in mt753x_conduit_state_change() to set
> MT7530_CPU_EN and MT7530_CPU_PORT in MT753X_MFC when the conduit becomes
> operational, matching the handling for MT7530, MT7621, and EN7528.
>=20
> Fixes: 2b0229f67932 ("net: dsa: mt7530: Add EN7581 support")
> Signed-off-by: Tao <gongtao0607@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/dsa/mt7530.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 863f2079833f..9693a55f553e 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -3309,7 +3309,8 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
>  	 * interface is up.
>  	 */
>  	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621 &&
> -	    priv->id !=3D ID_EN7528)
> +	    priv->id !=3D ID_EN7528 &&
> +	    priv->id !=3D ID_EN7581 && priv->id !=3D ID_AN7583)
>  		return;
> =20
>  	mask =3D BIT(cpu_dp->index);
> --=20
> 2.55.0
>=20
>=20

--hVJhV1FC9rC/pOle
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaq7HOgAKCRA6cBh0uS2t
rBiNAQCFg1nQRwOzz8FU5MVSG9sMaa5p0AdbjtEe35Uz9/PYcwD/T8H/q4YIYf8V
geEV0Ie0ekM6b4TJpIqUUS/qyK9/LQM=
=JURm
-----END PGP SIGNATURE-----

--hVJhV1FC9rC/pOle--

