Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9215BC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 18:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjINjCJofxG0Hx+eP6FeXopWezSwVFKw/eXpAnjSr8M=; b=GscuI6cs+JkE0F9Y0ipLxkkReT
	rqcb3UMknGLoLAsaBamIja7ssqkPomwWNFd8K9mYnqrd9Wdks35teRr2gEkxIzI5WaKAjEt7dKG4e
	FfqT2KOP4oVTWDhNMaB5pIAfd81odtNU21PDX1a5NLXLxiwERup0K/UkPPJK5SrqTCtIydLtmCHOT
	xPgy7Xb+KGcjbZ+nxBwMqtQW74H4KFDeBzjq7AQl+PBdbowBTIDaOGbMJ/UtEnWiAHNhhc+ztkdQE
	4IH4JGhRcirJryn55fsXv0F9+CjTcTb673Jyc6UzaGmQYHbframUzEJaAPgaTsyYQrsvCvzGU2KS3
	kxRHpPCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4NKt-0000000Ce4g-0ds1;
	Wed, 09 Sep 2026 18:47:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4NKq-0000000Ce3u-1wCS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 18:47:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Ihvsq2284066
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 18:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UjINjCJofxG0Hx+eP6FeXopW
	ezSwVFKw/eXpAnjSr8M=; b=D+2Mbw4Wz1ucLoRCjZZYq5KAD1AGbhsfRnzQHz0c
	NJ/OCD86miYFWT7NTTxn/tDTq1Nt1v0MoZm1WNhedXC8T91qKTtoXwh8h1VXTR5N
	djCIWugcZBIO36+Ro1yyqOMaz8qcEDcATI29LaegHqNzz1wcKuEa62vEzyrQ58Bq
	9632bd9XrcqTC09twWXiLZcHMYQWSIhNK3vEa1lYXJOQMaNLM6sD3HpJvjmac4Fz
	PJo7Rt5tq6PE5Ef2+/UKWuhHTtZTT4yO2KEpxm4JV39E3j7Q1bmKRpMmJcERWe4z
	mp5sxmCC0jDZMS4oMQeIrZUAcFSWmkv5Lllt03sFHHEPOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydr0vy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:47:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so885850485a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 11:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788979671; x=1789584471; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UjINjCJofxG0Hx+eP6FeXopWezSwVFKw/eXpAnjSr8M=;
        b=X2X+Xa+vzxbT/RTt7WBV4+zJvBX1GBOufGexGbk/R/mw6/+kzfZ7FLYkv1CIBGtFRQ
         fTJR3lLUWHKGTRdrcHn407Bik7WzqMXD+1hZQ9Rwkiz9F0MQUJIRQc08REM0aePIt+3/
         KHuu7h44kx7HoI47BPQ7AAD/yxv6CnDqCYhLDZolpxMuVm2cjJfDtKyMkRAEqXuVuk4t
         5feZHwGmuiD32kd2OHGPUkkNpG+2Q3r7xIQsZNHxNVI4cAGcuWLLPa5CNAd3TMhd+E5j
         gnQ8J7XjCmH+a0dqrphBb9tEdO/CZfIroCP71Ixo9NdB6MitDABW8CFODF8GhKupHj8b
         ifUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979671; x=1789584471;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjINjCJofxG0Hx+eP6FeXopWezSwVFKw/eXpAnjSr8M=;
        b=JrWrJZpVkJxDEAddEcCAcKbTNMRmgjZiGc6408slr84oI4FqnHu42WIIYysrNxmDNE
         5jQZ4yYggJ8jBxptuWzG3r+9s3Pbtg5ZsGeTB6A1UJ7GufVJI4BChjiSSwPD2U8Jew1+
         b8+HRdeL/1Qsx7YrDHbxi1B+9chgneBZ8lksqRWnT6yY6VcwuBbzJSMSZrMW6V7ehBCq
         gJVzjedoKS1Nnh5uGc88XijFbYP0DU4yi4qwW9U8JwZijXQT1qGVRRdikysfWhC5Vrov
         CNyZmpO2QvK6eBK2wd2Qwo6mpkBAzRa4TIWZU2PO49VywbQCQ6l/fFeTonpWRGv56LIR
         B5ZA==
X-Forwarded-Encrypted: i=1; AKwUvBwiJi7reNNBWsLtBQ+rovK6AFnSOHqUW5NaB0+XvAzj0b34ae6TC04m0vk5mFnC6cE0tQofL4sFkHzbIZoxUWxB@lists.infradead.org
X-Gm-Message-State: AFuF++kcmuhKwVIXkhk/aG908tUlG+l6cnEZchBFicEN0Ym9c91nv+UW
	tf3NQvIsawMRHDQgOhpuhTFZq+VPf/k7QRJEz2Ax+dTH4mhOA7JE0BhqefdbcVfaOqoC4xtxOBe
	JK77eOk821PfxNntRvhY3rWTwtmRPrMFtfIBZeX6PCkrPMGNn/JylyO5SneJ+H0SRhk/+ftWBVW
	j6Fg==
