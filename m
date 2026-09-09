Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73D4C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMjWX5pavrydURXNQCtsJ9awujZ/D4pSSnWLXnJcWww=; b=IR89ACKsFLyJsJdqQB5vPZsCJ0
	vG9xl+QXPP/OgtS196S9i0cAaHh1idfM6YyJx89z+ThowPQFg/XhP4WZanb/S6xq/C9/Y+2sH61JY
	fZ5gLlgOjcWTgtiFUA9wlC2pLTMBY7rcd2P01m7HHP9hJmvqRp1dFUx+HX0XHiXF1yrRLysg6SKO0
	+Ze3AmDFMNaqxZNGU9H4rRpyuv2BkhSzyibNTyBYdlrB+SuZC5ptE2LUC6ShZTDICDXHsXklWn01L
	+2O+Nu2cih8+glcwI2B51vCmTkDS0QhjtAHQm0cWo9SfWapuzUaN0x9Z964CZyjbltQm50GkPSNEL
	WLsER3xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Doy-0000000B8zw-1Pti;
	Wed, 09 Sep 2026 08:38:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dov-0000000B8zA-2iC3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:38:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68966v5I482011
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 08:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bMjWX5pavrydURXNQCtsJ9aw
	ujZ/D4pSSnWLXnJcWww=; b=kE/H1Fre5Ym2u4tFBHcjMzg1TPGxgQSmzRaIxOss
	eAMp9vGZGyysjTpXreCpyP9Dc8eNsYHilu8R71UDcq6u3yAsfvHu8SCbdkSZB7DF
	vQ/XsaBqmjQGiYBV0Aw+Yj9Vq8hmXWnC5OM1bCHxvTtpIMH1tUJ4Gmcpjtym32U1
	yXWF6snUDaFdjncKzSkQoVjYV+hXxGE79JTjpjO2LhMHmyHpCJER9eWqTK6JtWw1
	EST6GizioqYJF0Gi6u/87/GPnmlLoHFZFHMU3nZx2hvDLNzkpVpjJjv/3xgmHuDQ
	Z+tvNtpSrGIIaekrhT3P3MEl4bZTnSAYI/7DE9rIUWRrHw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqf1k1d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:38:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so890632085a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788943095; x=1789547895; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bMjWX5pavrydURXNQCtsJ9awujZ/D4pSSnWLXnJcWww=;
        b=KdINP71D6E7zU+/YWbM0cuEexQSzhaLQ0iPzyF8p+7Ik4iuWdOS67bAghtEqqJaoMD
         gYMds45YrtmqazKv2wK98+sEg45w0rf2odoYAm217mB6IFji+9ubF2M/AiRwh2+NStNp
         vNxMbns5N+AgFsX1uAckViunxfjkiMM/54ktPg17jjcrGqmweLji+5pG56b9U0bVNC0f
         0V8kxobFMHiopFVwDZWvC53Zwzfk0Qm2doLR4rhoW7LkjMd47cRCpJlMz2KDzFtr5WzV
         fXA8QvEoExiIqpctMuNVfvR1yP9Fi5U3nYD5By2DHOBwHl+QXVxDLQ3HHacuP6h0+6MR
         heQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788943095; x=1789547895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMjWX5pavrydURXNQCtsJ9awujZ/D4pSSnWLXnJcWww=;
        b=h9HQ7Cfduta3kbw59RP7vzZuKUlZQ2R0uvjbj96cQbsSv5fDsJQdLc8bM8q2rh/B1i
         vHBJX0zU5jAm5URFCJ1zkHMmElvwX6rXLS0QpZhCSl7+J7wxzA1ln0tzsaFP+q1HDCVo
         XozMNvSUqZ+J6vPU/S4TXDalCFK0OYSPBfI57V/UVFACaR4b5WgWKK5gdxerYXOHVb1W
         49/U9ua7x6AM4fKicZouQIiKiudPGXoiJrCjqfrv4OMAoDEHoaZnbdgPRTCmcOTCsvAp
         cy7YB32xfU9bif8akJlXz5/vmwm3F5lYvQLYyKmtaHL/rlRNQShs6EPWpKVyAQ4HTqew
         qWEg==
