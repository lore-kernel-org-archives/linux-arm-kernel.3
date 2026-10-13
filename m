Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1A5CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StYE4hJraQDU2YIRE83lf6jHixx8TulQpMYbG0l+io8=; b=TOiYJLgmnq7wgpwTWTZCd8zXdx
	+fFpa0uyCED02/bJgZojI//6p86ZeB6CTYfGqGz/Ivj9SRk09/RvotT0bX0t0g1rG7NWvirbOnU8g
	VD4mH31dWl5JUJCNUVXcnKQqwU9t0kIMIKPaY6TPpk2yaEH+5+3O7eRjGykLv/qbLttw/nhP44KQR
	8h2vNgy+fp6bNfqBAqqFkopZi7wFLLxI2ZtgYjhcYw4rWitu5p8zIebJIkrd8yRSaNylE1cC97+W7
	z8ZpHQROqY/EZFTUWCZvpfYqZba3A3SmDSTvoX1bG0a6hvnigblO9UxkBW+9ZFxgwhpW/r6ageYVE
	duVWQfdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZdY-0000000CXpN-0Hoy;
	Tue, 13 Oct 2026 10:21:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZdR-0000000CXnm-2WWh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:21:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9ZLAP3476315
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=StYE4hJraQDU2YIRE83lf6jH
	ixx8TulQpMYbG0l+io8=; b=pV2t7TWbzuNN5VlkPLxmPzTGGfp7YWOvMoYWM6oU
	E41nuwQe9OrCcoAZdoRqKqtlg49yW+yvUvRTlAdEMqCnJ9wtbpd+kgpLt9Whdfue
	pfAI26pebQBfMUI03n3W9G4nYtkT0Fln4GMkLf+Q4PU7MpTec7FNajVbOPnVw9JO
	VXaYaR6DsHhU4NjtTGHhltiJyPAxZlqyrch2skR6aqSD9O6bnvW7FXd0bgQv4x2Z
	jR9pngW0cTZISiWSowzdQwbiofiVFwFVnFaH9MyLfIDdgbOgwpzfi13PmOy777th
	C+8KSlJyjbwY5ZIaL7YSt59VoEWU0Dt6/JTnckZfSVCi8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9gq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:21:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so614543485a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886888; x=1792491688; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=StYE4hJraQDU2YIRE83lf6jHixx8TulQpMYbG0l+io8=;
        b=K/f+HudkE3Fk+RJNVHMUu0sC0tqcB7zNdHyCK9R/b3Zp4sOkD+hMzaVBRu7w6QSAVC
         aUfzyBbJEvzDoVM72jfb3KH0IIyp3/uJT7vHOMMbBRP/wX6hGfPNYKGPIPixIBiyHJCb
         L6LEhb3JGB8Enru7IiedMwHBByL8AtivQEQe0W+05n4Hg3PsTsdj0mYiesE3s4CPDrF8
         1yKT91WEYi/xp30ZWDjzkHHBxRts6AQFUk3AWiquIscGOn62jymFzj5l5NLWBL/bFFH/
         J1d4lDFsDkDlqfmVUz9dKXlQKEbarX0B1z7SBPXcoBXf2kDr+llpAZIhmQNaKd4LSP1i
         FeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886888; x=1792491688;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StYE4hJraQDU2YIRE83lf6jHixx8TulQpMYbG0l+io8=;
        b=MyJ0uLv0etSna/dpt4YE9QUCMCQoRcGzHgLychoaEU7cNetwotgJXtP5ePsPFwaRtV
         8vPBDQGN5xfmB9MTcplGdfLDWpN/tbpszwE6pZZK6ERxFK1pF/zf/B7VkvVBneTfU2EE
         oilD+3P6mfhv6+s90cNoXp0TpLVC7neXIoeDpxjWrq36DGJu2vwnwEQYiHBfyEDNbIRT
         O8AVtZk2pivTxZfILf/d2QueA4UNlV/vG0J4zUuFZ9ssjJoJyHxytVWwXUTu9ncShY6/
         D//EzP5R61Xsvy5P/WIgloMoyBGum5mZBPoDyQ9G3xWfloasWGASb+wHTbHfsafS/Pik
         4cDQ==
X-Forwarded-Encrypted: i=1; AKwUvBykN6kjqUqM94FiBi00itJkwe+cLgG4Bz2WXIOa1oOu0FGyc8Jkf31B37fFqNnurlnucBnjibtGoR2Oa1v+FV8a@lists.infradead.org
X-Gm-Message-State: AFq9FYIS02gQeiiegcQe2e5NcAw8SI/K7BYU/mn5icxvlukwfSrrdo63
	A4WKXO13X75ySf+QMRxekuvx8cHRw+6zm1wGmYpOB575hsTW47HltoVJhLGQ8Xj3o4Q3eXvOK+q
	8qlYm9Ow4yJTAKSFUZtCPtDs5JqU8kjp128UPf69nbsqP+nXzlylVjglFlt4C9GnEqS03CXQA11
	8fNg==
