Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90493C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 22:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8hrSHao4mZDBLRUP9tN41ewPkOVLHsnaP0U7gAOeZU=; b=fsjC3A2gWMJMT4TkwBjxbV3Haj
	KsGjPTFY9SHWmgg1/vKfD3vIgvznMjENCnvqrpfKYXsPku8CoxP1sNr2ob3EhkRZ9nhoFKYkZBZ7Q
	TtojKESpEdD4lk4qX5UtECdgyvElLsqJ9XCrmgtjrpftYqLVhnqXvNe6mCippEBX3h2nNAgQFY9X8
	AGVix0dSNruVdsuoEXvCqCqvgLH9KcXLEoATnfPBqFQzdGcXVRuoa0xnsq9yB6qUoO1+6M4WwkjXm
	vnpGmiwnE0f8oDFbsbNgAGZU9QAAaYXfqJl6nU4/UMQ0ktSmk0flu1KmA6Z+3qta7EPevT3tFPyh0
	MaTCMKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOeg-0000000HKGs-30fm;
	Fri, 24 Jul 2026 22:46:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOeW-0000000HKCW-2QL0;
	Fri, 24 Jul 2026 22:46:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 060DE600AD;
	Fri, 24 Jul 2026 22:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3376F1F00A3D;
	Fri, 24 Jul 2026 22:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784933159;
	bh=h8hrSHao4mZDBLRUP9tN41ewPkOVLHsnaP0U7gAOeZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F4kinEg6VFnFYpcYlOYDgBJ13uZKg8bFJwyDYqhRrYLgEFZJkm7VYiUQtifSEDrJi
	 k8mjpFeRCs0rUfU2vLcxiZc6e8re+xJO7nSmQTSV0O0oyAYFIPilYt1igMn0INk6U3
	 QnJ0BrgjZMYhdYbMiT9ubFCxk98oJVCHG99lkD2NgTD9yNgbefKINogWHk143NDXWR
	 eJKN1d6gOUbEgjCxKn7xOzQt+M4VLqmXP0t2fP8FUmU1gi7meI5uzJ7X5n5dIyQIfk
	 TcqXv9DuPjIgHgJ2BbV8225yls7zoV93gWByvc4/WxA2jGeMBprF6q0qSq2Xt7zmV0
	 jhqohKHwhA5DA==
From: Jakub Kicinski <kuba@kernel.org>
To: bartosz.golaszewski@oss.qualcomm.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	vkoul@kernel.org,
	peppe.cavallaro@st.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	shawnguo@kernel.org,
	festevam@gmail.com,
	jan.petrous@oss.nxp.com,
	s32@nxp.com,
	mohd.anwar@oss.qualcomm.com,
	romain.gantois@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mripard@kernel.org,
	christophe.roullier@foss.st.com,
	brgl@kernel.org,
	radu@rendec.net,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	dfustini@tenstorrent.com,
	linux-sunxi@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mips@vger.kernel.org,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	bartosz.golaszewski@linaro.org
Subject: Re: [PATCH net-next v13 03/10] phy: qcom: add the SGMII SerDes PHY driver for SCMI systems
Date: Fri, 24 Jul 2026 15:45:55 -0700
Message-ID: <20260724224555.1649131-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-3-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-3-119f8699ef8e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
phy: qcom: add the SGMII SerDes PHY driver for SCMI systems

This adds a firmware-managed variant of the Qualcomm DWMAC SGMII
SerDes/PHY driver for platforms where the SerDes hardware (clocks and
registers) is owned by the firmware and controlled via an SCMI power
domain performance state.

A few questions on the new driver below.

> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
> new file mode 100644
> index 000000000000..aa7ce9393b28
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
> @@ -0,0 +1,165 @@

[ ... ]

