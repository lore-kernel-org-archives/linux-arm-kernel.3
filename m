Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB04D40D08
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 00:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVR0eKtkvKn+O7PuPpZJuPLEegLJ2J6Z1/EPd7BVU4I=; b=FUCl8kPMXevjPkTO46XMtTqyHG
	IMAXHnx15C/a9O2GHNopPxFmdSwT8kkH5M8EOUaCKQJhnaqud358E9MZEjIrn4NB2aNwtnz+DK8NE
	gtU4k3UCs06h3qrRaTPHxaiINpzyQa95vOGb0pqhS8EwgVNUw2BCQOrfyTpjuBdaWNjNrrGBgk8sz
	1evQ2M2usLfu9MTwePAJyrd6Wog632uShro3jPbOD/oLMq0LGHtrgGIpVkC4jBwDFqUMexYP2xJOg
	SGeAbuOq2G4h0SyWPNcYWVrd3XgExgOGoPeefU3cJR5jnceoSDvVwdf1cObSle9+4ki3T8Vn8HfbQ
	QbqzE/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8UKo-00000001FOi-1HIL;
	Wed, 06 Nov 2024 00:55:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8UJ5-00000001F1h-00et
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 00:54:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C4795C57AA;
	Wed,  6 Nov 2024 00:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2EFC4CEDD;
	Wed,  6 Nov 2024 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730854437;
	bh=HPTg6F0AYPQEIKZS8GnAFmra5qXWz8AKMhVZCHGPW+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b9v0zHsQjN2hTRx2yrCy/4HS7d/jSxBpi8f/++f2qyq8D2UDYx3LrwDutMiLlTqlO
	 q64b/Waq2CuLIhuHRS0m5eBc8UKnn0scn7a+5owraAIWwHPgRR3dsiY82q3NNdcyI4
	 +rozCJzGgdOWevZGIWt+1PKNCCYlUbl5G/4yi74sxmJ93CEkhOr87SxDSP1CDgv1wZ
	 sMByjejW+ec0YjFUG2x3U0HQrzPJOfThz0ApvJCtZ1wx4jO65RpkSZFwHL4xD+LeAc
	 Zl7nth9qpixByJW306xgur9vTAyScFsNPQDSuHdK8Ytdbks2UdgkwVbbz3D/ZY3Vxo
	 tO1roa2FTWnZw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	ulf.hansson@linaro.org,
	linus.walleij@linaro.org,
	catalin.marinas@arm.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sricharan R <quic_srichara@quicinc.com>
Cc: quic_varada@quicinc.com
Subject: Re: (subset) [PATCH V5 0/6] Add minimal boot support for IPQ5424
Date: Tue,  5 Nov 2024 16:53:49 -0800
Message-ID: <173085441672.26510.12002868497417768812.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028060506.246606-1-quic_srichara@quicinc.com>
References: <20241028060506.246606-1-quic_srichara@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_165359_296509_100A5BAF 
X-CRM114-Status: UNSURE (   8.22  )
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


On Mon, 28 Oct 2024 11:35:00 +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> The IPQ5424 is Qualcomm's 802.11be SoC for Routers, Gateways and
> Access Points.
> 
> This series adds minimal board boot support for ipq5424-rdp466 board.
> 
> [...]

Applied, thanks!

[6/6] arm64: defconfig: Enable IPQ5424 RDP466 base configs
      commit: fd516bb4f48fc527744cae42d8e156fb09bce157

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

