Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3535CCCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTnLRYsj78blmQKt2A1zuJNV0HFF9cbULACp8sWIgiQ=; b=0jaFmTtruhVJuvje0FHFmIH4M3
	pC0aevL9wTRAvbn0u2YYF86WJwZIiWri4WjeHLEI0zyCVDdAGLuEXcPcta66/bHCA/AhQDDYbuBbI
	FcBrtpTbzX7U6W8LHO98gl/Jyb/yd2EoJyqFSapASu/ZtXQF71zWyvBfybRGEPkupBm5T4BBo1GzR
	x5vNMF1nNaXCkcfYHSzZcEfy0WGtc7YlX1j2jZWGQ3AVnlavT6KXxC7gDvQSP+Syi68rfSWrUP7nF
	Go1wGoiM7tNKu7RPJZRVbuAXnKZ1c1iHLhw5j1GAp7oIQ5PIOXwgjdqvI2/J35kaPgEVov3UO7nID
	FfKhlafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjS3-00000006yJy-19UC;
	Mon, 19 Oct 2026 09:14:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjRz-00000006yIi-2tVQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:14:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PAlF1896752
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 09:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QTnLRYsj78blmQKt2A1zuJNV
	0HFF9cbULACp8sWIgiQ=; b=fEf0wvbcRbeM+z7ejAcuGsesqZiQkFCr7sfYxlP6
	neRDfXYoRhXiDN0FuK57H3r4s8slyzunOha/z5rj7S0SVwJ5n4NFhnSyJn3HbJ88
	ReEdApg5145ZFiVkv+lYUd41At8YZBQozSO3WZiOjRvfa17aIsPJa+EPNgoq1mgZ
	TFclDmr/oiy7x3wzqQZR+yanfdWnD7Qs7hQrW00saYJNhidlDSnyHx4QoXPHOIJ3
	1bx+U+2cdbCK9fpxuuES5Hmf2xXWyttmN7j1oufUKR1DN9TQLjGfLLuRA6omJtCE
	o7AifS9ru+MpUbdILtJQ2Asfiu+97jccRvlolEj6Oj95mw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr94j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 09:14:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so4792650eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 02:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401274; x=1793006074; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QTnLRYsj78blmQKt2A1zuJNV0HFF9cbULACp8sWIgiQ=;
        b=fW0i2tkNbnm4TCiU896ETG93A1/Gk5Rh4P+UFZjYVtMxABO2V23EOSSxHBGId59xEi
         3mRexVxeEsfwyzqDcekKLaBttiD00MSjje/NKJ34O+0r5qT358lQh+6Jr+modAOGIKz8
         i+gkSZu0LN+hse3lT0HLsa3nW8ZYyYTXgEts2IE0pYJtNlmxM/MGbW72Pa+gdCxShrun
         s94fwekg1BuxG1MMvZMyqqJ3luNsxVpmH4rw5peSn70krHOjhWFmjmNPuMj5F4mL+aEV
         Cqzs8JyDypj3C5Yd0QteI+a4qDDYiOOtxcZ619uqSy0j8jQ/WehoZwFBIbXE6Fl+6dgT
         2Fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401274; x=1793006074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QTnLRYsj78blmQKt2A1zuJNV0HFF9cbULACp8sWIgiQ=;
        b=qoWP3jztWVHH5QckJovXnHZkXgN/qHNUNxvnDwPIfzRQNYpKAjRLWy8qupg2UBKu7t
         SFpkt02h69DIQb/hf0KLH8EzGW8TlMZMVcbNrlbd/pPFiu9BaCJjxX26lPX3Ybe7bwXe
         RRbSuo0sT/V2X2h5/z4u+C7QDzu2AKF3uigLBfo43vaPum0ZHfSmXZ+j6IxSWk5DyYaJ
         +28dUSOyjW/KxuXIdxR9g9rQayeD0hO9kYoJDGIUWFO0vREdwupY4X9chZ8rIK2Z/Msx
         li6Nd9zarJVIIBkGttKYxPCpHeHUA7RgtIp4i4xkYljKI/+y44zkYQkh870Spn8PpgdN
         sydQ==
X-Forwarded-Encrypted: i=1; AKwUvBwV2MqlbrOIP2oXEtmPD+eVvOBf4pTjsxHDz2SE0xpbvAf2Dimf9HsSwqH65oU4dJzNhysFgJ8OpMKTh2EBjlG8@lists.infradead.org
X-Gm-Message-State: AFq9FYLaGlVS20C2mNiJquhuOqGEhs1FupqlTgFTueTOOd33hXVGdgLs
	0QEdW3LvskpT2cbcdHHYXTucyecy1HH2AV/hPWpigyap0eqd9O8BS31ZMr26nyHQ4R8WpEvretU
	x47ygtUftjWHPVHXF3qz9ks1ZkUipf5JdGN1FTyZ1CVvOfr0fCGflMu1tjtacXb1bEXMJNpkVcH
	GRgQ==
