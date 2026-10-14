Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E6BCC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 10:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slGu8WvW62RLRh45NPBc1MSWHZx6u7Xy9JQffUxucLs=; b=nZGxSUn1NSQB/8Cfu6WoSPy4/X
	s7fs0UQkGgzmRpFmEJgBKvFlYPbDKALRMRJz9pd8bydww6zM8pFxauR9KOTzQ4KGSDHK4o5AZhVZO
	xKM+xjqGxbOpUgoq1R3fqmSymXiZzqRhF/tEJe72WAgg01cOVXYI634XIwLzQVdyIwAcedrdmazxt
	79DIqX7TvxX+flc1Y2deObbDhGYMRjXLZdG/D6SUWkOR1GDVlHNgDfZem+4yzKfwWpkI1jpOixnYJ
	R77Gor2Z1Nr2VZRKzeqaPx+BOOttnLkU/caCTVRwWfMui61y0IYwnCQT9yQBPL53Y4GmmObQmQWUf
	8nGCs/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGw5k-0000000FC3G-46cQ;
	Wed, 14 Oct 2026 10:20:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGw5j-0000000FC2o-1gP9
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 10:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=slGu8WvW62RLRh45NPBc1MSWHZx6u7Xy9JQffUxucLs=; b=RDi5BgQnaGjicwgaSooH5PZ8IZ
	O8/D8B9GmrK7dOoVtOKXIx2pLZIEJX7WffyvrVJms3c5czb8r+/VSne8Hm7swayFcHajh3h2cR48M
	CSv5/ivpaXLdAUymBKEQdzREqcnROKY0soMmSc36gEHPYDk0iMHwBZCXblV/F+Thkq2UP/k6wUome
	luIF0FwOwZuAZoYKfupEtVMs84GhcPBFTTzBK6hM/yJvabNnpWRQqpbFukyBXfaOjQLqfnm5dH2qQ
	IhFLd9YwMGqiahAZFgfihyfnOshZG6FY6AUwMTPbPK17YDy8w1GTWDWIrWIIelbz1KMJRuVoaCs6P
	StYKjVGw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGw5f-0000000GcwE-1EBQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 10:20:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9eB6S3696121
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 10:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=slGu8WvW62RLRh45NPBc1MSW
	HZx6u7Xy9JQffUxucLs=; b=Hy2+aJMs1gRshg51tHlSPone0lxZ27VNEcGFFAdL
	DL6vAzNHdgejhLi//d06rxMMt9B2stvNj48p0XrCyek0e16oRxk2+IdvjZjOdrLr
	hvIGSI0DrkZWTiOFGaF0sz5VZoHszhzAqS9JSIkm4+sbuTLdmn4zJZYhf0yTDnL5
	tm6anPiTvUGy2bJbupap4880zpyPMDXrQRkimjs7KuinxOPLTJ6vMEYDpmaQ1ers
	jXHZ/jepUSyNYW+dOZe/kuCNwSfbE4mtlg+yienD0m9QZHmVVH4SR7c4GD0Yo/mh
	S8tVwJqiTXGICke6EM2CzFPGrLsNdE8T5Z5Ehtu4YjXMyw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aeg56k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 10:20:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939c30aa9a0so20331485a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 03:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791973205; x=1792578005; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=slGu8WvW62RLRh45NPBc1MSWHZx6u7Xy9JQffUxucLs=;
        b=aG7l7AFJZPiUM9jISiRxo1bMqqoADd5aZqU32XILsrFPqHjec1pDre1zYt/Fen8Lri
         eIw0iNSm6kX9HHGh8zdwHxOlpeZ3tPMLnDxkZwPONXiqkqLTR+/wIzVjve6Jz344T5mj
         MyLDAwXFEd/ZJkQUKZQHcuZ7Xql37vnlP8QUAtzt4h+OUTQuW5s3BmrHrJqQh1gbl37a
         a6DsQIKqyTbLsFWCHgk31D68zJszJjEKZAuBOHRq0ZajuQupsvUX5fF9BeXKvfXIIlzd
         UV+Ag5tHME5Mhbq6sBLedMJKe/81q/xjJdDnPkgafGSsuFvnxdhoV4AwClvMQ8cYH9JP
         od5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973205; x=1792578005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slGu8WvW62RLRh45NPBc1MSWHZx6u7Xy9JQffUxucLs=;
        b=TWQivI08KK3E8LO9eZRb76ojjTomXJvWO3eo0LjktCE30KcZoNLaHEVTCtQzeXVQor
         3tTsnA4BewMBi3q2wVoGOMLuXV6XrCG6/xcsaWXIu2J1AZpqkkb+J1cxDZSO9EvD7uZO
         vNTvatI/hXHJPgG6yo1Wl2774e5tfRe3RaXUiRbzXvmuvkyO6fha8vGmqfNAMIxxvB5T
         NH24vESXbpaBpyi5Xp4iLHS/XLfCZhBR2Era3hYBG/IBpviEFI4jJtPgCFpefTlk/qcX
         kWLz0wJieDGoHS+0+fImXeZe4PW69JC8Y4KFyzoDey44GbYDHuTPysxu/B/M55RHQlYx
         yLhg==
