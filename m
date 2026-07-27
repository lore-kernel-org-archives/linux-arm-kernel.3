Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E2DC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 17:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t5Q4ijmgMjKnU+9LIjcY0dZtKwKFuHlQnsscP9xRfKo=; b=MYlloWIX6aAYQvQuG05Vsh/BaO
	Z64hH+OqtG9rxcTlvPhzR6jdZccA1aHaJgLh5ah3MmQ7GkzhyvtA8XxljpU3K/FaRcfadRtijoJAe
	BylbDhUsnSzguzrtYhylrGVu6xvfVfVgXUJXDXsNnBVPysAiyhjH3+EV5dCCyKhxkk7+bDf9MEK6M
	6xlbEhRGGZyltjFzLEkWieC7mC9izd/tPNS4Pcisye9obHpv9GGn1AVd+1X1AukZDvu7pgPJbaNhI
	T4IOJ5ciHppXJrsTtKdjx2RCaL/g39tDQcGYR4U6z3W6sZyqhJkL22nYU5zyarglZlBp54Rnz0Jgm
	HNPuuucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woP8a-00000003WHv-0hpy;
	Mon, 27 Jul 2026 17:29:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woP8Y-00000003WHl-2l6s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 17:29:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A33D60A5E;
	Mon, 27 Jul 2026 17:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3514F1F000E9;
	Mon, 27 Jul 2026 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785173349;
	bh=t5Q4ijmgMjKnU+9LIjcY0dZtKwKFuHlQnsscP9xRfKo=;
	h=From:To:Cc:Subject:Date;
	b=Jj8RVaooChr64g6dSC6spIp5P/w9009J+kLlPTUTt8AtNaXpWz/CCLu3Lwp1UULai
	 f7Ruc1q8heBlpKCrK4a3LQzitV8Tj469QsFlQGajlIrS4gls5nSviO5OgUxcZY82tB
	 +m3uAxXdH/WhxVrwGf04QOppUUqCtJPzMBCpT2Dm7RhaLLkTcYoAjZdiQ55/203vsJ
	 temTJM05Ee3DWb0SmyQNw/aMidiFDv3316nAh5EPtmQILuP/EWSfsIYtJmKcl6/Xty
	 m+zRPI5yo7mAqiaPONgzbg2FHzFsQfOTJCBvxkwWqni1F1SxopVZmK79CSj9TH8I/i
	 52XTL9mZv/LrQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm clock fixes for v7.2
Date: Mon, 27 Jul 2026 12:29:07 -0500
Message-ID: <20260727172907.21229-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-7.2

for you to fetch changes up to 1aa4e2ed7caafbbbedff89fb226a982413469baf:

  dt-bindings: clock: Replace bouncing emails (2026-07-11 10:24:07 -0500)

----------------------------------------------------------------
Qualcomm clock fixes for v7.2

Fix the Eliza display clock controller to avoid RCG stall. Revert the
rework of the "PHY mux" clock, as this broke PCIe on several different
targets.

Drop (and correct one) bouncing maintainer email addresses in DeviceTree
bindings.

----------------------------------------------------------------
Konrad Dybcio (1):
      Revert "clk: qcom: regmap-phy-mux: Rework the implementation"

Krzysztof Kozlowski (2):
      clk: qcom: dispcc-eliza: Fix disp_cc_mdss_mdp_clk_src RCG stall on Eliza EVK
      dt-bindings: clock: Replace bouncing emails

 .../bindings/clock/qcom,gcc-msm8953.yaml           |  2 -
 .../bindings/clock/qcom,ipq9574-gcc.yaml           |  1 -
 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |  1 -
 .../bindings/clock/samsung,exynosautov9-clock.yaml |  2 +-
 drivers/clk/qcom/clk-regmap-phy-mux.c              | 52 +++++++---------------
 drivers/clk/qcom/dispcc-eliza.c                    |  2 +-
 6 files changed, 19 insertions(+), 41 deletions(-)