X-Gm-Gg: AYBFou2Ey0yw3UhdF3ieDFwQ4pz0zjfJQia744uYz1jv3ifvFp39W+3T2bMAvIkXvDH
	KPCRDJAhLaCnGWoYbkXfOXgl6WwHtDa5LRn2lx5tDEJWGS4CEHNGrSa13CJHuYWSiGC2t+8aC6D
	daJg8VLeV41404AXmdPoZcqNKKqzb0Q9CeCZzP5IX/YKSEG2FsuFpwNqXh5V0w+VMphBWN5OYjZ
	7pyoiLRPThPAxMw2NV4Fu+k1HGT6lo3mDxNqttVhr4GvADgS9yJgcPmhaAxlzcTRMc2B2eb1zLi
	0Qds4CGNDZ5+LMZF7OUNS+MoV/mBAkKTy/QTnl8Y7UIPwq08+NExz1OQkZLNewwkDnFEJ4jSyhj
	NS++j8EIxA0rQ
X-Received: by 2002:a05:7300:e5c2:b0:352:4f11:8118 with SMTP id 5a478bee46e88-361a3813baamr10646776eec.40.1792401273249;
        Mon, 19 Oct 2026 02:14:33 -0700 (PDT)
X-Received: by 2002:a05:7300:e5c2:b0:352:4f11:8118 with SMTP id 5a478bee46e88-361a3813baamr10646746eec.40.1792401272643;
        Mon, 19 Oct 2026 02:14:32 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607bc950f9sm34130421eec.0.2026.10.19.02.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:14:31 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:44:21 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Daniel Thompson <daniel@riscstar.com>, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, richardcochran@gmail.com,
        p.zabel@pengutronix.de, peppe.cavallaro@st.com, joabreu@synopsys.com,
        lorenzo.bianconi@oss.qualcomm.com, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 5/5] net: stmmac: support the TC9564 SoC
Message-ID: <atXfbcsXo0d2Z7yc@oss.qualcomm.com>
References: <20261019030129.1470307-1-elder@riscstar.com>
 <20261019030129.1470307-6-elder@riscstar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019030129.1470307-6-elder@riscstar.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX8584aXqGEo/z
 ZTt41Rvl0KL5Xqf/sz+v9Xv5vliH8TlHd+RCoOYKmrHE8nESVOInpa/H0RZg2+LRWo3M29Aignq
 K2e9pZO+A043w1JZcWKRyI7F0S2r4JXCSB1nDk/HZNRDFJGu+bZXtH38PwuXVzvCwBVV8I7UjBn
 8BhsKkUvhSe0apdENnJ1xuxHWLWFlE1MJONOImb8HWLzBzUQEMyHrBEscfxTAt3+5Agbgt5Z79K
 dOmWesfl9OCHeSTf91ZF36jeNa4v4NPWUIuR4gKdBoLB07RdjoPomi2zqNmKOwJKsp04Mxs0ChT
 fLhxSZlxall5uslN0JmvsgSPPaEzaVdbIkfBRkRo/gP+SxQ0LFvXroagnixAHJSWNeqmT8zzcfE
 h+Z10JA0tGqaGuBIGJGYDSgZNLtOUAUGnTmT/gb9fzEzW111TS7i0ccstG/mqzBcU5ekcepKvg+
 xuhxkvbrSPMoJEuzdDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX8M8CimLkdmoI
 1ZQ4cgJhdwR5tgHB+fSH9opcX4t70GFexCWQ3vV6HqzbcQsuwPBv/TwWSyv69/IOAdtugI8+WHD
 oh/YL75rY2OnNxPuB23JLIvqBFSTcIU=
X-Proofpoint-GUID: Ac_BkEsrCWIWGj357Q6VircKnCoCGNNt
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5df7a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ee_2aqc6AAAA:8 a=0b3DlNp43F3Af77sOdMA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: Ac_BkEsrCWIWGj357Q6VircKnCoCGNNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_021435_845018_34A29B8B 
X-CRM114-Status: GOOD (  31.05  )
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

Hi Alex,

