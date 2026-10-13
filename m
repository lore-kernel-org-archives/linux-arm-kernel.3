Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEE3CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkkriaE2WU0d2VqRJJ5Pyd253q7mRiLih0MdgW2VeWA=; b=pY1kx4egkFTcvtc5iO8FguCA6+
	r/ga3OlASUv7AgKdbyI2dgZq9vNU3mNbhEwpve7v7S7qizpQm9qFP6xQXKZT6qfrwjwigI8H+MW0D
	Teg9pmikRN62S8YBwOXu76YQLNA3kbaWXSDPZYTUfeyVNhwqXTsyFyEoWojU5j0Uim7Om//b1tObU
	mLPZ9M/Qh9x05JMpZWYmhWsUmMWFeWEf3COXy6nTlOA1guFBsJqo24DnemEUnbWs6MzRdgPraTOaR
	e+OnZaBqdgZboKoXYRZZzrq+rFWZWaIf32X2SEhByYdP/3QpUAA+ZcxBE0g927CpC5zQNZgc341Ai
	vf8QUCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGec3-0000000DNnw-1ONS;
	Tue, 13 Oct 2026 15:40:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGec0-0000000DNmf-2D5g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:40:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3fZw1143626
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 15:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xkkriaE2WU0d2VqRJJ5Pyd25
	3q7mRiLih0MdgW2VeWA=; b=JerztOAlwck8NrXvvn8jzhjao46aiQd7pPF6Jr/R
	rdPqciWn4xsnj9hBCNon+abtPOc91ECuVjK0PoQnTBAgLhpx0tKYy6M2YRK8YS5e
	U2fmKmueG/TMmOKmgqwt907dCLIeT6jZPsu3hwPcTZDaTb+MfDBPOocpyyZJyD5o
	SdfDnkKsItqNV2rx+KeWIJ6jPoMd8j3VoiD8JTrPG3W4kBpCeo4HOl9TKngPatzo
	31m6vT7gdyaUD/oDUp0em00G1ggyxLmDjoooVneBsxZXJdY+GqgcpqbVrrpU0tyn
	tl4uBdRQHrm9OhJ0hrvx9+izzAgZpBHR0LhiEkczPgaoRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg9ptk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 15:40:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso543765385a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791906019; x=1792510819; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xkkriaE2WU0d2VqRJJ5Pyd253q7mRiLih0MdgW2VeWA=;
        b=dtI9UiQlDGGdrHN2V3mwymFYCn+7y4YSWEqPLwr0E8reIkdqs3ArPcPqD9uR+6vfsR
         3rCNJ5X3ndapzVUExSsmZpeqr99wlADSiWVxTIvxVkvovTqxENyoaSM4gXZSO84F5THF
         GEsF9f53c7yza/g5ca7ZhEAGdF9Sz/SREHMP0uA/vTd6LZg20eH74v6aMn46n7bvM7aH
         rx/nxzLhnRAr6OPbzwT2LwUrjw1RV2W7ie9hfJkV4v1ILzarG3e9gXfcbB8W5Py0MlJ7
         NGx/Fc/5NTVLL9W5OfLTFZ9/UL2u9Hrb5Ym8mpT2MLLvogCv+Vyj6I1d8jFnO5IYslwZ
         KOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906019; x=1792510819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkkriaE2WU0d2VqRJJ5Pyd253q7mRiLih0MdgW2VeWA=;
        b=tohK3rrDiKfL2tiX07J5xDbm5EISlhC3/Whfvse9u5ks7QkYmiITZOeml4hiIuw5hp
         hVpHsV8yf27Vt8ZiwKVhR0vsUA+AbiVSsqH2YSCIjooc+uM0MrauGfCimNqF2JYX8QTf
         TgotP91bPjTEBT5dKE0DF+vrfJpYJGbXWOw1/5jxxvBU1NjAW5czBYZdOQ/tK+pDqyjb
         cevSjQQ+koyH2U59i9PnE8ArpN+nolFCeIUYccKdGtURIyPhraq9BhOU2hNm5hzoULqk
         UMdH/6wHVm2wimy9a8dJJHTt91RZgHRCjt4LgWYk/tKTeF8zzYCGHjTdGgifMwLFciIv
         JcaA==
