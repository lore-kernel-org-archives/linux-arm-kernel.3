Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705EEC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbzK7k9QqNd/yiKuq9Uo1D7PrRgwqev/pKrzCFbaHjE=; b=bzqD/cIZtu9v+Wby4cVauQP0tT
	mwtfvQ6wFypMMod+nTqnvzqsd+4GW56JeDDQe0S6k6DFZ9HJqIsA7R5/ggSibmNUH8GVzXkyhwpLM
	ZkPZ89+73VS8PbEAMA++IL6G9p4mL3quFP6afG35NLb4eyFee2Dr0VlM6hNAPYCOqq1hBNyANO7ip
	sMRyULTGvLwFy6Y30ef6dZ1KTPqxkMP6m9itqwH44U++OwLn1EpqrGmDc63P/ob46fgtQKbgcqRmV
	mr8KR1BYmqRMBnoWzBvJEtBdvf9aEeGgqsbQYkhXOIl5+Z/HxA2YY6nLxjTlfdDc0LAwMZSHRTFpd
	L/dK9RGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV0r-0000000CelU-3BqG;
	Mon, 10 Aug 2026 18:46:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV0o-0000000CelH-2HtO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:46:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A772160A7E;
	Mon, 10 Aug 2026 18:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582031F00ACA;
	Mon, 10 Aug 2026 18:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387573;
	bh=MbzK7k9QqNd/yiKuq9Uo1D7PrRgwqev/pKrzCFbaHjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KJbV+zX6LgGnu0vNiF5rn2l1Z0D7qtzg0gfBPsEiQNbrxUBEkSseedTSfgOmLDdRI
	 rA2to5E3ZethCmhrnquErtIR41+QkLTrL8Muh2U8cb7GtgyQpsJe1sF0yWS01u32D/
	 j+GwY/HhdSEcsm+VloVOPV4/gPSMt/Bcwohe21lFKOG3K+qg14TMzwmz3W7BDr5aFB
	 /kJtSbGv9yf5Ika+PEnzfwhKJ5lod0/Ud58MqQfrzYX4JgB+LHMeuILpYN8pWu2Cnr
	 Lkq8ao+7zxKzUvRSAbQRtZvunDMXvy+bipMKHvPxsm+EGF+fqUiOCzTHWa7WG8OSP9
	 XMtyyEymIVAAA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Fix camera rivian PLL configuration settings
Date: Mon, 10 Aug 2026 13:45:58 -0500
Message-ID: <178638756042.656675.10550174478318858559.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
References: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
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


On Sat, 01 Aug 2026 01:15:07 +0530, Jagadeesh Kona wrote:
> clk_alpha_pll_write_config() in the PLL configure function skips writes
> to PLL registers when the configured value is 0. However, hardware
> requires USER_CTL_U and CONFIG_CTL_U2 to be explicitly programmed to 0
> for a few rivian PLLs.
> 
> Add a clk_regs_configure() callback to ensure these rivian PLL registers
> are correctly initialized on Glymur, SM8750, and Kaanapali platforms.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: Fix camera rivian PLL configuration settings
      commit: c4b84911eac4493f7b6639cb9d109a768f1dd4af

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

