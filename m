Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C26C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tn1vnM+fEy+W68q7HFguoK7PZq8n/gNxlKOjB9RLug=; b=X3PiXGltOnMgStD8uc6We3fKU2
	hx4dOjIERun9cmpZAe0T/u3iaM9ptRymaKakq9Miwa+yUnFCQowehmVw/c9KSXNWX5adjqtwmWhs4
	Eg5DSd17c2G7bEvz5/Yt9GT39KTnV0rreYaqgDD97z6hCq+v2cYomoMRcJeEb9Nvqc2p4rwtTGpC5
	PXvRP/G59S73MRMM9fteZub+9X9b91ah1az2JhW2RK4yOUqPL4JJIhHEBsfdPHSFy/9BeQ0qjUrEk
	Y0NHQ+DMG2b+jqHFDgmEhgFu3NciVoXDZwNWqbXsIcLKQd+h/gpMxGYopmh8AD7u5FUOu665xwNaY
	cPFs9u2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Mb-00000009iEh-1YBg;
	Mon, 31 Aug 2026 14:51:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13MY-00000009iDz-3UI6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 14:51:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETQ9N3341510
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 14:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9tn1vnM+fEy+W68q7HFguoK7
	PZq8n/gNxlKOjB9RLug=; b=ox/Fa6Ju1riojVfz97Y1ptU27zLm1pjWF67371N8
	CsCqKHWcqt9ElCA7sK1l4K5aj+BsFYW9+i9XGpRdXdWc0uvK2sGbWwpKQdZYlSCF
	wxEb1YlSYpivoJfNJwtc/Ymz0BihDyRSxWJWcCNLK938tQmfvKEkCWyjc1iCu6s4
	IZPA2PC/g4sS30ei00PWZLhRSRSC1+6C4ZrS+Y+nD225LXoIjKhjN6Z3iKESkaV/
	gX6nm3geT60pW4YLpUQIOwiagA6zpWIMr+gxFG7sTSXTbHgv4C8dNF+c/aI0V/qb
	2GPFbxtU/aU1SfGgKMVAGG9giCiHrhhQJs0cLhTRCAdyww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556su2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 14:51:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso459890685a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 07:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788187913; x=1788792713; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9tn1vnM+fEy+W68q7HFguoK7PZq8n/gNxlKOjB9RLug=;
        b=OJpIqYqGrXiNTTdtf7/P61xYOsCPqIfH0bYZuFpViMyO3fpI/2dDaQh7kBDwItstPl
         PGvTRSlyRC/IANn0TFJx2Q3P9hcCFH9diAwFKAo812Mv3VUlhN5Eur+mFD6nLUa1I0cd
         ggzaeyNl5t/XreFBYocSaWb+on1u4xrlBIDutjd7tgt99xhayzWZPwpjKw2rDNmGawK4
         yi9lyM4E86AQX9y+tdeExC40R1LzqbBrlO3c4wHErS5vwt8cl5df8vlvVQ45IDZUq/Y/
         wzw7tzQju8gRlKhh02tWJwJBJ4KiN33/XHzSXMMsVWK6O1+GqxBLY+B6wXSVIS9qcbN0
         NZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187913; x=1788792713;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9tn1vnM+fEy+W68q7HFguoK7PZq8n/gNxlKOjB9RLug=;
        b=IKJllGgSh5mnE1K22hROphsN7r+VPUTId8HhO9Nuconkoz6sqt65J/AzNfZ6gQE3eU
         rkdffoQVCXFxgtRwRMinzbGect9pfqDa8d97vuSOZDyw5JNZKEiNCNE/wpcls9f8hKVE
         qY+3X1cW3bcuz2/AdxWYgz3ZkcVfiBlRgQuiYdMPBRKroS+NKrIJZylFr67+0O5k5Kvy
         WT2dNL8yLTHLBBsGneD2iEoWKYavXgHYYTF3BE2o3lyv0yairT/3/SzDA+wbneHuPr/2
         Xns2LlSkbMMxKCZLXkVu1jNQqTvproI9wB1ifuqdimwWyuMaS8bcr8RnIvp9VrkuooDW
         bo6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqxkk02tvrHKYWpiex4Z4fj94guq4+4Wy0M7YSxHiQmnHcvTOO57nZb2xyQ8kTFRtx2acKdd4BIuU5ioSXlipli@lists.infradead.org
