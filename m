Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81ADE9D80D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOtc/bNR+1D0kmq5Zl8YoqhLYvnM38viroIsMbPI0cY=; b=MegeoaF4mGsKcjJBkef059faGb
	DQg2DsJQvXybrx3mBxunc/eZ9F2NkH5lrD1CSiZf356FLBpFj+7fPgPo2v4qFHcePofGmpG3iX996
	WcdB3Qi4zw4lqOwM6MfUn0WDKLebgr9u2ZlVowwnqYJdc+mm2lQwMfEVPLPRHHNwYW9X1eoAEd2+h
	6656B1fkrSoK/Gb/cARi39hH1V+Ap+YbCBE3DjdmH4sWHpbXflDNXU5yeJfxGPvKonmgdhuCoUzzy
	4+jU9jn3hvExWc0d8rN7C63k4UKdsWwxYCaouMDJM/ICZY6Pyq8EqxkazVuBkZ+7diwOfa/vhk919
	ApZygdLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TKu-00000004RDn-1Owo;
	Sun, 05 Apr 2026 19:40:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TKr-00000004RDT-2Yu8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 19:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 090844454F;
	Sun,  5 Apr 2026 19:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34AA8C116C6;
	Sun,  5 Apr 2026 19:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418039;
	bh=F6qst3LBccqfafD86O3ZKGJti3SyNgdle+pCAPtzzro=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YHHUdqlvUxvqgbqpHgiHnOJxb/bBwCTy+Ye+xBX4NLO67OqGfmJilzzO37Xi+Dk35
	 FHELVBf4Ck80uqRyeWe020nsBrRGMkn/B8IAfc63ZqfPBJkz6q02PB28eBNxcMLRqC
	 r+xZAWg8UXHoWJnqFlGIeQTGB2CBDNakP4i331W4Uwk8zXKaCorpIJ0PW6KpnEIB2Q
	 FWUggyW2SZpi4oW3rY9EVn9YSsSsgI+1cMheIJbPKwnk6Gn19Ly/nJk8RDcZoICbQX
	 Tz0KheAsRVfWnYiPCKMMHwYuEpZ4kwTDCTJj2Tw7wAYz8HFujZVjIBZBlFTwoC5GTT
	 LbwInDF4FQo7g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
Date: Sun,  5 Apr 2026 14:40:19 -0500
Message-ID: <177541802158.2061229.7249314871905290258.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_124041_668593_FFCF1D01 
X-CRM114-Status: UNSURE (   8.70  )
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


On Tue, 31 Mar 2026 11:17:22 +0200, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' contains probe match-like data
> and is not modified: neither by the driver defining it nor by common.c
> code using it.
> 
> Make it const for code safety and code readability.
> 
> 
> [...]

Applied, thanks!

[2/2] clk: qcom: Constify list of critical CBCR registers
      commit: 87df31ea43eef5f6b9e7be0fa2555e58a9455e05

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

