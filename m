Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EA0C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 07:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCq1pXof4PNvwoWC3gxNhgB3/AV5Ee7h6VXEYj74taI=; b=EiL2CZDhfBjr6TKiAQM6KxnmlV
	tw+DILA9Cl0lT7/aeGvLd3JAOVP5e3iiVVvKzS+OS8HTbKip1fFM3AcunLU/vHY/QsT4YVnTqj4+M
	xyHeSIIZxZWvaHVen94k90qLMXEA8wSbkV7CB53+eIyI9kXkMl0o/P9AvrT8d3HeptmYm4FortaL3
	vPATLvxCj3cmdIDGk95XG3KmNhjx+Bw03rWuO94wL9Zt0Omsk3dAYih2iCmRNj9ISAjV4y5l8uR/M
	zdsnuGFVdxkCZjlVG9nydM3ddAznL+kfdTQT5mehlVT73dtx7ImPXzMC0gtwTfao3BofB7BQ6chn/
	AyVUeBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUgz-00000003ZfJ-3I8L;
	Thu, 27 Aug 2026 07:38:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUgw-00000003Zex-0Ejt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 07:38:31 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6R0LX2618707
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 07:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mCq1pXof4PNvwoWC3gxNhgB3
	/AV5Ee7h6VXEYj74taI=; b=WTyMm3qBM35T1CiCnhos9UpQSma8pX+y6bZDJkjU
	1V8rWtEbLf4VS3gdqqB+fH3hCaOeFyC+4TWGfUhJE4Mq0EbFnQsaMIsnfJhLyjRn
	RWJU4GDB7lErxG8ktBNL6oP5W/H+EANSjqla0t8NDxCFSYP2UQfKBYMVqqhHZqzF
	Psz4eAy1Uwix9HBdwKhBG7BfrLSUHDrwXc5fDcLosA3g2BmHTpM7n1cHTdsGvgHr
	LSDsb/gdkK1h0QbVvyUimgR5EkkDd5W7r/Q7qU32vIr4X2xFImYv150N3qFV+BTb
	KfSSUEqDQh+EwI/Sx5DY+hb8XLmstMDeKau2ROKajpj6dA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga03u3uf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 07:38:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52f64c48bf2so17529931cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 00:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787816308; x=1788421108; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mCq1pXof4PNvwoWC3gxNhgB3/AV5Ee7h6VXEYj74taI=;
        b=QiQ5+yTFur6N57rW62TYo+dLUseukoHxZEyjVmI6FVdF+JjI/yK5bCj/9ZqMJ4mQ46
         u9H1bt5VjD9HlOGN4PD4kd7OmIgsaPbKz0YkCilHDV+mZPk018Im3AkBnSwy77x+akS9
         Iwq/38X8972WfzF7nezkHre3aS1BDoXtMKjVEAQvsOLYu/XtolUE+orJi9lPUONLtswy
         kkzBP3cAXkSfa/i5zOz8h4z3gt5fmZDUd6H9/X8ZlgqWLmqsf8iH5+mE55AtpYuXC+4s
         kmyZB4toWrfEOGSYFBg6tnIiZe/ITqGaidVUcxjIaICNaa4V7hFRcs+mqr77xYis+RIM
         K87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787816308; x=1788421108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCq1pXof4PNvwoWC3gxNhgB3/AV5Ee7h6VXEYj74taI=;
        b=rPMiGvRbGdwoWrluXcivmafq35Wfvn9JyaTV2PUfh7wM84CCGx7gcRTLvEksKSEDrO
         /JoZqJ18BYNm065qtkQFvDEbYU6eWkqSHx9CwWYE/wdPPyPHnH3cx0T5eiXhYjwuVFWC
         tWFtQ+WNew1q0Tx6FuxpMXT2BY9yFHUObwqwQK9KFOMR4RXpGdU1hB8Vtzf5kRpdXAB6
         JHMZHDt08Lty/nvxUL7YWhtDpJ+D706AeT2HzWjoWMaZOALOHhAwMRXPKIpfD/ytHP/3
         EetBLhzbu0tUICrzZ5S4j0XDynOLgDlnMZTl8KPefK3aJVZGqEt/mIABjYbH4MkmiGww
         HGqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBkZUDXDoQyx892tYvrgPEga170yo0OQFQDvmAAZtCQ51yIBo4lMYsR/Lat9zQYDQhgoeoFlnxYt6d8QyKjl+D@lists.infradead.org
