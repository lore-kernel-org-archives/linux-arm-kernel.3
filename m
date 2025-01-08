Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784FFE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cbxXwWR8AIKr2Z5xmtMFDic9EFUnqAlHiSI7jHWWslU=; b=AJyYhI1jwyHFhA
	ObadVVJRdMXuwodHLu2tGosJLdL4owB1PU7bK6dRRCWscXJEJcpjVR203AzoHLbfJm2GWW9ltAcNB
	4pw4G/G+tq7S5kI+fYBw0KOG8tykmDuhhNaMZR4sEJ3QDKdpjdbHCqd9QJ82epLAiJqio4xg/ZnTp
	Q3c2AxJLC07zc+MQaHPn+z4S+3/oVp1vPOhQJcsrrcUWFhfsVmW1TLjtv2+FL0ZD7xekVK0kOvIcx
	QWl3RAu43UcCEPoDfrh/lxqy9LiY4VhdbLTaVmrpzEg00p8y3hwJTDFiVze/ClOzTUpZVEv/eEvrA
	Z0068bgdf8dWZee95Omw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYjz-000000098d9-2yhc;
	Wed, 08 Jan 2025 16:17:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYij-000000098Fi-38WF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:15:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361f664af5so6385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 08:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736352947; x=1736957747; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cbxXwWR8AIKr2Z5xmtMFDic9EFUnqAlHiSI7jHWWslU=;
        b=F7Md47KUaNp7i2sEkfMNTAZFIrnvIZ5RCiurGEU5CrRkL55MyCdV86NjPycr35FJBh
         vaALCXrcsTBH+tehNk1eJdtNtIeZN/8lBjmxFeIvrxX3R28ODIBEkWH/RlFP0fEyhQHi
         //DxF9sm5EGe2OQ4EMwaFmbK6SYasAlU8/kt+s2TIS1nrMwly+k5iaJCQXKQFCOrLXxw
         /E6MsxaGDTivlWwi5ulltntnXdOgMKZZN0EHvsZ9m3XRINdTU5vI0z1bh3kjXA425dcq
         UUTlOdfZERlzMWYBiNXktGBnK16SNdMewyluuvxb7C+X+707GNuijzAnw0vYTbzMSC6i
         nAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352947; x=1736957747;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbxXwWR8AIKr2Z5xmtMFDic9EFUnqAlHiSI7jHWWslU=;
        b=aInA9q/rB678WZapHuBkaE7Bd2/WxFHdMTy3Pqfj+XAtcPuhFRRzNFLb2fGl9IkUyZ
         IDIxt2FXUkOk05slpeAsFUZZnpCcUy1gbdOdAh8ol/MhorHhWXMMFWnH/xjTg+DovNAw
         bVY0YP3QSEs98w0kE6l5iaDFNL44HNdxP2zGlt8UnK2G2ebSzqeGBX7C3zE9bcnfvQaz
         2LpHZiwa2ad29/tmlNghb+jR/hBZNElCsF0eRAxtk3CBYTFVtymEYbvNkFR7W/K5JUIe
         oli+4A+cibv9G4+3NqU9exSWlhzuhehIi6An2y+ypYwn8dQzcxHH50gyiyD/NfyOEIpg
         cjnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCIQ+scJtvpa9y+jUo8vCfQwUyXmbZdlQIJflGQWQL54Er5Hi9Ub8Sz3Qcko5F+TM6CsxymtN6CviUgwtIuce8@lists.infradead.org
X-Gm-Message-State: AOJu0YyCDWK5JUkRqLCCux6LFk9e9SqLJ4pweG4fqskoPAOdCQ2IwHYz
	LluOosWqGszurlr1l7iK0S59zz0WAhahOGSgfAX4bwoRYhBFh2kkyTrBbVuHKv8=