On Sun, Oct 18, 2026 at 10:01:28PM -0500, Alex Elder wrote:
> From: Daniel Thompson <daniel@riscstar.com>
> 
> Add support for the Ethernet XGMAC functionality present in the
> Toshiba TC9564 SoC.
> 
> The TC9564 is a fairly complex chip that attaches to a host via
> the upstream port of a PCIe switch it implements.  That switch
> has three downstream ports, and one of those has an embedded PCI
> endpoint.  The PCI endpoint implements two PCI functions, and a
> 10 Gbps-capable XGMAC interface is attached to each.
> 
> The TC9564 implements additional peripherals, and access to them
> is provided by a PCI endpoint bus associated with BAR 4 of the
> first PCI function.  A PCI driver sets up the PCI function for
> use, and peripherals using the bus use platform drivers, matched
> by compatible string.
> 
> We use the pci-ep-bus approach for the stmmac driver as well, with
> each PCI function exposing access to its BAR 4 via an endpoint bus.
> The XGMAC device is defined within a pci-ep-bus node, and is bound
> to the platform driver based on its compatible string.
> 
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Co-developed-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> ...
> +/* Fields and values for the EMACTL registers */
> +#define EMAC_SP_SEL_MASK		GENMASK(3, 0)
> +#define SP_SEL_2500BASEX		4
> +#define SP_SEL_SGMII_1000M		5
> +#define SP_SEL_SGMII_100M		6
> +#define SP_SEL_SGMII_10M		7
> +#define EMAC_PHY_INF_SEL_MASK		GENMASK(5, 4)
> +#define PCS_CLK_PHY			1	/* Clock from PHY */
> +#define EMAC_INV_SGM_SIG_DET		BIT(6)	/* 1 = polarity inverted */
> +#define EMAC_LPIHWCLKEN			BIT(8)	/* 1 = low power mode */
> +#define EMAC_INIT_DONE			BIT(21)
> +

Nit: extra tab before BIT(8) and BIT(21).

> +
> +#define PMA_HWT_REFCK_R_EN			0x1080
> +#define PMA_HWT_REFCK_TERM_EN			0x1090
> +#define PMA_HWT_REFCK_STRIDE			0x0014
> +
> +#define PMA_COMM_CFG_0_1			0x1888
> +#define PMA_COMM_CFG_0_1_STRIDE			0x0008

Nit: extra tab before 0x1090 and 0x0008.

> +
> +static int tc9564_probe_config_dt(struct tc9564_data *td)
> +{
> +	struct platform_device *pdev = to_platform_device(td->dev);
> +	struct device_node *np = td->dev->of_node;
> +	struct plat_stmmacenet_data *plat;
> +	phy_interface_t phy_interface;
> +	struct device *dev = td->dev;
> +	int ret;
> +
> +	ret = device_get_phy_mode(dev);
> +	if (ret < 0)
> +		return -ENODEV;
> +	phy_interface = ret;
> +

Nit: I think the call to devm_stmmac_probe_config_dt() will get the PHY
mode from firmware and store it in plat_dat->phy_interface so this is
probably redundant.

> +	/* The platform structure is allocated with devm_kzalloc() */
> +	plat = devm_stmmac_probe_config_dt(pdev, td->res.mac);
> +	if (IS_ERR(plat))
> +		return PTR_ERR(plat);
> +


> +static int tc9564_dwmac_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tc9564_data *td;
> +	struct device_node *np;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	td = devm_kzalloc(dev, sizeof(*td), GFP_KERNEL);
> +	if (!td)
> +		return -ENOMEM;
> +
> +	td->dev = dev;
> +
> +	np = dev_of_node(dev);
> +	regmap = syscon_regmap_lookup_by_phandle_args(np,
> +						      "toshiba,config-syscon",
> +						      1, &td->emac_ctl_offset);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "failed to get config regmap\n");
> +	td->config_regmap = regmap;
> +
> +	ret = tc9564_reset_init(td);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to initialize resets\n");
> +
> +	ret = tc9564_clock_init(td);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to initialize clocks\n");
> +
> +	ret = tc9564_probe_config_dt(td);
> +	if (ret)
> +		return ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &td->res);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to initialize stmmac resources\n");
> +
> +	tc9564_mac_enable(td);
> +
> +	ret = stmmac_dvr_probe(dev, td->plat, &td->res);
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret, "failed stmmac probe\n");
> +		goto err_disable_mac;
> +	}

Nit: Could this use devm_stmmac_pltfr_probe() and drop
tc9564_dwmac_remove()?
tc9564_mac_disable() could be registered as the priv->plat->exit
callback.

> +
> +	return 0;
> +
> +err_disable_mac:
> +	tc9564_mac_disable(td);
> +
> +	return ret;
> +}
> +

	Ayaan