X-Forwarded-Encrypted: i=1; AKwUvBxVEO/6Uc5E1dsezkX8nVXAJVUGyGlaV6b7vdRmNf+4/GWQDWxrYLwBERGu0CL9/ZBbs4GX12M23FmxBfP8HNQD@lists.infradead.org
X-Gm-Message-State: AFq9FYLWhrWn2nir7mwOgk+ge0glsn+e3peIdDL6p9Lp7QHYlXwx1gyI
	5+CJw72iMpFkgJTpo9B6CPw7jMQ2tlOCO7Vmb7G2b2QJjAbLP7RoDz/B2C1B+EJd0+N4QAXO1zU
	uBJ9d1t5nGLhSkABa8Ri2/8VusNv0r73Zs4+lFqs8cTgIxEWc05wZ/i885z5rpcg0Jm9cIIKwk/
	7LFQ==
X-Gm-Gg: AYBFou1sIlAhFSRZRWrAvm3c3g+0dJP26lhhX5wzA/iXDhHAerqjGWKmSc7bFVuPg2F
	OdwGfmeow37cYaxyzCvdSlovjqVQqldk4MvIcQJgrSih8v+X+pp5ATiaiTTvu8kHp/z0Lr1gaA+
	Hzms9s1DjLToD/WHGs5Jjg0shkmVMEMLXMac++6Gpxvn0w2wQbYbophkqHqcAdT9CzfgoYVUoez
	kLxCPLlUq77nZEyMHiaLcNHO32K1lIXrA7bXxjXDqVKB18zBby+sjZ7ohjxdtkDC/RVbgJUWpsw
	Idn26pPzF7513udKDRXR7HYrAp4mBS2rPF2o9JnT9OWONSShCYAyU1XGOhheb25k5HUdgEwyQFI
	1Cu/G80DxYC4DoQ==
X-Received: by 2002:a05:620a:7118:b0:938:ff8e:cd0b with SMTP id af79cd13be357-93ebd211368mr2513666985a.18.1791973204381;
        Wed, 14 Oct 2026 03:20:04 -0700 (PDT)
X-Received: by 2002:a05:620a:7118:b0:938:ff8e:cd0b with SMTP id af79cd13be357-93ebd211368mr2513660485a.18.1791973203546;
        Wed, 14 Oct 2026 03:20:03 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc50e0sm14157454f8f.49.2026.10.14.03.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:20:02 -0700 (PDT)
Date: Wed, 14 Oct 2026 12:20:01 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Subject: Re: [PATCH net-next v3] net: stmmac: dwxgmac2: enable L2 split
 header support