X-Gm-Message-State: AFuF++mx+4QSZylPvcWJH5TNYqzMlS8CmgOdyQrk0tb9i2hJXhDU6r+Q
	nxyfW1XQOyJk21BBI2xd5znEYFXIASBvGvHmads0ZyAe6WW76koNosS26D5+9/tfrtSxNiALiJQ
	RetLFd+b5BJisMl82JJyFR91et6Ku0oX9QCgQ2bqRJO/TUOUfrfGTyl58OEZVoXBN/0APAWOO28
	c26w==
X-Gm-Gg: AR+sD109kf69vC149cQslNTcLzSNhdBQ9XYiw/I5nNRVVcSlLq97ZEFsRvzEDDnMo8x
	BkcHUikiFd2Hz59mdtHvXYufhuANW+TOqCxTg6MgNTl4uWFvmfPVsuH5heXS8nvThcOa2WW3BHS
	JZjL1Y/38Ltw/BHI/43o3mmDfNRH7IyXL6jAUoTKb+Hqu2P9w4iJFrDyuIPTHYknmKiIM/dJH1N
	bL0uWTWS10L6af9ocsksZgtx46IHXIULRbPwQocVYZFhjY0hGLfIxsIz+Tb1zEHt5vm+mKdkKTQ
	LeM7ilxkL5aHmXiWfuh/KLdDZzN9SLKUeWoo2+M9Lr1G6KwCHF3H2AMHZ9RNTpMTs+TCk1KUz03
	65XKFCh1sQeHs/w==
X-Received: by 2002:a05:620a:5842:b0:939:49f1:f972 with SMTP id af79cd13be357-93949f20483mr56866885a.23.1788187912525;
        Mon, 31 Aug 2026 07:51:52 -0700 (PDT)
X-Received: by 2002:a05:620a:5842:b0:939:49f1:f972 with SMTP id af79cd13be357-93949f20483mr56860385a.23.1788187911871;
        Mon, 31 Aug 2026 07:51:51 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20793sm22511460f8f.17.2026.08.31.07.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:51:51 -0700 (PDT)
Date: Mon, 31 Aug 2026 16:51:50 +0200
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
Subject: Re: [PATCH net v2] net: stmmac: hold runtime PM reference in setup_tc
Message-ID: <apWVBrXNt74gtUd4@lore-desk>
References: <20260827-stmmac-setup-tc-enable-pm-v2-1-a9b8a5948f41@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1YFSzgez06+yISi3"
Content-Disposition: inline
In-Reply-To: <20260827-stmmac-setup-tc-enable-pm-v2-1-a9b8a5948f41@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOCBTYWx0ZWRfX0KPIZTj7lDyF
 Z2NF46H4YT5tJLAQRrlrKF5B2K4jix90mlZE3LLjGFuWhOjJTrsmjKSvBC3A7XWWn8v4D7cuTml
 KMuGsx+Rxz24yDhKKZqW6X0SV2OTqD4=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a95950a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9R54UkLUAAAA:8 a=6OvIjjMOMFNL7lJvkioA:9 a=CjuIK1q_8ugA:10
 a=St0wnXDM9r6wG2E8OfQA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: EVnLIesMbawuIGnUuZgcdhVkKuTCJKCO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOCBTYWx0ZWRfXxbtABsILI5/c
 uhs5wGWj5Aw+eze1n/vMeeFGAj7tzM433jqrZ30TBHSjFJS5s0h8+EOK3tu6LFM1Nh8zm9cR2ns
 /SNt7Tkd/uaio4jhqjjFFofDWcryMODw8lpFEgHMEEO1XSx+sXpE1m5VzrSna7timFlKpnxalj7
 5MB8qBWEOZ0aBoBDnsh+LxC/otPBwqhKoT1yxSMye6ArFNNASoR4uB50yUJ/mzkHmbLdnF401uf
 EowVDDGvJrMFlnQQK31EcUxBb7y3ISfBlYYa9qbY6n5XS5bmzRtEbJ6yrYzw5QLSyBFtrAJzZv2
 fJ3ppA1EvXlGqJmquCqEh3lE9qGKlGN8a/vd5kUPIvATUm3iIVlVclK5txh0AXMfc00LpScflrK
 hGongJAeSu/L15tMKdUoVW+P3y3/aTVxZj6HsxQ22awx0PwFX0vw2eCf6FSQc7cRH+6X53wA4er
 brIvxRrivLiQwGN1+nA==
