Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48453606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kg0dzeJJ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KkwMvimn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6k/zLBs9xN6Ge9pUwvUR+GztcME2OchPyVZ1lJ7jdb8=; b=Kg0dzeJJOIJ0oK4D63pxzph3Cx
	GTVuoW2al1Jh+E55H5yYfINue5YpfFbjUQAswHmXaws2YI4GPfGmWKoeKBjZ77OS/h01gBLMdhGB9
	PlpDz/Pevpqz8vxDZ7RVFmLneoydj0ibhwNLv4/fYeHzA/SLgh+HvBXcNJwTK0Zwtq9umHLcTAPtq
	9Wt+ekE4AbnNiSSXCifnBVQSzWGkd7S6V4muEjH7uZ0joncaPMNO0xI8N7TF0ggH2p31AIsSxrTMn
	SW2whZJ8f8ijIpSKRUfDcff9C9b5W+u7KLURWOOnZ064V9fGei6MiSDGF6H3UCbw8iLHvVN2NkHI6
	FLBjRvFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOycE-00000009JPM-4AZr;
	Thu, 05 Nov 2026 14:38:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOycD-00000009JOs-1Y6B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:38:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C87E0600DA;
	Thu,  5 Nov 2026 14:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C05B1F000C1;
	Thu,  5 Nov 2026 14:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793889536;
	bh=6k/zLBs9xN6Ge9pUwvUR+GztcME2OchPyVZ1lJ7jdb8=;
	h=From:To:Cc:Subject:Date;
	b=KkwMvimniXwBHxMOIPpjFjX71BkUM9houO3mW8OlYVoBSpXHmJeDdTBNIhe6ATyFo
	 KGJO0Zt1W26J95hAtKMPmLIJSsoRDVJojBLf2HGIR+hWCaDAuA+B+12NyA0DTuESjX
	 p6J38vJToekd9S8jsJg0sZ9ZeJa5Y+P1nJewO5I2+ItHhpNOm+7QAqn4zhss3ezSaH
	 gd/4N9TJtKmfSUVq32cLIXmMWMoNOI7amNOx4LwW07YJKLvHpDefE+vXydeIM14hQU
	 NjSBKLZ+zLh5GFG/mkUPqVAnA1hSyiIXX6JHBdt1ZVJamvn8ZuibiV6Q5b+h2/1vAo
	 cB8Wh9J1coLpA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Bresticker <abrestic@chromium.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	David Lechner <dlechner@baylibre.com>,
	Drew Fustini <dfustini@baylibre.com>,
	Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Grant Erickson <marathon96@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	imx@lists.linux.dev,
	Joachim Eastwood <manabian@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Juxin Gao <gaojuxin@loongson.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Lokesh Vutla <lokeshvutla@ti.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Naidu Tellapati <naidu.tellapati@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	NeilBrown <neil@brown.name>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Philip, Avinash" <avinashphilip@ti.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sai Masarapu <Sai.Masarapu@imgtec.com>,
	Sandipan Patra <spatra@nvidia.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Vaibhav Bedia <vaibhav.bedia@ti.com>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH 0/8] pwm: Fix various bugs reported by Sashiko
Date: Thu,  5 Nov 2026 14:38:02 +0000
Message-ID: <20261105143847.2559586-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These issues were reported by Sashiko.

Lee Jones (8):
  pwm: tegra: Prevent 32-bit period truncation and division by zero
  pwm: mxs: Return early when disabling and fix error-path clock leak
  pwm: loongson: Fix 32-bit control register truncation in
    pwm_loongson_set_polarity()
  pwm: axi-pwmgen: Enable clocks before accessing hardware registers in
    probe()
  pwm: fsl-ftm: Enable ipg_clk around regcache_sync() during resume
  pwm: omap-dmtimer: Handle negative error codes from get_pwm_status()
  pwm: tiehrpwm: Enable runtime PM before registering PWM chip
  pwm: img: Unregister PWM chip before disabling runtime PM and clocks

 drivers/pwm/pwm-axi-pwmgen.c   | 20 ++++++++++----------
 drivers/pwm/pwm-fsl-ftm.c      |  7 +++++++
 drivers/pwm/pwm-img.c          |  8 ++++----
 drivers/pwm/pwm-loongson.c     |  2 +-
 drivers/pwm/pwm-mxs.c          | 32 ++++++++++++++++++--------------
 drivers/pwm/pwm-omap-dmtimer.c |  8 ++++++--
 drivers/pwm/pwm-tegra.c        | 14 +++++++-------
 drivers/pwm/pwm-tiehrpwm.c     | 15 ++++++++-------
 8 files changed, 61 insertions(+), 45 deletions(-)

Cc: Andrew Bresticker <abrestic@chromium.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: David Lechner <dlechner@baylibre.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Grant Erickson <marathon96@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: imx@lists.linux.dev
Cc: Joachim Eastwood <manabian@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Juxin Gao <gaojuxin@loongson.cn>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pwm@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Naidu Tellapati <naidu.tellapati@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: NeilBrown <neil@brown.name>
Cc: "Nuno Sá" <nuno.sa@analog.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: "Philip, Avinash" <avinashphilip@ti.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sai Masarapu <Sai.Masarapu@imgtec.com>
Cc: Sandipan Patra <spatra@nvidia.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Thierry Reding <thierry.reding@kernel.org>
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Cc: "Uwe Kleine-König" <ukleinek@kernel.org>
Cc: Vaibhav Bedia <vaibhav.bedia@ti.com>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Xiubo Li <Li.Xiubo@freescale.com>
-- 
2.56.0.398.g882cbad275-goog