X-Gm-Message-State: AFuF++ltnSa6QcuTxmixn3eV9LDbneGbV6c8jPhIIeI4Svi6BtIXac+0
	P5feYMKV8wVO9xkDe3F+klJu2gzws5+NcgEed4yXwOdRspwtqeeYmNzpc+6MUM6ib21ZTruoNdm
	TVYXWtyPwWD//eEMl7g0vdjxQFtide890auk+OiDwMOxVJcXoDnyOcHkLWl41GEgWgoSSpFrvyn
	wfpA==
X-Gm-Gg: AR+sD11hvZE4TsKP8LA9nPMcExkSY4MUUoYuHSogMG2qC83AtpRFf8NeZr7SPlL0Ilh
	QIH6DUDU42kyPm9qF3gtqpWGtLK5RyOqXPZzCE0CLFwFrv72GrGR0C42qI0OATK0NF6Y5vHuIE9
	z8k0kUiOV+5C+vq0sxjD7oOk3DoRXlnhecjUFcUqX+KuLcWoPXADkX+obFsK+D5YDh29MVDLRIW
	wCTiT+3YluugozwpRou/zdPgHUjwM4yien9PTLKF8n+ZPbqjvzxwcCo5va3hHw4upZywATyK7yi
	2eCIKgdlapCsLQGJxPeHw3qpcI1Eg1lbERiF0x56eGllYfwyKrOyqk3xTaGaYi7W9f6jZBcYlTW
	tvUs9pUleWfeBig==
X-Received: by 2002:a05:622a:4cc3:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52e42416041mr149362281cf.40.1787816308339;
        Thu, 27 Aug 2026 00:38:28 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc3:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52e42416041mr149361731cf.40.1787816307708;
        Thu, 27 Aug 2026 00:38:27 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dc134sm7009250f8f.20.2026.08.27.00.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:38:26 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:38:25 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v3] net: stmmac: drop gso_enabled_types and rely on
 netdev features
Message-ID: <ao_pcS4SirBPBzNk@lore-desk>
References: <20260824-stmmac-fix-tso6-features-v3-1-c73a7a4a0ec7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tXbvHYpj5TCCyFOR"
Content-Disposition: inline
In-Reply-To: <20260824-stmmac-fix-tso6-features-v3-1-c73a7a4a0ec7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA2MSBTYWx0ZWRfX+YFsiCu2FTgr
 cbn3kLcESEahRHzswjLUcme+IEKijxKEJ22PY7RFccStPl+9JvoolJ6qQIXi6czTPuBBKxficP6
 e1dE3vpGZhBoQ3whqXLKYdF7BiUKvRO+40AwG9gjPf/Kf6GZJ6ZTaiHIhHpHaRvL7BngIbRzBok
 D4Kk4JlbiR18KWPTjgIYCZdeVYrcwJ5f6xWe6c8sVmTIDDeNKaCP0uQYa9BM3IjdqvbTVVASS32
 itgn7xa5TrbuK5HSaO3r/iib6VzHYyfF5L9ytfG/lksid4QaFvaSyaG3ZxsVq/flGWn2YbVY2uy
 xmhlx72sb1WoI/ogk2i0+6ry2bLlsF1qTFeHQGEw32++7VoUYe/8I5RsgVouyCOhqYOkT4Pd7Qa
 4cy/tA5BAXcV6w6VhNheoO+v1eMuxGrFjYV+4yzg9XAd2b0yxs7Iq/3IfzQGUsgPCiHbPxCVrmk
 edGDtQvOvP5htkCUEOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA2MSBTYWx0ZWRfX6WU1IVLQ6zb+
 qepy+I0XEtW2kQSG5Azi6rFKPZZDsuDxWWX2WFeq7/9QrEBjb8rIgOuevz4NciGYg6aQSXJ/ITJ
 9lHI14nz5Pe08kvXCtE1b1IY4S8rzV4=