X-Forwarded-Encrypted: i=1; AKwUvBxM84bsFplpljbSZ35cgcGEzopdii1TrLyxDR2qsvmT6e3Xp76LlGv929Cj9JrHH2+74MtIl1lSg+mUA2mJsd5Y@lists.infradead.org
X-Gm-Message-State: AFq9FYI3yJXlYrKfwBBEDVwgOnUtB/PJIxVUkB4n6FKezaojhtZCNRFY
	OxByVpuXn1cy/LA/XvgoKbsnnVi7hWLnHwJxug+kUpvdwQ5ETUqCEWm/Pae47FIvlRm7mtw7rmg
	BEPYLRAr4PlpsrHsAXrNP91zDIpCM8HBWqNdWObwGQfj+vW7PwQ85y1oBY9H5d7ssGvZynaZG6Y
	2BQw==
X-Gm-Gg: AYBFou2MTpXKp50m8R2wV7JwHHInASyakvLUvS5hHzTQ0mztG60MpPQh3zujBjGRmAC
	u0xVda3BMk+LaVpn/45J4hZkQzzv/HQFBiiU3W6JSTYWeex41ijrY6+Xt2cM2QTOgGlPQ58PXRq
	qDHpFb/P/u4gxxJYVgftrhcUeua5pCVVI5mV5k2ufoSO+O08LvJaYKid4M9QsFHtvfrLnlXsryo
	8/JSyGzuyKq08BBc2ORm8Znz94bdQsev03BnMlU/CqvnmlBkUtG3tglbrFXvINBMbBq/9S5E6QK
	tM5a/mHBkWVmguSaokRcFC04UIZfom9S0Ux2Hn1nVn/ziYDcr96qT2ApNJGDaYUQCUIoKv1OTK6
	457J1AeEY6KH8Wg==
X-Received: by 2002:a05:620a:17a3:b0:93e:6283:eba6 with SMTP id af79cd13be357-93ebd225b0dmr2202770085a.38.1791906018478;
        Tue, 13 Oct 2026 08:40:18 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93e:6283:eba6 with SMTP id af79cd13be357-93ebd225b0dmr2202762885a.38.1791906017768;
        Tue, 13 Oct 2026 08:40:17 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6ddcsm5815044f8f.52.2026.10.13.08.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:40:16 -0700 (PDT)
Date: Tue, 13 Oct 2026 17:40:16 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
        john.fastabend@gmail.com, sdf@fomichev.me, boon.leong.ong@intel.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] net: stmmac: fix XDP TX DMA address for
 compound RX pages
Message-ID: <as5Q4C4FNjwitjdI@lore-desk>
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-1-05fd0c90f7e1@oss.qualcomm.com>
 <179190522641.434549.12034764335349832312@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QzzmAfyjxSP9etro"
Content-Disposition: inline
In-Reply-To: <179190522641.434549.12034764335349832312@kernel.org>
X-Proofpoint-GUID: yUBpaXowGnm-kkLXQBOg2Do2M8GJerbw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA2MiBTYWx0ZWRfX11HqY5hQN1Vw
 g7GwlH7/kmt6drqrk8szZI0RHGe+AY7yGNSJqvF3rJ3LAOOBbvaaq1nVoq6krb9SN2tAulMTKig
 ZOJ71HkyqhmywwLRECDovR/iage4hbE=
X-Proofpoint-ORIG-GUID: yUBpaXowGnm-kkLXQBOg2Do2M8GJerbw
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace50e3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JpPTAQJ_t0xbM4wxcasA:9 a=QEXdDO2ut3YA:10
 a=c1kjC2Rka8qAMGtkAJwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA2MiBTYWx0ZWRfX2lBTssvf0SVh
 prsa3KGruYuRuoXSs3bkrekjImWwnEemi0m0GxK6OXHQhT4qB6c+COJgJf6K3F/blB2EUBADnxf
 Bu9supHB8NWcFQuMyj3lFfkUjj+Ey0yIEyovkXhBPfkdPvcfk9AAFdJhr3g+ohOO5c2k0XxEQGz
 Y49STH12/Cb/LogO4Z0WINc5KVDraw7a6mh10oCaiAVwL+dSvsmwmfwQCBeQmR0M//lmBFdRVvl
 W0fl73ixE/rP+Cf1bA7+jVgtxRbESSB04cGyl6pr2g2kNVviJfeZyPZx3p7Afo21/Cxd533zEtH
 s+YwjBRmMeemhVkb/rr2+Fy6WUXz4NazjJicWfERUJkzH9RMflNP+5ao9LCxFszWM0y8ExfypkZ
 jPrXcXZxqy0IuG570JQ/IvXUY09KwkSfyDE26TuVUY0fkwB+N2G13RVPmqN7CQI+lq6YvCa2Tp8
 ZSdTSIDR5gSmoHbJF5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_084020_693971_8D85FE64 