X-Gm-Gg: ASbGnctBCs3CFJtiHXMBsuLVIcbVADWFom9Mm2dIPeqIT4zZO3QZNhPlWU5gMBvOPfr
	WSLFCzqD4vi05o664FlqEE1QRYrJonfJ1FvXi2P5bIMm4XC2ja7z8fT66y9Ka7lu8SsWCYaSTTU
	T+lJAZy4VJ1Q6RFUJPy+2Bx5lSl2/+ezj/QhY3H8svSt6bZi/1qrSq8rACBnMj5iAx33/G5ANCw
	YLlwSNwrPASO1q0KArdzX3aYMYd833WQZLcHIvBvwqdxLSCOzRgO5ZuM4aU
X-Google-Smtp-Source: AGHT+IGGAa64d+bPHxfOT6F6vJgh1xofOm1puRyf5Gg2Qx08bu4NygW/ia9oSmUPKTI5x+9zroEuLw==
X-Received: by 2002:a05:600c:4e44:b0:434:e9ee:c3d with SMTP id 5b1f17b1804b1-436e27070b1mr31379705e9.20.1736352947285;
        Wed, 08 Jan 2025 08:15:47 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:15:46 -0800 (PST)
From: amergnat@baylibre.com
Subject: [PATCH v5 0/7] Add display support for the MT8365-EVK board
Date: Wed, 08 Jan 2025 17:15:42 +0100
Message-Id: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK6kfmcC/4XOwQ6CMAwG4FcxOzvD1oHTk+9hPKxbkSUKZEMiI
 by7G0ej4dDD36Tf35lFCp4iO+9mFmj00XdtCuV+x2xj2jtx71JmspAg0nDnY/8wE4+vvu/CwG2
 lhEYoSIkTS1doInEMprVNvhsoDiLv+0C1f69N11vKjY9DF6a1eBR5+79jFLzgpdVVQa60AHhBM
 z08BjrY7skyN8oNQiYCwJLWlUIpjz8I2CAgfwGgdQ3kQP36Qm0QKhHktCQUla5RfBHLsnwA7M2
 QN5IBAAA=
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4389; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9M5KGNUL9vwlasksx/eWxH2UHxU8J0vFX1+wbxwtEUA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSx658xb7vf06grM0qAloaXvz/hrcb0mpGfxHdu
 epVdHV6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksQAKCRArRkmdfjHURWiYEA
 Cyi6gnp7YSYhtyIAMfKnndt3CITPF2/KZsZp9k2o8Npc50HP+C3COPSR1PQMuPYN5qv99iNVgVk2jV
 +b5/tfraZgj/FEwguRiDgvTlapCQzSp8nSqKQUQOMBy9W1CfLr/0WJ+IDwAkbSh7cixYua6gxzwyS+
 7yW94h56RgX2IVNPtFkUcK6WS2J3pOPo2OyDwYyOkPZKH6sKOG/ylVjCNH7Df32gHohwQfUpJkghP0
 mTtv5YPiHeTpc1sN9wFYzU6oeZXXtyMgLq9sofGPKzzSKbErqhXs1FYdg86nLE8lcJsWVQuBW05xFX
 OED0xynO9dvCNkLZJfs4sGX4MMwKjIDCWyH1B7u9x0ecdQ4e1Y4qcdVVs4EMUfSlnN4smNUz1Bvsl2
 EV7LdcTCDuvn69H7PuU3uuz0Fp/to1r08K5WbvWQKgDxLWMVLo/zA/aQEe3CoA8njD7DWu80/U9hTE
 kEDp7JNjhW/GdXkftNE9DamK2naSaDxYVXyGYsomUCZXjH3HDWlnj3pMvb0hTFP9wG9nvBtDWz9UV9
 PCRy6yw/n6dcDkIQ2DtbAv6Nv6t3DYj2OMJyv5OJMB0bTyTVJjienFJwn1Vylk+u7WJvWMZrSQfRnr
 ylZ62ANrjmM9e9hcriyWlZi0fE+LEezrw5tE+Q/1cd7Cdav9hnYtQlyJjF7Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_081549_792020_A8553F2E 
