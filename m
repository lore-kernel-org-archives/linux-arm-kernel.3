Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F73C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1s9r2Uk+StvOfZS/X3nFt7tnCnDoFfQj7313EuiKRWI=; b=QvY1DtYioTEO1BmWUcFpjLp/dB
	t0XeD2xCcyC4BDa268NdlVFOwWlG7WOIK+54Vvq44FYnYQxsFkGHIT+F1HFrpygTgnHpN2xSFIqaM
	pKXzoekjaagIWC2iQHPsJ/uqltNkY9XjJ4OTEv4RxY9PdMcFyWb8IGT4e/3a2grHq70KsrAKb4B0E
	IzVzSj8cMuztD6beOI0ThDpE0NBpdkMOUi9RLI4xDjM4VYpRu+gJG2ZtQOoUi40Kt5oR9YQADbz4/
	nRScRz8IQ4mHgvYu7GY89gPIa4ORSZnvtKeqwdhuopcm5nqAlNv32sjWLiKDN/ExoK15HguZOOWIY
	Bt1DnH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkN15-0000000HTaK-2U4M;
	Thu, 16 Jul 2026 14:24:47 +0000
Received: from [2a01:e0a:1040:9780:49:5ff:fe41:d261] (helo=luna.linkmauve.fr)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkN13-0000000HTXJ-1hAQ;
	Thu, 16 Jul 2026 14:24:46 +0000
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 51F28F40D35; Thu, 16 Jul 2026 16:24:28 +0200 (CEST)
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
Subject: [PATCH v3 3/4] nvmem: apple-spmi: improve calling safety with wrapper functions
Date: Thu, 16 Jul 2026 16:24:10 +0200
Message-ID: <20260716142415.28718-4-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716142415.28718-1-linkmauve@linkmauve.fr>
References: <20260716142415.28718-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_072445_751562_4CBCACA4 
X-CRM114-Status: GOOD (  10.74  )
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

This driver used to cast the regmap_bulk_*() functions to void *,
bypassing any compiler safety around incompatible function pointers.

With two small wrappers, which just convert the void * priv parameter
into the wanted struct regmap *, we can remove the void * cast
altogether.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/nvmem/apple-spmi-nvmem.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/apple-spmi-nvmem.c b/drivers/nvmem/apple-spmi-nvmem.c
index cbf25c53d048..81d9e242c836 100644
--- a/drivers/nvmem/apple-spmi-nvmem.c
+++ b/drivers/nvmem/apple-spmi-nvmem.c
@@ -18,6 +18,20 @@ static const struct regmap_config apple_spmi_regmap_config = {
 	.max_register	= 0xffff,
 };
 
+static int apple_spmi_nvmem_read(void *priv, unsigned int offset,
+				 void *val, size_t bytes)
+{
+	struct regmap *regmap = priv;
+	return regmap_bulk_read(regmap, offset, val, bytes);
+}
+
+static int apple_spmi_nvmem_write(void *priv, unsigned int offset,
+				  const void *val, size_t bytes)
+{
+	struct regmap *regmap = priv;
+	return regmap_bulk_write(regmap, offset, val, bytes);
+}
+
 static int apple_spmi_nvmem_probe(struct spmi_device *sdev)
 {
 	struct regmap *regmap;
@@ -28,8 +42,8 @@ static int apple_spmi_nvmem_probe(struct spmi_device *sdev)
 		.word_size = 1,
 		.stride = 1,
 		.size = 0xffff,
-		.reg_read = (void *)regmap_bulk_read,
-		.reg_write_const = (void *)regmap_bulk_write,
+		.reg_read = apple_spmi_nvmem_read,
+		.reg_write_const = apple_spmi_nvmem_write,
 	};
 
 	regmap = devm_regmap_init_spmi_ext(sdev, &apple_spmi_regmap_config);
-- 
2.55.0


