Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE5FCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iSHZzxB1V5d/KC/KiS02pRO5TZqWUvOFP3PykJDrFrU=; b=ikspESWfegqWXtiCwycs9GOU2Y
	Z8pD+7zMoxNMP8kvBWldsLvD/wwCzOXqs/oGTEkRRazD7VHHum03fE3AX36a/zZaHxiPxMK2yJ2Zn
	UppLfAiEFgCi2a1i/4oPu3TsEbPv4Pc+lv8hA+vAf/HV7uUAglKtyqprhnHZQE+d+3uvl9d83jVCW
	SosjLXRaU7YesTAhgfK66GA2iG74MYxOuN/mKhPcmxzCF1sqBnD3N/Hubr1Bx74LfWZGOBMuc4Thx
	HOpr5CaZ3qeGaCo/Y/filoMrpMsldPJeTmaeGiBCOKYfC8qgILkAQzlti7e2DnQLzIbwveFCsK/Ys
	PXYDoAAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtL0-00000002Itn-2mvE;
	Tue, 26 May 2026 15:04:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtKz-00000002Iq9-1u3f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:04:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 78A8D600B0;
	Tue, 26 May 2026 15:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2C61F000E9;
	Tue, 26 May 2026 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807896;
	bh=iSHZzxB1V5d/KC/KiS02pRO5TZqWUvOFP3PykJDrFrU=;
	h=From:To:Cc:Subject:Date;
	b=REmtypH9FP71uzmEDVThS57AEynhrn7JF4BuwZGdv+01ujaJxTaD1YR4RpUr6bRKP
	 fHvCjP6GagzDgzjkkbr7sMvjdGQKQAVJ71pP9JOL5rXIUj2tJ1IslDmtkKIzxiyaaI
	 p976qfBHypo/3wljRmRcWI+ECL1oeFG0LQkHrzd1+apLRzVoCpQIzDA15DlLRUSgeN
	 rBAvmtEW0HmB0+jPXTzUOk9UdoKPLgZb9j2Wh95aIs1oGxvp3G+5STPmOJMQ1gKrFk
	 g5CcQ5VCf6trKKjMfjpU2T19oBujICIsjWcAoRE/KZkxnmdjbjsYafCZ1M+a2HwwC0
	 I2m2hOivuguYw==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [GIT PULL] Qualcomm clock fixes for v7.1
Date: Tue, 26 May 2026 10:04:54 -0500
Message-ID: <20260526150454.4281-1-andersson@kernel.org>
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


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-7.1

for you to fetch changes up to 5285b046757844435d1db96c1b5c3a6621b2979a:

  clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time (2026-05-21 22:45:49 -0500)

----------------------------------------------------------------
Qualcomm clock fixes for v7.1

The parking of shared RCGs during registration parks the MDP source
clock, disabling display until the msm display driver successfully
initializes the hardware again. Mark this clock on Makena and Hamoa as
"no_init_park" to retain a working recovery console etc.

----------------------------------------------------------------
Hans de Goede (1):
      clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src from getting parked

Pengyu Luo (1):
      clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time

 drivers/clk/qcom/dispcc-sc8280xp.c | 4 ++--
 drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