> +static int qcom_dwmac_sgmii_phy_scmi_power_on(struct phy *phy)
> +{
> +	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
> +	struct device *dev = phy->dev.parent;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = dev_pm_genpd_set_performance_state(dev, priv->perf_state);
> +	if (ret) {
> +		pm_runtime_put(dev);
> +		return ret;
> +	}
> +
> +	usleep_range(5000, 10000);

[Medium]
What is the firmware contract that the 5-10 ms sleep is enforcing here?

If firmware synchronously waits for PLL lock / PCS ready before returning
from the SCMI perf-state call, this sleep looks unnecessary and could use
a comment saying so.

If firmware returns before the SerDes has stabilized at the requested rate,
then the fixed 5-10 ms delay may be too short. The sibling HLOS driver
drivers/phy/qualcomm/phy-qcom-sgmii-eth.c polls QSERDES_COM_C_READY_STATUS,
QPHY_PCS_PCS_READY_STATUS (PCS_READY and SGMIIPHY_READY), and
QSERDES_V5_COM_CMN_STATUS (PLL_LOCKED) with a timeout on the order of
750 ms in qcom_dwmac_sgmii_phy_calibrate(), which suggests worst-case
ready time can be considerably larger than 10 ms.

The same concern applies below in set_mode(): when phy->power_count > 0
the driver issues the same perf-state vote to switch between SPEED_1000
and SPEED_2500 with no delay at all. Should the two paths agree on
whether a settling delay is required?

> +
> +	return 0;
> +}
> +
> +static int qcom_dwmac_sgmii_phy_scmi_power_off(struct phy *phy)
> +{
> +	struct device *dev = phy->dev.parent;
> +
> +	dev_pm_genpd_set_performance_state(dev, 0);
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}

[Low]
Should power_off check the return value of
dev_pm_genpd_set_performance_state(dev, 0)?

The power_on path unwinds pm_runtime on failure, but here a failing SCMI
transport call is silently discarded and the function still returns 0.
If the vote is not cleared, the domain retains an active performance
state while the PHY core believes the PHY has been powered off, leaving
firmware and driver state out of sync with no dev_warn/dev_err.

> +
> +static int qcom_dwmac_sgmii_phy_scmi_validate(struct phy *phy, enum phy_mode mode,
> +					      int submode,
> +					      union phy_configure_opts *opts)
> +{

[ ... ]

> +}
> +
> +static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_mode mode,
> +					      int submode)
> +{
> +	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
> +	struct device *dev = phy->dev.parent;
> +	int ret;
> +
> +	ret = qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
> +	if (ret)
> +		return ret;
> +
> +	priv->perf_state = (submode == PHY_INTERFACE_MODE_2500BASEX) ?
> +			   SPEED_2500 : SPEED_1000;
> +
> +	if (phy->power_count == 0)
> +		return 0;
> +
> +	return dev_pm_genpd_set_performance_state(dev, priv->perf_state);
> +}

[Low]
Would it be worth documenting the contract between these ethtool link-
speed constants and the SCMI provider's OPP table?

SPEED_1000 (=1000) and SPEED_2500 (=2500) are passed directly to
dev_pm_genpd_set_performance_state() as opaque state tokens looked up in
the domain's OPP table by the genpd core. Nothing in the driver, the
binding, or the commit message states that the firmware must expose
OPPs numbered exactly 1000 and 2500. If a future firmware indexes its
OPPs differently (for example 0/1, or in MBd), mode changes would
silently misconfigure the SerDes here. A short comment or a small helper
that maps submode to a named state would make the assumption explicit.

[ ... ]

> +static const struct of_device_id qcom_dwmac_sgmii_phy_scmi_of_match[] = {
> +	{ .compatible = "qcom,sa8255p-dwmac-sgmii-phy" },
> +	{ }
> +};

[Low, Low]
Two questions on the accompanying DT binding for
qcom,sa8255p-dwmac-sgmii-phy for this compatible.

The binding makes reg a required property with a 0xe10-byte range
describing the SerDes, but this driver never calls
platform_get_resource(), devm_platform_ioremap_resource(), or any
register-access API, and the commit message explicitly states that
firmware owns the SerDes and no register or clock access is done here.
Should reg be dropped from required (or removed from the schema), or
should the binding document why the OS must describe an address block
it never touches?

The binding also requires power-domain-names (const "serdes"), but the
driver relies on the single implicit genpd attached to dev->pm_domain by
the driver core and never looks up a domain by name (no
dev_pm_domain_attach_by_name() or similar). Would it be reasonable to
either make power-domain-names optional, or note in the binding what
future consumer the named lookup is intended for?

