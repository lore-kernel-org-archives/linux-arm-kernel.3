Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30816D0D167
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuhF89bWBhm7HgJK1LVPoL0NBYmH2Ch8HSY3AUhlEyY=; b=yYq4aLHcnRWOoQmNLCIYS26DwI
	5cOtFlv+5WsBuOTO7eLQ+9pIcR+jlzo/tbt2O3+R1yWdVaHofg+6EeRRtl0Am9MdIolrkLhLF4Mwq
	REfLJGMOhh++wGPZKlPFlsTHHZNFm0X6fJY9fcOYfX4ZBJLXN4rVdWpjyExpMSXQCYhzlY8B4QtjJ
	1WItbIbnzbpOiw5sWFaAOAj0actqZNXp+Hijo4PmS8wlfyr5IZRdYHhIG2d7Xl6DxbcJyqcBhHUKB
	litXwtMT0o4XF+UZrMcJd41iEdSB6c3cDTrxcjGTqA3qFs6IJHD8KOnhe6Wt1kmRRzbTQsr0osLse
	86RHuwNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdYQZ-0000000FUGZ-3BGo;
	Wed, 07 Jan 2026 18:38:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdYQX-0000000FUFR-0lQx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 18:38:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AAA64360E;
	Wed,  7 Jan 2026 18:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92277C4CEF7;
	Wed,  7 Jan 2026 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767811116;
	bh=4gA87dpy4WxHWsQQHfKYdtr3VgTSzDJcgdqZ1ZKqS5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tQVaYSRrv57g3xq+kAmlC19X9l1YrEqk2QaB2GpoZTPFVevg3P3KkXc25r2GpHX8l
	 ZObuwh7UZNmDoOnfmOlnyT/EFy9uhNPFrvrh3w0dG2Zjq+nLl2mYdAK5vL/CgFm2vs
	 ZfuS2TgIGTuZ3VzQC0CfesccxDi7Z9+o45yJzO+JnyUTsgIhEbZLNc58LNsVhYBpUN
	 bPH8qSM7xgULMJQ1KCY9XXYxm3g7Y7CumXp7WvPgip4nMI/pNVyKKTW/0zQUEkVfwb
	 0JWT/LBEYHwITDg2rfoa3IyUD51V6P+R+vMy+9XU5LBNIX5l+wzkZK2+T+v5RTjMcv
	 XuKDvuik7uCsA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v3 00/11] Add support for Multimedia Clock controllers for Kaanapali
Date: Wed,  7 Jan 2026 12:38:22 -0600
Message-ID: <176781109972.3262943.12550481124214869830.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_103837_260385_427398B4 
X-CRM114-Status: GOOD (  11.93  )
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


On Wed, 07 Jan 2026 15:13:03 +0530, Taniya Das wrote:
> Add support for Display clock controller, Video, Camera and GPU
> clock controller for the Qualcomm Kaanapali SoC.
> 
> Changes in v3:
>  - Add RB tag for CAMCC dt-bindings [Krzysztof]
>  - Add more description, commit message for the newly added GX Clock controller
>    for GPUCC dt-bindings. Update the complete region for the controller. [Krzysztof]
>  - Add RB tag for display clock controller [Konrad]
>  - Fix the below for the Video clock controller
> 	- use lowercase for mem_enable/mem_ack reg.
> 	- use GENMASK for mem_enable_ack_mask.
> 	- fix the indentation issue.
> 	- update to use regmap_set_bits().
>  - Fix the below for gx clock controller
> 	- update offset for gdsc as per new mapping
> 	- update regmap_config as per new mapping
>  - Link to v2: https://lore.kernel.org/lkml/20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[01/11] clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
        commit: 0f85ef379064b50ad573c6af4c0ffd39673f6968
[02/11] clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
        commit: 6d3e77facbce8e684321d9ba65137a76f2575372
[03/11] clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL
        commit: a419f7bfb714703b9c12fab387b60cb0e0f7ec47
[08/11] clk: qcom: dispcc: Add support for display clock controller Kaanapali
        commit: 6c6750b7061ca5b12deaeb246439b5b64a84f9c1
[09/11] clk: qcom: camcc: Add support for camera clock controller for Kaanapali
        commit: 92aae35f667cd62359f5938e3259dc72e080e28c
[10/11] clk: qcom: Add support for VideoCC driver for Kaanapali
        commit: a4ceaf4b18dd4310c17852efbf880e1c5cd5dc36
[11/11] clk: qcom: Add support for GPUCC and GXCLK for Kaanapali
        commit: 685ec348339b118bec728458d0bc3b3e7da1ef0d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

