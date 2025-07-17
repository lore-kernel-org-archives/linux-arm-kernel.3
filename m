Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF584C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 04:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRBDeYFpXHkPkQvfQURXYTu0y0RRAtbTjpADZ0LpoJs=; b=EEs2L5REcbvNolb3afY+UCgw9x
	cw8jMbc5nKehUkaifzsqV8o4hmkvn29EjCuw7ZEMc9r9ScGHNlZuJFSZyj4D/51+UB6uL3nRJ7xpE
	E7XXCYrHBK9bawIsuweNeNNGsb680mYHxI5v5rCcXF2drYPlDgEtnpP2uVb6BcAA6FG4DodyPuOWh
	wkfrgB6x5mhve++jx8wXmsoCJyQ+tYpFuzEN6AeA6F3iag5kI8DspwP0xm7GDO66pOJ78MSPgav0l
	qWPccsvFYqVt3tR7lqV71F5xmW2jIm4/vnhEfjQSLWnf4strrgJdD2/NvjphwN/56DznYdQEra14E
	RATWs9Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucGQp-00000009BxJ-49cU;
	Thu, 17 Jul 2025 04:41:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucGHW-00000009AjA-2p3u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 04:31:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3949043988;
	Thu, 17 Jul 2025 04:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F589C4CEED;
	Thu, 17 Jul 2025 04:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726700;
	bh=qENoYhA1g4akZdId0NkSg19NP8Al2V4G59lneQ1JC04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M+wCNfQuRa9NoHZoLI2b+Ld3ETiIagnAIGSPlyPbBR3o6V+UbpZF4m+q2iJyTAwkF
	 3y40ETt7Cyi1cBEtooA1dEHvv+1rQBsbBQY+I7BQXLgMuaWGSDeG3n+4zXPyMhjScq
	 yjmHHsu3n7hPrDnQvhS4QckKza32eVeKQbfu2vTiOFClZZX4w0re4/UqJrsdEurhC/
	 9NOP/WgocUfcRt3/6tdaSIxFXFwFdxSDmIb5040ZHRegy+ajCeVfWsE0Wyeko+Y06M
	 xeQPllbTkq/5Q9u/NzrTq44PeEQ8JfB7RrSdCzgC0QZk39ipHj6x1XdnkFUkRORe/b
	 LGfYUHvgGu/yA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: (subset) [PATCH v11 00/10] Add support for videocc, camcc, dispcc and gpucc on Qualcomm QCS615 platform
Date: Wed, 16 Jul 2025 23:31:11 -0500
Message-ID: <175272667148.130869.4243317040220963660.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
References: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_213142_749281_9C1625AC 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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


On Wed, 02 Jul 2025 14:34:20 +0530, Taniya Das wrote:
> Add support for multimedia clock controllers on Qualcomm QCS615 platform.
> Update the defconfig to enable these clock controllers.
> 
> Changes in v11:
> - Add a new reusable helper function to extract PLL_L_VAL, PLL_ALPHA_VAL and
>   PLL_USER_CTL / PLL_VCO_MASK [Dmitry]
> - Add static to fix bot error in gpucc
> - Link to v10: https://lore.kernel.org/r/20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com
> 
> [...]

Applied, thanks!

[01/10] clk: qcom: clk-alpha-pll: Add support for dynamic update for slewing PLLs
        commit: 48d2c6dec1c46460ee7028915595d49a644e8a77
[02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera clock controller
        commit: 8df29649903c067138180ef89f315b6f166b8732
[03/10] clk: qcom: camcc-qcs615: Add QCS615 camera clock controller driver
        commit: 28bc422939540b37eeaa11dd9c0fb412caaaca27
[04/10] dt-bindings: clock: Add Qualcomm QCS615 Display clock controller
        commit: 8b1750ea009f2774a3acd6c7bc9e61b5157101d1
[05/10] clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver
        commit: 9b47105f5434707eab065f65e7d35c62a51179f8
[06/10] dt-bindings: clock: Add Qualcomm QCS615 Graphics clock controller
        commit: 3590dfbdd1b3e4ceba0b7daed2a396f644c277c4
[07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
        commit: f4b5b40805ab116aad57ee7042359f97d065bd70
[08/10] dt-bindings: clock: Add Qualcomm QCS615 Video clock controller
        commit: 9c51c66c997cae09c12ec250a9f538c0c23d8930
[09/10] clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
        commit: f6a8abe0cc16c44eda30712a8922261363d6d3ac

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

