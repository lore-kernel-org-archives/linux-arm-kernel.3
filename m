Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A197DCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA8LUWW3PtjcaCrXtbh0vfqqPBEJbVf3BoVC5KmmLFM=; b=cOF47KINHu2+c8XIfLlPQ4btre
	aqLtyQf8TunlsziiBYtK5eh0sEMIzloBldG3xozv50Zz5sCzMw5y9YkfKFWy7nfuWAevowo2fkDB6
	KWdasoKQZeJCPScAvcNdtV9B6aruzU4Oj4392lYbbsx8LBBahktmmjNK7rG5dRgDAx9hTDuD7fOEo
	trhzdhbpHs/RNA3UrTKx6AcCKOnmCnpPZSpKZN7RXTYxU1/y9y9Lv8KonOcunq2K0JMvYhs/f35jD
	GmrRPf+VukHEmnvrV116oquTIC2UBEBRLvY3MkC4+AEhkhWPVy30CXeMtcm9bMYsUgyAvzfx7Oewu
	grpBz1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOJt-00000002Bff-1QaW;
	Tue, 29 Sep 2026 03:15:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOJr-00000002BfW-27L2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:15:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7682B60136;
	Tue, 29 Sep 2026 03:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3D61F0089A;
	Tue, 29 Sep 2026 03:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651750;
	bh=hA8LUWW3PtjcaCrXtbh0vfqqPBEJbVf3BoVC5KmmLFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kudCjqJPceZR1C78VsRk7LleDgpsvmIV24SIVD3dZ+wRgnFekpOwTu3Ur6hD3TZUd
	 RiAxVuFsCVuuG19DT6Q/cSbsVBP3BP9gA3NyEk+b2/gOl2/FkUPg6Vgc/CoiML7v8o
	 U/7wJWokF6KAHW/eKkthRCq1CD6g5tMcoVQhAZTHet3B6qTuK9BCQQhI0vMpFzTvWG
	 3RSwc29tGg3KSVPJV+lyWFRg01s6iJerS4gBll85LACInhk62twOkIa9tlQRY6RoKJ
	 VSaDNXjJaWz7CFyG7PCEqpFVxa23LFPNdqWqXeKOzVcrsix5gBWJsi0LXPu/Rn7Y1D
	 YjG/clYMbBOVw==
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
Date: Mon, 28 Sep 2026 22:14:47 -0500
Message-ID: <179065170918.2673486.12337942031233081331.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
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
      commit: 3b651d946ebb756f922bed8a213919af17f58f43

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