X-CRM114-Status: GOOD (  17.06  )
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

The purpose of this series is to add the display support for the mt8365-evk.

This is the list of HWs / IPs support added:
- Connectors (HW):
  - HDMI
  - MIPI DSI (Mobile Industry Processor Interface Display Serial Interface)
- HDMI bridge (it66121)
- DSI pannel (startek,kd070fhfid015)
- SoC display blocks (IP):
  - OVL0 (Overlay)
  - RDMA0 (Data Path Read DMA)
  - Color0
  - CCorr0 (Color Correction)
  - AAL0 (Adaptive Ambient Light)
  - GAMMA0
  - Dither0
  - DSI0 (Display Serial Interface)
  - RDMA1 (Data Path Read DMA)
  - DPI0 (Display Parallel Interface)

The Mediatek DSI, DPI and DRM drivers are also improved.

The series is rebased on top of Angelo's series [1] to
use the OF graphs support.

Regards,
Alex

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v5:
- Patch merged, then removed from the series:
  - dt-bindings: display: mediatek: rdma: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: ovl: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: gamma: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: dpi: add compatible for MT8365
  - dt-bindings: display: mediatek: dsi: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: dither: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: color: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: ccorr: add compatible for MT8365 SoC
  - dt-bindings: display: mediatek: aal: add compatible for MT8365 SoC
- Enable STARTEK KD070FHFID015 panel in the defconfig.
- Rebase on top of 6.13-rc6.
- Link to v4: https://lore.kernel.org/all/20231023-display-support-v4-0-ed82eb168fb1@baylibre.com

Changes in v4:
- Patch merged, then removed from the series:
  - dt-bindings: display: mediatek: dpi: add power-domains property
  - dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC
  - clk: mediatek: mt8365-mm: fix DPI0 parent
- Remove mediatek,mt8365-dpi compatible from mtk_drm_drv.c because it
  use the mt8192's data. It's a miss.
- Add MT8365 OF graphs support, remove the hardcoded display path and
  rebase on top of Angelo's series [1].
- Link to v3: https://lore.kernel.org/r/20231023-display-support-v3-0-53388f3ed34b@baylibre.com

Changes in v3:
- Drop "drm/mediatek: add mt8365 dpi support" because it's the same
  config as mt8192 SoC
- Drop "dt-bindings: pwm: mediatek,pwm-disp: add power-domains property"
  because an equivalent patch has been merge already.
- Add DPI clock fix in a separate commit.
- Improve DTS(I) readability.
- Link to v2: https://lore.kernel.org/r/20231023-display-support-v2-0-33ce8864b227@baylibre.com

Changes in v2:
- s/binding/compatible/ in commit messages/titles.
- Improve commit messages as Conor suggest.
- pwm-disp: Set power domain property for MT8365. This one is optionnal
  and can be used for other SoC.
- Fix mediatek,dsi.yaml issue.
- Remove the extra clock in the DPI node/driver and fix the dpi clock
  parenting to be consistent with the DPI clock assignement.
- Link to v1: https://lore.kernel.org/r/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com

[1] https://lore.kernel.org/lkml/20240516081104.83458-1-angelogioacchino.delregno@collabora.com/

---
Alexandre Mergnat (5):
      drm/mediatek: dsi: Improves the DSI lane setup robustness
      arm64: defconfig: enable display connector support
      arm64: defconfig: enable STARTEK KD070FHFID015 panel
      arm64: dts: mediatek: add display blocks support for the MT8365 SoC
      arm64: dts: mediatek: add display support for mt8365-evk

Fabien Parent (2):
      dt-bindings: display: mediatek: dpi: add power-domains property
      drm/mediatek: add MT8365 SoC support

 .../bindings/display/mediatek/mediatek,dpi.yaml    |   5 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 236 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 336 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   8 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +
 6 files changed, 589 insertions(+)
---
base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
change-id: 20231023-display-support-c6418b30e419

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


