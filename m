Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7F2C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 07:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgzfruFj4FbrPg8AHtV6XVyouIx7S8A/hrzczQxqXGw=; b=hxbl7m3pyqoO5bAIUu/ZIaBGcz
	cq36D1qYv4W0Kw5yw4MVNxvA0j0JoWrmI9lrhPB1gMAJ6kQ0fAAfbNPFbm9sgWy0MD6iuMfNPX+NA
	50msTrMT5YTDsaCEmTYxu7RX/MHt90KwEbx/F6GaBQ3Gyl4gKWLYCQSXInWjWO4oKkjoGR1GU+LMT
	D9G0kRd/JKNKVKv2J8tQ/AV7AhseD61Ej/DGTA6J4oZjdXuszFToj6WoCl/E8zvmjNrh4drvSVcSu
	gGpXLj3b/Wqgg3tFg2i7yH98pkAuLO3Kf/ZbZHoOLTDFl4q9vK072fz9MuPj5FMUIJsmizn8HznQM
	GskWjGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUHM-00000003WoW-0yH4;
	Thu, 27 Aug 2026 07:12:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUHJ-00000003Wng-2Hrg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 07:12:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6RGra088070
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 07:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MgzfruFj4FbrPg8AHtV6XVyo
	uIx7S8A/hrzczQxqXGw=; b=YN4I8U1ZHI6rCIqtBq1c5feY/lZALBgGKvI2YlBf
	fiy3P0hqJJ/5tHjVcUyANtldJZYrO3KfIJLrtcuBvrNh8+lDm+fEJk1FOz7zTYte
	qIZuuf6Z6+tMUbBVOYf8VzYv7gDVPUtz3FgheW/p3alxvL7ARjmatiS7SV6keDxu
	QmK8Qw1x/ChI4M7lS2p90hjrzvkMCqetyAJU8uzPD02oPqlS42bgm4/92cPl+1tD
	Y6ERL6dGVNMuqD1+gFM9jZtuh70Ss9u98HlDIAf9OxPyIIBy93QrtGI9Ibc4YvF7
	1nJlZZWo1axPk9/AHqAgI/3cl54/Yys2DTLpy1k4Mb0/GA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5hgvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 07:11:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8db414c7so24117491cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 00:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787814718; x=1788419518; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MgzfruFj4FbrPg8AHtV6XVyouIx7S8A/hrzczQxqXGw=;
        b=AbrbzjNiVdPJwWgel0xSqejTZY8jdO5y9KylKP2avj7myhc5rzHTG4KuO5L6ls8iYz
         cuLeXduxeeXxndJNwh59b1vuibDolwLvO1BRUD+m78x3ByCbEh4yCQNeyySBVpJtogMT
         hH4YIFi+m/VQkEBNzcJMZdGKiK9w1BUAEfkrFaW3Te5qvoPn9tj4J1KLacpcvuliGP2N
         StvkfHP++rEKDcFFmQJMlYUidsezuNamTHH3Xim7LCxEJ3fdbE927Pga9Sa/iPP/at/J
         67rwllRtd/nNS87zxwNT3Yn91pqtnOUH1s8uCLBd7zJ6YI9LyvlL8WwkxXzuz0Ah/hwk
         kjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787814718; x=1788419518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgzfruFj4FbrPg8AHtV6XVyouIx7S8A/hrzczQxqXGw=;
        b=OuHviOGrcWiR/RZrwJoRJfo3+guWdqnqI7lweWrDYHNK6ghPicdQ6hOrX8Weodfptx
         2iZQC3gOjyLB1/AIkXMQQ9i818aua1BH+/wOwFsvrrZqobDEdexDXyyvig78yu0O7lGb
         yxnpZL4tfEQBczY1HCe4Dlr0DUJyI0Yd9qfobU4I4E4jjBL/46xrR6anMP/VPpl+e0W2
         njufLxIqhDBi/JGUSRgLnqHKbxngi/tVZhL9URwr67E21ZaYh3xMSKhJl2n2EktSDmwo
         th+vgSw0SR8pgFZa8SQw3hGqMSuyjzl5ak1mpr8s+iQm92E4G4wXGVxblKgaKqZxhEZs
         Ikig==
X-Forwarded-Encrypted: i=1; AHgh+RoZqPaJNhteEA78LEQlzXubP9a4fBfQzzPgXzYJ6GSR7rEliRcw5rhAiOL+uHfqxhBoYyilMRMCY60yAwxcoDHb@lists.infradead.org
X-Gm-Message-State: AFuF++nW4DasKJ+4hS72Lt2Uh/YM7Ct2uUANU+ApemgQACnk43wXWZKS
	1jKBAmLRBTtovhGGEZQiD5wFj99ddIVy82oj6Gv0PR1eA8NxVhl2TyrsN3KiFZCePbwiKhQytW8
	fT9cAMraHdnLGVqtdI600Hdxc4YJtNo9/P/Qf3YLTCDmRkDdIte0k4BC0lA/mEZQ46ITeET0Cqh
	UkrA==
