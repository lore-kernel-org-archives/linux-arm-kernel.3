Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DBDC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rAJn8InQv+5Y+4q6ntzM1FDWItX8dqMOLTxUt0EDKqw=; b=hWHZDZTd5vGr/RXtvIrDWRf0OX
	ExR3ocATs/iPibj4CysEc5wlH5PU8baEtlYakTqglyS88MUzqVQFV2LHgJYRGcxPaB0Z10JdbpWRu
	qlI3ZYWspY9FIV/HYSdy1MRdkN1IINaPMtVxI/oryQfOWaO6ZwG4Q/q4zewj7nIN4r09G3qlpfpmX
	l7Tq97+Le7BIAA5+adf7YsrZs5mv6C7vQ3ohbmSDTO0g2XjXkbCg0PsYAALiBK3wVtZ/Zwzy84WnT
	9DNHazDfHNIcTo3bm4XdzE6Z3DjBPxBKUh+0fxkVCMDju0yQwU3JpZPcuYvJ3dnxsyZ24hov+JRzh
	0++7Zikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sox-00000008jp5-35HC;
	Tue, 08 Sep 2026 10:12:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sow-00000008joT-0xWM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 10:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rAJn8InQv+5Y+4q6ntzM1FDWItX8dqMOLTxUt0EDKqw=; b=iF8tOVR8Jf1GSFEkYMYkoVYdPU
	rOVyf6Xr72jBUUzr80sUCsH6ZHciAsmEzVvxmuT+sBvBb+juxQ4NguQQnowZ9pPBOu59riccJp30+
	2g6Pj6FgmdZoJtkKbKLvdChg/x2T4iVmDRM/OtsQLLWaItR09QxrBG5+CMvIWb/MhUn2/KvSY3Hk3
	3J3N701SvLPiE6skGOTWzcxBPEjHSYg4gf0SfJD/kBRgnqdCWH1lVmsDES4hk1NZgN5Blp97cvCzI
	UlcR8r4uJ7UUt/TF7QoVfg26ZoYOPTHDcgy8pPJdzJTTBd0ncELhR9iY8yxIW7kiJ3MbQKODnhQF2
	ZRi63I+g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3sos-0000000HG7G-3RlB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 10:12:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M9M91521630
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 10:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rAJn8InQv+5Y+4q6ntzM1FDW
	ItX8dqMOLTxUt0EDKqw=; b=os7W4rRuc0UTmDLEQkvgtwJKDXfKLwDDXB2hUCI6
	fqA3XAUlE+qBNWSwfq6gFTXFAJZbfCfIHLGhaCAoxglQPjacn/ZhOq7uiA4vD19A
	csTW3CroTsKpk4/RrkwrMpPcwo/biHn2LtB58i9XGsQeToAxZ2PBAansYdMzQ2rN
	AUFdk/gEJnCMjjenff0wR8KY2cI2sTKEJd4jWru3jutvBWgWp6ZiEgEQyn4Eb6KW
	e+HaquCEPGBWnE6SsGI1kvESvblXbdGH2Xs9h5j7fPvcNi4q18nKXv3adj93g8T4
	tc6+xuPIuUy0WFnoPElSv1S5NNnCHu6ZcbmxkzauEW+ymg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077k7tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:12:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so811976685a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 03:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788862366; x=1789467166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rAJn8InQv+5Y+4q6ntzM1FDWItX8dqMOLTxUt0EDKqw=;
        b=eaSr2s3B8lOEG2rjnpDWgmzAQRnKGVkY1FdwKF9vfcRtW4n342oyoHdxkz/Lm34WDA
         ODG9ltz8ymQBYpQtV2vT7ytmnZUFGKUiDQ8+EcQ5mp72MBqspFaJbfNAHF3oHZ7h64tl
         IdJWf/nKPx4XZn+sOqTnnAEdqczDfwAsZClG+4DBawbgwMNmxsdOPpi5A1kadxuDftna
         FWBRQ8G7qm2JP5dUxisCNrysnrBWaNbSaKEYp7GGfS4USJ7Hkekml4P7XhNtewCeAt6W
         PTG3PqdF2EHTC3o8IpNSKLXFC+ZJQ9Rq6oO99LLbs7hWbUHmr41Ma6xb5KVIfjEmf/WL
         tAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788862366; x=1789467166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAJn8InQv+5Y+4q6ntzM1FDWItX8dqMOLTxUt0EDKqw=;
        b=NUFbriusfhtmnW48KVV/ZIpsLbecVu/PHHavl7XEwNM+MgK4CjUL9RR7iJsxqT3pxU
         8G8StQI9+DyoEVY/3ViIq61oettvFLXLp+nJbQecKZ10ERFgi0sRehEOtoyoA+ZGyw58
         frH/aHteuWVLBdAV0fNs+go6NP9jjNpMKNGtAn6Vs/XS3oApAdZfGhPFjTNXqAszf0xS
         0I9NavIRb0iolS0WLVZwZV8ET7DppB0l058Gl+ds3v3lJ0u9yY9kWrtWOpsD+6Nh/A9/
         10PyxHQuvM1RlfIt2ncSlUfuWzWfd8CkLvJUBd9N+YaKZa3Cyyfi1skGoq1gnhsM7GRX
         mYmw==
