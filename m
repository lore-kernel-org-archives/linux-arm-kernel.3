Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D170ECA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBEwDTeJO1bAzkL7SkeN2AYJAR0dEH6W3xkuViLva/g=; b=opBcysHckre2kYnO9KUnk5oczy
	ucbjpXc/aAbQMu+uLjvMLcy7sf6sHL6RyBwdP+2k3+4slyWnz/C7y8aoMF2c5TJQ489h1xYbhFonL
	Dg+10zgagbYTFFx7yBl7H8IQLLseT6Gok4jy5V6245h+eFLrnX9F8cRTjFMfXZ0A2OrkaKKcT0cdQ
	gVsj74tf3PoLNX/fVZ60JExWEaXXDvMNO0RTgcjC+XvQvfivbrFtozfNR1vgBwLtT34wsyjHpbVwf
	ky6edh6X/QboHnWqsn8ZARkdKaBjBy+Ha/uKwj3mOfPd4hedE+Q/9YccouV5WsOSohul7aDktDtl+
	6u2s3jQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEa6-000000015QF-3FrG;
	Mon, 28 Sep 2026 16:51:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEa3-000000015Pc-2INi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:51:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe4dm2756110
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TBEwDTeJO1bAzkL7SkeN2AYJ
	AR0dEH6W3xkuViLva/g=; b=dZ5SaJsrrQev7bb1G2ZF9ct8LIrbJTfFCAg8u2L+
	Ap2eeNDZUphfcsLPPAoU+GmuiOTxO2TqZupjwp64S6OgWVUN1oeoYmuGHMyrL1VC
	4wU2djriWUa7QKFtEgLNhfDUHCY9hHbnLMWTqKw+w5Az3xFzzD1/y64tqRICtYMt
	x8EytUa3xmGtP09Tj7CCvjSzMqJ7NrzWgsvLVzA84KHkyU8RVaCZVP7gx9y0nvae
	z7PzjK0lA8ylCAlypoQPv+WHyrF0jvmJ8cVdBFWZRAJNIUZnvdbajzf6mjsZj5LQ
	qR5swhgMYp/kXPrzS/MQWG75PNpY9unsBh09nZ+Q3Rp/Sw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubjm7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:51:54 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9806535f8ffso22221241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790614314; x=1791219114; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TBEwDTeJO1bAzkL7SkeN2AYJAR0dEH6W3xkuViLva/g=;
        b=OG+njHxuxlUra/x3Z1Qwjo+8x3LwpJDeQcMsQCIBLuq9Y7yKGuVf3Ejj9SsE0Advfz
         llmdd9NEsUql4yN4TdYK484cNIWbkmthVYecO76859JEe0awZYZ/kTBcKIGMdBYRGP5T
         SgHWLle2ZvgGm8SZ6SoyWvy9tM53m+BPhP6YX+1CP8jHxI8fQQX7w+9PHNLffuxE08Uj
         K5C8EXiqa9xLu3dxpn1rXqPqnxiTfaxwoBXSLLrBgEgxFgH8p4FVxG+3qt+er4hgzbjB
         sSHlHrDCGtxyBZ0rPPf9vX4tb3MikyewVB19Wy9BR0/zS/GSZ6Wk5ivPGVuOAJU49GRm
         NvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614314; x=1791219114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBEwDTeJO1bAzkL7SkeN2AYJAR0dEH6W3xkuViLva/g=;
        b=nIP5bRlfM3lpmuAmMgu/ZqVKiulwTt9c9ago78HKvn0C4iLLnUM8RUMT3fMu8ZlFvE
         eTixPm5o4OIJqAK4CGJfRA0TzgiS9iAZskZ4/2kzSgnx0Z2Pbkqguwgmkm/rUzsKEcAJ
         PcAhykSm6J5z8c9Qvekg2uBVuHESQ5RS+uxRRPp7HtSMqYtdnHoBkHebaVxvYVn6fXmi
         LF/+yIIlK3P13IXnI+dH4Hg3bm3BD3Tu9nwNTIUoA6/qqjPRVkGKZZP55LYS1ec7ldTy
         7ryqH/r0MaEOzA+cctWp9B+HxBpq9yGbzXORt5NDeEkh0a86Dl6kAQS6yq5SR44KqVCb
         iJKA==
X-Forwarded-Encrypted: i=1; AKwUvBzOlrDZ5hsxjeL0DEjAHd7Dv9Ay5qY/yYHTOjSwM8ceJfYx6u0DMpwJaenZXp1O+QCcdZ4++cKRZTMj6/PVIhpX@lists.infradead.org
X-Gm-Message-State: AFq9FYIv3QV8r4rKDLx7wnPWWfRJQLXcnl8TzDFZnqna4g/L0ivTjhtj
	I/j4oZEg/c46kp1NV1+TXsqvJqIs4av/Bou8NF+/aEM+h9NmJ32lGFvVmMJ1Pg3ic5qAa8Uhx6C
	l74RJRWFdMHEnGPHdFKU1UVjhWHCslATJKKRXPXKUDtMej4G/Q01+Mzx1E/RN0fJk3Ranbva+NU
	f+uA==