Message-ID: <as9XUbOfJazEQ4y5@lore-desk>
References: <20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Va93bnXPgVMhmS7J"
Content-Disposition: inline
In-Reply-To: <20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: X0C7U3q-CEssM1f5pLq31LEYC0jyJbi7
X-Proofpoint-GUID: X0C7U3q-CEssM1f5pLq31LEYC0jyJbi7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfXw03hp4Z+WZZi
 8qGScyXL8F5uk1I69CRTw/2S6B9fCV87H859nVEdpwhTP0shbMUQn6J6Js33lgG1zFqcjuEimjK
 Upt6Re+9bshVteY7CMZUYXCZgp6cmbk=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acf5755 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=K8_CPFW8AYnmyr30bPQA:9 a=CjuIK1q_8ugA:10
 a=4yWUPP8YMvIpZnTD_-MA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX2OEW1Yyd926b
 iE6Mko48+hVsPFgTIOmAeiXoWeCPoq/g9kQbLH+xOiUePWqAAtbs/8t8jTEyMDcJn8V8kmpVtsg
 HZAqv7c3hALV8sTxP60C/zaTMV6WqmNnKxbSrN4tMm3NOCK+3GLfH96yX6l/HNSYqMarhpQMB8L
 +0XLN84RJUjI01ox1puB5bJdZVCqcB2HPkF2lXTLy9mw5z6xUqQ90Io8FnyE5/IqT9Dfs2cNpk/
 FBQ38dt5Me16ldpPYn+7uAIbbtIl6exCW1Tvprli1g9UJfmNZizxYE3bm3O5jmISfHU/xkaTibV
 BIWOOmuID04fCq+8hA1OHQrCTdeHJm0EzNqlIhvt/qWD23OJz2Hi6iuGk1Meogypppg9UffR5CC
 JV2Nuoo+gxGrsk4Wqii1JY6aY1hMHzSgRjQrCrpitml/Rl2xXkqWztuTnGBeq9osW9JI1GsErUC
 UgKkkRBANFG3ndxot/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_112007_680997_BF2E81C8 
X-CRM114-Status: GOOD (  30.42  )
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