X-Forwarded-Encrypted: i=1; AKwUvBw0nrxnjJddBdwL8Bq7V5B8kW4ovq99UB4zleYCQeqTv59PAjYNRE5uEfRBMoKlZBrOB6ZLDOQTEjHeereh9yBB@lists.infradead.org
X-Gm-Message-State: AFuF++m1S9D7R8hRpWYz0TozfL/g3OgfIQ5A4FypodfyChYdlKzgRF6C
	1Stt1D9dCbx/c2FRf7G3zGjfoSD8WfqGxKBVn0jA8W/+mjph7R41H/be7Uvp0etMoPoTDWe+Ko2
	lgUEXGpbjobVC0NO+ZJVLKUTw6mryTDtknp7Cwq+upThICL6Ypi8LqFYEaSe91mtglnNmU6gGRJ
	2hJw==
X-Gm-Gg: AYBFou0GjvZwoDYsOMxUikY56emBI377m4+qe9XhFalhGYSzfc1gPra1N3SX+S3QyjE
	c+Autf300IWAIbY0TaG6cwMkfuRWJBfkdxZKtTICIcC/lO18TpKvl3/0Rul+q2ZGCVfYt3wJR/f
	bVbtFl79yinZ65cc6xg7HsXx589XgM7F3LQKuorClsEyv9FzhynBMHok6nPLy8peeqpckJ/Bgzk
	4dEmqHqQFQCzZiabPiqgGc7vUQuaeoNFACFo0ZzFzPs8wIwNWaxgEvZmXSAQX+W99cI7GtBts2g
	QDEan/NaHFGRZdbK8gxGn2/uXcKAV3I/LGyvcbjmZiNZ/e8jdCw8yMR3N9e7WrpZ81Lz8zYOSCf
	Xf6/e/1sHz8dV1g==
X-Received: by 2002:a05:620a:370e:b0:939:5f4d:67b0 with SMTP id af79cd13be357-939803292a1mr3004429385a.8.1788862366039;
        Tue, 08 Sep 2026 03:12:46 -0700 (PDT)
X-Received: by 2002:a05:620a:370e:b0:939:5f4d:67b0 with SMTP id af79cd13be357-939803292a1mr3004422485a.8.1788862365511;
        Tue, 08 Sep 2026 03:12:45 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c28e9eb4d38sm291683966b.41.2026.09.08.03.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:12:44 -0700 (PDT)
Date: Tue, 8 Sep 2026 12:12:43 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        0x1207@gmail.com, olteanv@gmail.com, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: preserve real_num_tx_queues on mqprio
 setup failure