X-CRM114-Status: GOOD (  51.68  )
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

--QzzmAfyjxSP9etro
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 13, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 (1) =C2=B7 Medium: 1 =C2=B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] The commit message describes a bug that the current driver
>   cannot reach.
>=20
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but on cores with
>   normal (non-enhanced) descriptors in ring mode, which is the default=E2=
=80=A6
>=20
> --
>=20
> net: stmmac: fix XDP TX DMA address for compound RX pages
>=20
> This commit changes stmmac_xdp_xmit_xdpf() to use virt_to_head_page()
> instead of virt_to_page() when it looks up the page_pool DMA address for
> the XDP_TX head buffer. The goal is that a data pointer sitting in a tail
> page of a compound RX page still resolves to the DMA base of the head pag=
e.
>=20
> > RX pages become compound as soon as dma_buf_sz needs more than one page
> > (pp_params.order =3D order_base_2(num_pages) > 0), which happens from an
> > MTU around 3000 bytes once dma_buf_sz reaches 4096. If an XDP program
> > moves the data forward with bpf_xdp_adjust_head() by more than about a
> > page, xdpf->data points into a tail page whose struct page has no DMA
> > address: page_pool_get_dma_addr() then returns a bogus bus address, and
> > dma_sync_single_for_device() together with the TX descriptor transmit
> > from the wrong location.
>=20
> [Severity: Medium]
>=20
> Can the driver reach this configuration today? stmmac_xdp_set_prog()
> refuses to attach a program when the MTU is above ETH_DATA_LEN:

Similar to patch 2/2, this is a preliminary fix needed to remove the MTU
limitation when the interface is running in XDP mode.

>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c:stmmac_xdp_set_prog() {
>     ...
> 	if (prog && dev->mtu > ETH_DATA_LEN) {
> 		/* For now, the driver doesn't support XDP functionality with
> 		 * jumbo frames so we return error.
> 		 */
> 		NL_SET_ERR_MSG_MOD(extack, "Jumbo frames not supported");
> 		return -EOPNOTSUPP;
> 	}
>     ...
> }
>=20
> stmmac_change_mtu() blocks the other order too:
>=20
> 	if (stmmac_xdp_is_enabled(priv) && new_mtu > ETH_DATA_LEN) {
> 		netdev_dbg(priv->dev, "Jumbo frames not supported for XDP\n");
> 		return -EINVAL;
> 	}
>=20
> When XDP is enabled the MTU is at most 1500, so stmmac_set_bfsize() retur=
ns
> DEFAULT_BUFSIZE (1536). Then in __alloc_dma_rx_desc_resources():
>=20
> 	dma_buf_sz_pad =3D stmmac_rx_offset(priv) + dma_conf->dma_buf_sz +
> 			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
> 	num_pages =3D DIV_ROUND_UP(dma_buf_sz_pad, PAGE_SIZE);
> 	...
> 	pp_params.order =3D order_base_2(num_pages);
>=20
> dma_buf_sz_pad stays below PAGE_SIZE, so num_pages is 1 and the order is =
0.
> stmmac_rx() also sets frame_sz to a single page.
>=20
> On an order-0 page, virt_to_page() and virt_to_head_page() return the same
> struct page. Does this change behaviour at runtime in any configuration t=
he
> driver currently allows?
>=20
> The threshold in the message also looks off. By the driver's own sizing,
> dma_buf_sz reaches 4096 once the MTU goes above roughly 2022, not 3000.
>=20
> The later patch in the series, "net: stmmac: disable TX checksum offload
> for jumbo frames on bugged cores", only adds a csum override. It does not
> lift the XDP/jumbo restriction, so the described trigger still can't happ=
en
> at the end of the series.
>=20
> The change is reasonable hardening, and it matches the existing
> virt_to_head_page(ctx.xdp.data) use in stmmac_rx(). Could the message
> describe it as hardening, or as a prerequisite for jumbo or multi-buffer
> XDP? Could the Fixes: tag also be reconsidered? As written, stable will
> treat this as a fix for a reachable DMA corruption bug.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index b8b4de4c5b1a7..ca61ab449e32b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5301,7 +5301,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_pri=
v *priv, int queue,
> >  			struct page *page;
> > =20
> >  			page =3D frag ? skb_frag_page(frag)
> > -				    : virt_to_page(xdpf->data);
> > +				    : virt_to_head_page(xdpf->data);
> >  			dma_addr =3D page_pool_get_dma_addr(page);
> >  			if (frag)
> >  				dma_addr +=3D skb_frag_off(frag);
>=20
> [Severity: High]
>=20
> This isn't a bug introduced by this patch, but it has the same symptom.
> On cores with normal (non-enhanced) descriptors in ring mode, the default
> when chain_mode is not set, can the XDP_TX path in stmmac_xdp_xmit_xdpf()
> make the DMA engine fetch part of the frame from an address that was never
> programmed?

