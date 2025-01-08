Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC41E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 04:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xQtSJggtKVY/BCzLhw3eCeAVKbrUbk5h2p9CiTXI9k=; b=KsxX8brTo5C01c+X2l05Tii+Xr
	mBI74Ac+2wgdciy94clbRYbDKwq0HZJm5zXmx00BD2WL1oyG5ybRjzMBbwhMMEGRpGJ9WPviEupRl
	MqEl3WB6vDQfCwJjF8TrF1TPTgDc41+40xjYSH0G+f2CZ+VSBFeUtSfeUGKMrn0/MZHKpdgcB6K9D
	VfBNVeG/CwDYC9bKFTj5LBfS9+pO/JO2IwE4yoirDVRTk4KslHga7mHYtNT/ER5YZUNUx6+8+gGP/
	FGRzxuSRj9aNI5q3RW6ThE0+RJtELyK1uKc02Dhdf8icIspSqK+zxiC7dJG5N0m189N9XK+qSf8wl
	18ep05Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVNyj-000000078V5-1Trb;
	Wed, 08 Jan 2025 04:47:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVNvE-000000077wN-16uz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 04:44:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CF24CA403EE;
	Wed,  8 Jan 2025 04:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88207C4CEE0;
	Wed,  8 Jan 2025 04:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736311439;
	bh=36ms4CYMKb/pnrih3Z2etPkGz7WnBHowpU5ewuBqfYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I4NG0S0gX0VQVyZahsaoKb1VplzrZ2UelxGPw/VIgWu/VDdgFwcDMbPpxIvqkujT9
	 l6QRlthj7vxiKx5FuzDX8w3IbaihM6ICxVpui0+LYhU1rqvd5bLrDj/adFlcMdvXgT
	 66ASxLeAlLP+AywURD7sY4WtxuVBAykMTYMI1TZG8BAU5D4mPIA8lRnWCRmK4YlZiV
	 7GMbbMoRWH3egw7YVlCJ0FvtcndRkP+ObQ3RU6U3NAPzQVAVE5Hds6iRAdwb049mue
	 OYjxBBO6wuQMu9isSvlG9B2AUFJP52hv1ixoOGEbKaJtHnd45ZTQEVrt9MexHSC83S
	 px+nO3eFMspeQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luo Jie <quic_luoj@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	quic_kkumarcs@quicinc.com,
	quic_suruchia@quicinc.com,
	quic_pavir@quicinc.com,
	quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com,
	bartosz.golaszewski@linaro.org,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v8 0/5] Add CMN PLL clock controller driver for IPQ9574
Date: Tue,  7 Jan 2025 22:43:46 -0600
Message-ID: <173631142079.110881.10241987285937979220.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
References: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_204400_365648_6953FFFC 
X-CRM114-Status: UNSURE (   9.61  )
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


On Fri, 03 Jan 2025 15:31:33 +0800, Luo Jie wrote:
> The CMN PLL clock controller in Qualcomm IPQ chipsets provides
> the clocks to the networking hardware blocks that are internal
> or external to the SoC, and to the GCC. This driver configures
> the CMN PLL clock controller to enable the output clocks. The
> networking blocks include the internal blocks such as PPE
> (Packet Process Engine) and PCS blocks, and external hardware
> such as Ethernet PHY or switch. The CMN PLL block also outputs
> fixed rate clocks to GCC, such as 24 MHZ as XO clock and 32 KHZ
> as sleep clock supplied to GCC.
> 
> [...]

Applied, thanks!

[3/5] arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock controller
      commit: 1fe6c70fec8fd8c823afee66467f85f028b0d22c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

