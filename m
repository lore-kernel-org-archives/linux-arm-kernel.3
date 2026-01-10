Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761F8D232D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 19:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaEFaN9/kqgW0Yi0l4HF81Td9iWXzu31DifagsxUKM0=; b=X8a8PVBm4XrC1wbU7EjTsyWONk
	rFiuPRzCyvpbfIVcn5cWDJ1eLWI2WwAZEz3XYRLD13NOLxqGqiO5zCpBuZ/c+gw1rfy1o+S5Z9gRP
	dNDXlgZWi0ffv4vvJ4T7SNzPPMQeUiygFoP6e9IeYXKOWKPLw7MX/F22OUglM54eu4r7s+6k79a8L
	7yk9aoRDT+9mr1sNjB/czqaeYOHCagjwxlwnKXjkX4fyyhXkpJwLQIfL5b76VWZ/f+dvMmp3nqJdw
	RDgyKsH0oSQYI0qlO9uHM1udz/c4kaRILpxgBwHgKzm1A+9ZMu8fHOltXN85LxvXUwe7HY2BPHCv2
	7/W4EvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veeN6-00000003cM7-2HUt;
	Sat, 10 Jan 2026 19:11:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veeN5-00000003cLq-0iSB;
	Sat, 10 Jan 2026 19:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D2D260168;
	Sat, 10 Jan 2026 19:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EEFC4CEF1;
	Sat, 10 Jan 2026 19:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072294;
	bh=ifQtDtBDcokzLccqf8aQCht97s3eipcMMEmXbpDw6Aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qCiyrFAU2xicKCibTXPIf3XhBQmk0g6ZWmSgHHXVP1B02QbrV77FWTZFOP1VjWDCw
	 qjMrQb+XKb5f4XadhrY/24Ap8FT4i3zPkyp8Hq83pZ7Qd05yBLYY/SjBLAoBYN1J91
	 tZcXYUR9WCowuaBnwQNH+5l+izoJ34YwXyJn9pNjN9mFqtBAcF6dVgtvosb5DN2PQH
	 UkWDCIMetOEIB1XAkKVOYI7Wkyc0F3Lm5PBO/vh7rnB4GSTP0L4HqCSOjm7fLM7dry
	 DJ/5zv35sUADTSmPEivxJvudoLJxOMiPSlaVLC0wreck+xhcPR7Tw1K+pdiPCNoYJW
	 fAQibqBj2d1ug==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	sophgo@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-actions@lists.infradead.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-mips@vger.kernel.org,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-arm-msm@vger.kernel.org,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Michal Simek <michal.simek@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH 00/27] clk: remove deprecated API divider_round_rate() and friends
Date: Sat, 10 Jan 2026 13:11:17 -0600
Message-ID: <176807228457.3708332.10766520174431957453.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
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


On Thu, 08 Jan 2026 16:16:18 -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.
> 
> Note that when I converted some of these drivers from round_rate to
> determine_rate, this was mistakenly converted to the following in some
> cases:
> 
> [...]

Applied, thanks!

[14/27] clk: qcom: alpha-pll: convert from divider_round_rate() to divider_determine_rate()
        commit: e1f08613e113f02a3ec18c9a7964de97f940acbf
[15/27] clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()
        commit: 35a48f41b63f67c490f3a2a89b042536be67cf0f
[16/27] clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()
        commit: b2f36d675e09299d9aee395c6f83d8a95d4c9441

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

