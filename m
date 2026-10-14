Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FC7CC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tw9zAIFrrfXrOTzkc0WmYnxIoH9x6CiP1Stz5Zlwuwc=; b=FVYVLe5qpMFQxPRy9a4rz8jIbQ
	YgTc4gQgN3vFvBb0WxJEtGvE22MOzyP+hk2b78IF7wlnuBL2fYmnQ3vF5nzp+HyIMHZ3WTVo+7VS4
	FplqUR3WV+0UbuFprIZGbqS+TPOof3N1vM/qbEDc+J9TR2lblVIei3F01SIwPfF3QlhBK3RoPpwMe
	Ih+48Y1EXOw2lHQAIbnp9oP2sHEjsf6t4aBQlM0Qyy99wL2QqNxJQoDqdWFSNv7ECkJBNHsfa5Npq
	AERx/85xjyNT8lNEk1AfYHWhwbK6izRxpzXIR3+soDxSc7rizajp2xDp753GBp6F3Pos2A1pT35kG
	3Havr+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuur-0000000EyeN-0jY0;
	Wed, 14 Oct 2026 09:04:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuup-0000000Eydp-27aM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tw9zAIFrrfXrOTzkc0WmYnxIoH9x6CiP1Stz5Zlwuwc=; b=CRvvDabONBi25CtrOrd4+ZwKzT
	P8hFsx/4QxXm1exqNS4s+4oj5bxC+qGxTO6IsxV9KWGIfElcA0H8mdT8qUbEAFpzANQ52vLd5LqJ2
	LMACBxpwks4EJnDbqy74nv0DOR8WRdn16lJq2sKdm8GW7B7qPVbPEE/gkvw7QguJUCqr3cvmyjDZj
	HUmzf50xOKoFUxThs+9IPDXl64XKAsjiD+BthNQpazpaXawmX1EAUNoRTO0JWO+Wze+ZnHQIPGQxp
	uPntbeYa+kQ05uXN0GDvTJnEoqNtDX42y0kK81F2n3EhbGSN0K2jau1tdHPegJK4wTwC9pJG1mw0r
	jHYHuFjg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGuul-0000000GXVH-0RqM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:04:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6NvkJ3103922
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 09:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tw9zAIFrrfXrOTzkc0WmYnxI
	oH9x6CiP1Stz5Zlwuwc=; b=gzUkZN653bXJbID41oRN9YnCGU2OF4MwTXJqUHGo
	5QkQV9MPj59rRW8ORczlVg9V+lNZaLa/sOyF6d9aENFh7tgeo+sbfHsQR4sB2M62
	fXjHJa29CSgK4DRMPh/kqHGjVCox3kYqvIxuQC4MEIp87jTtvpfca6YM1asTXssq
	fgW5rnHrDMJQ4OVuJm7wekawG+gEHLYtck0mTOBk8H9XXNwE52nzRK6XAMZbokcr
	NBEEgHuNrPR8Whg3iINq6Vn3tcxouVmHuE66Evz2DH3prF/wKAw1n9nJxGcfN81V
	vuQxZDPWHGs6q5Jj0/1f7rLibQrBWFyBy17SPEH3XN5Xfw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9wgt247q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 09:04:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf4c0af4eso137074885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791968683; x=1792573483; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tw9zAIFrrfXrOTzkc0WmYnxIoH9x6CiP1Stz5Zlwuwc=;
        b=d0DhGQ8d1SzYI2O7//lUZtBLRVOM0coEHPFmAAmEYSIub/ZCrFRYEGBtSz9daCeKrv
         xER/GcctwNqmWP0bA3Xz81yyl1AYnOWCfqNtAeofmZzSo2KS33e8EXtSGM2h8oTiUvJm
         amer/jujROEyr66OeXJEv1iF+eQRTCEU954bcGOgY0niPT0MfL2UJCBxpZG1YNG0X4oR
         nNlZwQbYiWelVobcrtrHAOjisarEoHxuVXADa6/7tR7X8abBq99JrvQHRwk8Scuc9Ukg
         VvHF6JsJLonbmHOKF2mRttCzDxkD22ywyUn+qkZ2D3+Z76391OKhJkBrvPvtoEP1Sm0R
         2T2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968683; x=1792573483;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tw9zAIFrrfXrOTzkc0WmYnxIoH9x6CiP1Stz5Zlwuwc=;
        b=KxMTcHQd+cgqTC/13eofeoMLU+VivfxWuQWaKeN93LcwwsvJKJ5umQ17EmeSYm9Lmf
         WBHtSBjLCyTRTTVXWgKu08OJuGRnJ+Paz2vikc7fNq6vqn4ugK2zOeau4j0EefElTmJ/
         7Ja72AYNBwuSaD6eBDM+VZMa+n9sHxfu6ABm5eSHp8YM39nqUzogL7+JJOeINLKlKuO3
         YfoU0Ww9siDrbcv2y/kay3qqFVbasp9tgbMBZewHFIn04BqobNN58aMJLTQUzDhnVvTa
         4T2vmoVgOslr1GxwsOYRJ4S9d9IoU5wsvgRIMbezt1JPOkW6XVAjTXLl8Pl+AO3F1WaC
         gHrw==
