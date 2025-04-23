Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A2BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 06:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=; b=Y+wwmhG0OQwen1yJ2StBK8sww9
	dXkGkWiECBdd9tK7apZJwHTQ0XCMO7ELE/ZDxdqepwVsIhUcYlNzNV7GNJALXl6l+oE6cniKT9ASD
	Hpp0tgZDoVDCEqLqLzktd8D4dvGqLp9lY4zp+jZbqqahsdj6bOpf92umIai4vVRkDto6DDoJoK0kS
	kYS1JvbyULW8hcvtd97xavUt1CadiSrROum++b5l4hQYRCEZj66LEr3WgUVPaJf3OLTdUQj0mi9p+
	dDSChj6zYAbzdst+qAXRO7uYTeZ7CKAYcNT9CaRLrwKWqitmFgqyS17JfqkHkX7Vm2PcfyGqxvIou
	zfxx8jRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TKK-00000009JTi-2YTG;
	Wed, 23 Apr 2025 06:11:20 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TCI-00000009HZh-0Nh1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 06:03:03 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso9455994a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 23:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388180; x=1745992980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=n+wl1Dz6ony1lLE/hnotz9tj5kru/vH/FZHTbuEcJR8ECdMQ5tEd7NxSy7sfGSbs7B
         J5hlPYqIK5PC+gJG+xxJ+BNfcNaHgOxQ/n7vYIiV3mwQ6GLSViQu3UTgFIeX5uTuvtIp
         nR43S0J3yRg7E3VvKB6jt0Q4VqSIy0oktEB58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388180; x=1745992980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=fCrg561QLkBCySmrvUxLl0iMeBg2vkExSKJN1TyhnOqy09qi5gGACdXwrmLLOXdZnp
         Ix07qLhQUDEHgJj2c7xflBc673cXhfUjZTgV+FJ9sol2WHmhKDhoSBL6opZhv8x3o8s1
         22UtwzDRCuYmIVr4RxfDm4jv9xMA/x80OdfDoWoIREczx5XNZmfa5SwGZ0qB/Gy7S0kG
         oRM5rKE1Hw+MA4w+jJMmkWt4Q8PL0lki4Pscj0D6FRXmbmiePJKFOi/RKuQYU9TNkA7u
         +H/KdISE9ZfHcNegSs4rdeRh95VCNraPAqA1nsJ363oUkxJ6Ui0qtyaXuAQQRiMKaGk0
         SmOw==
X-Forwarded-Encrypted: i=1; AJvYcCUH64eMHJVWGDv8uQt6it+KDLd79f/kSBw0+OSl2VtYqOCEuAs2Gk+by/PhPORpTFf3Gu191wt6d2vSzltv4rfp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+h3xtQFbmul2RQ4N5JEH/0M9RHxVij/lVihNf7ZsKmxdzmKTr
	Ld3+EpT78nKealh47jTiT6U4qS+auhAXCEdBb0iIL8M0f95svvnjCabVUZ4wrgM=
X-Gm-Gg: ASbGncvIqyOGe00sChHps6zVS9EdWA9YSL7QAhXzSf65cQ80QE8Q2WG5FF9m1UFNPZx
	CDKXh/ZLx5rSaoHCerIHDDH7B/baQtpq3UeFucnA0OTHFgJ5ncdKAqY4Na4rFZbp7CDCwfX6p4b
	XMqS6fnHkCIAH6Rk5RZ3b9psrTIjh2MgWWmhPAeWzDpai+qFakeQ8cGcWuzeYG+BvlYKTT/0h4R
	dbzzOv34CtM20ggnJ9GPAsXuB9VsqyTJ9WWoMVmL94bhk4JJDl1BBLQFc/imaA0kfpw2mp344aO
	1xTS6l3/6FiT/1cwEmIAhbxUddaKneOCnYPcwYxXCqtPT4r+bWbc6q6kZsaTzTQXzrpni8Jnvvc
	FzXNU
X-Google-Smtp-Source: AGHT+IG7e3Q3dj5KdFkcFK0kkZNsQ7n4rcyUNpetxzkW6OWRUCissFclqwW1aRy2urkwgRK2/F5w3w==
X-Received: by 2002:a17:907:c807:b0:acb:bbc4:3344 with SMTP id a640c23a62f3a-acbbbc43a1amr550390966b.22.1745388180459;
        Tue, 22 Apr 2025 23:03:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 03/18] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Wed, 23 Apr 2025 08:02:20 +0200
Message-ID: <20250423060241.95521-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_230302_137656_E45D8944 
X-CRM114-Status: GOOD (  11.67  )
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

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MP_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MP_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v6)

Changes in v6:
- Add 'Acked-by' tag of Krzysztof Kozlowski

Changes in v5:
- New

 include/dt-bindings/clock/imx8mp-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 7da4243984b2..3235d7de3b62 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MP_CLK_EXT4				7
 #define IMX8MP_AUDIO_PLL1_REF_SEL		8
 #define IMX8MP_AUDIO_PLL2_REF_SEL		9
-#define IMX8MP_VIDEO_PLL1_REF_SEL		10
+#define IMX8MP_VIDEO_PLL_REF_SEL		10
+#define IMX8MP_VIDEO_PLL1_REF_SEL		IMX8MP_VIDEO_PLL_REF_SEL
 #define IMX8MP_DRAM_PLL_REF_SEL			11
 #define IMX8MP_GPU_PLL_REF_SEL			12
 #define IMX8MP_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MP_SYS_PLL3_REF_SEL			17
 #define IMX8MP_AUDIO_PLL1			18
 #define IMX8MP_AUDIO_PLL2			19
-#define IMX8MP_VIDEO_PLL1			20
+#define IMX8MP_VIDEO_PLL			20
+#define IMX8MP_VIDEO_PLL1			IMX8MP_VIDEO_PLL
 #define IMX8MP_DRAM_PLL				21
 #define IMX8MP_GPU_PLL				22
 #define IMX8MP_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MP_SYS_PLL3				27
 #define IMX8MP_AUDIO_PLL1_BYPASS		28
 #define IMX8MP_AUDIO_PLL2_BYPASS		29
-#define IMX8MP_VIDEO_PLL1_BYPASS		30
+#define IMX8MP_VIDEO_PLL_BYPASS			30
+#define IMX8MP_VIDEO_PLL1_BYPASS		IMX8MP_VIDEO_PLL_BYPASS
 #define IMX8MP_DRAM_PLL_BYPASS			31
 #define IMX8MP_GPU_PLL_BYPASS			32
 #define IMX8MP_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MP_SYS_PLL3_BYPASS			37
 #define IMX8MP_AUDIO_PLL1_OUT			38
 #define IMX8MP_AUDIO_PLL2_OUT			39
-#define IMX8MP_VIDEO_PLL1_OUT			40
+#define IMX8MP_VIDEO_PLL_OUT			40
+#define IMX8MP_VIDEO_PLL1_OUT			IMX8MP_VIDEO_PLL_OUT
 #define IMX8MP_DRAM_PLL_OUT			41
 #define IMX8MP_GPU_PLL_OUT			42
 #define IMX8MP_VPU_PLL_OUT			43
-- 
2.43.0


