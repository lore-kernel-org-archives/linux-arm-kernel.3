Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE081E9D80D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 19:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHqPIvUN1NOM90NL8c5rYXKR0kCajYGP21DVVOBQKMc=; b=Cs1LWztIISfbOhbXHE9SUSnDvE
	NuwOl6nN+J7kuNf22hmRPSxZFG1KLTEZKaiZ/9s/Zw2/Xj5MsU65fkyINUcHc3NnUdvQBKZCIk/FE
	aLoLB8NmlvHUEm3EsvefYSl0QQ+P/CYSwFUaNho3zK+jJmGAOMgoztYs5LVP80csCFtuTf6w1VB9E
	k3uq4sx83rCiG2wcH3L/KaDm5rrK3TwR7bLfKE8judCXpb8WmCXosXJ3T4Ljkne3Ilc+oZh/GYATH
	ClHOEL98YHNE+xAzMzwj8LPaEwf1pchbUo99gxwlb7AK9jq64bfaPhIE9CZ/DfPtEi+58U1v4uwH4
	6wrWemxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TL2-00000004RFD-2gFF;
	Sun, 05 Apr 2026 19:40:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TKz-00000004REO-2NgB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 19:40:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36C2A6011F;
	Sun,  5 Apr 2026 19:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DC1C116C6;
	Sun,  5 Apr 2026 19:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418047;
	bh=ObHNj4zibVJ0tKh/MEaT8rXw+GnIdyr1ICHQtESxpNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BRMCHTzZDDvcFdb9X6juGFTjEKGpp8GbGt+4HXL1mCVaq9dBcYCEBMSPOPOxB6OUH
	 OKL2i+XXJlV+66bwfgN/g1Am48x3iCRgzgDgjMLBnpGQx6/MERI2k163MuAGEM15Np
	 CEYH0vLaP2HhUXI7RkRazhci6GOLnvQb90jLygiQ1Sjnicikbd7Il6ABelpLvjeMon
	 tIZ+R7X0D1a8KsJ4BiXJ+OUxzgCi9k5sxA3azoYtd2ttv1HXCTiuEpduar/m11HM15
	 whjvFqG8ftvILH4zss4/4iFid7CgWj1U3rqXA6NWQDUwvaYJzbHWPf2/mTULCliPsx
	 CuCidDrjO1WfQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 0/5] Add CCI and imx577 sensor support for Talos evk
Date: Sun,  5 Apr 2026 14:40:26 -0500
Message-ID: <177541802149.2061229.15434639093932679869.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Thu, 05 Mar 2026 17:48:11 +0800, Wenmeng Liu wrote:
> Talos EVK is  based on the Qualcomm SM6150 SoC.
> It lacks a camera sensor in its default configuration.
> This series adds CCI support and enables the IMX577 sensor via CSIPHY1
> through device tree overlay.
> 
> We have tested IMX577 Sensor on CCI1 with following commands:
> - media-ctl -d /dev/media0 --reset
> - media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> - media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> - media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: qcom: talos: Add camss node
      commit: c0b357d5d059812e5b48fab81270d8f4c8f62162
[3/5] arm64: dts: qcom: talos: Add CCI definitions
      commit: 17ba0a3c874684c9ca5a41ddf9f167648b10aad2
[4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
      commit: fd3850cde71f284ca69f70b904df78f561ece103
[5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
      commit: 594be93cdc9dcfec5d10882ed3fccce1e3af9015

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

