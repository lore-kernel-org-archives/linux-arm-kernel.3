Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B586EC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0suWZmid69z3Dxw/Nap5+NuCTorkUAfISmxhfandT0A=; b=jm7VzJpSB57tg1iQFLpIHotZq1
	pIT+oPAzjCsRh5O5J6PpGeF0SYoGEjl4UXyre1XzFSt6SuvVLmbxqXNMnF8hapdUwIHKthebYS9SZ
	FgaM3KXscELtnXOZU1Qsxij6q3Q6qiVDMsDFg6YfKW9z24BKAswZmHkbMY/0+KRwEKp/nphj3TL4E
	KjPrXr/GSzRu4txVm7k2TlcrVW6hKbYyq6nOkaj53VJ4OrkmrPcSi3EuAa5do0T1VqhY03NCtSdHt
	SsyjEtTf3Q46tYtsMG2d/77ey2qPrNBt6LQl8rCV8HMoN+T/2zUfhiWFTnQi9knH7uIfqjdvoVHrW
	IwxCfN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5zA-000000017FX-0zKL;
	Thu, 22 May 2025 13:29:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI5x8-000000016v6-2EFC;
	Thu, 22 May 2025 13:27:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CDB562A41;
	Thu, 22 May 2025 13:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41359C4CEE4;
	Thu, 22 May 2025 13:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747920437;
	bh=HCEjzAxEoNpGh9RhZKRmEp/YfkDRMjOx87EArtdY46E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HX8/fEVnJvd/yp+XvMm6fuoT2Be58dmLXfJr8hgrabR73FFcNigPFKdn+c3GtPvVq
	 6okjJznCebd8m4O8UJyXi0mht1LUzLR72gd8OH1y0nAmyd/xiRdMcA9XmFzf32q6tV
	 jIO8+Kp5rGT0S4VgtqsRPW7Hv8I0SljmLnNh5oLnpbHkNsvBQ38Jbe0HXa9NAa1Qhl
	 eHtLZtobi80OWuumLi4g3zf2jPDyKEVkacw+YhuM5AZEHlSGxToAC+qIdECIxH6+bY
	 3uHtIFk8lKy3sIDLZmA5C4nOnaYjcrbWWWny0shY57JnjSnmb3za+qk148NsSsDTuH
	 HY+tZN2kfneWQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uI5x4-000000003QS-1Ibp;
	Thu, 22 May 2025 15:27:14 +0200
Date: Thu, 22 May 2025 15:27:14 +0200
From: Johan Hovold <johan@kernel.org>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@linaro.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <aC8mMiw2o3MRmBtm@hovoldconsulting.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
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

On Mon, Apr 21, 2025 at 03:00:13PM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> sequences to bring it out of reset and into an operational state.  This
> differs to the M31 USB driver, in that the M31 eUSB2 driver will
> require a connection to an eUSB2 repeater.  This PHY driver will handle
> the initialization of the associated eUSB2 repeater when required.

> +static int m31eusb2_phy_init(struct phy *uphy)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +	const struct m31_eusb2_priv_data *data = phy->data;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(M31_EUSB_NUM_VREGS, phy->vregs);
> +	if (ret) {
> +		dev_err(&uphy->dev, "failed to enable regulator, %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = phy_init(phy->repeater);
> +	if (ret) {
> +		dev_err(&uphy->dev, "repeater init failed. %d\n", ret);
> +		goto disable_vreg;
> +	}

> +static int m31eusb2_phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	const struct m31_eusb2_priv_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct m31eusb2_phy *phy;
> +	int ret;
> +
> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;

> +	phy->phy = devm_phy_create(dev, NULL, &m31eusb2_phy_gen_ops);
> +	if (IS_ERR(phy->phy))
> +		return dev_err_probe(dev, PTR_ERR(phy->phy),
> +				     "failed to create phy\n");
> +
> +	ret = devm_regulator_bulk_get_const(dev, M31_EUSB_NUM_VREGS,
> +					    m31_eusb_phy_vregs, &phy->vregs);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				"failed to get regulator supplies\n");
> +
> +	phy_set_drvdata(phy->phy, phy);
> +
> +	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	if (IS_ERR(phy->repeater))
> +		return dev_err_probe(dev, PTR_ERR(phy->repeater),
> +				     "failed to get repeater\n");

Requesting the repeater PHY like this and managing it from the PHY ops
currently breaks lockdep as I've previously reported here:

	https://lore.kernel.org/lkml/ZnpoAVGJMG4Zu-Jw@hovoldconsulting.com/

I don't think we should merge this until that issue has been resolved as
it leaves us with an increasing number of (Qualcomm) SoCs where lockdep
cannot be used, which risks introducing further locking bugs without
anyone noticing.

Johan