X-Gm-Gg: AYBFou1TfJxudpyUjIqWu15eyC16QJXh1YLB8gNpLTy+l0Zk5aZRd8d9fIpDhEwR7pO
	EnpRvLeKw8j8WqcQOOIAovdl1iXqyXlIFvEFnVobzlXer7RwYjmqVQEzPiPJq8MEUYQs7pSTnXA
	W00vPIFu6cwpHzImzSDmnIVu8uYIlcX1PILSM7H2Kk7T/19Zxm+lPCuUAVbwDAbAmi8GaikSxiB
	+CIikzdWgdWsOz75VouiS8021suc/nT9vyhblr2x1oqs3b2QjEu0dZl4yLs+a3wtyQvrLXx6CRz
	Mi0A4XyUWZ/qlhRpcsOXC7ZyPrKHWb7FTpOonb1MsAaONUEawycUnQgWmbsZN8fHgJzF2oxIFJY
	KyZKhV5baC8dN4w==
X-Received: by 2002:a05:620a:468f:b0:939:6db3:6cad with SMTP id af79cd13be357-9398035a913mr3836948085a.12.1788979671024;
        Wed, 09 Sep 2026 11:47:51 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:939:6db3:6cad with SMTP id af79cd13be357-9398035a913mr3836938685a.12.1788979670273;
        Wed, 09 Sep 2026 11:47:50 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm46103192f8f.35.2026.09.09.11.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:47:49 -0700 (PDT)
Date: Wed, 9 Sep 2026 20:47:48 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 8/9] net: stmmac: qcom-ethqos: add
 per-platform NOC clock voting
Message-ID: <aqGp1D6ySJpTK1fB@lore-desk>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-8-bbe3389d0652@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="slUpn+zr8Skpi/6V"
Content-Disposition: inline
In-Reply-To: <20260908-shikra_ethernet-v2-8-bbe3389d0652@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa1a9d8
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Jx9YaH9-bZbgU6IgifAA:9 a=CjuIK1q_8ugA:10 a=8sS7P86Wg6PPOb-1CJIA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kinrP7loMhgXEqi0m5M6bn2TfoAthWn6
X-Proofpoint-ORIG-GUID: kinrP7loMhgXEqi0m5M6bn2TfoAthWn6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMCBTYWx0ZWRfX89YLhm1WhF1H
 jckKsluDJ8HFNKMQ8Rdw08guVxGzphh33eb72fYuDCF1QXBdsenrWHSwTVijTRJFQ6X/w7mMla2
 lEGm4fryh+K5Mbrz8Km3SjK2v2hSdjM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMCBTYWx0ZWRfX5xGk165+M/rH
 yW6UJs/XjlI8BXZHJtxAnpWy19UNUoGZG7ZBKHSsOe/+TKPInJpbpbpCBi+ul4cbAZK1GJIxJv/
 ATnmBGQF6LwFQqmLNxkZ3hFwsRKhtHPHZI1QpL4HdDgFvm0+RxfsguE+c7trIL0FYjlstyjv6Ey
 5I1GgSoJ3tFI6UvKwOCyuJriZj8T60Mpb9vyjcvWfasxNhVdoUPvZhTtdOqx44TYmi2ob3aLya4
 5v6BZ2LCgt4pRWmazvDEVth/+o5S9nVwyo6ZjFCrpqN9znWbgk80IcYS9k00pmFeDKu+CkOZ8QF
 zS2PsdRZLc1UYAGwsETQCO2JeblQgLBnJ1OXJ32nabyyUtD2l0K88sonsVlIrWH2FMfwmymud/9
 q8TL8gcKAsDVX5A5EFcr5SAgCFb6EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_114752_512420_FA38310A 
X-CRM114-Status: GOOD (  34.62  )
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

--slUpn+zr8Skpi/6V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Some SoCs gate the EMAC's path to the System NOC behind dedicated clocks
> that must be enabled before the DMA can reach memory. Add
> ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
> runtime structs so each compatible can declare its own set with per-clock
> rates.  The clocks are acquired during probe and enabled/disabled
> alongside the existing link clock in ethqos_clks_config().
>=20
> No functional change for existing compatibles. This will help us when
> we add support for Shikra.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 106 +++++++++++++++=
++++++
>  1 file changed, 106 insertions(+)
>=20

[...]