X-Forwarded-Encrypted: i=1; AKwUvBy11BR7NvRESqh1GOHfipmzjp4IJv4qZoYhR8G3DVHSjjH9qTMf11CQ3thCyjD68eGZHHfo5klfp9t4IXcffQxf@lists.infradead.org
X-Gm-Message-State: AFq9FYIlA8CM6Zx8CBe2p+oFxPDbGbYvT58apC2Ov+NoYLavkA+GplBE
	eNldaMpIMsB35gX7oaifBskFjyUeR8jS2Nsrp3gy+7u4m1tHUJp1Lid9fMz8g7l3dSdiACDt9+C
	k0eApTgTcz00w4pmoq5krUoIUSHot3TkBIfo77QDkStSrLq/qqIVNBo5svOnfbgYZ+4S308mCKZ
	PSmw==
X-Gm-Gg: AYBFou3dL9NWtL7Oyvhq4tyOJOrBKI9SIET/+YR/IG4XuLxe9tEChDF0eJwRwKvHuNJ
	ruB/w6AuuvC/yzpiBjGXBqrE4JbizkogSr8kSf8RrSx5tDXfGfaZQ9/SWVqclhxKA5U2RjEx/7g
	HdNsf2ezN0R3V9o0W4FPX7cVEi9+tiieSaVTOC2I/V8vChvLS7jG75LzTYgJfUb2Fvdo7Jurtso
	kNse33xKzN9dpODvIE5NeR+/azU2QZFVsXU38YYoBfz06C6nNebxUzyz/ZBr/RD3SwLUertLCMC
	5Vfjnc0ALT32aXuHUn28UsnDcIYsMX/uPc8zkwdXqxekSl9R2b9HGPJKY/t5Hu3wnAG5R8YCGMP
	yMuZRWBrOiFzZPg==
X-Received: by 2002:a05:620a:800a:b0:93c:6341:1d66 with SMTP id af79cd13be357-93eb961ca81mr2530093385a.19.1791968682495;
        Wed, 14 Oct 2026 02:04:42 -0700 (PDT)
X-Received: by 2002:a05:620a:800a:b0:93c:6341:1d66 with SMTP id af79cd13be357-93eb961ca81mr2530089085a.19.1791968681822;
        Wed, 14 Oct 2026 02:04:41 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm769625065e9.9.2026.10.14.02.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:04:40 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:04:39 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        dcaratti@redhat.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, daniel@riscstar.com
Subject: Re: [PATCH net-next] net: stmmac: fix mqprio and cbs combination
Message-ID: <as9Fp6tT8-R26zsW@lore-desk>
References: <20261012-stmmac-mqprio-cbs-combo-v1-1-831e323eb4ef@oss.qualcomm.com>
 <179192615470.434549.15391678719442132292@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n3UHTxbxQXy0YYKA"