X-Gm-Gg: AR+sD11D0+9pDVR37gpNONQNKcu0MN6z2rByjGAEnVTJoZExgf7cyITMUqWow6JQbsg
	jrg6ljzwyVlTHjnAgRnqpW9uIsWccTc77tpTfwxVkKKNang4VD4QuY/pabVNJXBWuRLkbjF59QW
	4K37lNqLRviD53ejK5dv3TQLfqbr/XjrQ1WoBXSOUIlCfX5RXxMwNsoX4cqFomD0H+tRTKXc3gc
	Kr7zgnOf0WbLeQ4FH1NMxW8dgrQwdeTlpRyDHFfmN0c/MAvRMnFyv52aVoO+HGzbzUW7vrAzE37
	2Q0sMaaU6QppHApI+RWXkH9W6N5wHtJ+z1yixFVE/0d+RtmI6zTJybQCJTQPxfXYVZ03NtiyIsf
	O4PbIORCNNX+E6Q==
X-Received: by 2002:a05:622a:3ce:b0:527:7a5b:ca67 with SMTP id d75a77b69052e-52e423deda8mr121295951cf.20.1787814718173;
        Thu, 27 Aug 2026 00:11:58 -0700 (PDT)
X-Received: by 2002:a05:622a:3ce:b0:527:7a5b:ca67 with SMTP id d75a77b69052e-52e423deda8mr121295541cf.20.1787814717537;
        Thu, 27 Aug 2026 00:11:57 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4e2c1af7sm27101205e9.15.2026.08.27.00.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:11:56 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:11:55 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: hold runtime PM reference in setup_tc
Message-ID: <ao_jO442V4eG7xd0@lore-desk>
References: <20260824-stmmac-setup-tc-enable-pm-v1-1-45172d241a4b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qit4tLMxBEK2W8qA"
Content-Disposition: inline
In-Reply-To: <20260824-stmmac-setup-tc-enable-pm-v1-1-45172d241a4b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: axRss-Dasif6v-2jK5KFUJCd0d5tIYQz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA1OCBTYWx0ZWRfX1/7sNGIsmys0
 3BdTwd1jeWAOFdSajSBzd6nGzBTMFyxosMs7jV5k8fCeAtf1hWpVDaJi314CT4C3Smtlw+7DFob
 Y4a+bbATs1brjg4TyniFwjV1eh0Vd5U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA1OCBTYWx0ZWRfX22vBpdjgIRuu
 QX5xWkr5TYqxsxo56TXH1ebnBhWCeBK3sknC4qPUReZGyn95qV1WyIlcaBComKHClpwvcv1UuhA
 fNrMnIYTJFFI67WJlAagiI3bEddyomrtsrlQPdk+UVwRoOhCasfmsIrT/BW1r0srar/RBUjrGG3
 wvO7s2gMno1GzZgavuzZtvV2ruk35ti1+IC0tTSv393cZOlSjmwHeECl6huwr/YFRH0hB3JisjB
 kRynYawaVvzbs5wVcxb8Z0BTCHS4ZZNUlVAjGC4ybbuwzg07VGfXRzGAv6aRUNrhwMkujoF1wkG
 Jr8lX2eAULv6QEzRr0pOGw9OOknR6sZ4Qv+fUYGTecfwz9AVRn67CH8n+BdLqOcCQBcvIgus0e/
 B4uXS49FPuGW2X/PjSztBZJXGa8xvmS/jSpumrzqgNRjhL2Z/8dyRTX7VKWBq8eZf6yNkZj4Kzi
 Ako0Zu1dUILZbPYdxxw==
X-Proofpoint-GUID: axRss-Dasif6v-2jK5KFUJCd0d5tIYQz
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a8fe33f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LK5SnTVSdOS2cW5lnr8A:9 a=CjuIK1q_8ugA:10
 a=_YFSIjxOcyUDFHQV-BYA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_001201_597363_F83CAF9D 
X-CRM114-Status: GOOD (  31.64  )
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