X-Gm-Gg: AYBFou3hQbSxez2oHVCfK7hUFhRKQjqo+/Dqlv3g0SczV3WJq0UxBoONghf1AlGRAqu
	XYH5uOAcIYU1mxsaUCxfqqETpFhzmGYHVO6GQWiP7lkqn/uHDlVtDMJFKxxMCXx2I0Sg7YUkE0y
	1Z3gQlQceShVQWytnEiSXsODXFDA92QvX5ACsp00CRp4TcWrHzeUNoey8yGKE+ZZBLrQgsgSipk
	Xq1C9LvPpi8TDDEHwWErvHJSg2xRzoILjN9z5anDlU5ffjueHCpLtgAy/yOB/Os4GxCU8Tv8lff
	VCOfwR3eEyegxE8PbMRsNG0ViAaQb6o01RFiHkMJP+WtynL3D4n4x+D+u9RuGcU+CgoUnQ1UTfT
	HqIJotzNDc9gtKg==
X-Received: by 2002:a05:620a:19a8:b0:93e:74e5:2b1a with SMTP id af79cd13be357-93ebd0e4407mr1905669685a.10.1791886887682;
        Tue, 13 Oct 2026 03:21:27 -0700 (PDT)
X-Received: by 2002:a05:620a:19a8:b0:93e:74e5:2b1a with SMTP id af79cd13be357-93ebd0e4407mr1905666085a.10.1791886887043;
        Tue, 13 Oct 2026 03:21:27 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac4fd7sm4331907f8f.40.2026.10.13.03.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:21:26 -0700 (PDT)
Date: Tue, 13 Oct 2026 12:21:25 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Davide Caratti <dcaratti@redhat.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Daniel Thompson <daniel@riscstar.com>
Subject: Re: [PATCH net-next] net: stmmac: fix mqprio and cbs combination
Message-ID: <as4GJdF8oD_8FsGI@lore-desk>
References: <20261012-stmmac-mqprio-cbs-combo-v1-1-831e323eb4ef@oss.qualcomm.com>
 <20261013101031.42ilxihghwsivccm@DEN-DL-M70577.microsemi.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kEZubP9inIt+EcXY"
Content-Disposition: inline
In-Reply-To: <20261013101031.42ilxihghwsivccm@DEN-DL-M70577.microsemi.net>
X-Proofpoint-GUID: rzi3fGLfg0DHmD4bNoX6y4E5qk8wb8u8
X-Proofpoint-ORIG-GUID: rzi3fGLfg0DHmD4bNoX6y4E5qk8wb8u8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX9eiw5qkf6S+t
 e6mR3mX4g+74BrfXYpTd3qGp2SyILaWpZP469d/o8yAUcV49YbtigpthpJ0w5OY+SzELhVE/VgD
 gPIFZ05dvCBEnmxwgwS7bZaUsWRAK9g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX9IKbxa1+JPMj
 dfyH0do6AKWKAzubz3S92Ce1Wde95TT0MC8ZOQ7pv9BKhrzhae9Mk7si1JqiXkvYW3T/K3ATJnB
 TXJU/SQ3mLRASeOysRh4Oeoj/B6hSwJdATQX9HMWUraOkCucy4+niruZomKb+FCt0/8SlDHW0w1
 eYJn5pnqbpOILb7rZaH+la+3DR4uAbmjwDkLBAR0wXzBJPGTBlccrvedtzWEaxxRcoDBwIrewhI
 AuGuQkesB7LIg+1Cm7wgOKq7X2hRS71S/FhkGh5d/mJnH4PuQpl0mbUSCnmmHoFIIthoGBkWtSi
 yw7RP5BnGecQBG8JRm59uufbFJ+HbPiW1T/kRxVpA6pPmW0Dz5Rv6qrgxZGI0u9z+a/KWiKlzeH
 cEYaKQBbhZ6Y+A1Zvdydz8rZzstiv7ON8U1iqYz2axJyW8g8RAtE5NKhYgjRXykeNELHfWxQOEH
 nBguVDYGUFa88M9yyVA==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace0628 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=sKW1L16I2tC2GuKI_P0A:9 a=CjuIK1q_8ugA:10
 a=shb_a47hcL9woofGVGcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_032129_672543_72E1AAB2 
X-CRM114-Status: GOOD (  35.58  )
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