Message-ID: <ap_fm9S7zSAbGSKq@lore-desk>
References: <178885859069.219967.17905742130775758644@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zha47Yv+EyU8m3To"
Content-Disposition: inline
In-Reply-To: <178885859069.219967.17905742130775758644@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEwNyBTYWx0ZWRfX7BqmiZ+lIsYP
 W5ErIE4rimI14xcCf5xz4+4qbzg6Glo15dxxRbKUc/VVHfL9nVAEmqM5Yoiy40ei62bfa/utmTn
 26jQXweKBaLbh1CyL25hFQhBD+rQtNSpLfzAD1g+qsAwQKwxM5XoNToDQg6C6aFw4T5oLDiWCZQ
 +bsGTAIXCL/NXgDzWlXrWhVnl5gLl9SByWpzZS4K7AdfUu0l34thqpNzDTX6YUOBCrn4faDks4z
 yFMagEkpl9LvKnd+wWMWBtS9npQxYopnIn/SHMTmxQQUJf9Yj13ZMyyNSRMrx7xm/BQSGNr3VUU
 3gy/OgpAYVH2EjMg2IKIp/8Ep7J5bC6S+xXnPTTcQJyMzlo8pm2o28VC/c5uIz9AsaHqOiNeBqe
 toccieB5ry9NJNJsIBBnKKSttQONPN2ljyauyTtMF838HekyWUnwD/SS1qW42wIox2oP0pnW3N7
 4NIjnqyhy1XjXZJZ4QA==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9fdf9e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=Xy7cffxmSr3xhYrA3wsA:9 a=QEXdDO2ut3YA:10
 a=A9K5AMd-i6aA7Fx2OoQA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: 2Cp5wNZHK4dfv-jptvYuEvW0mL7c1TCL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEwNyBTYWx0ZWRfX7g0fFHLzlMFB
 Y7YPQTv7y46q6UXxaTcCqeI/DEoMtedEqbjpuUrD2BveG8bPrdbJuGvAmFDryMZ/B/nYAu05g+L
 TMIL4b/7GSiExBZ683MIlk49uwxvGDk=
X-Proofpoint-GUID: 2Cp5wNZHK4dfv-jptvYuEvW0mL7c1TCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_111251_190844_17739BC5 
X-CRM114-Status: GOOD (  37.36  )
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

