Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C868C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 02:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AV1TIQjxINvouSRyWKbYLn9NoKy3fg/lJDSNDUYdslc=; b=umoLGzYdPVOdskI9oq6AAFk5Mu
	2x5h1d6j03KUh2VphEyUgRReQb0U2N+99pr4P4RQuPcF8Gy2KSwXIagnbIO7PmStHPC7/ODN5EZcb
	tdUDqPAunhNGLVz+NgnV3fD6GYfLoQwiW0H/YgfV6FeMy857RDIgOvHO3xJJrEnnWBxwJBnfBibgG
	10l0kvEYFFilPtn7s7aEHZhkjMfEWcTcpwiLRVZwNU8FXyhucDi9bNwJjPV+qBmcKWscnOr+V3MDf
	VVjkbiUw+CjamIKPhp78BWc6xYqrnVMgtsCAiJJdJCgXtWeDtWjDsFmgB6rMGNDNpjXI2/19LRlon
	Bigc9/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2hqo-000000093WV-3ZNC;
	Thu, 10 Apr 2025 02:41:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2hoA-000000093Cv-2Hev;
	Thu, 10 Apr 2025 02:38:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F2C476112C;
	Thu, 10 Apr 2025 02:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF99C4CEE2;
	Thu, 10 Apr 2025 02:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744252705;
	bh=paI2iYkqHH9JNN2Kzhxw10YZ5U6tiwmffxf7SjfF7ZM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kJWEVjiol+oAz565mJrlnO0DmB4RDnil7BM5NMSBfi3jLuBwelpAC6x6VE3plgt6+
	 /wqJnlJprj9vCYtXwFh/HjIDfoZJVf73EJB6pP6ahLQbP76zp83aH7YlB1dX7nlia8
	 T3zG5mPKU0R5gTQoNP7AwO3aicL1yjFW71wCmjSjWetNTbB7OAQH1syDNM2EK0YSwI
	 lYFMLV9PPS3iHPBDYPFgGgoDkkGu8NgEhs7xxbmY72EtQ/TRdeIOh0s03zNwVXBzsH
	 1u4SBbH2kij/4Vmpl3AhGVLkENexdAudjITCMR93UWTnAp9GFuRb0+QZWUTvp2U4jD
	 AIcv0NFZpaCAw==
Date: Wed, 09 Apr 2025 21:38:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Will Deacon <will@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-arm-msm@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 linux-usb@vger.kernel.org
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
In-Reply-To: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
Message-Id: <174425260896.2271002.12988489456571693265.robh@kernel.org>
Subject: Re: [PATCH v4 00/10] phy: qcom: Introduce USB support for SM8750
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


On Wed, 09 Apr 2025 10:48:11 -0700, Melody Olvera wrote:
> Add support for the PHYs and controllers used for USB on SM8750 SoCs.
> 
> ---
> Changes in v4:
> - Made some fixups to the M31 eUSB2 driver
> - Moved TCSR refclk_en to the QMP PHY DT node
> - Link to v3: https://lore.kernel.org/r/20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com
> 
> Changes in v3:
> - Split platform DTs into separate commits.
> - Fixed up M31 eUSB2 PHY driver with feedback received.
> - Reordered DT properties based on feedback.
> - Rewrote commit message for enabling EUSB driver.
> - Link to v2: https://lore.kernel.org/r/20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com
> 
> Changes in v2:
> - Added new QMP PHY register definitions for v8 based QMP phys.
> - Made changes to clean up some code in the M31 eUSB2 PHY driver based
> on feedback received.
> - Added bulk regulator operations in M31 eUSB2 PHY, to ensure that
> both the vdd and vdda12 regulators are properly voted for.
> - Removed external references to other dt bindings in M31 example for
> the DT bindings change.
> - Split DT patches between SoC and plaform changes, as well as the
> PHY subsystem Kconfig changes when introducing the M31 eUSB2 PHY.
> - Added orientation switch and port definitions in the DT changes.EDITME: describe what is new in this series revision.
> - Link to v1: https://lore.kernel.org/r/20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com
> 
> ---
> Melody Olvera (1):
>       arm64: defconfig: Add M31 eUSB2 PHY config for SM8750
> 
> Wesley Cheng (9):
>       dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8750 to QMP PHY
>       dt-bindings: phy: Add the M31 based eUSB2 PHY bindings
>       dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
>       phy: qcom: qmp-combo: Add new PHY sequences for SM8750
>       phy: qcom: Update description for QCOM based eUSB2 repeater
>       phy: qcom: Add M31 based eUSB2 PHY driver
>       arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
>       arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
>       arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform
> 
>  .../bindings/phy/qcom,m31-eusb2-phy.yaml           |  79 +++++
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   2 +
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         |   3 +
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  24 ++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  24 ++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi               | 164 +++++++++++
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/phy/qualcomm/Kconfig                       |  16 +-
>  drivers/phy/qualcomm/Makefile                      |   1 +
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c          | 325 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 223 +++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  16 files changed, 1065 insertions(+), 4 deletions(-)
> ---
> base-commit: 46086739de22d72319e37c37a134d32db52e1c5c
> change-id: 20241223-sm8750_usb_master-f27aed7f6d40
> 
> Best regards,
> --
> Melody Olvera <melody.olvera@oss.qualcomm.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 46086739de22d72319e37c37a134d32db52e1c5c

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clock-names: ['cfg_noc', 'core', 'iface', 'sleep', 'mock_utmi'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clocks: [[35, 11], [35, 156], [35, 3], [35, 161], [35, 158]] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clock-names: ['cfg_noc', 'core', 'iface', 'sleep', 'mock_utmi'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clocks: [[35, 11], [35, 156], [35, 3], [35, 161], [35, 158]] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#