X-Proofpoint-ORIG-GUID: IiGty3icjtjVrmDDI7EWbTzixOOabv95
X-Authority-Analysis: v=2.4 cv=RcqgzVtv c=1 sm=1 tr=0 ts=6a8fe975 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=3-RhneuVAAAA:8 a=jIQo8A4GAAAA:8
 a=LMpWeGtwpFfhV3Ya4SMA:9 a=CjuIK1q_8ugA:10 a=Fh8iizVe-TJUZqW4ftEA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=YTcpBFlVQWkNscrzJ_Dz:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: IiGty3icjtjVrmDDI7EWbTzixOOabv95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_003830_123981_5C6BB048 
X-CRM114-Status: GOOD (  34.37  )
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

--tXbvHYpj5TCCyFOR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The gso_enabled_types field is used by stmmac_xmit() to decide whether a
> GSO skb should be passed to stmmac_tso_xmit(). It is updated in
> stmmac_set_features() based solely on NETIF_F_TSO, so disabling IPv4
> TSO while keeping IPv6 TSO (NETIF_F_TSO6) enabled zeroes the mask. As a
> result IPv6 GSO frames, which the networking stack still generates since
> NETIF_F_TSO6 is enabled, fall through to the non-TSO xmit path where
> they are not handled.
>=20
> The networking stack already manages the GSO logic: a GSO skb is only
> delivered to the driver when the matching offload feature (NETIF_F_TSO,
> NETIF_F_TSO6 or NETIF_F_GSO_UDP_L4) is enabled, otherwise the frame is
> segmented in software before reaching ndo_start_xmit().
> stmmac_features_check() also validates each GSO frame against the TSO
> hardware constraints and falls back to software GSO when they are not met.
>=20
> Drop the gso_enabled_types field and rely on skb_is_gso() in
> stmmac_xmit() instead, which correctly routes IPv6 GSO frames to the TSO
> path when NETIF_F_TSO is disabled. This also removes the data race
> between stmmac_set_gso_types(), called from the feature-set path, and
> the lockless read of gso_enabled_types in stmmac_xmit().
>=20
> Fixes: 2e4082e4b739 ("net: stmmac: simplify GSO/TSO test in stmmac_xmit()=
")

Commenting on sashiko's report:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260824-stmmac-fix-tso=
6-features-v3-1-c73a7a4a0ec7%40oss.qualcomm.com

- Is 2e4082e4b739 really the commit that introduced this behaviour?
  - Commit 2e4082e4b739 is introducing the gso_enabled_types field. Using a
    cached value for gso capabilities introduces a race when the user modif=
ies
    them via ethtool.
    The other issues this patch is resolving are quite old:
    - commit 9edfa7dab8112a012b349b7937f5444fdc21e8f9
      Author: Niklas Cassel <niklas.cassel@axis.com>
      Date:   Mon Jun 19 18:36:44 2017 +0200
    - commit b776620651a1182976b51643bb2c5b08d535fb2e
      Author: Jose Abreu <Jose.Abreu@synopsys.com>
      Date:   Mon Nov 11 15:42:39 2019 +0100
    We can add these two more Fixes tag to the patch but I guess it will be
    hard to backport till that version.

Regards,
Lorenzo

> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
> Changes in v3:
> - Drop gso_enabled_types field and rely on the network stack to manage
>   TSO/GSO logic.
> - Link to v2: https://lore.kernel.org/r/20260812-stmmac-fix-tso6-features=
-v2-1-72c3b06eb8d4@oss.qualcomm.com
>=20
> Changes in v2:
> - Fix possible race between stmmac_set_gso_types() and stmmac_xmit().
> - Fix fixes tag.
> - Link to v1: https://lore.kernel.org/r/20260808-stmmac-fix-tso6-features=
-v1-1-f82b17595052@oss.qualcomm.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 --
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 19 +----------------=
--
>  2 files changed, 1 insertion(+), 20 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/e=
thernet/stmicro/stmmac/stmmac.h
> index 8ba8f03e1ce0..7582fca63741 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -265,8 +265,6 @@ struct stmmac_priv {
>  	u32 rx_coal_frames[MTL_MAX_RX_QUEUES];
> =20
>  	int hwts_tx_en;
> -	/* skb_shinfo(skb)->gso_type types that we handle */
> -	unsigned int gso_enabled_types;
>  	bool tx_path_in_lpi_mode;
>  	bool sph_active;
>  	bool sph_capable;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index b2b7d0242dd3..3a956c8b611b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4375,18 +4375,6 @@ static void stmmac_flush_tx_descriptors(struct stm=
mac_priv *priv, int queue)
>  	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, tx_q->cur_tx);
>  }
> =20
> -static void stmmac_set_gso_types(struct stmmac_priv *priv, bool tso)
> -{
> -	if (!tso) {
> -		priv->gso_enabled_types =3D 0;
> -	} else {
> -		/* Manage oversized TCP frames for GMAC4 device */
> -		priv->gso_enabled_types =3D SKB_GSO_TCPV4 | SKB_GSO_TCPV6;
> -		if (priv->plat->core_type =3D=3D DWMAC_CORE_GMAC4)
> -			priv->gso_enabled_types |=3D SKB_GSO_UDP_L4;
> -	}
> -}
> -
>  static void stmmac_set_gso_features(struct net_device *ndev)
>  {
>  	struct stmmac_priv *priv =3D netdev_priv(ndev);
> @@ -4420,8 +4408,6 @@ static void stmmac_set_gso_features(struct net_devi=
ce *ndev)
>  	if (priv->plat->core_type =3D=3D DWMAC_CORE_GMAC4)
>  		ndev->hw_features |=3D NETIF_F_GSO_UDP_L4;
> =20
> -	stmmac_set_gso_types(priv, true);
> -
>  	dev_info(priv->device, "TSO feature enabled\n");
>  }
> =20
> @@ -4771,8 +4757,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb,=
 struct net_device *dev)
