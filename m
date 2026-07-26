Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAED6C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fy0Naq2z/qGyu632CabBrec05tmE/qLU8NXjBgmUt40=; b=xWBp5kof72YYZoH1NMQMycB1E/
	S0HzOYalmo+DUp1cfQA9EeFottCfzrO/jIUAS+Dv50FwvYFl/xyr+Bx+PqNM8NFd5bThgpZp96BRt
	mAmd4sfawQIg7pb1e4JXVfW5qQTH4fiIoCKSprnpxuSkuIbNZ0eejnPqyP10r3ZzIPV1pKq4AUjw3
	SfLkyIyi4MrhYQ06x2GwS06bHXeEbyLK+BSi2uRCk2wIjxL7hj4sqOyV8T+iVhURIDqPxalmpHK42
	Bk7t0E9+IqeBdhxL4rGkRZcniPx76jwfLOp/Fm+8BFenE9tatZMi3X5ehq5X9TJlFBFvL9izmqPsi
	fJbhnPiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyjc-00000001Bs2-0UiI;
	Sun, 26 Jul 2026 13:17:40 +0000
Received: from [2a01:e0a:1040:9780:49:5ff:fe41:d261] (helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyjZ-00000001BrI-2cPd;
	Sun, 26 Jul 2026 13:17:39 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id AA003F40DC6; Sun, 26 Jul 2026 15:17:28 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
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
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 0/3] nvmem: migrate to const void * in reg_write
Date: Sun, 26 Jul 2026 15:17:18 +0200
Message-ID: <20260726131724.15299-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_061737_826580_51D956F8 
X-CRM114-Status: GOOD (  12.85  )
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

Changes since v3:
- Link to v3:
  https://lore.kernel.org/rust-for-linux/20260716142415.28718-1-linkmauve@linkmauve.fr/T/
- Drop Apple SPMI patch, which had already been independently included
  in linux-next as 7089170e1df160f5f8fb395bc5aa2e2697b4e896.
- Reword the cover letter’s subject.
- Reorder the meson firmware patch before the other ones, so that every
  commit is always working correctly.

Changes since v2:
- Link to v2:
  https://lore.kernel.org/rust-for-linux/aljAqBNVXV1aVJqx@luna/T/
- Rebase on top of linux-next/master.
- Fix logic error which made all devices read-only.
- Remove a blanket cast of function pointers to void * in
  apple-spmi-nvmem (patch 3).
- Also fix constness of write buffer in firmware: meson, which is used
  exclusively by meson-efuse (patch 4).
- Re-review all changes to make sure the passed types are more correct
  than they were before.
- Actually test with COMPILE_TEST, which I forgot to enable before…

Changes since v1:
- Link to v1:
  https://lore.kernel.org/rust-for-linux/20260715175229.24672-1-linkmauve@linkmauve.fr/
- Removed all changes to other subsystems than nvmem.
- Added a new reg_write_const callback instead of changing the exisitng
  reg_write.
- Deprecated the existing reg_write callback, it will get removed once
  all users in the kernel will be done migrating to the new one.

Link Mauve (3):
  firmware: meson: pass a const buffer to meson_sm_call_write()
  nvmem: core: deprecate reg_write callback and add reg_write_const
  nvmem: make all reg_write callbacks take const void *

 drivers/firmware/meson/meson_sm.c       |  2 +-
 drivers/nvmem/apple-spmi-nvmem.c        |  4 ++--
 drivers/nvmem/bcm-ocotp.c               |  8 +++----
 drivers/nvmem/core.c                    | 28 ++++++++++++++-----------
 drivers/nvmem/imx-ocotp-scu.c           |  6 +++---
 drivers/nvmem/imx-ocotp.c               |  6 +++---
 drivers/nvmem/internals.h               |  1 +
 drivers/nvmem/lan9662-otpc.c            |  6 +++---
 drivers/nvmem/lpc18xx_eeprom.c          |  6 +++---
 drivers/nvmem/max77759-nvmem.c          |  4 ++--
 drivers/nvmem/meson-efuse.c             |  8 +++----
 drivers/nvmem/qcom-spmi-sdam.c          |  6 +++---
 drivers/nvmem/qfprom.c                  |  6 +++---
 drivers/nvmem/rave-sp-eeprom.c          |  6 +++---
 drivers/nvmem/snvs_lpgpr.c              |  4 ++--
 drivers/nvmem/sprd-efuse.c              |  6 +++---
 drivers/nvmem/stm32-bsec-optee-ta.c     |  2 +-
 drivers/nvmem/stm32-bsec-optee-ta.h     |  4 ++--
 drivers/nvmem/stm32-romem.c             | 10 ++++-----
 drivers/nvmem/zynqmp_nvmem.c            |  6 +++---
 include/linux/firmware/meson/meson_sm.h |  2 +-
 include/linux/nvmem-provider.h          |  6 +++++-
 22 files changed, 73 insertions(+), 64 deletions(-)


base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
-- 
2.55.0