>  static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
> @@ -689,15 +703,51 @@ static int ethqos_mac_finish_serdes(struct net_devi=
ce *ndev, void *priv,
>  static int ethqos_clks_config(void *priv, bool enabled)
>  {
>  	struct qcom_ethqos *ethqos =3D priv;
> +	unsigned int i;
>  	int ret =3D 0;
> =20
>  	if (enabled) {
> +		if (ethqos->num_noc_clks) {
> +			ret =3D dev_pm_opp_set_rate(&ethqos->pdev->dev,
> +						  ethqos->noc_clk_rates[0]);

assuming the first clock is always an OPP device seems a bit fragile to me.
Can we find a way to enforce it? (e.g. have a dedicated clk_bulk_data struct
for it).

> +			if (ret) {
> +				dev_err(&ethqos->pdev->dev,
> +					"NOC OPP rate set failed: %d\n", ret);
> +				return ret;
> +			}
> +
> +			for (i =3D 1; i < ethqos->num_noc_clks; i++) {
> +				ret =3D clk_set_rate(ethqos->noc_clks[i].clk,
> +						   ethqos->noc_clk_rates[i]);
> +				if (ret) {
> +					dev_err(&ethqos->pdev->dev,
> +						"NOC clock rate set failed: %d\n", ret);
> +					dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
> +					return ret;
> +				}
> +			}
> +		}
> +
>  		ret =3D clk_prepare_enable(ethqos->link_clk);
>  		if (ret) {
>  			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
> +			if (ethqos->num_noc_clks)
> +				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
>  			return ret;
>  		}
> =20
> +		if (ethqos->num_noc_clks) {
> +			ret =3D clk_bulk_prepare_enable(ethqos->num_noc_clks,
> +						      ethqos->noc_clks);
> +			if (ret) {
> +				dev_err(&ethqos->pdev->dev,
> +					"NOC clocks enable failed: %d\n", ret);
> +				clk_disable_unprepare(ethqos->link_clk);
> +				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
> +				return ret;
> +			}
> +		}
> +
>  		/* Enable functional clock to prevent DMA reset to timeout due
>  		 * to lacking PHY clock after the hardware block has been power
>  		 * cycled. The actual configuration will be adjusted once
> @@ -706,7 +756,12 @@ static int ethqos_clks_config(void *priv, bool enabl=
ed)
>  		qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  		ethqos_set_func_clk_en(ethqos);
>  	} else {
> +		if (ethqos->num_noc_clks)
> +			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
> +						   ethqos->noc_clks);
>  		clk_disable_unprepare(ethqos->link_clk);
> +		if (ethqos->num_noc_clks)
> +			dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
>  	}
> =20
>  	return ret;
> @@ -734,6 +789,51 @@ static void ethqos_ptp_clk_freq_config(struct stmmac=
_priv *priv)
>  	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
>  }
> =20
> +static void qcom_ethqos_noc_opp_cleanup(void *dev)
> +{
> +	dev_pm_opp_set_rate(dev, 0);
> +}
> +
> +/* Some SoCs gate NOC access behind dedicated clocks. Acquire them here
> + * so ethqos_clks_config() can enable/disable them at runtime. The OPP
> + * table is used to propagate the required VDD_CX performance state via
> + * dev_pm_opp_set_rate().
> + */
> +static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
> +				     const struct ethqos_emac_driver_data *data)
> +{
> +	struct device *dev =3D &ethqos->pdev->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!data->num_noc_clks)
> +		return 0;
> +
> +	for (i =3D 0; i < data->num_noc_clks; i++) {
> +		ethqos->noc_clks[i].id =3D data->noc_clk_cfg[i].id;
> +		ethqos->noc_clk_rates[i] =3D data->noc_clk_cfg[i].rate;
> +	}
> +	ethqos->num_noc_clks =3D data->num_noc_clks;
> +
> +	ret =3D devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
> +
> +	ret =3D devm_pm_opp_set_clkname(dev, data->noc_clk_cfg[0].id);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set OPP clock name\n");
> +
> +	ret =3D devm_pm_opp_of_add_table(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add OPP table\n");
> +
> +	ret =3D dev_pm_opp_set_rate(dev, data->noc_clk_cfg[0].rate);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set initial NOC OPP rate\n");
> +
> +	return devm_add_action_or_reset(dev, qcom_ethqos_noc_opp_cleanup, dev);
> +}
> +
>  static int qcom_ethqos_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np =3D pdev->dev.of_node;
> @@ -795,6 +895,12 @@ static int qcom_ethqos_probe(struct platform_device =
*pdev)
>  	ethqos->has_emac_ge_3 =3D data->has_emac_ge_3;
>  	ethqos->needs_sgmii_loopback =3D data->needs_sgmii_loopback;
> =20
> +	if (data->num_noc_clks) {

I guess you can drop this check since it is already done in
qcom_ethqos_init_noc_clks(), right?

Regards,
Lorenzo

> +		ret =3D qcom_ethqos_init_noc_clks(ethqos, data);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ethqos->link_clk =3D devm_clk_get(dev, data->link_clk_name ?: "rgmii");
>  	if (IS_ERR(ethqos->link_clk))
>  		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
>=20
> --=20
> 2.34.1
>=20
>=20

--slUpn+zr8Skpi/6V
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqGp1AAKCRA6cBh0uS2t
rJe5AP412HbG+cRGfi9lkrr+Gg/WmE/XOiGzUoflMRha2mmokAD/RbM96cAfeMgt
zWdQxOE79McBOAswltXFCrrAJhxVMgg=
=+2DD
-----END PGP SIGNATURE-----

--slUpn+zr8Skpi/6V--

