Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2F3C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FkaYWOMLkP887mULcokiGXbVYqvHYA1PnxTRhO5GtXA=; b=szBSQ+8pa8JC/AdziInySKGGuj
	7ifNREO/XjirBbp77UhSactw4rRbB4XYcfpQf5rgP1Ry5yuYxpeKozOYrSaMNbeX0+cuYxJKQ1ePJ
	nAA8OYCzWCDUmFn4x0QmHQ2A9gEpJ/sj6esk8LuvIOtifghtCJ7NggPnp1egLUZSDIk8N4ltqgtev
	VLYLKIC1mZQP7YENcy6D5WLYL0ucjAQ2jS9Bbhd8YOkws259xTtLH+ZamRVg3F5gmLMI6u2S78l6Q
	UOVgAiNF20+PUA/LA5a9W8kOGElEhIKEacW5mmGktI4ACA6xSItVfvd3oE7TiwF1bFZB7rWzgoyNZ
	xC0cHaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5he-0000000FpYo-2UTM;
	Wed, 15 Jul 2026 19:55:34 +0000
Received: from 82-65-109-163.subs.proxad.net ([82.65.109.163] helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk5hb-0000000FpXE-0Wby;
	Wed, 15 Jul 2026 19:55:33 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 353A7F40D2B; Wed, 15 Jul 2026 21:55:24 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Andy Shevchenko <andy@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/2] nvmem: fix a const-unsoundness in reg_write
Date: Wed, 15 Jul 2026 21:55:16 +0200
Message-ID: <20260715195520.25410-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_125531_308553_5793C963 
X-CRM114-Status: GOOD (  11.00  )
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

This callback used to take a mutable void * for no reason, which causes
the compiler to be unaware that the val buffer should never be modified
by the callback.

This was found while drafting the nvmem-provider Rust abstraction.

Thanks to the guidance of Andy Shevchenko, this now introduces a new
callback and deprecates the existing one, with the goal of renaming the
new one into the old one once no user remains in the kernel.

Changes since v1:
- Link to v1:
  https://lore.kernel.org/rust-for-linux/20260715175229.24672-1-linkmauve@linkmauve.fr/
- Removed all changes to other subsystems than nvmem.
- Added a new reg_write_const callback instead of changing the exisitng
  reg_write.
- Deprecated the existing reg_write callback, it will get removed once
  all users in the kernel will be done migrating to the new one.

Link Mauve (2):
  nvmem: core: deprecate reg_write callback and add reg_write_const
  nvmem: make all reg_write callbacks take const void *

 drivers/nvmem/apple-spmi-nvmem.c    |  2 +-
 drivers/nvmem/bcm-ocotp.c           |  6 +++---
 drivers/nvmem/core.c                | 26 +++++++++++++++++---------
 drivers/nvmem/imx-ocotp-scu.c       |  6 +++---
 drivers/nvmem/imx-ocotp.c           |  6 +++---
 drivers/nvmem/internals.h           |  1 +
 drivers/nvmem/lan9662-otpc.c        |  6 +++---
 drivers/nvmem/lpc18xx_eeprom.c      |  6 +++---
 drivers/nvmem/max77759-nvmem.c      |  4 ++--
 drivers/nvmem/meson-efuse.c         |  6 +++---
 drivers/nvmem/qcom-spmi-sdam.c      |  4 ++--
 drivers/nvmem/qfprom.c              |  6 +++---
 drivers/nvmem/rave-sp-eeprom.c      |  6 +++---
 drivers/nvmem/snvs_lpgpr.c          |  4 ++--
 drivers/nvmem/sprd-efuse.c          |  6 +++---
 drivers/nvmem/stm32-bsec-optee-ta.c |  2 +-
 drivers/nvmem/stm32-bsec-optee-ta.h |  4 ++--
 drivers/nvmem/stm32-romem.c         | 10 +++++-----
 drivers/nvmem/zynqmp_nvmem.c        |  6 +++---
 include/linux/nvmem-provider.h      |  6 +++++-
 20 files changed, 68 insertions(+), 55 deletions(-)

-- 
2.55.0