--Qit4tLMxBEK2W8qA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The qdisc offload callbacks invoked by stmmac_setup_tc() program
> MTL/MAC registers, but they can be reached while the interface is down,
> when stmmac_release() has dropped the runtime PM usage counter and the
> device may be suspended with its clocks gated. Accessing the registers
> in that state can trigger a bus error.
>=20
> Hold a runtime PM reference while configuring the register-touching
> qdisc offloads (mqprio, cbs and taprio) so the device is active, and its
> clocks enabled, whenever the MTL/MAC registers are programmed.
>=20
> The TC block callback stmmac_setup_tc_block_cb() programs the MTL/MAC
> registers as well, but it runs asynchronously from stmmac_setup_tc(),
> outside the runtime PM reference held there. Hold a runtime PM reference
> for the whole stmmac_setup_tc_block_cb() call as well, covering the
> cls_u32/cls_flower setup and the queue enable/disable accesses.
>=20
> No reference is held for the TC_SETUP_BLOCK bookkeeping itself, the
> TC_QUERY_CAPS query or the tc-etf path, since none of them touch the
> registers synchronously. In particular the block bind/unbind must reach
> flow_block_cb_setup_simple() even when the device is suspended, so the
> driver never leaves a stale flow_block_cb on its block list.
>=20
> Fixes: 1f705bc61aee ("net: stmmac: Add support for CBS QDISC")
> Fixes: 4dbbe8dde848 ("net: stmmac: Add support for U32 TC filter using Fl=
exible RX Parser")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 34 +++++++++++++++++=
+++---
>  1 file changed, 30 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index b2b7d0242dd3..4baf40fb01dc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6392,9 +6392,13 @@ static int stmmac_setup_tc_block_cb(enum tc_setup_=
type type, void *type_data,
>  				    void *cb_priv)
>  {
>  	struct stmmac_priv *priv =3D cb_priv;
> -	int ret =3D -EOPNOTSUPP;
> +	int ret;
> =20
>  	if (!tc_cls_can_offload_and_chain0(priv->dev, type_data))
> +		return -EOPNOTSUPP;
> +
> +	ret =3D pm_runtime_resume_and_get(priv->device);
> +	if (ret < 0)
>  		return ret;
> =20
>  	__stmmac_disable_all_queues(priv);
> @@ -6411,6 +6415,8 @@ static int stmmac_setup_tc_block_cb(enum tc_setup_t=
ype type, void *type_data,
>  	}
> =20
>  	stmmac_enable_all_queues(priv);
> +	pm_runtime_put(priv->device);

commenting on sashiko's report:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260824-stmmac-setup-t=
c-enable-pm-v1-1-45172d241a4b%40oss.qualcomm.com

- Dropping the -EOPNOTSUPP initializer of ret changes what this callback
  returns for tc_setup_type values the driver does not handle. ret is now
  first assigned by pm_runtime_resume_and_get(), which returns exactly 0 on
  success
  - I will fix it in v2

> +
>  	return ret;
>  }
> =20
> @@ -6420,26 +6426,46 @@ static int stmmac_setup_tc(struct net_device *nde=
v, enum tc_setup_type type,
>  			   void *type_data)
>  {
>  	struct stmmac_priv *priv =3D netdev_priv(ndev);
> +	int ret;
> =20
>  	switch (type) {
>  	case TC_QUERY_CAPS:
>  		return stmmac_tc_query_caps(priv, priv, type_data);
>  	case TC_SETUP_QDISC_MQPRIO:
> -		return stmmac_tc_setup_mqprio(priv, priv, type_data);
> +		ret =3D pm_runtime_resume_and_get(priv->device);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D stmmac_tc_setup_mqprio(priv, priv, type_data);
> +		break;
>  	case TC_SETUP_BLOCK:
>  		return flow_block_cb_setup_simple(type_data,
>  						  &stmmac_block_cb_list,
>  						  stmmac_setup_tc_block_cb,
>  						  priv, priv, true);
>  	case TC_SETUP_QDISC_CBS:
> -		return stmmac_tc_setup_cbs(priv, priv, type_data);
> +		ret =3D pm_runtime_resume_and_get(priv->device);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D stmmac_tc_setup_cbs(priv, priv, type_data);
> +		break;
>  	case TC_SETUP_QDISC_TAPRIO:
> -		return stmmac_tc_setup_taprio(priv, priv, type_data);
> +		ret =3D pm_runtime_resume_and_get(priv->device);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D stmmac_tc_setup_taprio(priv, priv, type_data);

- This is a pre-existing issue, but the patch now explicitly sanctions
  running taprio (and cls_u32/cls_flower in the block callback) with only
  the bus/CSR clocks resumed, without the rest of the hardware state those
  sequences depend on
  - This is fixed in the following patch:
    https://lore.kernel.org/netdev/20260825-stmmac-est-reapply-after-open-v=
1-1-dfa80735e0a1@oss.qualcomm.com/

Regards,
Lorenzo

> +		break;
>  	case TC_SETUP_QDISC_ETF:
>  		return stmmac_tc_setup_etf(priv, priv, type_data);
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> +
> +	pm_runtime_put(priv->device);
> +
> +	return ret;
>  }
> =20
>  static u16 stmmac_select_queue(struct net_device *dev, struct sk_buff *s=
kb,
>=20
> ---
> base-commit: 7cbfb180945ce529608e4d4e24a6d483699fab1e
> change-id: 20260824-stmmac-setup-tc-enable-pm-149aa563d797
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--Qit4tLMxBEK2W8qA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCao/jOwAKCRA6cBh0uS2t
rDwmAPi5W46YAs2N7ck9ZndK/1g9U+egoj3T61BVVsU5jsTJAP466NaLx5IjYqmy
+tu/Ntp3W3JTj5GLfket4cN6CcZcDQ==
=DNMW
-----END PGP SIGNATURE-----

--Qit4tLMxBEK2W8qA--

