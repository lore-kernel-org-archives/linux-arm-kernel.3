Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E37BD49798
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 04:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziJcEdQxYlA7VHnSqwLv06sEi+hud0nsFKfCy41XiYQ=; b=eKeMi8X5cTB4X5Iy7A1ra/IMbV
	s0umhrq+FgDBLrvFziRxH9D7D5/FG4IVjmSZ1MmFyFNUlvL6tapsmdDmeXPBkjPyvCghBqdfdEYaK
	v0IjStKwi/SzpOOe7wCanHtF0vwt4cv8tY8TnMxKHFPro+LCivzDSatHd0FY6giDw5fBzUzAhZmON
	gJehzvGB4iHbxdRKi9Budz4M8c5r4QnHACeytsA8l6HwPEy4gebIXzZmrrBkZQDSMkDgq+iAmThQE
	VC8HM3WhkTnRlUxrtZZ9g2uNoCo//nn+3bHjNsTjzbs6vEpo9fnj4hnYPxX4hwcuPG5RSVk8koKhJ
	ty9gRg2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHy1K-0000000521B-487Z;
	Mon, 02 Dec 2024 04:26:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHxzi-000000051py-3QlE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 04:25:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99C855C56F4;
	Mon,  2 Dec 2024 04:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09D7C4CED2;
	Mon,  2 Dec 2024 04:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733113509;
	bh=gVP2RgkU37e0c+u2ZX03ORwYou3pnmMTnEi3FVfrRMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sMCcKlXgUyjtqA2EguoYMnEtieCmHkXduMayY0vZohKm0hu5VGgBJ1uVFGmLZjMvg
	 Wfg1agFf0Z0lEGHWREmKRV2WumpXHfAJBkbYqMUqiWs1N8BzQIoJK1pY88HckXRwyo
	 zgUugNrp1ZlkVHulVQlvLj355KNY+CIqsGgAT75+p6ysDDZtEPWuzJNvt6xuPeikiC
	 qMJu3mUOJaWl/eFQRcW+F4kY4XmD1jPGDDt/Eiuw0xJ73g2oVmMneLd2v9Yj9yXuY5
	 RSQQ5AnUWELZVrNJflN3S4hXosh7Ln5wPVFinuKf4S/ocasCkgq9JPsYfs5sbc26q8
	 574XwHkNCJ9Rg==
Date: Sun, 1 Dec 2024 22:25:05 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Gabor Juhos <j4g8y7@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 00/11] Add support for videocc, camcc, dispcc and
 gpucc on Qualcomm QCS615 platform
Message-ID: <a4f6ojknv3hats4rwmdg5mw2rxhx7kq4u6axybdawak54crn5s@xnjbl7zno42s>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_202510_950901_F61B34F8 
X-CRM114-Status: GOOD (  17.08  )
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

On Fri, Nov 08, 2024 at 09:39:17AM +0530, Taniya Das wrote:
> Add support for multimedia clock controllers on Qualcomm QCS615 platform.
> Update the defconfig to enable these clock controllers.
> 
> Global clock controller support
> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

Dropping this series from my queue, due to lack of response from author.

Taniya, please answer questions/feedback from Dmitry, Vladimir and
Bryan, and repose as necessary.

Thanks,
Bjorn

> ---
> Changes in v3:
> - update PLL configs to use BIT and GENMASK for vco_val and vco_mask for all CCs [Bryan O'Donoghue]
> - Link to v2: https://lore.kernel.org/r/20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com
> 
> Changes in v2:
> - cleanups in clk_alpha_pll_slew_update and clk_alpha_pll_slew_enable functions [Christophe]
> - update PLL configs for "vco_val = 0x0" shift(20)  [Bryan O'Donoghue]
> - update PLL configs to use lower case for L value  [Dmitry]
> - Link parents for IFE/IPE/BPS GDSCs as Titan Top GDSC [Bryan O'Donoghue, Dmitry]
> - Remove DT_BI_TCXO_AO from camcc-qcs615           [Dmitry]
> - Remove HW_CTRL_TRIGGER from camcc-qcs615         [Bryan O'Donoghue]
> - Update platform name for default configuration   [Dmitry]
> - Link to v1: https://lore.kernel.org/r/20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com
> 
> ---
> Taniya Das (11):
>       clk: qcom: Update the support for alpha mode configuration
>       clk: qcom: clk-alpha-pll: Add support for dynamic update for slewing PLLs
>       dt-bindings: clock: Add Qualcomm QCS615 Camera clock controller
>       clk: qcom: camcc-qcs615: Add QCS615 camera clock controller driver
>       dt-bindings: clock: Add Qualcomm QCS615 Display clock controller
>       clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver
>       dt-bindings: clock: Add Qualcomm QCS615 Graphics clock controller
>       clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
>       dt-bindings: clock: Add Qualcomm QCS615 Video clock controller
>       clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
>       arm64: defconfig: Enable QCS615 clock controllers
> 
>  .../bindings/clock/qcom,qcs615-camcc.yaml          |   60 +
>  .../bindings/clock/qcom,qcs615-dispcc.yaml         |   73 +
>  .../bindings/clock/qcom,qcs615-gpucc.yaml          |   66 +
>  .../bindings/clock/qcom,qcs615-videocc.yaml        |   64 +
>  arch/arm64/configs/defconfig                       |    4 +
>  drivers/clk/qcom/Kconfig                           |   35 +
>  drivers/clk/qcom/Makefile                          |    4 +
>  drivers/clk/qcom/camcc-qcs615.c                    | 1591 ++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.c                   |  172 +++
>  drivers/clk/qcom/clk-alpha-pll.h                   |    1 +
>  drivers/clk/qcom/dispcc-qcs615.c                   |  786 ++++++++++
>  drivers/clk/qcom/gpucc-qcs615.c                    |  525 +++++++
>  drivers/clk/qcom/videocc-qcs615.c                  |  332 ++++
>  include/dt-bindings/clock/qcom,qcs615-camcc.h      |  110 ++
>  include/dt-bindings/clock/qcom,qcs615-dispcc.h     |   52 +
>  include/dt-bindings/clock/qcom,qcs615-gpucc.h      |   39 +
>  include/dt-bindings/clock/qcom,qcs615-videocc.h    |   30 +
>  17 files changed, 3944 insertions(+)
> ---
> base-commit: 15e7d45e786a62a211dd0098fee7c57f84f8c681
> change-id: 20241016-qcs615-mm-clockcontroller-cff9aea7a006
> 
> Best regards,
> -- 
> Taniya Das <quic_tdas@quicinc.com>
> 

