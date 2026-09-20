Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAEAC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dv/AIdx2Solw8j5B89PnBL2zqbXBxu9pm671fpAhdmA=; b=z5Q/0zz5CR5gi2MP7TyKW4z+gM
	UwpWHMuPhx1yjpegvhfEtxgzZd3hE1bLgrJt4zWB0oLupmorKzKfXkvQWYHyPhaED+qGKcVrGx/mj
	SUJLpxB9tFND4rNeg1tjedrXn72HpppQTm4E9b2SIHvfE8vNv/4+rPPG/zrsee3yi7HQi6DPXxDkg
	+pUb1MdqTLbYEVn2IiDEydL2MyYwM1/Msd6wz1ugZ9UciBVmSN+wBdD23J2LtlFmxeJjJAbenJkUL
	XuanKTixvP4fylBp74QTiqjcK4SawVE+4esKw75wfJd99rDxlNWpPuVw/n6N1ycHrn8rfCxZUrVaE
	9sBhGarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FR5-0000000HJQj-3yoL;
	Sun, 20 Sep 2026 11:10:19 +0000
Received: from linkmauve.fr ([82.65.109.163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FQu-0000000HJMJ-3pNg;
	Sun, 20 Sep 2026 11:10:13 +0000
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 7ED297189A58; Sun, 20 Sep 2026 13:10:03 +0200 (CEST)
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
Subject: [PATCH v6 1/4] firmware: meson: pass a const buffer to meson_sm_call_write()
Date: Sun, 20 Sep 2026 13:09:54 +0200
Message-ID: <20260920111000.2404131-2-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
References: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_041009_106923_84F3754F 
X-CRM114-Status: GOOD (  10.20  )
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

This was found while introducing the new nvmem-provider reg_write_const
callback in meson_sm_call_write()’s only user, in meson-efuse.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/firmware/meson/meson_sm.c       | 2 +-
 drivers/nvmem/meson-efuse.c             | 4 ++--
 include/linux/firmware/meson/meson_sm.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index ab9751a59b55..5d4da2e3c3a9 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -196,7 +196,7 @@ EXPORT_SYMBOL(meson_sm_call_read);
  *
  * Return:	size of sent data on success, a negative value on error
  */
-int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
+int meson_sm_call_write(struct meson_sm_firmware *fw, const void *buffer,
 			unsigned int size, unsigned int cmd_index, u32 arg0,
 			u32 arg1, u32 arg2, u32 arg3, u32 arg4)
 {
diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index d7f9ac99a212..f71854f89950 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -20,7 +20,7 @@ static int meson_efuse_read(void *context, unsigned int offset,
 	struct meson_sm_firmware *fw = context;
 	int ret;
 
-	ret = meson_sm_call_read(fw, (u8 *)val, bytes, SM_EFUSE_READ, offset,
+	ret = meson_sm_call_read(fw, val, bytes, SM_EFUSE_READ, offset,
 				 bytes, 0, 0, 0);
 
 	return ret < 0 ? ret : 0;
@@ -32,7 +32,7 @@ static int meson_efuse_write(void *context, unsigned int offset,
 	struct meson_sm_firmware *fw = context;
 	int ret;
 
-	ret = meson_sm_call_write(fw, (u8 *)val, bytes, SM_EFUSE_WRITE, offset,
+	ret = meson_sm_call_write(fw, val, bytes, SM_EFUSE_WRITE, offset,
 				  bytes, 0, 0, 0);
 
 	return ret < 0 ? ret : 0;
diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 3ebc2bd9a976..92cc61f3a1c0 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -21,7 +21,7 @@ struct meson_sm_firmware;
 
 int meson_sm_call(struct meson_sm_firmware *fw, unsigned int cmd_index,
 		  s32 *ret, u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);
-int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
+int meson_sm_call_write(struct meson_sm_firmware *fw, const void *buffer,
 			unsigned int b_size, unsigned int cmd_index, u32 arg0,
 			u32 arg1, u32 arg2, u32 arg3, u32 arg4);
 int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
-- 
2.55.0


