Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905B2C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=04ZG929EQhX1dGNLkVMZf7o0QfRRX5rccHgYz9v8S+U=; b=kOyymVvmbvzHd6HElPW9SErgZX
	YCmgE7GG0xyreFZLo0OXWGv4tpOgZVkCnhoBe1mpJY/8of2qnRG/NQRQ9DNOLpNe3ASBya3Vg9O/2
	kl+96WE7yHCh4UengrZTKXYf6jFFY8RwRVbNvrHd8cSBwjwV1OpSfjFabwOpemdgw4FIOP4yp9ATX
	1w0vTIqZ/D6AVxhZrzi2x8+xqiXJLN1gUu9xE8BNHpCwLZNohRksgBCSSntwOGSjEnEjgifPUL+6f
	AdjUMH73p7qcpkziZZH/UmQnMaIrqKM7o1LdKIpqpmvrgZimNjBrmNqLmcs1yLxO1N/AEAEx9tXjT
	B7Ed31vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl12t-00000003vyH-3uDE;
	Sat, 18 Jul 2026 09:09:19 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl12q-00000003vx5-0Lz5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 09:09:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mieulab.com; s=key1;
	t=1784365749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=04ZG929EQhX1dGNLkVMZf7o0QfRRX5rccHgYz9v8S+U=;
	b=KhOZP0PJkvHKX7WngjioyotNt/pO8fljU0Vgyo7CFCT4OlU/hu2906O+/lPs0BaBFILBBj
	XAcHxaWAbow0SNTsrn47UeHbu7IXkPyFQGgUtU30vQbOaNxUSHAMkAtmeMDEeLy/HYS/8l
	7qrXx651/jgATPKzu+Y25+EIxZmPdg5oNH0ymacfxN5C9ymb/UMrRKjysuPliiRrSb04kn
	NjopTSvCoAiKtd8RRilvH1AEoNWhopr1iMenin4ylg/fq1lofQ6uE4jUov+/YVlyP7xYP/
	BUaO0aukHg6kHLHJCFgw1bq7vtO4yCfYeOi/K1n+oulQgSdKTyXgX72AkYVwQQ==
From: Zinan Zhou <zinan@mieulab.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Zinan Zhou <zinan@mieulab.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/meson: constrain the DW-HDMI regmap range
Date: Sat, 18 Jul 2026 18:07:10 +0900
Message-ID: <20260718090710.70534-1-zinan@mieulab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_020916_526770_DF247696 
X-CRM114-Status: GOOD (  10.39  )
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

The DesignWare HDMI regmap declares 0x10000 as its inclusive maximum
register. A regmap traversal can consequently read one byte past the
directly mapped G12A 64 KiB resource. It also treats the Meson TOP window
from offset 0x8000 as DWC registers. On the older indirect interface, the
address is truncated to 16 bits and aliases register zero.

Limit the regmap to 0x7e12, the last register defined by the supported
Synopsys HDMI controller. This also keeps register iteration below the
Meson TOP register window at offset 0x8000.

Fixes: 3f68be7d8e96 ("drm/meson: Add support for HDMI encoder and DW-HDMI bridge + PHY")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Zinan Zhou <zinan@mieulab.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index fef1702acb14..1004108fb7ca 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -100,6 +100,8 @@
 #define HDMITX_DWC_ADDR_REG	0x10
 #define HDMITX_DWC_DATA_REG	0x14
 #define HDMITX_DWC_CTRL_REG	0x18
+/* Last DWC register; direct layouts place the TOP block at offset 0x8000. */
+#define HDMITX_DWC_MAX_REGISTER	0x7e12
 
 /* HHI Registers */
 #define HHI_MEM_PD_REG0		0x100 /* 0x40 */
@@ -564,7 +566,7 @@ static const struct regmap_config meson_dw_hdmi_regmap_config = {
 	.val_bits = 8,
 	.reg_read = meson_dw_hdmi_reg_read,
 	.reg_write = meson_dw_hdmi_reg_write,
-	.max_register = 0x10000,
+	.max_register = HDMITX_DWC_MAX_REGISTER,
 	.fast_io = true,
 };
 

base-commit: b0a652436b892eb9a036a031b33099dca036faaa
-- 
2.43.0