--Va93bnXPgVMhmS7J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 13, Sagar Cheluvegowda wrote:
> XGMAC2 doesn't program the MAC extended configuration registers
> needed for L2 header splitting when split-header mode is enabled,
> so tagged AV packets can't use the split-header path. Configure
> split mode (SPLM) and header saving (SAVE_EN) in XGMAC_EXT_CFG1,
> extending the dwmac4 sequence added by commit d10f1a4e44c3 ("net:
> stmmac: Programming sequence for VLAN packets with split header")
> to XGMAC2.
>=20
> Also fix the RX header-length calculation for split-header
> descriptors. Per the XGMAC2 descriptor format, RDES3's L34T and
> L2T fields are only valid on the last descriptor (LD set); on a
> non-last descriptor they can hold stale write-back data from a
> previous packet. Read the header length from RDES2[9:0] directly
> for non-last descriptors, and only consult L34T/L2T on the last
> descriptor: RDES2[9:0] for IP packets (L34T set) and RDES2[9:2]
> for non-IP packets (L2T set).
>=20
> Finally, disable the variable-length preamble when L2 splitting
> is enabled. A variable-length preamble shifts the position of the
> Ethernet header, making the L2 split offset non-deterministic.
>=20
> Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
> Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
> Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
> Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
> Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
> ---
> v3:
>   - Use zero-padded 0x00000140 for XGMAC_EXT_CFG0
> v2: https://lore.kernel.org/netdev/20261007183905.2582759-1-sagar.cheluve=
gowda@oss.qualcomm.com/
>   - Add XGMAC_CONFIG1_SPLM_MASK and use it in XGMAC_CONFIG1_SPLM()
> v1: https://lore.kernel.org/netdev/20260922232116.889630-1-sagar.cheluveg=
owda@oss.qualcomm.com/
>=20
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       |  8 ++++++++
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 12 +++++++++++-
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 ++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net=
/ethernet/stmicro/stmmac/dwxgmac2.h
> index f8ab347f7b5b..7d1a7802a131 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -167,6 +167,12 @@
>  #define XGMAC_HW_FEATURE4		0x0000012c
>  #define XGMAC_HWFEAT_EASP		BIT(4)
>  #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
> +#define XGMAC_EXT_CFG0			0x00000140
> +#define XGMAC_EXT_CFG0_VPRE		BIT(8)
> +#define XGMAC_EXT_CFG1			0x00000144
> +#define XGMAC_CONFIG1_SAVE_EN		BIT(24)
> +#define XGMAC_CONFIG1_SPLM_MASK		GENMASK(9, 8)
> +#define XGMAC_CONFIG1_SPLM(v)		FIELD_PREP(XGMAC_CONFIG1_SPLM_MASK, v)
>  #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
>  #define XGMAC_MAC_FSM_CONTROL		0x00000158
>  #define XGMAC_PRTYEN			BIT(1)
> @@ -434,6 +440,7 @@
>  #define XGMAC_RDES2_L4FM		BIT(28)
>  #define XGMAC_RDES2_L3FM		BIT(27)
>  #define XGMAC_RDES2_HL			GENMASK(9, 0)
> +#define XGMAC_RDES2_NONIPHL		GENMASK(9, 2)
>  #define XGMAC_RDES3_OWN			BIT(31)
>  #define XGMAC_RDES3_CTXT		BIT(30)
>  #define XGMAC_RDES3_IOC			BIT(30)
> @@ -441,6 +448,7 @@
>  #define XGMAC_RDES3_CDA			BIT(27)
>  #define XGMAC_RDES3_RSV			BIT(26)
>  #define XGMAC_RDES3_L34T		GENMASK(23, 20)
> +#define XGMAC_RDES3_L2T			GENMASK(19, 16)
>  #define XGMAC_RDES3_ET_LT		GENMASK(19, 16)
>  #define XGMAC_L34T_IP4TCP		0x1
>  #define XGMAC_L34T_IP4UDP		0x2
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> index 6719ac6e395b..65ac5403ec58 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> @@ -292,8 +292,18 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, =
u32 *hash,
> =20
>  static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int =
*len)
>  {
> -	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
> +	u32 rdes3 =3D le32_to_cpu(p->des3);
> +
> +	/* when FD=3D1 and LD=3D0, HL is RDES2[9:0] */
> +	if (!(rdes3 & XGMAC_RDES3_LD)) {
> +		*len =3D le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
> +		return;
> +	}
> +
> +	if (rdes3 & XGMAC_RDES3_L34T)

should we check FD=3D1 here? Since HL is not defined for the case {FD=3D0,L=
D=3D1},
right?

>  		*len =3D le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
> +	else if (rdes3 & XGMAC_RDES3_L2T)
> +		*len =3D (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;

same here.

Regards,
Lorenzo

>  }
> =20
>  static void dwxgmac2_set_sec_addr(struct dma_desc *p, dma_addr_t addr, b=
ool is_valid)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers=
/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index ff83858ebc1f..0a9c787305a4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -561,6 +561,16 @@ static void dwxgmac2_enable_sph(struct stmmac_priv *=
priv, void __iomem *ioaddr,
>  	value |=3D XGMAC_CONFIG_HDSMS_256; /* Segment max 256 bytes */
>  	writel(value, ioaddr + XGMAC_RX_CONFIG);
> =20
> +	value =3D readl(ioaddr + XGMAC_EXT_CFG1);
> +	value |=3D XGMAC_CONFIG1_SPLM(1);
> +	value |=3D XGMAC_CONFIG1_SAVE_EN;
> +	writel(value, ioaddr + XGMAC_EXT_CFG1);
> +
> +	/* Disable variable preambles to keep the L2 split offset deterministic=
=2E */
> +	value =3D readl(ioaddr + XGMAC_EXT_CFG0);
> +	value &=3D ~XGMAC_EXT_CFG0_VPRE;
> +	writel(value, ioaddr + XGMAC_EXT_CFG0);
> +
>  	value =3D readl(ioaddr + XGMAC_DMA_CH_CONTROL(chan));
>  	if (en)
>  		value |=3D XGMAC_SPH;
> --=20
> 2.34.1
>=20

--Va93bnXPgVMhmS7J
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas9XUQAKCRA6cBh0uS2t
rG4HAP4goEYjxrArM6TdJd+MFIeqzUtidp4JYTu12RjAE+mlUwD/e5GewtsO9RV7
k+CeJufRbJRvlTiMT8RjKAZEgMRGYwE=
=sUaN
-----END PGP SIGNATURE-----

--Va93bnXPgVMhmS7J--

