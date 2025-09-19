Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EB7CAC5AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 05:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UzWKRP56Pm41Dofvf30R8mkt87hyupLBy4proUpu/OM=; b=4N0Yrf4kZWMTMarI3YYvh4uPsH
	Og+UmwUOQBUpJFp5olwobSqGWuZAzMK0nfVo06q9c4H3W7+psdiQ9vB/cE8qKx7hpTU9yyRtCddy8
	59AEji53B2nlsxLyZCfrYN36CJkB1evBRSFFjN8GxIs3alqmA8WoU17ivdhHVhtU72n1PwMVbNnvF
	jeE+UzCKHcZZ7LTY+U+O+lpKFfXuKv6cCbWeKZYrhtpSUpOaIJU9sjPMg3lpiYCfkS10Su3jLJvIm
	I5CbUfG9EdyxJFU5oV5skNwbzKllxzLU2WXbEoD0cQHV6BEqoz3tvFXSKsV9frKqkMsUq97JZPqyS
	cSfYvVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzU9K-00000001u49-2jkV;
	Fri, 19 Sep 2025 05:59:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzU9H-00000001u2p-3XnL;
	Fri, 19 Sep 2025 05:59:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD22860140;
	Fri, 19 Sep 2025 05:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80730C4CEF0;
	Fri, 19 Sep 2025 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758261550;
	bh=ARN6P9/X424zlXLiKTbeILtanwkQtWd4O4u45ktBDnM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=R/qUzZBHIsxOOMKjnRckwsYr37MOnatD+425r/3bMIPTdPagxJds5RmoXdQ1t7PSw
	 VKC4ys+4Uc9nL8IE8GblocuztHLnidGyWn+8wb1a19Hlb+dz6TDoeQyv2we8B05JEU
	 u1BFt8RduSHsac4/Qy8o8L0oHtV5TsnoV4ydfE4FxogDz0D3c2M4V7sflb0sX/Gk30
	 fgIFe2FaZzjgQP5En/DtRwdZjk6xGCa9JI4dq8+nh6fTSBS/zxAxvOeQlVtUu3RwOD
	 0w8Q1STDbdNCMp/PAJSrRasbDvrE4wPofWtXcP+AFKlIJGDYIYMy5rDycGS1U5k3Xd
	 jaP8moY3eVaxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC39CAC592;
	Fri, 19 Sep 2025 05:59:10 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v6 0/3] clk: amlogic: add video-related clocks for S4 SoC
Date: Fri, 19 Sep 2025 13:58:58 +0800
Message-Id: <20250919-add_video_clk-v6-0-fe223161fb3f@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACPxzGgC/3XPzWoCMRSG4VuRrBs5+TmZpKveRxHJzxkNVVNmJ
 LTI3LvRjTKjyy/wvIdc2EhDppF9ri5soJrHXE5tmI8Vi3t/2hHPqW0mQSJ0ArlPaVtzorKNhx+
 eorIBNToQljXzO1Cf/+69703b+zyey/B/z1dxe31XqoID10Bdb5TqlRFf/ngouxzXsRzZrVXlw
 1uh5142H4IM6LGXDvTSq4d3sLivmrcKdHQi2OBeeP3s3dzr5pEggki6894uPT55YeYemyeJ0im
 0zsDs/9M0XQHF8HpArAEAAA==
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Chuan Liu <chuan.liu@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758261548; l=1984;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=ARN6P9/X424zlXLiKTbeILtanwkQtWd4O4u45ktBDnM=;
 b=XXP6mQSo6VYw2td4KrrELnplOge6oWnhKcSZSb+u2Xr4OOmy2ahWYAZ3efQOYgziW+ySI+p7C
 kh9uYnVngwBDttGGcI1ZdGpcOzEN8UVV20TQpALs/I9Lf+4KyV+HqZ7
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch introduces new clock support for video processing components
including the encoder, demodulator and CVBS interface modules.

The related clocks have passed clk-measure verification.

Some potentially unsafe flag configurations were identified in other
video clocks, and they are cleaned up as part of this patch series.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Changes in v6:
- Split the flag removal changes for video clocks into a separate patch.
- Link to v5: https://lore.kernel.org/r/20250916-add_video_clk-v5-0-e25293589601@amlogic.com

Changes in v5:
- Add Acked-by tags from Conor.
- Remove unnecessary flags as suggested by Jerome.
- Link to v4: https://lore.kernel.org/r/20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com

Changes in v4:
- Add Acked-by tags from Rob and Krzysztof.
- Fix compilation errors.
- Link to v3: https://lore.kernel.org/r/20250905-add_video_clk-v3-0-8304c91b8b94@amlogic.com

Changes in v3:
- Rebase with Jerome's latest code base.
- Link to v2: https://lore.kernel.org/r/20250814-add_video_clk-v2-0-bb2b5a5f2904@amlogic.com

Changes in v2:
- Removed lcd_an clock tree (previously used in meson series but obsolete in
newer chips).
- Removed Rob's 'Acked-by' tag due to dt-binding changes (Is it necessary?).
- Link to v1: https://lore.kernel.org/r/20250715-add_video_clk-v1-0-40e7f633f361@amlogic.com

---
Chuan Liu (3):
      dt-bindings: clock: add video clock indices for Amlogic S4 SoC
      clk: amlogic: add video-related clocks for S4 SoC
      clk: amlogic: remove potentially unsafe flags from S4 video clocks

 drivers/clk/meson/s4-peripherals.c                 | 206 ++++++++++++++++++++-
 .../clock/amlogic,s4-peripherals-clkc.h            |  11 ++
 2 files changed, 213 insertions(+), 4 deletions(-)
---
base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
change-id: 20250715-add_video_clk-dc38b5459018

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



