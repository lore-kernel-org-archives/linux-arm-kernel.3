Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11391E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JflIOn7XEQvSOSHDYwbiDsChzg3ONPsFai+LG7dj4w=; b=kOnBgbsm8vg9dTyq5h7cW57K/a
	m44b4ahyVCXM1aIwud6CkeNN78Jy+5i5TxtheGyMhhFOSkwHEMhKGiMKAy0DlMw9K0E7gG5W47uTK
	Pae4xmlvFvI92pth7Os1vF75BuzWao5MAWaZvwPOlnalMM6P94bsqXO37gNiJU1DGsYbXtXTzgEHS
	vBRVqoA1dOJ595I+aI4OtrwThQYKLBpt9GLDbZf2y4zYWP5srNuDOyNRQRGL06R1kjFiU+2wlKdyz
	C0lRbP4l3H0FnmJLT54+LDkBIHAicQhSpZ3G3xheRSpuktY/l3wc4DUZyTLm/3LumrBK2YiQhrUKi
	ha+eCTvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlph-0000000C4Yx-0xRU;
	Wed, 04 Dec 2024 09:38:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIljQ-0000000C3Aa-05ng
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:31:42 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 839C510B6;
	Wed,  4 Dec 2024 10:31:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733304669;
	bh=sCHJvD8U07JxBtUqGM5UTqa2HW6hh4J/lkYVcIDy00M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JspZ0/akMHxSwdhbHvSstkWmh2oHp33qfJL4qjpX+Vc8N5fPGe0NmZoPjZBwbDXAf
	 75q9cZBDEXOClhSc3CVUP92BEqXj7qTY1uxXR63aoXp3124HREp4S3eXMgWayO7zK2
	 KZo3MiRtK+vkmyF8/gLD7p91MQxak6Tp64HT6MVE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:04 +0200
Subject: [PATCH 04/10] drm/fourcc: Add DRM_FORMAT_Y10_LE32
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-4-0bf2c5147db1@ideasonboard.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
In-Reply-To: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=sCHJvD8U07JxBtUqGM5UTqa2HW6hh4J/lkYVcIDy00M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFyTNQ/7HzSBX/EC8mTWm7YSE/vU4Lw4pSWT
 4Raqs09XIWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhcgAKCRD6PaqMvJYe
 9YlvD/9mxwXHhjhOyZPLo0JLVNL09O+45LWilOlM1+aDdyyT6erkNa1MdNa2WqBTQIQKxtpH4eT
 iZ0aWa5Gaq7AQk0dgTTjWiW8UjXtIsZdaTqHBQDaP664PV/po8134LYP/8vHm1zrM7coNSx5Vag
 IQAudHBGh6dDP/wRCw46xFaZcHbuJl/wpPLL/IxDzjk5iuZy4PjlcXPxoyLezp5AmGGdX5ZoXz6
 kfwi8qKWYFxxnvtgu5CJD83+q+tlzdkXdVs4b2ar1k+pylpUn8S187Rdivcc4fYFdFEdJZ+4Kkj
 H0dvQ3JBZGOPacXK9wF1SA+4VZ+w/BrIVTigfQVUD0HQyh8I4gfeW5BengMAERkQTNwFNDhAkHe
 ZFfedIUasMu8bBozv9dCpTritRZvrcY8eIper0tD0QuLErRM1JkEWr2lgC4fa6eokPUFU2M+a/F
 uAQgfQSr3mpweN14W4aQFIgWEYSA9plCP2IzhjmvULQOdDApLngpb91uEcFc2Vx0MpiGQ4ggPiB
 WFYZLMgaBa8O1W3lGAg7WX7rzoWzMCIUj6557NyrCbi6LGTJ2Sb8/xtKwKEZvpEvRYBu0EyLD+O
 C6a+AQ+W7vTe6tGMCZF8mxo+1A4TxE9QSbitxafvhravvdnosC+9wEZcu0tQpD4pGyYPzqqYU4x
 29PongQDkMspvNQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_013140_200232_B7A6532B 
X-CRM114-Status: GOOD (  10.24  )
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

Add Y10_LE32, a 10 bit greyscale format, with 3 pixels packed into
32-bit container.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c  | 4 ++++
 include/uapi/drm/drm_fourcc.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index d721d9fdbe98..6048e0a191dc 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -327,6 +327,10 @@ const struct drm_format_info *__drm_format_info(u32 format)
 		  .num_planes = 2, .char_per_block = { 4, 8, 0 },
 		  .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 }, .hsub = 2,
 		  .vsub = 1, .is_yuv = true },
+		{ .format = DRM_FORMAT_Y10_LE32,        .depth = 0,
+		  .num_planes = 1, .char_per_block =  { 4, 0, 0 },
+		  .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 }, .hsub = 1,
+		  .vsub = 1, .is_yuv = true },
 	};
 
 	unsigned int i;
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index f79ee3b93f09..82f255eb3d1b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -408,6 +408,7 @@ extern "C" {
 /* Greyscale formats */
 
 #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
+#define DRM_FORMAT_Y10_LE32	fourcc_code('Y', '1', '0', 'P')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
 
 /*
  * Format Modifiers:

-- 
2.43.0