Content-Disposition: inline
In-Reply-To: <179192615470.434549.15391678719442132292@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX0tvZL/z/KOyn
 HF90vHrhUA2TPN2b3xlagTm+bAwEiNcC62N90doGp4a8VBoNiej1Tb6aA3P0n73okRcPeVpesTl
 juwt+bBxhJNYsb+IJjCIYC0aVQkFeQTDSYZIDxp7uN4GjYuyUSV7yK7WZEB3r3/VonDa5FHKwpb
 yeWweLv6FwJIKF7iKW5KiaVpgHLSH0ZS+hDFqtb8jZphjA94zBRlLam5PuKnUFEKCW6UOwx+rFu
 vgsKfWyQ2JxngVKxMJk7jegI7HkTsbeRNz/ZkWSsTWufR3No9bOfgr7vVF0dt9Uq5nV8X0Ztlpj
 5EERu5qiinAOH3trj1TB8KPpckGb2m8rbhV78H3GNU+kzLAWnA9qboJLYqeo6cIpsV8bhoKO8VF
 KfCdlOiirOqMy1vfB+oHZ2zL4Wqrp1MOmNuBPgtLa2+ipiqZfXf/Po6AzO6mF64A2U4+AQu0DiE
 OovgrEsV64chB7Dolrw==
X-Authority-Analysis: v=2.4 cv=Jp1kP84C c=1 sm=1 tr=0 ts=6acf45ab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=J8u11l3eBsutwK0vV1QA:9 a=QEXdDO2ut3YA:10
 a=pLGSq0pBND5JrVecVpgA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-GUID: qJum7M4tYwaOnAcYyT6-iqDVlKGHQaLG
X-Proofpoint-ORIG-GUID: qJum7M4tYwaOnAcYyT6-iqDVlKGHQaLG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX669pNOEFrifB
 tmCZk26kN+PBDP2i/Hjasu6Y3d3dkK8nnfo/wTqEKn95BFjfAs3457t4HZPosiMLVtzyV4DCxYp
 WnXaU9aVomi5WrAI1RPACAQQMHZ1fxw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_100447_537025_A7837B0A 
X-CRM114-Status: GOOD (  40.70  )
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

--n3UHTxbxQXy0YYKA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [High] The commit message says the strict-priority scheduler selected
>   by the channel-mode mqprio offload and the per-queue CBS shaper "are=E2=
=80=A6
>=20
> --
>=20
> net: stmmac: fix mqprio and cbs combination
>=20
> This patch removes the checks that stopped the channel-mode mqprio offload
> and the CBS offload from being enabled together. It drops the AVB queue
> rejection in tc_mqprio_validate_chan_mode(), the prio_offload check in
> tc_setup_cbs(), and the matching AVB check in stmmac_reinit_queues().
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_tc.c
> > index ea1f97d6f0bd5..175236ba379d0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
>=20
> [ ... ]
>=20
> > @@ -1350,18 +1346,6 @@ static int tc_mqprio_validate_chan_mode(struct s=
tmmac_priv *priv,
> >  		return -EOPNOTSUPP;
> >  	}
> > =20
> > -	/* Forcing strict priority conflicts with the CBS algorithm
> > -	 * of AVB queues, so reject the offload when any queue is
> > -	 * configured as AVB.
> > -	 */
> > -	for (i =3D 0; i < pdata->tx_queues_to_use; i++) {
> > -		if (pdata->tx_queues_cfg[i].mode_to_use =3D=3D MTL_QUEUE_AVB) {
> > -			NL_SET_ERR_MSG_MOD(mqprio->extack,
> > -					   "SP conflicts with AVB queues");
> > -			return -EOPNOTSUPP;
> > -		}
> > -	}
> > -
>=20
> [Severity: High]
>=20
> The commit message says:
>=20
>   The strict-priority scheduler selected by the channel-mode mqprio
>   offload and the per-queue CBS shaper are independent MTL settings and do
>   not conflict
>=20
> Is that true on XGMAC/XLGMAC cores? They use dwmac510_tc_ops, so both
> tc_setup_dwmac510_mqprio() and tc_setup_cbs() can be reached on them.
>=20
> On XGMAC, SP and CBS look like two values of the same per-TC TSA field.
> dwxgmac2_prog_mtl_tx_algorithms() rewrites that field on every TC:
>=20
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:dwxgmac2_prog_mtl_tx_=
algorithms() {
>     ...
> 	for (i =3D 0; i < MTL_MAX_TX_QUEUES; i++) {
> 		value =3D readl(ioaddr + XGMAC_MTL_TCx_ETS_CONTROL(i));
> 		value &=3D ~XGMAC_TSA;
> 		if (ets)
> 			value |=3D XGMAC_ETS;
> 		writel(value, ioaddr + XGMAC_MTL_TCx_ETS_CONTROL(i));
> 	}
> }
>=20
> dwxgmac2_config_cbs() turns CBS on by writing the same field:
>=20
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:dwxgmac2_config_cbs()=
 {
>     ...
> 	value =3D readl(ioaddr + XGMAC_MTL_TCx_ETS_CONTROL(queue));
> 	value &=3D ~XGMAC_TSA;
> 	value |=3D XGMAC_CC | XGMAC_CBS;
> 	writel(value, ioaddr + XGMAC_MTL_TCx_ETS_CONTROL(queue));
> }
>=20
> With this check gone, what happens if a TX queue is already in AVB mode?
> One way to get there is a DT mtl-tx-config queue with snps,avb-algorithm.
> In that case stmmac_open()->stmmac_mtl_configuration() programs CBS for t=
he
> queue when the device is opened.