X-Forwarded-Encrypted: i=1; AKwUvBzPiYejF2DtJewogBA00CWttG7BZGJwCRa0CayU80zaVXNS76iDgPCBcoPcFJYbasY5yvBRgY61gutQ+U73HRAM@lists.infradead.org
X-Gm-Message-State: AFuF++kNy2z2PysrjNu+2iTqbYvCDOonFDPI01LMJ4gyeCKA+RvKyoyO
	Wola9aG9pXYV4kMjRq+BS4rT8+wd6BJAl+tyDM6JuYMLHS+yMsDITff/EFk0Imp1goPSAqrnDeZ
	pQjGyYgPNBsIOv1X0WtQsd4/xsmhodIFivzIprVV5zYMoBOgfGt30oiwHQb+XNT3rDjNXh+mkrV
	AaRQ==
X-Gm-Gg: AYBFou2L0rdeaCiWMdWox938J9l3SvjXtaARTujvlterE42TIXUBVl4XVMbqOWUXn10
	0xKPlUHgbGMjcMmucEMNaqhBdrCN/NjV6qZYDr7blWXJt8dq8jez9ola1dk/IE0c1GSdL/+pKec
	bYEs++XA/c3epfMSwmLaqwqcweSU0Ev8TVpf4Aou9GlRNdBGIZq0gWVwzLePvZttlO865Sc5Q/W
	edezSr8qsN2gAW9ZN0UaYGaSw78iu43kAoIiKro5MNpZZVvSdu5QodS8k1EQxgdln/2icslinNm
	afvnt59n8m0XqQqvJ4EqorlHld3OVibUgyknLZsYwDoCarYtT5guM5vbOHjrtCNFHkf2M28A5PL
	mGfun7DBhehDDgw==
X-Received: by 2002:a05:620a:bc5:b0:939:6de4:3e04 with SMTP id af79cd13be357-93980400918mr4146019585a.29.1788943094653;
        Wed, 09 Sep 2026 01:38:14 -0700 (PDT)
X-Received: by 2002:a05:620a:bc5:b0:939:6de4:3e04 with SMTP id af79cd13be357-93980400918mr4146014585a.29.1788943094102;
        Wed, 09 Sep 2026 01:38:14 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bcefd59sm36312242f8f.19.2026.09.09.01.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:38:12 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:38:12 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        richardcochran@gmail.com, Jose.Abreu@synopsys.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: initialize ptp_lock at probe time
Message-ID: <aqEa83wUlsn8XvO9@lore-desk>
References: <20260904-stmmac-fix-ptp-clock-init-v1-1-df70eb1eb04d@oss.qualcomm.com>
 <178890689580.219967.13444061926951235815@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Nhkga0lfi66/HXt"
Content-Disposition: inline
In-Reply-To: <178890689580.219967.13444061926951235815@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NSBTYWx0ZWRfX5gh27qGu4374
 gUgvmua62dOPo2Hx5PjS8ZdG3p8NI1naXbmvg5KLSHzOev47SkP/oxoPrEWF2az0EXSezs3by7g
 KkygUa74QcSO2Tuw8Bu+KwtaPpDX6ddbH0TYz9KzzBj6A/OIxuMZPPYznq1AXnn0iTwSEX2EFb2
 LFwWapZPuYCoIwjRTTrcR4yBCjpq39R8XE5Wnwdu5Xg9oIvAlKDnMZOCBREiSD01KxLVwK+9Ntw
 /E8TdFol8m4G8YLQBJJjb67OGxVijHBI7nREIsHWB7oeJMHiDDUh2Sgs3d0P2PMS0hpcGhjL8wl
 qJpfCNdPDKhEvu7IQhI97rz3ZpkxGd2vqjac19UPBONOz7eBBs6HX+1vUiRjVqlz2+aRkuxSIuI
 M7GdhNg9H8gq+y4C0dbmQXbZSwk1Bq7OdQsMkrSnCAvJcjKNuCY6nB6C0TYbNKai8n3JMKIwepS
 61rIW0pEUffWTvm2Ktw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NSBTYWx0ZWRfX/Z6QmN4xmH6z
 RJUWImW18zWpXfeTIb1veUrlCbpogfuzaH7mVKp2cgFJ4zfSpHPooMK4b5FPnca9at9ylIgj/0a
 eZrcGDdSGciMSUZWnaQcwre+j60t5gI=
X-Proofpoint-GUID: SyUemxJ2fiS7nyIIFAszMjo_o9dgxmut
X-Authority-Analysis: v=2.4 cv=JY2Ma0KV c=1 sm=1 tr=0 ts=6aa11af7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9R54UkLUAAAA:8 a=EeFZAZPpTBPm1tKgb9AA:9 a=QEXdDO2ut3YA:10
 a=FM_-4msm2eu4xFHii-gA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: SyUemxJ2fiS7nyIIFAszMjo_o9dgxmut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_013817_881406_9F86CC0E 
