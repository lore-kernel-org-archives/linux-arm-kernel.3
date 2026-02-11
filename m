Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733A4ECD6D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xsjpLU/+950UBXEs80H9fBqyvb2ncbcU+NKJQmJQO7M=; b=suQvkBW83/h7qv+Jk2FGZflkHh
	pOC61u6+rLnuaFxM2styrVmhqxH1T75tB+Gbs2Yx3IRPodgYZBEoR3ZO9PR1nTTjWQzh2/9k1kUgI
	33cCn46MeBGn4jAqn0imQN3+4f78jMc4CFkBu0TUSJALc7ghF3upimui8zhZQ8LJnbGPvICNwSBin
	oVvo4zT6UKBRWfG2IIzgkYYldCQS8Y+yWh2D/TLLZpDsF8DOMbiIo/BtzTMyJkpJPcdyXRjOUkfKK
	E/enh0DiBdOXFg0bgQyf79TbtUaf2oBJ/vOx30eT+ei06m6X/82+xNvACP9TQJdAeMXWTOTrwFjlh
	mXBqTDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXc-00000000xPk-1btp;
	Wed, 11 Feb 2026 19:06:24 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXZ-00000000xOc-3Ymi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:23 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so27817925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 11:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836779; x=1771441579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsjpLU/+950UBXEs80H9fBqyvb2ncbcU+NKJQmJQO7M=;
        b=Sz5A34hmnOWrDilCY7s69BJ+SB//eXsCPyV4YiQm7g5gbIc11gT8dqa0d1bjMdoy1/
         kIQAhLnvHMa8yWvu4uD4f91LllXXGIiiJpq+usBYwhE7xc5h/8aAko1O+KUsuCaAV2IG
         /uLoJk7SxfxwjMZTFX1Xd3hL2FZoxJTfHmdK+y85Qz4OiNdWvWjBDFP5n71V/UFLaOHw
         NfOcDk8leEvKyH5obAmY3Ck7oyOcO24rPpnGQV6847+IsDYDMlmCJGooJbfMWcKYhi5r
         uSDu5XWhr4VPCWDRwTIXeOQ81Xsb46SqwPHB80lO0xFdKYFzLAgRPdmJlGV+GqZvwjOh
         YKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836779; x=1771441579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsjpLU/+950UBXEs80H9fBqyvb2ncbcU+NKJQmJQO7M=;
        b=Dz7nMFe3z+P/V9v9LP0YRP3COAqjLbXIOHu4QFzp2YEJuzMQLj5bJGviSlNfYsXDH7
         T1lJAB8luYUqyMXFfdmgCUURHcxQTBAWkvG1pbZ1Btkam1+PhnW3Bv1KA47OfAr5153+
         g2Tu1Td04zhOwvu8baYmV60ECL25U74zcf9f5qhi2vsx2uDAqcSFOYnwwlqSTyM6NPmo
         F34mQF53CVcgpSymERUUeduur9x3oB3S+SHzgdUG5yFtolmzfZMkPRty7mCM4BmAi52k
         6iISsLU9ag13qHmSkmPGpvii5T0TJH/lJu7VODAWq8hbBi0O3xJ/dANZQKJOFB0HctSk
         d9ig==
X-Forwarded-Encrypted: i=1; AJvYcCVAaJf1aVDYDS43YUOninirWJGeJqe3xcd1AgAx73aQSb7m4E8HksEqwAejVWC/GzhNBP54g0T1bzyC2o087He7@lists.infradead.org
X-Gm-Message-State: AOJu0YzjE4ot+MYzCnyPwOJRSmkwDReTnnPw+MK+v1Et/2exh7IVkREs
	Rs9ilSYVVrmVpvHDp4pjG/renz5GJtHtcsNGwY/siEojBGVpt29MHWCj
X-Gm-Gg: AZuq6aL1SsKDE1KQ2FLKAs8sznr5udyvSeafC7lSsgQCQzm71rshcu5G7qfZXz8JxMu
	hnlXprNzrH08N2Cdgj8re0p5XH9skCaEjmKg9GpkEL/70xnSKWX3Fsgfd7tS+UGgao8fvcHycNM
	KBD1XZY9NTari4x59pM7AI76upFU03MOki3meE7DTnCkYhXS2Y3VCJg0MuDD21lRQ6U4BifvlMp
	83ivCpOXBGZR+J7b61dlFkFEL4RlriA7wQxvxgqwsX4MxrJa9r1YGAaeu6BqRl3FgBjt3PXarN4
	zowUUeBfLLQ2pMtp8VclF/xa/Tfd15OIlEAiV5DJ15jv9Yk5+s60mG4CJAB/keDKsrufjYjszui
	nUGUlyaT+94clrhH1+NQabobVWiqshPeEgMICXDxP+wMpLl1KxHLApMoNTveBC58IqBo8Tu0Oc3
	XGshULVJ9Htk/ja/f423I1KseXm7hm1A==
X-Received: by 2002:a05:600c:4e05:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-48365710e44mr2920265e9.22.1770836779068;
        Wed, 11 Feb 2026 11:06:19 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:18 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/7] arm64: dts: mt8167: Add the mmsys reset bit to reset DSI
Date: Wed, 11 Feb 2026 19:03:21 +0000
Message-ID: <cover.1770836189.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110621_918691_50B76C39 
X-CRM114-Status: GOOD (  13.25  )
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

This series adds support for the MMSYS reset registers for
mt8167 and uses them to trigger DSI reset during mtk-drm probe.
Registers and values are taken from the kernel source code
for the Lenovo Smart Clock and other mt8167 devices.

Luca Leonardo Scorcia (7):
  soc: mediatek: mtk-mmsys: Add resets for mt8167
  dt-bindings: mediatek: Add reset controller constants for mt8167
  watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
  dt-bindings: watchdog: Support MediaTek MT8167 wdt
  arm64: dts: mt8167: Add a specific watchdog dts node
  arm64: dts: mt8167: Add the mmsys reset bit to reset dsi
  arm64: dts: mt8167: Add additional mmsys reset bits

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 10 ++++
 drivers/soc/mediatek/mt8167-mmsys.h           |  3 ++
 drivers/soc/mediatek/mtk-mmsys.c              |  2 +
 drivers/watchdog/mtk_wdt.c                    |  6 +++
 include/dt-bindings/reset/mt8167-resets.h     | 47 +++++++++++++++++++
 6 files changed, 69 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt8167-resets.h

-- 
2.43.0