I guess the only case that is not covered yet is if the user configures CBS
via the device-tree and then applies mqprio via tc on top of it.
I will fix in v2.

Regards,
Lorenzo

>=20
> After that, "tc qdisc replace ... mqprio ... mode channel hw 1" now
> succeeds and runs:
>=20
> tc_setup_dwmac510_mqprio()
>   tc_mqprio_validate_chan_mode()
>   tc_mqprio_config_queue_prio()
>     stmmac_prog_mtl_tx_algorithms(priv, priv->hw, MTL_TX_ALGORITHM_SP)
>       dwxgmac2_prog_mtl_tx_algorithms()
>=20
> Would this also clear TSA on the AVB queue and turn CBS off in hardware?
> Nothing calls stmmac_configure_cbs() again afterwards. Meanwhile
> tx_queues_cfg[].mode_to_use still says MTL_QUEUE_AVB, so the driver state
> and the hardware would disagree until the next ndo_open.
>=20
> Removing mqprio seems to cause the same problem. prio_offload can now be
> true while AVB queues exist, and stmmac_reset_tc_mqprio() then does:
>=20
> 	stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
> 				      priv->plat->tx_sched_algorithm);
>=20
> On XGMAC this rewrites TSA on every TC again (to ETS or SP). That would
> wipe CBS on any AVB queue and not restore it.
>=20
> The example in the commit message (mqprio first, then the cbs children)
> works because config_cbs runs after the SP write.
>=20
> On dwmac4/EQoS the claim does seem to hold.
> dwmac4_prog_mtl_tx_algorithms() only touches MTL_OPERATION_SCHALG_MASK, a=
nd
> CBS is enabled separately through MTL_ETS_CTRL_AVALG.
>=20
> The commit in the Fixes: tag added these checks on purpose:
>=20
>   Forcing strict priority conflicts with the CBS algorithm of AVB queues
>=20
> Should the checks be kept for XGMAC? Or could the mqprio set and reset
> paths call stmmac_configure_cbs() again after reprogramming the TX
> algorithm?
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261012-stmmac-mqprio-cbs-combo-v1-1-831e323eb4ef%40oss.qualcomm.com

--n3UHTxbxQXy0YYKA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas9FpwAKCRA6cBh0uS2t
rGZPAP98x72otE4qA4N1TGw3slHXH9KEzgmf4M4VZf0q5OUz6AD/cxcAm5sdDz7I
xoiNkdA1JAF4hqpK3e/kZFVzTHNjbw4=
=Rw3M
-----END PGP SIGNATURE-----

--n3UHTxbxQXy0YYKA--

