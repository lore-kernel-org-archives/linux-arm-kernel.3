Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B406C982EB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UNJPjHcBm60x2mfeM77rQcodyf3LbRvkr3qS0bSfsk=; b=AGN52cTG2Jl6OQ3HtsTDa0wlIv
	2Nz9+D1lYXM2JU7r6nWHot1Nq84ElsUpmkcF6Cn1v1VY29wJnSXNGQe+3NHoHkyeEML2ZPnTMOciR
	R/uErJA3DOtGXnHYDlSNzsDcyiqVEwn10aYJHCtGL/3fTVRV24EOUKu4tpk+eI5tkDwCcj0x7LH44
	7h22S2LYdK8wh53Ai3yJcHX3VK2qSZ6keiMlm+6IjtMFDHwRfW7KdgPQtIlZuyx7udQR2bofgddBJ
	nqcUOq1WOwhbUN0b9CV1BwKteG+H0WB4tzUtKuuG7O7hVVk5cFlyY0DkrzBsQsbrPmvbdYuj9x2u0
	GO8ufgmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FQz-0000000HJOA-3Ej6;
	Sun, 20 Sep 2026 11:10:13 +0000
Received: from linkmauve.fr ([82.65.109.163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FQu-0000000HJMN-3nQB;
	Sun, 20 Sep 2026 11:10:12 +0000
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 8E1657189A61; Sun, 20 Sep 2026 13:10:03 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Sasha Finkelstein <k@chaosmail.tech>,
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
Subject: [PATCH v6 4/4] nvmem: enable COMPILE_TEST for more drivers
Date: Sun, 20 Sep 2026 13:09:57 +0200
Message-ID: <20260920111000.2404131-5-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
References: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_041009_102371_962F7123 
X-CRM114-Status: GOOD (  11.48  )
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

Three drivers had a depends on ARCH_*, but didn’t also compile when
COMPILE_TEST is enabled, making it harder than it should be to test
them.

Some other drivers also don’t have a COMPILE_TEST, but those have
additional dependencies and I didn’t want to investigate too much.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/nvmem/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index c36c2a4c2a0b..d38097d6648b 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -354,7 +354,7 @@ config NVMEM_NINTENDO_OTP
 
 config NVMEM_S32G_OCOTP
 	tristate "S32G SoC OCOTP support"
-	depends on ARCH_S32
+	depends on ARCH_S32 || COMPILE_TEST
 	help
 	  This is a driver for the 'OCOTP' peripheral available on S32G
 	  platforms.
@@ -518,7 +518,7 @@ config NVMEM_SUNPLUS_OCOTP
 
 config NVMEM_SUNXI_SID
 	tristate "Allwinner SoCs SID support"
-	depends on ARCH_SUNXI
+	depends on ARCH_SUNXI || COMPILE_TEST
 	help
 	  This is a driver for the 'security ID' available on various Allwinner
 	  devices.
@@ -563,7 +563,7 @@ config NVMEM_VF610_OCOTP
 
 config NVMEM_ZYNQMP
 	tristate "Xilinx ZYNQMP SoC nvmem firmware support"
-	depends on ARCH_ZYNQMP
+	depends on ARCH_ZYNQMP || COMPILE_TEST
 	help
 	  This is a driver to access hardware related data like
 	  soc revision, IDCODE... etc by using the firmware
-- 
2.55.0