X-Proofpoint-GUID: EVnLIesMbawuIGnUuZgcdhVkKuTCJKCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_075155_068063_B1255983 
X-CRM114-Status: GOOD (  37.45  )
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

--1YFSzgez06+yISi3
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
> Changes in v2:
> - Return -EOPNOTSUPP in stmmac_setup_tc_block_cb() for unsupported TC
>   blocks.
> - Link to v1: https://lore.kernel.org/r/20260824-stmmac-setup-tc-enable-p=
m-v1-1-45172d241a4b@oss.qualcomm.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 35 +++++++++++++++++=
+++---
>  1 file changed, 31 insertions(+), 4 deletions(-)

commenting on sashiko's report:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260827-stmmac-setup-t=
c-enable-pm-v2-1-a9b8a5948f41%40oss.qualcomm.com

>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index efa35cfecc4f..90753d5af6d6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6393,9 +6393,13 @@ static int stmmac_setup_tc_block_cb(enum tc_setup_=
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

- Can this new early return leak entries from priv->tc_entries and
  priv->flow_entries?
  When pm_runtime_resume_and_get() fails (for example clk_prepare_enable()
  failing inside stmmac_bus_clks_config(), reached via
  stmmac_runtime_resume()), a TC_CLSU32_DELETE_KNODE or FLOW_CLS_DESTROY
  command never reaches tc_delete_knode()/tc_del_flow() in stmmac_tc.c, whi=
ch
  are the only places that clear entry->in_use in the bounded pools allocat=
ed
  by tc_init()/tc_rfs_init().
  The tc core does not retry the destroy - fl_hw_destroy_filter() returns
  void and ignores the result of tc_setup_cb_destroy():
  net/sched/cls_flower.c:fl_hw_destroy_filter() {
  	...
  	tc_setup_cb_destroy(block, tp, TC_SETUP_CLSFLOWER, &cls_flower, false,
  			    &f->flags, &f->in_hw_count, rtnl_held);
  	...
  }
  The same applies to the new early returns in stmmac_setup_tc() for
  TAPRIO_CMD_DESTROY and for CBS teardown, where the qdisc layer frees its
  own state regardless of the returned error and priv->est / CBS programming
  stays as it was. Before this change the delete path always executed.
  Would it be better for teardown commands either to run unconditionally, or
  to update the software bookkeeping even when the register programming has
  to be skipped?
  - I think this issue is not introduced by this patch
    (tc_cls_can_offload_and_chain0() alreaday bails out early in case of
    error) and it needs to be fixed with a dedicated patch.

> =20
>  	__stmmac_disable_all_queues(priv);
> @@ -6408,10 +6412,13 @@ static int stmmac_setup_tc_block_cb(enum tc_setup=
_type type, void *type_data,
>  		ret =3D stmmac_tc_setup_cls(priv, priv, type_data);
>  		break;
>  	default:
> +		ret =3D -EOPNOTSUPP;
>  		break;
>  	}
> =20
>  	stmmac_enable_all_queues(priv);

- The commit message says this callback "can be reached while the interface=
 is
  down". If that is the case, can __stmmac_disable_all_queues() hang here?
  napi_disable() is not idempotent. __stmmac_disable_all_queues() calls it =
for
  every configured channel without any state check:
  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:__stmmac_disable_all_qu=
eues() {
  	...
  		if (queue < rx_queues_cnt)
  			napi_disable(&ch->rx_napi);
  		if (queue < tx_queues_cnt)
  			napi_disable(&ch->tx_napi);
  	...
  }
  and napi_disable_locked() waits without a timeout:
  net/core/dev.c:napi_disable_locked() {
  	...
  		while (val & (NAPIF_STATE_SCHED | NAPIF_STATE_NPSVC)) {
  			usleep_range(20, 200);
  			val =3D READ_ONCE(n->state);
  		}
  	...
  }
  Nothing clears SCHED/NPSVC for a NAPI instance that is already disabled.
  The instances are created at probe by stmmac_napi_add() and only removed =
at
  remove/queue reconfigure, and __stmmac_release() calls
  stmmac_disable_all_queues() without re-enabling them, so they carry those
  bits both before the first stmmac_open() and after ifdown.
  - This issue is not introduced by this patch and it needs to be fixed wit=
h a
    dedicated patch

> +	pm_runtime_put(priv->device);
> +
>  	return ret;
>  }
> =20
> @@ -6421,26 +6428,46 @@ static int stmmac_setup_tc(struct net_device *nde=
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
> +		break;

- The commit message states the reference makes the device "active, and its
  clocks enabled, whenever the MTL/MAC registers are programmed". Is that
  accurate for the taprio path?
  stmmac_runtime_resume() goes through stmmac_bus_clks_config(), which only
  enables stmmac_clk, pclk and the optional platform hook:
  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c:stmmac_bus_clks_con=
fig() {
  	...
  		ret =3D clk_prepare_enable(plat_dat->stmmac_clk);
  		...
  		ret =3D clk_prepare_enable(plat_dat->pclk);
  		...
  		if (plat_dat->clks_config)
  			ret =3D plat_dat->clks_config(plat_dat->bsp_priv, enabled);
  	...
  }
  priv->plat->clk_ptp_ref is not in that list. It is tied to open/close:
  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_release_ptp() {
  	stmmac_ptp_unregister(priv);
  	clk_disable_unprepare(priv->plat->clk_ptp_ref);
  }
  - This issue is already fixed by the following patch:
    https://lore.kernel.org/netdev/20260829-stmmac-est-reapply-after-open-v=
2-1-5e5ccb185e92@oss.qualcomm.com/

- By resuming the device rather than rejecting or deferring, this now lets =
the
  EST and Flexible RX Parser programming succeed while the interface is dow=
n.
  Does that programming survive the next ifup?
  The next stmmac_open() does a core software reset:
  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_init_dma_engine(=
) {
  	ret =3D stmmac_reset(priv);
  	if (ret) {
  		netdev_err(priv->dev, "Failed to reset the dma\n");
  		return ret;
  	}
  	...
  }
  which clears the MAC/MTL registers. stmmac_est_configure() is only called
  from stmmac_tc.c and stmmac_ptp.c, and stmmac_rxp_config() only from
  tc_config_knode()/tc_delete_knode() in stmmac_tc.c, so neither the EST ga=
te
  list nor the FRP table is re-applied from the open path. CBS by contrast =
is
  re-applied:
  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_hw_setup() {
  	...
  	/* Configure CBS in AVB TX queues */
  	if (tx_queues_count > 1)
  		stmmac_configure_cbs(priv);
  	...
  }
  Meanwhile priv->est->enable/gcl, priv->tc_entries and priv->flow_entries
  keep saying the offload is installed. So after
    ip link set X down
    tc qdisc replace dev X root taprio ... flags 0x2
    (or tc filter add dev X ingress ... u32/flower skip_sw)
    ip link set X up
  does the hardware end up running with default MTL/FRP configuration while
  userspace and the driver both believe the schedule or filter is offloaded,
  with later incremental add/delete operations computing updates from a tab=
le
  that no longer matches the device?
  The wipe-at-open behaviour itself predates this patch, but powering the
  device up and programming anyway makes it the expected outcome of the path
  this patch enables. Would rejecting with -ENETDOWN, deferring, or
  re-applying EST/FRP from stmmac_hw_setup() be a better fit?
  - Similar to EST counterpart, this issue has not been introduced by this
    patch and it needs to be fixed with a dedicated patch.

Regards,
Lorenzo

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
> base-commit: f967455fb2a5a2079b9eb5823e9ccf359174bf9f
> change-id: 20260824-stmmac-setup-tc-enable-pm-149aa563d797
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--1YFSzgez06+yISi3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapWVBgAKCRA6cBh0uS2t
rAVcAQCc1yMpRsDPRe3M/yKew58Vu5OFf+1cxfU6EtdA9c+VLAD/anpkGlqWleMI
q8Lfre5MqJXI+FrXMLTDKHmJuYLegwU=
=k10o
-----END PGP SIGNATURE-----

--1YFSzgez06+yISi3--