X-CRM114-Status: GOOD (  45.90  )
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

--9Nhkga0lfi66/HXt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 08, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>=20
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (2) =C2=B7 Low: 0
>=20
> - [High] Incomplete fix: the TAPRIO offload path that this commit
>   legitimizes for a never-opened interface still performs MMIO on a=E2=80=
=A6
>=20
> Pre-existing issues:
> - [Medium] EST state (priv->est->enable, priv->est->gcl[]) is accessed
>   with inconsistent locking between the taprio offload path and the PTP=
=E2=80=A6
> - [Medium] An EST/taprio schedule programmed while the interface is down
>   is silently discarded by the MAC/DMA software reset performed at open,=
=E2=80=A6
>=20
> --
>=20
> net: stmmac: initialize ptp_lock at probe time
>=20
> This moves rwlock_init(&priv->ptp_lock) from stmmac_ptp_register() to
> __stmmac_dvr_probe() so that the lock is initialized even when the
> interface has never been opened, which is the case when tc_taprio_configu=
re()
> calls the PTP gettime64() callback to compute the EST base time.
>=20
> No Link: tags present in the commit header.
>=20
> A few questions about the paths this touches.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 24656b35350b1..5fe7e95fdd345 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -8025,6 +8025,7 @@ static int __stmmac_dvr_probe(struct device *devi=
ce,
> >  	stmmac_napi_add(ndev);
> > =20
> >  	mutex_init(&priv->lock);
> > +	rwlock_init(&priv->ptp_lock);
>=20
> [Severity: High]
> The commit message describes the down-interface gettime64() call as a
> legitimate use ("the lock is also used while the interface is down and has
> never been opened").  Is that call safe once the lock is initialized?
>=20
> __stmmac_dvr_probe() ends with pm_runtime_put(), and
> stmmac_runtime_suspend() in stmmac_platform.c gates the CSR clocks:
>=20
> 	stmmac_bus_clks_config(priv, false);
> 	  clk_disable_unprepare(priv->plat->stmmac_clk);
> 	  clk_disable_unprepare(priv->plat->pclk);
>=20
> So a probed-but-never-opened device is runtime suspended.  The taprio
> offload path does not take a runtime-PM reference and does not check
> netif_running():
>=20
>   stmmac_setup_tc()  case TC_SETUP_QDISC_TAPRIO
>     tc_setup_taprio()
>       tc_taprio_configure()
>         priv->ptp_clock_ops.gettime64()  ->  stmmac_get_time()
>                                                stmmac_get_systime(priv->p=
tpaddr)
>         stmmac_est_configure()           ->  writes/polls priv->estaddr
>=20
> Every other register-touching ndo in this driver wraps the access in
> pm_runtime_resume_and_get(), for example stmmac_set_mac_address(),
> stmmac_vlan_rx_add_vid(), stmmac_vlan_rx_kill_vid() and __stmmac_open().
> Can the MMIO in stmmac_get_systime() and est_configure() read/write a
> clock-gated MAC/PTP block here, and on SoCs that actually gate pclk, can
> that abort or stall?

The goal of this patch is just fixing the undefined behaviour due to the
uninitialized rwlock. Moreover, the reported issue is fixed in the following
patch (not merged yet):
https://lore.kernel.org/netdev/20260827-stmmac-setup-tc-enable-pm-v2-1-a9b8=
a5948f41@oss.qualcomm.com/

>=20
> There is a second aspect to the same call.  The PTP counter is only
> programmed from the open path:
>=20
>   __stmmac_open()
>     stmmac_setup_ptp()
>       stmmac_init_timestamping()
>         stmmac_init_tstamp_counter()   /* TCR enable, SSINC, init systime=
 */
>=20
> If the interface was never opened, does gettime64() return a usable time
> base, and does stmmac_calc_tas_basetime() then program priv->est->btr[]
> from a meaningless value?
>=20
> Would it make sense to gate TC_SETUP_QDISC_TAPRIO on netif_running() (or
> on the PTP counter being started), and/or take a runtime-PM reference in
> stmmac_setup_tc(), in addition to moving the rwlock_init()?  Reproducer
> is "tc qdisc replace dev ethX root taprio ... flags 0x2" on an interface
> that has never been brought up; taprio_enable_offload() in
> net/sched/sch_taprio.c has no netif_running() gate.
>=20
> [Severity: Medium]
> This is a pre-existing issue and not introduced by this patch, but since
> the change makes the down-interface configuration sequence easier to
> reach it seems worth mentioning.  Is an EST schedule programmed while the
> interface is down preserved across open?

This issue is not introduced by this patch and it is already fixed in the
following series (not merged yet):
https://lore.kernel.org/netdev/20260902-stmmac-est-reapply-after-open-v3-0-=
e72a6df5a7ef@oss.qualcomm.com/

>=20
> tc_taprio_configure() commits priv->est->enable, btr[]/ctr[] and
> max_sdu[] and pushes them to hardware via stmmac_est_configure().  Then
> open does:
>=20
>   __stmmac_open()
>     stmmac_hw_setup()
>       /* DMA initialization and SW reset */
>       stmmac_init_dma_engine(priv);
>=20
> which asserts DMA SWR and resets the MAC/MTL registers, including
> MTL_EST_CONTROL, the GCL RAM and BTR/CTR.  stmmac_est_configure() has no
> call site in stmmac_main.c (only tc_taprio_configure() and the disable
> label in stmmac_tc.c, plus stmmac_adjust_time() in stmmac_ptp.c), and
> taprio_dev_notifier() in net/sched/sch_taprio.c only recomputes
> picos_per_byte/max_sdu on NETDEV_UP rather than re-issuing the offload.
>=20
> Does that leave priv->est->enable true with EST disabled in hardware,
> while stmmac_xmit(), stmmac_xdp_xmit_back() and the XSK path keep
> enforcing priv->est->max_sdu[] and the taprio dump reports an active
> offloaded schedule?
>=20
> > =20
> >  	stmmac_fpe_init(priv);
> > =20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers=
/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > index 960249960004c..3bfcc9760dce7 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> > @@ -365,7 +365,6 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
> >  	if (priv->plat->crosststamp)
> >  		priv->ptp_clock_ops.getcrosststamp =3D stmmac_getcrosststamp;
> > =20
> > -	rwlock_init(&priv->ptp_lock);
>=20
> [Severity: Medium]
> This is a pre-existing issue and not introduced by this patch, but while
> looking at the locking in this file: is the est_lock coverage of
> priv->est consistent between the taprio path and the adjtime path?

This issue is not introduced by this patch and it is already fixed in the
following series (not merged yet):
https://lore.kernel.org/netdev/20260902-stmmac-est-reapply-after-open-v3-0-=
e72a6df5a7ef@oss.qualcomm.com/

Regards,
Lorenzo

>=20
> In stmmac_adjust_time() the decision is taken with no lock held:
>=20
> 	/* If EST is enabled, disabled it before adjust ptp time. */
> 	if (priv->est && priv->est->enable) {
>=20
> and it is acted upon later, after est_lock has been taken again, where
> priv->est->enable is set back to true and stmmac_est_configure() is
> called.
>=20
> Meanwhile tc_taprio_configure() publishes the new size and enable flag
> under the lock:
>=20
> 	mutex_lock(&priv->est_lock);
> 	priv->est->gcl_size =3D size;
> 	priv->est->enable =3D qopt->cmd =3D=3D TAPRIO_CMD_REPLACE;
> 	mutex_unlock(&priv->est_lock);
>=20
> but fills the entries with the lock dropped:
>=20
> 		priv->est->gcl[i] =3D delta_ns | (gates << wid);
>=20
> tc_taprio_configure() runs under rtnl from ndo_setup_tc while
> stmmac_adjust_time() runs from PTP_CLOCK_ADJTIME on /dev/ptpX without
> rtnl, so the two can run concurrently.
>=20
> Can an adjtime landing in that window make stmmac_est_configure()
> program the hardware gate list from a partially written gcl[] with the
> new gcl_size already visible?
>=20
> And can a "tc qdisc del" that clears enable and takes the disable: path
> be undone by a concurrent adjtime that re-enables EST from its stale
> unlocked observation?
>=20
> >  	mutex_init(&priv->aux_ts_lock);
> > =20
> >  	priv->ptp_clock =3D ptp_clock_register(&priv->ptp_clock_ops,
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260904-stmmac-fix-ptp-clock-init-v1-1-df70eb1eb04d%40oss.qualcomm.com

--9Nhkga0lfi66/HXt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqEa9AAKCRA6cBh0uS2t
rDqwAQDQMTlh0BeXlsV2l5nbvkLul3MQW0q4Z0f/itQmzcAB8AEAhGxUkFWINm6y
QbZs7pwaBlqNBLk7VBbgQiXK/wGd8AQ=
=tgYq
-----END PGP SIGNATURE-----

--9Nhkga0lfi66/HXt--