X-Gm-Gg: AYBFou1n/H8Qr3v9nrCXsMiUni4Q0Jsc1Ue5zj/GejvkRTC/d/iJHtzc63KstbBwRIc
	qD/p+Dc7lD4iWedZzPfj7GZ4XM6Rn9qL3mdC0LTlvWpCZytdw4R79UxZe+YRw45J7uexgQ/Dkzs
	fDBamuk4l0NTaSCpB+B0htLRoOsULY02MKy08c+O6lvWy1cGF/VwyMxebZvTyojVrqTkDrAKD+4
	Mlf04vWYB0rFHSDgO8fghbr4pn2oFfQuQDaA5+m60hEStNHxgrHUq7Ty0rycgZyWTlg5sDoc+zD
	eh4JX3bkLtZcKvuZkSER3lJGcXbpLZTG951W4Tl9KnCN1EvktS3dz3Ebo96MIbdgO9Rpx1Pc+MX
	O61p6KIglT4IH3g==
X-Received: by 2002:a05:6102:8382:20b0:7b8:1f7b:5e98 with SMTP id ada2fe7eead31-7b81f7b65c8mr522758137.13.1790614313715;
        Mon, 28 Sep 2026 09:51:53 -0700 (PDT)
X-Received: by 2002:a05:6102:8382:20b0:7b8:1f7b:5e98 with SMTP id ada2fe7eead31-7b81f7b65c8mr522734137.13.1790614313013;
        Mon, 28 Sep 2026 09:51:53 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a314sm29445527f8f.6.2026.09.28.09.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:51:51 -0700 (PDT)
Date: Mon, 28 Sep 2026 18:51:51 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Davide Caratti <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: Introduce hw queue priority
 offload
Message-ID: <arqbJyW6rZiy4-4c@lore-desk>
References: <20260924-stmmac-mqprio-prio-offload-v2-0-fdd8b69efccf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vGo5f+qo7DXy1Scc"
Content-Disposition: inline
In-Reply-To: <20260924-stmmac-mqprio-prio-offload-v2-0-fdd8b69efccf@oss.qualcomm.com>
X-Proofpoint-GUID: h9RdyoANRydCs794tetUZxf-be4zvETk
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba9b2a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UBftKYhPbWsmCYAP9PIA:9 a=CjuIK1q_8ugA:10
 a=UBkmr0p7e9xWzdnbdSAA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: h9RdyoANRydCs794tetUZxf-be4zvETk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfX5T1KcRxK6gvW
 abUFf9yZIb2WK2BPbGzplG69Gjw8HK5smAyKgfcP8Ih37Zl1zDRoXZGG8OBP8SK/zBV0VdRnwqn
 EMkYMIBPkQzBRNQ6kf4P/iIq5ksuk6rpRyf5w37gtBKC3yFohpBo06lxDp1QG2exjsChOOB2rsP
 uHCSKfVlDng2/l+O+Cft3ZrTmycTMuB9/zBmEEtfg5v/LGHUROOosGgq8BmEX7K74nWiZ5KbK4Q
 3g/Smip9pdHK4e6CMUOkJb7PBTtOVS/lwWahIX3utjXYdK9u+/+K+HmAJyIsfgQAlvFpFGUhh0a
 EpPi8hXVx6Jzie5d0/BIRK18A8TheR1D2RCGusglBH92kwZa9340huCAKARaJrJPtpVI4uumQ0U
 hmv+XNJ9HdaSPssfCHSqeF4IAmVLqvLgM1GEVJqaObwvorEv68nu6tnz9P4E6A/qahw8X1fDAQJ
 poRWoLe8lIH5zX/SWPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NyBTYWx0ZWRfX3R+grazR+ofU
 kJY8DZuI93GaQayP1h1YNcdP9a3zj6Btg0xuruxsC+AGaMGKROf3szfwPzSZUv03xB029JK+82H
 Vo/jKi6zpknHhp8wGOhxczL3ZWqlJTQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_095155_597650_90151EE8 
X-CRM114-Status: GOOD (  20.08  )
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

--vGo5f+qo7DXy1Scc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Implement the offload of the tc mqprio hw queue priority in the stmmac
> driver. This feature requires the mqprio to be configured in channel
> mode.
> Do not overwrite real_num_tx_queues configured by the qdisc in
> stmmac_hw_setup().
>=20
> ---
> Changes in v2:
> - Forbid cbs queue offload if mqprio is already enabled.
> - SP requires 1:1 TC to TXQ map.
> - Fix the real_num_tx_queue overwrite during device open.
> - Require the qdisc to be configured in channel mode to enable hw queue
>   priority offload in order to not introduce any regression in the
>   previous driver behaviour.
> - Link to v1: https://lore.kernel.org/r/20260918-stmmac-mqprio-prio-offlo=
ad-v1-1-5328157fcb58@oss.qualcomm.com
>=20
> ---
> Lorenzo Bianconi (2):
>       net: stmmac: add tc mqprio hw queue priority offload
>       net: stmmac: align real_num_tx_queues to mqprio configuration
>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   7 ++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  28 +++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 132 ++++++++++++++++=
++++--
>  4 files changed, 146 insertions(+), 23 deletions(-)
> ---
> base-commit: 6516ac5e6b164bf78fb34d36b4d84d495a07c844
> change-id: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8

I will fix sashiko's reported issues in v3.

Regards,
Lorenzo

>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--vGo5f+qo7DXy1Scc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarqbJwAKCRA6cBh0uS2t
rGwEAP9oEyG66/9samTs3kLG015oGLi4ZY8zTArmgBxztWzSnAD9EEmXN5lC8XDM
aaqDN+jFQC6d2CeuyiHYN8fDNZ19ggk=
=lTFk
-----END PGP SIGNATURE-----

--vGo5f+qo7DXy1Scc--

