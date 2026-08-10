Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEF3C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upR4Vi3xNazhK1I/FkGMlrEXJVnoArbM4XHLEs7N1WM=; b=hhineUz+gbYBEMYnV0CLxLOS3s
	dsMYSkpcj4cdXeDvjNdglemsfkUiTw+w6gkic1ciOanQ8x7Bq1TFVbmH1rmBjRNrff2sakvhf/HsY
	oiirOCzoLunpzjBCYyLi92loBf1wPZFF1BPEbr54Sn3aptoY9SrdWJZQoEvB5vf9Tz/uj4j+zwTkS
	C5rskZCmd/h3qMVKZenq5cVWU+KmQ2MjaHtv/+0ZqseZtUBkTkI+uW7yRVbZT90pjWPfVTrpPePua
	w7By2Fy5xVLrOGph/Vw8ovT3/VizukVaw/u2boem+GL+sKnZInkUjMN9UqVcdDcew4PBanamr/7en
	1m/S0+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV12-0000000CenI-3Xu8;
	Mon, 10 Aug 2026 18:46:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtV0s-0000000CelY-3Vi0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:46:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C615A60120;
	Mon, 10 Aug 2026 18:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E133D1F00A3E;
	Mon, 10 Aug 2026 18:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786387577;
	bh=upR4Vi3xNazhK1I/FkGMlrEXJVnoArbM4XHLEs7N1WM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d4h8IEw1CmuBqx0QEoap6yBmZMWkxLTEpwoGhXHNYRS8d2WA/eSeAPr4sASylKQgo
	 kZb7p34HkS4KgRO6u3balWNonE9f9OVpn7ZWjipe1Wn3A4QpnhAYixUXRUUnHfTOT7
	 XH/8tRN4KOjNTqnXIjXD9Cm1M89yK/AH8Wm6FiPsk1VaGYEru2g6c/2OZWPxadqs/o
	 p20b6r1Q6JIy12SFVJQ0mDlcqhX3184zpqSvS/toP+8KLy9ux5vledkvVqiaJGX4iQ
	 +tnjs1WLMRwEZ3TUGnNZbdhvcqHalfwbQuruP3NQghnnjbB7fd0bh0TS9KSnd87UYS
	 La/cLU+w8aWcg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v10 00/10] Add support for Video, Camera, Graphics clock controllers on Eliza
Date: Mon, 10 Aug 2026 13:46:01 -0500
Message-ID: <178638756037.656675.11284989692153277495.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
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


On Thu, 06 Aug 2026 16:04:05 +0530, Taniya Das wrote:
> Add driver for Eliza SoC camera, graphics and Video clock controllers.
> The camera clock controller supports the cambist clock controller and
> the regular camera clock controller.
> 
> Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
> and MXC rails dependency. Add explicit power-domain voting for Milos
> which are required. Hence extended the Milos camcc & videocc
> documentation bindings for Eliza.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: clock: qcom,milos-camcc: Add missing power-domains support
        commit: 13688b7326f7c32c1e9353052e704a3832a3ffdd
[02/10] dt-bindings: clock: qcom,milos-videocc: Add missing power-domains support
        commit: 87a346905e8f86b71e3a6550f91487c08bbbf8f2
[04/10] dt-bindings: clock: qcom: Add video clock controller on Qualcomm Eliza SoC
        commit: ee2c9844cbc19a37d7ff0983c35235be23d9935d
[05/10] dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
        commit: 26461dcf5de1a3645bf9bdb1558f12ea20df991f
[06/10] dt-bindings: clock: qcom: Add support for CAMCC for Eliza
        commit: 741cf4c3e4bea26815deaaeb4a2408586759bee2
[07/10] clk: qcom: videocc: Add video clock controller driver for Eliza
        commit: 6b56dd100d66c7d9e0716402510950704f41ad2a
[08/10] clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
        commit: 4cfe35f2ef21c4b6281d8b73fdbabaa6a8aa1440
[09/10] clk: qcom: camcc: Add support for camera clock controller for Eliza
        commit: 17755aed77456b1425575f7b3874c47ff5b88ce1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