--kEZubP9inIt+EcXY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 13, Daniel Machon wrote:
> Hi Lorenzo,
>=20
> Just a question:
>=20
> > The channel-mode mqprio offload and the CBS offload can currently not be
> > enabled at the same time. tc_mqprio_validate_chan_mode() refuses the
> > mqprio offload as soon as any TX queue is configured in AVB mode, and
> > tc_setup_cbs() refuses to enable CBS while the strict-priority scheduler
> > is active. As a result the combination is rejected whichever order the
> > two are configured in.
> >=20
> > The strict-priority scheduler selected by the channel-mode mqprio
> > offload and the per-queue CBS shaper are independent MTL settings and do
> > not conflict, so drop the checks and let the combination be offloaded.
> > The following configuration, which was previously refused, now works:
>=20
> Looks to me like these checks are shared by multiple cores. Are the MTL s=
ettings
> independent on all of them?

Can you please explain what you mean?
What I mean with this patch is we can have a given queue (e.g. queue X)
configured in MTL_QUEUE_AVB mode and another one (e.g. queue Y) configured
in MTL_QUEUE_DCB mode.

Regards,
Lorenzo

>=20
> >=20
> >   $ tc qdisc replace dev eth0 handle 100 parent root mqprio num_tc 4 \
> >         map  0  0  0  0  0  1  2  3  0  0  0  0  0  0  0  0 \
> >         queues 1@0 1@1 1@2 1@3 mode channel hw 1
> >   $ tc qdisc replace dev eth0 parent 100:2 handle 102: cbs \
> >         idleslope 800000 sendslope -1700000 hicredit 494 locredit -1049=
 offload 0
> >   $ tc qdisc replace dev eth0 parent 100:3 handle 103: cbs \
> >         idleslope 400000 sendslope -2100000 hicredit 247 locredit -1296=
 offload 1
> >   $ tc qdisc replace dev eth0 parent 100:4 handle 104: cbs \
> >         idleslope 200000 sendslope -2300000 hicredit 124 locredit -1419=
 offload 1
> >=20
> > Fixes: 47891d501e34 ("net: stmmac: add tc mqprio hw queue priority offl=
oad")
> > Tested-by: Daniel Thompson <daniel@riscstar.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  8 --------
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 16 ----------------
> >  2 files changed, 24 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 56d89a696272..51d502930219 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -7740,14 +7740,6 @@ int stmmac_reinit_queues(struct net_device *dev,=
 u8 rx_cnt, u8 tx_cnt)
> >  	    tx_cnt < priv->xmit_qdisc.num_tx_queues)
> >  		return -EINVAL;
> > =20
> > -	if (priv->xmit_qdisc.prio_offload) {
> > -		for (i =3D priv->plat->tx_queues_to_use; i < tx_cnt; i++) {
> > -			if (priv->plat->tx_queues_cfg[i].mode_to_use =3D=3D
> > -			    MTL_QUEUE_AVB)
> > -				return -EINVAL;
> > -		}
> > -	}
> > -
> >  	if (netif_running(dev))
> >  		stmmac_release(dev);
> > =20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_tc.c
> > index ea1f97d6f0bd..175236ba379d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > @@ -346,9 +346,6 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
> >  	if (!priv->dma_cap.av)
> >  		return -EOPNOTSUPP;
> > =20
> > -	if (qopt->enable && priv->xmit_qdisc.prio_offload)
> > -		return -EOPNOTSUPP;
> > -
> >  	port_transmit_rate_kbps =3D qopt->idleslope - qopt->sendslope;
> > =20
> >  	if (qopt->enable) {
> > @@ -1340,7 +1337,6 @@ static void tc_mqprio_config_queue_prio(struct st=
mmac_priv *priv,
> >  static int tc_mqprio_validate_chan_mode(struct stmmac_priv *priv,
> >  					struct tc_mqprio_qopt_offload *mqprio)
> >  {
> > -	struct plat_stmmacenet_data *pdata =3D priv->plat;
> >  	struct tc_mqprio_qopt *qopt =3D &mqprio->qopt;
> >  	int i;
> > =20
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
> >  	for (i =3D 0; i < qopt->num_tc; i++) {
> >  		/* The offload switches the MTL scheduler to strict
> >  		 * priority, which only supports a 1:1 TC to TX queue
> >=20
> > ---
> > base-commit: d0bd617658ddfa5a115e64d1ab687bf155f6331f
> > change-id: 20261012-stmmac-mqprio-cbs-combo-341f12749ce2
> >=20
> > Best regards,
> > --=20
> > Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> >=20
>=20
> /Daniel

--kEZubP9inIt+EcXY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas4GJQAKCRA6cBh0uS2t
rL5PAP96OeU3WRJ+TomdoC9LeM8yGVHFcEqblfYZI9SX0VBt0wEAjcs9EIgh1j6f
yQB9U+DWjdpb/AWwTIFJgUtAxr5M3Qk=
=VGRf
-----END PGP SIGNATURE-----

--kEZubP9inIt+EcXY--