--zha47Yv+EyU8m3To
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>=20
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 0
>=20
> - [High] The patch silently changes the semantics of the shared dispatch
>   macro stmmac_fpe_map_preemption_class() in hwif.h from=E2=80=A6
> - [Medium] The TC state that the new error path saves and restores
>   (num_tc via stmmac_set_ndev_tcs(), plus prio_tc_map) is immediately=E2=
=80=A6
>=20
> --
>=20
> net: stmmac: preserve real_num_tx_queues on mqprio setup failure
>=20
> This reworks tc_setup_dwmac510_mqprio() so that the previous num_tc,
> tc_to_txq and prio_tc_map values are saved and restored on failure instead
> of calling stmmac_reset_tc_mqprio(), and adds a stmmac_set_ndev_tcs()
> helper.  It also switches the stmmac_fpe_map_preemption_class() dispatch
> macro from stmmac_do_void_callback() to stmmac_do_callback().
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/e=
thernet/stmicro/stmmac/hwif.h
> > index 04dafec021b4..9314bcb85c22 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > @@ -494,7 +494,7 @@ struct stmmac_ops {
> >  #define stmmac_set_arp_offload(__priv, __args...) \
> >  	stmmac_do_void_callback(__priv, mac, set_arp_offload, __args)
> >  #define stmmac_fpe_map_preemption_class(__priv, __args...) \
> > -	stmmac_do_void_callback(__priv, mac, fpe_map_preemption_class, __args)
> > +	stmmac_do_callback(__priv, mac, fpe_map_preemption_class, __args)
>=20
> [Severity: High]
> Should this macro conversion be called out in the commit message, and
> possibly split into its own patch?  It changes the semantics of a shared
> dispatch macro for all of its users, not only for the mqprio path.

I do not think so since this patch adds the only place where the
stmmac_fpe_map_preemption_class() return value is honored, all the other
stmmac_fpe_map_preemption_class() calls discard the error value.


[...]

>=20
> Second, the same macro is used by tc_taprio_configure():
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:tc_taprio_configure() {
> 	...
> 	ret =3D stmmac_fpe_map_preemption_class(priv, priv->dev, extack,
> 					      qopt->mqprio.preemptible_tcs);
> 	if (ret)
> 		goto disable;
> 	...
> }
>=20
> That "if (ret)" was dead code and becomes live here.  In
> dwmac5_fpe_map_preemption_class():
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c {
> 	...
> 		if (priv->plat->tx_sched_algorithm =3D=3D MTL_TX_ALGORITHM_SP) {
> 			NL_SET_ERR_MSG_MOD(extack, ALG_ERR_MSG);
> 			return -EINVAL;
> 		}
> 	...
> }
>=20
> tx_sched_algorithm defaults to MTL_TX_ALGORITHM_SP for DT platforms in
> stmmac_platform.c, and the default per-queue weights differ (0x10 + queue=
),
> so a taprio or mqprio configuration with a preemptible TC owning more than
> one TXQ now gets -EINVAL where it previously returned success with the
> preemption-class register left unprogrammed.

I think it is better to return an error if the hw is not programmed properly
since otherwise the NIC is silently not working fine. The user can check and
understand what is the wrong configuration.

>=20
> For taprio, the new error also takes the disable label, which clears
> priv->est->enable and reprograms EST, so the schedule that was just
> installed is torn down.  Is that intended for configurations that used to=
 be
> accepted, for example:
>=20
>   tc qdisc replace dev eth0 root taprio ... queues 2@0 2@2 ... fp E P
>=20
> Also, the two remaining users that still ignore the now meaningful return
> value, the taprio disable path and stmmac_reset_tc_mqprio(), were not
> updated.  Should they be?
>=20

[...]

>=20
> [Severity: Medium]
> Can this restore of num_tc, tc_to_txq and prio_tc_map ever be observed?
>=20
> tc_setup_dwmac510_mqprio() with num_tc !=3D 0 is only reached from
> mqprio_enable_offload() inside mqprio_init(), and the error is returned
> before hw_offload is recorded:
>=20
> net/sched/sch_mqprio.c:mqprio_enable_offload() {
> 	err =3D dev->netdev_ops->ndo_setup_tc(dev, TC_SETUP_QDISC_MQPRIO,
> 					    &mqprio);
> 	if (err)
> 		return err;
>=20
> 	priv->hw_offload =3D mqprio.qopt.hw;
> }
>=20
> qdisc_create() then always runs ops->destroy() on init failure:
>=20
> net/sched/sch_api.c:qdisc_create() {
> 	if (ops->init) {
> 		err =3D ops->init(sch, tca[TCA_OPTIONS], extack);
> 		if (err !=3D 0)
> 			goto err_out4;
> 	}
> ...
> err_out4:
> 	if (ops->destroy)
> 		ops->destroy(sch);
> }
>=20
> and with hw_offload still 0 the else branch is taken:
>=20
> net/sched/sch_mqprio.c:mqprio_destroy() {
> 	if (priv->hw_offload && dev->netdev_ops->ndo_setup_tc)
> 		mqprio_disable_offload(sch);
> 	else
> 		netdev_set_num_tc(dev, 0);
> }
>=20
> So dev->num_tc goes back to 0 immediately after the driver restored it, a=
nd
> skb_tx_hash() ignores tc_to_txq and prio_tc_map when num_tc is 0.  On a
> failing "tc qdisc replace" over an already offloaded mqprio, does the sti=
ll
> grafted old qdisc lose its priority classification anyway?

I think in a error condition, the driver is supposed to restore the previous
overwritten values, then it is up to qdisc layer to manage the error condit=
ion.

Regards,
Lorenzo

>=20
> If so, should the commit message text
>=20
>   "the TC-to-queue and priority-to-TC mappings are restored to the
>    previously saved values"
>=20
> be adjusted, since only the real_num_tx_queues part of the rollback appea=
rs
> to survive?
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260903-stmmac-tc_setup_dwmac510_mqprio-error-path-v1-1-eb171bdd340a%4=
0oss.qualcomm.com

--zha47Yv+EyU8m3To
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCap/fmwAKCRA6cBh0uS2t
rO1zAQDPOlQwk5kO3Lgc1cD7iaODG7Yivww9VgHBRP/kmUlbIQEA/nudYGh8e2Y2
LxT9Gq66y34ttjegg0hkFYRpemfIiQQ=
=TiM/
-----END PGP SIGNATURE-----

--zha47Yv+EyU8m3To--

