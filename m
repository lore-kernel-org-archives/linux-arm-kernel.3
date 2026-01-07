Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EBCD0D168
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXeevR2UaTG44xNQSoZ0T+KZIWK8KrLh9KmrPdzbWMo=; b=s7KpMvSCvpkWF7ArB5ErlZDYPu
	DhNZr7XVZAL+HtH6Ixfi3stjxAjChPxlFAmaaO3orWzTXwDziCB6ExR+crgMNzb7QvjA35Z3R+eKF
	y0l2nRrFFoPebszR7lXGjTuJD6PxuNR4MeZWZgdipNTsYotisp7Ggk5p2AbluQhQ4bUztCOLMJwtm
	gIvRkkuC56u2BxHQ92A1VTTzaj50HPfMoLSleiPSqtmIgFkrMbOFfCpVwZlrOtI/o0qU657sztyNf
	JtTP2dXCkdxSeIfSVOhhj6Ao432UE3LM5KkOa3o5FcFzsDs7sM2MXWJwKkSB8/BjWoz+9qBRpdHV0
	RtJb3Y9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdYQX-0000000FUFm-1wIL;
	Wed, 07 Jan 2026 18:38:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdYQV-0000000FUF8-2OXT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 18:38:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B87F43668;
	Wed,  7 Jan 2026 18:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11763C19423;
	Wed,  7 Jan 2026 18:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767811114;
	bh=UnoGgK3rZulvQ7+7qKRL2PAUxy2h9dm7tc2RPR5H5pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zjtv75C8bU6LOSZ3PZHsIZhImci8OB9N3l4n+g4QJw9+EZUskkZVAM1UPtmIWq8qD
	 9y/QTHTfTxYeOHOawoKRbbL6WzEkQNUcZ9t+s6O58Apsi/7VGvWziIs5WaDXdB3xIT
	 ZZ4PTBLu72sZtSwmLEO3QscMYE8XJSixFJRNEqmKAKNd+EAEgG7e2pE1qc+hBXwn3x
	 7R8UKQBuL2Q0mUw7X6NTXCKWmje4q8fy/C+ZG61+QtwTbCNWAZOHIOYRNySKRWDYn1
	 iIPWudv/JqxQTi8ZwuwCYId8saayD+UOlRFVcAhLT7cLWzNCC0xoZEU1dm//iCbSlV
	 khtt+7PhnJH5g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/3] Add the support for SM8750 Camera clock controller
Date: Wed,  7 Jan 2026 12:38:21 -0600
Message-ID: <176781109968.3262943.4143830345398842895.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_103835_632501_FA6477CE 
X-CRM114-Status: UNSURE (   9.56  )
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


On Tue, 02 Dec 2025 15:56:24 +0530, Taniya Das wrote:
> Support the Camera clock controller for SM8750 Qualcomm SoC.
>  - The camera MCLK BIST clock controller, which is required
>    for functional MCLKs.
>  - The camera CC (clock controller) for managing camera-related
>     clocks.
>   - Additionally, the Rivian ELU PLL is utilized within the
>     SM8750 clock controller, so support for this PLL is also added.
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: clk-alpha-pll: Add support for Rivian ELU PLL
      (no commit info)
[3/3] clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC
      commit: f9580bafd39cff31bd51031e8784ea44acddf20e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