>  	if (priv->tx_path_in_lpi_mode && priv->eee_sw_timer_en)
>  		stmmac_stop_sw_lpi(priv);
> =20
> -	if (skb_is_gso(skb) &&
> -	    skb_shinfo(skb)->gso_type & priv->gso_enabled_types)
> +	if (skb_is_gso(skb))
>  		return stmmac_tso_xmit(skb, dev);
> =20
>  	if (priv->est && priv->est->enable &&
> @@ -6206,8 +6191,6 @@ static int stmmac_set_features(struct net_device *n=
etdev,
>  			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
>  	}
> =20
> -	stmmac_set_gso_types(priv, features & NETIF_F_TSO);
> -
>  	if (features & NETIF_F_HW_VLAN_CTAG_RX)
>  		priv->hw->hw_vlan_en =3D true;
>  	else
>=20
> ---
> base-commit: 7cbfb180945ce529608e4d4e24a6d483699fab1e
> change-id: 20260808-stmmac-fix-tso6-features-7fdc5e9448e2
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--tXbvHYpj5TCCyFOR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCao/pcQAKCRA6cBh0uS2t
rJ+VAP9w6VkmkvlGVEsS5KD8+U1H7kNAEKqk8M8zXLPQB8fvWwEA573p7JTWZLHj
nOV6RZuzOf6yxkiM0CtRe1139XUhqg8=
=V9MW
-----END PGP SIGNATURE-----

--tXbvHYpj5TCCyFOR--

