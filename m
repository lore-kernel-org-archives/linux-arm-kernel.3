Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5514DC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 19:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bovKtbDOoLYl9GF3nO0/GERUm1oYh3QxcgsynzZgglo=; b=sKUaSpQnh9EU/bRdfnrTPdj6iZ
	w2iypFSeaTDsWAm2VI9VkMXTI4pHPBj5nf6GzqX4bGYR/l0ytFQzGN8A0bK5mKYnsLWjFV27UxP7+
	sg77NiMVEFgHwvPBr//TQMoOaLyvYA9W0OoM3zFQPA1J+W4IYwNtvDs/1XrqMafjj8MIjuxAGDraL
	yBH6YH9zpaPkKqrjXg4Sz4bhM+H5x6T1gpyBrfz1+TZ302uu17abmih1hQpQyg32n5Jp+4zBMuZFx
	wBiDBKM8RfuzDyhU4wzarkvLUHlOQuLPMTRAq+nbYva9LH9BFYwL40wis3mEPISeElj0g5OyLFOTL
	VmFDkPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1triZ5-00000003iYu-3G4L;
	Mon, 10 Mar 2025 19:13:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1triXR-00000003iVW-3u3f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 19:11:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE7AB5C540C;
	Mon, 10 Mar 2025 19:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD10C4CEE5;
	Mon, 10 Mar 2025 19:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741633904;
	bh=8Sff0TsgnZs3fX2n+0u/8tlu0wY9c+QMZDFeIB+Uf38=;
	h=From:To:Cc:Subject:Date:From;
	b=iK5eOERfs/lSapoXXibjJftUFpOXadzcXPs20ERHR3WtC3K8Q2vHYstozGZjhfEKt
	 mVlQHV5X1zhpUHhhsWyvBukjEHVJlkw8nxMh0b8hcwGF3BYns4BwL1rJYmhm2Ky1nV
	 JkCfLzv7SrFdpVXBNO49gDRBPA0lp9Uij3PHEzMf9SkIDbYnUdGaorRpzwOpTByQxa
	 v/KS0tiMGyX9az053CwQj0yrum0S8V3hN5KpjfMofo2cIjhtsljlyyU2uSffKhufNS
	 0HfmFANSYEqGBWhCGY7gl5uJh/POUEaNiW93F7orx1ORZmvtSoK8nlB/PeJxoLVKAA
	 xpf8ACzboC+FQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] Qualcomm clock fix for v6.14
Date: Mon, 10 Mar 2025 14:11:41 -0500
Message-ID: <20250310191142.1208155-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_121146_024188_B379147A 
X-CRM114-Status: UNSURE (   5.79  )
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


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-6.14

for you to fetch changes up to 787289a1d13d50ff4ce0f496947f8817ef3fdea9:

  clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent (2025-02-26 08:57:46 -0600)

----------------------------------------------------------------
Qualcomm clock fix for v6.14

Avoid propagating rate changes for the MDSS byte intf clocks on SM8750,
to avoid changing the already configured clocks.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent

 drivers/clk/qcom/dispcc-sm8750.c | 2 --
 1 file changed, 2 deletions(-)