I am working on this fix with a dedicated patch.

Regards,
Lorenzo

>=20
> stmmac_rx() builds the xdp_buff with a full-page frame_sz:
>=20
> 	bufsz =3D DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
> 	...
> 	xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);
>=20
> That means an XDP program can use bpf_xdp_adjust_tail() to grow the frame
> well past 2047 bytes and return XDP_TX, even with the MTU at 1500.
>=20
> Further down in stmmac_xdp_xmit_xdpf(), only TDES2 is programmed:
>=20
> 		stmmac_set_desc_addr(priv, desc, dma_addr);
> 		stmmac_prepare_tx_desc(priv, desc, !i, len, csum,
> 				       priv->descriptor_mode, !!i, last_frame,
> 				       xdp_get_frame_len(xdpf));
>=20
> With normal descriptors, the call chain
> stmmac_prepare_tx_desc()->ndesc_prepare_tx_desc()->norm_set_tx_desc_len_o=
n_ring()
> splits the length between buffer 1 and buffer 2:
>=20
> 	unsigned int buffer1_max_length =3D BUF_SIZE_2KiB - 1;
>=20
> 	if (unlikely(len > buffer1_max_length)) {
> 		p->des1 |=3D cpu_to_le32(FIELD_PREP(TDES1_BUFFER2_SIZE_MASK,
> 						  len - buffer1_max_length) |
> 				       FIELD_PREP(TDES1_BUFFER1_SIZE_MASK,
> 						  buffer1_max_length));
>=20
> In ring mode, TDES3 holds the buffer 2 address. That is why jumbo_frm() in
> ring_mode.c sets it explicitly:
>=20
> 	desc->des3 =3D cpu_to_le32(lower_32_bits(des2) + BUF_SIZE_4KiB);
>=20
> The XDP path never writes des3, and ndesc_release_tx_desc() only clears
> des0 and des1:
>=20
> 	memset(p, 0, offsetof(struct dma_desc, des2));
>=20
> So des3 still holds either 0 (from the coherent allocation, or after
> clean_desc3() runs on completion) or a stale buffer address. Would the MAC
> then read len - 2047 bytes from that address and transmit them?
>=20
> Without an IOMMU, this could send arbitrary memory out on the wire. With
> an IOMMU, the read would fault and TX DMA would be restarted.
>=20
> ndev->xdp_features is set unconditionally, so nothing blocks XDP on these
> cores. The behaviour goes back to be8b38a722e6, which added XDP_TX.
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1%40oss.qualcomm.com

--QzzmAfyjxSP9etro
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas5Q4AAKCRA6cBh0uS2t
rE9eAQDRnphJd2YEURo3Zv5ds7wVmuatyCa4F5XUEYd3yznfkgD+ILzKa5TclYSI
bYNDFU8b9ChVojcAYT5PwQ/F9AvPzg4=
=9D03
-----END PGP SIGNATURE-----

--QzzmAfyjxSP9etro--

