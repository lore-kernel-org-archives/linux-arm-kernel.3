Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF722E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIN3+R/E8p4a1D64k2o8LyTex7GHx1foOgh0nVt0L10=; b=VAIh1wHrqqf7z/arUcq9qLRRYe
	/k5/N8qAGQAzkjPPkdmVz+NTsZd8w7sgSYAsw4gREMIW/VTq8mQQiv0XAD72NloGMm9Frm9FwDo8l
	bBulU0onI+5mBMEqizSVMtCTh9lffT9xBwmUBuUkDo+yFRyjLCnbJjqrwQEirXQA9UsNFkav5R0gC
	HS6cfVrqIjM7P/VDuo5UnPd9RG5o09dij1aK7RVPELl7R90sSuhjD+M6BqBoxLrR4/h6ozDE0xruk
	ZNks4Y9JlRPdVwhfqd/sMb+VATPBraM6v1/DK/WJLnxzJ+ACoja0uSfISS5sINPYnIq3YHzBTWY1L
	Tr06b9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYop-00000009A88-1oUG;
	Wed, 08 Jan 2025 16:22:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYio-000000098Jk-0qht
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:15:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-436202dd730so121965945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 08:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736352953; x=1736957753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIN3+R/E8p4a1D64k2o8LyTex7GHx1foOgh0nVt0L10=;
        b=F370yTgelDYrFtdf7atjwN1yQL1pTsOI/nfQkPW62p5iT+/dl0/PWDPXrJLSnsAHzl
         3rLIeXO6fIku8NoFDUMc+sCX28ZelI84wb6r1Hy8eP4n1bVyKnZGCjpcm/Oj9lrX/B4M
         F4+1DtXHM/tNozGONZndRaV1aG1lxxZmknV3ylOg7USg1s5VwplfUg9ssf9UH5uNjytC
         RF5hfJyf/jgxPykvQaRKhPOI/HTKESQNNPrfKTPVNe9D6QNr3TRoeFvl+Z4lq5mYdajV
         s0DyoAFlo66sLeqNFqha7lXB6CbIoI9sZKmOkLoRffWouafGiP+2FqY2pKDfQbg3c7yQ
         wtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352953; x=1736957753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIN3+R/E8p4a1D64k2o8LyTex7GHx1foOgh0nVt0L10=;
        b=BfTu55SdHZ69eMC0GPTV1EVu22Ag+zlgiPQr+EUO11wO6EuY5LtC8tkLQAq4SjOGTq
         jCQOzXhTYObSn7W4KRBZTNNRkvJbMBq/6A6NCjNBQxlH6qEJUq/J2K3F8dbE7njLB+RE
         wePIasCJRwqEqQzH6v0/R7yQi5B+cEV5QBb2z3xenB6dJjuJHgq+vEhuNPQw/LIFskBn
         eSDx1mA6A/7Y1BDM0GBzDZm90dcih07v4s8yMBWBwxNy4EQmsQpgEmVq8WBjZBiX/yyk
         34hmQIOZRNn1z3xaCtMbHUhEi3oMXnVbPcUiLhLi5UAHFxPWQb57TvMaxmmQZaosehZX
         QZgg==
X-Forwarded-Encrypted: i=1; AJvYcCWj8rE6zdGwerrr7qjgi2o86MwR51/7S7ivZohnGYZiFcW/5NeMmeK77Q94TPBB8F0XJMwrxFg2XeA4OkUu79Kg@lists.infradead.org
X-Gm-Message-State: AOJu0YxE2V+IvHEJ0dZzAJ6jbvvm1JUIuFFaFmpo3MCg/24Jj19jZ5zm
	m5pFVbPShRT9Gnv5yJJVJ7nuGEJDF3BaN1BnrbkWAVBdArh67dYREi8MWF8A0eY=
X-Gm-Gg: ASbGncua4SHeVZ/9vL+Sa3JVtm1YQy3Ca2yB42pYuKg6HbRjojqLkuDTSLgW2sasfIg
	zf+luKJmb1bojXyZgAVzGTa28rtWRraG1Vt1zCAcEruqPoDK2mKoVJk3PEqCrtLRBESxSFXTAyr
	wm2TcHOxzc11eSUmP7hY59GY0zoWLFJUWAU9vUheB7U2atE7MLQflWIW+m7qxpEJaau6qlKLt21
	6j2PDc7gaUR5ZvUKRV5JkKdl+coUKJJ4Ko30028qNE5dtF/Yaw47eQwEUN9
X-Google-Smtp-Source: AGHT+IEosujTc3WZYpXQT40YfA80yrGf731lKmLgaCb0a9KQqnzVjj8O3xm82vCLoJawvZiZZYjb4w==
X-Received: by 2002:a05:600c:35c1:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-436e255ebb9mr33197665e9.0.1736352952087;
        Wed, 08 Jan 2025 08:15:52 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:15:51 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 08 Jan 2025 17:15:46 +0100
Subject: [PATCH v5 4/7] arm64: defconfig: enable display connector support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v5-4-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
In-Reply-To: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
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
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=687; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=z5v/37P5GAIdDLJPdviMCJVcm6R2ZLfW0o63bhtsj3k=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSyJp38Z4BVjerOBBWOKbJ1Lv9thI8YXcWeAwmO
 81RFWKWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksgAKCRArRkmdfjHURdS1EA
 CCAaOP4XUm/YJjD/FhPHZoz0GAp6Do0Jzcpqb39fjQf06aIytMLTKp7uIzjiLlvQrlpzW08KdneV3C
 Xge4Aw71aWaUII3nxuZC1I1ea/Ic3onBXuk2/vowGapquz6prNOTeqSv3dwJGtZRPT9RJlxPJjMWaR
 GUuFRfNEFtC9VU3wu695kAbau/zXGpWdQD3iKVxO6rQCVqOpShFNxSgc6yzkZd31K/gOWcS4aC/jeJ
 EyG5CDTrw75sHwlCLr1fwGiMqeTvqZP0OJF6pcg3vH6hoezfjKD40rSOHFq0N76BuFG/FVGTnNrYmM
 nvP4B04usjbOVqH7ObzhOTGthKNf9X44fgWBk6xJhtgPyAftkCbyWEXpJUtqGpXlIquxVJeNeplRJ7
 RQqcWC+RJFjLMNqeyqBuBaDd4MFftMEa3TnfetzylAG+RxJ8rVarswdVmWBzl3c7kCmaQO2VY9KhnE
 z83X7zmZDv0fZ8ZEKHbqvWbMLW4rOq14YJuu/MuUuCMd/op68zsHD/o2MFWXjGzqpc4EUb6ULU1roa
 3KBIvljq9+WIQ14j8pSzbZfcpBwTlxXuAqJLAn9E0lxYkE2fDo0dkt1Lu7uv+j5V8QMev18XJPk90C
 lbNvmR+AJE2HPeQJ5UnDntTJ5fkXjqedj7dc+LZ4Ti4kNTFXMAIapcsA/k4Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_081554_253853_0BFB574E 
X-CRM114-Status: GOOD (  10.01  )
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

Enable this feature for the i350-evk HDMI connector support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..b2db31e010ff 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -900,6 +900,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1


